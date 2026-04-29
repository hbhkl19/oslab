
/home/hbh/oslab/oslab/user/build/riscv64/unlinkat_dirfd_relative:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa79                	j	11a0 <__start_main>

0000000000001004 <test_unlinkat_dirfd_relative>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_unlinkat_dirfd_relative(void)
{
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	fd250513          	add	a0,a0,-46 # 1fd8 <__clone+0x2a>
{
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	3e4000ef          	jal	13f8 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0e850513          	add	a0,a0,232 # 2100 <__func__.0>
    1020:	3d8000ef          	jal	13f8 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fcc50513          	add	a0,a0,-52 # 1ff0 <__clone+0x42>
    102c:	3cc000ef          	jal	13f8 <puts>

    int ret = mkdir("unlinkat_base", 0666);
    1030:	1b600593          	li	a1,438
    1034:	00001517          	auipc	a0,0x1
    1038:	fcc50513          	add	a0,a0,-52 # 2000 <__clone+0x52>
    103c:	70f000ef          	jal	1f4a <mkdir>
    1040:	842a                	mv	s0,a0
    printf("mkdir base ret: %d\n", ret);
    1042:	85aa                	mv	a1,a0
    1044:	00001517          	auipc	a0,0x1
    1048:	fcc50513          	add	a0,a0,-52 # 2010 <__clone+0x62>
    104c:	3ce000ef          	jal	141a <printf>
    assert(ret == 0 || ret == -1);
    1050:	2405                	addw	s0,s0,1
    1052:	4785                	li	a5,1
    1054:	0087f863          	bgeu	a5,s0,1064 <test_unlinkat_dirfd_relative+0x60>
    1058:	00001517          	auipc	a0,0x1
    105c:	fd050513          	add	a0,a0,-48 # 2028 <__clone+0x7a>
    1060:	634000ef          	jal	1694 <panic>

    int dfd = open("unlinkat_base", O_RDONLY | O_DIRECTORY);
    1064:	002005b7          	lui	a1,0x200
    1068:	00001517          	auipc	a0,0x1
    106c:	f9850513          	add	a0,a0,-104 # 2000 <__clone+0x52>
    1070:	4a3000ef          	jal	1d12 <open>
    1074:	842a                	mv	s0,a0
    printf("dir fd: %d\n", dfd);
    1076:	85aa                	mv	a1,a0
    1078:	00001517          	auipc	a0,0x1
    107c:	fd050513          	add	a0,a0,-48 # 2048 <__clone+0x9a>
    1080:	39a000ef          	jal	141a <printf>
    assert(dfd > 0);
    1084:	0e805f63          	blez	s0,1182 <test_unlinkat_dirfd_relative+0x17e>

    int fd = openat(dfd, "gone", O_CREATE | O_RDWR);
    1088:	00001597          	auipc	a1,0x1
    108c:	fd058593          	add	a1,a1,-48 # 2058 <__clone+0xaa>
    1090:	04200613          	li	a2,66
    1094:	8522                	mv	a0,s0
    1096:	495000ef          	jal	1d2a <openat>
    109a:	84aa                	mv	s1,a0
    printf("create fd: %d\n", fd);
    109c:	85aa                	mv	a1,a0
    109e:	00001517          	auipc	a0,0x1
    10a2:	fc250513          	add	a0,a0,-62 # 2060 <__clone+0xb2>
    10a6:	374000ef          	jal	141a <printf>
    assert(fd > 0);
    10aa:	0c905563          	blez	s1,1174 <test_unlinkat_dirfd_relative+0x170>
    close(fd);
    10ae:	8526                	mv	a0,s1
    10b0:	48b000ef          	jal	1d3a <close>

    ret = sys_unlinkat(dfd, "gone", 0);
    10b4:	00001597          	auipc	a1,0x1
    10b8:	fa458593          	add	a1,a1,-92 # 2058 <__clone+0xaa>
    10bc:	4601                	li	a2,0
    10be:	8522                	mv	a0,s0
    10c0:	61f000ef          	jal	1ede <sys_unlinkat>
    10c4:	84aa                	mv	s1,a0
    printf("unlinkat ret: %d\n", ret);
    10c6:	85aa                	mv	a1,a0
    10c8:	00001517          	auipc	a0,0x1
    10cc:	fa850513          	add	a0,a0,-88 # 2070 <__clone+0xc2>
    10d0:	34a000ef          	jal	141a <printf>
    assert(ret == 0);
    10d4:	e8c9                	bnez	s1,1166 <test_unlinkat_dirfd_relative+0x162>
    close(dfd);
    10d6:	8522                	mv	a0,s0
    10d8:	463000ef          	jal	1d3a <close>

    ret = chdir("unlinkat_base");
    10dc:	00001517          	auipc	a0,0x1
    10e0:	f2450513          	add	a0,a0,-220 # 2000 <__clone+0x52>
    10e4:	65b000ef          	jal	1f3e <chdir>
    10e8:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    10ea:	85aa                	mv	a1,a0
    10ec:	00001517          	auipc	a0,0x1
    10f0:	f9c50513          	add	a0,a0,-100 # 2088 <__clone+0xda>
    10f4:	326000ef          	jal	141a <printf>
    assert(ret == 0);
    10f8:	e025                	bnez	s0,1158 <test_unlinkat_dirfd_relative+0x154>

    fd = open("gone", O_RDONLY);
    10fa:	4581                	li	a1,0
    10fc:	00001517          	auipc	a0,0x1
    1100:	f5c50513          	add	a0,a0,-164 # 2058 <__clone+0xaa>
    1104:	40f000ef          	jal	1d12 <open>
    1108:	842a                	mv	s0,a0
    if(fd < 0) {
    110a:	04054063          	bltz	a0,114a <test_unlinkat_dirfd_relative+0x146>
        printf("dirfd unlinkat success.\n");
    } else {
        printf("dirfd unlinkat failed.\n");
    110e:	00001517          	auipc	a0,0x1
    1112:	faa50513          	add	a0,a0,-86 # 20b8 <__clone+0x10a>
    1116:	304000ef          	jal	141a <printf>
        close(fd);
    111a:	8522                	mv	a0,s0
    111c:	41f000ef          	jal	1d3a <close>
    }

    TEST_END(__func__);
    1120:	00001517          	auipc	a0,0x1
    1124:	fb050513          	add	a0,a0,-80 # 20d0 <__clone+0x122>
    1128:	2d0000ef          	jal	13f8 <puts>
    112c:	00001517          	auipc	a0,0x1
    1130:	fd450513          	add	a0,a0,-44 # 2100 <__func__.0>
    1134:	2c4000ef          	jal	13f8 <puts>
}
    1138:	6442                	ld	s0,16(sp)
    113a:	60e2                	ld	ra,24(sp)
    113c:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    113e:	00001517          	auipc	a0,0x1
    1142:	eb250513          	add	a0,a0,-334 # 1ff0 <__clone+0x42>
}
    1146:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1148:	ac45                	j	13f8 <puts>
        printf("dirfd unlinkat success.\n");
    114a:	00001517          	auipc	a0,0x1
    114e:	f4e50513          	add	a0,a0,-178 # 2098 <__clone+0xea>
    1152:	2c8000ef          	jal	141a <printf>
    1156:	b7e9                	j	1120 <test_unlinkat_dirfd_relative+0x11c>
    assert(ret == 0);
    1158:	00001517          	auipc	a0,0x1
    115c:	ed050513          	add	a0,a0,-304 # 2028 <__clone+0x7a>
    1160:	534000ef          	jal	1694 <panic>
    1164:	bf59                	j	10fa <test_unlinkat_dirfd_relative+0xf6>
    assert(ret == 0);
    1166:	00001517          	auipc	a0,0x1
    116a:	ec250513          	add	a0,a0,-318 # 2028 <__clone+0x7a>
    116e:	526000ef          	jal	1694 <panic>
    1172:	b795                	j	10d6 <test_unlinkat_dirfd_relative+0xd2>
    assert(fd > 0);
    1174:	00001517          	auipc	a0,0x1
    1178:	eb450513          	add	a0,a0,-332 # 2028 <__clone+0x7a>
    117c:	518000ef          	jal	1694 <panic>
    1180:	b73d                	j	10ae <test_unlinkat_dirfd_relative+0xaa>
    assert(dfd > 0);
    1182:	00001517          	auipc	a0,0x1
    1186:	ea650513          	add	a0,a0,-346 # 2028 <__clone+0x7a>
    118a:	50a000ef          	jal	1694 <panic>
    118e:	bded                	j	1088 <test_unlinkat_dirfd_relative+0x84>

