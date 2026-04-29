#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_path_link_relative(void)
{
    TEST_START(__func__);

    int ret = mkdir("rel_link_dir", 0666);
    printf("mkdir ret: %d\n", ret);
    assert(ret == 0 || ret == -1);

    ret = chdir("rel_link_dir");
    printf("chdir ret: %d\n", ret);
    assert(ret == 0);

    int fd = open("src", O_CREATE | O_RDWR);
    printf("open fd: %d\n", fd);
    assert(fd > 0);
    close(fd);

    ret = link("src", "dst");
    printf("link ret: %d\n", ret);
    assert(ret == 0);

    fd = open("dst", O_RDONLY);
    if(fd > 0) {
        printf("relative link success.\n");
        close(fd);
    } else {
        printf("relative link failed.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_path_link_relative();
    return 0;
}
