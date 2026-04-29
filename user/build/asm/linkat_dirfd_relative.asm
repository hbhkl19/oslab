
/home/hbh/oslab/oslab/user/build/riscv64/linkat_dirfd_relative:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a265                	j	11aa <__start_main>

0000000000001004 <test_linkat_dirfd_relative>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_linkat_dirfd_relative(void)
{
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	fda50513          	add	a0,a0,-38 # 1fe0 <__clone+0x28>
{
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	3ee000ef          	jal	1402 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0e850513          	add	a0,a0,232 # 2100 <__func__.0>
    1020:	3e2000ef          	jal	1402 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fd450513          	add	a0,a0,-44 # 1ff8 <__clone+0x40>
    102c:	3d6000ef          	jal	1402 <puts>

    int ret = mkdir("linkat_base", 0666);
    1030:	1b600593          	li	a1,438
    1034:	00001517          	auipc	a0,0x1
    1038:	fd450513          	add	a0,a0,-44 # 2008 <__clone+0x50>
    103c:	719000ef          	jal	1f54 <mkdir>
    1040:	842a                	mv	s0,a0
    printf("mkdir base ret: %d\n", ret);
    1042:	85aa                	mv	a1,a0
    1044:	00001517          	auipc	a0,0x1
    1048:	fd450513          	add	a0,a0,-44 # 2018 <__clone+0x60>
    104c:	3d8000ef          	jal	1424 <printf>
    assert(ret == 0 || ret == -1);
    1050:	2405                	addw	s0,s0,1
    1052:	4785                	li	a5,1
    1054:	0087f863          	bgeu	a5,s0,1064 <test_linkat_dirfd_relative+0x60>
    1058:	00001517          	auipc	a0,0x1
    105c:	fd850513          	add	a0,a0,-40 # 2030 <__clone+0x78>
    1060:	63e000ef          	jal	169e <panic>

    int dfd = open("linkat_base", O_RDONLY | O_DIRECTORY);
    1064:	002005b7          	lui	a1,0x200
    1068:	00001517          	auipc	a0,0x1
    106c:	fa050513          	add	a0,a0,-96 # 2008 <__clone+0x50>
    1070:	4ad000ef          	jal	1d1c <open>
    1074:	842a                	mv	s0,a0
    printf("dir fd: %d\n", dfd);
    1076:	85aa                	mv	a1,a0
    1078:	00001517          	auipc	a0,0x1
    107c:	fd850513          	add	a0,a0,-40 # 2050 <__clone+0x98>
    1080:	3a4000ef          	jal	1424 <printf>
    assert(dfd > 0);
    1084:	10805463          	blez	s0,118c <test_linkat_dirfd_relative+0x188>

    int fd = openat(dfd, "src", O_CREATE | O_RDWR);
    1088:	00001597          	auipc	a1,0x1
    108c:	fd858593          	add	a1,a1,-40 # 2060 <__clone+0xa8>
    1090:	04200613          	li	a2,66
    1094:	8522                	mv	a0,s0
    1096:	49f000ef          	jal	1d34 <openat>
    109a:	84aa                	mv	s1,a0
    printf("create fd: %d\n", fd);
    109c:	85aa                	mv	a1,a0
    109e:	00001517          	auipc	a0,0x1
    10a2:	fca50513          	add	a0,a0,-54 # 2068 <__clone+0xb0>
    10a6:	37e000ef          	jal	1424 <printf>
    assert(fd > 0);
    10aa:	0c905a63          	blez	s1,117e <test_linkat_dirfd_relative+0x17a>
    close(fd);
    10ae:	8526                	mv	a0,s1
    10b0:	495000ef          	jal	1d44 <close>

    ret = sys_linkat(dfd, "src", dfd, "dst", 0);
    10b4:	00001597          	auipc	a1,0x1
    10b8:	fac58593          	add	a1,a1,-84 # 2060 <__clone+0xa8>
    10bc:	4701                	li	a4,0
    10be:	00001697          	auipc	a3,0x1
    10c2:	fba68693          	add	a3,a3,-70 # 2078 <__clone+0xc0>
    10c6:	8622                	mv	a2,s0
    10c8:	8522                	mv	a0,s0
    10ca:	60f000ef          	jal	1ed8 <sys_linkat>
    10ce:	84aa                	mv	s1,a0
    printf("linkat ret: %d\n", ret);
    10d0:	85aa                	mv	a1,a0
    10d2:	00001517          	auipc	a0,0x1
    10d6:	fae50513          	add	a0,a0,-82 # 2080 <__clone+0xc8>
    10da:	34a000ef          	jal	1424 <printf>
    assert(ret == 0);
    10de:	e8c9                	bnez	s1,1170 <test_linkat_dirfd_relative+0x16c>
    close(dfd);
    10e0:	8522                	mv	a0,s0
    10e2:	463000ef          	jal	1d44 <close>

    ret = chdir("linkat_base");
    10e6:	00001517          	auipc	a0,0x1
    10ea:	f2250513          	add	a0,a0,-222 # 2008 <__clone+0x50>
    10ee:	65b000ef          	jal	1f48 <chdir>
    10f2:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    10f4:	85aa                	mv	a1,a0
    10f6:	00001517          	auipc	a0,0x1
    10fa:	f9a50513          	add	a0,a0,-102 # 2090 <__clone+0xd8>
    10fe:	326000ef          	jal	1424 <printf>
    assert(ret == 0);
    1102:	e025                	bnez	s0,1162 <test_linkat_dirfd_relative+0x15e>

    fd = open("dst", O_RDONLY);
    1104:	4581                	li	a1,0
    1106:	00001517          	auipc	a0,0x1
    110a:	f7250513          	add	a0,a0,-142 # 2078 <__clone+0xc0>
    110e:	40f000ef          	jal	1d1c <open>
    1112:	842a                	mv	s0,a0
    if(fd > 0) {
    1114:	04a05063          	blez	a0,1154 <test_linkat_dirfd_relative+0x150>
        printf("dirfd linkat success.\n");
    1118:	00001517          	auipc	a0,0x1
    111c:	f8850513          	add	a0,a0,-120 # 20a0 <__clone+0xe8>
    1120:	304000ef          	jal	1424 <printf>
        close(fd);
    1124:	8522                	mv	a0,s0
    1126:	41f000ef          	jal	1d44 <close>
    } else {
        printf("dirfd linkat failed.\n");
    }

    TEST_END(__func__);
    112a:	00001517          	auipc	a0,0x1
    112e:	fa650513          	add	a0,a0,-90 # 20d0 <__clone+0x118>
    1132:	2d0000ef          	jal	1402 <puts>
    1136:	00001517          	auipc	a0,0x1
    113a:	fca50513          	add	a0,a0,-54 # 2100 <__func__.0>
    113e:	2c4000ef          	jal	1402 <puts>
}
    1142:	6442                	ld	s0,16(sp)
    1144:	60e2                	ld	ra,24(sp)
    1146:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    1148:	00001517          	auipc	a0,0x1
    114c:	eb050513          	add	a0,a0,-336 # 1ff8 <__clone+0x40>
}
    1150:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1152:	ac45                	j	1402 <puts>
        printf("dirfd linkat failed.\n");
    1154:	00001517          	auipc	a0,0x1
    1158:	f6450513          	add	a0,a0,-156 # 20b8 <__clone+0x100>
    115c:	2c8000ef          	jal	1424 <printf>
    1160:	b7e9                	j	112a <test_linkat_dirfd_relative+0x126>
    assert(ret == 0);
    1162:	00001517          	auipc	a0,0x1
    1166:	ece50513          	add	a0,a0,-306 # 2030 <__clone+0x78>
    116a:	534000ef          	jal	169e <panic>
    116e:	bf59                	j	1104 <test_linkat_dirfd_relative+0x100>
    assert(ret == 0);
    1170:	00001517          	auipc	a0,0x1
    1174:	ec050513          	add	a0,a0,-320 # 2030 <__clone+0x78>
    1178:	526000ef          	jal	169e <panic>
    117c:	b795                	j	10e0 <test_linkat_dirfd_relative+0xdc>
    assert(fd > 0);
    117e:	00001517          	auipc	a0,0x1
    1182:	eb250513          	add	a0,a0,-334 # 2030 <__clone+0x78>
    1186:	518000ef          	jal	169e <panic>
    118a:	b715                	j	10ae <test_linkat_dirfd_relative+0xaa>
    assert(dfd > 0);
    118c:	00001517          	auipc	a0,0x1
    1190:	ea450513          	add	a0,a0,-348 # 2030 <__clone+0x78>
    1194:	50a000ef          	jal	169e <panic>
    1198:	bdc5                	j	1088 <test_linkat_dirfd_relative+0x84>

