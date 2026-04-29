#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_tmpfs_nested_dirs(void)
{
    TEST_START(__func__);

    int ret = mkdir("nest_a", 0666);
    printf("mkdir a ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    ret = chdir("nest_a");
    printf("chdir a ret: %d\n", ret);
    assert(ret == 0);

    ret = mkdir("nest_b", 0666);
    printf("mkdir b ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    ret = chdir("nest_b");
    printf("chdir b ret: %d\n", ret);
    assert(ret == 0);

    int fd = open("deep.txt", O_CREATE | O_RDWR);
    printf("open fd: %d\n", fd);
    assert(fd > 0);
    close(fd);

    printf("tmpfs nested success.\n");
    TEST_END(__func__);
}

int main(void)
{
    test_tmpfs_nested_dirs();
    return 0;
}
