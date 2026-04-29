#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_path_unlink_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("rel_unlink_dir", 0666);
    printf("mkdir ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    ret = chdir("rel_unlink_dir");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    int fd = open("afile", O_CREATE | O_RDWR);
    printf("open fd: %d\n", fd);
    assert(fd > 0);
    close(fd);

    ret = unlink("afile");
    printf("unlink ret: %d\n", ret);
    assert(ret == 0);

    fd = open("afile", O_RDONLY);
    if(fd < 0) {
        printf("relative unlink success.\n");
    } else {
        printf("relative unlink failed.\n");
        close(fd);
    }

    TEST_END(__func__);
}

int main(void)
{
    test_path_unlink_relative();
    return 0;
}