000000000000119a <main>:

int main(void)
{
    119a:	1141                	add	sp,sp,-16
    119c:	e406                	sd	ra,8(sp)
    test_linkat_dirfd_relative();
    119e:	e67ff0ef          	jal	1004 <test_linkat_dirfd_relative>
    return 0;
}
    11a2:	60a2                	ld	ra,8(sp)
    11a4:	4501                	li	a0,0
    11a6:	0141                	add	sp,sp,16
    11a8:	8082                	ret

00000000000011aa <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    11aa:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    11ac:	4108                	lw	a0,0(a0)
{
    11ae:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    11b0:	05a1                	add	a1,a1,8
{
    11b2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    11b4:	fe7ff0ef          	jal	119a <main>
    11b8:	3fd000ef          	jal	1db4 <exit>
	return 0;
}
    11bc:	60a2                	ld	ra,8(sp)
    11be:	4501                	li	a0,0
    11c0:	0141                	add	sp,sp,16
    11c2:	8082                	ret

00000000000011c4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    11c4:	7179                	add	sp,sp,-48
    11c6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    11c8:	12054863          	bltz	a0,12f8 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    11cc:	02b577bb          	remuw	a5,a0,a1
    11d0:	00001697          	auipc	a3,0x1
    11d4:	f5068693          	add	a3,a3,-176 # 2120 <digits>
    buf[16] = 0;
    11d8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11dc:	0005871b          	sext.w	a4,a1
    11e0:	1782                	sll	a5,a5,0x20
    11e2:	9381                	srl	a5,a5,0x20
    11e4:	97b6                	add	a5,a5,a3
    11e6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11ea:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11ee:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11f2:	1ab56663          	bltu	a0,a1,139e <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11f6:	02e8763b          	remuw	a2,a6,a4
    11fa:	1602                	sll	a2,a2,0x20
    11fc:	9201                	srl	a2,a2,0x20
    11fe:	9636                	add	a2,a2,a3
    1200:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1204:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1208:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    120c:	12e86c63          	bltu	a6,a4,1344 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1210:	02e5f63b          	remuw	a2,a1,a4
    1214:	1602                	sll	a2,a2,0x20
    1216:	9201                	srl	a2,a2,0x20
    1218:	9636                	add	a2,a2,a3
    121a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    121e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1222:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1226:	12e5e863          	bltu	a1,a4,1356 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    122a:	02e8763b          	remuw	a2,a6,a4
    122e:	1602                	sll	a2,a2,0x20
    1230:	9201                	srl	a2,a2,0x20
    1232:	9636                	add	a2,a2,a3
    1234:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1238:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    123c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1240:	12e86463          	bltu	a6,a4,1368 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1244:	02e5f63b          	remuw	a2,a1,a4
    1248:	1602                	sll	a2,a2,0x20
    124a:	9201                	srl	a2,a2,0x20
    124c:	9636                	add	a2,a2,a3
    124e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1252:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1256:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    125a:	12e5e063          	bltu	a1,a4,137a <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    125e:	02e8763b          	remuw	a2,a6,a4
    1262:	1602                	sll	a2,a2,0x20
    1264:	9201                	srl	a2,a2,0x20
    1266:	9636                	add	a2,a2,a3
    1268:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    126c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1270:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1274:	0ae86f63          	bltu	a6,a4,1332 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1278:	02e5f63b          	remuw	a2,a1,a4
    127c:	1602                	sll	a2,a2,0x20
    127e:	9201                	srl	a2,a2,0x20
    1280:	9636                	add	a2,a2,a3
    1282:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1286:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    128a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    128e:	0ee5ef63          	bltu	a1,a4,138c <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1292:	02e8763b          	remuw	a2,a6,a4
    1296:	1602                	sll	a2,a2,0x20
    1298:	9201                	srl	a2,a2,0x20
    129a:	9636                	add	a2,a2,a3
    129c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    12a0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    12a4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    12a8:	0ee86d63          	bltu	a6,a4,13a2 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    12ac:	02e5f63b          	remuw	a2,a1,a4
    12b0:	1602                	sll	a2,a2,0x20
    12b2:	9201                	srl	a2,a2,0x20
    12b4:	9636                	add	a2,a2,a3
    12b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    12ba:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    12be:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    12c2:	0ee5e963          	bltu	a1,a4,13b4 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    12c6:	1782                	sll	a5,a5,0x20
    12c8:	9381                	srl	a5,a5,0x20
    12ca:	96be                	add	a3,a3,a5
    12cc:	0006c783          	lbu	a5,0(a3)
    12d0:	4599                	li	a1,6
    12d2:	00f10723          	sb	a5,14(sp)

    if (sign)
    12d6:	00055763          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12e2:	4595                	li	a1,5
    write(f, s, l);
    12e4:	003c                	add	a5,sp,8
    12e6:	4641                	li	a2,16
    12e8:	9e0d                	subw	a2,a2,a1
    12ea:	4505                	li	a0,1
    12ec:	95be                	add	a1,a1,a5
    12ee:	26d000ef          	jal	1d5a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12f2:	70a2                	ld	ra,40(sp)
    12f4:	6145                	add	sp,sp,48
    12f6:	8082                	ret
        x = -xx;
    12f8:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12fc:	02b677bb          	remuw	a5,a2,a1
    1300:	00001697          	auipc	a3,0x1
    1304:	e2068693          	add	a3,a3,-480 # 2120 <digits>
    buf[16] = 0;
    1308:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    130c:	0005871b          	sext.w	a4,a1
    1310:	1782                	sll	a5,a5,0x20
    1312:	9381                	srl	a5,a5,0x20
    1314:	97b6                	add	a5,a5,a3
    1316:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    131a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    131e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1322:	ecb67ae3          	bgeu	a2,a1,11f6 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1326:	02d00793          	li	a5,45
    132a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    132e:	45b9                	li	a1,14
    1330:	bf55                	j	12e4 <printint.constprop.0+0x120>
    1332:	45a9                	li	a1,10
    if (sign)
    1334:	fa0558e3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1338:	02d00793          	li	a5,45
    133c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1340:	45a5                	li	a1,9
    1342:	b74d                	j	12e4 <printint.constprop.0+0x120>
    1344:	45b9                	li	a1,14
    if (sign)
    1346:	f8055fe3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    134a:	02d00793          	li	a5,45
    134e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1352:	45b5                	li	a1,13
    1354:	bf41                	j	12e4 <printint.constprop.0+0x120>
    1356:	45b5                	li	a1,13
    if (sign)
    1358:	f80556e3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    135c:	02d00793          	li	a5,45
    1360:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1364:	45b1                	li	a1,12
    1366:	bfbd                	j	12e4 <printint.constprop.0+0x120>
    1368:	45b1                	li	a1,12
    if (sign)
    136a:	f6055de3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    136e:	02d00793          	li	a5,45
    1372:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1376:	45ad                	li	a1,11
    1378:	b7b5                	j	12e4 <printint.constprop.0+0x120>
    137a:	45ad                	li	a1,11
    if (sign)
    137c:	f60554e3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1380:	02d00793          	li	a5,45
    1384:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1388:	45a9                	li	a1,10
    138a:	bfa9                	j	12e4 <printint.constprop.0+0x120>
    138c:	45a5                	li	a1,9
    if (sign)
    138e:	f4055be3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1392:	02d00793          	li	a5,45
    1396:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    139a:	45a1                	li	a1,8
    139c:	b7a1                	j	12e4 <printint.constprop.0+0x120>
    i = 15;
    139e:	45bd                	li	a1,15
    13a0:	b791                	j	12e4 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    13a2:	45a1                	li	a1,8
    if (sign)
    13a4:	f40550e3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    13a8:	02d00793          	li	a5,45
    13ac:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13b0:	459d                	li	a1,7
    13b2:	bf0d                	j	12e4 <printint.constprop.0+0x120>
    13b4:	459d                	li	a1,7
    if (sign)
    13b6:	f20557e3          	bgez	a0,12e4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    13ba:	02d00793          	li	a5,45
    13be:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    13c2:	4599                	li	a1,6
    13c4:	b705                	j	12e4 <printint.constprop.0+0x120>

00000000000013c6 <getchar>:
{
    13c6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    13c8:	00f10593          	add	a1,sp,15
    13cc:	4605                	li	a2,1
    13ce:	4501                	li	a0,0
{
    13d0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    13d2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    13d6:	17b000ef          	jal	1d50 <read>
}
    13da:	60e2                	ld	ra,24(sp)
    13dc:	00f14503          	lbu	a0,15(sp)
    13e0:	6105                	add	sp,sp,32
    13e2:	8082                	ret

00000000000013e4 <putchar>:
{
    13e4:	1101                	add	sp,sp,-32
    13e6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13e8:	00f10593          	add	a1,sp,15
    13ec:	4605                	li	a2,1
    13ee:	4505                	li	a0,1
{
    13f0:	ec06                	sd	ra,24(sp)
    char byte = c;
    13f2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13f6:	165000ef          	jal	1d5a <write>
}
    13fa:	60e2                	ld	ra,24(sp)
    13fc:	2501                	sext.w	a0,a0
    13fe:	6105                	add	sp,sp,32
    1400:	8082                	ret

0000000000001402 <puts>:
{
    1402:	1141                	add	sp,sp,-16
    1404:	e406                	sd	ra,8(sp)
    1406:	e022                	sd	s0,0(sp)
    1408:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    140a:	574000ef          	jal	197e <strlen>
    140e:	862a                	mv	a2,a0
    1410:	85a2                	mv	a1,s0
    1412:	4505                	li	a0,1
    1414:	147000ef          	jal	1d5a <write>
}
    1418:	60a2                	ld	ra,8(sp)
    141a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    141c:	957d                	sra	a0,a0,0x3f
    return r;
    141e:	2501                	sext.w	a0,a0
}
    1420:	0141                	add	sp,sp,16
    1422:	8082                	ret

0000000000001424 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1424:	7171                	add	sp,sp,-176
    1426:	f85a                	sd	s6,48(sp)
    1428:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    142a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    142c:	18bc                	add	a5,sp,120
{
    142e:	e8ca                	sd	s2,80(sp)
    1430:	e4ce                	sd	s3,72(sp)
    1432:	e0d2                	sd	s4,64(sp)
    1434:	fc56                	sd	s5,56(sp)
    1436:	f486                	sd	ra,104(sp)
    1438:	f0a2                	sd	s0,96(sp)
    143a:	eca6                	sd	s1,88(sp)
    143c:	fcae                	sd	a1,120(sp)
    143e:	e132                	sd	a2,128(sp)
    1440:	e536                	sd	a3,136(sp)
    1442:	e93a                	sd	a4,144(sp)
    1444:	f142                	sd	a6,160(sp)
    1446:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1448:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    144a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    144e:	07300a13          	li	s4,115
    1452:	07800a93          	li	s5,120
    buf[i++] = '0';
    1456:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145a:	00001997          	auipc	s3,0x1
    145e:	cc698993          	add	s3,s3,-826 # 2120 <digits>
        if (!*s)
    1462:	00054783          	lbu	a5,0(a0)
    1466:	16078a63          	beqz	a5,15da <printf+0x1b6>
    146a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    146c:	19278d63          	beq	a5,s2,1606 <printf+0x1e2>
    1470:	00164783          	lbu	a5,1(a2)
    1474:	0605                	add	a2,a2,1
    1476:	fbfd                	bnez	a5,146c <printf+0x48>
    1478:	84b2                	mv	s1,a2
        l = z - a;
    147a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    147e:	85aa                	mv	a1,a0
    1480:	8622                	mv	a2,s0
    1482:	4505                	li	a0,1
    1484:	0d7000ef          	jal	1d5a <write>
        if (l)
    1488:	1a041463          	bnez	s0,1630 <printf+0x20c>
        if (s[1] == 0)
    148c:	0014c783          	lbu	a5,1(s1)
    1490:	14078563          	beqz	a5,15da <printf+0x1b6>
        switch (s[1])
    1494:	1b478063          	beq	a5,s4,1634 <printf+0x210>
    1498:	14fa6b63          	bltu	s4,a5,15ee <printf+0x1ca>
    149c:	06400713          	li	a4,100
    14a0:	1ee78063          	beq	a5,a4,1680 <printf+0x25c>
    14a4:	07000713          	li	a4,112
    14a8:	1ae79963          	bne	a5,a4,165a <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    14ac:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    14ae:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    14b2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    14b4:	631c                	ld	a5,0(a4)
    14b6:	0721                	add	a4,a4,8
    14b8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ba:	00479293          	sll	t0,a5,0x4
    14be:	00879f93          	sll	t6,a5,0x8
    14c2:	00c79f13          	sll	t5,a5,0xc
    14c6:	01079e93          	sll	t4,a5,0x10
    14ca:	01479e13          	sll	t3,a5,0x14
    14ce:	01879313          	sll	t1,a5,0x18
    14d2:	01c79893          	sll	a7,a5,0x1c
    14d6:	02479813          	sll	a6,a5,0x24
    14da:	02879513          	sll	a0,a5,0x28
    14de:	02c79593          	sll	a1,a5,0x2c
    14e2:	03079693          	sll	a3,a5,0x30
    14e6:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ea:	03c7d413          	srl	s0,a5,0x3c
    14ee:	01c7d39b          	srlw	t2,a5,0x1c
    14f2:	03c2d293          	srl	t0,t0,0x3c
    14f6:	03cfdf93          	srl	t6,t6,0x3c
    14fa:	03cf5f13          	srl	t5,t5,0x3c
    14fe:	03cede93          	srl	t4,t4,0x3c
    1502:	03ce5e13          	srl	t3,t3,0x3c
    1506:	03c35313          	srl	t1,t1,0x3c
    150a:	03c8d893          	srl	a7,a7,0x3c
    150e:	03c85813          	srl	a6,a6,0x3c
    1512:	9171                	srl	a0,a0,0x3c
    1514:	91f1                	srl	a1,a1,0x3c
    1516:	92f1                	srl	a3,a3,0x3c
    1518:	9371                	srl	a4,a4,0x3c
    151a:	96ce                	add	a3,a3,s3
    151c:	974e                	add	a4,a4,s3
    151e:	944e                	add	s0,s0,s3
    1520:	92ce                	add	t0,t0,s3
    1522:	9fce                	add	t6,t6,s3
    1524:	9f4e                	add	t5,t5,s3
    1526:	9ece                	add	t4,t4,s3
    1528:	9e4e                	add	t3,t3,s3
    152a:	934e                	add	t1,t1,s3
    152c:	98ce                	add	a7,a7,s3
    152e:	93ce                	add	t2,t2,s3
    1530:	984e                	add	a6,a6,s3
    1532:	954e                	add	a0,a0,s3
    1534:	95ce                	add	a1,a1,s3
    1536:	0006c083          	lbu	ra,0(a3)
    153a:	0002c283          	lbu	t0,0(t0)
    153e:	00074683          	lbu	a3,0(a4)
    1542:	000fcf83          	lbu	t6,0(t6)
    1546:	000f4f03          	lbu	t5,0(t5)
    154a:	000ece83          	lbu	t4,0(t4)
    154e:	000e4e03          	lbu	t3,0(t3)
    1552:	00034303          	lbu	t1,0(t1)
    1556:	0008c883          	lbu	a7,0(a7)
    155a:	0003c383          	lbu	t2,0(t2)
    155e:	00084803          	lbu	a6,0(a6)
    1562:	00054503          	lbu	a0,0(a0)
    1566:	0005c583          	lbu	a1,0(a1)
    156a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    156e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1572:	9371                	srl	a4,a4,0x3c
    1574:	8bbd                	and	a5,a5,15
    1576:	974e                	add	a4,a4,s3
    1578:	97ce                	add	a5,a5,s3
    157a:	005105a3          	sb	t0,11(sp)
    157e:	01f10623          	sb	t6,12(sp)
    1582:	01e106a3          	sb	t5,13(sp)
    1586:	01d10723          	sb	t4,14(sp)
    158a:	01c107a3          	sb	t3,15(sp)
    158e:	00610823          	sb	t1,16(sp)
    1592:	011108a3          	sb	a7,17(sp)
    1596:	00710923          	sb	t2,18(sp)
    159a:	010109a3          	sb	a6,19(sp)
    159e:	00a10a23          	sb	a0,20(sp)
    15a2:	00b10aa3          	sb	a1,21(sp)
    15a6:	00110b23          	sb	ra,22(sp)
    15aa:	00d10ba3          	sb	a3,23(sp)
    15ae:	00810523          	sb	s0,10(sp)
    15b2:	00074703          	lbu	a4,0(a4)
    15b6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    15ba:	002c                	add	a1,sp,8
    15bc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    15be:	00e10c23          	sb	a4,24(sp)
    15c2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    15c6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    15ca:	790000ef          	jal	1d5a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    15ce:	00248513          	add	a0,s1,2
        if (!*s)
    15d2:	00054783          	lbu	a5,0(a0)
    15d6:	e8079ae3          	bnez	a5,146a <printf+0x46>
    }
    va_end(ap);
}
    15da:	70a6                	ld	ra,104(sp)
    15dc:	7406                	ld	s0,96(sp)
    15de:	64e6                	ld	s1,88(sp)
    15e0:	6946                	ld	s2,80(sp)
    15e2:	69a6                	ld	s3,72(sp)
    15e4:	6a06                	ld	s4,64(sp)
    15e6:	7ae2                	ld	s5,56(sp)
    15e8:	7b42                	ld	s6,48(sp)
    15ea:	614d                	add	sp,sp,176
    15ec:	8082                	ret
        switch (s[1])
    15ee:	07579663          	bne	a5,s5,165a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15f2:	6782                	ld	a5,0(sp)
    15f4:	45c1                	li	a1,16
    15f6:	4388                	lw	a0,0(a5)
    15f8:	07a1                	add	a5,a5,8
    15fa:	e03e                	sd	a5,0(sp)
    15fc:	bc9ff0ef          	jal	11c4 <printint.constprop.0>
        s += 2;
    1600:	00248513          	add	a0,s1,2
    1604:	b7f9                	j	15d2 <printf+0x1ae>
    1606:	84b2                	mv	s1,a2
    1608:	a039                	j	1616 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    160a:	0024c783          	lbu	a5,2(s1)
    160e:	0605                	add	a2,a2,1
    1610:	0489                	add	s1,s1,2
    1612:	e72794e3          	bne	a5,s2,147a <printf+0x56>
    1616:	0014c783          	lbu	a5,1(s1)
    161a:	ff2788e3          	beq	a5,s2,160a <printf+0x1e6>
        l = z - a;
    161e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1622:	85aa                	mv	a1,a0
    1624:	8622                	mv	a2,s0
    1626:	4505                	li	a0,1
    1628:	732000ef          	jal	1d5a <write>
        if (l)
    162c:	e60400e3          	beqz	s0,148c <printf+0x68>
    1630:	8526                	mv	a0,s1
    1632:	bd05                	j	1462 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1634:	6782                	ld	a5,0(sp)
    1636:	6380                	ld	s0,0(a5)
    1638:	07a1                	add	a5,a5,8
    163a:	e03e                	sd	a5,0(sp)
    163c:	cc21                	beqz	s0,1694 <printf+0x270>
            l = strnlen(a, 200);
    163e:	0c800593          	li	a1,200
    1642:	8522                	mv	a0,s0
    1644:	424000ef          	jal	1a68 <strnlen>
    write(f, s, l);
    1648:	0005061b          	sext.w	a2,a0
    164c:	85a2                	mv	a1,s0
    164e:	4505                	li	a0,1
    1650:	70a000ef          	jal	1d5a <write>
        s += 2;
    1654:	00248513          	add	a0,s1,2
    1658:	bfad                	j	15d2 <printf+0x1ae>
    return write(stdout, &byte, 1);
    165a:	4605                	li	a2,1
    165c:	002c                	add	a1,sp,8
    165e:	4505                	li	a0,1
    char byte = c;
    1660:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1664:	6f6000ef          	jal	1d5a <write>
    char byte = c;
    1668:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    166c:	4605                	li	a2,1
    166e:	002c                	add	a1,sp,8
    1670:	4505                	li	a0,1
    char byte = c;
    1672:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1676:	6e4000ef          	jal	1d5a <write>
        s += 2;
    167a:	00248513          	add	a0,s1,2
    167e:	bf91                	j	15d2 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1680:	6782                	ld	a5,0(sp)
    1682:	45a9                	li	a1,10
    1684:	4388                	lw	a0,0(a5)
    1686:	07a1                	add	a5,a5,8
    1688:	e03e                	sd	a5,0(sp)
    168a:	b3bff0ef          	jal	11c4 <printint.constprop.0>
        s += 2;
    168e:	00248513          	add	a0,s1,2
    1692:	b781                	j	15d2 <printf+0x1ae>
                a = "(null)";
    1694:	00001417          	auipc	s0,0x1
    1698:	a4c40413          	add	s0,s0,-1460 # 20e0 <__clone+0x128>
    169c:	b74d                	j	163e <printf+0x21a>

000000000000169e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    169e:	1141                	add	sp,sp,-16
    16a0:	e406                	sd	ra,8(sp)
    puts(m);
    16a2:	d61ff0ef          	jal	1402 <puts>
    exit(-100);
}
    16a6:	60a2                	ld	ra,8(sp)
    exit(-100);
    16a8:	f9c00513          	li	a0,-100
}
    16ac:	0141                	add	sp,sp,16
    exit(-100);
    16ae:	a719                	j	1db4 <exit>

