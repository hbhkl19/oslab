#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_mkdirat_dirfd_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("mkdirat_base", 0666);
    printf("mkdir base ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    int dfd = open("mkdirat_base", O_RDONLY | O_DIRECTORY);
    printf("dir fd: %d\n", dfd);
    assert(dfd > 0);

    ret = sys_mkdirat(dfd, "child", 0666);
    printf("mkdirat ret: %d\n", ret);
    assert(ret == 0);
    close(dfd);

    ret = chdir("mkdirat_base");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    int fd = open("child", O_RDONLY | O_DIRECTORY);
    if(fd > 0) {
        printf("dirfd mkdirat success.\n");
        close(fd);
    } else {
        printf("dirfd mkdirat failed.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_mkdirat_dirfd_relative();
    return 0;
}
