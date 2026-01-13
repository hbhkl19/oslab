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
#include "fs/file.h"
#include "fs/fat32.h"
#include "fs/tmpfs.h"
#include "dev/timer.h"
#include "fs/bitmap.h"
#include "fs/buf.h"
#include "fs/file.h"
#include "fs/dir.h"
#include "fs/inode.h"

#define ELF_MAXARGS 16
#define O_CREATE    0x40
#define O_DIRECTORY 0x200000

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
        //printf("the brk is: 0x%lx\n", old_break);

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
        //printf("the brk is: 0x%lx\n",result);

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
        //printf("the brk is: 0x%lx\n",result);

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
    uint64 start, len64, offset;
    uint32 prot, flags;
    int fd;

    arg_uint64(0, &start);
    arg_uint64(1, &len64);
    arg_uint32(2, &prot);
    arg_uint32(3, &flags);
    arg_uint32(4, (uint32*)&fd);
    arg_uint64(5, &offset);

    (void)start;
    (void)prot;
    (void)flags;

    if(len64 == 0) return (uint64)-1;

    // 简化实现: 忽略用户提供的地址, 直接从堆顶分配一段
    uint64 old = p->heap_top;
    uint64 need = PG_ROUND_UP(len64);
    if(need > 0xffffffffu) return (uint64)-1;
    uint32 grow_len = (uint32)need;

    uint64 ustack_bottom = TRAPFRAME - p->ustack_pages * PGSIZE;
    if(old + need > ustack_bottom) {
        return (uint64)-1;
    }

    uint64 new_top = uvm_heap_grow(p->pgtbl, old, grow_len);
    if(new_top != old + need) {
        return (uint64)-1;
    }
    p->heap_top = new_top;

    // 如果提供了 fd，将文件内容复制到映射区域
    if(fd >= 0 && fd < FILE_PER_PROC) {
        file_t* f = p->filelist[fd];
        if(f && f->readable) {
            uint32 saved_off = f->offset;
            uint32 off32 = (offset > 0xffffffffu) ? 0xffffffffu : (uint32)offset;
            uint32 read_len = (len64 > 0xffffffffu) ? 0xffffffffu : (uint32)len64;
            f->offset = off32;
            file_read(f, read_len, old, true);
            f->offset = saved_off;
        }
    }

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

    DEBUG_LOG("[exec] start path=%s uargv=0x%lx\n", path, uargv);

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
    DEBUG_LOG("[exec] argc=%d\n", argc);

    // 2. 打开 ELF 文件 (优先尝试 FAT32)
    // 如果路径不以 '/' 开头，添加 '/' 前缀尝试 FAT32
    char fat32_path[DIR_PATH_LEN + 1];
    if(path[0] != '/') {
        fat32_path[0] = '/';
        strncpy(fat32_path + 1, path, DIR_PATH_LEN - 1);
        fat32_path[DIR_PATH_LEN] = '\0';
    } else {
        strncpy(fat32_path, path, DIR_PATH_LEN);
        fat32_path[DIR_PATH_LEN] = '\0';
    }
    
    DEBUG_LOG("[exec] trying fat32 path=%s\n", fat32_path);
    f = file_open_fat32(fat32_path, MODE_READ);
    if(f != NULL && f->type == FD_FAT32) {
        // 成功从 FAT32 打开
        DEBUG_LOG("[exec] opened from FAT32\n");
    } else {
        // FAT32 打开失败，尝试原生文件系统
        DEBUG_LOG("[exec] FAT32 failed, trying native fs\n");
        if(f) file_close(f);
        f = file_open(path, MODE_READ);
        if(f == NULL || f->type != FD_FILE) {
            if(f) file_close(f);
            DEBUG_LOG("[exec] failed to open file\n");
            return -1;
        }
    }
    file_lseek(f, 0, 0);

    // 3. 读取 ELF 头
    DEBUG_LOG("[exec] reading ELF header\n");
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

    // 7. 将 argv 字符串拷贝到新栈
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
    
    // 8. 按照 RISC-V ABI，栈布局应为: argc, argv[0], argv[1], ..., argv[argc]=0
    // crt.S 中 _start 会把 sp 传给 __start_main，期望 sp[0]=argc, sp[1]=argv[0], ...
    uint64 stack_frame_size = (1 + argc + 1) * sizeof(uint64); // argc + argv数组
    // 确保栈帧大小是 16 字节对齐的
    stack_frame_size = (stack_frame_size + 15) & ~0xF;
    sp -= stack_frame_size;
    if(sp < ustack_bottom) goto exec_fail;
    
    // 写入 argc
    uvm_copyout(new_pgtbl, sp, (uint64)&argc, sizeof(uint64));
    // 写入 argv 指针数组
    uvm_copyout(new_pgtbl, sp + sizeof(uint64), (uint64)stack_argv, (argc + 1) * sizeof(uint64));
    
    uint64 argv_ptr = sp + sizeof(uint64);

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

    DEBUG_LOG("[exec] path=%s entry=0x%lx sp=0x%lx argc=%d argv_ptr=0x%lx heap_top=0x%lx\n", 
              path, ehdr.entry, sp, argc, argv_ptr, new_heap_top);

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

