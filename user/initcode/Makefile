# Makefile for initcode

CROSS = riscv64-unknown-elf-
CC = $(CROSS)gcc
LD = $(CROSS)ld
OBJCOPY = $(CROSS)objcopy
OBJDUMP = $(CROSS)objdump

CFLAGS = -Wall -Werror -O2 -fno-omit-frame-pointer -ggdb
CFLAGS += -MD -mcmodel=medany -ffreestanding -fno-common -nostdlib
CFLAGS += -mno-relax -fno-stack-protector -fno-pie -no-pie

all: initcode.h

init.o: init.c
	$(CC) $(CFLAGS) -c init.c -o init.o

init: init.o init.ld
	$(LD) -T init.ld -o init init.o
	$(OBJDUMP) -d init > init.asm

init.bin: init
	$(OBJCOPY) -O binary init init.bin

initcode.h: init.bin
	@python3 -c 'import pathlib;data=pathlib.Path("init.bin").read_bytes();\
print("// Auto-generated initcode");\
print("unsigned char initcode[] = {");\
[print("  "+", ".join(f"0x{b:02x}" for b in data[i:i+12]) + ",") for i in range(0, len(data), 12)];\
print("};");\
print(f"unsigned int initcode_len = {len(data)};");\
print(f"// Generated initcode.h ({len(data)} bytes)")' > initcode.h

clean:
	rm -f *.o init init.bin init.asm initcode.h *.d

.PHONY: all clean