0000000000001190 <main>:

int main(void)
{
    1190:	1141                	add	sp,sp,-16
    1192:	e406                	sd	ra,8(sp)
    test_unlinkat_dirfd_relative();
    1194:	e71ff0ef          	jal	1004 <test_unlinkat_dirfd_relative>
    return 0;
}
    1198:	60a2                	ld	ra,8(sp)
    119a:	4501                	li	a0,0
    119c:	0141                	add	sp,sp,16
    119e:	8082                	ret

00000000000011a0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    11a0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    11a2:	4108                	lw	a0,0(a0)
{
    11a4:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    11a6:	05a1                	add	a1,a1,8
{
    11a8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    11aa:	fe7ff0ef          	jal	1190 <main>
    11ae:	3fd000ef          	jal	1daa <exit>
	return 0;
}
    11b2:	60a2                	ld	ra,8(sp)
    11b4:	4501                	li	a0,0
    11b6:	0141                	add	sp,sp,16
    11b8:	8082                	ret

00000000000011ba <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    11ba:	7179                	add	sp,sp,-48
    11bc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    11be:	12054863          	bltz	a0,12ee <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    11c2:	02b577bb          	remuw	a5,a0,a1
    11c6:	00001697          	auipc	a3,0x1
    11ca:	f5a68693          	add	a3,a3,-166 # 2120 <digits>
    buf[16] = 0;
    11ce:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11d2:	0005871b          	sext.w	a4,a1
    11d6:	1782                	sll	a5,a5,0x20
    11d8:	9381                	srl	a5,a5,0x20
    11da:	97b6                	add	a5,a5,a3
    11dc:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11e0:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11e4:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11e8:	1ab56663          	bltu	a0,a1,1394 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11ec:	02e8763b          	remuw	a2,a6,a4
    11f0:	1602                	sll	a2,a2,0x20
    11f2:	9201                	srl	a2,a2,0x20
    11f4:	9636                	add	a2,a2,a3
    11f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fa:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fe:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1202:	12e86c63          	bltu	a6,a4,133a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1206:	02e5f63b          	remuw	a2,a1,a4
    120a:	1602                	sll	a2,a2,0x20
    120c:	9201                	srl	a2,a2,0x20
    120e:	9636                	add	a2,a2,a3
    1210:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1214:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1218:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    121c:	12e5e863          	bltu	a1,a4,134c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1220:	02e8763b          	remuw	a2,a6,a4
    1224:	1602                	sll	a2,a2,0x20
    1226:	9201                	srl	a2,a2,0x20
    1228:	9636                	add	a2,a2,a3
    122a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1232:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1236:	12e86463          	bltu	a6,a4,135e <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    123a:	02e5f63b          	remuw	a2,a1,a4
    123e:	1602                	sll	a2,a2,0x20
    1240:	9201                	srl	a2,a2,0x20
    1242:	9636                	add	a2,a2,a3
    1244:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1248:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    124c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1250:	12e5e063          	bltu	a1,a4,1370 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1254:	02e8763b          	remuw	a2,a6,a4
    1258:	1602                	sll	a2,a2,0x20
    125a:	9201                	srl	a2,a2,0x20
    125c:	9636                	add	a2,a2,a3
    125e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1262:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1266:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    126a:	0ae86f63          	bltu	a6,a4,1328 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    126e:	02e5f63b          	remuw	a2,a1,a4
    1272:	1602                	sll	a2,a2,0x20
    1274:	9201                	srl	a2,a2,0x20
    1276:	9636                	add	a2,a2,a3
    1278:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    127c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1280:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1284:	0ee5ef63          	bltu	a1,a4,1382 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1288:	02e8763b          	remuw	a2,a6,a4
    128c:	1602                	sll	a2,a2,0x20
    128e:	9201                	srl	a2,a2,0x20
    1290:	9636                	add	a2,a2,a3
    1292:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1296:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    129a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    129e:	0ee86d63          	bltu	a6,a4,1398 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    12a2:	02e5f63b          	remuw	a2,a1,a4
    12a6:	1602                	sll	a2,a2,0x20
    12a8:	9201                	srl	a2,a2,0x20
    12aa:	9636                	add	a2,a2,a3
    12ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    12b0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    12b4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    12b8:	0ee5e963          	bltu	a1,a4,13aa <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    12bc:	1782                	sll	a5,a5,0x20
    12be:	9381                	srl	a5,a5,0x20
    12c0:	96be                	add	a3,a3,a5
    12c2:	0006c783          	lbu	a5,0(a3)
    12c6:	4599                	li	a1,6
    12c8:	00f10723          	sb	a5,14(sp)

    if (sign)
    12cc:	00055763          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d0:	02d00793          	li	a5,45
    12d4:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12d8:	4595                	li	a1,5
    write(f, s, l);
    12da:	003c                	add	a5,sp,8
    12dc:	4641                	li	a2,16
    12de:	9e0d                	subw	a2,a2,a1
    12e0:	4505                	li	a0,1
    12e2:	95be                	add	a1,a1,a5
    12e4:	26d000ef          	jal	1d50 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12e8:	70a2                	ld	ra,40(sp)
    12ea:	6145                	add	sp,sp,48
    12ec:	8082                	ret
        x = -xx;
    12ee:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12f2:	02b677bb          	remuw	a5,a2,a1
    12f6:	00001697          	auipc	a3,0x1
    12fa:	e2a68693          	add	a3,a3,-470 # 2120 <digits>
    buf[16] = 0;
    12fe:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1302:	0005871b          	sext.w	a4,a1
    1306:	1782                	sll	a5,a5,0x20
    1308:	9381                	srl	a5,a5,0x20
    130a:	97b6                	add	a5,a5,a3
    130c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1310:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1314:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1318:	ecb67ae3          	bgeu	a2,a1,11ec <printint.constprop.0+0x32>
        buf[i--] = '-';
    131c:	02d00793          	li	a5,45
    1320:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1324:	45b9                	li	a1,14
    1326:	bf55                	j	12da <printint.constprop.0+0x120>
    1328:	45a9                	li	a1,10
    if (sign)
    132a:	fa0558e3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    132e:	02d00793          	li	a5,45
    1332:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1336:	45a5                	li	a1,9
    1338:	b74d                	j	12da <printint.constprop.0+0x120>
    133a:	45b9                	li	a1,14
    if (sign)
    133c:	f8055fe3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    1340:	02d00793          	li	a5,45
    1344:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1348:	45b5                	li	a1,13
    134a:	bf41                	j	12da <printint.constprop.0+0x120>
    134c:	45b5                	li	a1,13
    if (sign)
    134e:	f80556e3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    1352:	02d00793          	li	a5,45
    1356:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    135a:	45b1                	li	a1,12
    135c:	bfbd                	j	12da <printint.constprop.0+0x120>
    135e:	45b1                	li	a1,12
    if (sign)
    1360:	f6055de3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    1364:	02d00793          	li	a5,45
    1368:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    136c:	45ad                	li	a1,11
    136e:	b7b5                	j	12da <printint.constprop.0+0x120>
    1370:	45ad                	li	a1,11
    if (sign)
    1372:	f60554e3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    1376:	02d00793          	li	a5,45
    137a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    137e:	45a9                	li	a1,10
    1380:	bfa9                	j	12da <printint.constprop.0+0x120>
    1382:	45a5                	li	a1,9
    if (sign)
    1384:	f4055be3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    1388:	02d00793          	li	a5,45
    138c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1390:	45a1                	li	a1,8
    1392:	b7a1                	j	12da <printint.constprop.0+0x120>
    i = 15;
    1394:	45bd                	li	a1,15
    1396:	b791                	j	12da <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1398:	45a1                	li	a1,8
    if (sign)
    139a:	f40550e3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    139e:	02d00793          	li	a5,45
    13a2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13a6:	459d                	li	a1,7
    13a8:	bf0d                	j	12da <printint.constprop.0+0x120>
    13aa:	459d                	li	a1,7
    if (sign)
    13ac:	f20557e3          	bgez	a0,12da <printint.constprop.0+0x120>
        buf[i--] = '-';
    13b0:	02d00793          	li	a5,45
    13b4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    13b8:	4599                	li	a1,6
    13ba:	b705                	j	12da <printint.constprop.0+0x120>

00000000000013bc <getchar>:
{
    13bc:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    13be:	00f10593          	add	a1,sp,15
    13c2:	4605                	li	a2,1
    13c4:	4501                	li	a0,0
{
    13c6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    13c8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    13cc:	17b000ef          	jal	1d46 <read>
}
    13d0:	60e2                	ld	ra,24(sp)
    13d2:	00f14503          	lbu	a0,15(sp)
    13d6:	6105                	add	sp,sp,32
    13d8:	8082                	ret

00000000000013da <putchar>:
{
    13da:	1101                	add	sp,sp,-32
    13dc:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13de:	00f10593          	add	a1,sp,15
    13e2:	4605                	li	a2,1
    13e4:	4505                	li	a0,1
{
    13e6:	ec06                	sd	ra,24(sp)
    char byte = c;
    13e8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13ec:	165000ef          	jal	1d50 <write>
}
    13f0:	60e2                	ld	ra,24(sp)
    13f2:	2501                	sext.w	a0,a0
    13f4:	6105                	add	sp,sp,32
    13f6:	8082                	ret

00000000000013f8 <puts>:
{
    13f8:	1141                	add	sp,sp,-16
    13fa:	e406                	sd	ra,8(sp)
    13fc:	e022                	sd	s0,0(sp)
    13fe:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1400:	574000ef          	jal	1974 <strlen>
    1404:	862a                	mv	a2,a0
    1406:	85a2                	mv	a1,s0
    1408:	4505                	li	a0,1
    140a:	147000ef          	jal	1d50 <write>
}
    140e:	60a2                	ld	ra,8(sp)
    1410:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1412:	957d                	sra	a0,a0,0x3f
    return r;
    1414:	2501                	sext.w	a0,a0
}
    1416:	0141                	add	sp,sp,16
    1418:	8082                	ret

000000000000141a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    141a:	7171                	add	sp,sp,-176
    141c:	f85a                	sd	s6,48(sp)
    141e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1420:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1422:	18bc                	add	a5,sp,120
{
    1424:	e8ca                	sd	s2,80(sp)
    1426:	e4ce                	sd	s3,72(sp)
    1428:	e0d2                	sd	s4,64(sp)
    142a:	fc56                	sd	s5,56(sp)
    142c:	f486                	sd	ra,104(sp)
    142e:	f0a2                	sd	s0,96(sp)
    1430:	eca6                	sd	s1,88(sp)
    1432:	fcae                	sd	a1,120(sp)
    1434:	e132                	sd	a2,128(sp)
    1436:	e536                	sd	a3,136(sp)
    1438:	e93a                	sd	a4,144(sp)
    143a:	f142                	sd	a6,160(sp)
    143c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    143e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1440:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1444:	07300a13          	li	s4,115
    1448:	07800a93          	li	s5,120
    buf[i++] = '0';
    144c:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1450:	00001997          	auipc	s3,0x1
    1454:	cd098993          	add	s3,s3,-816 # 2120 <digits>
        if (!*s)
    1458:	00054783          	lbu	a5,0(a0)
    145c:	16078a63          	beqz	a5,15d0 <printf+0x1b6>
    1460:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1462:	19278d63          	beq	a5,s2,15fc <printf+0x1e2>
    1466:	00164783          	lbu	a5,1(a2)
    146a:	0605                	add	a2,a2,1
    146c:	fbfd                	bnez	a5,1462 <printf+0x48>
    146e:	84b2                	mv	s1,a2
        l = z - a;
    1470:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1474:	85aa                	mv	a1,a0
    1476:	8622                	mv	a2,s0
    1478:	4505                	li	a0,1
    147a:	0d7000ef          	jal	1d50 <write>
        if (l)
    147e:	1a041463          	bnez	s0,1626 <printf+0x20c>
        if (s[1] == 0)
    1482:	0014c783          	lbu	a5,1(s1)
    1486:	14078563          	beqz	a5,15d0 <printf+0x1b6>
        switch (s[1])
    148a:	1b478063          	beq	a5,s4,162a <printf+0x210>
    148e:	14fa6b63          	bltu	s4,a5,15e4 <printf+0x1ca>
    1492:	06400713          	li	a4,100
    1496:	1ee78063          	beq	a5,a4,1676 <printf+0x25c>
    149a:	07000713          	li	a4,112
    149e:	1ae79963          	bne	a5,a4,1650 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    14a2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    14a4:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    14a8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    14aa:	631c                	ld	a5,0(a4)
    14ac:	0721                	add	a4,a4,8
    14ae:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b0:	00479293          	sll	t0,a5,0x4
    14b4:	00879f93          	sll	t6,a5,0x8
    14b8:	00c79f13          	sll	t5,a5,0xc
    14bc:	01079e93          	sll	t4,a5,0x10
    14c0:	01479e13          	sll	t3,a5,0x14
    14c4:	01879313          	sll	t1,a5,0x18
    14c8:	01c79893          	sll	a7,a5,0x1c
    14cc:	02479813          	sll	a6,a5,0x24
    14d0:	02879513          	sll	a0,a5,0x28
    14d4:	02c79593          	sll	a1,a5,0x2c
    14d8:	03079693          	sll	a3,a5,0x30
    14dc:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e0:	03c7d413          	srl	s0,a5,0x3c
    14e4:	01c7d39b          	srlw	t2,a5,0x1c
    14e8:	03c2d293          	srl	t0,t0,0x3c
    14ec:	03cfdf93          	srl	t6,t6,0x3c
    14f0:	03cf5f13          	srl	t5,t5,0x3c
    14f4:	03cede93          	srl	t4,t4,0x3c
    14f8:	03ce5e13          	srl	t3,t3,0x3c
    14fc:	03c35313          	srl	t1,t1,0x3c
    1500:	03c8d893          	srl	a7,a7,0x3c
    1504:	03c85813          	srl	a6,a6,0x3c
    1508:	9171                	srl	a0,a0,0x3c
    150a:	91f1                	srl	a1,a1,0x3c
    150c:	92f1                	srl	a3,a3,0x3c
    150e:	9371                	srl	a4,a4,0x3c
    1510:	96ce                	add	a3,a3,s3
    1512:	974e                	add	a4,a4,s3
    1514:	944e                	add	s0,s0,s3
    1516:	92ce                	add	t0,t0,s3
    1518:	9fce                	add	t6,t6,s3
    151a:	9f4e                	add	t5,t5,s3
    151c:	9ece                	add	t4,t4,s3
    151e:	9e4e                	add	t3,t3,s3
    1520:	934e                	add	t1,t1,s3
    1522:	98ce                	add	a7,a7,s3
    1524:	93ce                	add	t2,t2,s3
    1526:	984e                	add	a6,a6,s3
    1528:	954e                	add	a0,a0,s3
    152a:	95ce                	add	a1,a1,s3
    152c:	0006c083          	lbu	ra,0(a3)
    1530:	0002c283          	lbu	t0,0(t0)
    1534:	00074683          	lbu	a3,0(a4)
    1538:	000fcf83          	lbu	t6,0(t6)
    153c:	000f4f03          	lbu	t5,0(t5)
    1540:	000ece83          	lbu	t4,0(t4)
    1544:	000e4e03          	lbu	t3,0(t3)
    1548:	00034303          	lbu	t1,0(t1)
    154c:	0008c883          	lbu	a7,0(a7)
    1550:	0003c383          	lbu	t2,0(t2)
    1554:	00084803          	lbu	a6,0(a6)
    1558:	00054503          	lbu	a0,0(a0)
    155c:	0005c583          	lbu	a1,0(a1)
    1560:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1564:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1568:	9371                	srl	a4,a4,0x3c
    156a:	8bbd                	and	a5,a5,15
    156c:	974e                	add	a4,a4,s3
    156e:	97ce                	add	a5,a5,s3
    1570:	005105a3          	sb	t0,11(sp)
    1574:	01f10623          	sb	t6,12(sp)
    1578:	01e106a3          	sb	t5,13(sp)
    157c:	01d10723          	sb	t4,14(sp)
    1580:	01c107a3          	sb	t3,15(sp)
    1584:	00610823          	sb	t1,16(sp)
    1588:	011108a3          	sb	a7,17(sp)
    158c:	00710923          	sb	t2,18(sp)
    1590:	010109a3          	sb	a6,19(sp)
    1594:	00a10a23          	sb	a0,20(sp)
    1598:	00b10aa3          	sb	a1,21(sp)
    159c:	00110b23          	sb	ra,22(sp)
    15a0:	00d10ba3          	sb	a3,23(sp)
    15a4:	00810523          	sb	s0,10(sp)
    15a8:	00074703          	lbu	a4,0(a4)
    15ac:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    15b0:	002c                	add	a1,sp,8
    15b2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    15b4:	00e10c23          	sb	a4,24(sp)
    15b8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    15bc:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    15c0:	790000ef          	jal	1d50 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    15c4:	00248513          	add	a0,s1,2
        if (!*s)
    15c8:	00054783          	lbu	a5,0(a0)
    15cc:	e8079ae3          	bnez	a5,1460 <printf+0x46>
    }
    va_end(ap);
}
    15d0:	70a6                	ld	ra,104(sp)
    15d2:	7406                	ld	s0,96(sp)
    15d4:	64e6                	ld	s1,88(sp)
    15d6:	6946                	ld	s2,80(sp)
    15d8:	69a6                	ld	s3,72(sp)
    15da:	6a06                	ld	s4,64(sp)
    15dc:	7ae2                	ld	s5,56(sp)
    15de:	7b42                	ld	s6,48(sp)
    15e0:	614d                	add	sp,sp,176
    15e2:	8082                	ret
        switch (s[1])
    15e4:	07579663          	bne	a5,s5,1650 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15e8:	6782                	ld	a5,0(sp)
    15ea:	45c1                	li	a1,16
    15ec:	4388                	lw	a0,0(a5)
    15ee:	07a1                	add	a5,a5,8
    15f0:	e03e                	sd	a5,0(sp)
    15f2:	bc9ff0ef          	jal	11ba <printint.constprop.0>
        s += 2;
    15f6:	00248513          	add	a0,s1,2
    15fa:	b7f9                	j	15c8 <printf+0x1ae>
    15fc:	84b2                	mv	s1,a2
    15fe:	a039                	j	160c <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1600:	0024c783          	lbu	a5,2(s1)
    1604:	0605                	add	a2,a2,1
    1606:	0489                	add	s1,s1,2
    1608:	e72794e3          	bne	a5,s2,1470 <printf+0x56>
    160c:	0014c783          	lbu	a5,1(s1)
    1610:	ff2788e3          	beq	a5,s2,1600 <printf+0x1e6>
        l = z - a;
    1614:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1618:	85aa                	mv	a1,a0
    161a:	8622                	mv	a2,s0
    161c:	4505                	li	a0,1
    161e:	732000ef          	jal	1d50 <write>
        if (l)
    1622:	e60400e3          	beqz	s0,1482 <printf+0x68>
    1626:	8526                	mv	a0,s1
    1628:	bd05                	j	1458 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    162a:	6782                	ld	a5,0(sp)
    162c:	6380                	ld	s0,0(a5)
    162e:	07a1                	add	a5,a5,8
    1630:	e03e                	sd	a5,0(sp)
    1632:	cc21                	beqz	s0,168a <printf+0x270>
            l = strnlen(a, 200);
    1634:	0c800593          	li	a1,200
    1638:	8522                	mv	a0,s0
    163a:	424000ef          	jal	1a5e <strnlen>
    write(f, s, l);
    163e:	0005061b          	sext.w	a2,a0
    1642:	85a2                	mv	a1,s0
    1644:	4505                	li	a0,1
    1646:	70a000ef          	jal	1d50 <write>
        s += 2;
    164a:	00248513          	add	a0,s1,2
    164e:	bfad                	j	15c8 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1650:	4605                	li	a2,1
    1652:	002c                	add	a1,sp,8
    1654:	4505                	li	a0,1
    char byte = c;
    1656:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    165a:	6f6000ef          	jal	1d50 <write>
    char byte = c;
    165e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1662:	4605                	li	a2,1
    1664:	002c                	add	a1,sp,8
    1666:	4505                	li	a0,1
    char byte = c;
    1668:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    166c:	6e4000ef          	jal	1d50 <write>
        s += 2;
    1670:	00248513          	add	a0,s1,2
    1674:	bf91                	j	15c8 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1676:	6782                	ld	a5,0(sp)
    1678:	45a9                	li	a1,10
    167a:	4388                	lw	a0,0(a5)
    167c:	07a1                	add	a5,a5,8
    167e:	e03e                	sd	a5,0(sp)
    1680:	b3bff0ef          	jal	11ba <printint.constprop.0>
        s += 2;
    1684:	00248513          	add	a0,s1,2
    1688:	b781                	j	15c8 <printf+0x1ae>
                a = "(null)";
    168a:	00001417          	auipc	s0,0x1
    168e:	a5640413          	add	s0,s0,-1450 # 20e0 <__clone+0x132>
    1692:	b74d                	j	1634 <printf+0x21a>

0000000000001694 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1694:	1141                	add	sp,sp,-16
    1696:	e406                	sd	ra,8(sp)
    puts(m);
    1698:	d61ff0ef          	jal	13f8 <puts>
    exit(-100);
}
    169c:	60a2                	ld	ra,8(sp)
    exit(-100);
    169e:	f9c00513          	li	a0,-100
}
    16a2:	0141                	add	sp,sp,16
    exit(-100);
    16a4:	a719                	j	1daa <exit>

