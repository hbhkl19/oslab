
/home/hbh/oslab/oslab/user/build/riscv64/mprotect_basic:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa05                	j	1132 <__start_main>

0000000000001004 <test_mprotect_basic>:
#include "stdlib.h"

static struct kstat kst;

void test_mprotect_basic(void)
{
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6250513          	add	a0,a0,-158 # 1f68 <__clone+0x28>
{
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    1014:	e84a                	sd	s2,16(sp)
    1016:	e44e                	sd	s3,8(sp)
    TEST_START(__func__);
    1018:	372000ef          	jal	138a <puts>
    101c:	00001517          	auipc	a0,0x1
    1020:	0c450513          	add	a0,a0,196 # 20e0 <__func__.0>
    1024:	366000ef          	jal	138a <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	f5850513          	add	a0,a0,-168 # 1f80 <__clone+0x40>
    1030:	35a000ef          	jal	138a <puts>

    const char *str = "  Hello, mmap successfully!";
    int fd = open("test_mprotect.txt", O_RDWR | O_CREATE);
    1034:	04200593          	li	a1,66
    1038:	00001517          	auipc	a0,0x1
    103c:	f5850513          	add	a0,a0,-168 # 1f90 <__clone+0x50>
    1040:	465000ef          	jal	1ca4 <open>
    1044:	842a                	mv	s0,a0
    assert(fd > 0);
    1046:	0ca05763          	blez	a0,1114 <test_mprotect_basic+0x110>
    write(fd, str, strlen(str));
    104a:	00001517          	auipc	a0,0x1
    104e:	f7e50513          	add	a0,a0,-130 # 1fc8 <__clone+0x88>
    1052:	0b5000ef          	jal	1906 <strlen>
    1056:	862a                	mv	a2,a0
    1058:	00001597          	auipc	a1,0x1
    105c:	f7058593          	add	a1,a1,-144 # 1fc8 <__clone+0x88>
    1060:	8522                	mv	a0,s0
    1062:	481000ef          	jal	1ce2 <write>
    fstat(fd, &kst);
    1066:	00001917          	auipc	s2,0x1
    106a:	ffa90913          	add	s2,s2,-6 # 2060 <kst>
    106e:	85ca                	mv	a1,s2
    1070:	8522                	mv	a0,s0
    1072:	5d3000ef          	jal	1e44 <fstat>

    char *array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1076:	03093583          	ld	a1,48(s2)
    107a:	4781                	li	a5,0
    107c:	8722                	mv	a4,s0
    107e:	4685                	li	a3,1
    1080:	460d                	li	a2,3
    1082:	4501                	li	a0,0
    1084:	567000ef          	jal	1dea <mmap>
    if(array == MAP_FAILED) {
    1088:	57fd                	li	a5,-1
    char *array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    108a:	84aa                	mv	s1,a0
    if(array == MAP_FAILED) {
    108c:	06f50d63          	beq	a0,a5,1106 <test_mprotect_basic+0x102>
        printf("mprotect mmap failed.\n");
    } else {
        int ret = mprotect(array, kst.st_size, PROT_READ);
    1090:	03093583          	ld	a1,48(s2)
    1094:	4605                	li	a2,1
    1096:	55f000ef          	jal	1df4 <mprotect>
    109a:	89aa                	mv	s3,a0
        printf("mprotect ret: %d\n", ret);
    109c:	85aa                	mv	a1,a0
    109e:	00001517          	auipc	a0,0x1
    10a2:	f6250513          	add	a0,a0,-158 # 2000 <__clone+0xc0>
    10a6:	306000ef          	jal	13ac <printf>
        assert(ret == 0);
    10aa:	04099763          	bnez	s3,10f8 <test_mprotect_basic+0xf4>
        printf("mprotect success.\n");
    10ae:	00001517          	auipc	a0,0x1
    10b2:	f6a50513          	add	a0,a0,-150 # 2018 <__clone+0xd8>
    10b6:	2f6000ef          	jal	13ac <printf>
        munmap(array, kst.st_size);
    10ba:	03093583          	ld	a1,48(s2)
    10be:	8526                	mv	a0,s1
    10c0:	541000ef          	jal	1e00 <munmap>
    }
    close(fd);
    10c4:	8522                	mv	a0,s0
    10c6:	407000ef          	jal	1ccc <close>

    TEST_END(__func__);
    10ca:	00001517          	auipc	a0,0x1
    10ce:	f6650513          	add	a0,a0,-154 # 2030 <__clone+0xf0>
    10d2:	2b8000ef          	jal	138a <puts>
    10d6:	00001517          	auipc	a0,0x1
    10da:	00a50513          	add	a0,a0,10 # 20e0 <__func__.0>
    10de:	2ac000ef          	jal	138a <puts>
}
    10e2:	7402                	ld	s0,32(sp)
    10e4:	70a2                	ld	ra,40(sp)
    10e6:	64e2                	ld	s1,24(sp)
    10e8:	6942                	ld	s2,16(sp)
    10ea:	69a2                	ld	s3,8(sp)
    TEST_END(__func__);
    10ec:	00001517          	auipc	a0,0x1
    10f0:	e9450513          	add	a0,a0,-364 # 1f80 <__clone+0x40>
}
    10f4:	6145                	add	sp,sp,48
    TEST_END(__func__);
    10f6:	ac51                	j	138a <puts>
        assert(ret == 0);
    10f8:	00001517          	auipc	a0,0x1
    10fc:	eb050513          	add	a0,a0,-336 # 1fa8 <__clone+0x68>
    1100:	526000ef          	jal	1626 <panic>
    1104:	b76d                	j	10ae <test_mprotect_basic+0xaa>
        printf("mprotect mmap failed.\n");
    1106:	00001517          	auipc	a0,0x1
    110a:	ee250513          	add	a0,a0,-286 # 1fe8 <__clone+0xa8>
    110e:	29e000ef          	jal	13ac <printf>
    1112:	bf4d                	j	10c4 <test_mprotect_basic+0xc0>
    assert(fd > 0);
    1114:	00001517          	auipc	a0,0x1
    1118:	e9450513          	add	a0,a0,-364 # 1fa8 <__clone+0x68>
    111c:	50a000ef          	jal	1626 <panic>
    1120:	b72d                	j	104a <test_mprotect_basic+0x46>

0000000000001122 <main>:

int main(void)
{
    1122:	1141                	add	sp,sp,-16
    1124:	e406                	sd	ra,8(sp)
    test_mprotect_basic();
    1126:	edfff0ef          	jal	1004 <test_mprotect_basic>
    return 0;
}
    112a:	60a2                	ld	ra,8(sp)
    112c:	4501                	li	a0,0
    112e:	0141                	add	sp,sp,16
    1130:	8082                	ret

0000000000001132 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1132:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1134:	4108                	lw	a0,0(a0)
{
    1136:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1138:	05a1                	add	a1,a1,8
{
    113a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    113c:	fe7ff0ef          	jal	1122 <main>
    1140:	3fd000ef          	jal	1d3c <exit>
	return 0;
}
    1144:	60a2                	ld	ra,8(sp)
    1146:	4501                	li	a0,0
    1148:	0141                	add	sp,sp,16
    114a:	8082                	ret

000000000000114c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    114c:	7179                	add	sp,sp,-48
    114e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1150:	12054863          	bltz	a0,1280 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1154:	02b577bb          	remuw	a5,a0,a1
    1158:	00001697          	auipc	a3,0x1
    115c:	fa068693          	add	a3,a3,-96 # 20f8 <digits>
    buf[16] = 0;
    1160:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1164:	0005871b          	sext.w	a4,a1
    1168:	1782                	sll	a5,a5,0x20
    116a:	9381                	srl	a5,a5,0x20
    116c:	97b6                	add	a5,a5,a3
    116e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1172:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1176:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    117a:	1ab56663          	bltu	a0,a1,1326 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    117e:	02e8763b          	remuw	a2,a6,a4
    1182:	1602                	sll	a2,a2,0x20
    1184:	9201                	srl	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1190:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1194:	12e86c63          	bltu	a6,a4,12cc <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1198:	02e5f63b          	remuw	a2,a1,a4
    119c:	1602                	sll	a2,a2,0x20
    119e:	9201                	srl	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11aa:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11ae:	12e5e863          	bltu	a1,a4,12de <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11b2:	02e8763b          	remuw	a2,a6,a4
    11b6:	1602                	sll	a2,a2,0x20
    11b8:	9201                	srl	a2,a2,0x20
    11ba:	9636                	add	a2,a2,a3
    11bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c4:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11c8:	12e86463          	bltu	a6,a4,12f0 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11cc:	02e5f63b          	remuw	a2,a1,a4
    11d0:	1602                	sll	a2,a2,0x20
    11d2:	9201                	srl	a2,a2,0x20
    11d4:	9636                	add	a2,a2,a3
    11d6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11da:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11de:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11e2:	12e5e063          	bltu	a1,a4,1302 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11e6:	02e8763b          	remuw	a2,a6,a4
    11ea:	1602                	sll	a2,a2,0x20
    11ec:	9201                	srl	a2,a2,0x20
    11ee:	9636                	add	a2,a2,a3
    11f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11f8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11fc:	0ae86f63          	bltu	a6,a4,12ba <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1200:	02e5f63b          	remuw	a2,a1,a4
    1204:	1602                	sll	a2,a2,0x20
    1206:	9201                	srl	a2,a2,0x20
    1208:	9636                	add	a2,a2,a3
    120a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    120e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1212:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1216:	0ee5ef63          	bltu	a1,a4,1314 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    121a:	02e8763b          	remuw	a2,a6,a4
    121e:	1602                	sll	a2,a2,0x20
    1220:	9201                	srl	a2,a2,0x20
    1222:	9636                	add	a2,a2,a3
    1224:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1228:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    122c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1230:	0ee86d63          	bltu	a6,a4,132a <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1234:	02e5f63b          	remuw	a2,a1,a4
    1238:	1602                	sll	a2,a2,0x20
    123a:	9201                	srl	a2,a2,0x20
    123c:	9636                	add	a2,a2,a3
    123e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1242:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1246:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    124a:	0ee5e963          	bltu	a1,a4,133c <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    124e:	1782                	sll	a5,a5,0x20
    1250:	9381                	srl	a5,a5,0x20
    1252:	96be                	add	a3,a3,a5
    1254:	0006c783          	lbu	a5,0(a3)
    1258:	4599                	li	a1,6
    125a:	00f10723          	sb	a5,14(sp)

    if (sign)
    125e:	00055763          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    126a:	4595                	li	a1,5
    write(f, s, l);
    126c:	003c                	add	a5,sp,8
    126e:	4641                	li	a2,16
    1270:	9e0d                	subw	a2,a2,a1
    1272:	4505                	li	a0,1
    1274:	95be                	add	a1,a1,a5
    1276:	26d000ef          	jal	1ce2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    127a:	70a2                	ld	ra,40(sp)
    127c:	6145                	add	sp,sp,48
    127e:	8082                	ret
        x = -xx;
    1280:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1284:	02b677bb          	remuw	a5,a2,a1
    1288:	00001697          	auipc	a3,0x1
    128c:	e7068693          	add	a3,a3,-400 # 20f8 <digits>
    buf[16] = 0;
    1290:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1294:	0005871b          	sext.w	a4,a1
    1298:	1782                	sll	a5,a5,0x20
    129a:	9381                	srl	a5,a5,0x20
    129c:	97b6                	add	a5,a5,a3
    129e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12a2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12a6:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12aa:	ecb67ae3          	bgeu	a2,a1,117e <printint.constprop.0+0x32>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12b6:	45b9                	li	a1,14
    12b8:	bf55                	j	126c <printint.constprop.0+0x120>
    12ba:	45a9                	li	a1,10
    if (sign)
    12bc:	fa0558e3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12c8:	45a5                	li	a1,9
    12ca:	b74d                	j	126c <printint.constprop.0+0x120>
    12cc:	45b9                	li	a1,14
    if (sign)
    12ce:	f8055fe3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12da:	45b5                	li	a1,13
    12dc:	bf41                	j	126c <printint.constprop.0+0x120>
    12de:	45b5                	li	a1,13
    if (sign)
    12e0:	f80556e3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e4:	02d00793          	li	a5,45
    12e8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12ec:	45b1                	li	a1,12
    12ee:	bfbd                	j	126c <printint.constprop.0+0x120>
    12f0:	45b1                	li	a1,12
    if (sign)
    12f2:	f6055de3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f6:	02d00793          	li	a5,45
    12fa:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12fe:	45ad                	li	a1,11
    1300:	b7b5                	j	126c <printint.constprop.0+0x120>
    1302:	45ad                	li	a1,11
    if (sign)
    1304:	f60554e3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1308:	02d00793          	li	a5,45
    130c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1310:	45a9                	li	a1,10
    1312:	bfa9                	j	126c <printint.constprop.0+0x120>
    1314:	45a5                	li	a1,9
    if (sign)
    1316:	f4055be3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    131a:	02d00793          	li	a5,45
    131e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1322:	45a1                	li	a1,8
    1324:	b7a1                	j	126c <printint.constprop.0+0x120>
    i = 15;
    1326:	45bd                	li	a1,15
    1328:	b791                	j	126c <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    132a:	45a1                	li	a1,8
    if (sign)
    132c:	f40550e3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1330:	02d00793          	li	a5,45
    1334:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1338:	459d                	li	a1,7
    133a:	bf0d                	j	126c <printint.constprop.0+0x120>
    133c:	459d                	li	a1,7
    if (sign)
    133e:	f20557e3          	bgez	a0,126c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1342:	02d00793          	li	a5,45
    1346:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    134a:	4599                	li	a1,6
    134c:	b705                	j	126c <printint.constprop.0+0x120>

000000000000134e <getchar>:
{
    134e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1350:	00f10593          	add	a1,sp,15
    1354:	4605                	li	a2,1
    1356:	4501                	li	a0,0
{
    1358:	ec06                	sd	ra,24(sp)
    char byte = 0;
    135a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    135e:	17b000ef          	jal	1cd8 <read>
}
    1362:	60e2                	ld	ra,24(sp)
    1364:	00f14503          	lbu	a0,15(sp)
    1368:	6105                	add	sp,sp,32
    136a:	8082                	ret

000000000000136c <putchar>:
{
    136c:	1101                	add	sp,sp,-32
    136e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1370:	00f10593          	add	a1,sp,15
    1374:	4605                	li	a2,1
    1376:	4505                	li	a0,1
{
    1378:	ec06                	sd	ra,24(sp)
    char byte = c;
    137a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    137e:	165000ef          	jal	1ce2 <write>
}
    1382:	60e2                	ld	ra,24(sp)
    1384:	2501                	sext.w	a0,a0
    1386:	6105                	add	sp,sp,32
    1388:	8082                	ret

000000000000138a <puts>:
{
    138a:	1141                	add	sp,sp,-16
    138c:	e406                	sd	ra,8(sp)
    138e:	e022                	sd	s0,0(sp)
    1390:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1392:	574000ef          	jal	1906 <strlen>
    1396:	862a                	mv	a2,a0
    1398:	85a2                	mv	a1,s0
    139a:	4505                	li	a0,1
    139c:	147000ef          	jal	1ce2 <write>
}
    13a0:	60a2                	ld	ra,8(sp)
    13a2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13a4:	957d                	sra	a0,a0,0x3f
    return r;
    13a6:	2501                	sext.w	a0,a0
}
    13a8:	0141                	add	sp,sp,16
    13aa:	8082                	ret

00000000000013ac <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13ac:	7171                	add	sp,sp,-176
    13ae:	f85a                	sd	s6,48(sp)
    13b0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13b2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13b4:	18bc                	add	a5,sp,120
{
    13b6:	e8ca                	sd	s2,80(sp)
    13b8:	e4ce                	sd	s3,72(sp)
    13ba:	e0d2                	sd	s4,64(sp)
    13bc:	fc56                	sd	s5,56(sp)
    13be:	f486                	sd	ra,104(sp)
    13c0:	f0a2                	sd	s0,96(sp)
    13c2:	eca6                	sd	s1,88(sp)
    13c4:	fcae                	sd	a1,120(sp)
    13c6:	e132                	sd	a2,128(sp)
    13c8:	e536                	sd	a3,136(sp)
    13ca:	e93a                	sd	a4,144(sp)
    13cc:	f142                	sd	a6,160(sp)
    13ce:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13d0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13d2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13d6:	07300a13          	li	s4,115
    13da:	07800a93          	li	s5,120
    buf[i++] = '0';
    13de:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e2:	00001997          	auipc	s3,0x1
    13e6:	d1698993          	add	s3,s3,-746 # 20f8 <digits>
        if (!*s)
    13ea:	00054783          	lbu	a5,0(a0)
    13ee:	16078a63          	beqz	a5,1562 <printf+0x1b6>
    13f2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13f4:	19278d63          	beq	a5,s2,158e <printf+0x1e2>
    13f8:	00164783          	lbu	a5,1(a2)
    13fc:	0605                	add	a2,a2,1
    13fe:	fbfd                	bnez	a5,13f4 <printf+0x48>
    1400:	84b2                	mv	s1,a2
        l = z - a;
    1402:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1406:	85aa                	mv	a1,a0
    1408:	8622                	mv	a2,s0
    140a:	4505                	li	a0,1
    140c:	0d7000ef          	jal	1ce2 <write>
        if (l)
    1410:	1a041463          	bnez	s0,15b8 <printf+0x20c>
        if (s[1] == 0)
    1414:	0014c783          	lbu	a5,1(s1)
    1418:	14078563          	beqz	a5,1562 <printf+0x1b6>
        switch (s[1])
    141c:	1b478063          	beq	a5,s4,15bc <printf+0x210>
    1420:	14fa6b63          	bltu	s4,a5,1576 <printf+0x1ca>
    1424:	06400713          	li	a4,100
    1428:	1ee78063          	beq	a5,a4,1608 <printf+0x25c>
    142c:	07000713          	li	a4,112
    1430:	1ae79963          	bne	a5,a4,15e2 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1434:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1436:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    143a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    143c:	631c                	ld	a5,0(a4)
    143e:	0721                	add	a4,a4,8
    1440:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1442:	00479293          	sll	t0,a5,0x4
    1446:	00879f93          	sll	t6,a5,0x8
    144a:	00c79f13          	sll	t5,a5,0xc
    144e:	01079e93          	sll	t4,a5,0x10
    1452:	01479e13          	sll	t3,a5,0x14
    1456:	01879313          	sll	t1,a5,0x18
    145a:	01c79893          	sll	a7,a5,0x1c
    145e:	02479813          	sll	a6,a5,0x24
    1462:	02879513          	sll	a0,a5,0x28
    1466:	02c79593          	sll	a1,a5,0x2c
    146a:	03079693          	sll	a3,a5,0x30
    146e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1472:	03c7d413          	srl	s0,a5,0x3c
    1476:	01c7d39b          	srlw	t2,a5,0x1c
    147a:	03c2d293          	srl	t0,t0,0x3c
    147e:	03cfdf93          	srl	t6,t6,0x3c
    1482:	03cf5f13          	srl	t5,t5,0x3c
    1486:	03cede93          	srl	t4,t4,0x3c
    148a:	03ce5e13          	srl	t3,t3,0x3c
    148e:	03c35313          	srl	t1,t1,0x3c
    1492:	03c8d893          	srl	a7,a7,0x3c
    1496:	03c85813          	srl	a6,a6,0x3c
    149a:	9171                	srl	a0,a0,0x3c
    149c:	91f1                	srl	a1,a1,0x3c
    149e:	92f1                	srl	a3,a3,0x3c
    14a0:	9371                	srl	a4,a4,0x3c
    14a2:	96ce                	add	a3,a3,s3
    14a4:	974e                	add	a4,a4,s3
    14a6:	944e                	add	s0,s0,s3
    14a8:	92ce                	add	t0,t0,s3
    14aa:	9fce                	add	t6,t6,s3
    14ac:	9f4e                	add	t5,t5,s3
    14ae:	9ece                	add	t4,t4,s3
    14b0:	9e4e                	add	t3,t3,s3
    14b2:	934e                	add	t1,t1,s3
    14b4:	98ce                	add	a7,a7,s3
    14b6:	93ce                	add	t2,t2,s3
    14b8:	984e                	add	a6,a6,s3
    14ba:	954e                	add	a0,a0,s3
    14bc:	95ce                	add	a1,a1,s3
    14be:	0006c083          	lbu	ra,0(a3)
    14c2:	0002c283          	lbu	t0,0(t0)
    14c6:	00074683          	lbu	a3,0(a4)
    14ca:	000fcf83          	lbu	t6,0(t6)
    14ce:	000f4f03          	lbu	t5,0(t5)
    14d2:	000ece83          	lbu	t4,0(t4)
    14d6:	000e4e03          	lbu	t3,0(t3)
    14da:	00034303          	lbu	t1,0(t1)
    14de:	0008c883          	lbu	a7,0(a7)
    14e2:	0003c383          	lbu	t2,0(t2)
    14e6:	00084803          	lbu	a6,0(a6)
    14ea:	00054503          	lbu	a0,0(a0)
    14ee:	0005c583          	lbu	a1,0(a1)
    14f2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14f6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14fa:	9371                	srl	a4,a4,0x3c
    14fc:	8bbd                	and	a5,a5,15
    14fe:	974e                	add	a4,a4,s3
    1500:	97ce                	add	a5,a5,s3
    1502:	005105a3          	sb	t0,11(sp)
    1506:	01f10623          	sb	t6,12(sp)
    150a:	01e106a3          	sb	t5,13(sp)
    150e:	01d10723          	sb	t4,14(sp)
    1512:	01c107a3          	sb	t3,15(sp)
    1516:	00610823          	sb	t1,16(sp)
    151a:	011108a3          	sb	a7,17(sp)
    151e:	00710923          	sb	t2,18(sp)
    1522:	010109a3          	sb	a6,19(sp)
    1526:	00a10a23          	sb	a0,20(sp)
    152a:	00b10aa3          	sb	a1,21(sp)
    152e:	00110b23          	sb	ra,22(sp)
    1532:	00d10ba3          	sb	a3,23(sp)
    1536:	00810523          	sb	s0,10(sp)
    153a:	00074703          	lbu	a4,0(a4)
    153e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1542:	002c                	add	a1,sp,8
    1544:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1546:	00e10c23          	sb	a4,24(sp)
    154a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    154e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1552:	790000ef          	jal	1ce2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1556:	00248513          	add	a0,s1,2
        if (!*s)
    155a:	00054783          	lbu	a5,0(a0)
    155e:	e8079ae3          	bnez	a5,13f2 <printf+0x46>
    }
    va_end(ap);
}
    1562:	70a6                	ld	ra,104(sp)
    1564:	7406                	ld	s0,96(sp)
    1566:	64e6                	ld	s1,88(sp)
    1568:	6946                	ld	s2,80(sp)
    156a:	69a6                	ld	s3,72(sp)
    156c:	6a06                	ld	s4,64(sp)
    156e:	7ae2                	ld	s5,56(sp)
    1570:	7b42                	ld	s6,48(sp)
    1572:	614d                	add	sp,sp,176
    1574:	8082                	ret
        switch (s[1])
    1576:	07579663          	bne	a5,s5,15e2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    157a:	6782                	ld	a5,0(sp)
    157c:	45c1                	li	a1,16
    157e:	4388                	lw	a0,0(a5)
    1580:	07a1                	add	a5,a5,8
    1582:	e03e                	sd	a5,0(sp)
    1584:	bc9ff0ef          	jal	114c <printint.constprop.0>
        s += 2;
    1588:	00248513          	add	a0,s1,2
    158c:	b7f9                	j	155a <printf+0x1ae>
    158e:	84b2                	mv	s1,a2
    1590:	a039                	j	159e <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1592:	0024c783          	lbu	a5,2(s1)
    1596:	0605                	add	a2,a2,1
    1598:	0489                	add	s1,s1,2
    159a:	e72794e3          	bne	a5,s2,1402 <printf+0x56>
    159e:	0014c783          	lbu	a5,1(s1)
    15a2:	ff2788e3          	beq	a5,s2,1592 <printf+0x1e6>
        l = z - a;
    15a6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15aa:	85aa                	mv	a1,a0
    15ac:	8622                	mv	a2,s0
    15ae:	4505                	li	a0,1
    15b0:	732000ef          	jal	1ce2 <write>
        if (l)
    15b4:	e60400e3          	beqz	s0,1414 <printf+0x68>
    15b8:	8526                	mv	a0,s1
    15ba:	bd05                	j	13ea <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15bc:	6782                	ld	a5,0(sp)
    15be:	6380                	ld	s0,0(a5)
    15c0:	07a1                	add	a5,a5,8
    15c2:	e03e                	sd	a5,0(sp)
    15c4:	cc21                	beqz	s0,161c <printf+0x270>
            l = strnlen(a, 200);
    15c6:	0c800593          	li	a1,200
    15ca:	8522                	mv	a0,s0
    15cc:	424000ef          	jal	19f0 <strnlen>
    write(f, s, l);
    15d0:	0005061b          	sext.w	a2,a0
    15d4:	85a2                	mv	a1,s0
    15d6:	4505                	li	a0,1
    15d8:	70a000ef          	jal	1ce2 <write>
        s += 2;
    15dc:	00248513          	add	a0,s1,2
    15e0:	bfad                	j	155a <printf+0x1ae>
    return write(stdout, &byte, 1);
    15e2:	4605                	li	a2,1
    15e4:	002c                	add	a1,sp,8
    15e6:	4505                	li	a0,1
    char byte = c;
    15e8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15ec:	6f6000ef          	jal	1ce2 <write>
    char byte = c;
    15f0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15f4:	4605                	li	a2,1
    15f6:	002c                	add	a1,sp,8
    15f8:	4505                	li	a0,1
    char byte = c;
    15fa:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15fe:	6e4000ef          	jal	1ce2 <write>
        s += 2;
    1602:	00248513          	add	a0,s1,2
    1606:	bf91                	j	155a <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1608:	6782                	ld	a5,0(sp)
    160a:	45a9                	li	a1,10
    160c:	4388                	lw	a0,0(a5)
    160e:	07a1                	add	a5,a5,8
    1610:	e03e                	sd	a5,0(sp)
    1612:	b3bff0ef          	jal	114c <printint.constprop.0>
        s += 2;
    1616:	00248513          	add	a0,s1,2
    161a:	b781                	j	155a <printf+0x1ae>
                a = "(null)";
    161c:	00001417          	auipc	s0,0x1
    1620:	a2440413          	add	s0,s0,-1500 # 2040 <__clone+0x100>
    1624:	b74d                	j	15c6 <printf+0x21a>

0000000000001626 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1626:	1141                	add	sp,sp,-16
    1628:	e406                	sd	ra,8(sp)
    puts(m);
    162a:	d61ff0ef          	jal	138a <puts>
    exit(-100);
}
    162e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1630:	f9c00513          	li	a0,-100
}
    1634:	0141                	add	sp,sp,16
    exit(-100);
    1636:	a719                	j	1d3c <exit>

