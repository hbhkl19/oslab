
/home/hbh/oslab/oslab/user/build/riscv64/tmpfs_nested_dirs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a2a5                	j	116a <__start_main>

0000000000001004 <test_tmpfs_nested_dirs>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_tmpfs_nested_dirs(void)
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f9a50513          	add	a0,a0,-102 # 1fa0 <__clone+0x28>
{
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	3b0000ef          	jal	13c2 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	0aa50513          	add	a0,a0,170 # 20c0 <__func__.0>
    101e:	3a4000ef          	jal	13c2 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f9650513          	add	a0,a0,-106 # 1fb8 <__clone+0x40>
    102a:	398000ef          	jal	13c2 <puts>

    int ret = mkdir("nest_a", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f9650513          	add	a0,a0,-106 # 1fc8 <__clone+0x50>
    103a:	6db000ef          	jal	1f14 <mkdir>
    103e:	842a                	mv	s0,a0
    printf("mkdir a ret: %d\n", ret);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	f8e50513          	add	a0,a0,-114 # 1fd0 <__clone+0x58>
    104a:	39a000ef          	jal	13e4 <printf>
    assert(ret == 0 || ret == -1);
    104e:	2405                	addw	s0,s0,1
    1050:	4785                	li	a5,1
    1052:	0087f863          	bgeu	a5,s0,1062 <test_tmpfs_nested_dirs+0x5e>
    1056:	00001517          	auipc	a0,0x1
    105a:	f9250513          	add	a0,a0,-110 # 1fe8 <__clone+0x70>
    105e:	600000ef          	jal	165e <panic>

    ret = chdir("nest_a");
    1062:	00001517          	auipc	a0,0x1
    1066:	f6650513          	add	a0,a0,-154 # 1fc8 <__clone+0x50>
    106a:	69f000ef          	jal	1f08 <chdir>
    106e:	842a                	mv	s0,a0
    printf("chdir a ret: %d\n", ret);
    1070:	85aa                	mv	a1,a0
    1072:	00001517          	auipc	a0,0x1
    1076:	f9650513          	add	a0,a0,-106 # 2008 <__clone+0x90>
    107a:	36a000ef          	jal	13e4 <printf>
    assert(ret == 0);
    107e:	e84d                	bnez	s0,1130 <test_tmpfs_nested_dirs+0x12c>

    ret = mkdir("nest_b", 0666);
    1080:	1b600593          	li	a1,438
    1084:	00001517          	auipc	a0,0x1
    1088:	f9c50513          	add	a0,a0,-100 # 2020 <__clone+0xa8>
    108c:	689000ef          	jal	1f14 <mkdir>
    1090:	842a                	mv	s0,a0
    printf("mkdir b ret: %d\n", ret);
    1092:	85aa                	mv	a1,a0
    1094:	00001517          	auipc	a0,0x1
    1098:	f9450513          	add	a0,a0,-108 # 2028 <__clone+0xb0>
    109c:	348000ef          	jal	13e4 <printf>
    assert(ret == 0 || ret == -1);
    10a0:	2405                	addw	s0,s0,1
    10a2:	4785                	li	a5,1
    10a4:	0087f863          	bgeu	a5,s0,10b4 <test_tmpfs_nested_dirs+0xb0>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	f4050513          	add	a0,a0,-192 # 1fe8 <__clone+0x70>
    10b0:	5ae000ef          	jal	165e <panic>

    ret = chdir("nest_b");
    10b4:	00001517          	auipc	a0,0x1
    10b8:	f6c50513          	add	a0,a0,-148 # 2020 <__clone+0xa8>
    10bc:	64d000ef          	jal	1f08 <chdir>
    10c0:	842a                	mv	s0,a0
    printf("chdir b ret: %d\n", ret);
    10c2:	85aa                	mv	a1,a0
    10c4:	00001517          	auipc	a0,0x1
    10c8:	f7c50513          	add	a0,a0,-132 # 2040 <__clone+0xc8>
    10cc:	318000ef          	jal	13e4 <printf>
    assert(ret == 0);
    10d0:	e43d                	bnez	s0,113e <test_tmpfs_nested_dirs+0x13a>

    int fd = open("deep.txt", O_CREATE | O_RDWR);
    10d2:	04200593          	li	a1,66
    10d6:	00001517          	auipc	a0,0x1
    10da:	f8250513          	add	a0,a0,-126 # 2058 <__clone+0xe0>
    10de:	3ff000ef          	jal	1cdc <open>
    10e2:	842a                	mv	s0,a0
    printf("open fd: %d\n", fd);
    10e4:	85aa                	mv	a1,a0
    10e6:	00001517          	auipc	a0,0x1
    10ea:	f8250513          	add	a0,a0,-126 # 2068 <__clone+0xf0>
    10ee:	2f6000ef          	jal	13e4 <printf>
    assert(fd > 0);
    10f2:	04805d63          	blez	s0,114c <test_tmpfs_nested_dirs+0x148>
    close(fd);
    10f6:	8522                	mv	a0,s0
    10f8:	40d000ef          	jal	1d04 <close>

    printf("tmpfs nested success.\n");
    10fc:	00001517          	auipc	a0,0x1
    1100:	f7c50513          	add	a0,a0,-132 # 2078 <__clone+0x100>
    1104:	2e0000ef          	jal	13e4 <printf>
    TEST_END(__func__);
    1108:	00001517          	auipc	a0,0x1
    110c:	f8850513          	add	a0,a0,-120 # 2090 <__clone+0x118>
    1110:	2b2000ef          	jal	13c2 <puts>
    1114:	00001517          	auipc	a0,0x1
    1118:	fac50513          	add	a0,a0,-84 # 20c0 <__func__.0>
    111c:	2a6000ef          	jal	13c2 <puts>
}
    1120:	6402                	ld	s0,0(sp)
    1122:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1124:	00001517          	auipc	a0,0x1
    1128:	e9450513          	add	a0,a0,-364 # 1fb8 <__clone+0x40>
}
    112c:	0141                	add	sp,sp,16
    TEST_END(__func__);
    112e:	ac51                	j	13c2 <puts>
    assert(ret == 0);
    1130:	00001517          	auipc	a0,0x1
    1134:	eb850513          	add	a0,a0,-328 # 1fe8 <__clone+0x70>
    1138:	526000ef          	jal	165e <panic>
    113c:	b791                	j	1080 <test_tmpfs_nested_dirs+0x7c>
    assert(ret == 0);
    113e:	00001517          	auipc	a0,0x1
    1142:	eaa50513          	add	a0,a0,-342 # 1fe8 <__clone+0x70>
    1146:	518000ef          	jal	165e <panic>
    114a:	b761                	j	10d2 <test_tmpfs_nested_dirs+0xce>
    assert(fd > 0);
    114c:	00001517          	auipc	a0,0x1
    1150:	e9c50513          	add	a0,a0,-356 # 1fe8 <__clone+0x70>
    1154:	50a000ef          	jal	165e <panic>
    1158:	bf79                	j	10f6 <test_tmpfs_nested_dirs+0xf2>

000000000000115a <main>:

int main(void)
{
    115a:	1141                	add	sp,sp,-16
    115c:	e406                	sd	ra,8(sp)
    test_tmpfs_nested_dirs();
    115e:	ea7ff0ef          	jal	1004 <test_tmpfs_nested_dirs>
    return 0;
}
    1162:	60a2                	ld	ra,8(sp)
    1164:	4501                	li	a0,0
    1166:	0141                	add	sp,sp,16
    1168:	8082                	ret

