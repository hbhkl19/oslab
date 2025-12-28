# RISC-V OS Kernel

**简要说明** 

这是一个基于 RISC-V 的教学/实验操作系统（xv6 风格）的实现，包含完整内核与用户态支持，目前仓库中的功能已经实现并可正常运行（内核启动、设备驱动、文件系统、进程与系统调用、用户程序、调试支持等）。此 README 用于概述项目、构建与运行方法、已实现的功能与调试/测试说明。

---

## 目录预览 🔧

- `kernel/` - 内核源码（启动、内存管理、进程调度、系统调用、驱动、文件系统等）
- `include/` - 头文件
- `user/` - 用户程序与用户库
- `mkfs/` - 用于构建文件系统镜像的工具
- `Makefile`, `common.mk` - 构建规则

---

## 已实现的主要功能 

- 内核启动与初始化（RISC-V 环境、trampoline）
- 设备驱动：UART、Timer、PLIC、中断、VirtIO（块设备）
- 基本文件系统（inode、目录、缓冲区、位图）与 `mkfs` 工具
- 进程管理（fork/exit/wait、scheduling、context switch）
- 系统调用框架与常用系统调用实现
- 内核与用户态 trap/中断处理
- 虚拟内存与内存管理（UVm、pmem、mmap 支持）
- 用户库与若干测试程序（位于 `user/`）
- 调试支持：`make qemu-gdb`，并提供 VSCode launch task

---

## 快速开始（构建与运行） 

### 准备

1. 安装 RISC-V 工具链与 QEMU（需支持 riscv64）。
   - 在常见 Linux 发行版上，需保证 `riscv64-unknown-elf-gcc` / `riscv64-unknown-elf-ld` 等可用，QEMU 支持 riscv 系列。具体安装步骤请根据你的发行版或工具链来源进行。

2. 在项目根目录（`~/whu-oslab/`）执行以下命令：

```bash
# 构建所有子模块与生成可运行镜像
make

# 启动 QEMU 运行内核
make qemu

# 启动 QEMU 并等待 GDB 连接（用于调试）
make qemu-gdb
```

> 所有命令均在项目根目录 (`~/whu-oslab/`) 下执行。

### 使用 VSCode 调试

项目已包含 VSCode 的任务与 launch 配置，使用 `debug xv6` 配置可以启动并连接 GDB（预先运行 `make qemu-gdb`）。

---

## 调试与常用 GDB 命令 🐞

- 使用 `make qemu-gdb` 启动目标并留待 GDB 连接。
- 常用 GDB 命令示例：
  - `target remote :1234`
  - `load`（若需要）
  - `break main` / `break tramp` 等
  - `continue` / `stepi` / `nexti`

（仓库包含 `debug_trampoline.gdb`，可按需加载。）

---

## 测试与验证 ✅

- `user/` 目录下包含若干测试程序（如 `test*`），可通过构建并在内核下运行来验证系统调用、进程切换、文件系统等功能。
- 建议运行 `make qemu` 后在内核 shell 下运行这些测试程序以验证行为。

---

## 代码结构与实现要点 ✨

- `kernel/start.c`, `kernel/boot/entry.S`：启动流程与入口
- `kernel/trap/*`：陷阱（trap）处理与中断分发
- `kernel/proc/*`：进程调度与上下文切换实现
- `kernel/fs/*`：文件系统核心结构（inode、目录、缓冲区）
- `kernel/dev/*`：设备驱动（plic, timer, uart, virtio 等）
- `user/`：用户程序与 syscall 接口实现

---

## 常见问题与建议 ⚠️

- 若 QEMU 无法启动或缺少 riscv 工具链，先确认工具链与 qemu 的安装路径在 `PATH` 中。
- 在调试时若看不到符号或无法设置断点，确认构建使用的是带调试符号的配置（本仓库 Makefile 默认为可调试模式）。
- 如要自己修改`initcode.c`进行测试，需要进入`/user`目录执行`make init`，然后找到`initcode.asm`中`main`函数的地址，将其写到`/kernel/proc/proc.c`第528行处。
