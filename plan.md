# Context

目标不是继续做零散修补，而是基于当前 `/home/hbh/oslab/oslab` 这份内核，制定一份**面向 `testsuits-for-oskernel` 全量通过**的全局执行路线图。当前内核已经不再是空壳：它可以启动、进入用户态、运行 init runner、执行一批 ELF/basic 测试，并且最近已经补强了 `wait4`、`cwd/path/*at`、`getdents64`、部分 `munmap/mprotect`、以及若干用户态回归测试。但它距离“通过所有测试组”仍有明显差距，主要集中在：根文件系统兼容（EXT4 风险）、真正的 `mmap`/`mprotect`/VMA 管理、线程/clone/TLS、信号、socket/网络、tmpfs/VFS 语义、以及更完整的 Linux 兼容层。

下面这份计划以**整体通过 testsuits-for-oskernel**为目标，按风险和收益拆成大阶段；后续实现应优先遵循这份路线图，而不是只根据单个失败点做局部修补。

# Recommended approach

## Phase 0 — 基线与提交兼容性收口
目的：先保证“能被正确评测”，避免后面所有工作建立在错误入口上。

### Step 0.1 — 统一构建/产物/启动约定
- 确认 `make all` 输出是否满足比赛提交要求：`kernel-rv`、`kernel-la`。
- 目前仓库已能稳定产出 `kernel-rv`，但 `kernel-la` 仍是缺口；需要单独评估是否只是缺产物名，还是根本缺 LoongArch 端口。
- 关键文件：
  - `/home/hbh/oslab/oslab/Makefile`
  - `/home/hbh/oslab/oslab/kernel/Makefile`

### Step 0.2 — 确认官方根文件系统路径
- 当前仓库运行路径明显偏 FAT32：
  - `/home/hbh/oslab/oslab/kernel/fs/fat32.c`
  - `/home/hbh/oslab/oslab/user/initcode/init.c`
- 但比赛/测试 README 写的是 **EXT4 根盘**。
- 在没有确认这一点前，所有“测试都能跑”的判断都不稳。
- 结论必须明确落成二选一：
  1. 实现/接入 EXT4 根盘读取；或
  2. 确认当前评测环境实际仍可由 FAT32 路径兼容。
- 这是最高优先级阻塞项之一。

### Step 0.3 — 保持评测入口稳定
- 维持当前 init runner 行为：
  - 优先扫描 `*_testcode.sh`
  - 找不到脚本再回退到 ELF 扫描
- 保证串行执行、输出、最终关机稳定。
- 关键文件：
  - `/home/hbh/oslab/oslab/user/initcode/init.c`
  - `/home/hbh/oslab/oslab/kernel/proc/proc.c`
  - `/home/hbh/oslab/oslab/kernel/dev/sbi.c`

---

## Phase 1 — 把 basic 组尽量打满
目的：优先拿下最基础、最有杠杆的 syscall/进程/文件系统语义。

### Step 1.1 — 维持并扩展当前 basic 已通过项
当前已经有较好进展并应避免回退：
- `wait4(pid)` 最小语义
- `cwd_path` 每进程路径
- `openat/mkdirat/unlinkat/linkat` 的最小 `dirfd` 语义
- `getdents64` 对 `FD_DIR` 的支持
- `mmap/munmap/mprotect` 的最小可用路径
- 用户态异常隔离（不再 panic 全内核）

这些能力的当前主实现集中在：
- `/home/hbh/oslab/oslab/kernel/syscall/sysfunc.c`
- `/home/hbh/oslab/oslab/kernel/proc/proc.c`
- `/home/hbh/oslab/oslab/kernel/trap/trap_user.c`

### Step 1.2 — 用回归测试固化 basic 关键路径
继续沿用已经有效的方式：
- 新增用户态小测试
- 写入 `sdcard.img`
- 启动 QEMU 实机验证

目前已经有这些回归测试可复用：
- `/home/hbh/oslab/oslab/user/src/oscomp/path_unlink_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/path_link_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/openat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mkdirat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/unlinkat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/linkat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mprotect_basic.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mprotect_unaligned.c`