00000000000016b0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    16b0:	02000793          	li	a5,32
    16b4:	00f50663          	beq	a0,a5,16c0 <isspace+0x10>
    16b8:	355d                	addw	a0,a0,-9
    16ba:	00553513          	sltiu	a0,a0,5
    16be:	8082                	ret
    16c0:	4505                	li	a0,1
}
    16c2:	8082                	ret

00000000000016c4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    16c4:	fd05051b          	addw	a0,a0,-48
}
    16c8:	00a53513          	sltiu	a0,a0,10
    16cc:	8082                	ret

00000000000016ce <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    16ce:	02000693          	li	a3,32
    16d2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    16d4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    16d8:	ff77871b          	addw	a4,a5,-9
    16dc:	04d78c63          	beq	a5,a3,1734 <atoi+0x66>
    16e0:	0007861b          	sext.w	a2,a5
    16e4:	04e5f863          	bgeu	a1,a4,1734 <atoi+0x66>
        s++;
    switch (*s)
    16e8:	02b00713          	li	a4,43
    16ec:	04e78963          	beq	a5,a4,173e <atoi+0x70>
    16f0:	02d00713          	li	a4,45
    16f4:	06e78263          	beq	a5,a4,1758 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16f8:	fd06069b          	addw	a3,a2,-48
    16fc:	47a5                	li	a5,9
    16fe:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1700:	4301                	li	t1,0
    while (isdigit(*s))
    1702:	04d7e963          	bltu	a5,a3,1754 <atoi+0x86>
    int n = 0, neg = 0;
    1706:	4501                	li	a0,0
    while (isdigit(*s))
    1708:	48a5                	li	a7,9
    170a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    170e:	0025179b          	sllw	a5,a0,0x2
    1712:	9fa9                	addw	a5,a5,a0
    1714:	fd06059b          	addw	a1,a2,-48
    1718:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    171c:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1720:	0705                	add	a4,a4,1
    1722:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1726:	0006861b          	sext.w	a2,a3
    172a:	ff08f0e3          	bgeu	a7,a6,170a <atoi+0x3c>
    return neg ? n : -n;
    172e:	00030563          	beqz	t1,1738 <atoi+0x6a>
}
    1732:	8082                	ret
        s++;
    1734:	0505                	add	a0,a0,1
    1736:	bf79                	j	16d4 <atoi+0x6>
    return neg ? n : -n;
    1738:	40f5853b          	subw	a0,a1,a5
    173c:	8082                	ret
    while (isdigit(*s))
    173e:	00154603          	lbu	a2,1(a0)
    1742:	47a5                	li	a5,9
        s++;
    1744:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1748:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    174c:	4301                	li	t1,0
    while (isdigit(*s))
    174e:	2601                	sext.w	a2,a2
    1750:	fad7fbe3          	bgeu	a5,a3,1706 <atoi+0x38>
    1754:	4501                	li	a0,0
}
    1756:	8082                	ret
    while (isdigit(*s))
    1758:	00154603          	lbu	a2,1(a0)
    175c:	47a5                	li	a5,9
        s++;
    175e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1762:	fd06069b          	addw	a3,a2,-48
    1766:	2601                	sext.w	a2,a2
    1768:	fed7e6e3          	bltu	a5,a3,1754 <atoi+0x86>
        neg = 1;
    176c:	4305                	li	t1,1
    176e:	bf61                	j	1706 <atoi+0x38>

