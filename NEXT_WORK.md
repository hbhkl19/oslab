# 内核完善进展总结（2026-04-01）

## 当前目标
把这个未完成的 OS 内核补到尽可能通过 `testsuits-for-oskernel` 的比赛测例；如果存在环境或交付要求不匹配，也要明确标出来。

---

## 这次已确认的关键结论

### 1. 当前评测入口和比赛要求不一致
比赛 `README` 要求：
- `make all` 产出 `kernel-rv` 和 `kernel-la`
- QEMU 挂载的是 **EXT4** 测试盘
- 系统启动后要主动扫描根目录中的 `*_testcode.sh`
- 串行执行各测试脚本
- 输出类似下面的分组标记：
  - `#### OS COMP TEST GROUP START basic ####`
  - `#### OS COMP TEST GROUP END basic ####`
- 全部执行完后主动关机

当前仓库实际情况：
- `Makefile` 现在构建的是 `kernel-qemu`，不是 `kernel-rv` / `kernel-la`
- 当前 `user/initcode/init.c` 只会：
  - 扫描根目录
  - 找 ELF
  - 直接 `fork + execve`
- **不会识别 `*_testcode.sh`，不会按比赛脚本入口执行，也不会输出规定分组标记**

涉及文件：
- `Makefile`
- `user/initcode/init.c`
- `testsuits-for-oskernel/README.md`

---

### 2. 当前内核更像“能跑部分 ELF”的半成品
现有代码已经有一套基本骨架：
- 进程/调度：`kernel/proc/proc.c`
- trap/系统调用：`kernel/trap/*`、`kernel/syscall/*`
- FAT32 文件读取：`kernel/fs/fat32.c`
- tmpfs：`kernel/fs/tmpfs.c`
- 文件抽象：`kernel/fs/file.c`
- 用户地址空间：`kernel/mem/uvm.c`

也就是说它不是从零开始，但很多比赛会直接打到的功能还是“简化实现”或 stub。

---

## 已定位的主要问题

### 3. `mmap/munmap/mprotect` 还是半成品
在 `kernel/syscall/sysfunc.c`：
- `sys_mmap()` 现在本质上是“扩 heap + 可选把文件内容拷进去”
- `sys_munmap()` 直接返回成功
- `sys_mprotect()` 直接返回成功

在 `kernel/mem/uvm.c`：
- `uvm_copy_pgtbl()` 没处理 mmap 区域
- `uvm_mmap()` 基本空着
- `uvm_munmap()` 基本空着

这会直接影响：
- basic 里的 `mmap/munmap`
- 后续动态链接
- libc-test / lmbench / UnixBench 等

涉及文件：
- `kernel/syscall/sysfunc.c`
- `kernel/mem/uvm.c`
- `kernel/mem/mmap.c`
- `include/mem/mmap.h`

---

### 4. 用户态异常会直接把整个内核打死
`kernel/trap/trap_user.c` 当前对这些情况会直接 `panic`：
- 非法指令
- user load page fault
- user store page fault
- 其他未知用户异常

这意味着：
- 只要某个测例触发坏地址或异常，不是杀掉当前进程，而是整个内核崩
- 大测例（busybox/libc-test/LTP）里非常容易出现这种情况

应该改成：
- 结束当前出错用户进程
- 向父进程返回失败状态
- 内核继续跑下一个测试

涉及文件：
- `kernel/trap/trap_user.c`

---

### 5. `clone/wait4` 只是最小壳子
在 `kernel/syscall/sysfunc.c`：
- `sys_clone()` 现在基本只是 `proc_clone(stack)`，忽略了 flags / ptid / tls / ctid
- `sys_wait4()` 也基本忽略了 pid / options

在 `kernel/proc/proc.c`：
- `proc_clone()` 只是复制页表和 trapframe，并可切换栈
- `proc_wait()` 只能等任意子进程，不是真正按 `wait4(pid, ...)` 语义

这会影响：
- basic 的 `clone/waitpid`
- 忙盒、libc、线程库、后续 benchmark

涉及文件：
- `kernel/syscall/sysfunc.c`
- `kernel/proc/proc.c`

---