// ============ 新增系统调用实现 (Linux/RISC-V 标准) ============

// SYS_getpid (172) - 获取当前进程PID
uint64 sys_getpid()
{
    return myproc()->pid;
}

// SYS_getppid (173) - 获取父进程PID
uint64 sys_getppid()
{
    proc_t* p = myproc();
    if(p->parent)
        return p->parent->pid;
    return 0;
}

// SYS_gettid (178) - 获取线程ID (简化: 返回pid)
uint64 sys_gettid()
{
    return myproc()->pid;
}

// SYS_sched_yield (124) - 让出CPU
uint64 sys_sched_yield()
{
    proc_yield();
    return 0;
}

// SYS_set_tid_address (96) - 设置tid地址 (简化实现)
uint64 sys_set_tid_address()
{
    // 简化: 忽略参数，返回当前pid
    return myproc()->pid;
}

// SYS_gettimeofday (169) - 获取时间
uint64 sys_gettimeofday()
{
    uint64 tv_addr, tz_addr;
    arg_uint64(0, &tv_addr);
    arg_uint64(1, &tz_addr);
    
    uint64 ticks = timer_get_ticks();
    struct {
        uint64 tv_sec;
        uint64 tv_usec;
    } tv;
    // 假设 10 ticks = 1秒 (根据实际timer配置调整)
    tv.tv_sec = ticks / 10;
    tv.tv_usec = (ticks % 10) * 100000;
    
    if(tv_addr)
        uvm_copyout(myproc()->pgtbl, tv_addr, (uint64)&tv, sizeof(tv));
    return 0;
}

// SYS_nanosleep (101) - 睡眠
uint64 sys_nanosleep()
{
    uint64 req_addr, rem_addr;
    arg_uint64(0, &req_addr);
    arg_uint64(1, &rem_addr);
    
    struct {
        uint64 tv_sec;
        uint64 tv_nsec;
    } req;
    uvm_copyin(myproc()->pgtbl, (uint64)&req, req_addr, sizeof(req));
    
    // 简化：只处理秒级，每秒约10个tick
    uint64 ticks = req.tv_sec * 10;
    if(req.tv_nsec > 0) ticks += 1;
    
    // 使用进程自己作为 sleep_space，由时钟中断唤醒
    proc_t* p = myproc();
    uint64 start = timer_get_ticks();
    uint64 target = start + ticks;
    
    spinlock_acquire(&p->lk);
    while(timer_get_ticks() < target) {
        p->sleep_until = target;  // 设置唤醒时间
        p->state = SLEEPING;
        p->sleep_space = &p->sleep_until;  // 睡眠在 sleep_until 上
        proc_sched();
        p->sleep_space = NULL;
    }
    p->sleep_until = 0;
    spinlock_release(&p->lk);
    return 0;
}

// SYS_times (153) - 获取进程时间
uint64 sys_times()
{
    uint64 tms_addr;
    arg_uint64(0, &tms_addr);
    
    struct {
        uint64 tms_utime;
        uint64 tms_stime;
        uint64 tms_cutime;
        uint64 tms_cstime;
    } tms = {0, 0, 0, 0};
    
    if(tms_addr)
        uvm_copyout(myproc()->pgtbl, tms_addr, (uint64)&tms, sizeof(tms));
    return timer_get_ticks();
}