00000000000016a6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    16a6:	02000793          	li	a5,32
    16aa:	00f50663          	beq	a0,a5,16b6 <isspace+0x10>
    16ae:	355d                	addw	a0,a0,-9
    16b0:	00553513          	sltiu	a0,a0,5
    16b4:	8082                	ret
    16b6:	4505                	li	a0,1
}
    16b8:	8082                	ret

00000000000016ba <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    16ba:	fd05051b          	addw	a0,a0,-48
}
    16be:	00a53513          	sltiu	a0,a0,10
    16c2:	8082                	ret

00000000000016c4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    16c4:	02000693          	li	a3,32
    16c8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    16ca:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    16ce:	ff77871b          	addw	a4,a5,-9
    16d2:	04d78c63          	beq	a5,a3,172a <atoi+0x66>
    16d6:	0007861b          	sext.w	a2,a5
    16da:	04e5f863          	bgeu	a1,a4,172a <atoi+0x66>
        s++;
    switch (*s)
    16de:	02b00713          	li	a4,43
    16e2:	04e78963          	beq	a5,a4,1734 <atoi+0x70>
    16e6:	02d00713          	li	a4,45
    16ea:	06e78263          	beq	a5,a4,174e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16ee:	fd06069b          	addw	a3,a2,-48
    16f2:	47a5                	li	a5,9
    16f4:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16f6:	4301                	li	t1,0
    while (isdigit(*s))
    16f8:	04d7e963          	bltu	a5,a3,174a <atoi+0x86>
    int n = 0, neg = 0;
    16fc:	4501                	li	a0,0
    while (isdigit(*s))
    16fe:	48a5                	li	a7,9
    1700:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1704:	0025179b          	sllw	a5,a0,0x2
    1708:	9fa9                	addw	a5,a5,a0
    170a:	fd06059b          	addw	a1,a2,-48
    170e:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1712:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1716:	0705                	add	a4,a4,1
    1718:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    171c:	0006861b          	sext.w	a2,a3
    1720:	ff08f0e3          	bgeu	a7,a6,1700 <atoi+0x3c>
    return neg ? n : -n;
    1724:	00030563          	beqz	t1,172e <atoi+0x6a>
}
    1728:	8082                	ret
        s++;
    172a:	0505                	add	a0,a0,1
    172c:	bf79                	j	16ca <atoi+0x6>
    return neg ? n : -n;
    172e:	40f5853b          	subw	a0,a1,a5
    1732:	8082                	ret
    while (isdigit(*s))
    1734:	00154603          	lbu	a2,1(a0)
    1738:	47a5                	li	a5,9
        s++;
    173a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    173e:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1742:	4301                	li	t1,0
    while (isdigit(*s))
    1744:	2601                	sext.w	a2,a2
    1746:	fad7fbe3          	bgeu	a5,a3,16fc <atoi+0x38>
    174a:	4501                	li	a0,0
}
    174c:	8082                	ret
    while (isdigit(*s))
    174e:	00154603          	lbu	a2,1(a0)
    1752:	47a5                	li	a5,9
        s++;
    1754:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1758:	fd06069b          	addw	a3,a2,-48
    175c:	2601                	sext.w	a2,a2
    175e:	fed7e6e3          	bltu	a5,a3,174a <atoi+0x86>
        neg = 1;
    1762:	4305                	li	t1,1
    1764:	bf61                	j	16fc <atoi+0x38>

