// 这个头文件通常认为其他.h文件都应该include
#ifndef __COMMON_H__
#define __COMMON_H__

// 类型定义

typedef char                   int8;
typedef short                  int16;
typedef int                    int32;
typedef long long              int64;
typedef unsigned char          uint8; 
typedef unsigned short         uint16;
typedef unsigned int           uint32;
typedef unsigned long long     uint64;

typedef unsigned long long         reg; 
typedef enum {false = 0, true = 1} bool;

#ifndef NULL
#define NULL ((void*)0)
#endif

#define NCPU 2
#define NPROC 10

// 文件系统使用的块大小
#define BLOCK_SIZE 1024

// 简单的对齐宏
#define ALIGN_DOWN(x, a) ((x) & ~((a) - 1))
#define ALIGN_UP(x, a)   (((x) + (a) - 1) & ~((a) - 1))

#endif
