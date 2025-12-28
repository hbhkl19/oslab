#include "proc/cpu.h"
#include "mem/vmem.h"
#include "mem/pmem.h"
#include "mem/mmap.h"
#include "lib/string.h"
#include "lib/print.h"
#include "syscall/sysfunc.h"
#include "riscv.h"
#include "syscall/syscall.h"
#include "memlayout.h"
#include "dev/timer.h"
#include "fs/bitmap.h"
#include "fs/buf.h"
#include "fs/file.h"
#include "fs/dir.h"
#include "fs/inode.h"

#define ELF_MAXARGS 16

// 堆伸缩
// uint64 new_heap_top 新的堆顶 (如果是0代表查询, 返回旧的堆顶)
// 成功返回新的堆顶 失败返回-1
uint64 sys_brk()
{
    proc_t* p = myproc();
    uint64 new_break;
    
    // 从 a0 寄存器获取参数
    arg_uint64(0, &new_break);

    uint64 old_break = p->heap_top;

    if (new_break == 0) {
        // 用户只是查询当前堆顶
        
        //debug时使用
        printf("the brk is: 0x%lx\n", old_break);

        return old_break;
    }

    // 计算用户栈的底部，堆不能长到栈里
    uint64 ustack_bottom = TRAPFRAME - p->ustack_pages * PGSIZE;

    if (new_break > old_break) {
        // --- 增长堆 ---
        
        // 检查是否与栈碰撞
        // 我们检查向上取整的 new_break 是否会超过（或等于）栈底
        if (PG_ROUND_UP(new_break) > ustack_bottom) {
             return old_break; // 失败：与栈碰撞
        }
        
        uint32 len = new_break - old_break;
        uint64 result = uvm_heap_grow(p->pgtbl, old_break, len);
        
        // uvm_heap_grow 成功时返回 new_break, 失败时返回 old_break
        p->heap_top = result; 

        //debug时使用
        printf("the brk is: 0x%lx\n",result);

        return result;

    } else if (new_break < old_break) {
        // --- 缩小堆 ---
        
        // 堆不能缩小到初始代码/数据段以下
        // 在 proc_make_fisrt 中，heap_top 初始为 PGSIZE
        if (new_break < PGSIZE) {
            new_break = PGSIZE;
        }
        
        uint32 len = old_break - new_break;
        uint64 result = uvm_heap_ungrow(p->pgtbl, old_break, len);
        
        // uvm_heap_ungrow 总是成功并返回 new_break
        p->heap_top = result;

        //debug时使用
        printf("the brk is: 0x%lx\n",result);

        return result;
    }

    // new_break == old_break
    return old_break;
}

// 内存映射
// uint64 start 起始地址 (如果为0则由内核自主选择一个合适的起点, 通常是顺序扫描找到一个够大的空闲空间)
// uint32 len   范围(字节, 检查是否是page-aligned)
// 成功返回映射空间的起始地址, 失败返回-1
uint64 sys_mmap()
{
    proc_t* p = myproc();
    uint64 start;
    uint32 len;

    arg_uint64(0, &start);
    arg_uint32(1, &len);

    if(len == 0) return -1;

    // 简化实现: 忽略用户提供的地址, 直接从堆顶分配一段
    uint64 old = p->heap_top;
    uint64 need = PG_ROUND_UP(len);

    uint64 ustack_bottom = TRAPFRAME - p->ustack_pages * PGSIZE;
    if(old + need > ustack_bottom) {
        return -1;
    }

    uint64 new_top = uvm_heap_grow(p->pgtbl, old, need);
    if(new_top != old + need) {
        return -1;
    }
    p->heap_top = new_top;
    return old;
}

// 取消内存映射
// uint64 start 起始地址
// uint32 len   范围(字节, 检查是否是page-aligned)
// 成功返回0 失败返回-1
uint64 sys_munmap()
{
    // 简化: 未实现真正的 munmap, 直接返回成功
    return 0;
}


/*
//---------------------------目前不需要copyin,copyout,copyinstr-------------------------
// copyin 测试 (int 数组)
// uint64 addr
// uint32 len
// 返回 0
uint64 sys_copyin()
{
    proc_t* p = myproc();
    uint64 addr;
    uint32 len;

    arg_uint64(0, &addr);
    arg_uint32(1, &len);

    int tmp;
    for(int i = 0; i < len; i++) {
        uvm_copyin(p->pgtbl, (uint64)&tmp, addr + i * sizeof(int), sizeof(int));
        printf("get a number from user: %d\n", tmp);
    }

    return 0;
}

// copyout 测试 (int 数组)
// uint64 addr
// 返回数组元素数量
uint64 sys_copyout()
{
    int L[5] = {1, 2, 3, 4, 5};
    proc_t* p = myproc();
    uint64 addr;

    arg_uint64(0, &addr);
    uvm_copyout(p->pgtbl, addr, (uint64)L, sizeof(int) * 5);

    return 5;
}

// copyinstr测试
// uint64 addr
// 成功返回0
uint64 sys_copyinstr()
{
    char s[64];

    arg_str(0, s, 64);
    printf("get str from user: %s\n", s);

    return 0;
}
*/