0000000000001766 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1766:	18060163          	beqz	a2,18e8 <memset+0x182>
    176a:	40a006b3          	neg	a3,a0
    176e:	0076f793          	and	a5,a3,7
    1772:	00778813          	add	a6,a5,7
    1776:	48ad                	li	a7,11
    1778:	0ff5f713          	zext.b	a4,a1
    177c:	fff60593          	add	a1,a2,-1
    1780:	17186563          	bltu	a6,a7,18ea <memset+0x184>
    1784:	1705ed63          	bltu	a1,a6,18fe <memset+0x198>
    1788:	16078363          	beqz	a5,18ee <memset+0x188>
    178c:	00e50023          	sb	a4,0(a0)
    1790:	0066f593          	and	a1,a3,6
    1794:	16058063          	beqz	a1,18f4 <memset+0x18e>
    1798:	00e500a3          	sb	a4,1(a0)
    179c:	4589                	li	a1,2
    179e:	16f5f363          	bgeu	a1,a5,1904 <memset+0x19e>
    17a2:	00e50123          	sb	a4,2(a0)
    17a6:	8a91                	and	a3,a3,4
    17a8:	00350593          	add	a1,a0,3
    17ac:	4e0d                	li	t3,3
    17ae:	ce9d                	beqz	a3,17ec <memset+0x86>
    17b0:	00e501a3          	sb	a4,3(a0)
    17b4:	4691                	li	a3,4
    17b6:	00450593          	add	a1,a0,4
    17ba:	4e11                	li	t3,4
    17bc:	02f6f863          	bgeu	a3,a5,17ec <memset+0x86>
    17c0:	00e50223          	sb	a4,4(a0)
    17c4:	4695                	li	a3,5
    17c6:	00550593          	add	a1,a0,5
    17ca:	4e15                	li	t3,5
    17cc:	02d78063          	beq	a5,a3,17ec <memset+0x86>
    17d0:	fff50693          	add	a3,a0,-1
    17d4:	00e502a3          	sb	a4,5(a0)
    17d8:	8a9d                	and	a3,a3,7
    17da:	00650593          	add	a1,a0,6
    17de:	4e19                	li	t3,6
    17e0:	e691                	bnez	a3,17ec <memset+0x86>
    17e2:	00750593          	add	a1,a0,7
    17e6:	00e50323          	sb	a4,6(a0)
    17ea:	4e1d                	li	t3,7
    17ec:	00871693          	sll	a3,a4,0x8
    17f0:	01071813          	sll	a6,a4,0x10
    17f4:	8ed9                	or	a3,a3,a4
    17f6:	01871893          	sll	a7,a4,0x18
    17fa:	0106e6b3          	or	a3,a3,a6
    17fe:	0116e6b3          	or	a3,a3,a7
    1802:	02071813          	sll	a6,a4,0x20
    1806:	02871313          	sll	t1,a4,0x28
    180a:	0106e6b3          	or	a3,a3,a6
    180e:	40f608b3          	sub	a7,a2,a5
    1812:	03071813          	sll	a6,a4,0x30
    1816:	0066e6b3          	or	a3,a3,t1
    181a:	0106e6b3          	or	a3,a3,a6
    181e:	03871313          	sll	t1,a4,0x38
    1822:	97aa                	add	a5,a5,a0
    1824:	ff88f813          	and	a6,a7,-8
    1828:	0066e6b3          	or	a3,a3,t1
    182c:	983e                	add	a6,a6,a5
    182e:	e394                	sd	a3,0(a5)
    1830:	07a1                	add	a5,a5,8
    1832:	ff079ee3          	bne	a5,a6,182e <memset+0xc8>
    1836:	ff88f793          	and	a5,a7,-8
    183a:	0078f893          	and	a7,a7,7
    183e:	00f586b3          	add	a3,a1,a5
    1842:	01c787bb          	addw	a5,a5,t3
    1846:	0a088b63          	beqz	a7,18fc <memset+0x196>
    184a:	00e68023          	sb	a4,0(a3)
    184e:	0017859b          	addw	a1,a5,1
    1852:	08c5fb63          	bgeu	a1,a2,18e8 <memset+0x182>
    1856:	00e680a3          	sb	a4,1(a3)
    185a:	0027859b          	addw	a1,a5,2
    185e:	08c5f563          	bgeu	a1,a2,18e8 <memset+0x182>
    1862:	00e68123          	sb	a4,2(a3)
    1866:	0037859b          	addw	a1,a5,3
    186a:	06c5ff63          	bgeu	a1,a2,18e8 <memset+0x182>
    186e:	00e681a3          	sb	a4,3(a3)
    1872:	0047859b          	addw	a1,a5,4
    1876:	06c5f963          	bgeu	a1,a2,18e8 <memset+0x182>
    187a:	00e68223          	sb	a4,4(a3)
    187e:	0057859b          	addw	a1,a5,5
    1882:	06c5f363          	bgeu	a1,a2,18e8 <memset+0x182>
    1886:	00e682a3          	sb	a4,5(a3)
    188a:	0067859b          	addw	a1,a5,6
    188e:	04c5fd63          	bgeu	a1,a2,18e8 <memset+0x182>
    1892:	00e68323          	sb	a4,6(a3)
    1896:	0077859b          	addw	a1,a5,7
    189a:	04c5f763          	bgeu	a1,a2,18e8 <memset+0x182>
    189e:	00e683a3          	sb	a4,7(a3)
    18a2:	0087859b          	addw	a1,a5,8
    18a6:	04c5f163          	bgeu	a1,a2,18e8 <memset+0x182>
    18aa:	00e68423          	sb	a4,8(a3)
    18ae:	0097859b          	addw	a1,a5,9
    18b2:	02c5fb63          	bgeu	a1,a2,18e8 <memset+0x182>
    18b6:	00e684a3          	sb	a4,9(a3)
    18ba:	00a7859b          	addw	a1,a5,10
    18be:	02c5f563          	bgeu	a1,a2,18e8 <memset+0x182>
    18c2:	00e68523          	sb	a4,10(a3)
    18c6:	00b7859b          	addw	a1,a5,11
    18ca:	00c5ff63          	bgeu	a1,a2,18e8 <memset+0x182>
    18ce:	00e685a3          	sb	a4,11(a3)
    18d2:	00c7859b          	addw	a1,a5,12
    18d6:	00c5f963          	bgeu	a1,a2,18e8 <memset+0x182>
    18da:	00e68623          	sb	a4,12(a3)
    18de:	27b5                	addw	a5,a5,13
    18e0:	00c7f463          	bgeu	a5,a2,18e8 <memset+0x182>
    18e4:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18e8:	8082                	ret
    18ea:	482d                	li	a6,11
    18ec:	bd61                	j	1784 <memset+0x1e>
    char *p = dest;
    18ee:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18f0:	4e01                	li	t3,0
    18f2:	bded                	j	17ec <memset+0x86>
    18f4:	00150593          	add	a1,a0,1
    18f8:	4e05                	li	t3,1
    18fa:	bdcd                	j	17ec <memset+0x86>
    18fc:	8082                	ret
    char *p = dest;
    18fe:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1900:	4781                	li	a5,0
    1902:	b7a1                	j	184a <memset+0xe4>
    1904:	00250593          	add	a1,a0,2
    1908:	4e09                	li	t3,2
    190a:	b5cd                	j	17ec <memset+0x86>