### 6. `openat/*at/getcwd/getdents64` 语义不完整
在 `kernel/syscall/sysfunc.c`：
- `sys_openat()` 忽略 `dirfd`
- `sys_mkdirat()` 忽略 `dirfd`
- `sys_unlinkat()` 忽略 `dirfd`
- `sys_linkat()` 忽略 `dirfd`
- `sys_getcwd()` 依赖很简化的 cwd 逻辑
- `sys_getdents64()` 目前主要只对 FAT32 目录有意义

这会影响：
- basic 的 `openat/getdents/chdir/getcwd`
- shell 脚本运行
- busybox 的大量命令

涉及文件：
- `kernel/syscall/sysfunc.c`

---

### 7. tmpfs 目前只是“演示版”
`kernel/fs/tmpfs.c` / `include/fs/tmpfs.h` 当前问题：
- `tmpfs_cwd` 是全局变量，不是每进程独立
- 路径模型非常简化，基本可认为所有东西都挂在根下
- 容量很小：
  - 最多 64 个文件
  - 单文件最多 4096 字节

这对：
- busybox
- lua
- 临时文件
- shell 重定向
都会构成实际限制。

涉及文件：
- `kernel/fs/tmpfs.c`
- `include/fs/tmpfs.h`

---

### 8. 资源上限过小，重测例容易爆
已确认：
- `include/common.h` 里 `NPROC = 10`
- 文件表/管道/tmpfs 容量也偏小

这对下面这些组都可能不够：
- busybox
- UnixBench
- cyclictest
- LTP

涉及文件：
- `include/common.h`
- `kernel/fs/file.c`
- `kernel/syscall/sysfunc.c`
- `kernel/fs/tmpfs.c`

---

## 对测试集的理解
`testsuits-for-oskernel` 里共有 12 组：
- basic
- busybox
- lua
- libc-test
- iozone
- UnixBench
- iperf
- libc-bench
- lmbench
- netperf
- cyclictest
- LTP

### 当前阶段最现实的优先级
先争取：
1. 能按比赛入口跑起来
2. basic 尽量过
3. busybox / lua 尽量过

再看：
4. UnixBench / iozone / lmbench
5. libc-test / cyclictest / iperf / netperf / LTP

原因：
后面这几组大概率还要求更深的支持：
- 动态链接
- TLS
- 线程语义
- 信号
- `select/poll`
- `fsync`
- `statvfs/statfs`
- loopback TCP/UDP
- 更完整的 Linux syscall 兼容

---

## 当前最大的环境/交付风险

### 9. 文件系统类型可能不匹配
比赛 README 明确说测试盘是 **EXT4**。

但当前仓库能明显看到的是：
- FAT32 支持：`kernel/fs/fat32.c`
- 很简化的 tmpfs：`kernel/fs/tmpfs.c`

目前没有确认到可直接用于比赛根盘的完整 EXT4 支持。

这意味着：
- 如果官方真的是 EXT4 根盘，而当前内核只会 FAT32，那会成为首要阻塞
- 即便 syscall 修好了，连测试入口都可能读不到

---

### 10. LoongArch 目标大概率还没准备好
比赛要求：
- `kernel-rv`
- `kernel-la`

当前仓库明显偏 RISC-V：
- trap / arch / 启动代码都是 RISC-V 风格
- 顶层 `Makefile` 只围绕 RISC-V QEMU 在写

所以 `kernel-la` 很可能不是改个名字就行，而是需要单独架构移植。

---

## 下次建议直接做什么

### 第一阶段：先把入口和 basic 所需最小语义补齐
1. 改 `Makefile`
   - 至少先把输出名整理清楚
   - 判断 `kernel-rv/kernel-la` 是否能在当前仓库结构下实现

2. 改 `user/initcode/init.c`
   - 支持发现 `*_testcode.sh`
   - 串行执行测试组
   - 输出比赛要求的 group start/end 标记
   - 保留“直接执行 ELF”的 fallback，方便先测 basic

3. 改 `kernel/trap/trap_user.c`
   - user fault 不再 panic 整个内核
   - 只终止当前进程

4. 改 `kernel/syscall/sysfunc.c`
   - 先补 `wait4` 的基本 pid 语义
   - 补 `openat/*at/getcwd/getdents64` 的最小正确行为
   - 把 `mmap/munmap` 从 fake 改成至少能跑 basic