### Step 1.3 — basic 仍需补齐的剩余高风险点
- `clone` 仍然只是 process-copy 风格，不是线程/共享地址空间语义。
- `mount/umount2` 仍然是浅层 stub；当前 basic 可能只看返回值，但不能长期依赖。
- `gettimeofday`/`times`/`sleep` 仍然较粗糙。
- `mmap/munmap` 还只是“堆顶驱动”的近似实现。

---

## Phase 2 — busybox / lua / shell 场景收口
目的：让系统从“能跑单个测试程序”进化到“能跑脚本和大量基础工具”。

### Step 2.1 — 完善 tmpfs 作为可写工作区
当前 tmpfs 仍然明显是简化版：
- 全局设计痕迹仍重
- 容量小：64 文件、单文件 4KB
- 分层目录能力弱
- 只做了最小 `link/unlink/open/chdir`

关键文件：
- `/home/hbh/oslab/oslab/kernel/fs/tmpfs.c`
- `/home/hbh/oslab/oslab/include/fs/tmpfs.h`

要做的小步骤：
1. 扩大 tmpfs 容量上限
2. 支持更靠谱的分层目录
3. 提升目录/文件类型判断稳定性
4. 让路径规范化和 `*at` 配合更稳

### Step 2.2 — 完善 shell 常见依赖语义
busybox/lua 会反复踩这些点：
1. 文件重定向
2. 管道稳定性
3. `dup/dup2/dup3`
4. `stat/fstat/lseek`
5. `find/ls/grep/cp/mv/rm` 依赖的目录遍历和路径处理

重点文件：
- `/home/hbh/oslab/oslab/kernel/fs/file.c`
- `/home/hbh/oslab/oslab/kernel/syscall/sysfunc.c`
- `/home/hbh/oslab/oslab/kernel/fs/tmpfs.c`

### Step 2.3 — 提高基础资源上限
当前资源上限对大套件明显太小：
- `NPROC=10`
- 文件表、管道、tmpfs 容量偏小

关键文件：
- `/home/hbh/oslab/oslab/include/common.h`
- `/home/hbh/oslab/oslab/kernel/fs/file.c`
- `/home/hbh/oslab/oslab/kernel/syscall/sysfunc.c`
- `/home/hbh/oslab/oslab/kernel/fs/tmpfs.c`

这一步收益很高，建议在进入更复杂子系统前尽快做。

---

## Phase 3 — 真正的 VM / VMA / mmap / mprotect 收口
目的：这是从 basic/busybox 迈向 libc-test、lmbench、动态运行时的核心门槛。

### Step 3.1 — 把 `mmap_region` 真正接入进程生命周期
当前状态：
- `mmap_region` 仓库存在：
  - `/home/hbh/oslab/oslab/kernel/mem/mmap.c`
  - `/home/hbh/oslab/oslab/include/mem/mmap.h`
- 但 `proc_t` 和 `fork/clone/free/exit` 还没有完整接入这条链
- `uvm_mmap/uvm_munmap` 仍基本空着

要做的小步骤：
1. 在 `proc_t` 中正式挂 `mmap_region_t *mmap`
2. `proc_alloc/proc_free` 初始化和释放链表
3. `fork/clone` 复制/继承 mmap 区域元数据
4. `exit` 和回收路径不泄漏 mmap 元数据

关键文件：
- `/home/hbh/oslab/oslab/include/proc/proc.h`
- `/home/hbh/oslab/oslab/kernel/proc/proc.c`
- `/home/hbh/oslab/oslab/kernel/mem/uvm.c`
- `/home/hbh/oslab/oslab/kernel/mem/mmap.c`

### Step 3.2 — 让 `sys_mmap` 不再只是 heap-grow hack
当前 `sys_mmap()` 的问题：
- 本质是扩 `heap_top`
- 只是把文件内容复制进去
- 没有真正 VMA 语义

要做的小步骤：
1. 选定 mmap 地址区间策略
2. 建立最小 VMA 分配器
3. 支持匿名映射
4. 支持文件映射（先 eager map）
5. 记录 prot/flags 元数据