0000000000001770 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1770:	18060163          	beqz	a2,18f2 <memset+0x182>
    1774:	40a006b3          	neg	a3,a0
    1778:	0076f793          	and	a5,a3,7
    177c:	00778813          	add	a6,a5,7
    1780:	48ad                	li	a7,11
    1782:	0ff5f713          	zext.b	a4,a1
    1786:	fff60593          	add	a1,a2,-1
    178a:	17186563          	bltu	a6,a7,18f4 <memset+0x184>
    178e:	1705ed63          	bltu	a1,a6,1908 <memset+0x198>
    1792:	16078363          	beqz	a5,18f8 <memset+0x188>
    1796:	00e50023          	sb	a4,0(a0)
    179a:	0066f593          	and	a1,a3,6
    179e:	16058063          	beqz	a1,18fe <memset+0x18e>
    17a2:	00e500a3          	sb	a4,1(a0)
    17a6:	4589                	li	a1,2
    17a8:	16f5f363          	bgeu	a1,a5,190e <memset+0x19e>
    17ac:	00e50123          	sb	a4,2(a0)
    17b0:	8a91                	and	a3,a3,4
    17b2:	00350593          	add	a1,a0,3
    17b6:	4e0d                	li	t3,3
    17b8:	ce9d                	beqz	a3,17f6 <memset+0x86>
    17ba:	00e501a3          	sb	a4,3(a0)
    17be:	4691                	li	a3,4
    17c0:	00450593          	add	a1,a0,4
    17c4:	4e11                	li	t3,4
    17c6:	02f6f863          	bgeu	a3,a5,17f6 <memset+0x86>
    17ca:	00e50223          	sb	a4,4(a0)
    17ce:	4695                	li	a3,5
    17d0:	00550593          	add	a1,a0,5
    17d4:	4e15                	li	t3,5
    17d6:	02d78063          	beq	a5,a3,17f6 <memset+0x86>
    17da:	fff50693          	add	a3,a0,-1
    17de:	00e502a3          	sb	a4,5(a0)
    17e2:	8a9d                	and	a3,a3,7
    17e4:	00650593          	add	a1,a0,6
    17e8:	4e19                	li	t3,6
    17ea:	e691                	bnez	a3,17f6 <memset+0x86>
    17ec:	00750593          	add	a1,a0,7
    17f0:	00e50323          	sb	a4,6(a0)
    17f4:	4e1d                	li	t3,7
    17f6:	00871693          	sll	a3,a4,0x8
    17fa:	01071813          	sll	a6,a4,0x10
    17fe:	8ed9                	or	a3,a3,a4
    1800:	01871893          	sll	a7,a4,0x18
    1804:	0106e6b3          	or	a3,a3,a6
    1808:	0116e6b3          	or	a3,a3,a7
    180c:	02071813          	sll	a6,a4,0x20
    1810:	02871313          	sll	t1,a4,0x28
    1814:	0106e6b3          	or	a3,a3,a6
    1818:	40f608b3          	sub	a7,a2,a5
    181c:	03071813          	sll	a6,a4,0x30
    1820:	0066e6b3          	or	a3,a3,t1
    1824:	0106e6b3          	or	a3,a3,a6
    1828:	03871313          	sll	t1,a4,0x38
    182c:	97aa                	add	a5,a5,a0
    182e:	ff88f813          	and	a6,a7,-8
    1832:	0066e6b3          	or	a3,a3,t1
    1836:	983e                	add	a6,a6,a5
    1838:	e394                	sd	a3,0(a5)
    183a:	07a1                	add	a5,a5,8
    183c:	ff079ee3          	bne	a5,a6,1838 <memset+0xc8>
    1840:	ff88f793          	and	a5,a7,-8
    1844:	0078f893          	and	a7,a7,7
    1848:	00f586b3          	add	a3,a1,a5
    184c:	01c787bb          	addw	a5,a5,t3
    1850:	0a088b63          	beqz	a7,1906 <memset+0x196>
    1854:	00e68023          	sb	a4,0(a3)
    1858:	0017859b          	addw	a1,a5,1
    185c:	08c5fb63          	bgeu	a1,a2,18f2 <memset+0x182>
    1860:	00e680a3          	sb	a4,1(a3)
    1864:	0027859b          	addw	a1,a5,2
    1868:	08c5f563          	bgeu	a1,a2,18f2 <memset+0x182>
    186c:	00e68123          	sb	a4,2(a3)
    1870:	0037859b          	addw	a1,a5,3
    1874:	06c5ff63          	bgeu	a1,a2,18f2 <memset+0x182>
    1878:	00e681a3          	sb	a4,3(a3)
    187c:	0047859b          	addw	a1,a5,4
    1880:	06c5f963          	bgeu	a1,a2,18f2 <memset+0x182>
    1884:	00e68223          	sb	a4,4(a3)
    1888:	0057859b          	addw	a1,a5,5
    188c:	06c5f363          	bgeu	a1,a2,18f2 <memset+0x182>
    1890:	00e682a3          	sb	a4,5(a3)
    1894:	0067859b          	addw	a1,a5,6
    1898:	04c5fd63          	bgeu	a1,a2,18f2 <memset+0x182>
    189c:	00e68323          	sb	a4,6(a3)
    18a0:	0077859b          	addw	a1,a5,7
    18a4:	04c5f763          	bgeu	a1,a2,18f2 <memset+0x182>
    18a8:	00e683a3          	sb	a4,7(a3)
    18ac:	0087859b          	addw	a1,a5,8
    18b0:	04c5f163          	bgeu	a1,a2,18f2 <memset+0x182>
    18b4:	00e68423          	sb	a4,8(a3)
    18b8:	0097859b          	addw	a1,a5,9
    18bc:	02c5fb63          	bgeu	a1,a2,18f2 <memset+0x182>
    18c0:	00e684a3          	sb	a4,9(a3)
    18c4:	00a7859b          	addw	a1,a5,10
    18c8:	02c5f563          	bgeu	a1,a2,18f2 <memset+0x182>
    18cc:	00e68523          	sb	a4,10(a3)
    18d0:	00b7859b          	addw	a1,a5,11
    18d4:	00c5ff63          	bgeu	a1,a2,18f2 <memset+0x182>
    18d8:	00e685a3          	sb	a4,11(a3)
    18dc:	00c7859b          	addw	a1,a5,12
    18e0:	00c5f963          	bgeu	a1,a2,18f2 <memset+0x182>
    18e4:	00e68623          	sb	a4,12(a3)
    18e8:	27b5                	addw	a5,a5,13
    18ea:	00c7f463          	bgeu	a5,a2,18f2 <memset+0x182>
    18ee:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18f2:	8082                	ret
    18f4:	482d                	li	a6,11
    18f6:	bd61                	j	178e <memset+0x1e>
    char *p = dest;
    18f8:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18fa:	4e01                	li	t3,0
    18fc:	bded                	j	17f6 <memset+0x86>
    18fe:	00150593          	add	a1,a0,1
    1902:	4e05                	li	t3,1
    1904:	bdcd                	j	17f6 <memset+0x86>
    1906:	8082                	ret
    char *p = dest;
    1908:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    190a:	4781                	li	a5,0
    190c:	b7a1                	j	1854 <memset+0xe4>
    190e:	00250593          	add	a1,a0,2
    1912:	4e09                	li	t3,2
    1914:	b5cd                	j	17f6 <memset+0x86>

