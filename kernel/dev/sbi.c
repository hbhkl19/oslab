#include "dev/sbi.h"

// SBI 扩展和函数 ID
#define SBI_EXT_SRST 0x53525354
#define SBI_SRST_RESET 0
#define SBI_SRST_SHUTDOWN 0
#define SBI_SRST_REASON_NONE 0

#define SBI_EXT_LEGACY_SHUTDOWN 0x08

// SBI 定时器扩展
#define SBI_EXT_TIME 0x54494D45
#define SBI_EXT_LEGACY_SET_TIMER 0x0

sbi_ret_t sbi_ecall(uint64 ext, uint64 fid,
                    uint64 arg0, uint64 arg1,
                    uint64 arg2, uint64 arg3,
                    uint64 arg4, uint64 arg5)
{
    sbi_ret_t ret;
    register uint64 a0 asm("a0") = arg0;
    register uint64 a1 asm("a1") = arg1;
    register uint64 a2 asm("a2") = arg2;
    register uint64 a3 asm("a3") = arg3;
    register uint64 a4 asm("a4") = arg4;
    register uint64 a5 asm("a5") = arg5;
    register uint64 a6 asm("a6") = fid;
    register uint64 a7 asm("a7") = ext;

    asm volatile("ecall"
                 : "+r"(a0), "+r"(a1)
                 : "r"(a2), "r"(a3), "r"(a4), "r"(a5), "r"(a6), "r"(a7)
                 : "memory");

    ret.error = a0;
    ret.value = a1;
    return ret;
}

void sbi_shutdown()
{
    // 先尝试 System Reset 扩展
    sbi_ecall(SBI_EXT_SRST, SBI_SRST_RESET,
              SBI_SRST_SHUTDOWN, SBI_SRST_REASON_NONE,
              0, 0, 0, 0);
    // 如果不支持，回退到旧版关机
    sbi_ecall(SBI_EXT_LEGACY_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
}

// 设置定时器 - 使用 SBI TIME 扩展
// stime_value 是绝对时间 (从 mtime 寄存器读取的值)
void sbi_set_timer(uint64 stime_value)
{
    // 先尝试新的 TIME 扩展
    sbi_ret_t ret = sbi_ecall(SBI_EXT_TIME, 0, stime_value, 0, 0, 0, 0, 0);
    if(ret.error != 0) {
        // 如果不支持，回退到旧版
        sbi_ecall(SBI_EXT_LEGACY_SET_TIMER, 0, stime_value, 0, 0, 0, 0, 0);
    }
}
