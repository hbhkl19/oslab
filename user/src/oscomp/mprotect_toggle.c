#include "unistd.h"
#include "string.h"
#include "stdio.h"
#include "stdlib.h"

static struct kstat kst;

void test_mprotect_write_toggle(void)
{
    TEST_START(__func__);

    const char *str = "  Hello, mmap successfully!";
    int fd = open("test_mprotect_toggle.txt", O_RDWR | O_CREATE);
    assert(fd > 0);
    write(fd, str, strlen(str));
    fstat(fd, &kst);

    char *array = mmap(NULL, 4096, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    assert(array != MAP_FAILED);

    int ret = mprotect(array, 4096, PROT_READ);
    printf("mprotect ro ret: %d\n", ret);
    assert(ret == 0);

    ret = mprotect(array, 4096, PROT_READ | PROT_WRITE);
    printf("mprotect rw ret: %d\n", ret);
    assert(ret == 0);

    array[0] = 'X';
    printf("mprotect toggle success.\n");
    munmap(array, 4096);
    close(fd);

    TEST_END(__func__);
}

int main(void)
{
    test_mprotect_write_toggle();
    return 0;
}
