#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

static int child_tid = -1;
static int parent_tid = -1;
size_t stack_tid[1024] = {0};

static int child_func_tid(void)
{
    printf("child_tid seen in child: %d\n", child_tid);
    return 0;
}

void test_clone_tid_writeback(void)
{
    TEST_START(__func__);

    int pid = (int)sys_clone_raw(SIGCHLD, stack_tid + 1024, &parent_tid, 0, &child_tid);
    printf("clone ret: %d\n", pid);
    assert(pid != -1);

    if(pid == 0) {
        child_func_tid();
        assert(child_tid > 0);
        exit(0);
    } else {
        int status = 0;
        waitpid((int)pid, &status, 0);
        printf("parent_tid: %d\n", parent_tid);
        printf("child_tid: %d\n", child_tid);
        assert(parent_tid == pid);
        assert(child_tid == pid);
        printf("clone tid writeback success.\n");
    }

    TEST_END(__func__);
}

int main(void)
{
    test_clone_tid_writeback();
    return 0;
}