### Step 3.3 — 让 `sys_munmap` 支持真正的区域裁剪/拆分
当前只会在命中堆顶时回收。

要做的小步骤：
1. 支持整段 unmap
2. 支持头部裁剪
3. 支持尾部裁剪
4. 支持中间拆分成两段
5. 保持页表和 VMA 链同步

### Step 3.4 — 让 `sys_mprotect` 真正改权限
当前只是做边界检查。

要做的小步骤：
1. 对 VMA 范围校验
2. 修改对应页 PTE 的权限位
3. 保持和 `prot` 参数一致
4. 增加成功/失败回归测试

### Step 3.5 — 再考虑 page fault 驱动的延迟映射
这是后续增强项，不建议一开始就做。
先用 eager mapping 打通功能，再决定是否引入 fault-time mapping。

---

## Phase 4 — 线程/clone/TLS 与 libc 运行时基础
目的：进入 `libc-test`、`libcbench`、部分 `cyclictest` 的前置条件。

### Step 4.1 — 提升 `clone` 语义
当前 `sys_clone()`：
- 忽略 `flags/ptid/tls/ctid`
- 只传栈
- 行为更接近轻度 fork

要做的小步骤：
1. 区分进程式 clone 与线程式 clone
2. 处理 `CLONE_VM` 最小语义
3. 处理 `set_tid_address`
4. 最小 TLS 初始化
5. 校正 `gettid`/`pid` 语义

### Step 4.2 — 补足 pthread 依赖原语
这一步后续大概率会要求：
- futex 或兼容同步原语
- 至少让用户态线程库能跑起来

这已经是明显的大步骤，建议在 VM 稳后再做。

---

## Phase 5 — 信号与中断用户态语义
目的：支持更真实的 shell 行为、lmbench/cyclictest/LTP 一部分。

### Step 5.1 — 最小信号框架
目前几乎为空。

优先顺序：
1. `kill`
2. `rt_sigaction`
3. `rt_sigprocmask`
4. 用户态返回路径上的信号帧处理
5. 可中断 sleep/wait 等语义

关键文件：
- `/home/hbh/oslab/oslab/kernel/trap/trap_user.c`
- `/home/hbh/oslab/oslab/kernel/syscall/syscall.c`
- `/home/hbh/oslab/oslab/kernel/syscall/sysfunc.c`
- `/home/hbh/oslab/oslab/kernel/proc/proc.c`

---

## Phase 6 — 网络/socket 子系统
目的：支撑 `iperf`、`netperf`、部分 libc-test / LTP。

### Step 6.1 — 先明确这是“新子系统”而不是小 patch
当前仓库没有成型 socket 层。
所以不要把它当成“多补几个 syscall”看待。

### Step 6.2 — 网络路线拆解
1. 设备/驱动确认（VirtIO net）
2. loopback
3. socket API
4. UDP
5. TCP
6. accept/connect/send/recv
7. 多连接和后台 server 稳定性

这是后期工程，不应抢在 VM/FS/threads/signals 前面。

---

## Phase 7 — 冲更大测试组（UnixBench / iozone / lmbench / libc-test / cyclictest / LTP）
目的：在前面基础打稳后，再分组冲高。

### 推荐分组推进顺序
1. `basic`
2. `busybox`
3. `lua`
4. `unixbench`
5. `iozone`
6. `lmbench`
7. `libc-test(static)`
8. `iperf/netperf`
9. `libcbench`
10. `libc-test(dynamic)`
11. `cyclictest`
12. `ltp`

### 原因
- `basic/busybox/lua` 收益最高，且当前已有基础
- `unixbench/iozone/lmbench` 主要吃 Unix 基础语义和 VM/FS 稳定性
- `libc-test(dynamic)` 和 `libcbench` 需要 TLS/threads/dynamic loader
- `cyclictest` 需要调度/时钟/信号更高级行为
- `ltp` 应视为最后阶段的大兼容性检查

---

# Critical files

