# RISC-V Teaching Kernel

A small RISC-V operating-system kernel developed for the 2025 National Student Computer System Capability Competition (Operating System Design Track). The kernel boots on QEMU `virt`, runs user programs from a FAT32 disk image, and provides a practical environment for studying operating-system internals.

## Highlights

- Process creation, scheduling, waiting, and user-fault isolation
- System-call handling and Linux-compatible interfaces
- FAT32-backed file access and a lightweight writable tmpfs
- Per-process current working directories and relative-path `*at` operations
- Eager `mmap`, region-aware `munmap`, and page-permission updates through `mprotect`
- Multi-hart boot support on RISC-V
- Automated QEMU test runner with focused user-space regression tests

## Architecture

```text
kernel/
├── boot/       Boot and platform initialization
├── dev/        Device and SBI support
├── fs/         FAT32, tmpfs, and file abstractions
├── mem/        Physical/virtual memory and mmap metadata
├── proc/       Processes, scheduling, fork/clone, and wait
├── syscall/    System-call dispatch and implementations
└── trap/       Interrupts, exceptions, and user-fault handling

user/
├── initcode/   Test runner launched by the kernel
└── src/        User programs and regression tests
```

## Build and Run

Requirements:

- Linux
- RISC-V 64-bit bare-metal toolchain
- QEMU with `qemu-system-riscv64`
- GNU Make

```bash
make all
make qemu
```

For debugging:

```bash
make qemu-gdb
```

The default branch contains the competition-oriented kernel implementation. Earlier lab stages are preserved as separate branches.

## Selected Engineering Work

- Reworked relative-path handling around a per-process working directory
- Added focused tests for `openat`, `linkat`, `unlinkat`, `mmap`, `munmap`, and `mprotect`
- Improved tmpfs capacity and removed fixed 4 KiB I/O assumptions
- Fixed multi-hart initialization when the boot hart is not hart 0
- Prevented a single user-space exception from crashing the whole kernel

## Scope

This is an educational and competition-oriented kernel rather than a complete Linux implementation. Several Linux subsystems and edge-case semantics remain intentionally incomplete.