0000000000001638 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1638:	02000793          	li	a5,32
    163c:	00f50663          	beq	a0,a5,1648 <isspace+0x10>
    1640:	355d                	addw	a0,a0,-9
    1642:	00553513          	sltiu	a0,a0,5
    1646:	8082                	ret
    1648:	4505                	li	a0,1
}
    164a:	8082                	ret

000000000000164c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    164c:	fd05051b          	addw	a0,a0,-48
}
    1650:	00a53513          	sltiu	a0,a0,10
    1654:	8082                	ret

0000000000001656 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1656:	02000693          	li	a3,32
    165a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    165c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1660:	ff77871b          	addw	a4,a5,-9
    1664:	04d78c63          	beq	a5,a3,16bc <atoi+0x66>
    1668:	0007861b          	sext.w	a2,a5
    166c:	04e5f863          	bgeu	a1,a4,16bc <atoi+0x66>
        s++;
    switch (*s)
    1670:	02b00713          	li	a4,43
    1674:	04e78963          	beq	a5,a4,16c6 <atoi+0x70>
    1678:	02d00713          	li	a4,45
    167c:	06e78263          	beq	a5,a4,16e0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1680:	fd06069b          	addw	a3,a2,-48
    1684:	47a5                	li	a5,9
    1686:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1688:	4301                	li	t1,0
    while (isdigit(*s))
    168a:	04d7e963          	bltu	a5,a3,16dc <atoi+0x86>
    int n = 0, neg = 0;
    168e:	4501                	li	a0,0
    while (isdigit(*s))
    1690:	48a5                	li	a7,9
    1692:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1696:	0025179b          	sllw	a5,a0,0x2
    169a:	9fa9                	addw	a5,a5,a0
    169c:	fd06059b          	addw	a1,a2,-48
    16a0:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16a4:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16a8:	0705                	add	a4,a4,1
    16aa:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16ae:	0006861b          	sext.w	a2,a3
    16b2:	ff08f0e3          	bgeu	a7,a6,1692 <atoi+0x3c>
    return neg ? n : -n;
    16b6:	00030563          	beqz	t1,16c0 <atoi+0x6a>
}
    16ba:	8082                	ret
        s++;
    16bc:	0505                	add	a0,a0,1
    16be:	bf79                	j	165c <atoi+0x6>
    return neg ? n : -n;
    16c0:	40f5853b          	subw	a0,a1,a5
    16c4:	8082                	ret
    while (isdigit(*s))
    16c6:	00154603          	lbu	a2,1(a0)
    16ca:	47a5                	li	a5,9
        s++;
    16cc:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16d0:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16d4:	4301                	li	t1,0
    while (isdigit(*s))
    16d6:	2601                	sext.w	a2,a2
    16d8:	fad7fbe3          	bgeu	a5,a3,168e <atoi+0x38>
    16dc:	4501                	li	a0,0
}
    16de:	8082                	ret
    while (isdigit(*s))
    16e0:	00154603          	lbu	a2,1(a0)
    16e4:	47a5                	li	a5,9
        s++;
    16e6:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16ea:	fd06069b          	addw	a3,a2,-48
    16ee:	2601                	sext.w	a2,a2
    16f0:	fed7e6e3          	bltu	a5,a3,16dc <atoi+0x86>
        neg = 1;
    16f4:	4305                	li	t1,1
    16f6:	bf61                	j	168e <atoi+0x38>