000000000000190c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    190c:	00054783          	lbu	a5,0(a0)
    1910:	0005c703          	lbu	a4,0(a1)
    1914:	00e79863          	bne	a5,a4,1924 <strcmp+0x18>
    1918:	0505                	add	a0,a0,1
    191a:	0585                	add	a1,a1,1
    191c:	fbe5                	bnez	a5,190c <strcmp>
    191e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1920:	9d19                	subw	a0,a0,a4
    1922:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1924:	0007851b          	sext.w	a0,a5
    1928:	bfe5                	j	1920 <strcmp+0x14>

000000000000192a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    192a:	ca15                	beqz	a2,195e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    192c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1930:	167d                	add	a2,a2,-1
    1932:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1936:	eb99                	bnez	a5,194c <strncmp+0x22>
    1938:	a815                	j	196c <strncmp+0x42>
    193a:	00a68e63          	beq	a3,a0,1956 <strncmp+0x2c>
    193e:	0505                	add	a0,a0,1
    1940:	00f71b63          	bne	a4,a5,1956 <strncmp+0x2c>
    1944:	00054783          	lbu	a5,0(a0)
    1948:	cf89                	beqz	a5,1962 <strncmp+0x38>
    194a:	85b2                	mv	a1,a2
    194c:	0005c703          	lbu	a4,0(a1)
    1950:	00158613          	add	a2,a1,1
    1954:	f37d                	bnez	a4,193a <strncmp+0x10>
        ;
    return *l - *r;
    1956:	0007851b          	sext.w	a0,a5
    195a:	9d19                	subw	a0,a0,a4
    195c:	8082                	ret
        return 0;
    195e:	4501                	li	a0,0
}
    1960:	8082                	ret
    return *l - *r;
    1962:	0015c703          	lbu	a4,1(a1)
    1966:	4501                	li	a0,0
    1968:	9d19                	subw	a0,a0,a4
    196a:	8082                	ret
    196c:	0005c703          	lbu	a4,0(a1)
    1970:	4501                	li	a0,0
    1972:	b7e5                	j	195a <strncmp+0x30>

