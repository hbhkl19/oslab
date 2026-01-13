// 简单的 SBI 接口封装 (用于关机)
#pragma once

#include "common.h"

typedef struct {
    uint64 error;
    uint64 value;
} sbi_ret_t;

// 通用 ecall
sbi_ret_t sbi_ecall(uint64 ext, uint64 fid,
                    uint64 arg0, uint64 arg1,
                    uint64 arg2, uint64 arg3,
                    uint64 arg4, uint64 arg5);

// 关机（优先使用系统重置扩展，失败则回退到旧版关机）
void sbi_shutdown();

// 设置定时器
void sbi_set_timer(uint64 stime_value);