// 打印字符
// uint64 addr
uint64 sys_print()
{
    char buf[128];
    arg_str(0, buf, sizeof(buf));
    printf("%s", buf);
    return 0;
}

// 分配/释放磁盘块 (测试接口)
uint64 sys_alloc_block()
{
    return bitmap_alloc_block();
}

uint64 sys_free_block()
{
    uint32 block_num;
    arg_uint32(0, &block_num);
    bitmap_free_block(block_num);
    return 0;
}

// 读取一个磁盘块到用户缓冲区, 返回对应的buf句柄
uint64 sys_read_block()
{
    uint32 block_num;
    uint64 dst;
    arg_uint32(0, &block_num);
    arg_uint64(1, &dst);

    buf_t* buf = buf_read(block_num);
    uint32 copy_len = (BLOCK_SIZE < 128) ? BLOCK_SIZE : 128;
    uvm_copyout(myproc()->pgtbl, dst, (uint64)buf->data, copy_len);
    return (uint64)buf;
}

// 将用户缓冲区的数据写入对应的buf
uint64 sys_write_block()
{
    uint64 handle, src;
    arg_uint64(0, &handle);
    arg_uint64(1, &src);
    buf_t* buf = (buf_t*)handle;
    if(buf == NULL)
        return -1;

    uint32 copy_len = (BLOCK_SIZE < 128) ? BLOCK_SIZE : 128;
    if(!sleeplock_holding(&buf->slk))
        sleeplock_acquire(&buf->slk);
    uvm_copyin(myproc()->pgtbl, (uint64)buf->data, src, copy_len);
    buf_write(buf);
    return 0;
}

// 释放buf
uint64 sys_release_block()
{
    uint64 handle;
    arg_uint64(0, &handle);
    buf_t* buf = (buf_t*)handle;
    if(buf == NULL)
        return -1;
    buf_release(buf);
    return 0;
}

// 打印buf_cache信息
uint64 sys_show_buf()
{
    buf_print();
    return 0;
}

// 进程复制
uint64 sys_fork()
{
    return proc_fork();
}

// 进程等待
// uint64 addr  子进程退出时的exit_state需要放到这里 
uint64 sys_wait()
{
    uint64 addr;
    arg_uint64(0, &addr);
    return proc_wait(addr);
}

// 进程退出
// int exit_state
uint64 sys_exit()
{
    uint32 exit_state;
    arg_uint32(0, &exit_state);
    proc_exit((int)exit_state);
    return 0;
}

extern timer_t sys_timer;

// 进程睡眠一段时间
// uint32 second 睡眠时间
// 成功返回0, 失败返回-1
uint64 sys_sleep()
{
    uint32 second;
    arg_uint32(0, &second);

    uint64 start = timer_get_ticks();
    while(timer_get_ticks() - start < second) {
        proc_yield();
    }
    return 0;
}