00000000000016f8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16f8:	18060163          	beqz	a2,187a <memset+0x182>
    16fc:	40a006b3          	neg	a3,a0
    1700:	0076f793          	and	a5,a3,7
    1704:	00778813          	add	a6,a5,7
    1708:	48ad                	li	a7,11
    170a:	0ff5f713          	zext.b	a4,a1
    170e:	fff60593          	add	a1,a2,-1
    1712:	17186563          	bltu	a6,a7,187c <memset+0x184>
    1716:	1705ed63          	bltu	a1,a6,1890 <memset+0x198>
    171a:	16078363          	beqz	a5,1880 <memset+0x188>
    171e:	00e50023          	sb	a4,0(a0)
    1722:	0066f593          	and	a1,a3,6
    1726:	16058063          	beqz	a1,1886 <memset+0x18e>
    172a:	00e500a3          	sb	a4,1(a0)
    172e:	4589                	li	a1,2
    1730:	16f5f363          	bgeu	a1,a5,1896 <memset+0x19e>
    1734:	00e50123          	sb	a4,2(a0)
    1738:	8a91                	and	a3,a3,4
    173a:	00350593          	add	a1,a0,3
    173e:	4e0d                	li	t3,3
    1740:	ce9d                	beqz	a3,177e <memset+0x86>
    1742:	00e501a3          	sb	a4,3(a0)
    1746:	4691                	li	a3,4
    1748:	00450593          	add	a1,a0,4
    174c:	4e11                	li	t3,4
    174e:	02f6f863          	bgeu	a3,a5,177e <memset+0x86>
    1752:	00e50223          	sb	a4,4(a0)
    1756:	4695                	li	a3,5
    1758:	00550593          	add	a1,a0,5
    175c:	4e15                	li	t3,5
    175e:	02d78063          	beq	a5,a3,177e <memset+0x86>
    1762:	fff50693          	add	a3,a0,-1
    1766:	00e502a3          	sb	a4,5(a0)
    176a:	8a9d                	and	a3,a3,7
    176c:	00650593          	add	a1,a0,6
    1770:	4e19                	li	t3,6
    1772:	e691                	bnez	a3,177e <memset+0x86>
    1774:	00750593          	add	a1,a0,7
    1778:	00e50323          	sb	a4,6(a0)
    177c:	4e1d                	li	t3,7
    177e:	00871693          	sll	a3,a4,0x8
    1782:	01071813          	sll	a6,a4,0x10
    1786:	8ed9                	or	a3,a3,a4
    1788:	01871893          	sll	a7,a4,0x18
    178c:	0106e6b3          	or	a3,a3,a6
    1790:	0116e6b3          	or	a3,a3,a7
    1794:	02071813          	sll	a6,a4,0x20
    1798:	02871313          	sll	t1,a4,0x28
    179c:	0106e6b3          	or	a3,a3,a6
    17a0:	40f608b3          	sub	a7,a2,a5
    17a4:	03071813          	sll	a6,a4,0x30
    17a8:	0066e6b3          	or	a3,a3,t1
    17ac:	0106e6b3          	or	a3,a3,a6
    17b0:	03871313          	sll	t1,a4,0x38
    17b4:	97aa                	add	a5,a5,a0
    17b6:	ff88f813          	and	a6,a7,-8
    17ba:	0066e6b3          	or	a3,a3,t1
    17be:	983e                	add	a6,a6,a5
    17c0:	e394                	sd	a3,0(a5)
    17c2:	07a1                	add	a5,a5,8
    17c4:	ff079ee3          	bne	a5,a6,17c0 <memset+0xc8>
    17c8:	ff88f793          	and	a5,a7,-8
    17cc:	0078f893          	and	a7,a7,7
    17d0:	00f586b3          	add	a3,a1,a5
    17d4:	01c787bb          	addw	a5,a5,t3
    17d8:	0a088b63          	beqz	a7,188e <memset+0x196>
    17dc:	00e68023          	sb	a4,0(a3)
    17e0:	0017859b          	addw	a1,a5,1
    17e4:	08c5fb63          	bgeu	a1,a2,187a <memset+0x182>
    17e8:	00e680a3          	sb	a4,1(a3)
    17ec:	0027859b          	addw	a1,a5,2
    17f0:	08c5f563          	bgeu	a1,a2,187a <memset+0x182>
    17f4:	00e68123          	sb	a4,2(a3)
    17f8:	0037859b          	addw	a1,a5,3
    17fc:	06c5ff63          	bgeu	a1,a2,187a <memset+0x182>
    1800:	00e681a3          	sb	a4,3(a3)
    1804:	0047859b          	addw	a1,a5,4
    1808:	06c5f963          	bgeu	a1,a2,187a <memset+0x182>
    180c:	00e68223          	sb	a4,4(a3)
    1810:	0057859b          	addw	a1,a5,5
    1814:	06c5f363          	bgeu	a1,a2,187a <memset+0x182>
    1818:	00e682a3          	sb	a4,5(a3)
    181c:	0067859b          	addw	a1,a5,6
    1820:	04c5fd63          	bgeu	a1,a2,187a <memset+0x182>
    1824:	00e68323          	sb	a4,6(a3)
    1828:	0077859b          	addw	a1,a5,7
    182c:	04c5f763          	bgeu	a1,a2,187a <memset+0x182>
    1830:	00e683a3          	sb	a4,7(a3)
    1834:	0087859b          	addw	a1,a5,8
    1838:	04c5f163          	bgeu	a1,a2,187a <memset+0x182>
    183c:	00e68423          	sb	a4,8(a3)
    1840:	0097859b          	addw	a1,a5,9
    1844:	02c5fb63          	bgeu	a1,a2,187a <memset+0x182>
    1848:	00e684a3          	sb	a4,9(a3)
    184c:	00a7859b          	addw	a1,a5,10
    1850:	02c5f563          	bgeu	a1,a2,187a <memset+0x182>
    1854:	00e68523          	sb	a4,10(a3)
    1858:	00b7859b          	addw	a1,a5,11
    185c:	00c5ff63          	bgeu	a1,a2,187a <memset+0x182>
    1860:	00e685a3          	sb	a4,11(a3)
    1864:	00c7859b          	addw	a1,a5,12
    1868:	00c5f963          	bgeu	a1,a2,187a <memset+0x182>
    186c:	00e68623          	sb	a4,12(a3)
    1870:	27b5                	addw	a5,a5,13
    1872:	00c7f463          	bgeu	a5,a2,187a <memset+0x182>
    1876:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    187a:	8082                	ret
    187c:	482d                	li	a6,11
    187e:	bd61                	j	1716 <memset+0x1e>
    char *p = dest;
    1880:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1882:	4e01                	li	t3,0
    1884:	bded                	j	177e <memset+0x86>
    1886:	00150593          	add	a1,a0,1
    188a:	4e05                	li	t3,1
    188c:	bdcd                	j	177e <memset+0x86>
    188e:	8082                	ret
    char *p = dest;
    1890:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1892:	4781                	li	a5,0
    1894:	b7a1                	j	17dc <memset+0xe4>
    1896:	00250593          	add	a1,a0,2
    189a:	4e09                	li	t3,2
    189c:	b5cd                	j	177e <memset+0x86>