0000000000001974 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1974:	00757793          	and	a5,a0,7
    1978:	cf89                	beqz	a5,1992 <strlen+0x1e>
    197a:	87aa                	mv	a5,a0
    197c:	a029                	j	1986 <strlen+0x12>
    197e:	0785                	add	a5,a5,1
    1980:	0077f713          	and	a4,a5,7
    1984:	cb01                	beqz	a4,1994 <strlen+0x20>
        if (!*s)
    1986:	0007c703          	lbu	a4,0(a5)
    198a:	fb75                	bnez	a4,197e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    198c:	40a78533          	sub	a0,a5,a0
}
    1990:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1992:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1994:	6394                	ld	a3,0(a5)
    1996:	00000597          	auipc	a1,0x0
    199a:	7525b583          	ld	a1,1874(a1) # 20e8 <__clone+0x13a>
    199e:	00000617          	auipc	a2,0x0
    19a2:	75263603          	ld	a2,1874(a2) # 20f0 <__clone+0x142>
    19a6:	a019                	j	19ac <strlen+0x38>
    19a8:	6794                	ld	a3,8(a5)
    19aa:	07a1                	add	a5,a5,8
    19ac:	00b68733          	add	a4,a3,a1
    19b0:	fff6c693          	not	a3,a3
    19b4:	8f75                	and	a4,a4,a3
    19b6:	8f71                	and	a4,a4,a2
    19b8:	db65                	beqz	a4,19a8 <strlen+0x34>
    for (; *s; s++)
    19ba:	0007c703          	lbu	a4,0(a5)
    19be:	d779                	beqz	a4,198c <strlen+0x18>
    19c0:	0017c703          	lbu	a4,1(a5)
    19c4:	0785                	add	a5,a5,1
    19c6:	d379                	beqz	a4,198c <strlen+0x18>
    19c8:	0017c703          	lbu	a4,1(a5)
    19cc:	0785                	add	a5,a5,1
    19ce:	fb6d                	bnez	a4,19c0 <strlen+0x4c>
    19d0:	bf75                	j	198c <strlen+0x18>

00000000000019d2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d2:	00757713          	and	a4,a0,7
{
    19d6:	87aa                	mv	a5,a0
    19d8:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19dc:	cb19                	beqz	a4,19f2 <memchr+0x20>
    19de:	ce25                	beqz	a2,1a56 <memchr+0x84>
    19e0:	0007c703          	lbu	a4,0(a5)
    19e4:	00b70763          	beq	a4,a1,19f2 <memchr+0x20>
    19e8:	0785                	add	a5,a5,1
    19ea:	0077f713          	and	a4,a5,7
    19ee:	167d                	add	a2,a2,-1
    19f0:	f77d                	bnez	a4,19de <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19f2:	4501                	li	a0,0
    if (n && *s != c)
    19f4:	c235                	beqz	a2,1a58 <memchr+0x86>
    19f6:	0007c703          	lbu	a4,0(a5)
    19fa:	06b70063          	beq	a4,a1,1a5a <memchr+0x88>
        size_t k = ONES * c;
    19fe:	00000517          	auipc	a0,0x0
    1a02:	6fa53503          	ld	a0,1786(a0) # 20f8 <__clone+0x14a>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a06:	471d                	li	a4,7
        size_t k = ONES * c;
    1a08:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a0c:	04c77763          	bgeu	a4,a2,1a5a <memchr+0x88>
    1a10:	00000897          	auipc	a7,0x0
    1a14:	6d88b883          	ld	a7,1752(a7) # 20e8 <__clone+0x13a>
    1a18:	00000817          	auipc	a6,0x0
    1a1c:	6d883803          	ld	a6,1752(a6) # 20f0 <__clone+0x142>
    1a20:	431d                	li	t1,7
    1a22:	a029                	j	1a2c <memchr+0x5a>
    1a24:	1661                	add	a2,a2,-8
    1a26:	07a1                	add	a5,a5,8
    1a28:	00c37c63          	bgeu	t1,a2,1a40 <memchr+0x6e>
    1a2c:	6398                	ld	a4,0(a5)
    1a2e:	8f29                	xor	a4,a4,a0
    1a30:	011706b3          	add	a3,a4,a7
    1a34:	fff74713          	not	a4,a4
    1a38:	8f75                	and	a4,a4,a3
    1a3a:	01077733          	and	a4,a4,a6
    1a3e:	d37d                	beqz	a4,1a24 <memchr+0x52>
    1a40:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a42:	e601                	bnez	a2,1a4a <memchr+0x78>
    1a44:	a809                	j	1a56 <memchr+0x84>
    1a46:	0505                	add	a0,a0,1
    1a48:	c619                	beqz	a2,1a56 <memchr+0x84>
    1a4a:	00054783          	lbu	a5,0(a0)
    1a4e:	167d                	add	a2,a2,-1
    1a50:	feb79be3          	bne	a5,a1,1a46 <memchr+0x74>
    1a54:	8082                	ret
    return n ? (void *)s : 0;
    1a56:	4501                	li	a0,0
}
    1a58:	8082                	ret
    if (n && *s != c)
    1a5a:	853e                	mv	a0,a5
    1a5c:	b7fd                	j	1a4a <memchr+0x78>

0000000000001a5e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a5e:	1101                	add	sp,sp,-32
    1a60:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a62:	862e                	mv	a2,a1
{
    1a64:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a66:	4581                	li	a1,0
{
    1a68:	e426                	sd	s1,8(sp)
    1a6a:	ec06                	sd	ra,24(sp)
    1a6c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a6e:	f65ff0ef          	jal	19d2 <memchr>
    return p ? p - s : n;
    1a72:	c519                	beqz	a0,1a80 <strnlen+0x22>
}
    1a74:	60e2                	ld	ra,24(sp)
    1a76:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a78:	8d05                	sub	a0,a0,s1
}
    1a7a:	64a2                	ld	s1,8(sp)
    1a7c:	6105                	add	sp,sp,32
    1a7e:	8082                	ret
    1a80:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a82:	8522                	mv	a0,s0
}
    1a84:	6442                	ld	s0,16(sp)
    1a86:	64a2                	ld	s1,8(sp)
    1a88:	6105                	add	sp,sp,32
    1a8a:	8082                	ret

0000000000001a8c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a8c:	00a5c7b3          	xor	a5,a1,a0
    1a90:	8b9d                	and	a5,a5,7
    1a92:	eb95                	bnez	a5,1ac6 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a94:	0075f793          	and	a5,a1,7
    1a98:	e7b1                	bnez	a5,1ae4 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a9a:	6198                	ld	a4,0(a1)
    1a9c:	00000617          	auipc	a2,0x0
    1aa0:	64c63603          	ld	a2,1612(a2) # 20e8 <__clone+0x13a>
    1aa4:	00000817          	auipc	a6,0x0
    1aa8:	64c83803          	ld	a6,1612(a6) # 20f0 <__clone+0x142>
    1aac:	a029                	j	1ab6 <strcpy+0x2a>
    1aae:	05a1                	add	a1,a1,8
    1ab0:	e118                	sd	a4,0(a0)
    1ab2:	6198                	ld	a4,0(a1)
    1ab4:	0521                	add	a0,a0,8
    1ab6:	00c707b3          	add	a5,a4,a2
    1aba:	fff74693          	not	a3,a4
    1abe:	8ff5                	and	a5,a5,a3
    1ac0:	0107f7b3          	and	a5,a5,a6
    1ac4:	d7ed                	beqz	a5,1aae <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ac6:	0005c783          	lbu	a5,0(a1)
    1aca:	00f50023          	sb	a5,0(a0)
    1ace:	c785                	beqz	a5,1af6 <strcpy+0x6a>
    1ad0:	0015c783          	lbu	a5,1(a1)
    1ad4:	0505                	add	a0,a0,1
    1ad6:	0585                	add	a1,a1,1
    1ad8:	00f50023          	sb	a5,0(a0)
    1adc:	fbf5                	bnez	a5,1ad0 <strcpy+0x44>
        ;
    return d;
}
    1ade:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ae0:	0505                	add	a0,a0,1
    1ae2:	df45                	beqz	a4,1a9a <strcpy+0xe>
            if (!(*d = *s))
    1ae4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ae8:	0585                	add	a1,a1,1
    1aea:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aee:	00f50023          	sb	a5,0(a0)
    1af2:	f7fd                	bnez	a5,1ae0 <strcpy+0x54>
}
    1af4:	8082                	ret
    1af6:	8082                	ret

