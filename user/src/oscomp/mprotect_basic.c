#include "unistd.h"
#include "string.h"
#include "stdio.h"
#include "stdlib.h"

static struct kstat kst;

void test_mprotect_basic(void)
{
    TEST_START(__func__);

    const char *str = "  Hello, mmap successfully!";
    int fd = open("test_mprotect.txt", O_RDWR | O_CREATE);
    assert(fd > 0);
    write(fd, str, strlen(str));
    fstat(fd, &kst);

    char *array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    if(array == MAP_FAILED) {
        printf("mprotect mmap failed.\n");
    } else {
        int ret = mprotect(array, kst.st_size, PROT_READ);
        printf("mprotect ret: %d\n", ret);
        assert(ret == 0);
        printf("mprotect success.\n");
        munmap(array, kst.st_size);
    }
    close(fd);

    TEST_END(__func__);
}

int main(void)
{
    test_mprotect_basic();
    return 0;
}
