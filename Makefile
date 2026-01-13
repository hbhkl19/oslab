include common.mk

KERN = kernel
USER = user
MKFS = mkfs
KERNEL_ELF = kernel-qemu
FS_IMG = sdcard.img
CPUNUM = 2

INITCODE_DIR = user/initcode
INITCODE_GEN = $(INITCODE_DIR)/initcode.h
INITCODE_DST = include/proc/initcode.h

.PHONY: all clean build $(KERN) $(USER) $(MKFS)

all: $(INITCODE_DST) $(KERN) $(MKFS)
build: $(INITCODE_DST) $(KERN) $(MKFS)

$(KERN):
	$(MAKE) build --directory=$@
$(KERN): $(INITCODE_DST)

# 跳过 user 目录编译，测试程序已经在 sdcard.img 中
# $(USER):
#	$(MAKE) init --directory=$@

$(MKFS):
	$(MAKE) build --directory=$@
	# 不需要 mkfs 制作镜像，使用已有的 sdcard.img
	# $(MKFS)/mkfs $(FS_IMG) ./$(USER)/_test

$(INITCODE_GEN): $(INITCODE_DIR)/init.c $(INITCODE_DIR)/init.ld
	$(MAKE) --directory=$(INITCODE_DIR)

$(INITCODE_DST): $(INITCODE_GEN)
	cp $(INITCODE_GEN) $(INITCODE_DST)

# QEMU相关配置
QEMU     =  qemu-system-riscv64
QEMUOPTS =  -machine virt -bios default -kernel $(KERNEL_ELF)
QEMUOPTS += -m 128M -smp $(CPUNUM) -nographic
QEMUOPTS += -drive file=$(FS_IMG),if=none,format=raw,id=x0
QEMUOPTS += -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0
QEMUOPTS += -device virtio-net-device,netdev=net -netdev user,id=net

# 调试
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)

# qemu运行
qemu: $(KERN) $(MKFS)
	$(QEMU) $(QEMUOPTS)

.gdbinit: .gdbinit.tmpl-riscv
	sed "s/:1234/:$(GDBPORT)/" < $^ > $@

qemu-gdb: $(KERN) $(MKFS) .gdbinit
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)

clean:
	$(MAKE) --directory=$(KERN) clean
	$(MAKE) --directory=$(MKFS) clean
	$(MAKE) --directory=$(INITCODE_DIR) clean
	rm -f $(KERNEL_ELF) .gdbinit
