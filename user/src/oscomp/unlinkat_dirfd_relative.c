#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_unlinkat_dirfd_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("unlinkat_base", 0666);
    printf("mkdir base ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    int dfd = open("unlinkat_base", O_RDONLY | O_DIRECTORY);
    printf("dir fd: %d\n", dfd);
    assert(dfd > 0);

    int fd = openat(dfd, "gone", O_CREATE | O_RDWR);
    printf("create fd: %d\n", fd);
    assert(fd > 0);
    close(fd);

    ret = sys_unlinkat(dfd, "gone", 0);
    printf("unlinkat ret: %d\n", ret);
    assert(ret == 0);
    close(dfd);

    ret = chdir("unlinkat_base");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    fd = open("gone", O_RDONLY);
    if(fd < 0) {
        printf("dirfd unlinkat success.\n");
    } else {
        printf("dirfd unlinkat failed.\n");
        close(fd);
    }

    TEST_END(__func__);
}

int main(void)
{
    test_unlinkat_dirfd_relative();
    return 0;
}