000000000000116a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    116a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    116c:	4108                	lw	a0,0(a0)
{
    116e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1170:	05a1                	add	a1,a1,8
{
    1172:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1174:	fe7ff0ef          	jal	115a <main>
    1178:	3fd000ef          	jal	1d74 <exit>
	return 0;
}
    117c:	60a2                	ld	ra,8(sp)
    117e:	4501                	li	a0,0
    1180:	0141                	add	sp,sp,16
    1182:	8082                	ret

0000000000001184 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1184:	7179                	add	sp,sp,-48
    1186:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1188:	12054863          	bltz	a0,12b8 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    118c:	02b577bb          	remuw	a5,a0,a1
    1190:	00001697          	auipc	a3,0x1
    1194:	f4868693          	add	a3,a3,-184 # 20d8 <digits>
    buf[16] = 0;
    1198:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    119c:	0005871b          	sext.w	a4,a1
    11a0:	1782                	sll	a5,a5,0x20
    11a2:	9381                	srl	a5,a5,0x20
    11a4:	97b6                	add	a5,a5,a3
    11a6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11aa:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11ae:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11b2:	1ab56663          	bltu	a0,a1,135e <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	sll	a2,a2,0x20
    11bc:	9201                	srl	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11cc:	12e86c63          	bltu	a6,a4,1304 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	sll	a2,a2,0x20
    11d6:	9201                	srl	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11e6:	12e5e863          	bltu	a1,a4,1316 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11ea:	02e8763b          	remuw	a2,a6,a4
    11ee:	1602                	sll	a2,a2,0x20
    11f0:	9201                	srl	a2,a2,0x20
    11f2:	9636                	add	a2,a2,a3
    11f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fc:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1200:	12e86463          	bltu	a6,a4,1328 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1204:	02e5f63b          	remuw	a2,a1,a4
    1208:	1602                	sll	a2,a2,0x20
    120a:	9201                	srl	a2,a2,0x20
    120c:	9636                	add	a2,a2,a3
    120e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1212:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1216:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    121a:	12e5e063          	bltu	a1,a4,133a <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    121e:	02e8763b          	remuw	a2,a6,a4
    1222:	1602                	sll	a2,a2,0x20
    1224:	9201                	srl	a2,a2,0x20
    1226:	9636                	add	a2,a2,a3
    1228:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1230:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1234:	0ae86f63          	bltu	a6,a4,12f2 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1238:	02e5f63b          	remuw	a2,a1,a4
    123c:	1602                	sll	a2,a2,0x20
    123e:	9201                	srl	a2,a2,0x20
    1240:	9636                	add	a2,a2,a3
    1242:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1246:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    124a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    124e:	0ee5ef63          	bltu	a1,a4,134c <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1252:	02e8763b          	remuw	a2,a6,a4
    1256:	1602                	sll	a2,a2,0x20
    1258:	9201                	srl	a2,a2,0x20
    125a:	9636                	add	a2,a2,a3
    125c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1260:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1264:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1268:	0ee86d63          	bltu	a6,a4,1362 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    126c:	02e5f63b          	remuw	a2,a1,a4
    1270:	1602                	sll	a2,a2,0x20
    1272:	9201                	srl	a2,a2,0x20
    1274:	9636                	add	a2,a2,a3
    1276:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    127a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    127e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1282:	0ee5e963          	bltu	a1,a4,1374 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1286:	1782                	sll	a5,a5,0x20
    1288:	9381                	srl	a5,a5,0x20
    128a:	96be                	add	a3,a3,a5
    128c:	0006c783          	lbu	a5,0(a3)
    1290:	4599                	li	a1,6
    1292:	00f10723          	sb	a5,14(sp)

    if (sign)
    1296:	00055763          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12a2:	4595                	li	a1,5
    write(f, s, l);
    12a4:	003c                	add	a5,sp,8
    12a6:	4641                	li	a2,16
    12a8:	9e0d                	subw	a2,a2,a1
    12aa:	4505                	li	a0,1
    12ac:	95be                	add	a1,a1,a5
    12ae:	26d000ef          	jal	1d1a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12b2:	70a2                	ld	ra,40(sp)
    12b4:	6145                	add	sp,sp,48
    12b6:	8082                	ret
        x = -xx;
    12b8:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12bc:	02b677bb          	remuw	a5,a2,a1
    12c0:	00001697          	auipc	a3,0x1
    12c4:	e1868693          	add	a3,a3,-488 # 20d8 <digits>
    buf[16] = 0;
    12c8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12cc:	0005871b          	sext.w	a4,a1
    12d0:	1782                	sll	a5,a5,0x20
    12d2:	9381                	srl	a5,a5,0x20
    12d4:	97b6                	add	a5,a5,a3
    12d6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12da:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12de:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12e2:	ecb67ae3          	bgeu	a2,a1,11b6 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12e6:	02d00793          	li	a5,45
    12ea:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12ee:	45b9                	li	a1,14
    12f0:	bf55                	j	12a4 <printint.constprop.0+0x120>
    12f2:	45a9                	li	a1,10
    if (sign)
    12f4:	fa0558e3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f8:	02d00793          	li	a5,45
    12fc:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1300:	45a5                	li	a1,9
    1302:	b74d                	j	12a4 <printint.constprop.0+0x120>
    1304:	45b9                	li	a1,14
    if (sign)
    1306:	f8055fe3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    130a:	02d00793          	li	a5,45
    130e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1312:	45b5                	li	a1,13
    1314:	bf41                	j	12a4 <printint.constprop.0+0x120>
    1316:	45b5                	li	a1,13
    if (sign)
    1318:	f80556e3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    131c:	02d00793          	li	a5,45
    1320:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1324:	45b1                	li	a1,12
    1326:	bfbd                	j	12a4 <printint.constprop.0+0x120>
    1328:	45b1                	li	a1,12
    if (sign)
    132a:	f6055de3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    132e:	02d00793          	li	a5,45
    1332:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1336:	45ad                	li	a1,11
    1338:	b7b5                	j	12a4 <printint.constprop.0+0x120>
    133a:	45ad                	li	a1,11
    if (sign)
    133c:	f60554e3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1340:	02d00793          	li	a5,45
    1344:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1348:	45a9                	li	a1,10
    134a:	bfa9                	j	12a4 <printint.constprop.0+0x120>
    134c:	45a5                	li	a1,9
    if (sign)
    134e:	f4055be3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1352:	02d00793          	li	a5,45
    1356:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    135a:	45a1                	li	a1,8
    135c:	b7a1                	j	12a4 <printint.constprop.0+0x120>
    i = 15;
    135e:	45bd                	li	a1,15
    1360:	b791                	j	12a4 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1362:	45a1                	li	a1,8
    if (sign)
    1364:	f40550e3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1368:	02d00793          	li	a5,45
    136c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1370:	459d                	li	a1,7
    1372:	bf0d                	j	12a4 <printint.constprop.0+0x120>
    1374:	459d                	li	a1,7
    if (sign)
    1376:	f20557e3          	bgez	a0,12a4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    137a:	02d00793          	li	a5,45
    137e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1382:	4599                	li	a1,6
    1384:	b705                	j	12a4 <printint.constprop.0+0x120>

0000000000001386 <getchar>:
{
    1386:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1388:	00f10593          	add	a1,sp,15
    138c:	4605                	li	a2,1
    138e:	4501                	li	a0,0
{
    1390:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1392:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1396:	17b000ef          	jal	1d10 <read>
}
    139a:	60e2                	ld	ra,24(sp)
    139c:	00f14503          	lbu	a0,15(sp)
    13a0:	6105                	add	sp,sp,32
    13a2:	8082                	ret

00000000000013a4 <putchar>:
{
    13a4:	1101                	add	sp,sp,-32
    13a6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13a8:	00f10593          	add	a1,sp,15
    13ac:	4605                	li	a2,1
    13ae:	4505                	li	a0,1
{
    13b0:	ec06                	sd	ra,24(sp)
    char byte = c;
    13b2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13b6:	165000ef          	jal	1d1a <write>
}
    13ba:	60e2                	ld	ra,24(sp)
    13bc:	2501                	sext.w	a0,a0
    13be:	6105                	add	sp,sp,32
    13c0:	8082                	ret

00000000000013c2 <puts>:
{
    13c2:	1141                	add	sp,sp,-16
    13c4:	e406                	sd	ra,8(sp)
    13c6:	e022                	sd	s0,0(sp)
    13c8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13ca:	574000ef          	jal	193e <strlen>
    13ce:	862a                	mv	a2,a0
    13d0:	85a2                	mv	a1,s0
    13d2:	4505                	li	a0,1
    13d4:	147000ef          	jal	1d1a <write>
}
    13d8:	60a2                	ld	ra,8(sp)
    13da:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13dc:	957d                	sra	a0,a0,0x3f
    return r;
    13de:	2501                	sext.w	a0,a0
}
    13e0:	0141                	add	sp,sp,16
    13e2:	8082                	ret

00000000000013e4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13e4:	7171                	add	sp,sp,-176
    13e6:	f85a                	sd	s6,48(sp)
    13e8:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13ea:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13ec:	18bc                	add	a5,sp,120
{
    13ee:	e8ca                	sd	s2,80(sp)
    13f0:	e4ce                	sd	s3,72(sp)
    13f2:	e0d2                	sd	s4,64(sp)
    13f4:	fc56                	sd	s5,56(sp)
    13f6:	f486                	sd	ra,104(sp)
    13f8:	f0a2                	sd	s0,96(sp)
    13fa:	eca6                	sd	s1,88(sp)
    13fc:	fcae                	sd	a1,120(sp)
    13fe:	e132                	sd	a2,128(sp)
    1400:	e536                	sd	a3,136(sp)
    1402:	e93a                	sd	a4,144(sp)
    1404:	f142                	sd	a6,160(sp)
    1406:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1408:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    140a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    140e:	07300a13          	li	s4,115
    1412:	07800a93          	li	s5,120
    buf[i++] = '0';
    1416:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141a:	00001997          	auipc	s3,0x1
    141e:	cbe98993          	add	s3,s3,-834 # 20d8 <digits>
        if (!*s)
    1422:	00054783          	lbu	a5,0(a0)
    1426:	16078a63          	beqz	a5,159a <printf+0x1b6>
    142a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    142c:	19278d63          	beq	a5,s2,15c6 <printf+0x1e2>
    1430:	00164783          	lbu	a5,1(a2)
    1434:	0605                	add	a2,a2,1
    1436:	fbfd                	bnez	a5,142c <printf+0x48>
    1438:	84b2                	mv	s1,a2
        l = z - a;
    143a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    143e:	85aa                	mv	a1,a0
    1440:	8622                	mv	a2,s0
    1442:	4505                	li	a0,1
    1444:	0d7000ef          	jal	1d1a <write>
        if (l)
    1448:	1a041463          	bnez	s0,15f0 <printf+0x20c>
        if (s[1] == 0)
    144c:	0014c783          	lbu	a5,1(s1)
    1450:	14078563          	beqz	a5,159a <printf+0x1b6>
        switch (s[1])
    1454:	1b478063          	beq	a5,s4,15f4 <printf+0x210>
    1458:	14fa6b63          	bltu	s4,a5,15ae <printf+0x1ca>
    145c:	06400713          	li	a4,100
    1460:	1ee78063          	beq	a5,a4,1640 <printf+0x25c>
    1464:	07000713          	li	a4,112
    1468:	1ae79963          	bne	a5,a4,161a <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    146c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    146e:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1472:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1474:	631c                	ld	a5,0(a4)
    1476:	0721                	add	a4,a4,8
    1478:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147a:	00479293          	sll	t0,a5,0x4
    147e:	00879f93          	sll	t6,a5,0x8
    1482:	00c79f13          	sll	t5,a5,0xc
    1486:	01079e93          	sll	t4,a5,0x10
    148a:	01479e13          	sll	t3,a5,0x14
    148e:	01879313          	sll	t1,a5,0x18
    1492:	01c79893          	sll	a7,a5,0x1c
    1496:	02479813          	sll	a6,a5,0x24
    149a:	02879513          	sll	a0,a5,0x28
    149e:	02c79593          	sll	a1,a5,0x2c
    14a2:	03079693          	sll	a3,a5,0x30
    14a6:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14aa:	03c7d413          	srl	s0,a5,0x3c
    14ae:	01c7d39b          	srlw	t2,a5,0x1c
    14b2:	03c2d293          	srl	t0,t0,0x3c
    14b6:	03cfdf93          	srl	t6,t6,0x3c
    14ba:	03cf5f13          	srl	t5,t5,0x3c
    14be:	03cede93          	srl	t4,t4,0x3c
    14c2:	03ce5e13          	srl	t3,t3,0x3c
    14c6:	03c35313          	srl	t1,t1,0x3c
    14ca:	03c8d893          	srl	a7,a7,0x3c
    14ce:	03c85813          	srl	a6,a6,0x3c
    14d2:	9171                	srl	a0,a0,0x3c
    14d4:	91f1                	srl	a1,a1,0x3c
    14d6:	92f1                	srl	a3,a3,0x3c
    14d8:	9371                	srl	a4,a4,0x3c
    14da:	96ce                	add	a3,a3,s3
    14dc:	974e                	add	a4,a4,s3
    14de:	944e                	add	s0,s0,s3
    14e0:	92ce                	add	t0,t0,s3
    14e2:	9fce                	add	t6,t6,s3
    14e4:	9f4e                	add	t5,t5,s3
    14e6:	9ece                	add	t4,t4,s3
    14e8:	9e4e                	add	t3,t3,s3
    14ea:	934e                	add	t1,t1,s3
    14ec:	98ce                	add	a7,a7,s3
    14ee:	93ce                	add	t2,t2,s3
    14f0:	984e                	add	a6,a6,s3
    14f2:	954e                	add	a0,a0,s3
    14f4:	95ce                	add	a1,a1,s3
    14f6:	0006c083          	lbu	ra,0(a3)
    14fa:	0002c283          	lbu	t0,0(t0)
    14fe:	00074683          	lbu	a3,0(a4)
    1502:	000fcf83          	lbu	t6,0(t6)
    1506:	000f4f03          	lbu	t5,0(t5)
    150a:	000ece83          	lbu	t4,0(t4)
    150e:	000e4e03          	lbu	t3,0(t3)
    1512:	00034303          	lbu	t1,0(t1)
    1516:	0008c883          	lbu	a7,0(a7)
    151a:	0003c383          	lbu	t2,0(t2)
    151e:	00084803          	lbu	a6,0(a6)
    1522:	00054503          	lbu	a0,0(a0)
    1526:	0005c583          	lbu	a1,0(a1)
    152a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    152e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1532:	9371                	srl	a4,a4,0x3c
    1534:	8bbd                	and	a5,a5,15
    1536:	974e                	add	a4,a4,s3
    1538:	97ce                	add	a5,a5,s3
    153a:	005105a3          	sb	t0,11(sp)
    153e:	01f10623          	sb	t6,12(sp)
    1542:	01e106a3          	sb	t5,13(sp)
    1546:	01d10723          	sb	t4,14(sp)
    154a:	01c107a3          	sb	t3,15(sp)
    154e:	00610823          	sb	t1,16(sp)
    1552:	011108a3          	sb	a7,17(sp)
    1556:	00710923          	sb	t2,18(sp)
    155a:	010109a3          	sb	a6,19(sp)
    155e:	00a10a23          	sb	a0,20(sp)
    1562:	00b10aa3          	sb	a1,21(sp)
    1566:	00110b23          	sb	ra,22(sp)
    156a:	00d10ba3          	sb	a3,23(sp)
    156e:	00810523          	sb	s0,10(sp)
    1572:	00074703          	lbu	a4,0(a4)
    1576:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    157a:	002c                	add	a1,sp,8
    157c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    157e:	00e10c23          	sb	a4,24(sp)
    1582:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1586:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    158a:	790000ef          	jal	1d1a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    158e:	00248513          	add	a0,s1,2
        if (!*s)
    1592:	00054783          	lbu	a5,0(a0)
    1596:	e8079ae3          	bnez	a5,142a <printf+0x46>
    }
    va_end(ap);
}
    159a:	70a6                	ld	ra,104(sp)
    159c:	7406                	ld	s0,96(sp)
    159e:	64e6                	ld	s1,88(sp)
    15a0:	6946                	ld	s2,80(sp)
    15a2:	69a6                	ld	s3,72(sp)
    15a4:	6a06                	ld	s4,64(sp)
    15a6:	7ae2                	ld	s5,56(sp)
    15a8:	7b42                	ld	s6,48(sp)
    15aa:	614d                	add	sp,sp,176
    15ac:	8082                	ret
        switch (s[1])
    15ae:	07579663          	bne	a5,s5,161a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15b2:	6782                	ld	a5,0(sp)
    15b4:	45c1                	li	a1,16
    15b6:	4388                	lw	a0,0(a5)
    15b8:	07a1                	add	a5,a5,8
    15ba:	e03e                	sd	a5,0(sp)
    15bc:	bc9ff0ef          	jal	1184 <printint.constprop.0>
        s += 2;
    15c0:	00248513          	add	a0,s1,2
    15c4:	b7f9                	j	1592 <printf+0x1ae>
    15c6:	84b2                	mv	s1,a2
    15c8:	a039                	j	15d6 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15ca:	0024c783          	lbu	a5,2(s1)
    15ce:	0605                	add	a2,a2,1
    15d0:	0489                	add	s1,s1,2
    15d2:	e72794e3          	bne	a5,s2,143a <printf+0x56>
    15d6:	0014c783          	lbu	a5,1(s1)
    15da:	ff2788e3          	beq	a5,s2,15ca <printf+0x1e6>
        l = z - a;
    15de:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15e2:	85aa                	mv	a1,a0
    15e4:	8622                	mv	a2,s0
    15e6:	4505                	li	a0,1
    15e8:	732000ef          	jal	1d1a <write>
        if (l)
    15ec:	e60400e3          	beqz	s0,144c <printf+0x68>
    15f0:	8526                	mv	a0,s1
    15f2:	bd05                	j	1422 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15f4:	6782                	ld	a5,0(sp)
    15f6:	6380                	ld	s0,0(a5)
    15f8:	07a1                	add	a5,a5,8
    15fa:	e03e                	sd	a5,0(sp)
    15fc:	cc21                	beqz	s0,1654 <printf+0x270>
            l = strnlen(a, 200);
    15fe:	0c800593          	li	a1,200
    1602:	8522                	mv	a0,s0
    1604:	424000ef          	jal	1a28 <strnlen>
    write(f, s, l);
    1608:	0005061b          	sext.w	a2,a0
    160c:	85a2                	mv	a1,s0
    160e:	4505                	li	a0,1
    1610:	70a000ef          	jal	1d1a <write>
        s += 2;
    1614:	00248513          	add	a0,s1,2
    1618:	bfad                	j	1592 <printf+0x1ae>
    return write(stdout, &byte, 1);
    161a:	4605                	li	a2,1
    161c:	002c                	add	a1,sp,8
    161e:	4505                	li	a0,1
    char byte = c;
    1620:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1624:	6f6000ef          	jal	1d1a <write>
    char byte = c;
    1628:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    162c:	4605                	li	a2,1
    162e:	002c                	add	a1,sp,8
    1630:	4505                	li	a0,1
    char byte = c;
    1632:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1636:	6e4000ef          	jal	1d1a <write>
        s += 2;
    163a:	00248513          	add	a0,s1,2
    163e:	bf91                	j	1592 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1640:	6782                	ld	a5,0(sp)
    1642:	45a9                	li	a1,10
    1644:	4388                	lw	a0,0(a5)
    1646:	07a1                	add	a5,a5,8
    1648:	e03e                	sd	a5,0(sp)
    164a:	b3bff0ef          	jal	1184 <printint.constprop.0>
        s += 2;
    164e:	00248513          	add	a0,s1,2
    1652:	b781                	j	1592 <printf+0x1ae>
                a = "(null)";
    1654:	00001417          	auipc	s0,0x1
    1658:	a4c40413          	add	s0,s0,-1460 # 20a0 <__clone+0x128>
    165c:	b74d                	j	15fe <printf+0x21a>

000000000000165e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    165e:	1141                	add	sp,sp,-16
    1660:	e406                	sd	ra,8(sp)
    puts(m);
    1662:	d61ff0ef          	jal	13c2 <puts>
    exit(-100);
}
    1666:	60a2                	ld	ra,8(sp)
    exit(-100);
    1668:	f9c00513          	li	a0,-100
}
    166c:	0141                	add	sp,sp,16
    exit(-100);
    166e:	a719                	j	1d74 <exit>