000000000000189e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    189e:	00054783          	lbu	a5,0(a0)
    18a2:	0005c703          	lbu	a4,0(a1)
    18a6:	00e79863          	bne	a5,a4,18b6 <strcmp+0x18>
    18aa:	0505                	add	a0,a0,1
    18ac:	0585                	add	a1,a1,1
    18ae:	fbe5                	bnez	a5,189e <strcmp>
    18b0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18b2:	9d19                	subw	a0,a0,a4
    18b4:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18b6:	0007851b          	sext.w	a0,a5
    18ba:	bfe5                	j	18b2 <strcmp+0x14>

00000000000018bc <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18bc:	ca15                	beqz	a2,18f0 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18be:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18c2:	167d                	add	a2,a2,-1
    18c4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18c8:	eb99                	bnez	a5,18de <strncmp+0x22>
    18ca:	a815                	j	18fe <strncmp+0x42>
    18cc:	00a68e63          	beq	a3,a0,18e8 <strncmp+0x2c>
    18d0:	0505                	add	a0,a0,1
    18d2:	00f71b63          	bne	a4,a5,18e8 <strncmp+0x2c>
    18d6:	00054783          	lbu	a5,0(a0)
    18da:	cf89                	beqz	a5,18f4 <strncmp+0x38>
    18dc:	85b2                	mv	a1,a2
    18de:	0005c703          	lbu	a4,0(a1)
    18e2:	00158613          	add	a2,a1,1
    18e6:	f37d                	bnez	a4,18cc <strncmp+0x10>
        ;
    return *l - *r;
    18e8:	0007851b          	sext.w	a0,a5
    18ec:	9d19                	subw	a0,a0,a4
    18ee:	8082                	ret
        return 0;
    18f0:	4501                	li	a0,0
}
    18f2:	8082                	ret
    return *l - *r;
    18f4:	0015c703          	lbu	a4,1(a1)
    18f8:	4501                	li	a0,0
    18fa:	9d19                	subw	a0,a0,a4
    18fc:	8082                	ret
    18fe:	0005c703          	lbu	a4,0(a1)
    1902:	4501                	li	a0,0
    1904:	b7e5                	j	18ec <strncmp+0x30>