0000000000001916 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1916:	00054783          	lbu	a5,0(a0)
    191a:	0005c703          	lbu	a4,0(a1)
    191e:	00e79863          	bne	a5,a4,192e <strcmp+0x18>
    1922:	0505                	add	a0,a0,1
    1924:	0585                	add	a1,a1,1
    1926:	fbe5                	bnez	a5,1916 <strcmp>
    1928:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    192a:	9d19                	subw	a0,a0,a4
    192c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    192e:	0007851b          	sext.w	a0,a5
    1932:	bfe5                	j	192a <strcmp+0x14>

0000000000001934 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1934:	ca15                	beqz	a2,1968 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1936:	00054783          	lbu	a5,0(a0)
    if (!n--)
    193a:	167d                	add	a2,a2,-1
    193c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1940:	eb99                	bnez	a5,1956 <strncmp+0x22>
    1942:	a815                	j	1976 <strncmp+0x42>
    1944:	00a68e63          	beq	a3,a0,1960 <strncmp+0x2c>
    1948:	0505                	add	a0,a0,1
    194a:	00f71b63          	bne	a4,a5,1960 <strncmp+0x2c>
    194e:	00054783          	lbu	a5,0(a0)
    1952:	cf89                	beqz	a5,196c <strncmp+0x38>
    1954:	85b2                	mv	a1,a2
    1956:	0005c703          	lbu	a4,0(a1)
    195a:	00158613          	add	a2,a1,1
    195e:	f37d                	bnez	a4,1944 <strncmp+0x10>
        ;
    return *l - *r;
    1960:	0007851b          	sext.w	a0,a5
    1964:	9d19                	subw	a0,a0,a4
    1966:	8082                	ret
        return 0;
    1968:	4501                	li	a0,0
}
    196a:	8082                	ret
    return *l - *r;
    196c:	0015c703          	lbu	a4,1(a1)
    1970:	4501                	li	a0,0
    1972:	9d19                	subw	a0,a0,a4
    1974:	8082                	ret
    1976:	0005c703          	lbu	a4,0(a1)
    197a:	4501                	li	a0,0
    197c:	b7e5                	j	1964 <strncmp+0x30>