5. 改 `kernel/fs/tmpfs.c`
   - 去掉全局 cwd
   - 让路径/目录层次更像真的文件系统
   - 放宽容量限制

6. 改 `include/common.h`
   - 增大 `NPROC`

---

## 代码复用点
下次修改时优先复用现有实现，不要整套重写：

- 进程：
  - `kernel/proc/proc.c`
  - 可复用：`proc_fork`、`proc_clone`、`proc_wait`、`proc_exit`

- 文件抽象：
  - `kernel/fs/file.c`
  - 可复用：`file_alloc`、`file_dup`、`file_read`、`file_write`、`file_open_fat32`

- FAT32：
  - `kernel/fs/fat32.c`
  - 可复用：`fat32_lookup_path`、`fat32_read`、`fat32_readdir`

- syscall 参数解析：
  - `kernel/syscall/syscall.c`
  - 可复用：`arg_uint32`、`arg_uint64`、`arg_str`

- 用户内存复制：
  - `kernel/mem/uvm.c`
  - 可复用：`uvm_heap_grow`、`uvm_heap_ungrow`、`uvm_copyin`、`uvm_copyout`

---

## 第一阶段已完成的实现

### 1. 评测入口已做第一轮对齐
已修改：
- `Makefile`
- `kernel/Makefile`
- `user/initcode/init.c`

当前状态：
- 顶层构建产物已改为 `kernel-rv`
- init runner 已不再只扫 ELF，而是：
  1. 优先扫描根目录中的 `*_testcode.sh`
  2. 串行运行这些脚本
  3. 若没有发现脚本，则回退到扫描 ELF 并逐个执行
- 运行脚本时，当前实现会尝试：
  1. 直接 exec（如果目标本身就是 ELF）
  2. `/busybox sh <script>`
  3. `/busybox <script>`

说明：
- 这一步解决的是“入口形状不对”的问题，但**不代表官方脚本语义已经完整支持**。
- 是否能真正跑通 busybox shell、管道、重定向，还取决于后续 syscall 和文件系统语义补全。

### 2. 用户态异常已改成隔离失败而不是内核整体崩溃
已修改：
- `kernel/trap/trap_user.c`

当前状态：
- 非法指令
- user load page fault
- user store page fault
- 未识别的用户态异常/中断

上述情况现在会：
- 打印错误信息
- 结束当前进程
- 返回到调度器/父进程路径

而不再直接 `panic` 掉整个内核。

这一步很关键，因为后续跑脚本和大测例时，单个程序出错不应该拖垮整轮测试。

### 3. 第一阶段已经过真实编译验证
已实际执行：
- `make -C user/initcode`
- `make`

结果：
- 编译通过
- 已成功生成 `kernel-rv`

补充说明：
- IDE 中看到的 `a0/a7`、头文件找不到之类报错，属于宿主机索引/架构识别问题，不是实际 RISC-V 交叉编译失败。

---

## 第二阶段已完成的实现

### 1. `wait4` 已支持最小按 pid 等待语义
已修改：
- `include/proc/proc.h`
- `kernel/proc/proc.c`
- `kernel/syscall/sysfunc.c`

当前状态：
- `proc_wait()` 现在支持 `target_pid`
- `target_pid == -1` 时，仍表示等待任意子进程
- `sys_wait4()` 现在会把 `pid` 传递到 `proc_wait()`
- 对 `options != 0` 的情况，当前仍直接返回失败

意义：
- 比之前“永远只等任意子进程”更接近 basic / waitpid 的需求
- 还不是完整 Linux `wait4`，但已经补上最关键的一层

### 2. `openat/chdir/getcwd` 已补成最小可用版本
已修改：
- `kernel/syscall/sysfunc.c`

当前状态：
- 新增了最小相对路径解析 helper，用于把相对路径基于当前 cwd 转成绝对路径
- `sys_chdir()` 已实现，并会更新当前运行语义到 tmpfs 路径体系
- `sys_getcwd()` 在 buffer 不足时不再截断乱返回，而是直接返回失败
- `sys_openat()` 现在支持：
  - 基于当前 cwd 的最小相对路径打开
  - `.` / `/` 作为目录打开入口
  - 创建时优先 tmpfs
  - 读取时优先 FAT32，再回退旧文件系统

