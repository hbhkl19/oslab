#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_openat_dirfd_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("dirfd_dir", 0666);
    printf("mkdir ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    int dfd = open("dirfd_dir", O_RDONLY | O_DIRECTORY);
    printf("dir fd: %d\n", dfd);
    assert(dfd > 0);

    int fd = openat(dfd, "inside", O_CREATE | O_RDWR);
    printf("openat fd: %d\n", fd);
    assert(fd > 0);
    close(fd);
    close(dfd);

    ret = chdir("dirfd_dir");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    fd = open("inside", O_RDONLY);
    if(fd > 0) {
        printf("dirfd openat success.\n");
        close(fd);
    } else {
        printf("dirfd openat failed.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_openat_dirfd_relative();
    return 0;
}
