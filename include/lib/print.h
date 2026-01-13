#ifndef __PRINT_H__
#define __PRINT_H__

#include "common.h"

void print_init(void);
void printf(const char* fmt, ...);
void panic(const char* warning);
void assert(bool condition, const char* warning);

// 全局调试开关：默认0（关闭），本地调试时可在任意位置设置为1
extern int debug_log_enabled;
#define DEBUG_LOG(fmt, ...) do { if (debug_log_enabled) printf(fmt, ##__VA_ARGS__); } while (0)

#endif