0000000000001670 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1670:	02000793          	li	a5,32
    1674:	00f50663          	beq	a0,a5,1680 <isspace+0x10>
    1678:	355d                	addw	a0,a0,-9
    167a:	00553513          	sltiu	a0,a0,5
    167e:	8082                	ret
    1680:	4505                	li	a0,1
}
    1682:	8082                	ret

0000000000001684 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1684:	fd05051b          	addw	a0,a0,-48
}
    1688:	00a53513          	sltiu	a0,a0,10
    168c:	8082                	ret

000000000000168e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    168e:	02000693          	li	a3,32
    1692:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1694:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1698:	ff77871b          	addw	a4,a5,-9
    169c:	04d78c63          	beq	a5,a3,16f4 <atoi+0x66>
    16a0:	0007861b          	sext.w	a2,a5
    16a4:	04e5f863          	bgeu	a1,a4,16f4 <atoi+0x66>
        s++;
    switch (*s)
    16a8:	02b00713          	li	a4,43
    16ac:	04e78963          	beq	a5,a4,16fe <atoi+0x70>
    16b0:	02d00713          	li	a4,45
    16b4:	06e78263          	beq	a5,a4,1718 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16b8:	fd06069b          	addw	a3,a2,-48
    16bc:	47a5                	li	a5,9
    16be:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16c0:	4301                	li	t1,0
    while (isdigit(*s))
    16c2:	04d7e963          	bltu	a5,a3,1714 <atoi+0x86>
    int n = 0, neg = 0;
    16c6:	4501                	li	a0,0
    while (isdigit(*s))
    16c8:	48a5                	li	a7,9
    16ca:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16ce:	0025179b          	sllw	a5,a0,0x2
    16d2:	9fa9                	addw	a5,a5,a0
    16d4:	fd06059b          	addw	a1,a2,-48
    16d8:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16dc:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16e0:	0705                	add	a4,a4,1
    16e2:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16e6:	0006861b          	sext.w	a2,a3
    16ea:	ff08f0e3          	bgeu	a7,a6,16ca <atoi+0x3c>
    return neg ? n : -n;
    16ee:	00030563          	beqz	t1,16f8 <atoi+0x6a>
}
    16f2:	8082                	ret
        s++;
    16f4:	0505                	add	a0,a0,1
    16f6:	bf79                	j	1694 <atoi+0x6>
    return neg ? n : -n;
    16f8:	40f5853b          	subw	a0,a1,a5
    16fc:	8082                	ret
    while (isdigit(*s))
    16fe:	00154603          	lbu	a2,1(a0)
    1702:	47a5                	li	a5,9
        s++;
    1704:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1708:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    170c:	4301                	li	t1,0
    while (isdigit(*s))
    170e:	2601                	sext.w	a2,a2
    1710:	fad7fbe3          	bgeu	a5,a3,16c6 <atoi+0x38>
    1714:	4501                	li	a0,0
}
    1716:	8082                	ret
    while (isdigit(*s))
    1718:	00154603          	lbu	a2,1(a0)
    171c:	47a5                	li	a5,9
        s++;
    171e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1722:	fd06069b          	addw	a3,a2,-48
    1726:	2601                	sext.w	a2,a2
    1728:	fed7e6e3          	bltu	a5,a3,1714 <atoi+0x86>
        neg = 1;
    172c:	4305                	li	t1,1
    172e:	bf61                	j	16c6 <atoi+0x38>

