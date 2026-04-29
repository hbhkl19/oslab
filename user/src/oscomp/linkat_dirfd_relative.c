#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_linkat_dirfd_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("linkat_base", 0666);
    printf("mkdir base ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    int dfd = open("linkat_base", O_RDONLY | O_DIRECTORY);
    printf("dir fd: %d\n", dfd);
    assert(dfd > 0);

    int fd = openat(dfd, "src", O_CREATE | O_RDWR);
    printf("create fd: %d\n", fd);
    assert(fd > 0);
    close(fd);

    ret = sys_linkat(dfd, "src", dfd, "dst", 0);
    printf("linkat ret: %d\n", ret);
    assert(ret == 0);
    close(dfd);

    ret = chdir("linkat_base");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    fd = open("dst", O_RDONLY);
    if(fd > 0) {
        printf("dirfd linkat success.\n");
        close(fd);
    } else {
        printf("dirfd linkat failed.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_linkat_dirfd_relative();
    return 0;
}