限制：
- 现在仍不是完整 `dirfd` 语义
- cwd 仍然建立在 tmpfs 的全局 cwd 上，不是严格 per-process
- 但对 basic 里的 `chdir/getcwd/openat` 已经比第一阶段前实用很多

### 3. 第二阶段已经过真实编译验证
已实际执行：
- `make`

结果：
- 编译通过

说明：
- 本阶段中途确实出现过一次真实编译错误（误用了 `strcmp`），已经修复为内核已有字符串接口，最终构建成功。

---

## 第三阶段已完成并验证的实现

### 1. `getdents64` 已不再只局限于 FAT32 根目录
已修改：
- `kernel/syscall/sysfunc.c`

当前状态：
- `sys_getdents64()` 现在除了支持 `FD_FAT32` 外，也支持原 inode 目录类型 `FD_DIR`
- 这使目录读取不再只在 FAT32 根目录场景下可用

意义：
- 对 basic 的 `getdents` 更稳
- 为后续目录相关 syscall 补全打了基础

### 2. `munmap` 已从空壳变成“最小可回收”实现
已修改：
- `kernel/syscall/sysfunc.c`

当前状态：
- 增加了基本边界检查
- 对位于当前堆顶末尾的映射区，`munmap` 现在能实际回收页并下调 `heap_top`
- 仍不是完整 Linux `munmap`

意义：
- 这一步主要是把 basic 的 `munmap` 从“纯假成功”推进到“至少对当前实现模型有真实作用”

### 3. `cwd` 已切到每进程字符串路径，而不再只依赖全局 tmpfs cwd
已修改：
- `include/proc/proc.h`
- `kernel/proc/proc.c`
- `kernel/syscall/sysfunc.c`

当前状态：
- 为 `proc_t` 新增 `cwd_path`
- `fork/clone` 会继承 `cwd_path`
- `resolve_user_path()` / `getcwd()` / `chdir()` 现在都基于每进程 `cwd_path`
- `mkdirat/unlinkat/linkat` 这轮也已经接入相对路径解析

意义：
- 这是从“全局 cwd”向“每进程 cwd”迈出的关键一步
- 对相对路径 syscall 的稳定性帮助很大

### 4. 新增了用户态回归测试，并在 QEMU 中实际跑通
已新增：
- `user/src/oscomp/path_unlink_relative.c`
- `user/src/oscomp/path_link_relative.c`
- `path_semantics_check.md`

已执行：
- 构建用户程序
- 将新测试二进制写入 `sdcard.img`
- 启动 QEMU 实机运行内核

最终结果：
- `path_unlink_relative` 通过
- `path_link_relative` 通过

说明：
- 这轮不是只“编译通过”，而是已经在 QEMU 实际运行验证
- 说明相对路径 `unlink/link` 的内核路径已经真正生效

### 5. 本轮 debug 过程中发现并修复了两个关键真实问题
#### (1) `kernel/Makefile` 重链接规则有问题
已修改：
- `kernel/Makefile`

问题：
- 变量名 `MOUDLES/MODULES` 拼写不一致
- 会导致 `.o` 文件变化后，`kernel-rv` 不一定可靠重链接

影响：
- 容易出现“代码改了但 QEMU 跑的还是旧内核”的假象

现状：
- 已修复，并且后续通过 `clean + make + qemu` 重新验证过

#### (2) `sys_chdir` 在两个文件中重复定义
已修改：
- 删除 `kernel/syscall/sysfile.c` 中的旧实现
- 保留 `kernel/syscall/sysfunc.c` 中的新实现

影响：
- 在全量重编译时会导致链接失败

现状：
- 已修复，完整重编译通过

#### (3) tmpfs 原先没有最小 `link` 支持
已修改：
- `include/fs/tmpfs.h`
- `kernel/fs/tmpfs.c`
- `kernel/syscall/sysfunc.c`

现状：
- 已为 tmpfs 增加最小 `tmpfs_link()`
- `path_link_relative` 已通过 QEMU 实测

---

## 第四阶段当前进展（本次会话新增）

