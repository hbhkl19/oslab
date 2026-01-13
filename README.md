# 进击的内核

该项目为2025年全国大学生计算机系统能力大赛 - 操作系统设计赛-中西部区域赛-内核实现赛参赛作品，采用 QEMU（virt, riscv64）启动，直接加载 `kernel-qemu`，并挂载预置用户测试的 FAT32 `sdcard.img`。启动后 init 进程会自动扫描 SD 根目录，串行运行每个 ELF 测试，输出到串口，全部完成后主动退出 QEMU。

## 环境依赖
- RISC-V 64 位裸机交叉编译链已加入 `PATH`（如 `riscv64-unknown-elf-gcc`，可使用 `res/kendryte-toolchain-ubuntu-amd64-8.2.0-20190409.tar.xz`）。
- `qemu-system-riscv64`（验证于 7.0.0）。
- Linux 主机，安装 `make`。

## 编译
```bash
export PATH=$PATH:/path/to/riscv-toolchain/bin
make all     # 生成 initcode、kernel-qemu，复用已有 sdcard.img
```
产物：
- `kernel-qemu`：传给 QEMU 的内核 ELF。
- `sdcard.img`：已包含预编译用户测试的 FAT32 镜像（默认无需重新制作）。
- `sbi-qemu`：仅在自定义 SBI 时需要；使用 `-bios default` 可忽略。

清理：
```bash
make clean
```

## 在 QEMU 运行
```bash
qemu-system-riscv64 -machine virt -kernel kernel-qemu -m 128M -nographic -smp 2 -bios default \
  -drive file=sdcard.img,if=none,format=raw,id=x0 \
  -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 \
  -device virtio-net-device,netdev=net -netdev user,id=net
```
说明：
- `-initrd initrd.img` 可选，未生成则省略。
- 启动会打印 `===== OS Test Runner =====`，依次执行 `/` 下 ELF，结束后退出 QEMU。
- 调试可用 `make qemu-gdb`（暂停等待 GDB），或直接 `make qemu`。

## 测试流程简介
- init 代码位于 `user/initcode/init.c`，编译时写入 `include/proc/initcode.h`。
- init 打开 `sdcard.img` 的 FAT32 根目录，用 `getdents64` 枚举普通文件，检测 ELF 头后用 `execve` 运行，避免重复执行同一文件。
- 测试逐个串行运行；缺失或跳过的项不计分。

## 目录结构
- `kernel/`：内核、系统调用、驱动、文件系统
- `user/`：用户态源码；测试程序打包进 `sdcard.img`。
- `mkfs/`：镜像制作工具。
- `include/`：公共头文件。


## 常用操作
- 构建内核：`make all`
- 直接运行：`make qemu`
- GDB 调试：`make qemu-gdb` 后运行 `riscv64-unknown-elf-gdb -x .gdbinit kernel-qemu`