// SYS_uname (160) - 获取系统信息
uint64 sys_uname()
{
    uint64 addr;
    arg_uint64(0, &addr);
    
    struct {
        char sysname[65];
        char nodename[65];
        char release[65];
        char version[65];
        char machine[65];
        char domainname[65];
    } uts;
    
    memset(&uts, 0, sizeof(uts));
    safestrcpy(uts.sysname, "Linux", 65);
    safestrcpy(uts.nodename, "oslab", 65);
    safestrcpy(uts.release, "5.10.0", 65);
    safestrcpy(uts.version, "#1 SMP", 65);
    safestrcpy(uts.machine, "riscv64", 65);
    safestrcpy(uts.domainname, "(none)", 65);
    
    uvm_copyout(myproc()->pgtbl, addr, (uint64)&uts, sizeof(uts));
    return 0;
}

// SYS_getcwd (17) - 获取当前工作目录
uint64 sys_getcwd()
{
    uint64 buf;
    uint32 size;
    arg_uint64(0, &buf);
    arg_uint32(1, &size);
    
    if(size == 0) return 0;

    proc_t* p = myproc();
    const char* path = "/";

    // 如果正在使用 tmpfs 的 cwd，就从 tmpfs 取路径；否则退回根目录
    if(p && p->cwd == NULL) {
        path = tmpfs_getcwd();
    }

    char tmp[DIR_PATH_LEN];
    strncpy(tmp, path, DIR_PATH_LEN);
    tmp[DIR_PATH_LEN - 1] = '\0';

    uint32 len = strlen(tmp) + 1; // 包含结尾 \0
    if(len > size) {
        len = size;
        tmp[size - 1] = '\0';
    }

    uvm_copyout(p->pgtbl, buf, (uint64)tmp, len);
    return buf;
}

// SYS_clone (220) - 创建子进程
// Linux clone: (flags, stack, ptid, tls, ctid)
uint64 sys_clone()
{
    uint64 flags, stack, ptid, tls, ctid;
    arg_uint64(0, &flags);
    arg_uint64(1, &stack);
    arg_uint64(2, &ptid);
    arg_uint64(3, &tls);
    arg_uint64(4, &ctid);
    
    // 调用 proc_clone 创建子进程（带自定义栈）
    return proc_clone(stack);
}

// SYS_wait4 (260) - 等待子进程
// (pid, wstatus, options, rusage)
uint64 sys_wait4()
{
    int pid;
    uint64 wstatus_addr;
    int options;
    
    arg_uint32(0, (uint32*)&pid);
    arg_uint64(1, &wstatus_addr);
    arg_uint32(2, (uint32*)&options);
    // arg3 rusage 忽略
    
    // pid=-1: 等待任意子进程
    return proc_wait(wstatus_addr);
}

// SYS_openat (56) - 打开文件
// (dirfd, path, flags, mode)
uint64 sys_openat()
{
    int dirfd;
    char path[DIR_PATH_LEN];
    uint32 flags, mode;
    
    arg_uint32(0, (uint32*)&dirfd);
    arg_str(1, path, DIR_PATH_LEN);
    arg_uint32(2, &flags);
    arg_uint32(3, &mode);
    
    // dirfd = AT_FDCWD(-100) 表示当前目录
    // 简化：忽略 dirfd，直接处理 path
    
    file_t* file = NULL;
    
    // 特殊处理 "." 打开当前目录 (FAT32 根目录)
    if(path[0] == '.' && path[1] == '\0') {
        file = file_alloc();
        if(file) {
            file->type = FD_FAT32;
            file->readable = true;
            file->writable = false;
            file->offset = 0;
            file->ip = NULL;
            file->fat32_cluster = fat32_get_root_cluster();
            file->fat32_size = 0;
            int fd = fd_alloc(file);
            if(fd == -1) file_close(file);
            return fd;
        }
    }
    
    // 创建场景：始终在 tmpfs 中处理
    if(flags & O_CREATE) {
        file = tmpfs_open(path, flags);
        if(file != NULL) {
            int type = tmpfs_get_type(file->tmpfs_idx);
            if((flags & O_DIRECTORY) && type != TMPFS_TYPE_DIR) {
                file_close(file);
                return -1;
            }
            if(type == TMPFS_TYPE_DIR) {
                file->writable = false;
            }
            int fd = fd_alloc(file);
            if(fd == -1) file_close(file);
            return fd;
        }
    }
    
    uint32 open_mode = 0;
    if(flags & O_CREATE) open_mode |= MODE_CREATE;
    // O_RDONLY=0, O_WRONLY=1, O_RDWR=2
    if((flags & 3) != 1) open_mode |= MODE_READ;  // 不是 O_WRONLY
    if((flags & 3) != 0) open_mode |= MODE_WRITE; // 不是 O_RDONLY

    // 非创建场景优先尝试 FAT32（SD 卡根目录及测试文件）
    file = file_open_fat32(path, open_mode);
    if(file == NULL) {
        // FAT32 失败后，如果 tmpfs 中已有同名条目则尝试 tmpfs
        if(tmpfs_exists(path)) {
            file = tmpfs_open(path, flags);
            if(file != NULL) {
                int type = tmpfs_get_type(file->tmpfs_idx);
                if((flags & O_DIRECTORY) && type != TMPFS_TYPE_DIR) {
                    file_close(file);
                    return -1;
                }
                if(type == TMPFS_TYPE_DIR) {
                    file->writable = false;
                }
            }
        }
    }
    if(file == NULL) {
        // FAT32 和 tmpfs 都失败，回退原文件系统
        file = file_open(path, open_mode);
    }
    if(file == NULL) return -1;
    
    int fd = fd_alloc(file);
    if(fd == -1) file_close(file);
    return fd;
}