0000000000001906 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1906:	00757793          	and	a5,a0,7
    190a:	cf89                	beqz	a5,1924 <strlen+0x1e>
    190c:	87aa                	mv	a5,a0
    190e:	a029                	j	1918 <strlen+0x12>
    1910:	0785                	add	a5,a5,1
    1912:	0077f713          	and	a4,a5,7
    1916:	cb01                	beqz	a4,1926 <strlen+0x20>
        if (!*s)
    1918:	0007c703          	lbu	a4,0(a5)
    191c:	fb75                	bnez	a4,1910 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    191e:	40a78533          	sub	a0,a5,a0
}
    1922:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1924:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1926:	6394                	ld	a3,0(a5)
    1928:	00000597          	auipc	a1,0x0
    192c:	7205b583          	ld	a1,1824(a1) # 2048 <__clone+0x108>
    1930:	00000617          	auipc	a2,0x0
    1934:	72063603          	ld	a2,1824(a2) # 2050 <__clone+0x110>
    1938:	a019                	j	193e <strlen+0x38>
    193a:	6794                	ld	a3,8(a5)
    193c:	07a1                	add	a5,a5,8
    193e:	00b68733          	add	a4,a3,a1
    1942:	fff6c693          	not	a3,a3
    1946:	8f75                	and	a4,a4,a3
    1948:	8f71                	and	a4,a4,a2
    194a:	db65                	beqz	a4,193a <strlen+0x34>
    for (; *s; s++)
    194c:	0007c703          	lbu	a4,0(a5)
    1950:	d779                	beqz	a4,191e <strlen+0x18>
    1952:	0017c703          	lbu	a4,1(a5)
    1956:	0785                	add	a5,a5,1
    1958:	d379                	beqz	a4,191e <strlen+0x18>
    195a:	0017c703          	lbu	a4,1(a5)
    195e:	0785                	add	a5,a5,1
    1960:	fb6d                	bnez	a4,1952 <strlen+0x4c>
    1962:	bf75                	j	191e <strlen+0x18>