### 1. 已完成的有效成果
#### (1) 新增并跑通了两类相对路径回归测试
已新增：
- `user/src/oscomp/path_unlink_relative.c`
- `user/src/oscomp/path_link_relative.c`
- `path_semantics_check.md`

已实际做过：
- 构建用户程序
- 将测试二进制写入 `sdcard.img`
- 启动 QEMU 跑内核

QEMU 中确认通过：
- `path_unlink_relative`
- `path_link_relative`

结论：
- 相对路径 `unlink` 已正常工作
- 相对路径 `link` 已正常工作

#### (2) 已把 tmpfs 上最小 `link` 支持补上
已修改：
- `include/fs/tmpfs.h`
- `kernel/fs/tmpfs.c`
- `kernel/syscall/sysfunc.c`

原因：
- `path_link_relative` 第一次失败时，根因不是路径解析，而是 tmpfs 文件创建后，`link/linkat` 最终仍落到旧 inode 文件系统路径
- 现已补上最小 `tmpfs_link()`，测试已转绿

#### (3) 已修复 `kernel/Makefile` 的重链接问题
已修改：
- `kernel/Makefile`

问题：
- 原来 `MOUDLES/MODULES` 拼写不一致
- 会导致对象文件更新后，`kernel-rv` 不一定可靠重新链接

影响：
- 容易出现“代码明明改了，但 QEMU 跑的还是旧内核”的假象

现状：
- 已修复
- 后续已通过 `clean + make + qemu` 重新验证过

#### (4) 已修复 `sys_chdir` 重复定义
已修改：
- 删除 `kernel/syscall/sysfile.c` 中旧版 `sys_chdir`
- 保留 `kernel/syscall/sysfunc.c` 中新版实现

原因：
- 在全量重编译时会导致链接错误

现状：
- 已修复并成功全量编译

---

### 2. 正在推进但还没收口的事项
#### `dirfd` 真语义推进到一半
本次已经做了这些修改：
- 在 `kernel/syscall/sysfunc.c` 中加入 `resolve_at_path(int dirfd, const char* path, char* out)`
- 思路是对 `*at` syscall 做最小真实语义：
  - `AT_FDCWD`
  - tmpfs 目录 fd
  - FAT32 根目录 fd
- 已为 tmpfs 增加：
  - `tmpfs_get_name(int idx)`

相关文件：
- `kernel/syscall/sysfunc.c`
- `kernel/fs/tmpfs.c`
- `include/fs/tmpfs.h`

#### 当前状态
- `mkdirat/unlinkat/linkat` 已基本改成走 `resolve_at_path()`
- `openat` 也已经开始切到 `resolve_at_path()`
- 内核编译通过

但：
- 我们新增的 `openat_dirfd_relative` 测试第一次在 QEMU 中仍失败：
  - 输出为 `dirfd openat failed.`
- 随后我继续修改了 `sys_openat()`，把它从 `resolve_user_path()` 改成走 `resolve_at_path()`
- **修改后只完成了重新编译 + 启动 QEMU，还没拿到完整最终测试输出**
- 这一步是当前最明确的“下次继续点”

---

### 3. 本次新增的测试程序
当前仓库里新增了三个用于路径语义回归的用户态程序：
- `user/src/oscomp/path_unlink_relative.c`
- `user/src/oscomp/path_link_relative.c`
- `user/src/oscomp/openat_dirfd_relative.c`

其中：
- 前两个已经在 QEMU 中确认通过
- `openat_dirfd_relative.c` 用于验证真正的 `dirfd + openat` 语义
- 该测试第一次失败，之后已继续修内核，但还没确认最终结果

---

### 4. 下次开工时优先做什么
#### 第一优先级：确认 `openat_dirfd_relative` 最新结果
直接做：
1. 重新运行：
   - `make -C /home/hbh/oslab/oslab`
   - `make -C /home/hbh/oslab/oslab qemu`
2. 在串口输出中定位：
   - `Testing ELF: /openat_dirfd_relative`
3. 看它是否从
   - `dirfd openat failed.`
   变成
   - `dirfd openat success.`

如果已经通过：
- 说明最小 `dirfd` 语义已经初步打通
- 下一步继续扩展 `dirfd` 到更多目录类型/边界场景