0000000000001730 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1730:	18060163          	beqz	a2,18b2 <memset+0x182>
    1734:	40a006b3          	neg	a3,a0
    1738:	0076f793          	and	a5,a3,7
    173c:	00778813          	add	a6,a5,7
    1740:	48ad                	li	a7,11
    1742:	0ff5f713          	zext.b	a4,a1
    1746:	fff60593          	add	a1,a2,-1
    174a:	17186563          	bltu	a6,a7,18b4 <memset+0x184>
    174e:	1705ed63          	bltu	a1,a6,18c8 <memset+0x198>
    1752:	16078363          	beqz	a5,18b8 <memset+0x188>
    1756:	00e50023          	sb	a4,0(a0)
    175a:	0066f593          	and	a1,a3,6
    175e:	16058063          	beqz	a1,18be <memset+0x18e>
    1762:	00e500a3          	sb	a4,1(a0)
    1766:	4589                	li	a1,2
    1768:	16f5f363          	bgeu	a1,a5,18ce <memset+0x19e>
    176c:	00e50123          	sb	a4,2(a0)
    1770:	8a91                	and	a3,a3,4
    1772:	00350593          	add	a1,a0,3
    1776:	4e0d                	li	t3,3
    1778:	ce9d                	beqz	a3,17b6 <memset+0x86>
    177a:	00e501a3          	sb	a4,3(a0)
    177e:	4691                	li	a3,4
    1780:	00450593          	add	a1,a0,4
    1784:	4e11                	li	t3,4
    1786:	02f6f863          	bgeu	a3,a5,17b6 <memset+0x86>
    178a:	00e50223          	sb	a4,4(a0)
    178e:	4695                	li	a3,5
    1790:	00550593          	add	a1,a0,5
    1794:	4e15                	li	t3,5
    1796:	02d78063          	beq	a5,a3,17b6 <memset+0x86>
    179a:	fff50693          	add	a3,a0,-1
    179e:	00e502a3          	sb	a4,5(a0)
    17a2:	8a9d                	and	a3,a3,7
    17a4:	00650593          	add	a1,a0,6
    17a8:	4e19                	li	t3,6
    17aa:	e691                	bnez	a3,17b6 <memset+0x86>
    17ac:	00750593          	add	a1,a0,7
    17b0:	00e50323          	sb	a4,6(a0)
    17b4:	4e1d                	li	t3,7
    17b6:	00871693          	sll	a3,a4,0x8
    17ba:	01071813          	sll	a6,a4,0x10
    17be:	8ed9                	or	a3,a3,a4
    17c0:	01871893          	sll	a7,a4,0x18
    17c4:	0106e6b3          	or	a3,a3,a6
    17c8:	0116e6b3          	or	a3,a3,a7
    17cc:	02071813          	sll	a6,a4,0x20
    17d0:	02871313          	sll	t1,a4,0x28
    17d4:	0106e6b3          	or	a3,a3,a6
    17d8:	40f608b3          	sub	a7,a2,a5
    17dc:	03071813          	sll	a6,a4,0x30
    17e0:	0066e6b3          	or	a3,a3,t1
    17e4:	0106e6b3          	or	a3,a3,a6
    17e8:	03871313          	sll	t1,a4,0x38
    17ec:	97aa                	add	a5,a5,a0
    17ee:	ff88f813          	and	a6,a7,-8
    17f2:	0066e6b3          	or	a3,a3,t1
    17f6:	983e                	add	a6,a6,a5
    17f8:	e394                	sd	a3,0(a5)
    17fa:	07a1                	add	a5,a5,8
    17fc:	ff079ee3          	bne	a5,a6,17f8 <memset+0xc8>
    1800:	ff88f793          	and	a5,a7,-8
    1804:	0078f893          	and	a7,a7,7
    1808:	00f586b3          	add	a3,a1,a5
    180c:	01c787bb          	addw	a5,a5,t3
    1810:	0a088b63          	beqz	a7,18c6 <memset+0x196>
    1814:	00e68023          	sb	a4,0(a3)
    1818:	0017859b          	addw	a1,a5,1
    181c:	08c5fb63          	bgeu	a1,a2,18b2 <memset+0x182>
    1820:	00e680a3          	sb	a4,1(a3)
    1824:	0027859b          	addw	a1,a5,2
    1828:	08c5f563          	bgeu	a1,a2,18b2 <memset+0x182>
    182c:	00e68123          	sb	a4,2(a3)
    1830:	0037859b          	addw	a1,a5,3
    1834:	06c5ff63          	bgeu	a1,a2,18b2 <memset+0x182>
    1838:	00e681a3          	sb	a4,3(a3)
    183c:	0047859b          	addw	a1,a5,4
    1840:	06c5f963          	bgeu	a1,a2,18b2 <memset+0x182>
    1844:	00e68223          	sb	a4,4(a3)
    1848:	0057859b          	addw	a1,a5,5
    184c:	06c5f363          	bgeu	a1,a2,18b2 <memset+0x182>
    1850:	00e682a3          	sb	a4,5(a3)
    1854:	0067859b          	addw	a1,a5,6
    1858:	04c5fd63          	bgeu	a1,a2,18b2 <memset+0x182>
    185c:	00e68323          	sb	a4,6(a3)
    1860:	0077859b          	addw	a1,a5,7
    1864:	04c5f763          	bgeu	a1,a2,18b2 <memset+0x182>
    1868:	00e683a3          	sb	a4,7(a3)
    186c:	0087859b          	addw	a1,a5,8
    1870:	04c5f163          	bgeu	a1,a2,18b2 <memset+0x182>
    1874:	00e68423          	sb	a4,8(a3)
    1878:	0097859b          	addw	a1,a5,9
    187c:	02c5fb63          	bgeu	a1,a2,18b2 <memset+0x182>
    1880:	00e684a3          	sb	a4,9(a3)
    1884:	00a7859b          	addw	a1,a5,10
    1888:	02c5f563          	bgeu	a1,a2,18b2 <memset+0x182>
    188c:	00e68523          	sb	a4,10(a3)
    1890:	00b7859b          	addw	a1,a5,11
    1894:	00c5ff63          	bgeu	a1,a2,18b2 <memset+0x182>
    1898:	00e685a3          	sb	a4,11(a3)
    189c:	00c7859b          	addw	a1,a5,12
    18a0:	00c5f963          	bgeu	a1,a2,18b2 <memset+0x182>
    18a4:	00e68623          	sb	a4,12(a3)
    18a8:	27b5                	addw	a5,a5,13
    18aa:	00c7f463          	bgeu	a5,a2,18b2 <memset+0x182>
    18ae:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18b2:	8082                	ret
    18b4:	482d                	li	a6,11
    18b6:	bd61                	j	174e <memset+0x1e>
    char *p = dest;
    18b8:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18ba:	4e01                	li	t3,0
    18bc:	bded                	j	17b6 <memset+0x86>
    18be:	00150593          	add	a1,a0,1
    18c2:	4e05                	li	t3,1
    18c4:	bdcd                	j	17b6 <memset+0x86>
    18c6:	8082                	ret
    char *p = dest;
    18c8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18ca:	4781                	li	a5,0
    18cc:	b7a1                	j	1814 <memset+0xe4>
    18ce:	00250593          	add	a1,a0,2
    18d2:	4e09                	li	t3,2
    18d4:	b5cd                	j	17b6 <memset+0x86>