// SYS_dup3 (24) - 带flags的dup
uint64 sys_dup3()
{
    int oldfd, newfd;
    uint32 flags;
    
    arg_uint32(0, (uint32*)&oldfd);
    arg_uint32(1, (uint32*)&newfd);
    arg_uint32(2, &flags);
    
    // 简化：忽略flags
    proc_t* p = myproc();
    if(oldfd < 0 || oldfd >= FILE_PER_PROC || p->filelist[oldfd] == NULL)
        return -1;
    if(newfd < 0 || newfd >= FILE_PER_PROC)
        return -1;
    
    if(p->filelist[newfd])
        file_close(p->filelist[newfd]);
    
    p->filelist[newfd] = file_dup(p->filelist[oldfd]);
    return newfd;
}

// SYS_mkdirat (34) - 创建目录
uint64 sys_mkdirat()
{
    int dirfd;
    char path[DIR_PATH_LEN];
    uint32 mode;
    
    arg_uint32(0, (uint32*)&dirfd);
    arg_str(1, path, DIR_PATH_LEN);
    arg_uint32(2, &mode);
    
    // 优先尝试在 tmpfs 中创建目录
    int idx = tmpfs_create(path, TMPFS_TYPE_DIR);
    if(idx >= 0) return 0;
    
    // 回退到原始文件系统
    inode_t* ip = path_create_inode(path, FT_DIR, 0, 0);
    if(ip == NULL) return -1;
    inode_unlock_free(ip);
    return 0;
}

// SYS_unlinkat (35) - 删除文件
uint64 sys_unlinkat()
{
    int dirfd;
    char path[DIR_PATH_LEN];
    uint32 flags;
    
    arg_uint32(0, (uint32*)&dirfd);
    arg_str(1, path, DIR_PATH_LEN);
    arg_uint32(2, &flags);
    
    // 优先尝试从 tmpfs 删除
    if(tmpfs_unlink(path) == 0) return 0;
    
    // 回退到原始文件系统
    return path_unlink(path);
}

// SYS_linkat (37) - 创建硬链接
uint64 sys_linkat()
{
    int olddirfd, newdirfd;
    char oldpath[DIR_PATH_LEN], newpath[DIR_PATH_LEN];
    uint32 flags;
    
    arg_uint32(0, (uint32*)&olddirfd);
    arg_str(1, oldpath, DIR_PATH_LEN);
    arg_uint32(2, (uint32*)&newdirfd);
    arg_str(3, newpath, DIR_PATH_LEN);
    arg_uint32(4, &flags);
    
    return path_link(oldpath, newpath);
}