000000000000197e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    197e:	00757793          	and	a5,a0,7
    1982:	cf89                	beqz	a5,199c <strlen+0x1e>
    1984:	87aa                	mv	a5,a0
    1986:	a029                	j	1990 <strlen+0x12>
    1988:	0785                	add	a5,a5,1
    198a:	0077f713          	and	a4,a5,7
    198e:	cb01                	beqz	a4,199e <strlen+0x20>
        if (!*s)
    1990:	0007c703          	lbu	a4,0(a5)
    1994:	fb75                	bnez	a4,1988 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1996:	40a78533          	sub	a0,a5,a0
}
    199a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    199c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    199e:	6394                	ld	a3,0(a5)
    19a0:	00000597          	auipc	a1,0x0
    19a4:	7485b583          	ld	a1,1864(a1) # 20e8 <__clone+0x130>
    19a8:	00000617          	auipc	a2,0x0
    19ac:	74863603          	ld	a2,1864(a2) # 20f0 <__clone+0x138>
    19b0:	a019                	j	19b6 <strlen+0x38>
    19b2:	6794                	ld	a3,8(a5)
    19b4:	07a1                	add	a5,a5,8
    19b6:	00b68733          	add	a4,a3,a1
    19ba:	fff6c693          	not	a3,a3
    19be:	8f75                	and	a4,a4,a3
    19c0:	8f71                	and	a4,a4,a2
    19c2:	db65                	beqz	a4,19b2 <strlen+0x34>
    for (; *s; s++)
    19c4:	0007c703          	lbu	a4,0(a5)
    19c8:	d779                	beqz	a4,1996 <strlen+0x18>
    19ca:	0017c703          	lbu	a4,1(a5)
    19ce:	0785                	add	a5,a5,1
    19d0:	d379                	beqz	a4,1996 <strlen+0x18>
    19d2:	0017c703          	lbu	a4,1(a5)
    19d6:	0785                	add	a5,a5,1
    19d8:	fb6d                	bnez	a4,19ca <strlen+0x4c>
    19da:	bf75                	j	1996 <strlen+0x18>

00000000000019dc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19dc:	00757713          	and	a4,a0,7
{
    19e0:	87aa                	mv	a5,a0
    19e2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19e6:	cb19                	beqz	a4,19fc <memchr+0x20>
    19e8:	ce25                	beqz	a2,1a60 <memchr+0x84>
    19ea:	0007c703          	lbu	a4,0(a5)
    19ee:	00b70763          	beq	a4,a1,19fc <memchr+0x20>
    19f2:	0785                	add	a5,a5,1
    19f4:	0077f713          	and	a4,a5,7
    19f8:	167d                	add	a2,a2,-1
    19fa:	f77d                	bnez	a4,19e8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19fc:	4501                	li	a0,0
    if (n && *s != c)
    19fe:	c235                	beqz	a2,1a62 <memchr+0x86>
    1a00:	0007c703          	lbu	a4,0(a5)
    1a04:	06b70063          	beq	a4,a1,1a64 <memchr+0x88>
        size_t k = ONES * c;
    1a08:	00000517          	auipc	a0,0x0
    1a0c:	6f053503          	ld	a0,1776(a0) # 20f8 <__clone+0x140>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a10:	471d                	li	a4,7
        size_t k = ONES * c;
    1a12:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a16:	04c77763          	bgeu	a4,a2,1a64 <memchr+0x88>
    1a1a:	00000897          	auipc	a7,0x0
    1a1e:	6ce8b883          	ld	a7,1742(a7) # 20e8 <__clone+0x130>
    1a22:	00000817          	auipc	a6,0x0
    1a26:	6ce83803          	ld	a6,1742(a6) # 20f0 <__clone+0x138>
    1a2a:	431d                	li	t1,7
    1a2c:	a029                	j	1a36 <memchr+0x5a>
    1a2e:	1661                	add	a2,a2,-8
    1a30:	07a1                	add	a5,a5,8
    1a32:	00c37c63          	bgeu	t1,a2,1a4a <memchr+0x6e>
    1a36:	6398                	ld	a4,0(a5)
    1a38:	8f29                	xor	a4,a4,a0
    1a3a:	011706b3          	add	a3,a4,a7
    1a3e:	fff74713          	not	a4,a4
    1a42:	8f75                	and	a4,a4,a3
    1a44:	01077733          	and	a4,a4,a6
    1a48:	d37d                	beqz	a4,1a2e <memchr+0x52>
    1a4a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a4c:	e601                	bnez	a2,1a54 <memchr+0x78>
    1a4e:	a809                	j	1a60 <memchr+0x84>
    1a50:	0505                	add	a0,a0,1
    1a52:	c619                	beqz	a2,1a60 <memchr+0x84>
    1a54:	00054783          	lbu	a5,0(a0)
    1a58:	167d                	add	a2,a2,-1
    1a5a:	feb79be3          	bne	a5,a1,1a50 <memchr+0x74>
    1a5e:	8082                	ret
    return n ? (void *)s : 0;
    1a60:	4501                	li	a0,0
}
    1a62:	8082                	ret
    if (n && *s != c)
    1a64:	853e                	mv	a0,a5
    1a66:	b7fd                	j	1a54 <memchr+0x78>

0000000000001a68 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a68:	1101                	add	sp,sp,-32
    1a6a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a6c:	862e                	mv	a2,a1
{
    1a6e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a70:	4581                	li	a1,0
{
    1a72:	e426                	sd	s1,8(sp)
    1a74:	ec06                	sd	ra,24(sp)
    1a76:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a78:	f65ff0ef          	jal	19dc <memchr>
    return p ? p - s : n;
    1a7c:	c519                	beqz	a0,1a8a <strnlen+0x22>
}
    1a7e:	60e2                	ld	ra,24(sp)
    1a80:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a82:	8d05                	sub	a0,a0,s1
}
    1a84:	64a2                	ld	s1,8(sp)
    1a86:	6105                	add	sp,sp,32
    1a88:	8082                	ret
    1a8a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a8c:	8522                	mv	a0,s0
}
    1a8e:	6442                	ld	s0,16(sp)
    1a90:	64a2                	ld	s1,8(sp)
    1a92:	6105                	add	sp,sp,32
    1a94:	8082                	ret

0000000000001a96 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a96:	00a5c7b3          	xor	a5,a1,a0
    1a9a:	8b9d                	and	a5,a5,7
    1a9c:	eb95                	bnez	a5,1ad0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a9e:	0075f793          	and	a5,a1,7
    1aa2:	e7b1                	bnez	a5,1aee <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aa4:	6198                	ld	a4,0(a1)
    1aa6:	00000617          	auipc	a2,0x0
    1aaa:	64263603          	ld	a2,1602(a2) # 20e8 <__clone+0x130>
    1aae:	00000817          	auipc	a6,0x0
    1ab2:	64283803          	ld	a6,1602(a6) # 20f0 <__clone+0x138>
    1ab6:	a029                	j	1ac0 <strcpy+0x2a>
    1ab8:	05a1                	add	a1,a1,8
    1aba:	e118                	sd	a4,0(a0)
    1abc:	6198                	ld	a4,0(a1)
    1abe:	0521                	add	a0,a0,8
    1ac0:	00c707b3          	add	a5,a4,a2
    1ac4:	fff74693          	not	a3,a4
    1ac8:	8ff5                	and	a5,a5,a3
    1aca:	0107f7b3          	and	a5,a5,a6
    1ace:	d7ed                	beqz	a5,1ab8 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ad0:	0005c783          	lbu	a5,0(a1)
    1ad4:	00f50023          	sb	a5,0(a0)
    1ad8:	c785                	beqz	a5,1b00 <strcpy+0x6a>
    1ada:	0015c783          	lbu	a5,1(a1)
    1ade:	0505                	add	a0,a0,1
    1ae0:	0585                	add	a1,a1,1
    1ae2:	00f50023          	sb	a5,0(a0)
    1ae6:	fbf5                	bnez	a5,1ada <strcpy+0x44>
        ;
    return d;
}
    1ae8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aea:	0505                	add	a0,a0,1
    1aec:	df45                	beqz	a4,1aa4 <strcpy+0xe>
            if (!(*d = *s))
    1aee:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1af2:	0585                	add	a1,a1,1
    1af4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1af8:	00f50023          	sb	a5,0(a0)
    1afc:	f7fd                	bnez	a5,1aea <strcpy+0x54>
}
    1afe:	8082                	ret
    1b00:	8082                	ret