00000000000018d6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18d6:	00054783          	lbu	a5,0(a0)
    18da:	0005c703          	lbu	a4,0(a1)
    18de:	00e79863          	bne	a5,a4,18ee <strcmp+0x18>
    18e2:	0505                	add	a0,a0,1
    18e4:	0585                	add	a1,a1,1
    18e6:	fbe5                	bnez	a5,18d6 <strcmp>
    18e8:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18ea:	9d19                	subw	a0,a0,a4
    18ec:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18ee:	0007851b          	sext.w	a0,a5
    18f2:	bfe5                	j	18ea <strcmp+0x14>

00000000000018f4 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18f4:	ca15                	beqz	a2,1928 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18f6:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18fa:	167d                	add	a2,a2,-1
    18fc:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1900:	eb99                	bnez	a5,1916 <strncmp+0x22>
    1902:	a815                	j	1936 <strncmp+0x42>
    1904:	00a68e63          	beq	a3,a0,1920 <strncmp+0x2c>
    1908:	0505                	add	a0,a0,1
    190a:	00f71b63          	bne	a4,a5,1920 <strncmp+0x2c>
    190e:	00054783          	lbu	a5,0(a0)
    1912:	cf89                	beqz	a5,192c <strncmp+0x38>
    1914:	85b2                	mv	a1,a2
    1916:	0005c703          	lbu	a4,0(a1)
    191a:	00158613          	add	a2,a1,1
    191e:	f37d                	bnez	a4,1904 <strncmp+0x10>
        ;
    return *l - *r;
    1920:	0007851b          	sext.w	a0,a5
    1924:	9d19                	subw	a0,a0,a4
    1926:	8082                	ret
        return 0;
    1928:	4501                	li	a0,0
}
    192a:	8082                	ret
    return *l - *r;
    192c:	0015c703          	lbu	a4,1(a1)
    1930:	4501                	li	a0,0
    1932:	9d19                	subw	a0,a0,a4
    1934:	8082                	ret
    1936:	0005c703          	lbu	a4,0(a1)
    193a:	4501                	li	a0,0
    193c:	b7e5                	j	1924 <strncmp+0x30>

