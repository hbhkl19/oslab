target remote :26000

# 在函数入口设置断点
b trap_user_return
c

printf "\n========== Symbol Addresses ==========\n"
printf "trampoline     = 0x%lx\n", &trampoline
printf "user_vector    = 0x%lx\n", &user_vector  
printf "user_return    = 0x%lx\n", &user_return
printf "TRAMPOLINE     = 0x%lx\n", 0x3ffffff000
printf "Expected offset = 0x%lx\n", ((uint64)&user_return - (uint64)&trampoline)

# 检查物理内存内容
printf "\n========== Physical Memory Content ==========\n"
printf "At trampoline PA (0x%lx):\n", &trampoline
x/4i &trampoline

printf "\nAt user_return PA (0x%lx):\n", &user_return
x/4i &user_return

# 在函数调用行设置断点（第135行）
printf "\n========== Setting breakpoint at function call ==========\n"
b trap_user.c:135
c

# 现在我们在函数调用这一行，打印局部变量
printf "\n========== Local Variables ==========\n"
info locals

# 如果能打印就打印，不能就手动计算
printf "\n========== Manual Calculation ==========\n"
set $p = myproc()
set $satp_val = (8UL << 60) | (((uint64)($p->pgtbl)) >> 12)
set $fn_addr = 0x3ffffff000 + ((uint64)&user_return - (uint64)&trampoline)

printf "p            = %p\n", $p
printf "p->pgtbl     = 0x%lx\n", $p->pgtbl
printf "satp         = 0x%lx\n", $satp_val
printf "user_return_func = 0x%lx\n", $fn_addr

# 检查用户页表映射
printf "\n========== User Page Table Check ==========\n"
set $user_pgtbl = $p->pgtbl

# L2 页表
set $va = 0x3ffffff000
set $l2_idx = ($va >> 30) & 0x1ff
set $l2_pte = *(uint64*)($user_pgtbl + $l2_idx * 8)

printf "VA = 0x%lx\n", $va
printf "L2[%d] = 0x%lx (V=%d)\n", $l2_idx, $l2_pte, ($l2_pte & 0x1)

if ($l2_pte & 0x1) == 0
  printf "ERROR: L2 PTE is invalid!\n"
  quit
end

# L1 页表
set $l1_pgtbl = (($l2_pte >> 10) & 0xfffffffffff) << 12
set $l1_idx = ($va >> 21) & 0x1ff
set $l1_pte = *(uint64*)($l1_pgtbl + $l1_idx * 8)

printf "L1[%d] = 0x%lx (V=%d)\n", $l1_idx, $l1_pte, ($l1_pte & 0x1)

if ($l1_pte & 0x1) == 0
  printf "ERROR: L1 PTE is invalid!\n"
  quit
end

# L0 页表
set $l0_pgtbl = (($l1_pte >> 10) & 0xfffffffffff) << 12
set $l0_idx = ($va >> 12) & 0x1ff
set $l0_pte = *(uint64*)($l0_pgtbl + $l0_idx * 8)

printf "L0[%d] = 0x%lx\n", $l0_idx, $l0_pte

# 详细打印权限位
printf "  Flags: "
if ($l0_pte & 0x1)
  printf "V "
else
  printf "- "
end

if (($l0_pte >> 1) & 0x1)
  printf "R "
else
  printf "- "
end

if (($l0_pte >> 2) & 0x1)
  printf "W "
else
  printf "- "
end

if (($l0_pte >> 3) & 0x1)
  printf "X "
else
  printf "- "
end

if (($l0_pte >> 4) & 0x1)
  printf "U "
else
  printf "- "
end

printf "\n"

# 提取物理地址
set $mapped_pa = (($l0_pte >> 10) & 0xfffffffffff) << 12

printf "  Mapped PA   = 0x%lx\n", $mapped_pa
printf "  Expected PA = 0x%lx\n", &trampoline

if $mapped_pa != (uint64)&trampoline
  printf "\n!!! ERROR: Physical address mismatch !!!\n"
  quit
end

if (($l0_pte >> 4) & 0x1) == 0
  printf "\n!!! ERROR: U bit is 0, user cannot access !!!\n"
  quit
end

printf "\n  ✓ Mapping looks correct!\n"

# 验证映射内容
printf "\n  Verifying content at mapped PA:\n"
printf "  At offset 0x00:\n"
x/1i $mapped_pa
printf "  At offset 0x90 (user_return):\n"
x/1i ($mapped_pa + 0x90)

# 准备单步执行
printf "\n========== Executing Function Call ==========\n"
printf "About to execute: ((void (*)(uint64,uint64))0x%lx)(0x%lx, 0x%lx)\n", $fn_addr, 0x3fffffe000, $satp_val

# 单步进入
si
printf "\nAfter jump:\n"
printf "  PC = 0x%lx\n", $pc

if $pc != $fn_addr
  printf "  ERROR: PC != expected address!\n"
  quit
end

printf "  ✓ Jump successful!\n"
printf "  Current instruction:\n"
x/1i $pc

# 继续单步，观察页表切换
printf "\n========== Stepping Through user_return ==========\n"

set $count = 0
while $count < 15
  printf "\n[Step %d]\n", $count
  printf "  PC = 0x%lx\n", $pc
  printf "  Instruction: "
  x/1i $pc
  
  # 保存当前 satp
  set $old_satp = $satp
  
  # 执行一步
  si
  
  # 检查 satp 是否变化
  if $satp != $old_satp
    printf "  >>> SATP changed: 0x%lx -> 0x%lx\n", $old_satp, $satp
    printf "  >>> Switched to user page table!\n"
  end
  
  set $count = $count + 1
  
  # 如果执行到 sret，停止
  set $inst = *(uint32*)($pc)
  if $inst == 0x10200073
    printf "  >>> Reached sret, stopping.\n"
    loop_break
  end
end

printf "\n========== Final State ==========\n"
printf "PC   = 0x%lx\n", $pc
printf "SATP = 0x%lx\n", $satp

printf "\n========== Debug Complete ==========\n"