## 入口与提交
- `/home/hbh/oslab/oslab/Makefile`
- `/home/hbh/oslab/oslab/kernel/Makefile`
- `/home/hbh/oslab/oslab/user/initcode/init.c`
- `/home/hbh/oslab/oslab/testsuits-for-oskernel/README.md`

## 进程/调度/异常
- `/home/hbh/oslab/oslab/kernel/proc/proc.c`
- `/home/hbh/oslab/oslab/include/proc/proc.h`
- `/home/hbh/oslab/oslab/kernel/trap/trap_user.c`

## syscall / 路径 / VFS
- `/home/hbh/oslab/oslab/kernel/syscall/syscall.c`
- `/home/hbh/oslab/oslab/kernel/syscall/sysfunc.c`
- `/home/hbh/oslab/oslab/kernel/syscall/sysfile.c`
- `/home/hbh/oslab/oslab/kernel/fs/file.c`
- `/home/hbh/oslab/oslab/kernel/fs/fat32.c`
- `/home/hbh/oslab/oslab/kernel/fs/tmpfs.c`
- `/home/hbh/oslab/oslab/include/fs/tmpfs.h`
- `/home/hbh/oslab/oslab/include/common.h`

## VM / mmap
- `/home/hbh/oslab/oslab/kernel/mem/uvm.c`
- `/home/hbh/oslab/oslab/kernel/mem/mmap.c`
- `/home/hbh/oslab/oslab/include/mem/mmap.h`
- `/home/hbh/oslab/oslab/include/mem/vmem.h`

## 用户态回归测试
- `/home/hbh/oslab/oslab/user/src/oscomp/path_unlink_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/path_link_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/openat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mkdirat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/unlinkat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/linkat_dirfd_relative.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mprotect_basic.c`
- `/home/hbh/oslab/oslab/user/src/oscomp/mprotect_unaligned.c`

# Reuse points
- `kernel/proc/proc.c`
  - `proc_fork`, `proc_clone`, `proc_wait`, `proc_exit`
- `kernel/fs/file.c`
  - `file_alloc`, `file_open_fat32`, `file_read`, `file_write`, `file_dup`, `file_stat`
- `kernel/fs/fat32.c`
  - `fat32_lookup_path`, `fat32_read`, `fat32_readdir`, `fat32_open`
- `kernel/syscall/syscall.c`
  - `arg_uint32`, `arg_uint64`, `arg_str`
- `kernel/mem/uvm.c`
  - `uvm_heap_grow`, `uvm_heap_ungrow`, `uvm_copyin`, `uvm_copyout`
- `kernel/mem/mmap.c`
  - `mmap_region_alloc`, `mmap_region_free`

# Verification

## 基线验证
1. `make all`
2. `make qemu`
3. 确认 init runner 能扫描测试并最终关机

## basic / 用户态回归验证
持续保留“新增用户态回归程序 → 写入 `sdcard.img` → QEMU 实测”的工作流。

当前应保留的回归测试：
- 路径与 `dirfd`
- `mprotect`
- 后续继续补 `mmap_region` / `munmap` 复杂场景测试

## 分阶段验证
- Phase 1 完成后：重点看 `basic`
- Phase 2 完成后：重点看 `busybox`、`lua`
- Phase 3 完成后：重点看 `mmap/munmap`、`lmbench` 页故障/映射路径
- Phase 4/5 完成后：重点看 `libc-test`、`cyclictest`
- Phase 6 后：再碰 `iperf/netperf`

## 风险复查点
每进入下一阶段前，都先复查：
1. rootfs/EXT4 问题是否已解决
2. `kernel-la` 是否仍然缺失
3. 是否存在“代码改了但产物没重链接”的构建问题

# Execution rule for future work
后续实现应优先遵循这份计划：
1. 先做当前阶段未收口的小步骤
2. 每完成一个小步骤就增加/运行针对性回归测试
3. 只有当前阶段稳定后，才进入下一阶段
4. 不为了远期测试（如 LTP / netperf / cyclictest）过早引入巨大新子系统，除非前置阶段已经基本完成