如果仍失败：
- 优先检查 `sys_openat()` 是否真的在所有路径都走了 `resolve_at_path()`
- 再检查目录 fd 打开出来后，tmpfs/FAT32 目录 fd 的基路径是否正确传入

#### 第二优先级：如果 `dirfd` 转绿，再继续下一块
建议顺序：
1. 扩展 `dirfd` 行为
2. `mmap/mprotect`
3. tmpfs 容量与分层目录限制

---

### 5. 下次建议直接读这些文件
- `NEXT_WORK.md`
- `kernel/syscall/sysfunc.c`
- `kernel/fs/tmpfs.c`
- `include/fs/tmpfs.h`
- `kernel/Makefile`
- `user/src/oscomp/path_unlink_relative.c`
- `user/src/oscomp/path_link_relative.c`
- `user/src/oscomp/openat_dirfd_relative.c`

---

## Phase 3 最新进展（已完成并验证）

### Step 3.1 已完成
`mmap_region` 元数据已经接入进程生命周期：
- `proc_t` 已挂 `mmap_region_t *mmap`
- `proc_alloc()` 初始化 `mmap = NULL`
- `proc_free()` 释放 `mmap` 链
- `proc_fork()` / `proc_clone()` 会复制 `mmap` 元数据链

相关文件：
- `include/proc/proc.h`
- `kernel/proc/proc.c`
- `include/mem/mmap.h`
- `kernel/mem/mmap.c`

### Step 3.2 已完成
`sys_mmap()` 不再只是扩 heap；现在在实际 eager map 页面后，会把映射区登记到 `p->mmap` 链：
- `begin = old`
- `npages = need / PGSIZE`

相关文件：
- `kernel/syscall/sysfunc.c`

### Step 3.3 已完成并通过 focused 验证
`sys_munmap()` 已支持：
- 整段删除
- 头部裁剪
- 尾部裁剪
- 中间拆分

新增验证程序：
- `user/src/oscomp/munmap_split.c`

单 hart focused QEMU 验证结果：
- `munmap split ret: 0`
- `munmap split success.`

说明：
- Step 3.3 的核心逻辑已通过验收
- 多 hart 模式下曾出现“没跑到用户态”的现象，但后续确认与 `munmap_split` 本身无关

### Step 3.4 已完成并通过 focused 验证
`sys_mprotect()` 已从“只做边界检查”升级为：
- 遍历目标区间页
- 调 `vm_getpte()` 取 PTE
- 直接重写 PTE 权限位（R/W/X/U/V）

新增验证程序：
- `user/src/oscomp/mprotect_toggle.c`

已有通过的 mprotect 回归测试：
- `user/src/oscomp/mprotect_basic.c`
- `user/src/oscomp/mprotect_unaligned.c`
- `user/src/oscomp/mprotect_toggle.c`

单 hart focused QEMU 验证结果：
- `mprotect ro ret: 0`
- `mprotect rw ret: 0`
- `mprotect toggle success.`

说明：
- Step 3.4 已通过验收

---

## 当前新增发现的重要问题
### 多 hart 启动路径存在假设错误
在多 hart 运行时，OpenSBI 有时会选择：
- `Boot HART ID = 1`

但当前 `/home/hbh/oslab/oslab/kernel/boot/main.c` 写死：
- 只有 `cpuid == 0` 的 hart 做全局初始化
- 其他 hart 只等待 `started`

这会导致：
- 如果 boot hart 不是 0，系统可能在进入 init runner 之前卡住

这不是 Phase 3 VM 逻辑的问题，而是独立的启动问题。

## Phase 4 近期进展（平台稳定性与 tmpfs 深化）

### 1. boot hart 不一定是 0 的启动问题已修复并验证
之前在多 hart QEMU 中，OpenSBI 有时会选 `Boot HART ID = 1`。
原先 `kernel/boot/main.c` 默认只有 `cpuid == 0` 才做全局初始化，这会导致：
- 若 boot hart 不是 0，系统可能在进入 init runner 前卡住

现在这条启动路径已经修复，并通过多 hart QEMU 验证：
- `Boot HART ID = 1` 时也能成功进入 `===== OS Test Runner =====` 并跑用户态测试

关键文件：
- `kernel/boot/main.c`

