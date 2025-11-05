# 这个文件负责公共的配置

TOOLPREFIX = riscv64-unknown-elf-
CC = ${TOOLPREFIX}gcc
LD = ${TOOLPREFIX}ld
OBJCOPY = ${TOOLPREFIX}objcopy
OBJDUMP = ${TOOLPREFIX}objdump

# --- 关键修改 1: 在这里添加新行 ---
# (这个技巧是为了让 make 知道项目的根目录在哪里)
COMMON_MK_PATH := $(lastword $(MAKEFILE_LIST))
PROJECT_ROOT := $(dir $(COMMON_MK_PATH))

# 编译相关配置
CFLAGS = -Wall -Werror -O0 -fno-omit-frame-pointer -ggdb -gdwarf-2
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax

# --- 关键修改 2: 修改了下面这一行 ---
# 原来是: CFLAGS += -I.
# 现在改成:
CFLAGS += -I $(PROJECT_ROOT)

CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

# 链接相关配置 
LDFLAGS = -z max-page-size=4096