# RISC-V OS Kernel

这是一个为 RISC-V 架构编写的简单操作系统内核。

## 快速开始

所有命令均在项目根目录 (`~/whu-oslab/`) 下执行。

### 1. 编译内核

```bash
make
```
该命令会编译所有代码，并在根目录生成一个名为 `kernel-qemu` 的文件。

### 2. 运行内核

```bash
make qemu
```
该命令会启动 QEMU 模拟器并运行内核。
> **提示**: 在 QEMU 窗口中，按 `Ctrl+A` 然后按 `X` 可以退出。

### 3. 调试内核

调试需要**两个终端**。

*   **终端 1**: 启动 QEMU 并等待 GDB 连接。
    ```bash
    make qemu-gdb
    ```

*   **终端 2**: 启动 GDB 并自动连接到 QEMU。
    ```bash
    gdb-multiarch kernel-qemu
    ```
    连接成功后，你就可以开始调试了。

### 4. 清理项目

```bash
make clean
```
该命令会删除所有编译生成的文件。

---

## GDB 常用调试命令

| 命令 | 作用 |
| :--- | :--- |
| `b <函数名>` | 在指定函数处设置断点，例如 `b spinlock_acquire` |
| `c` | 继续执行 (Continue) |
| `n` | 执行下一行代码 (Next) |
| `s` | 单步进入函数 (Step) |
| `p <变量名>` | 打印变量的值，例如 `p lk->name` |
| `bt` | 查看当前的函数调用栈 (Backtrace) |
| `q` | 退出 GDB |

---

## 项目结构

```
.
├── common.mk         # 通用的 Makefile 配置
├── kernel/           # 内核源代码
│   ├── boot/         # 启动代码
│   ├── dev/          # 设备驱动
│   ├── lib/          # 内核库
│   ├── proc/         # 进程相关代码
│   └── kernel.ld     # 内核链接脚本
├── Makefile          # 主 Makefile
└── README.md         # 本文档
```