// SYS_getdents64 (61) - 读目录项
// Linux dirent64 结构:
// struct linux_dirent64 {
//     uint64 d_ino;      // inode 号
//     int64  d_off;      // 到下一个 dirent 的偏移
//     uint16 d_reclen;   // 本 dirent 的长度
//     uint8  d_type;     // 文件类型
//     char   d_name[];   // 文件名
// };
uint64 sys_getdents64()
{
    int fd;
    uint64 buf;
    uint32 count;
    
    arg_uint32(0, (uint32*)&fd);
    arg_uint64(1, &buf);
    arg_uint32(2, &count);
    
    proc_t* p = myproc();
    if(fd < 0 || fd >= FILE_PER_PROC || p->filelist[fd] == NULL)
        return -1;
    
    file_t* f = p->filelist[fd];
    
    // 目前只支持 FAT32 目录
    if(f->type != FD_FAT32) {
        // 简化：非 FAT32 返回 0 表示目录读取完毕
        return 0;
    }
    
    // FAT32 目录遍历
    uint32 dir_cluster = f->fat32_cluster;
    if(dir_cluster == 0) {
        dir_cluster = fat32_get_root_cluster();
    }
    
    uint32 offset = f->offset;  // 使用 file offset 记录遍历位置
    uint32 total = 0;
    
    // 临时缓冲区
    static char name[256];
    static uint8 dirent_buf[512];
    
    while(total + 32 < count) {
        uint32 fsize;
        uint8 ftype;
        uint32 next_off;
        
        int ret = fat32_readdir(dir_cluster, offset, name, &fsize, &ftype, &next_off);
        if(ret < 0) {
            break;  // 目录结束或出错
        }
        
        // 计算 dirent64 大小 (需要 8 字节对齐)
        uint32 name_len = strlen(name) + 1;
        uint32 reclen = 8 + 8 + 2 + 1 + name_len;  // d_ino + d_off + d_reclen + d_type + d_name
        reclen = (reclen + 7) & ~7;  // 8 字节对齐
        
        if(total + reclen > count) {
            break;  // 缓冲区不够
        }
        
        // 构建 dirent64
        memset(dirent_buf, 0, reclen);
        uint64* d_ino = (uint64*)dirent_buf;
        int64* d_off = (int64*)(dirent_buf + 8);
        uint16* d_reclen = (uint16*)(dirent_buf + 16);
        uint8* d_type = (uint8*)(dirent_buf + 18);
        char* d_name = (char*)(dirent_buf + 19);
        
        *d_ino = next_off;  // 使用偏移作为 inode 号
        *d_off = next_off;
        *d_reclen = reclen;
        *d_type = ftype;
        strncpy(d_name, name, name_len + 1);
        
        // 复制到用户空间
        uvm_copyout(p->pgtbl, buf + total, (uint64)dirent_buf, reclen);
        
        total += reclen;
        offset = next_off;
    }
    
    f->offset = offset;  // 更新遍历位置
    return total;
}

// 简单管道实现
#define PIPE_BUF_SIZE 512

typedef struct pipe {
    spinlock_t lk;
    char data[PIPE_BUF_SIZE];
    uint32 nread;     // 已读取字节数
    uint32 nwrite;    // 已写入字节数
    int readopen;     // 读端是否打开
    int writeopen;    // 写端是否打开
} pipe_t;

static pipe_t pipes[8];  // 最多支持 8 个管道
static int pipe_used[8] = {0};

static pipe_t* pipe_alloc(void)
{
    for(int i = 0; i < 8; i++) {
        if(!pipe_used[i]) {
            pipe_used[i] = 1;
            pipe_t* p = &pipes[i];
            memset(p, 0, sizeof(pipe_t));
            spinlock_init(&p->lk, "pipe");
            p->readopen = 1;
            p->writeopen = 1;
            return p;
        }
    }
    return NULL;
}

static void pipe_free(pipe_t* p)
{
    for(int i = 0; i < 8; i++) {
        if(&pipes[i] == p) {
            pipe_used[i] = 0;
            return;
        }
    }
}

// 管道读取
uint32 pipe_read(pipe_t* pi, uint64 dst, uint32 n, bool user)
{
    proc_t* p = myproc();
    spinlock_acquire(&pi->lk);
    
    // 等待数据或写端关闭
    while(pi->nread == pi->nwrite && pi->writeopen) {
        spinlock_release(&pi->lk);
        proc_yield();
        spinlock_acquire(&pi->lk);
    }
    
    uint32 i = 0;
    while(i < n && pi->nread < pi->nwrite) {
        char ch = pi->data[pi->nread % PIPE_BUF_SIZE];
        pi->nread++;
        if(user) {
            uvm_copyout(p->pgtbl, dst + i, (uint64)&ch, 1);
        } else {
            *(char*)(dst + i) = ch;
        }
        i++;
    }
    
    spinlock_release(&pi->lk);
    return i;
}

