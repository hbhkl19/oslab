#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

void test_munmap_split(void)
{
    TEST_START(__func__);

    char *base = mmap(NULL, 3 * 4096, PROT_READ | PROT_WRITE, MAP_PRIVATE, -1, 0);
    printf("mmap base: %p\n", base);
    assert(base != MAP_FAILED);

    strcpy(base, "left-page");
    strcpy(base + 2 * 4096, "right-page");

    int ret = munmap(base + 4096, 4096);
    printf("munmap split ret: %d\n", ret);
    assert(ret == 0);

    printf("munmap split success.\n");
    TEST_END(__func__);
}

int main(void)
{
    test_munmap_split();
    return 0;
}