0000000000001b02 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b02:	00a5c7b3          	xor	a5,a1,a0
    1b06:	8b9d                	and	a5,a5,7
    1b08:	e3b5                	bnez	a5,1b6c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b0a:	0075f793          	and	a5,a1,7
    1b0e:	cf99                	beqz	a5,1b2c <strncpy+0x2a>
    1b10:	ea09                	bnez	a2,1b22 <strncpy+0x20>
    1b12:	a421                	j	1d1a <strncpy+0x218>
    1b14:	0585                	add	a1,a1,1
    1b16:	0075f793          	and	a5,a1,7
    1b1a:	167d                	add	a2,a2,-1
    1b1c:	0505                	add	a0,a0,1
    1b1e:	c799                	beqz	a5,1b2c <strncpy+0x2a>
    1b20:	c225                	beqz	a2,1b80 <strncpy+0x7e>
    1b22:	0005c783          	lbu	a5,0(a1)
    1b26:	00f50023          	sb	a5,0(a0)
    1b2a:	f7ed                	bnez	a5,1b14 <strncpy+0x12>
            ;
        if (!n || !*s)
    1b2c:	ca31                	beqz	a2,1b80 <strncpy+0x7e>
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	cba1                	beqz	a5,1b82 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b34:	479d                	li	a5,7
    1b36:	02c7fc63          	bgeu	a5,a2,1b6e <strncpy+0x6c>
    1b3a:	00000897          	auipc	a7,0x0
    1b3e:	5ae8b883          	ld	a7,1454(a7) # 20e8 <__clone+0x130>
    1b42:	00000817          	auipc	a6,0x0
    1b46:	5ae83803          	ld	a6,1454(a6) # 20f0 <__clone+0x138>
    1b4a:	431d                	li	t1,7
    1b4c:	a039                	j	1b5a <strncpy+0x58>
            *wd = *ws;
    1b4e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b50:	1661                	add	a2,a2,-8
    1b52:	05a1                	add	a1,a1,8
    1b54:	0521                	add	a0,a0,8
    1b56:	00c37b63          	bgeu	t1,a2,1b6c <strncpy+0x6a>
    1b5a:	6198                	ld	a4,0(a1)
    1b5c:	011707b3          	add	a5,a4,a7
    1b60:	fff74693          	not	a3,a4
    1b64:	8ff5                	and	a5,a5,a3
    1b66:	0107f7b3          	and	a5,a5,a6
    1b6a:	d3f5                	beqz	a5,1b4e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b6c:	ca11                	beqz	a2,1b80 <strncpy+0x7e>
    1b6e:	0005c783          	lbu	a5,0(a1)
    1b72:	0585                	add	a1,a1,1
    1b74:	00f50023          	sb	a5,0(a0)
    1b78:	c789                	beqz	a5,1b82 <strncpy+0x80>
    1b7a:	167d                	add	a2,a2,-1
    1b7c:	0505                	add	a0,a0,1
    1b7e:	fa65                	bnez	a2,1b6e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b80:	8082                	ret
    1b82:	4805                	li	a6,1
    1b84:	14061b63          	bnez	a2,1cda <strncpy+0x1d8>
    1b88:	40a00733          	neg	a4,a0
    1b8c:	00777793          	and	a5,a4,7
    1b90:	4581                	li	a1,0
    1b92:	12061c63          	bnez	a2,1cca <strncpy+0x1c8>
    1b96:	00778693          	add	a3,a5,7
    1b9a:	48ad                	li	a7,11
    1b9c:	1316e563          	bltu	a3,a7,1cc6 <strncpy+0x1c4>
    1ba0:	16d5e263          	bltu	a1,a3,1d04 <strncpy+0x202>
    1ba4:	14078c63          	beqz	a5,1cfc <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ba8:	00050023          	sb	zero,0(a0)
    1bac:	00677693          	and	a3,a4,6
    1bb0:	14068263          	beqz	a3,1cf4 <strncpy+0x1f2>
    1bb4:	000500a3          	sb	zero,1(a0)
    1bb8:	4689                	li	a3,2
    1bba:	14f6f863          	bgeu	a3,a5,1d0a <strncpy+0x208>
    1bbe:	00050123          	sb	zero,2(a0)
    1bc2:	8b11                	and	a4,a4,4
    1bc4:	12070463          	beqz	a4,1cec <strncpy+0x1ea>
    1bc8:	000501a3          	sb	zero,3(a0)
    1bcc:	4711                	li	a4,4
    1bce:	00450693          	add	a3,a0,4
    1bd2:	02f77563          	bgeu	a4,a5,1bfc <strncpy+0xfa>
    1bd6:	00050223          	sb	zero,4(a0)
    1bda:	4715                	li	a4,5
    1bdc:	00550693          	add	a3,a0,5
    1be0:	00e78e63          	beq	a5,a4,1bfc <strncpy+0xfa>
    1be4:	fff50713          	add	a4,a0,-1
    1be8:	000502a3          	sb	zero,5(a0)
    1bec:	8b1d                	and	a4,a4,7
    1bee:	12071263          	bnez	a4,1d12 <strncpy+0x210>
    1bf2:	00750693          	add	a3,a0,7
    1bf6:	00050323          	sb	zero,6(a0)
    1bfa:	471d                	li	a4,7
    1bfc:	40f80833          	sub	a6,a6,a5
    1c00:	ff887593          	and	a1,a6,-8
    1c04:	97aa                	add	a5,a5,a0
    1c06:	95be                	add	a1,a1,a5
    1c08:	0007b023          	sd	zero,0(a5)
    1c0c:	07a1                	add	a5,a5,8
    1c0e:	feb79de3          	bne	a5,a1,1c08 <strncpy+0x106>
    1c12:	ff887593          	and	a1,a6,-8
    1c16:	00787813          	and	a6,a6,7
    1c1a:	00e587bb          	addw	a5,a1,a4
    1c1e:	00b68733          	add	a4,a3,a1
    1c22:	0e080063          	beqz	a6,1d02 <strncpy+0x200>
    1c26:	00070023          	sb	zero,0(a4)
    1c2a:	0017869b          	addw	a3,a5,1
    1c2e:	f4c6f9e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c32:	000700a3          	sb	zero,1(a4)
    1c36:	0027869b          	addw	a3,a5,2
    1c3a:	f4c6f3e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c3e:	00070123          	sb	zero,2(a4)
    1c42:	0037869b          	addw	a3,a5,3
    1c46:	f2c6fde3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c4a:	000701a3          	sb	zero,3(a4)
    1c4e:	0047869b          	addw	a3,a5,4
    1c52:	f2c6f7e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c56:	00070223          	sb	zero,4(a4)
    1c5a:	0057869b          	addw	a3,a5,5
    1c5e:	f2c6f1e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c62:	000702a3          	sb	zero,5(a4)
    1c66:	0067869b          	addw	a3,a5,6
    1c6a:	f0c6fbe3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c6e:	00070323          	sb	zero,6(a4)
    1c72:	0077869b          	addw	a3,a5,7
    1c76:	f0c6f5e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c7a:	000703a3          	sb	zero,7(a4)
    1c7e:	0087869b          	addw	a3,a5,8
    1c82:	eec6ffe3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c86:	00070423          	sb	zero,8(a4)
    1c8a:	0097869b          	addw	a3,a5,9
    1c8e:	eec6f9e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c92:	000704a3          	sb	zero,9(a4)
    1c96:	00a7869b          	addw	a3,a5,10
    1c9a:	eec6f3e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1c9e:	00070523          	sb	zero,10(a4)
    1ca2:	00b7869b          	addw	a3,a5,11
    1ca6:	ecc6fde3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1caa:	000705a3          	sb	zero,11(a4)
    1cae:	00c7869b          	addw	a3,a5,12
    1cb2:	ecc6f7e3          	bgeu	a3,a2,1b80 <strncpy+0x7e>
    1cb6:	00070623          	sb	zero,12(a4)
    1cba:	27b5                	addw	a5,a5,13
    1cbc:	ecc7f2e3          	bgeu	a5,a2,1b80 <strncpy+0x7e>
    1cc0:	000706a3          	sb	zero,13(a4)
}
    1cc4:	8082                	ret
    1cc6:	46ad                	li	a3,11
    1cc8:	bde1                	j	1ba0 <strncpy+0x9e>
    1cca:	00778693          	add	a3,a5,7
    1cce:	48ad                	li	a7,11
    1cd0:	fff60593          	add	a1,a2,-1
    1cd4:	ed16f6e3          	bgeu	a3,a7,1ba0 <strncpy+0x9e>
    1cd8:	b7fd                	j	1cc6 <strncpy+0x1c4>
    1cda:	40a00733          	neg	a4,a0
    1cde:	8832                	mv	a6,a2
    1ce0:	00777793          	and	a5,a4,7
    1ce4:	4581                	li	a1,0
    1ce6:	ea0608e3          	beqz	a2,1b96 <strncpy+0x94>
    1cea:	b7c5                	j	1cca <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cec:	00350693          	add	a3,a0,3
    1cf0:	470d                	li	a4,3
    1cf2:	b729                	j	1bfc <strncpy+0xfa>
    1cf4:	00150693          	add	a3,a0,1
    1cf8:	4705                	li	a4,1
    1cfa:	b709                	j	1bfc <strncpy+0xfa>