### 2. 多 hart 下 `gettimeofday` 问题已修复并验证
原先 `sys_gettimeofday()` 依赖粗粒度 `timer_get_ticks()`，在多 hart 场景下可能出现：
- `gettimeofday error.`
- 或 `interval == 0`

修复后：
- 直接改为基于 `r_time()` 读取更细粒度硬件时间源
- 按 QEMU virt 10MHz 频率换算 `tv_sec/tv_usec`

多 hart QEMU 验证结果：
- `gettimeofday success.`
- `interval > 0`

关键文件：
- `kernel/syscall/sysfunc.c`

### 3. tmpfs 扩容已经完成并通过容量测试
已修改：
- `include/fs/tmpfs.h`
- `kernel/fs/file.c`
- `user/src/oscomp/tmpfs_capacity.c`

本次做了两层修复：
1. 扩大 tmpfs 上限：
   - `TMPFS_MAX_FILES = 256`
   - `TMPFS_MAX_NAME = 128`
   - `TMPFS_MAX_SIZE = 65536`
2. 去掉 `kernel/fs/file.c` 中 `FD_TMPFS` 分支里原本写死的 4KB I/O 限制

新增回归测试：
- `user/src/oscomp/tmpfs_capacity.c`

QEMU 验证结果：
- `write len: 8192`
- `read len: 8192`
- `tmpfs capacity success.`

这说明：
- tmpfs 扩容已经真正生效
- 当前 tmpfs 至少可以稳定支撑 8KB 文件读写

---

### 5. `clear_child_tid` 最小兼容语义已完成并通过验证
已修改：
- `kernel/proc/proc.c`
- `user/include/unistd.h`
- `user/lib/syscall.c`
- `user/src/oscomp/clear_child_tid_exit.c`

当前状态：
- `sys_set_tid_address()` 已有用户态 wrapper
- `clear_child_tid` 测试程序已加入
- 在当前“进程式 clone、非共享地址空间”模型下，child 退出时先尝试清自己的地址并不足以让 parent 看到变化
- 因此改为在 `proc_wait()` 回收子进程时，如果子进程带有 `clear_child_tid` 地址，则在父进程地址空间中把该地址清零

新增验证程序：
- `user/src/oscomp/clear_child_tid_exit.c`

focused 验证结果：
- `clone ret: 3`
- `clone ret: 0`
- `clear_tid after wait: 0`
- `clear_child_tid success.`

说明：
- 这不是完整 Linux 线程语义，但对当前内核阶段来说，是一个可工作的最小兼容实现
- 该实现不会破坏现有 `/clone` 基线测试

## 当前下一步
1. `gettid` / `pid` / 线程身份语义继续收口
2. 再评估是否推进 `CLONE_VM` / `CLONE_THREAD`
3. TLS 暂不提前做，仍放在更后阶段

### 4. clone/tid 写回的第一层兼容已完成并通过验证
已修改：
- `include/proc/proc.h`
- `kernel/proc/proc.c`
- `kernel/syscall/sysfunc.c`
- `user/include/unistd.h`
- `user/lib/syscall.c`
- `user/src/oscomp/clone_tid_writeback.c`

当前状态：
- `proc_t` 已增加：
  - `set_child_tid`
  - `clear_child_tid`
- `proc_alloc()` 初始化了这些字段
- `fork/clone` 会复制这些字段
- `sys_set_tid_address()` 不再是完全空壳，会记录 `clear_child_tid`
- 新增用户态 wrapper：
  - `sys_clone_raw(...)`
- `sys_clone()` 现已支持安全版 `ptid/ctid` 写回：
  - 仅在用户地址存在且 PTE 可写时才做 `uvm_copyout`
  - 避免再次因为无效地址导致 panic

新增验证程序：
- `user/src/oscomp/clone_tid_writeback.c`

QEMU focused 验证结果：
- `clone ret: 57`
- `clone ret: 0`
- `parent_tid: 57`
- `child_tid: 57`
- `clone tid writeback success.`

说明：
- 父侧 `ptid/ctid` 写回兼容层已经打通
- `/clone` 基础测试仍保持通过
- 子进程侧 `child_tid seen in child: -1` 说明还未实现更深层线程语义，但这不影响当前这一步验收