000000000000193e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    193e:	00757793          	and	a5,a0,7
    1942:	cf89                	beqz	a5,195c <strlen+0x1e>
    1944:	87aa                	mv	a5,a0
    1946:	a029                	j	1950 <strlen+0x12>
    1948:	0785                	add	a5,a5,1
    194a:	0077f713          	and	a4,a5,7
    194e:	cb01                	beqz	a4,195e <strlen+0x20>
        if (!*s)
    1950:	0007c703          	lbu	a4,0(a5)
    1954:	fb75                	bnez	a4,1948 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1956:	40a78533          	sub	a0,a5,a0
}
    195a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    195c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    195e:	6394                	ld	a3,0(a5)
    1960:	00000597          	auipc	a1,0x0
    1964:	7485b583          	ld	a1,1864(a1) # 20a8 <__clone+0x130>
    1968:	00000617          	auipc	a2,0x0
    196c:	74863603          	ld	a2,1864(a2) # 20b0 <__clone+0x138>
    1970:	a019                	j	1976 <strlen+0x38>
    1972:	6794                	ld	a3,8(a5)
    1974:	07a1                	add	a5,a5,8
    1976:	00b68733          	add	a4,a3,a1
    197a:	fff6c693          	not	a3,a3
    197e:	8f75                	and	a4,a4,a3
    1980:	8f71                	and	a4,a4,a2
    1982:	db65                	beqz	a4,1972 <strlen+0x34>
    for (; *s; s++)
    1984:	0007c703          	lbu	a4,0(a5)
    1988:	d779                	beqz	a4,1956 <strlen+0x18>
    198a:	0017c703          	lbu	a4,1(a5)
    198e:	0785                	add	a5,a5,1
    1990:	d379                	beqz	a4,1956 <strlen+0x18>
    1992:	0017c703          	lbu	a4,1(a5)
    1996:	0785                	add	a5,a5,1
    1998:	fb6d                	bnez	a4,198a <strlen+0x4c>
    199a:	bf75                	j	1956 <strlen+0x18>

000000000000199c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    199c:	00757713          	and	a4,a0,7
{
    19a0:	87aa                	mv	a5,a0
    19a2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a6:	cb19                	beqz	a4,19bc <memchr+0x20>
    19a8:	ce25                	beqz	a2,1a20 <memchr+0x84>
    19aa:	0007c703          	lbu	a4,0(a5)
    19ae:	00b70763          	beq	a4,a1,19bc <memchr+0x20>
    19b2:	0785                	add	a5,a5,1
    19b4:	0077f713          	and	a4,a5,7
    19b8:	167d                	add	a2,a2,-1
    19ba:	f77d                	bnez	a4,19a8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19bc:	4501                	li	a0,0
    if (n && *s != c)
    19be:	c235                	beqz	a2,1a22 <memchr+0x86>
    19c0:	0007c703          	lbu	a4,0(a5)
    19c4:	06b70063          	beq	a4,a1,1a24 <memchr+0x88>
        size_t k = ONES * c;
    19c8:	00000517          	auipc	a0,0x0
    19cc:	6f053503          	ld	a0,1776(a0) # 20b8 <__clone+0x140>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d0:	471d                	li	a4,7
        size_t k = ONES * c;
    19d2:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d6:	04c77763          	bgeu	a4,a2,1a24 <memchr+0x88>
    19da:	00000897          	auipc	a7,0x0
    19de:	6ce8b883          	ld	a7,1742(a7) # 20a8 <__clone+0x130>
    19e2:	00000817          	auipc	a6,0x0
    19e6:	6ce83803          	ld	a6,1742(a6) # 20b0 <__clone+0x138>
    19ea:	431d                	li	t1,7
    19ec:	a029                	j	19f6 <memchr+0x5a>
    19ee:	1661                	add	a2,a2,-8
    19f0:	07a1                	add	a5,a5,8
    19f2:	00c37c63          	bgeu	t1,a2,1a0a <memchr+0x6e>
    19f6:	6398                	ld	a4,0(a5)
    19f8:	8f29                	xor	a4,a4,a0
    19fa:	011706b3          	add	a3,a4,a7
    19fe:	fff74713          	not	a4,a4
    1a02:	8f75                	and	a4,a4,a3
    1a04:	01077733          	and	a4,a4,a6
    1a08:	d37d                	beqz	a4,19ee <memchr+0x52>
    1a0a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a0c:	e601                	bnez	a2,1a14 <memchr+0x78>
    1a0e:	a809                	j	1a20 <memchr+0x84>
    1a10:	0505                	add	a0,a0,1
    1a12:	c619                	beqz	a2,1a20 <memchr+0x84>
    1a14:	00054783          	lbu	a5,0(a0)
    1a18:	167d                	add	a2,a2,-1
    1a1a:	feb79be3          	bne	a5,a1,1a10 <memchr+0x74>
    1a1e:	8082                	ret
    return n ? (void *)s : 0;
    1a20:	4501                	li	a0,0
}
    1a22:	8082                	ret
    if (n && *s != c)
    1a24:	853e                	mv	a0,a5
    1a26:	b7fd                	j	1a14 <memchr+0x78>

0000000000001a28 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a28:	1101                	add	sp,sp,-32
    1a2a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a2c:	862e                	mv	a2,a1
{
    1a2e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a30:	4581                	li	a1,0
{
    1a32:	e426                	sd	s1,8(sp)
    1a34:	ec06                	sd	ra,24(sp)
    1a36:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a38:	f65ff0ef          	jal	199c <memchr>
    return p ? p - s : n;
    1a3c:	c519                	beqz	a0,1a4a <strnlen+0x22>
}
    1a3e:	60e2                	ld	ra,24(sp)
    1a40:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a42:	8d05                	sub	a0,a0,s1
}
    1a44:	64a2                	ld	s1,8(sp)
    1a46:	6105                	add	sp,sp,32
    1a48:	8082                	ret
    1a4a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a4c:	8522                	mv	a0,s0
}
    1a4e:	6442                	ld	s0,16(sp)
    1a50:	64a2                	ld	s1,8(sp)
    1a52:	6105                	add	sp,sp,32
    1a54:	8082                	ret

0000000000001a56 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a56:	00a5c7b3          	xor	a5,a1,a0
    1a5a:	8b9d                	and	a5,a5,7
    1a5c:	eb95                	bnez	a5,1a90 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a5e:	0075f793          	and	a5,a1,7
    1a62:	e7b1                	bnez	a5,1aae <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a64:	6198                	ld	a4,0(a1)
    1a66:	00000617          	auipc	a2,0x0
    1a6a:	64263603          	ld	a2,1602(a2) # 20a8 <__clone+0x130>
    1a6e:	00000817          	auipc	a6,0x0
    1a72:	64283803          	ld	a6,1602(a6) # 20b0 <__clone+0x138>
    1a76:	a029                	j	1a80 <strcpy+0x2a>
    1a78:	05a1                	add	a1,a1,8
    1a7a:	e118                	sd	a4,0(a0)
    1a7c:	6198                	ld	a4,0(a1)
    1a7e:	0521                	add	a0,a0,8
    1a80:	00c707b3          	add	a5,a4,a2
    1a84:	fff74693          	not	a3,a4
    1a88:	8ff5                	and	a5,a5,a3
    1a8a:	0107f7b3          	and	a5,a5,a6
    1a8e:	d7ed                	beqz	a5,1a78 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a90:	0005c783          	lbu	a5,0(a1)
    1a94:	00f50023          	sb	a5,0(a0)
    1a98:	c785                	beqz	a5,1ac0 <strcpy+0x6a>
    1a9a:	0015c783          	lbu	a5,1(a1)
    1a9e:	0505                	add	a0,a0,1
    1aa0:	0585                	add	a1,a1,1
    1aa2:	00f50023          	sb	a5,0(a0)
    1aa6:	fbf5                	bnez	a5,1a9a <strcpy+0x44>
        ;
    return d;
}
    1aa8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aaa:	0505                	add	a0,a0,1
    1aac:	df45                	beqz	a4,1a64 <strcpy+0xe>
            if (!(*d = *s))
    1aae:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ab2:	0585                	add	a1,a1,1
    1ab4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	f7fd                	bnez	a5,1aaa <strcpy+0x54>
}
    1abe:	8082                	ret
    1ac0:	8082                	ret