0000000000001964 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1964:	00757713          	and	a4,a0,7
{
    1968:	87aa                	mv	a5,a0
    196a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    196e:	cb19                	beqz	a4,1984 <memchr+0x20>
    1970:	ce25                	beqz	a2,19e8 <memchr+0x84>
    1972:	0007c703          	lbu	a4,0(a5)
    1976:	00b70763          	beq	a4,a1,1984 <memchr+0x20>
    197a:	0785                	add	a5,a5,1
    197c:	0077f713          	and	a4,a5,7
    1980:	167d                	add	a2,a2,-1
    1982:	f77d                	bnez	a4,1970 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1984:	4501                	li	a0,0
    if (n && *s != c)
    1986:	c235                	beqz	a2,19ea <memchr+0x86>
    1988:	0007c703          	lbu	a4,0(a5)
    198c:	06b70063          	beq	a4,a1,19ec <memchr+0x88>
        size_t k = ONES * c;
    1990:	00000517          	auipc	a0,0x0
    1994:	6c853503          	ld	a0,1736(a0) # 2058 <__clone+0x118>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1998:	471d                	li	a4,7
        size_t k = ONES * c;
    199a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199e:	04c77763          	bgeu	a4,a2,19ec <memchr+0x88>
    19a2:	00000897          	auipc	a7,0x0
    19a6:	6a68b883          	ld	a7,1702(a7) # 2048 <__clone+0x108>
    19aa:	00000817          	auipc	a6,0x0
    19ae:	6a683803          	ld	a6,1702(a6) # 2050 <__clone+0x110>
    19b2:	431d                	li	t1,7
    19b4:	a029                	j	19be <memchr+0x5a>
    19b6:	1661                	add	a2,a2,-8
    19b8:	07a1                	add	a5,a5,8
    19ba:	00c37c63          	bgeu	t1,a2,19d2 <memchr+0x6e>
    19be:	6398                	ld	a4,0(a5)
    19c0:	8f29                	xor	a4,a4,a0
    19c2:	011706b3          	add	a3,a4,a7
    19c6:	fff74713          	not	a4,a4
    19ca:	8f75                	and	a4,a4,a3
    19cc:	01077733          	and	a4,a4,a6
    19d0:	d37d                	beqz	a4,19b6 <memchr+0x52>
    19d2:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19d4:	e601                	bnez	a2,19dc <memchr+0x78>
    19d6:	a809                	j	19e8 <memchr+0x84>
    19d8:	0505                	add	a0,a0,1
    19da:	c619                	beqz	a2,19e8 <memchr+0x84>
    19dc:	00054783          	lbu	a5,0(a0)
    19e0:	167d                	add	a2,a2,-1
    19e2:	feb79be3          	bne	a5,a1,19d8 <memchr+0x74>
    19e6:	8082                	ret
    return n ? (void *)s : 0;
    19e8:	4501                	li	a0,0
}
    19ea:	8082                	ret
    if (n && *s != c)
    19ec:	853e                	mv	a0,a5
    19ee:	b7fd                	j	19dc <memchr+0x78>

00000000000019f0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19f0:	1101                	add	sp,sp,-32
    19f2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19f4:	862e                	mv	a2,a1
{
    19f6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19f8:	4581                	li	a1,0
{
    19fa:	e426                	sd	s1,8(sp)
    19fc:	ec06                	sd	ra,24(sp)
    19fe:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a00:	f65ff0ef          	jal	1964 <memchr>
    return p ? p - s : n;
    1a04:	c519                	beqz	a0,1a12 <strnlen+0x22>
}
    1a06:	60e2                	ld	ra,24(sp)
    1a08:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a0a:	8d05                	sub	a0,a0,s1
}
    1a0c:	64a2                	ld	s1,8(sp)
    1a0e:	6105                	add	sp,sp,32
    1a10:	8082                	ret
    1a12:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a14:	8522                	mv	a0,s0
}
    1a16:	6442                	ld	s0,16(sp)
    1a18:	64a2                	ld	s1,8(sp)
    1a1a:	6105                	add	sp,sp,32
    1a1c:	8082                	ret

0000000000001a1e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a1e:	00a5c7b3          	xor	a5,a1,a0
    1a22:	8b9d                	and	a5,a5,7
    1a24:	eb95                	bnez	a5,1a58 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a26:	0075f793          	and	a5,a1,7
    1a2a:	e7b1                	bnez	a5,1a76 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a2c:	6198                	ld	a4,0(a1)
    1a2e:	00000617          	auipc	a2,0x0
    1a32:	61a63603          	ld	a2,1562(a2) # 2048 <__clone+0x108>
    1a36:	00000817          	auipc	a6,0x0
    1a3a:	61a83803          	ld	a6,1562(a6) # 2050 <__clone+0x110>
    1a3e:	a029                	j	1a48 <strcpy+0x2a>
    1a40:	05a1                	add	a1,a1,8
    1a42:	e118                	sd	a4,0(a0)
    1a44:	6198                	ld	a4,0(a1)
    1a46:	0521                	add	a0,a0,8
    1a48:	00c707b3          	add	a5,a4,a2
    1a4c:	fff74693          	not	a3,a4
    1a50:	8ff5                	and	a5,a5,a3
    1a52:	0107f7b3          	and	a5,a5,a6
    1a56:	d7ed                	beqz	a5,1a40 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a58:	0005c783          	lbu	a5,0(a1)
    1a5c:	00f50023          	sb	a5,0(a0)
    1a60:	c785                	beqz	a5,1a88 <strcpy+0x6a>
    1a62:	0015c783          	lbu	a5,1(a1)
    1a66:	0505                	add	a0,a0,1
    1a68:	0585                	add	a1,a1,1
    1a6a:	00f50023          	sb	a5,0(a0)
    1a6e:	fbf5                	bnez	a5,1a62 <strcpy+0x44>
        ;
    return d;
}
    1a70:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a72:	0505                	add	a0,a0,1
    1a74:	df45                	beqz	a4,1a2c <strcpy+0xe>
            if (!(*d = *s))
    1a76:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a7a:	0585                	add	a1,a1,1
    1a7c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a80:	00f50023          	sb	a5,0(a0)
    1a84:	f7fd                	bnez	a5,1a72 <strcpy+0x54>
}
    1a86:	8082                	ret
    1a88:	8082                	ret