tail:
    1cfc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cfe:	4701                	li	a4,0
    1d00:	bdf5                	j	1bfc <strncpy+0xfa>
    1d02:	8082                	ret
tail:
    1d04:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d06:	4781                	li	a5,0
    1d08:	bf39                	j	1c26 <strncpy+0x124>
    1d0a:	00250693          	add	a3,a0,2
    1d0e:	4709                	li	a4,2
    1d10:	b5f5                	j	1bfc <strncpy+0xfa>
    1d12:	00650693          	add	a3,a0,6
    1d16:	4719                	li	a4,6
    1d18:	b5d5                	j	1bfc <strncpy+0xfa>
    1d1a:	8082                	ret

0000000000001d1c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d1c:	87aa                	mv	a5,a0
    1d1e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d20:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d2a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <openat>:
    register long a7 __asm__("a7") = n;
    1d34:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d38:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d3c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <close>:
    register long a7 __asm__("a7") = n;
    1d44:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d48:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <read>:
    register long a7 __asm__("a7") = n;
    1d50:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d54:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d58:	8082                	ret

0000000000001d5a <write>:
    register long a7 __asm__("a7") = n;
    1d5a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d62:	8082                	ret

0000000000001d64 <getpid>:
    register long a7 __asm__("a7") = n;
    1d64:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d68:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <getppid>:
    register long a7 __asm__("a7") = n;
    1d70:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d74:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d7c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d80:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <fork>:
    register long a7 __asm__("a7") = n;
    1d88:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d8c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d90:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d98:	85b2                	mv	a1,a2
    1d9a:	863a                	mv	a2,a4
    if (stack)
    1d9c:	c191                	beqz	a1,1da0 <clone+0x8>
	stack += stack_size;
    1d9e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1da0:	4781                	li	a5,0
    1da2:	4701                	li	a4,0
    1da4:	4681                	li	a3,0
    1da6:	2601                	sext.w	a2,a2
    1da8:	ac01                	j	1fb8 <__clone>

0000000000001daa <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1daa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dae:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1db2:	8082                	ret

0000000000001db4 <exit>:
    register long a7 __asm__("a7") = n;
    1db4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1db8:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dbc:	8082                	ret

0000000000001dbe <waitpid>:
    register long a7 __asm__("a7") = n;
    1dbe:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dc2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <exec>:
    register long a7 __asm__("a7") = n;
    1dcc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dd0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <execve>:
    register long a7 __asm__("a7") = n;
    1dd8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <times>:
    register long a7 __asm__("a7") = n;
    1de4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1de8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <get_time>:

int64 get_time()
{
    1df0:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1df2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1df6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1df8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfa:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dfe:	2501                	sext.w	a0,a0
    1e00:	ed09                	bnez	a0,1e1a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e02:	67a2                	ld	a5,8(sp)
    1e04:	3e800713          	li	a4,1000
    1e08:	00015503          	lhu	a0,0(sp)
    1e0c:	02e7d7b3          	divu	a5,a5,a4
    1e10:	02e50533          	mul	a0,a0,a4
    1e14:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e16:	0141                	add	sp,sp,16
    1e18:	8082                	ret
        return -1;
    1e1a:	557d                	li	a0,-1
    1e1c:	bfed                	j	1e16 <get_time+0x26>

0000000000001e1e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e1e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e22:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <time>:
    register long a7 __asm__("a7") = n;
    1e2a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <sleep>:

int sleep(unsigned long long time)
{
    1e36:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e38:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e3a:	850a                	mv	a0,sp
    1e3c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e3e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e42:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e48:	e501                	bnez	a0,1e50 <sleep+0x1a>
    return 0;
    1e4a:	4501                	li	a0,0
}
    1e4c:	0141                	add	sp,sp,16
    1e4e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e50:	4502                	lw	a0,0(sp)
}
    1e52:	0141                	add	sp,sp,16
    1e54:	8082                	ret

0000000000001e56 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e56:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e62:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e66:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e6a:	8082                	ret

0000000000001e6c <mprotect>:
    register long a7 __asm__("a7") = n;
    1e6c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <munmap>:
    register long a7 __asm__("a7") = n;
    1e78:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <wait>:

int wait(int *code)
{
    1e84:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e86:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e8a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e8c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e8e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e90:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <spawn>:
    register long a7 __asm__("a7") = n;
    1e98:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e9c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <mailread>:
    register long a7 __asm__("a7") = n;
    1ea4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eb0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <fstat>:
    register long a7 __asm__("a7") = n;
    1ebc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1ec8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eca:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1ece:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ed8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1eda:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ede:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ee8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eea:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eee:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <link>:

int link(char *old_path, char *new_path)
{
    1ef8:	87aa                	mv	a5,a0
    1efa:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1efc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f00:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f04:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f06:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f0a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <unlink>:

int unlink(char *path)
{
    1f14:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f16:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f1a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f1e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f20:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <uname>:
    register long a7 __asm__("a7") = n;
    1f28:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f2c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <brk>:
    register long a7 __asm__("a7") = n;
    1f34:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f38:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f40:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f42:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f46:	8082                	ret

0000000000001f48 <chdir>:
    register long a7 __asm__("a7") = n;
    1f48:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f4c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f54:	862e                	mv	a2,a1
    1f56:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f58:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f5a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f64:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f66:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f6a:	2501                	sext.w	a0,a0
    1f6c:	8082                	ret

0000000000001f6e <getdents>:
    register long a7 __asm__("a7") = n;
    1f6e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f72:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <pipe>:
    register long a7 __asm__("a7") = n;
    1f7a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f7e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f80:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret

0000000000001f88 <dup>:
    register long a7 __asm__("a7") = n;
    1f88:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f8a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret

0000000000001f92 <dup2>:
    register long a7 __asm__("a7") = n;
    1f92:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f94:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f96:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <mount>:
    register long a7 __asm__("a7") = n;
    1f9e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <umount>:
    register long a7 __asm__("a7") = n;
    1faa:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fb4:	2501                	sext.w	a0,a0
    1fb6:	8082                	ret

0000000000001fb8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fb8:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1fba:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fbc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fbe:	8532                	mv	a0,a2
	mv a2, a4
    1fc0:	863a                	mv	a2,a4
	mv a3, a5
    1fc2:	86be                	mv	a3,a5
	mv a4, a6
    1fc4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fc6:	0dc00893          	li	a7,220
	ecall
    1fca:	00000073          	ecall

	beqz a0, 1f
    1fce:	c111                	beqz	a0,1fd2 <__clone+0x1a>
	# Parent
	ret
    1fd0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fd2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fd4:	6522                	ld	a0,8(sp)
	jalr a1
    1fd6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fd8:	05d00893          	li	a7,93
	ecall
    1fdc:	00000073          	ecall
