# Path semantics quick check

手动验证这轮改动时，优先看下面几项：

## 1. chdir + getcwd
期望：
- `mkdir("test_chdir")`
- `chdir("test_chdir") == 0`
- `getcwd()` 返回里包含 `/test_chdir`

对应现有 basic 用例：
- `testsuits-for-oskernel/basic/user/src/oscomp/chdir.c`
- `testsuits-for-oskernel/basic/user/src/oscomp/getcwd.c`

## 2. openat 相对路径
期望：
- `open("./mnt", O_DIRECTORY)` 能打开目录
- `openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR)` 成功

当前实现说明：
- 现在主要依赖“cwd 相对路径解析”生效
- 还不是完整 `dirfd` 语义

对应现有 basic 用例：
- `testsuits-for-oskernel/basic/user/src/oscomp/openat.c`

## 3. getdents
期望：
- `open(".", O_RDONLY)` 后
- `getdents(fd, buf, 512)` 返回正数
- 能读出至少一个目录项名

对应现有 basic 用例：
- `testsuits-for-oskernel/basic/user/src/oscomp/getdents.c`

## 4. unlink 相对路径
建议补充手测流程：
- `mkdir("tmpdir")`
- `chdir("tmpdir")`
- `open("afile", O_CREATE | O_RDWR)`
- `unlink("afile") == 0`

## 5. linkat 相对路径
建议补充手测流程：
- 在 cwd 下创建 `src`
- `link("src", "dst")` 或 `linkat(..., "src", ..., "dst", ...)`
- 检查返回值是否为 0

## 说明
这份文件只是当前阶段的人工检查单，不属于正式评测输入。