0000000000001a8a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a8a:	00a5c7b3          	xor	a5,a1,a0
    1a8e:	8b9d                	and	a5,a5,7
    1a90:	e3b5                	bnez	a5,1af4 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a92:	0075f793          	and	a5,a1,7
    1a96:	cf99                	beqz	a5,1ab4 <strncpy+0x2a>
    1a98:	ea09                	bnez	a2,1aaa <strncpy+0x20>
    1a9a:	a421                	j	1ca2 <strncpy+0x218>
    1a9c:	0585                	add	a1,a1,1
    1a9e:	0075f793          	and	a5,a1,7
    1aa2:	167d                	add	a2,a2,-1
    1aa4:	0505                	add	a0,a0,1
    1aa6:	c799                	beqz	a5,1ab4 <strncpy+0x2a>
    1aa8:	c225                	beqz	a2,1b08 <strncpy+0x7e>
    1aaa:	0005c783          	lbu	a5,0(a1)
    1aae:	00f50023          	sb	a5,0(a0)
    1ab2:	f7ed                	bnez	a5,1a9c <strncpy+0x12>
            ;
        if (!n || !*s)
    1ab4:	ca31                	beqz	a2,1b08 <strncpy+0x7e>
    1ab6:	0005c783          	lbu	a5,0(a1)
    1aba:	cba1                	beqz	a5,1b0a <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1abc:	479d                	li	a5,7
    1abe:	02c7fc63          	bgeu	a5,a2,1af6 <strncpy+0x6c>
    1ac2:	00000897          	auipc	a7,0x0
    1ac6:	5868b883          	ld	a7,1414(a7) # 2048 <__clone+0x108>
    1aca:	00000817          	auipc	a6,0x0
    1ace:	58683803          	ld	a6,1414(a6) # 2050 <__clone+0x110>
    1ad2:	431d                	li	t1,7
    1ad4:	a039                	j	1ae2 <strncpy+0x58>
            *wd = *ws;
    1ad6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ad8:	1661                	add	a2,a2,-8
    1ada:	05a1                	add	a1,a1,8
    1adc:	0521                	add	a0,a0,8
    1ade:	00c37b63          	bgeu	t1,a2,1af4 <strncpy+0x6a>
    1ae2:	6198                	ld	a4,0(a1)
    1ae4:	011707b3          	add	a5,a4,a7
    1ae8:	fff74693          	not	a3,a4
    1aec:	8ff5                	and	a5,a5,a3
    1aee:	0107f7b3          	and	a5,a5,a6
    1af2:	d3f5                	beqz	a5,1ad6 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af4:	ca11                	beqz	a2,1b08 <strncpy+0x7e>
    1af6:	0005c783          	lbu	a5,0(a1)
    1afa:	0585                	add	a1,a1,1
    1afc:	00f50023          	sb	a5,0(a0)
    1b00:	c789                	beqz	a5,1b0a <strncpy+0x80>
    1b02:	167d                	add	a2,a2,-1
    1b04:	0505                	add	a0,a0,1
    1b06:	fa65                	bnez	a2,1af6 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b08:	8082                	ret
    1b0a:	4805                	li	a6,1
    1b0c:	14061b63          	bnez	a2,1c62 <strncpy+0x1d8>
    1b10:	40a00733          	neg	a4,a0
    1b14:	00777793          	and	a5,a4,7
    1b18:	4581                	li	a1,0
    1b1a:	12061c63          	bnez	a2,1c52 <strncpy+0x1c8>
    1b1e:	00778693          	add	a3,a5,7
    1b22:	48ad                	li	a7,11
    1b24:	1316e563          	bltu	a3,a7,1c4e <strncpy+0x1c4>
    1b28:	16d5e263          	bltu	a1,a3,1c8c <strncpy+0x202>
    1b2c:	14078c63          	beqz	a5,1c84 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b30:	00050023          	sb	zero,0(a0)
    1b34:	00677693          	and	a3,a4,6
    1b38:	14068263          	beqz	a3,1c7c <strncpy+0x1f2>
    1b3c:	000500a3          	sb	zero,1(a0)
    1b40:	4689                	li	a3,2
    1b42:	14f6f863          	bgeu	a3,a5,1c92 <strncpy+0x208>
    1b46:	00050123          	sb	zero,2(a0)
    1b4a:	8b11                	and	a4,a4,4
    1b4c:	12070463          	beqz	a4,1c74 <strncpy+0x1ea>
    1b50:	000501a3          	sb	zero,3(a0)
    1b54:	4711                	li	a4,4
    1b56:	00450693          	add	a3,a0,4
    1b5a:	02f77563          	bgeu	a4,a5,1b84 <strncpy+0xfa>
    1b5e:	00050223          	sb	zero,4(a0)
    1b62:	4715                	li	a4,5
    1b64:	00550693          	add	a3,a0,5
    1b68:	00e78e63          	beq	a5,a4,1b84 <strncpy+0xfa>
    1b6c:	fff50713          	add	a4,a0,-1
    1b70:	000502a3          	sb	zero,5(a0)
    1b74:	8b1d                	and	a4,a4,7
    1b76:	12071263          	bnez	a4,1c9a <strncpy+0x210>
    1b7a:	00750693          	add	a3,a0,7
    1b7e:	00050323          	sb	zero,6(a0)
    1b82:	471d                	li	a4,7
    1b84:	40f80833          	sub	a6,a6,a5
    1b88:	ff887593          	and	a1,a6,-8
    1b8c:	97aa                	add	a5,a5,a0
    1b8e:	95be                	add	a1,a1,a5
    1b90:	0007b023          	sd	zero,0(a5)
    1b94:	07a1                	add	a5,a5,8
    1b96:	feb79de3          	bne	a5,a1,1b90 <strncpy+0x106>
    1b9a:	ff887593          	and	a1,a6,-8
    1b9e:	00787813          	and	a6,a6,7
    1ba2:	00e587bb          	addw	a5,a1,a4
    1ba6:	00b68733          	add	a4,a3,a1
    1baa:	0e080063          	beqz	a6,1c8a <strncpy+0x200>
    1bae:	00070023          	sb	zero,0(a4)
    1bb2:	0017869b          	addw	a3,a5,1
    1bb6:	f4c6f9e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bba:	000700a3          	sb	zero,1(a4)
    1bbe:	0027869b          	addw	a3,a5,2
    1bc2:	f4c6f3e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bc6:	00070123          	sb	zero,2(a4)
    1bca:	0037869b          	addw	a3,a5,3
    1bce:	f2c6fde3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bd2:	000701a3          	sb	zero,3(a4)
    1bd6:	0047869b          	addw	a3,a5,4
    1bda:	f2c6f7e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bde:	00070223          	sb	zero,4(a4)
    1be2:	0057869b          	addw	a3,a5,5
    1be6:	f2c6f1e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bea:	000702a3          	sb	zero,5(a4)
    1bee:	0067869b          	addw	a3,a5,6
    1bf2:	f0c6fbe3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1bf6:	00070323          	sb	zero,6(a4)
    1bfa:	0077869b          	addw	a3,a5,7
    1bfe:	f0c6f5e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c02:	000703a3          	sb	zero,7(a4)
    1c06:	0087869b          	addw	a3,a5,8
    1c0a:	eec6ffe3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c0e:	00070423          	sb	zero,8(a4)
    1c12:	0097869b          	addw	a3,a5,9
    1c16:	eec6f9e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c1a:	000704a3          	sb	zero,9(a4)
    1c1e:	00a7869b          	addw	a3,a5,10
    1c22:	eec6f3e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c26:	00070523          	sb	zero,10(a4)
    1c2a:	00b7869b          	addw	a3,a5,11
    1c2e:	ecc6fde3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c32:	000705a3          	sb	zero,11(a4)
    1c36:	00c7869b          	addw	a3,a5,12
    1c3a:	ecc6f7e3          	bgeu	a3,a2,1b08 <strncpy+0x7e>
    1c3e:	00070623          	sb	zero,12(a4)
    1c42:	27b5                	addw	a5,a5,13
    1c44:	ecc7f2e3          	bgeu	a5,a2,1b08 <strncpy+0x7e>
    1c48:	000706a3          	sb	zero,13(a4)
}
    1c4c:	8082                	ret
    1c4e:	46ad                	li	a3,11
    1c50:	bde1                	j	1b28 <strncpy+0x9e>
    1c52:	00778693          	add	a3,a5,7
    1c56:	48ad                	li	a7,11
    1c58:	fff60593          	add	a1,a2,-1
    1c5c:	ed16f6e3          	bgeu	a3,a7,1b28 <strncpy+0x9e>
    1c60:	b7fd                	j	1c4e <strncpy+0x1c4>
    1c62:	40a00733          	neg	a4,a0
    1c66:	8832                	mv	a6,a2
    1c68:	00777793          	and	a5,a4,7
    1c6c:	4581                	li	a1,0
    1c6e:	ea0608e3          	beqz	a2,1b1e <strncpy+0x94>
    1c72:	b7c5                	j	1c52 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c74:	00350693          	add	a3,a0,3
    1c78:	470d                	li	a4,3
    1c7a:	b729                	j	1b84 <strncpy+0xfa>
    1c7c:	00150693          	add	a3,a0,1
    1c80:	4705                	li	a4,1
    1c82:	b709                	j	1b84 <strncpy+0xfa>