0000000000001ac2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac2:	00a5c7b3          	xor	a5,a1,a0
    1ac6:	8b9d                	and	a5,a5,7
    1ac8:	e3b5                	bnez	a5,1b2c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aca:	0075f793          	and	a5,a1,7
    1ace:	cf99                	beqz	a5,1aec <strncpy+0x2a>
    1ad0:	ea09                	bnez	a2,1ae2 <strncpy+0x20>
    1ad2:	a421                	j	1cda <strncpy+0x218>
    1ad4:	0585                	add	a1,a1,1
    1ad6:	0075f793          	and	a5,a1,7
    1ada:	167d                	add	a2,a2,-1
    1adc:	0505                	add	a0,a0,1
    1ade:	c799                	beqz	a5,1aec <strncpy+0x2a>
    1ae0:	c225                	beqz	a2,1b40 <strncpy+0x7e>
    1ae2:	0005c783          	lbu	a5,0(a1)
    1ae6:	00f50023          	sb	a5,0(a0)
    1aea:	f7ed                	bnez	a5,1ad4 <strncpy+0x12>
            ;
        if (!n || !*s)
    1aec:	ca31                	beqz	a2,1b40 <strncpy+0x7e>
    1aee:	0005c783          	lbu	a5,0(a1)
    1af2:	cba1                	beqz	a5,1b42 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af4:	479d                	li	a5,7
    1af6:	02c7fc63          	bgeu	a5,a2,1b2e <strncpy+0x6c>
    1afa:	00000897          	auipc	a7,0x0
    1afe:	5ae8b883          	ld	a7,1454(a7) # 20a8 <__clone+0x130>
    1b02:	00000817          	auipc	a6,0x0
    1b06:	5ae83803          	ld	a6,1454(a6) # 20b0 <__clone+0x138>
    1b0a:	431d                	li	t1,7
    1b0c:	a039                	j	1b1a <strncpy+0x58>
            *wd = *ws;
    1b0e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b10:	1661                	add	a2,a2,-8
    1b12:	05a1                	add	a1,a1,8
    1b14:	0521                	add	a0,a0,8
    1b16:	00c37b63          	bgeu	t1,a2,1b2c <strncpy+0x6a>
    1b1a:	6198                	ld	a4,0(a1)
    1b1c:	011707b3          	add	a5,a4,a7
    1b20:	fff74693          	not	a3,a4
    1b24:	8ff5                	and	a5,a5,a3
    1b26:	0107f7b3          	and	a5,a5,a6
    1b2a:	d3f5                	beqz	a5,1b0e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b2c:	ca11                	beqz	a2,1b40 <strncpy+0x7e>
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	0585                	add	a1,a1,1
    1b34:	00f50023          	sb	a5,0(a0)
    1b38:	c789                	beqz	a5,1b42 <strncpy+0x80>
    1b3a:	167d                	add	a2,a2,-1
    1b3c:	0505                	add	a0,a0,1
    1b3e:	fa65                	bnez	a2,1b2e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b40:	8082                	ret
    1b42:	4805                	li	a6,1
    1b44:	14061b63          	bnez	a2,1c9a <strncpy+0x1d8>
    1b48:	40a00733          	neg	a4,a0
    1b4c:	00777793          	and	a5,a4,7
    1b50:	4581                	li	a1,0
    1b52:	12061c63          	bnez	a2,1c8a <strncpy+0x1c8>
    1b56:	00778693          	add	a3,a5,7
    1b5a:	48ad                	li	a7,11
    1b5c:	1316e563          	bltu	a3,a7,1c86 <strncpy+0x1c4>
    1b60:	16d5e263          	bltu	a1,a3,1cc4 <strncpy+0x202>
    1b64:	14078c63          	beqz	a5,1cbc <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b68:	00050023          	sb	zero,0(a0)
    1b6c:	00677693          	and	a3,a4,6
    1b70:	14068263          	beqz	a3,1cb4 <strncpy+0x1f2>
    1b74:	000500a3          	sb	zero,1(a0)
    1b78:	4689                	li	a3,2
    1b7a:	14f6f863          	bgeu	a3,a5,1cca <strncpy+0x208>
    1b7e:	00050123          	sb	zero,2(a0)
    1b82:	8b11                	and	a4,a4,4
    1b84:	12070463          	beqz	a4,1cac <strncpy+0x1ea>
    1b88:	000501a3          	sb	zero,3(a0)
    1b8c:	4711                	li	a4,4
    1b8e:	00450693          	add	a3,a0,4
    1b92:	02f77563          	bgeu	a4,a5,1bbc <strncpy+0xfa>
    1b96:	00050223          	sb	zero,4(a0)
    1b9a:	4715                	li	a4,5
    1b9c:	00550693          	add	a3,a0,5
    1ba0:	00e78e63          	beq	a5,a4,1bbc <strncpy+0xfa>
    1ba4:	fff50713          	add	a4,a0,-1
    1ba8:	000502a3          	sb	zero,5(a0)
    1bac:	8b1d                	and	a4,a4,7
    1bae:	12071263          	bnez	a4,1cd2 <strncpy+0x210>
    1bb2:	00750693          	add	a3,a0,7
    1bb6:	00050323          	sb	zero,6(a0)
    1bba:	471d                	li	a4,7
    1bbc:	40f80833          	sub	a6,a6,a5
    1bc0:	ff887593          	and	a1,a6,-8
    1bc4:	97aa                	add	a5,a5,a0
    1bc6:	95be                	add	a1,a1,a5
    1bc8:	0007b023          	sd	zero,0(a5)
    1bcc:	07a1                	add	a5,a5,8
    1bce:	feb79de3          	bne	a5,a1,1bc8 <strncpy+0x106>
    1bd2:	ff887593          	and	a1,a6,-8
    1bd6:	00787813          	and	a6,a6,7
    1bda:	00e587bb          	addw	a5,a1,a4
    1bde:	00b68733          	add	a4,a3,a1
    1be2:	0e080063          	beqz	a6,1cc2 <strncpy+0x200>
    1be6:	00070023          	sb	zero,0(a4)
    1bea:	0017869b          	addw	a3,a5,1
    1bee:	f4c6f9e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1bf2:	000700a3          	sb	zero,1(a4)
    1bf6:	0027869b          	addw	a3,a5,2
    1bfa:	f4c6f3e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1bfe:	00070123          	sb	zero,2(a4)
    1c02:	0037869b          	addw	a3,a5,3
    1c06:	f2c6fde3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c0a:	000701a3          	sb	zero,3(a4)
    1c0e:	0047869b          	addw	a3,a5,4
    1c12:	f2c6f7e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c16:	00070223          	sb	zero,4(a4)
    1c1a:	0057869b          	addw	a3,a5,5
    1c1e:	f2c6f1e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c22:	000702a3          	sb	zero,5(a4)
    1c26:	0067869b          	addw	a3,a5,6
    1c2a:	f0c6fbe3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c2e:	00070323          	sb	zero,6(a4)
    1c32:	0077869b          	addw	a3,a5,7
    1c36:	f0c6f5e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c3a:	000703a3          	sb	zero,7(a4)
    1c3e:	0087869b          	addw	a3,a5,8
    1c42:	eec6ffe3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c46:	00070423          	sb	zero,8(a4)
    1c4a:	0097869b          	addw	a3,a5,9
    1c4e:	eec6f9e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c52:	000704a3          	sb	zero,9(a4)
    1c56:	00a7869b          	addw	a3,a5,10
    1c5a:	eec6f3e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c5e:	00070523          	sb	zero,10(a4)
    1c62:	00b7869b          	addw	a3,a5,11
    1c66:	ecc6fde3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c6a:	000705a3          	sb	zero,11(a4)
    1c6e:	00c7869b          	addw	a3,a5,12
    1c72:	ecc6f7e3          	bgeu	a3,a2,1b40 <strncpy+0x7e>
    1c76:	00070623          	sb	zero,12(a4)
    1c7a:	27b5                	addw	a5,a5,13
    1c7c:	ecc7f2e3          	bgeu	a5,a2,1b40 <strncpy+0x7e>
    1c80:	000706a3          	sb	zero,13(a4)
}
    1c84:	8082                	ret
    1c86:	46ad                	li	a3,11
    1c88:	bde1                	j	1b60 <strncpy+0x9e>
    1c8a:	00778693          	add	a3,a5,7
    1c8e:	48ad                	li	a7,11
    1c90:	fff60593          	add	a1,a2,-1
    1c94:	ed16f6e3          	bgeu	a3,a7,1b60 <strncpy+0x9e>
    1c98:	b7fd                	j	1c86 <strncpy+0x1c4>
    1c9a:	40a00733          	neg	a4,a0
    1c9e:	8832                	mv	a6,a2
    1ca0:	00777793          	and	a5,a4,7
    1ca4:	4581                	li	a1,0
    1ca6:	ea0608e3          	beqz	a2,1b56 <strncpy+0x94>
    1caa:	b7c5                	j	1c8a <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cac:	00350693          	add	a3,a0,3
    1cb0:	470d                	li	a4,3
    1cb2:	b729                	j	1bbc <strncpy+0xfa>
    1cb4:	00150693          	add	a3,a0,1
    1cb8:	4705                	li	a4,1
    1cba:	b709                	j	1bbc <strncpy+0xfa>
