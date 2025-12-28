 #include "sys.h"
    #include "type.h"

    int main()
    {
        uint32 block_num_1 = syscall(SYS_alloc_block);
        uint32 block_num_2 = syscall(SYS_alloc_block);
        uint32 block_num_3 = syscall(SYS_alloc_block);
        syscall(SYS_free_block, block_num_2);
        syscall(SYS_free_block, block_num_1);
        syscall(SYS_free_block, block_num_3);
        
        while(1);
        return 0;
    }