// 管道写入
uint32 pipe_write(pipe_t* pi, uint64 src, uint32 n, bool user)
{
    proc_t* p = myproc();
    spinlock_acquire(&pi->lk);
    
    for(uint32 i = 0; i < n; i++) {
        // 等待缓冲区有空间
        while(pi->nwrite == pi->nread + PIPE_BUF_SIZE) {
            if(!pi->readopen) {
                spinlock_release(&pi->lk);
                return -1;  // 读端已关闭
            }
            spinlock_release(&pi->lk);
            proc_yield();
            spinlock_acquire(&pi->lk);
        }
        
        char ch;
        if(user) {
            uvm_copyin(p->pgtbl, (uint64)&ch, src + i, 1);
        } else {
            ch = *(char*)(src + i);
        }
        pi->data[pi->nwrite % PIPE_BUF_SIZE] = ch;
        pi->nwrite++;
    }
    
    spinlock_release(&pi->lk);
    return n;
}

// 关闭管道端
void pipe_close(pipe_t* pi, int writable)
{
    spinlock_acquire(&pi->lk);
    if(writable) {
        pi->writeopen = 0;
    } else {
        pi->readopen = 0;
    }
    int should_free = (!pi->readopen && !pi->writeopen);
    spinlock_release(&pi->lk);
    
    if(should_free) {
        pipe_free(pi);
    }
}

// SYS_pipe2 (59) - 创建管道
uint64 sys_pipe2()
{
    uint64 pipefd_addr;
    uint32 flags;
    
    arg_uint64(0, &pipefd_addr);
    arg_uint32(1, &flags);
    
    pipe_t* pi = pipe_alloc();
    if(pi == NULL) return -1;
    
    file_t* rf = file_alloc();
    file_t* wf = file_alloc();
    if(rf == NULL || wf == NULL) {
        if(rf) file_close(rf);
        if(wf) file_close(wf);
        pipe_free(pi);
        return -1;
    }
    
    rf->type = FD_PIPE;
    rf->readable = true;
    rf->writable = false;
    rf->pipe = pi;
    
    wf->type = FD_PIPE;
    wf->readable = false;
    wf->writable = true;
    wf->pipe = pi;
    
    int fd0 = fd_alloc(rf);
    int fd1 = fd_alloc(wf);
    if(fd0 < 0 || fd1 < 0) {
        if(fd0 >= 0) myproc()->filelist[fd0] = NULL;
        if(fd1 >= 0) myproc()->filelist[fd1] = NULL;
        file_close(rf);
        file_close(wf);
        pipe_free(pi);
        return -1;
    }
    
    // 复制 fd 到用户空间: fd[0]=读端, fd[1]=写端
    int fds[2] = {fd0, fd1};
    uvm_copyout(myproc()->pgtbl, pipefd_addr, (uint64)fds, sizeof(fds));
    
    return 0;
}

// SYS_mount (40) - 挂载文件系统
uint64 sys_mount()
{
    // 简化: 返回成功
    return 0;
}

// SYS_umount2 (39) - 卸载文件系统
uint64 sys_umount2()
{
    // 简化: 返回成功
    return 0;
}

// SYS_fcntl (25) - 文件控制
uint64 sys_fcntl()
{
    int fd;
    uint32 cmd;
    arg_uint32(0, (uint32*)&fd);
    arg_uint32(1, &cmd);
    
    // 简化: 大部分返回0或-1
    // F_DUPFD=0, F_GETFD=1, F_SETFD=2, F_GETFL=3, F_SETFL=4
    if(cmd == 1 || cmd == 3) return 0;  // F_GETFD, F_GETFL
    if(cmd == 2 || cmd == 4) return 0;  // F_SETFD, F_SETFL
    return -1;
}

// SYS_ioctl (29) - 设备控制
uint64 sys_ioctl()
{
    // 简化: 返回0
    return 0;
}

// SYS_mprotect (226) - 修改内存保护
uint64 sys_mprotect()
{
    // 简化: 返回成功
    return 0;
}