// 执行一个ELF文件
// char* path
// char** argv
// 成功返回argc 失败返回-1
uint64 sys_exec()
{
    // 简化的 ELF 解析，仅支持 64 位小端 ELF
    typedef struct {
        uint32 magic;
        uint8 ident[12];
        uint16 type;
        uint16 machine;
        uint32 version;
        uint64 entry;
        uint64 phoff;
        uint64 shoff;
        uint32 flags;
        uint16 ehsize;
        uint16 phentsize;
        uint16 phnum;
        uint16 shentsize;
        uint16 shnum;
        uint16 shstrndx;
    } elfhdr_t;

    typedef struct {
        uint32 type;
        uint32 flags;
        uint64 offset;
        uint64 vaddr;
        uint64 paddr;
        uint64 filesz;
        uint64 memsz;
        uint64 align;
    } proghdr_t;

    enum {
        ELF_MAGIC = 0x464C457F,
        PT_LOAD = 1,
        PF_X = 1,
        PF_W = 2,
        PF_R = 4,
    };

    char path[DIR_PATH_LEN];    // 文件路径
    char argbuf[ELF_MAXARGS][DIR_PATH_LEN];
    uint64 uargv;               // 用户态 argv 指针数组的地址
    arg_str(0, path, DIR_PATH_LEN);
    arg_uint64(1, &uargv);

    proc_t* p = myproc();
    file_t* f = NULL;
    pgtbl_t new_pgtbl = NULL;
    int argc = 0;

    // 1. 复制 argv 指针和内容到内核缓冲区
    for(; argc < ELF_MAXARGS; argc++) {
        uint64 uarg = 0;
        uvm_copyin(p->pgtbl, (uint64)&uarg, uargv + argc * sizeof(uint64), sizeof(uint64));
        if(uarg == 0) {
            break;
        }
        uvm_copyin_str(p->pgtbl, (uint64)argbuf[argc], uarg, DIR_PATH_LEN);
    }

    // 2. 打开 ELF 文件
    f = file_open(path, MODE_READ);
    if(f == NULL || f->type != FD_FILE) {
        if(f) file_close(f);
        return -1;
    }
    file_lseek(f, 0, 0);

    // 3. 读取 ELF 头
    elfhdr_t ehdr;
    if(file_read(f, sizeof(elfhdr_t), (uint64)&ehdr, false) != sizeof(elfhdr_t)) {
        file_close(f);
        return -1;
    }
    if(ehdr.magic != ELF_MAGIC || ehdr.phnum > 64) {
        file_close(f);
        return -1;
    }

    // 4. 创建新的用户页表 (包含 trampoline + trapframe 映射)
    new_pgtbl = proc_pgtbl_init((uint64)p->tf);
    if(new_pgtbl == NULL) {
        file_close(f);
        return -1;
    }

    uint64 maxva = PGSIZE;

    // 5. 加载各个程序段
    for(uint16 i = 0; i < ehdr.phnum; i++) {
        proghdr_t ph;
        uint64 phoff = ehdr.phoff + (uint64)i * sizeof(proghdr_t);
        if(file_lseek(f, phoff, 0) == (uint32)-1) goto exec_fail;
        if(file_read(f, sizeof(proghdr_t), (uint64)&ph, false) != sizeof(proghdr_t)) goto exec_fail;

        if(ph.type != PT_LOAD)
            continue;
        if(ph.memsz < ph.filesz) goto exec_fail;

        uint64 seg_start = PG_ROUND_DOWN(ph.vaddr);
        uint64 seg_end = PG_ROUND_UP(ph.vaddr + ph.memsz);
        int perm = PTE_U | PTE_R;
        if(ph.flags & PF_W) perm |= PTE_W;
        if(ph.flags & PF_X) perm |= PTE_X;

        // 映射并清零每个页面
        for(uint64 va = seg_start; va < seg_end; va += PGSIZE) {
            uint64 pa = (uint64)pmem_alloc(false);
            if(pa == 0) goto exec_fail;
            memset((void*)pa, 0, PGSIZE);
            vm_mappages(new_pgtbl, va, pa, PGSIZE, perm);
        }

        // 将文件内容拷贝到目标段
        if(file_lseek(f, ph.offset, 0) == (uint32)-1) goto exec_fail;
        uint64 copied = 0;
        while(copied < ph.filesz) {
            uint64 va = ph.vaddr + copied;
            pte_t* pte = vm_getpte(new_pgtbl, va, false);
            if(pte == NULL || (*pte & PTE_V) == 0) goto exec_fail;
            uint64 pa = PTE_TO_PA(*pte);
            uint32 page_off = va & (PGSIZE - 1);
            uint32 n = PGSIZE - page_off;
            if(n > ph.filesz - copied)
                n = ph.filesz - copied;
            if(file_read(f, n, pa + page_off, false) != n)
                goto exec_fail;
            copied += n;
        }

        if(ph.vaddr + ph.memsz > maxva)
            maxva = ph.vaddr + ph.memsz;
    }

    // 6. 分配并设置用户栈 (1 页)
    uint64 ustack_pa = (uint64)pmem_alloc(false);
    if(ustack_pa == 0) goto exec_fail;
    memset((void*)ustack_pa, 0, PGSIZE);
    vm_mappages(new_pgtbl, TRAPFRAME - PGSIZE, ustack_pa, PGSIZE, PTE_U | PTE_R | PTE_W);
    uint64 sp = TRAPFRAME;
    uint64 ustack_bottom = TRAPFRAME - PGSIZE;

    // 7. 将 argv 拷贝到新栈
    uint64 stack_argv[ELF_MAXARGS + 1];
    for(int i = argc - 1; i >= 0; i--) {
        int len = strlen(argbuf[i]) + 1;
        sp -= len;
        if(sp < ustack_bottom) goto exec_fail;
        uvm_copyout(new_pgtbl, sp, (uint64)argbuf[i], len);
        stack_argv[i] = sp;
    }
    stack_argv[argc] = 0;

    // 对齐栈指针到 16 字节
    sp &= ~0xF;
    uint64 argv_ptr = sp - (argc + 1) * sizeof(uint64);
    if(argv_ptr < ustack_bottom) goto exec_fail;
    uvm_copyout(new_pgtbl, argv_ptr, (uint64)stack_argv, (argc + 1) * sizeof(uint64));
    sp = argv_ptr;

    // 8. 更新进程信息
    uint64 new_heap_top = PG_ROUND_UP(maxva);
    if(new_heap_top < PGSIZE)
        new_heap_top = PGSIZE;
    if(new_heap_top >= ustack_bottom)
        goto exec_fail;

    pgtbl_t old = p->pgtbl;
    p->pgtbl = new_pgtbl;
    p->ustack_pages = 1;
    p->heap_top = new_heap_top;

    // 设置用户态入口和栈寄存器
    p->tf->epc = ehdr.entry;
    p->tf->sp = sp;
    p->tf->a0 = argc;
    p->tf->a1 = argv_ptr;

    // 销毁旧页表，关闭文件
    uvm_destroy_pgtbl(old);
    file_close(f);
    sfence_vma();
    return argc;

exec_fail:
    if(new_pgtbl)
        uvm_destroy_pgtbl(new_pgtbl);
    if(f)
        file_close(f);
    return -1;
}