0000000000001af8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1af8:	00a5c7b3          	xor	a5,a1,a0
    1afc:	8b9d                	and	a5,a5,7
    1afe:	e3b5                	bnez	a5,1b62 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b00:	0075f793          	and	a5,a1,7
    1b04:	cf99                	beqz	a5,1b22 <strncpy+0x2a>
    1b06:	ea09                	bnez	a2,1b18 <strncpy+0x20>
    1b08:	a421                	j	1d10 <strncpy+0x218>
    1b0a:	0585                	add	a1,a1,1
    1b0c:	0075f793          	and	a5,a1,7
    1b10:	167d                	add	a2,a2,-1
    1b12:	0505                	add	a0,a0,1
    1b14:	c799                	beqz	a5,1b22 <strncpy+0x2a>
    1b16:	c225                	beqz	a2,1b76 <strncpy+0x7e>
    1b18:	0005c783          	lbu	a5,0(a1)
    1b1c:	00f50023          	sb	a5,0(a0)
    1b20:	f7ed                	bnez	a5,1b0a <strncpy+0x12>
            ;
        if (!n || !*s)
    1b22:	ca31                	beqz	a2,1b76 <strncpy+0x7e>
    1b24:	0005c783          	lbu	a5,0(a1)
    1b28:	cba1                	beqz	a5,1b78 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2a:	479d                	li	a5,7
    1b2c:	02c7fc63          	bgeu	a5,a2,1b64 <strncpy+0x6c>
    1b30:	00000897          	auipc	a7,0x0
    1b34:	5b88b883          	ld	a7,1464(a7) # 20e8 <__clone+0x13a>
    1b38:	00000817          	auipc	a6,0x0
    1b3c:	5b883803          	ld	a6,1464(a6) # 20f0 <__clone+0x142>
    1b40:	431d                	li	t1,7
    1b42:	a039                	j	1b50 <strncpy+0x58>
            *wd = *ws;
    1b44:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b46:	1661                	add	a2,a2,-8
    1b48:	05a1                	add	a1,a1,8
    1b4a:	0521                	add	a0,a0,8
    1b4c:	00c37b63          	bgeu	t1,a2,1b62 <strncpy+0x6a>
    1b50:	6198                	ld	a4,0(a1)
    1b52:	011707b3          	add	a5,a4,a7
    1b56:	fff74693          	not	a3,a4
    1b5a:	8ff5                	and	a5,a5,a3
    1b5c:	0107f7b3          	and	a5,a5,a6
    1b60:	d3f5                	beqz	a5,1b44 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b62:	ca11                	beqz	a2,1b76 <strncpy+0x7e>
    1b64:	0005c783          	lbu	a5,0(a1)
    1b68:	0585                	add	a1,a1,1
    1b6a:	00f50023          	sb	a5,0(a0)
    1b6e:	c789                	beqz	a5,1b78 <strncpy+0x80>
    1b70:	167d                	add	a2,a2,-1
    1b72:	0505                	add	a0,a0,1
    1b74:	fa65                	bnez	a2,1b64 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b76:	8082                	ret
    1b78:	4805                	li	a6,1
    1b7a:	14061b63          	bnez	a2,1cd0 <strncpy+0x1d8>
    1b7e:	40a00733          	neg	a4,a0
    1b82:	00777793          	and	a5,a4,7
    1b86:	4581                	li	a1,0
    1b88:	12061c63          	bnez	a2,1cc0 <strncpy+0x1c8>
    1b8c:	00778693          	add	a3,a5,7
    1b90:	48ad                	li	a7,11
    1b92:	1316e563          	bltu	a3,a7,1cbc <strncpy+0x1c4>
    1b96:	16d5e263          	bltu	a1,a3,1cfa <strncpy+0x202>
    1b9a:	14078c63          	beqz	a5,1cf2 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9e:	00050023          	sb	zero,0(a0)
    1ba2:	00677693          	and	a3,a4,6
    1ba6:	14068263          	beqz	a3,1cea <strncpy+0x1f2>
    1baa:	000500a3          	sb	zero,1(a0)
    1bae:	4689                	li	a3,2
    1bb0:	14f6f863          	bgeu	a3,a5,1d00 <strncpy+0x208>
    1bb4:	00050123          	sb	zero,2(a0)
    1bb8:	8b11                	and	a4,a4,4
    1bba:	12070463          	beqz	a4,1ce2 <strncpy+0x1ea>
    1bbe:	000501a3          	sb	zero,3(a0)
    1bc2:	4711                	li	a4,4
    1bc4:	00450693          	add	a3,a0,4
    1bc8:	02f77563          	bgeu	a4,a5,1bf2 <strncpy+0xfa>
    1bcc:	00050223          	sb	zero,4(a0)
    1bd0:	4715                	li	a4,5
    1bd2:	00550693          	add	a3,a0,5
    1bd6:	00e78e63          	beq	a5,a4,1bf2 <strncpy+0xfa>
    1bda:	fff50713          	add	a4,a0,-1
    1bde:	000502a3          	sb	zero,5(a0)
    1be2:	8b1d                	and	a4,a4,7
    1be4:	12071263          	bnez	a4,1d08 <strncpy+0x210>
    1be8:	00750693          	add	a3,a0,7
    1bec:	00050323          	sb	zero,6(a0)
    1bf0:	471d                	li	a4,7
    1bf2:	40f80833          	sub	a6,a6,a5
    1bf6:	ff887593          	and	a1,a6,-8
    1bfa:	97aa                	add	a5,a5,a0
    1bfc:	95be                	add	a1,a1,a5
    1bfe:	0007b023          	sd	zero,0(a5)
    1c02:	07a1                	add	a5,a5,8
    1c04:	feb79de3          	bne	a5,a1,1bfe <strncpy+0x106>
    1c08:	ff887593          	and	a1,a6,-8
    1c0c:	00787813          	and	a6,a6,7
    1c10:	00e587bb          	addw	a5,a1,a4
    1c14:	00b68733          	add	a4,a3,a1
    1c18:	0e080063          	beqz	a6,1cf8 <strncpy+0x200>
    1c1c:	00070023          	sb	zero,0(a4)
    1c20:	0017869b          	addw	a3,a5,1
    1c24:	f4c6f9e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c28:	000700a3          	sb	zero,1(a4)
    1c2c:	0027869b          	addw	a3,a5,2
    1c30:	f4c6f3e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c34:	00070123          	sb	zero,2(a4)
    1c38:	0037869b          	addw	a3,a5,3
    1c3c:	f2c6fde3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c40:	000701a3          	sb	zero,3(a4)
    1c44:	0047869b          	addw	a3,a5,4
    1c48:	f2c6f7e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c4c:	00070223          	sb	zero,4(a4)
    1c50:	0057869b          	addw	a3,a5,5
    1c54:	f2c6f1e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c58:	000702a3          	sb	zero,5(a4)
    1c5c:	0067869b          	addw	a3,a5,6
    1c60:	f0c6fbe3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c64:	00070323          	sb	zero,6(a4)
    1c68:	0077869b          	addw	a3,a5,7
    1c6c:	f0c6f5e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c70:	000703a3          	sb	zero,7(a4)
    1c74:	0087869b          	addw	a3,a5,8
    1c78:	eec6ffe3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c7c:	00070423          	sb	zero,8(a4)
    1c80:	0097869b          	addw	a3,a5,9
    1c84:	eec6f9e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c88:	000704a3          	sb	zero,9(a4)
    1c8c:	00a7869b          	addw	a3,a5,10
    1c90:	eec6f3e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1c94:	00070523          	sb	zero,10(a4)
    1c98:	00b7869b          	addw	a3,a5,11
    1c9c:	ecc6fde3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1ca0:	000705a3          	sb	zero,11(a4)
    1ca4:	00c7869b          	addw	a3,a5,12
    1ca8:	ecc6f7e3          	bgeu	a3,a2,1b76 <strncpy+0x7e>
    1cac:	00070623          	sb	zero,12(a4)
    1cb0:	27b5                	addw	a5,a5,13
    1cb2:	ecc7f2e3          	bgeu	a5,a2,1b76 <strncpy+0x7e>
    1cb6:	000706a3          	sb	zero,13(a4)
}
    1cba:	8082                	ret
    1cbc:	46ad                	li	a3,11
    1cbe:	bde1                	j	1b96 <strncpy+0x9e>
    1cc0:	00778693          	add	a3,a5,7
    1cc4:	48ad                	li	a7,11
    1cc6:	fff60593          	add	a1,a2,-1
    1cca:	ed16f6e3          	bgeu	a3,a7,1b96 <strncpy+0x9e>
    1cce:	b7fd                	j	1cbc <strncpy+0x1c4>
    1cd0:	40a00733          	neg	a4,a0
    1cd4:	8832                	mv	a6,a2
    1cd6:	00777793          	and	a5,a4,7
    1cda:	4581                	li	a1,0
    1cdc:	ea0608e3          	beqz	a2,1b8c <strncpy+0x94>
    1ce0:	b7c5                	j	1cc0 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ce2:	00350693          	add	a3,a0,3
    1ce6:	470d                	li	a4,3
    1ce8:	b729                	j	1bf2 <strncpy+0xfa>
    1cea:	00150693          	add	a3,a0,1
    1cee:	4705                	li	a4,1
    1cf0:	b709                	j	1bf2 <strncpy+0xfa>
