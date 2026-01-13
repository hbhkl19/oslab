# kernel.ld 将_entry作为整个OS的起点放置到内核基地址（当前 0x80200000）
# 注意: 此时是M-mode

.section .text
.globl _entry
_entry:
        # 保存 OpenSBI 传入的 hartid (a0)
        mv s0, a0

        # ===== 第一步: 只在 hart 0 上清零 BSS 段 =====
        mv a0, s0
        bnez a0, skip_bss_clear # 如果不是 hart 0, 跳过清零

        # 清零 BSS 段
        la t0, __bss_start      # t0 = BSS 起始地址
        la t1, __bss_end        # t1 = BSS 结束地址

bss_clear_loop:
        bge t0, t1, bss_done    # 如果 t0 >= t1, 清零完成
        sd zero, 0(t0)          # 将 0 写入当前地址
        addi t0, t0, 8          # 移动到下一个 8 字节
        j bss_clear_loop

bss_done:
skip_bss_clear:

        # ===== 第二步: 设置栈指针 (所有 hart 都执行) =====
        # CPU_stack 定义于start.c中
        # sp = CPU_stack + ((hartid + 1) * 4096)
        # 将sp置于当前CPU的内核栈的栈顶
        la sp, CPU_stack
        li a0, 4096
        mv a1, s0
        addi a1, a1, 1
        mul a0, a0, a1
        add sp, sp, a0

        # ===== 第三步: 跳转到 start =====
        # 将 OpenSBI 传入的 hartid 写入 tp 供后续使用
        mv tp, s0

        call start

spin:
        j spin
