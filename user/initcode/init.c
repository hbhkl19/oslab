// init.c - 第一个用户进程
// 功能: 扫描 FAT32 根目录并依次执行 ELF 测试程序

// 系统调用号 (Linux RISC-V)
#define SYS_write       64
#define SYS_read        63
#define SYS_close       57
#define SYS_getdents64  61
#define SYS_openat      56
#define SYS_exit        93
#define SYS_clone       220
#define SYS_execve      221
#define SYS_wait4       260

#define SIGCHLD         17
#define AT_FDCWD        -100

#define DT_UNKNOWN 0
#define DT_DIR     4
#define DT_REG     8

struct linux_dirent64 {
    unsigned long  d_ino;
    long           d_off;
    unsigned short d_reclen;
    unsigned char  d_type;
    char           d_name[];
};

// 内联系统调用
static long syscall1(long n, long a0) {
    register long a7 asm("a7") = n;
    register long _a0 asm("a0") = a0;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static long syscall3(long n, long a0, long a1, long a2) {
    register long a7 asm("a7") = n;
    register long _a0 asm("a0") = a0;
    register long _a1 asm("a1") = a1;
    register long _a2 asm("a2") = a2;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7), "r"(_a1), "r"(_a2) : "memory");
    return _a0;
}

static long syscall4(long n, long a0, long a1, long a2, long a3) {
    register long a7 asm("a7") = n;
    register long _a0 asm("a0") = a0;
    register long _a1 asm("a1") = a1;
    register long _a2 asm("a2") = a2;
    register long _a3 asm("a3") = a3;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7), "r"(_a1), "r"(_a2), "r"(_a3) : "memory");
    return _a0;
}

static long syscall5(long n, long a0, long a1, long a2, long a3, long a4) {
    register long a7 asm("a7") = n;
    register long _a0 asm("a0") = a0;
    register long _a1 asm("a1") = a1;
    register long _a2 asm("a2") = a2;
    register long _a3 asm("a3") = a3;
    register long _a4 asm("a4") = a4;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7), "r"(_a1), "r"(_a2), "r"(_a3), "r"(_a4) : "memory");
    return _a0;
}

// 简单的字符串长度
static int my_strlen(const char* s) {
    int n = 0;
    while(*s++) n++;
    return n;
}

// 打印字符串
static void print(const char* s) {
    syscall3(SYS_write, 1, (long)s, my_strlen(s));
}

// fork
static long my_fork() {
    return syscall5(SYS_clone, SIGCHLD, 0, 0, 0, 0);
}

// exec
static long my_exec(const char* path, char* const argv[]) {
    return syscall3(SYS_execve, (long)path, (long)argv, 0);
}

// wait
static long my_wait() {
    return syscall4(SYS_wait4, -1, 0, 0, 0);
}

// exit
static void my_exit(int code) {
    syscall1(SYS_exit, code);
}

// open (只读)
static int my_open_ro(const char* path) {
    return syscall5(SYS_openat, AT_FDCWD, (long)path, 0, 0, 0);
}

// close
static int my_close(int fd) {
    return syscall1(SYS_close, fd);
}

// read
static int my_read(int fd, void* buf, int len) {
    return syscall3(SYS_read, fd, (long)buf, len);
}

// getdents64
static int my_getdents(int fd, void* buf, int len) {
    return syscall3(SYS_getdents64, fd, (long)buf, len);
}

// 拼接路径 "/name"
static void build_path(const char* name, char* out, int maxlen) {
    int i = 0;
    if(maxlen <= 0) return;
    out[i++] = '/';
    while(name && *name && i < maxlen - 1) {
        out[i++] = *name++;
    }
    out[i] = '\0';
}

// 检查 ELF 魔数
static int is_elf(const char* path) {
    unsigned char hdr[4];
    int fd = my_open_ro(path);
    if(fd < 0) return 0;
    int n = my_read(fd, hdr, 4);
    my_close(fd);
    return n == 4 && hdr[0] == 0x7f && hdr[1] == 'E' && hdr[2] == 'L' && hdr[3] == 'F';
}

#define MAX_TESTS 128
static unsigned seen_tests[MAX_TESTS];
static int seen_cnt = 0;

// 简单的FNV哈希，用于去重，避免大数组
static unsigned hash_path(const char* s) {
    unsigned h = 2166136261u;
    while(*s) {
        h ^= (unsigned char)(*s++);
        h *= 16777619u;
    }
    return h;
}

static int already_seen(const char* path) {
    unsigned h = hash_path(path);
    for(int i = 0; i < seen_cnt; i++) {
        if(seen_tests[i] == h)
            return 1;
    }
    return 0;
}

static void record_seen(const char* path) {
    if(seen_cnt >= MAX_TESTS) return;
    seen_tests[seen_cnt++] = hash_path(path);
}

// 运行单个测试
static void run_test(const char* path) {
    print("Testing: ");
    print(path);
    print("\n");

    long pid = my_fork();
    if(pid == 0) {
        char* argv[] = {(char*)path, 0};
        my_exec(path, argv);
        print("  exec failed!\n");
        my_exit(-1);
    } else if(pid > 0) {
        my_wait();
    } else {
        print("  fork failed!\n");
    }
    print("\n");
}

// 扫描根目录并按顺序执行每个 ELF 文件
static void run_all_tests() {
    char buf[512];
    char path[128];

    int fd = my_open_ro("/");
    if(fd < 0) {
        print("Failed to open root directory\n");
        return;
    }

    for(;;) {
        int nread = my_getdents(fd, buf, sizeof(buf));
        if(nread <= 0) break;

        int new_ran = 0;

        int bpos = 0;
        while(bpos < nread) {
            struct linux_dirent64* d = (struct linux_dirent64*)(buf + bpos);
            if(d->d_type == DT_REG && d->d_name[0] != '.') {
                build_path(d->d_name, path, sizeof(path));
                if(is_elf(path) && !already_seen(path)) {
                    record_seen(path);
                    run_test(path);
                    new_ran = 1;
                }
            }
            bpos += d->d_reclen;
        }

        // 如果本轮没有新的可执行文件，避免重复循环
        if(!new_ran) break;
    }

    my_close(fd);
}

__attribute__((section(".text.start")))
void _start() {
    print("\n===== OS Test Runner =====\n\n");
    run_all_tests();
    print("===== All Tests Done =====\n");
    my_exit(0);
}
