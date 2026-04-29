#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

static int clear_tid = -1;
size_t stack_clear[1024] = {0};

void test_clear_child_tid_exit(void)
{
    TEST_START(__func__);

    sys_set_tid_address(&clear_tid);
    clear_tid = 1234;

    long pid = sys_clone_raw(SIGCHLD, stack_clear + 1024, 0, 0, &clear_tid);
    printf("clone ret: %d\n", (int)pid);
    assert(pid != -1);

    if(pid == 0) {
        exit(0);
    } else {
        int status = 0;
        waitpid((int)pid, &status, 0);
        printf("clear_tid after wait: %d\n", clear_tid);
        assert(clear_tid == 0);
        printf("clear_child_tid success.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_clear_child_tid_exit();
    return 0;
}