tail:
    1cbc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cbe:	4701                	li	a4,0
    1cc0:	bdf5                	j	1bbc <strncpy+0xfa>
    1cc2:	8082                	ret
tail:
    1cc4:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cc6:	4781                	li	a5,0
    1cc8:	bf39                	j	1be6 <strncpy+0x124>
    1cca:	00250693          	add	a3,a0,2
    1cce:	4709                	li	a4,2
    1cd0:	b5f5                	j	1bbc <strncpy+0xfa>
    1cd2:	00650693          	add	a3,a0,6
    1cd6:	4719                	li	a4,6
    1cd8:	b5d5                	j	1bbc <strncpy+0xfa>
    1cda:	8082                	ret

0000000000001cdc <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cdc:	87aa                	mv	a5,a0
    1cde:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1ce0:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ce4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ce8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cea:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cec:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <openat>:
    register long a7 __asm__("a7") = n;
    1cf4:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cf8:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfc:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <close>:
    register long a7 __asm__("a7") = n;
    1d04:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d08:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <read>:
    register long a7 __asm__("a7") = n;
    1d10:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d14:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d18:	8082                	ret

0000000000001d1a <write>:
    register long a7 __asm__("a7") = n;
    1d1a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d22:	8082                	ret

0000000000001d24 <getpid>:
    register long a7 __asm__("a7") = n;
    1d24:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d28:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <getppid>:
    register long a7 __asm__("a7") = n;
    1d30:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d34:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d3c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d40:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <fork>:
    register long a7 __asm__("a7") = n;
    1d48:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d4c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d4e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d58:	85b2                	mv	a1,a2
    1d5a:	863a                	mv	a2,a4
    if (stack)
    1d5c:	c191                	beqz	a1,1d60 <clone+0x8>
	stack += stack_size;
    1d5e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d60:	4781                	li	a5,0
    1d62:	4701                	li	a4,0
    1d64:	4681                	li	a3,0
    1d66:	2601                	sext.w	a2,a2
    1d68:	ac01                	j	1f78 <__clone>

0000000000001d6a <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d6a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d6e:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d72:	8082                	ret

0000000000001d74 <exit>:
    register long a7 __asm__("a7") = n;
    1d74:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d7c:	8082                	ret

0000000000001d7e <waitpid>:
    register long a7 __asm__("a7") = n;
    1d7e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d82:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d84:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <exec>:
    register long a7 __asm__("a7") = n;
    1d8c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d90:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <execve>:
    register long a7 __asm__("a7") = n;
    1d98:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <times>:
    register long a7 __asm__("a7") = n;
    1da4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <get_time>:

int64 get_time()
{
    1db0:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1db2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1db6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1db8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	ed09                	bnez	a0,1dda <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dc2:	67a2                	ld	a5,8(sp)
    1dc4:	3e800713          	li	a4,1000
    1dc8:	00015503          	lhu	a0,0(sp)
    1dcc:	02e7d7b3          	divu	a5,a5,a4
    1dd0:	02e50533          	mul	a0,a0,a4
    1dd4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dd6:	0141                	add	sp,sp,16
    1dd8:	8082                	ret
        return -1;
    1dda:	557d                	li	a0,-1
    1ddc:	bfed                	j	1dd6 <get_time+0x26>

0000000000001dde <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dde:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <time>:
    register long a7 __asm__("a7") = n;
    1dea:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dee:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <sleep>:

int sleep(unsigned long long time)
{
    1df6:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1df8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dfa:	850a                	mv	a0,sp
    1dfc:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dfe:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e02:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e04:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e08:	e501                	bnez	a0,1e10 <sleep+0x1a>
    return 0;
    1e0a:	4501                	li	a0,0
}
    1e0c:	0141                	add	sp,sp,16
    1e0e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e10:	4502                	lw	a0,0(sp)
}
    1e12:	0141                	add	sp,sp,16
    1e14:	8082                	ret

0000000000001e16 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e16:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e1a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e22:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e26:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e2a:	8082                	ret

0000000000001e2c <mprotect>:
    register long a7 __asm__("a7") = n;
    1e2c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e30:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <munmap>:
    register long a7 __asm__("a7") = n;
    1e38:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <wait>:

int wait(int *code)
{
    1e44:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e46:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e4a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e4c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e4e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e50:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <spawn>:
    register long a7 __asm__("a7") = n;
    1e58:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <mailread>:
    register long a7 __asm__("a7") = n;
    1e64:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e70:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <fstat>:
    register long a7 __asm__("a7") = n;
    1e7c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e88:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e8a:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e8e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e90:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e98:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e9a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e9e:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ea8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eaa:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eae:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <link>:

int link(char *old_path, char *new_path)
{
    1eb8:	87aa                	mv	a5,a0
    1eba:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ebc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ec0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ec4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ec6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1eca:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ecc:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <unlink>:

int unlink(char *path)
{
    1ed4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed6:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1eda:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ede:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <uname>:
    register long a7 __asm__("a7") = n;
    1ee8:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eec:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <brk>:
    register long a7 __asm__("a7") = n;
    1ef4:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ef8:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f00:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f02:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f06:	8082                	ret

0000000000001f08 <chdir>:
    register long a7 __asm__("a7") = n;
    1f08:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f0c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f14:	862e                	mv	a2,a1
    1f16:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f18:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f1a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f1e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f22:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f24:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f26:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <getdents>:
    register long a7 __asm__("a7") = n;
    1f2e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f32:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <pipe>:
    register long a7 __asm__("a7") = n;
    1f3a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f3e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f40:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <dup>:
    register long a7 __asm__("a7") = n;
    1f48:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f4a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <dup2>:
    register long a7 __asm__("a7") = n;
    1f52:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f54:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f56:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <mount>:
    register long a7 __asm__("a7") = n;
    1f5e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f62:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <umount>:
    register long a7 __asm__("a7") = n;
    1f6a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f6e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f70:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f78:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f7a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f7c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f7e:	8532                	mv	a0,a2
	mv a2, a4
    1f80:	863a                	mv	a2,a4
	mv a3, a5
    1f82:	86be                	mv	a3,a5
	mv a4, a6
    1f84:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f86:	0dc00893          	li	a7,220
	ecall
    1f8a:	00000073          	ecall

	beqz a0, 1f
    1f8e:	c111                	beqz	a0,1f92 <__clone+0x1a>
	# Parent
	ret
    1f90:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f92:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f94:	6522                	ld	a0,8(sp)
	jalr a1
    1f96:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f98:	05d00893          	li	a7,93
	ecall
    1f9c:	00000073          	ecall
