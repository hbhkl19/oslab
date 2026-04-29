#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

static char bigbuf[8192];

void test_tmpfs_capacity(void)
{
    TEST_START(__func__);

    for(int i = 0; i < (int)sizeof(bigbuf) - 1; i++) {
        bigbuf[i] = 'A' + (i % 26);
    }
    bigbuf[sizeof(bigbuf) - 1] = '\0';

    int fd = open("tmpfs_big.txt", O_CREATE | O_RDWR);
    printf("open fd: %d\n", fd);
    assert(fd > 0);

    int n = write(fd, bigbuf, sizeof(bigbuf));
    printf("write len: %d\n", n);
    assert(n == (int)sizeof(bigbuf));
    close(fd);

    fd = open("tmpfs_big.txt", O_RDONLY);
    assert(fd > 0);
    static char readbuf[8192];
    int r = read(fd, readbuf, sizeof(readbuf));
    printf("read len: %d\n", r);
    assert(r == (int)sizeof(readbuf));
    close(fd);

    printf("tmpfs capacity success.\n");
    TEST_END(__func__);
}

int main(void)
{
    test_tmpfs_capacity();
    return 0;
}