tail:
    1c84:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c86:	4701                	li	a4,0
    1c88:	bdf5                	j	1b84 <strncpy+0xfa>
    1c8a:	8082                	ret
tail:
    1c8c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c8e:	4781                	li	a5,0
    1c90:	bf39                	j	1bae <strncpy+0x124>
    1c92:	00250693          	add	a3,a0,2
    1c96:	4709                	li	a4,2
    1c98:	b5f5                	j	1b84 <strncpy+0xfa>
    1c9a:	00650693          	add	a3,a0,6
    1c9e:	4719                	li	a4,6
    1ca0:	b5d5                	j	1b84 <strncpy+0xfa>
    1ca2:	8082                	ret

0000000000001ca4 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1ca4:	87aa                	mv	a5,a0
    1ca6:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1ca8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cac:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cb0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cb2:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb4:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <openat>:
    register long a7 __asm__("a7") = n;
    1cbc:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cc0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <close>:
    register long a7 __asm__("a7") = n;
    1ccc:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cd0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <read>:
    register long a7 __asm__("a7") = n;
    1cd8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cdc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ce0:	8082                	ret

0000000000001ce2 <write>:
    register long a7 __asm__("a7") = n;
    1ce2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cea:	8082                	ret

0000000000001cec <getpid>:
    register long a7 __asm__("a7") = n;
    1cec:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cf0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <getppid>:
    register long a7 __asm__("a7") = n;
    1cf8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cfc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d04:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d08:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <fork>:
    register long a7 __asm__("a7") = n;
    1d10:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d14:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d18:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d20:	85b2                	mv	a1,a2
    1d22:	863a                	mv	a2,a4
    if (stack)
    1d24:	c191                	beqz	a1,1d28 <clone+0x8>
	stack += stack_size;
    1d26:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d28:	4781                	li	a5,0
    1d2a:	4701                	li	a4,0
    1d2c:	4681                	li	a3,0
    1d2e:	2601                	sext.w	a2,a2
    1d30:	ac01                	j	1f40 <__clone>

0000000000001d32 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d32:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d36:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d3a:	8082                	ret

0000000000001d3c <exit>:
    register long a7 __asm__("a7") = n;
    1d3c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d44:	8082                	ret

0000000000001d46 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d46:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d4a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d4c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <exec>:
    register long a7 __asm__("a7") = n;
    1d54:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <execve>:
    register long a7 __asm__("a7") = n;
    1d60:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d64:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <times>:
    register long a7 __asm__("a7") = n;
    1d6c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d70:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <get_time>:

int64 get_time()
{
    1d78:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d7a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d7e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d86:	2501                	sext.w	a0,a0
    1d88:	ed09                	bnez	a0,1da2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d8a:	67a2                	ld	a5,8(sp)
    1d8c:	3e800713          	li	a4,1000
    1d90:	00015503          	lhu	a0,0(sp)
    1d94:	02e7d7b3          	divu	a5,a5,a4
    1d98:	02e50533          	mul	a0,a0,a4
    1d9c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d9e:	0141                	add	sp,sp,16
    1da0:	8082                	ret
        return -1;
    1da2:	557d                	li	a0,-1
    1da4:	bfed                	j	1d9e <get_time+0x26>

0000000000001da6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1da6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <time>:
    register long a7 __asm__("a7") = n;
    1db2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1db6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <sleep>:

int sleep(unsigned long long time)
{
    1dbe:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dc0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dc2:	850a                	mv	a0,sp
    1dc4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dc6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dca:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dd0:	e501                	bnez	a0,1dd8 <sleep+0x1a>
    return 0;
    1dd2:	4501                	li	a0,0
}
    1dd4:	0141                	add	sp,sp,16
    1dd6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dd8:	4502                	lw	a0,0(sp)
}
    1dda:	0141                	add	sp,sp,16
    1ddc:	8082                	ret

0000000000001dde <set_priority>:
    register long a7 __asm__("a7") = n;
    1dde:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dea:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dee:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1df2:	8082                	ret

0000000000001df4 <mprotect>:
    register long a7 __asm__("a7") = n;
    1df4:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <munmap>:
    register long a7 __asm__("a7") = n;
    1e00:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e04:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <wait>:

int wait(int *code)
{
    1e0c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e12:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e14:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e16:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e18:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <spawn>:
    register long a7 __asm__("a7") = n;
    1e20:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <mailread>:
    register long a7 __asm__("a7") = n;
    1e2c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e38:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <fstat>:
    register long a7 __asm__("a7") = n;
    1e44:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e48:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e50:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e52:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e56:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e60:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e62:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e66:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e68:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e70:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e72:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e76:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e78:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <link>:

int link(char *old_path, char *new_path)
{
    1e80:	87aa                	mv	a5,a0
    1e82:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e84:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e8e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e92:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e94:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <unlink>:

int unlink(char *path)
{
    1e9c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ea2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ea6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <uname>:
    register long a7 __asm__("a7") = n;
    1eb0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eb4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <brk>:
    register long a7 __asm__("a7") = n;
    1ebc:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ec0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ec8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eca:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ece:	8082                	ret

0000000000001ed0 <chdir>:
    register long a7 __asm__("a7") = n;
    1ed0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ed4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1edc:	862e                	mv	a2,a1
    1ede:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ee0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ee6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eea:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eec:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ef6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efa:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <pipe>:
    register long a7 __asm__("a7") = n;
    1f02:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f08:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <dup>:
    register long a7 __asm__("a7") = n;
    1f10:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f12:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <dup2>:
    register long a7 __asm__("a7") = n;
    1f1a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f1c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <mount>:
    register long a7 __asm__("a7") = n;
    1f26:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f2e:	2501                	sext.w	a0,a0
    1f30:	8082                	ret

0000000000001f32 <umount>:
    register long a7 __asm__("a7") = n;
    1f32:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f38:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f40:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f42:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f44:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f46:	8532                	mv	a0,a2
	mv a2, a4
    1f48:	863a                	mv	a2,a4
	mv a3, a5
    1f4a:	86be                	mv	a3,a5
	mv a4, a6
    1f4c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f4e:	0dc00893          	li	a7,220
	ecall
    1f52:	00000073          	ecall

	beqz a0, 1f
    1f56:	c111                	beqz	a0,1f5a <__clone+0x1a>
	# Parent
	ret
    1f58:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f5a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f5c:	6522                	ld	a0,8(sp)
	jalr a1
    1f5e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f60:	05d00893          	li	a7,93
	ecall
    1f64:	00000073          	ecall