tail:
    1cf2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cf4:	4701                	li	a4,0
    1cf6:	bdf5                	j	1bf2 <strncpy+0xfa>
    1cf8:	8082                	ret
tail:
    1cfa:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cfc:	4781                	li	a5,0
    1cfe:	bf39                	j	1c1c <strncpy+0x124>
    1d00:	00250693          	add	a3,a0,2
    1d04:	4709                	li	a4,2
    1d06:	b5f5                	j	1bf2 <strncpy+0xfa>
    1d08:	00650693          	add	a3,a0,6
    1d0c:	4719                	li	a4,6
    1d0e:	b5d5                	j	1bf2 <strncpy+0xfa>
    1d10:	8082                	ret

0000000000001d12 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d12:	87aa                	mv	a5,a0
    1d14:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d16:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d1a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d1e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d20:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d22:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <openat>:
    register long a7 __asm__("a7") = n;
    1d2a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d2e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d32:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <close>:
    register long a7 __asm__("a7") = n;
    1d3a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d3e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <read>:
    register long a7 __asm__("a7") = n;
    1d46:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d4e:	8082                	ret

0000000000001d50 <write>:
    register long a7 __asm__("a7") = n;
    1d50:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d54:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d58:	8082                	ret

0000000000001d5a <getpid>:
    register long a7 __asm__("a7") = n;
    1d5a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d5e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <getppid>:
    register long a7 __asm__("a7") = n;
    1d66:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d6a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d72:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d76:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <fork>:
    register long a7 __asm__("a7") = n;
    1d7e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d82:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d84:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d86:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d8e:	85b2                	mv	a1,a2
    1d90:	863a                	mv	a2,a4
    if (stack)
    1d92:	c191                	beqz	a1,1d96 <clone+0x8>
	stack += stack_size;
    1d94:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d96:	4781                	li	a5,0
    1d98:	4701                	li	a4,0
    1d9a:	4681                	li	a3,0
    1d9c:	2601                	sext.w	a2,a2
    1d9e:	ac01                	j	1fae <__clone>

0000000000001da0 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1da0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1da4:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1da8:	8082                	ret

0000000000001daa <exit>:
    register long a7 __asm__("a7") = n;
    1daa:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1db2:	8082                	ret

0000000000001db4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1db4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1db8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dba:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <exec>:
    register long a7 __asm__("a7") = n;
    1dc2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <execve>:
    register long a7 __asm__("a7") = n;
    1dce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <times>:
    register long a7 __asm__("a7") = n;
    1dda:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dde:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <get_time>:

int64 get_time()
{
    1de6:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1de8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dec:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1df4:	2501                	sext.w	a0,a0
    1df6:	ed09                	bnez	a0,1e10 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1df8:	67a2                	ld	a5,8(sp)
    1dfa:	3e800713          	li	a4,1000
    1dfe:	00015503          	lhu	a0,0(sp)
    1e02:	02e7d7b3          	divu	a5,a5,a4
    1e06:	02e50533          	mul	a0,a0,a4
    1e0a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e0c:	0141                	add	sp,sp,16
    1e0e:	8082                	ret
        return -1;
    1e10:	557d                	li	a0,-1
    1e12:	bfed                	j	1e0c <get_time+0x26>

0000000000001e14 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e14:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <time>:
    register long a7 __asm__("a7") = n;
    1e20:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <sleep>:

int sleep(unsigned long long time)
{
    1e2c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e2e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e30:	850a                	mv	a0,sp
    1e32:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e34:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e38:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e3e:	e501                	bnez	a0,1e46 <sleep+0x1a>
    return 0;
    1e40:	4501                	li	a0,0
}
    1e42:	0141                	add	sp,sp,16
    1e44:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e46:	4502                	lw	a0,0(sp)
}
    1e48:	0141                	add	sp,sp,16
    1e4a:	8082                	ret

0000000000001e4c <set_priority>:
    register long a7 __asm__("a7") = n;
    1e4c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e58:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e5c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e60:	8082                	ret

0000000000001e62 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e62:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <munmap>:
    register long a7 __asm__("a7") = n;
    1e6e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <wait>:

int wait(int *code)
{
    1e7a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e7c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e80:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e82:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e84:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e86:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <spawn>:
    register long a7 __asm__("a7") = n;
    1e8e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e92:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <mailread>:
    register long a7 __asm__("a7") = n;
    1e9a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ea6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <fstat>:
    register long a7 __asm__("a7") = n;
    1eb2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1ebe:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ec0:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1ec4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec6:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ece:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ed0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ed4:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ede:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ee4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <link>:

int link(char *old_path, char *new_path)
{
    1eee:	87aa                	mv	a5,a0
    1ef0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ef2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ef6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1efa:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1efc:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f00:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f02:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <unlink>:

int unlink(char *path)
{
    1f0a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f0c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f10:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f14:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f16:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <uname>:
    register long a7 __asm__("a7") = n;
    1f1e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f22:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <brk>:
    register long a7 __asm__("a7") = n;
    1f2a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f2e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f36:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f38:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f3c:	8082                	ret

0000000000001f3e <chdir>:
    register long a7 __asm__("a7") = n;
    1f3e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f42:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f46:	2501                	sext.w	a0,a0
    1f48:	8082                	ret

0000000000001f4a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f4a:	862e                	mv	a2,a1
    1f4c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f4e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f50:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f5a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <getdents>:
    register long a7 __asm__("a7") = n;
    1f64:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f68:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <pipe>:
    register long a7 __asm__("a7") = n;
    1f70:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f74:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f76:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <dup>:
    register long a7 __asm__("a7") = n;
    1f7e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f80:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret

0000000000001f88 <dup2>:
    register long a7 __asm__("a7") = n;
    1f88:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f8a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <mount>:
    register long a7 __asm__("a7") = n;
    1f94:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f98:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <umount>:
    register long a7 __asm__("a7") = n;
    1fa0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fa4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fae:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1fb0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fb2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fb4:	8532                	mv	a0,a2
	mv a2, a4
    1fb6:	863a                	mv	a2,a4
	mv a3, a5
    1fb8:	86be                	mv	a3,a5
	mv a4, a6
    1fba:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fbc:	0dc00893          	li	a7,220
	ecall
    1fc0:	00000073          	ecall

	beqz a0, 1f
    1fc4:	c111                	beqz	a0,1fc8 <__clone+0x1a>
	# Parent
	ret
    1fc6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fc8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fca:	6522                	ld	a0,8(sp)
	jalr a1
    1fcc:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fce:	05d00893          	li	a7,93
	ecall
    1fd2:	00000073          	ecall
