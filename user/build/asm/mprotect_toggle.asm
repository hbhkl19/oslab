
/home/hbh/oslab/oslab/user/build/riscv64/mprotect_toggle:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aaa9                	j	115c <__start_main>

0000000000001004 <test_mprotect_write_toggle>:
#include "stdlib.h"

static struct kstat kst;

void test_mprotect_write_toggle(void)
{
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f9250513          	add	a0,a0,-110 # 1f98 <__clone+0x2e>
{
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    1014:	e04a                	sd	s2,0(sp)
    TEST_START(__func__);
    1016:	39e000ef          	jal	13b4 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	10650513          	add	a0,a0,262 # 2120 <__func__.0>
    1022:	392000ef          	jal	13b4 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	f8a50513          	add	a0,a0,-118 # 1fb0 <__clone+0x46>
    102e:	386000ef          	jal	13b4 <puts>

    const char *str = "  Hello, mmap successfully!";
    int fd = open("test_mprotect_toggle.txt", O_RDWR | O_CREATE);
    1032:	04200593          	li	a1,66
    1036:	00001517          	auipc	a0,0x1
    103a:	f8a50513          	add	a0,a0,-118 # 1fc0 <__clone+0x56>
    103e:	491000ef          	jal	1cce <open>
    1042:	842a                	mv	s0,a0
    assert(fd > 0);
    1044:	0ea05663          	blez	a0,1130 <test_mprotect_write_toggle+0x12c>
    write(fd, str, strlen(str));
    1048:	00001517          	auipc	a0,0x1
    104c:	fb850513          	add	a0,a0,-72 # 2000 <__clone+0x96>
    1050:	0e1000ef          	jal	1930 <strlen>
    1054:	862a                	mv	a2,a0
    1056:	00001597          	auipc	a1,0x1
    105a:	faa58593          	add	a1,a1,-86 # 2000 <__clone+0x96>
    105e:	8522                	mv	a0,s0
    1060:	4ad000ef          	jal	1d0c <write>
    fstat(fd, &kst);
    1064:	00001597          	auipc	a1,0x1
    1068:	03c58593          	add	a1,a1,60 # 20a0 <kst>
    106c:	8522                	mv	a0,s0
    106e:	601000ef          	jal	1e6e <fstat>

    char *array = mmap(NULL, 4096, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1072:	4781                	li	a5,0
    1074:	8722                	mv	a4,s0
    1076:	4685                	li	a3,1
    1078:	460d                	li	a2,3
    107a:	6585                	lui	a1,0x1
    107c:	4501                	li	a0,0
    107e:	597000ef          	jal	1e14 <mmap>
    assert(array != MAP_FAILED);
    1082:	57fd                	li	a5,-1
    char *array = mmap(NULL, 4096, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1084:	84aa                	mv	s1,a0
    assert(array != MAP_FAILED);
    1086:	0af50c63          	beq	a0,a5,113e <test_mprotect_write_toggle+0x13a>

    int ret = mprotect(array, 4096, PROT_READ);
    108a:	6585                	lui	a1,0x1
    108c:	4605                	li	a2,1
    108e:	8526                	mv	a0,s1
    1090:	58f000ef          	jal	1e1e <mprotect>
    1094:	892a                	mv	s2,a0
    printf("mprotect ro ret: %d\n", ret);
    1096:	85aa                	mv	a1,a0
    1098:	00001517          	auipc	a0,0x1
    109c:	f8850513          	add	a0,a0,-120 # 2020 <__clone+0xb6>
    10a0:	336000ef          	jal	13d6 <printf>
    assert(ret == 0);
    10a4:	06091863          	bnez	s2,1114 <test_mprotect_write_toggle+0x110>

    ret = mprotect(array, 4096, PROT_READ | PROT_WRITE);
    10a8:	6585                	lui	a1,0x1
    10aa:	460d                	li	a2,3
    10ac:	8526                	mv	a0,s1
    10ae:	571000ef          	jal	1e1e <mprotect>
    10b2:	892a                	mv	s2,a0
    printf("mprotect rw ret: %d\n", ret);
    10b4:	85aa                	mv	a1,a0
    10b6:	00001517          	auipc	a0,0x1
    10ba:	f8250513          	add	a0,a0,-126 # 2038 <__clone+0xce>
    10be:	318000ef          	jal	13d6 <printf>
    assert(ret == 0);
    10c2:	06091063          	bnez	s2,1122 <test_mprotect_write_toggle+0x11e>

    array[0] = 'X';
    10c6:	05800793          	li	a5,88
    10ca:	00f48023          	sb	a5,0(s1)
    printf("mprotect toggle success.\n");
    10ce:	00001517          	auipc	a0,0x1
    10d2:	f8250513          	add	a0,a0,-126 # 2050 <__clone+0xe6>
    10d6:	300000ef          	jal	13d6 <printf>
    munmap(array, 4096);
    10da:	6585                	lui	a1,0x1
    10dc:	8526                	mv	a0,s1
    10de:	54d000ef          	jal	1e2a <munmap>
    close(fd);
    10e2:	8522                	mv	a0,s0
    10e4:	413000ef          	jal	1cf6 <close>

    TEST_END(__func__);
    10e8:	00001517          	auipc	a0,0x1
    10ec:	f8850513          	add	a0,a0,-120 # 2070 <__clone+0x106>
    10f0:	2c4000ef          	jal	13b4 <puts>
    10f4:	00001517          	auipc	a0,0x1
    10f8:	02c50513          	add	a0,a0,44 # 2120 <__func__.0>
    10fc:	2b8000ef          	jal	13b4 <puts>
}
    1100:	6442                	ld	s0,16(sp)
    1102:	60e2                	ld	ra,24(sp)
    1104:	64a2                	ld	s1,8(sp)
    1106:	6902                	ld	s2,0(sp)
    TEST_END(__func__);
    1108:	00001517          	auipc	a0,0x1
    110c:	ea850513          	add	a0,a0,-344 # 1fb0 <__clone+0x46>
}
    1110:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1112:	a44d                	j	13b4 <puts>
    assert(ret == 0);
    1114:	00001517          	auipc	a0,0x1
    1118:	ecc50513          	add	a0,a0,-308 # 1fe0 <__clone+0x76>
    111c:	534000ef          	jal	1650 <panic>
    1120:	b761                	j	10a8 <test_mprotect_write_toggle+0xa4>
    assert(ret == 0);
    1122:	00001517          	auipc	a0,0x1
    1126:	ebe50513          	add	a0,a0,-322 # 1fe0 <__clone+0x76>
    112a:	526000ef          	jal	1650 <panic>
    112e:	bf61                	j	10c6 <test_mprotect_write_toggle+0xc2>
    assert(fd > 0);
    1130:	00001517          	auipc	a0,0x1
    1134:	eb050513          	add	a0,a0,-336 # 1fe0 <__clone+0x76>
    1138:	518000ef          	jal	1650 <panic>
    113c:	b731                	j	1048 <test_mprotect_write_toggle+0x44>
    assert(array != MAP_FAILED);
    113e:	00001517          	auipc	a0,0x1
    1142:	ea250513          	add	a0,a0,-350 # 1fe0 <__clone+0x76>
    1146:	50a000ef          	jal	1650 <panic>
    114a:	b781                	j	108a <test_mprotect_write_toggle+0x86>

000000000000114c <main>:

int main(void)
{
    114c:	1141                	add	sp,sp,-16
    114e:	e406                	sd	ra,8(sp)
    test_mprotect_write_toggle();
    1150:	eb5ff0ef          	jal	1004 <test_mprotect_write_toggle>
    return 0;
}
    1154:	60a2                	ld	ra,8(sp)
    1156:	4501                	li	a0,0
    1158:	0141                	add	sp,sp,16
    115a:	8082                	ret

000000000000115c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    115c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    115e:	4108                	lw	a0,0(a0)
{
    1160:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1162:	05a1                	add	a1,a1,8 # 1008 <test_mprotect_write_toggle+0x4>
{
    1164:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1166:	fe7ff0ef          	jal	114c <main>
    116a:	3fd000ef          	jal	1d66 <exit>
	return 0;
}
    116e:	60a2                	ld	ra,8(sp)
    1170:	4501                	li	a0,0
    1172:	0141                	add	sp,sp,16
    1174:	8082                	ret

0000000000001176 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1176:	7179                	add	sp,sp,-48
    1178:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    117a:	12054863          	bltz	a0,12aa <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    117e:	02b577bb          	remuw	a5,a0,a1
    1182:	00001697          	auipc	a3,0x1
    1186:	fbe68693          	add	a3,a3,-66 # 2140 <digits>
    buf[16] = 0;
    118a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    118e:	0005871b          	sext.w	a4,a1
    1192:	1782                	sll	a5,a5,0x20
    1194:	9381                	srl	a5,a5,0x20
    1196:	97b6                	add	a5,a5,a3
    1198:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    119c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11a0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11a4:	1ab56663          	bltu	a0,a1,1350 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11a8:	02e8763b          	remuw	a2,a6,a4
    11ac:	1602                	sll	a2,a2,0x20
    11ae:	9201                	srl	a2,a2,0x20
    11b0:	9636                	add	a2,a2,a3
    11b2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ba:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11be:	12e86c63          	bltu	a6,a4,12f6 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11c2:	02e5f63b          	remuw	a2,a1,a4
    11c6:	1602                	sll	a2,a2,0x20
    11c8:	9201                	srl	a2,a2,0x20
    11ca:	9636                	add	a2,a2,a3
    11cc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d4:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11d8:	12e5e863          	bltu	a1,a4,1308 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11dc:	02e8763b          	remuw	a2,a6,a4
    11e0:	1602                	sll	a2,a2,0x20
    11e2:	9201                	srl	a2,a2,0x20
    11e4:	9636                	add	a2,a2,a3
    11e6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ea:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ee:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11f2:	12e86463          	bltu	a6,a4,131a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11f6:	02e5f63b          	remuw	a2,a1,a4
    11fa:	1602                	sll	a2,a2,0x20
    11fc:	9201                	srl	a2,a2,0x20
    11fe:	9636                	add	a2,a2,a3
    1200:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1204:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1208:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    120c:	12e5e063          	bltu	a1,a4,132c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1210:	02e8763b          	remuw	a2,a6,a4
    1214:	1602                	sll	a2,a2,0x20
    1216:	9201                	srl	a2,a2,0x20
    1218:	9636                	add	a2,a2,a3
    121a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    121e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1222:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1226:	0ae86f63          	bltu	a6,a4,12e4 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    122a:	02e5f63b          	remuw	a2,a1,a4
    122e:	1602                	sll	a2,a2,0x20
    1230:	9201                	srl	a2,a2,0x20
    1232:	9636                	add	a2,a2,a3
    1234:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1238:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    123c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1240:	0ee5ef63          	bltu	a1,a4,133e <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1244:	02e8763b          	remuw	a2,a6,a4
    1248:	1602                	sll	a2,a2,0x20
    124a:	9201                	srl	a2,a2,0x20
    124c:	9636                	add	a2,a2,a3
    124e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1252:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1256:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    125a:	0ee86d63          	bltu	a6,a4,1354 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    125e:	02e5f63b          	remuw	a2,a1,a4
    1262:	1602                	sll	a2,a2,0x20
    1264:	9201                	srl	a2,a2,0x20
    1266:	9636                	add	a2,a2,a3
    1268:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    126c:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1270:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1274:	0ee5e963          	bltu	a1,a4,1366 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1278:	1782                	sll	a5,a5,0x20
    127a:	9381                	srl	a5,a5,0x20
    127c:	96be                	add	a3,a3,a5
    127e:	0006c783          	lbu	a5,0(a3)
    1282:	4599                	li	a1,6
    1284:	00f10723          	sb	a5,14(sp)

    if (sign)
    1288:	00055763          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1294:	4595                	li	a1,5
    write(f, s, l);
    1296:	003c                	add	a5,sp,8
    1298:	4641                	li	a2,16
    129a:	9e0d                	subw	a2,a2,a1
    129c:	4505                	li	a0,1
    129e:	95be                	add	a1,a1,a5
    12a0:	26d000ef          	jal	1d0c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12a4:	70a2                	ld	ra,40(sp)
    12a6:	6145                	add	sp,sp,48
    12a8:	8082                	ret
        x = -xx;
    12aa:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12ae:	02b677bb          	remuw	a5,a2,a1
    12b2:	00001697          	auipc	a3,0x1
    12b6:	e8e68693          	add	a3,a3,-370 # 2140 <digits>
    buf[16] = 0;
    12ba:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12be:	0005871b          	sext.w	a4,a1
    12c2:	1782                	sll	a5,a5,0x20
    12c4:	9381                	srl	a5,a5,0x20
    12c6:	97b6                	add	a5,a5,a3
    12c8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12cc:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12d0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12d4:	ecb67ae3          	bgeu	a2,a1,11a8 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12d8:	02d00793          	li	a5,45
    12dc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12e0:	45b9                	li	a1,14
    12e2:	bf55                	j	1296 <printint.constprop.0+0x120>
    12e4:	45a9                	li	a1,10
    if (sign)
    12e6:	fa0558e3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ea:	02d00793          	li	a5,45
    12ee:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12f2:	45a5                	li	a1,9
    12f4:	b74d                	j	1296 <printint.constprop.0+0x120>
    12f6:	45b9                	li	a1,14
    if (sign)
    12f8:	f8055fe3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fc:	02d00793          	li	a5,45
    1300:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1304:	45b5                	li	a1,13
    1306:	bf41                	j	1296 <printint.constprop.0+0x120>
    1308:	45b5                	li	a1,13
    if (sign)
    130a:	f80556e3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    130e:	02d00793          	li	a5,45
    1312:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1316:	45b1                	li	a1,12
    1318:	bfbd                	j	1296 <printint.constprop.0+0x120>
    131a:	45b1                	li	a1,12
    if (sign)
    131c:	f6055de3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1320:	02d00793          	li	a5,45
    1324:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1328:	45ad                	li	a1,11
    132a:	b7b5                	j	1296 <printint.constprop.0+0x120>
    132c:	45ad                	li	a1,11
    if (sign)
    132e:	f60554e3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1332:	02d00793          	li	a5,45
    1336:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    133a:	45a9                	li	a1,10
    133c:	bfa9                	j	1296 <printint.constprop.0+0x120>
    133e:	45a5                	li	a1,9
    if (sign)
    1340:	f4055be3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1344:	02d00793          	li	a5,45
    1348:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    134c:	45a1                	li	a1,8
    134e:	b7a1                	j	1296 <printint.constprop.0+0x120>
    i = 15;
    1350:	45bd                	li	a1,15
    1352:	b791                	j	1296 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1354:	45a1                	li	a1,8
    if (sign)
    1356:	f40550e3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    135a:	02d00793          	li	a5,45
    135e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1362:	459d                	li	a1,7
    1364:	bf0d                	j	1296 <printint.constprop.0+0x120>
    1366:	459d                	li	a1,7
    if (sign)
    1368:	f20557e3          	bgez	a0,1296 <printint.constprop.0+0x120>
        buf[i--] = '-';
    136c:	02d00793          	li	a5,45
    1370:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1374:	4599                	li	a1,6
    1376:	b705                	j	1296 <printint.constprop.0+0x120>

0000000000001378 <getchar>:
{
    1378:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    137a:	00f10593          	add	a1,sp,15
    137e:	4605                	li	a2,1
    1380:	4501                	li	a0,0
{
    1382:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1384:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1388:	17b000ef          	jal	1d02 <read>
}
    138c:	60e2                	ld	ra,24(sp)
    138e:	00f14503          	lbu	a0,15(sp)
    1392:	6105                	add	sp,sp,32
    1394:	8082                	ret

0000000000001396 <putchar>:
{
    1396:	1101                	add	sp,sp,-32
    1398:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    139a:	00f10593          	add	a1,sp,15
    139e:	4605                	li	a2,1
    13a0:	4505                	li	a0,1
{
    13a2:	ec06                	sd	ra,24(sp)
    char byte = c;
    13a4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13a8:	165000ef          	jal	1d0c <write>
}
    13ac:	60e2                	ld	ra,24(sp)
    13ae:	2501                	sext.w	a0,a0
    13b0:	6105                	add	sp,sp,32
    13b2:	8082                	ret

00000000000013b4 <puts>:
{
    13b4:	1141                	add	sp,sp,-16
    13b6:	e406                	sd	ra,8(sp)
    13b8:	e022                	sd	s0,0(sp)
    13ba:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13bc:	574000ef          	jal	1930 <strlen>
    13c0:	862a                	mv	a2,a0
    13c2:	85a2                	mv	a1,s0
    13c4:	4505                	li	a0,1
    13c6:	147000ef          	jal	1d0c <write>
}
    13ca:	60a2                	ld	ra,8(sp)
    13cc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13ce:	957d                	sra	a0,a0,0x3f
    return r;
    13d0:	2501                	sext.w	a0,a0
}
    13d2:	0141                	add	sp,sp,16
    13d4:	8082                	ret

00000000000013d6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13d6:	7171                	add	sp,sp,-176
    13d8:	f85a                	sd	s6,48(sp)
    13da:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13dc:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13de:	18bc                	add	a5,sp,120
{
    13e0:	e8ca                	sd	s2,80(sp)
    13e2:	e4ce                	sd	s3,72(sp)
    13e4:	e0d2                	sd	s4,64(sp)
    13e6:	fc56                	sd	s5,56(sp)
    13e8:	f486                	sd	ra,104(sp)
    13ea:	f0a2                	sd	s0,96(sp)
    13ec:	eca6                	sd	s1,88(sp)
    13ee:	fcae                	sd	a1,120(sp)
    13f0:	e132                	sd	a2,128(sp)
    13f2:	e536                	sd	a3,136(sp)
    13f4:	e93a                	sd	a4,144(sp)
    13f6:	f142                	sd	a6,160(sp)
    13f8:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13fa:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13fc:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1400:	07300a13          	li	s4,115
    1404:	07800a93          	li	s5,120
    buf[i++] = '0';
    1408:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140c:	00001997          	auipc	s3,0x1
    1410:	d3498993          	add	s3,s3,-716 # 2140 <digits>
        if (!*s)
    1414:	00054783          	lbu	a5,0(a0)
    1418:	16078a63          	beqz	a5,158c <printf+0x1b6>
    141c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    141e:	19278d63          	beq	a5,s2,15b8 <printf+0x1e2>
    1422:	00164783          	lbu	a5,1(a2)
    1426:	0605                	add	a2,a2,1
    1428:	fbfd                	bnez	a5,141e <printf+0x48>
    142a:	84b2                	mv	s1,a2
        l = z - a;
    142c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1430:	85aa                	mv	a1,a0
    1432:	8622                	mv	a2,s0
    1434:	4505                	li	a0,1
    1436:	0d7000ef          	jal	1d0c <write>
        if (l)
    143a:	1a041463          	bnez	s0,15e2 <printf+0x20c>
        if (s[1] == 0)
    143e:	0014c783          	lbu	a5,1(s1)
    1442:	14078563          	beqz	a5,158c <printf+0x1b6>
        switch (s[1])
    1446:	1b478063          	beq	a5,s4,15e6 <printf+0x210>
    144a:	14fa6b63          	bltu	s4,a5,15a0 <printf+0x1ca>
    144e:	06400713          	li	a4,100
    1452:	1ee78063          	beq	a5,a4,1632 <printf+0x25c>
    1456:	07000713          	li	a4,112
    145a:	1ae79963          	bne	a5,a4,160c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    145e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1460:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1464:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1466:	631c                	ld	a5,0(a4)
    1468:	0721                	add	a4,a4,8
    146a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146c:	00479293          	sll	t0,a5,0x4
    1470:	00879f93          	sll	t6,a5,0x8
    1474:	00c79f13          	sll	t5,a5,0xc
    1478:	01079e93          	sll	t4,a5,0x10
    147c:	01479e13          	sll	t3,a5,0x14
    1480:	01879313          	sll	t1,a5,0x18
    1484:	01c79893          	sll	a7,a5,0x1c
    1488:	02479813          	sll	a6,a5,0x24
    148c:	02879513          	sll	a0,a5,0x28
    1490:	02c79593          	sll	a1,a5,0x2c
    1494:	03079693          	sll	a3,a5,0x30
    1498:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149c:	03c7d413          	srl	s0,a5,0x3c
    14a0:	01c7d39b          	srlw	t2,a5,0x1c
    14a4:	03c2d293          	srl	t0,t0,0x3c
    14a8:	03cfdf93          	srl	t6,t6,0x3c
    14ac:	03cf5f13          	srl	t5,t5,0x3c
    14b0:	03cede93          	srl	t4,t4,0x3c
    14b4:	03ce5e13          	srl	t3,t3,0x3c
    14b8:	03c35313          	srl	t1,t1,0x3c
    14bc:	03c8d893          	srl	a7,a7,0x3c
    14c0:	03c85813          	srl	a6,a6,0x3c
    14c4:	9171                	srl	a0,a0,0x3c
    14c6:	91f1                	srl	a1,a1,0x3c
    14c8:	92f1                	srl	a3,a3,0x3c
    14ca:	9371                	srl	a4,a4,0x3c
    14cc:	96ce                	add	a3,a3,s3
    14ce:	974e                	add	a4,a4,s3
    14d0:	944e                	add	s0,s0,s3
    14d2:	92ce                	add	t0,t0,s3
    14d4:	9fce                	add	t6,t6,s3
    14d6:	9f4e                	add	t5,t5,s3
    14d8:	9ece                	add	t4,t4,s3
    14da:	9e4e                	add	t3,t3,s3
    14dc:	934e                	add	t1,t1,s3
    14de:	98ce                	add	a7,a7,s3
    14e0:	93ce                	add	t2,t2,s3
    14e2:	984e                	add	a6,a6,s3
    14e4:	954e                	add	a0,a0,s3
    14e6:	95ce                	add	a1,a1,s3
    14e8:	0006c083          	lbu	ra,0(a3)
    14ec:	0002c283          	lbu	t0,0(t0)
    14f0:	00074683          	lbu	a3,0(a4)
    14f4:	000fcf83          	lbu	t6,0(t6)
    14f8:	000f4f03          	lbu	t5,0(t5)
    14fc:	000ece83          	lbu	t4,0(t4)
    1500:	000e4e03          	lbu	t3,0(t3)
    1504:	00034303          	lbu	t1,0(t1)
    1508:	0008c883          	lbu	a7,0(a7)
    150c:	0003c383          	lbu	t2,0(t2)
    1510:	00084803          	lbu	a6,0(a6)
    1514:	00054503          	lbu	a0,0(a0)
    1518:	0005c583          	lbu	a1,0(a1)
    151c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1520:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1524:	9371                	srl	a4,a4,0x3c
    1526:	8bbd                	and	a5,a5,15
    1528:	974e                	add	a4,a4,s3
    152a:	97ce                	add	a5,a5,s3
    152c:	005105a3          	sb	t0,11(sp)
    1530:	01f10623          	sb	t6,12(sp)
    1534:	01e106a3          	sb	t5,13(sp)
    1538:	01d10723          	sb	t4,14(sp)
    153c:	01c107a3          	sb	t3,15(sp)
    1540:	00610823          	sb	t1,16(sp)
    1544:	011108a3          	sb	a7,17(sp)
    1548:	00710923          	sb	t2,18(sp)
    154c:	010109a3          	sb	a6,19(sp)
    1550:	00a10a23          	sb	a0,20(sp)
    1554:	00b10aa3          	sb	a1,21(sp)
    1558:	00110b23          	sb	ra,22(sp)
    155c:	00d10ba3          	sb	a3,23(sp)
    1560:	00810523          	sb	s0,10(sp)
    1564:	00074703          	lbu	a4,0(a4)
    1568:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    156c:	002c                	add	a1,sp,8
    156e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1570:	00e10c23          	sb	a4,24(sp)
    1574:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1578:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    157c:	790000ef          	jal	1d0c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1580:	00248513          	add	a0,s1,2
        if (!*s)
    1584:	00054783          	lbu	a5,0(a0)
    1588:	e8079ae3          	bnez	a5,141c <printf+0x46>
    }
    va_end(ap);
}
    158c:	70a6                	ld	ra,104(sp)
    158e:	7406                	ld	s0,96(sp)
    1590:	64e6                	ld	s1,88(sp)
    1592:	6946                	ld	s2,80(sp)
    1594:	69a6                	ld	s3,72(sp)
    1596:	6a06                	ld	s4,64(sp)
    1598:	7ae2                	ld	s5,56(sp)
    159a:	7b42                	ld	s6,48(sp)
    159c:	614d                	add	sp,sp,176
    159e:	8082                	ret
        switch (s[1])
    15a0:	07579663          	bne	a5,s5,160c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15a4:	6782                	ld	a5,0(sp)
    15a6:	45c1                	li	a1,16
    15a8:	4388                	lw	a0,0(a5)
    15aa:	07a1                	add	a5,a5,8
    15ac:	e03e                	sd	a5,0(sp)
    15ae:	bc9ff0ef          	jal	1176 <printint.constprop.0>
        s += 2;
    15b2:	00248513          	add	a0,s1,2
    15b6:	b7f9                	j	1584 <printf+0x1ae>
    15b8:	84b2                	mv	s1,a2
    15ba:	a039                	j	15c8 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15bc:	0024c783          	lbu	a5,2(s1)
    15c0:	0605                	add	a2,a2,1
    15c2:	0489                	add	s1,s1,2
    15c4:	e72794e3          	bne	a5,s2,142c <printf+0x56>
    15c8:	0014c783          	lbu	a5,1(s1)
    15cc:	ff2788e3          	beq	a5,s2,15bc <printf+0x1e6>
        l = z - a;
    15d0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15d4:	85aa                	mv	a1,a0
    15d6:	8622                	mv	a2,s0
    15d8:	4505                	li	a0,1
    15da:	732000ef          	jal	1d0c <write>
        if (l)
    15de:	e60400e3          	beqz	s0,143e <printf+0x68>
    15e2:	8526                	mv	a0,s1
    15e4:	bd05                	j	1414 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15e6:	6782                	ld	a5,0(sp)
    15e8:	6380                	ld	s0,0(a5)
    15ea:	07a1                	add	a5,a5,8
    15ec:	e03e                	sd	a5,0(sp)
    15ee:	cc21                	beqz	s0,1646 <printf+0x270>
            l = strnlen(a, 200);
    15f0:	0c800593          	li	a1,200
    15f4:	8522                	mv	a0,s0
    15f6:	424000ef          	jal	1a1a <strnlen>
    write(f, s, l);
    15fa:	0005061b          	sext.w	a2,a0
    15fe:	85a2                	mv	a1,s0
    1600:	4505                	li	a0,1
    1602:	70a000ef          	jal	1d0c <write>
        s += 2;
    1606:	00248513          	add	a0,s1,2
    160a:	bfad                	j	1584 <printf+0x1ae>
    return write(stdout, &byte, 1);
    160c:	4605                	li	a2,1
    160e:	002c                	add	a1,sp,8
    1610:	4505                	li	a0,1
    char byte = c;
    1612:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1616:	6f6000ef          	jal	1d0c <write>
    char byte = c;
    161a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    161e:	4605                	li	a2,1
    1620:	002c                	add	a1,sp,8
    1622:	4505                	li	a0,1
    char byte = c;
    1624:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1628:	6e4000ef          	jal	1d0c <write>
        s += 2;
    162c:	00248513          	add	a0,s1,2
    1630:	bf91                	j	1584 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1632:	6782                	ld	a5,0(sp)
    1634:	45a9                	li	a1,10
    1636:	4388                	lw	a0,0(a5)
    1638:	07a1                	add	a5,a5,8
    163a:	e03e                	sd	a5,0(sp)
    163c:	b3bff0ef          	jal	1176 <printint.constprop.0>
        s += 2;
    1640:	00248513          	add	a0,s1,2
    1644:	b781                	j	1584 <printf+0x1ae>
                a = "(null)";
    1646:	00001417          	auipc	s0,0x1
    164a:	a3a40413          	add	s0,s0,-1478 # 2080 <__clone+0x116>
    164e:	b74d                	j	15f0 <printf+0x21a>

0000000000001650 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1650:	1141                	add	sp,sp,-16
    1652:	e406                	sd	ra,8(sp)
    puts(m);
    1654:	d61ff0ef          	jal	13b4 <puts>
    exit(-100);
}
    1658:	60a2                	ld	ra,8(sp)
    exit(-100);
    165a:	f9c00513          	li	a0,-100
}
    165e:	0141                	add	sp,sp,16
    exit(-100);
    1660:	a719                	j	1d66 <exit>

0000000000001662 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1662:	02000793          	li	a5,32
    1666:	00f50663          	beq	a0,a5,1672 <isspace+0x10>
    166a:	355d                	addw	a0,a0,-9
    166c:	00553513          	sltiu	a0,a0,5
    1670:	8082                	ret
    1672:	4505                	li	a0,1
}
    1674:	8082                	ret

0000000000001676 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1676:	fd05051b          	addw	a0,a0,-48
}
    167a:	00a53513          	sltiu	a0,a0,10
    167e:	8082                	ret

0000000000001680 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1680:	02000693          	li	a3,32
    1684:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1686:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    168a:	ff77871b          	addw	a4,a5,-9
    168e:	04d78c63          	beq	a5,a3,16e6 <atoi+0x66>
    1692:	0007861b          	sext.w	a2,a5
    1696:	04e5f863          	bgeu	a1,a4,16e6 <atoi+0x66>
        s++;
    switch (*s)
    169a:	02b00713          	li	a4,43
    169e:	04e78963          	beq	a5,a4,16f0 <atoi+0x70>
    16a2:	02d00713          	li	a4,45
    16a6:	06e78263          	beq	a5,a4,170a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16aa:	fd06069b          	addw	a3,a2,-48
    16ae:	47a5                	li	a5,9
    16b0:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16b2:	4301                	li	t1,0
    while (isdigit(*s))
    16b4:	04d7e963          	bltu	a5,a3,1706 <atoi+0x86>
    int n = 0, neg = 0;
    16b8:	4501                	li	a0,0
    while (isdigit(*s))
    16ba:	48a5                	li	a7,9
    16bc:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16c0:	0025179b          	sllw	a5,a0,0x2
    16c4:	9fa9                	addw	a5,a5,a0
    16c6:	fd06059b          	addw	a1,a2,-48
    16ca:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16ce:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16d2:	0705                	add	a4,a4,1
    16d4:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16d8:	0006861b          	sext.w	a2,a3
    16dc:	ff08f0e3          	bgeu	a7,a6,16bc <atoi+0x3c>
    return neg ? n : -n;
    16e0:	00030563          	beqz	t1,16ea <atoi+0x6a>
}
    16e4:	8082                	ret
        s++;
    16e6:	0505                	add	a0,a0,1
    16e8:	bf79                	j	1686 <atoi+0x6>
    return neg ? n : -n;
    16ea:	40f5853b          	subw	a0,a1,a5
    16ee:	8082                	ret
    while (isdigit(*s))
    16f0:	00154603          	lbu	a2,1(a0)
    16f4:	47a5                	li	a5,9
        s++;
    16f6:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16fa:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16fe:	4301                	li	t1,0
    while (isdigit(*s))
    1700:	2601                	sext.w	a2,a2
    1702:	fad7fbe3          	bgeu	a5,a3,16b8 <atoi+0x38>
    1706:	4501                	li	a0,0
}
    1708:	8082                	ret
    while (isdigit(*s))
    170a:	00154603          	lbu	a2,1(a0)
    170e:	47a5                	li	a5,9
        s++;
    1710:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1714:	fd06069b          	addw	a3,a2,-48
    1718:	2601                	sext.w	a2,a2
    171a:	fed7e6e3          	bltu	a5,a3,1706 <atoi+0x86>
        neg = 1;
    171e:	4305                	li	t1,1
    1720:	bf61                	j	16b8 <atoi+0x38>

0000000000001722 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1722:	18060163          	beqz	a2,18a4 <memset+0x182>
    1726:	40a006b3          	neg	a3,a0
    172a:	0076f793          	and	a5,a3,7
    172e:	00778813          	add	a6,a5,7
    1732:	48ad                	li	a7,11
    1734:	0ff5f713          	zext.b	a4,a1
    1738:	fff60593          	add	a1,a2,-1
    173c:	17186563          	bltu	a6,a7,18a6 <memset+0x184>
    1740:	1705ed63          	bltu	a1,a6,18ba <memset+0x198>
    1744:	16078363          	beqz	a5,18aa <memset+0x188>
    1748:	00e50023          	sb	a4,0(a0)
    174c:	0066f593          	and	a1,a3,6
    1750:	16058063          	beqz	a1,18b0 <memset+0x18e>
    1754:	00e500a3          	sb	a4,1(a0)
    1758:	4589                	li	a1,2
    175a:	16f5f363          	bgeu	a1,a5,18c0 <memset+0x19e>
    175e:	00e50123          	sb	a4,2(a0)
    1762:	8a91                	and	a3,a3,4
    1764:	00350593          	add	a1,a0,3
    1768:	4e0d                	li	t3,3
    176a:	ce9d                	beqz	a3,17a8 <memset+0x86>
    176c:	00e501a3          	sb	a4,3(a0)
    1770:	4691                	li	a3,4
    1772:	00450593          	add	a1,a0,4
    1776:	4e11                	li	t3,4
    1778:	02f6f863          	bgeu	a3,a5,17a8 <memset+0x86>
    177c:	00e50223          	sb	a4,4(a0)
    1780:	4695                	li	a3,5
    1782:	00550593          	add	a1,a0,5
    1786:	4e15                	li	t3,5
    1788:	02d78063          	beq	a5,a3,17a8 <memset+0x86>
    178c:	fff50693          	add	a3,a0,-1
    1790:	00e502a3          	sb	a4,5(a0)
    1794:	8a9d                	and	a3,a3,7
    1796:	00650593          	add	a1,a0,6
    179a:	4e19                	li	t3,6
    179c:	e691                	bnez	a3,17a8 <memset+0x86>
    179e:	00750593          	add	a1,a0,7
    17a2:	00e50323          	sb	a4,6(a0)
    17a6:	4e1d                	li	t3,7
    17a8:	00871693          	sll	a3,a4,0x8
    17ac:	01071813          	sll	a6,a4,0x10
    17b0:	8ed9                	or	a3,a3,a4
    17b2:	01871893          	sll	a7,a4,0x18
    17b6:	0106e6b3          	or	a3,a3,a6
    17ba:	0116e6b3          	or	a3,a3,a7
    17be:	02071813          	sll	a6,a4,0x20
    17c2:	02871313          	sll	t1,a4,0x28
    17c6:	0106e6b3          	or	a3,a3,a6
    17ca:	40f608b3          	sub	a7,a2,a5
    17ce:	03071813          	sll	a6,a4,0x30
    17d2:	0066e6b3          	or	a3,a3,t1
    17d6:	0106e6b3          	or	a3,a3,a6
    17da:	03871313          	sll	t1,a4,0x38
    17de:	97aa                	add	a5,a5,a0
    17e0:	ff88f813          	and	a6,a7,-8
    17e4:	0066e6b3          	or	a3,a3,t1
    17e8:	983e                	add	a6,a6,a5
    17ea:	e394                	sd	a3,0(a5)
    17ec:	07a1                	add	a5,a5,8
    17ee:	ff079ee3          	bne	a5,a6,17ea <memset+0xc8>
    17f2:	ff88f793          	and	a5,a7,-8
    17f6:	0078f893          	and	a7,a7,7
    17fa:	00f586b3          	add	a3,a1,a5
    17fe:	01c787bb          	addw	a5,a5,t3
    1802:	0a088b63          	beqz	a7,18b8 <memset+0x196>
    1806:	00e68023          	sb	a4,0(a3)
    180a:	0017859b          	addw	a1,a5,1
    180e:	08c5fb63          	bgeu	a1,a2,18a4 <memset+0x182>
    1812:	00e680a3          	sb	a4,1(a3)
    1816:	0027859b          	addw	a1,a5,2
    181a:	08c5f563          	bgeu	a1,a2,18a4 <memset+0x182>
    181e:	00e68123          	sb	a4,2(a3)
    1822:	0037859b          	addw	a1,a5,3
    1826:	06c5ff63          	bgeu	a1,a2,18a4 <memset+0x182>
    182a:	00e681a3          	sb	a4,3(a3)
    182e:	0047859b          	addw	a1,a5,4
    1832:	06c5f963          	bgeu	a1,a2,18a4 <memset+0x182>
    1836:	00e68223          	sb	a4,4(a3)
    183a:	0057859b          	addw	a1,a5,5
    183e:	06c5f363          	bgeu	a1,a2,18a4 <memset+0x182>
    1842:	00e682a3          	sb	a4,5(a3)
    1846:	0067859b          	addw	a1,a5,6
    184a:	04c5fd63          	bgeu	a1,a2,18a4 <memset+0x182>
    184e:	00e68323          	sb	a4,6(a3)
    1852:	0077859b          	addw	a1,a5,7
    1856:	04c5f763          	bgeu	a1,a2,18a4 <memset+0x182>
    185a:	00e683a3          	sb	a4,7(a3)
    185e:	0087859b          	addw	a1,a5,8
    1862:	04c5f163          	bgeu	a1,a2,18a4 <memset+0x182>
    1866:	00e68423          	sb	a4,8(a3)
    186a:	0097859b          	addw	a1,a5,9
    186e:	02c5fb63          	bgeu	a1,a2,18a4 <memset+0x182>
    1872:	00e684a3          	sb	a4,9(a3)
    1876:	00a7859b          	addw	a1,a5,10
    187a:	02c5f563          	bgeu	a1,a2,18a4 <memset+0x182>
    187e:	00e68523          	sb	a4,10(a3)
    1882:	00b7859b          	addw	a1,a5,11
    1886:	00c5ff63          	bgeu	a1,a2,18a4 <memset+0x182>
    188a:	00e685a3          	sb	a4,11(a3)
    188e:	00c7859b          	addw	a1,a5,12
    1892:	00c5f963          	bgeu	a1,a2,18a4 <memset+0x182>
    1896:	00e68623          	sb	a4,12(a3)
    189a:	27b5                	addw	a5,a5,13
    189c:	00c7f463          	bgeu	a5,a2,18a4 <memset+0x182>
    18a0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18a4:	8082                	ret
    18a6:	482d                	li	a6,11
    18a8:	bd61                	j	1740 <memset+0x1e>
    char *p = dest;
    18aa:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18ac:	4e01                	li	t3,0
    18ae:	bded                	j	17a8 <memset+0x86>
    18b0:	00150593          	add	a1,a0,1
    18b4:	4e05                	li	t3,1
    18b6:	bdcd                	j	17a8 <memset+0x86>
    18b8:	8082                	ret
    char *p = dest;
    18ba:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18bc:	4781                	li	a5,0
    18be:	b7a1                	j	1806 <memset+0xe4>
    18c0:	00250593          	add	a1,a0,2
    18c4:	4e09                	li	t3,2
    18c6:	b5cd                	j	17a8 <memset+0x86>

00000000000018c8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18c8:	00054783          	lbu	a5,0(a0)
    18cc:	0005c703          	lbu	a4,0(a1)
    18d0:	00e79863          	bne	a5,a4,18e0 <strcmp+0x18>
    18d4:	0505                	add	a0,a0,1
    18d6:	0585                	add	a1,a1,1
    18d8:	fbe5                	bnez	a5,18c8 <strcmp>
    18da:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18dc:	9d19                	subw	a0,a0,a4
    18de:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18e0:	0007851b          	sext.w	a0,a5
    18e4:	bfe5                	j	18dc <strcmp+0x14>

00000000000018e6 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18e6:	ca15                	beqz	a2,191a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18e8:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18ec:	167d                	add	a2,a2,-1
    18ee:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18f2:	eb99                	bnez	a5,1908 <strncmp+0x22>
    18f4:	a815                	j	1928 <strncmp+0x42>
    18f6:	00a68e63          	beq	a3,a0,1912 <strncmp+0x2c>
    18fa:	0505                	add	a0,a0,1
    18fc:	00f71b63          	bne	a4,a5,1912 <strncmp+0x2c>
    1900:	00054783          	lbu	a5,0(a0)
    1904:	cf89                	beqz	a5,191e <strncmp+0x38>
    1906:	85b2                	mv	a1,a2
    1908:	0005c703          	lbu	a4,0(a1)
    190c:	00158613          	add	a2,a1,1
    1910:	f37d                	bnez	a4,18f6 <strncmp+0x10>
        ;
    return *l - *r;
    1912:	0007851b          	sext.w	a0,a5
    1916:	9d19                	subw	a0,a0,a4
    1918:	8082                	ret
        return 0;
    191a:	4501                	li	a0,0
}
    191c:	8082                	ret
    return *l - *r;
    191e:	0015c703          	lbu	a4,1(a1)
    1922:	4501                	li	a0,0
    1924:	9d19                	subw	a0,a0,a4
    1926:	8082                	ret
    1928:	0005c703          	lbu	a4,0(a1)
    192c:	4501                	li	a0,0
    192e:	b7e5                	j	1916 <strncmp+0x30>

0000000000001930 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1930:	00757793          	and	a5,a0,7
    1934:	cf89                	beqz	a5,194e <strlen+0x1e>
    1936:	87aa                	mv	a5,a0
    1938:	a029                	j	1942 <strlen+0x12>
    193a:	0785                	add	a5,a5,1
    193c:	0077f713          	and	a4,a5,7
    1940:	cb01                	beqz	a4,1950 <strlen+0x20>
        if (!*s)
    1942:	0007c703          	lbu	a4,0(a5)
    1946:	fb75                	bnez	a4,193a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1948:	40a78533          	sub	a0,a5,a0
}
    194c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    194e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1950:	6394                	ld	a3,0(a5)
    1952:	00000597          	auipc	a1,0x0
    1956:	7365b583          	ld	a1,1846(a1) # 2088 <__clone+0x11e>
    195a:	00000617          	auipc	a2,0x0
    195e:	73663603          	ld	a2,1846(a2) # 2090 <__clone+0x126>
    1962:	a019                	j	1968 <strlen+0x38>
    1964:	6794                	ld	a3,8(a5)
    1966:	07a1                	add	a5,a5,8
    1968:	00b68733          	add	a4,a3,a1
    196c:	fff6c693          	not	a3,a3
    1970:	8f75                	and	a4,a4,a3
    1972:	8f71                	and	a4,a4,a2
    1974:	db65                	beqz	a4,1964 <strlen+0x34>
    for (; *s; s++)
    1976:	0007c703          	lbu	a4,0(a5)
    197a:	d779                	beqz	a4,1948 <strlen+0x18>
    197c:	0017c703          	lbu	a4,1(a5)
    1980:	0785                	add	a5,a5,1
    1982:	d379                	beqz	a4,1948 <strlen+0x18>
    1984:	0017c703          	lbu	a4,1(a5)
    1988:	0785                	add	a5,a5,1
    198a:	fb6d                	bnez	a4,197c <strlen+0x4c>
    198c:	bf75                	j	1948 <strlen+0x18>

000000000000198e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    198e:	00757713          	and	a4,a0,7
{
    1992:	87aa                	mv	a5,a0
    1994:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1998:	cb19                	beqz	a4,19ae <memchr+0x20>
    199a:	ce25                	beqz	a2,1a12 <memchr+0x84>
    199c:	0007c703          	lbu	a4,0(a5)
    19a0:	00b70763          	beq	a4,a1,19ae <memchr+0x20>
    19a4:	0785                	add	a5,a5,1
    19a6:	0077f713          	and	a4,a5,7
    19aa:	167d                	add	a2,a2,-1
    19ac:	f77d                	bnez	a4,199a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19ae:	4501                	li	a0,0
    if (n && *s != c)
    19b0:	c235                	beqz	a2,1a14 <memchr+0x86>
    19b2:	0007c703          	lbu	a4,0(a5)
    19b6:	06b70063          	beq	a4,a1,1a16 <memchr+0x88>
        size_t k = ONES * c;
    19ba:	00000517          	auipc	a0,0x0
    19be:	6de53503          	ld	a0,1758(a0) # 2098 <__clone+0x12e>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c2:	471d                	li	a4,7
        size_t k = ONES * c;
    19c4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c8:	04c77763          	bgeu	a4,a2,1a16 <memchr+0x88>
    19cc:	00000897          	auipc	a7,0x0
    19d0:	6bc8b883          	ld	a7,1724(a7) # 2088 <__clone+0x11e>
    19d4:	00000817          	auipc	a6,0x0
    19d8:	6bc83803          	ld	a6,1724(a6) # 2090 <__clone+0x126>
    19dc:	431d                	li	t1,7
    19de:	a029                	j	19e8 <memchr+0x5a>
    19e0:	1661                	add	a2,a2,-8
    19e2:	07a1                	add	a5,a5,8
    19e4:	00c37c63          	bgeu	t1,a2,19fc <memchr+0x6e>
    19e8:	6398                	ld	a4,0(a5)
    19ea:	8f29                	xor	a4,a4,a0
    19ec:	011706b3          	add	a3,a4,a7
    19f0:	fff74713          	not	a4,a4
    19f4:	8f75                	and	a4,a4,a3
    19f6:	01077733          	and	a4,a4,a6
    19fa:	d37d                	beqz	a4,19e0 <memchr+0x52>
    19fc:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19fe:	e601                	bnez	a2,1a06 <memchr+0x78>
    1a00:	a809                	j	1a12 <memchr+0x84>
    1a02:	0505                	add	a0,a0,1
    1a04:	c619                	beqz	a2,1a12 <memchr+0x84>
    1a06:	00054783          	lbu	a5,0(a0)
    1a0a:	167d                	add	a2,a2,-1
    1a0c:	feb79be3          	bne	a5,a1,1a02 <memchr+0x74>
    1a10:	8082                	ret
    return n ? (void *)s : 0;
    1a12:	4501                	li	a0,0
}
    1a14:	8082                	ret
    if (n && *s != c)
    1a16:	853e                	mv	a0,a5
    1a18:	b7fd                	j	1a06 <memchr+0x78>

0000000000001a1a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a1a:	1101                	add	sp,sp,-32
    1a1c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a1e:	862e                	mv	a2,a1
{
    1a20:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a22:	4581                	li	a1,0
{
    1a24:	e426                	sd	s1,8(sp)
    1a26:	ec06                	sd	ra,24(sp)
    1a28:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a2a:	f65ff0ef          	jal	198e <memchr>
    return p ? p - s : n;
    1a2e:	c519                	beqz	a0,1a3c <strnlen+0x22>
}
    1a30:	60e2                	ld	ra,24(sp)
    1a32:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a34:	8d05                	sub	a0,a0,s1
}
    1a36:	64a2                	ld	s1,8(sp)
    1a38:	6105                	add	sp,sp,32
    1a3a:	8082                	ret
    1a3c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a3e:	8522                	mv	a0,s0
}
    1a40:	6442                	ld	s0,16(sp)
    1a42:	64a2                	ld	s1,8(sp)
    1a44:	6105                	add	sp,sp,32
    1a46:	8082                	ret

0000000000001a48 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a48:	00a5c7b3          	xor	a5,a1,a0
    1a4c:	8b9d                	and	a5,a5,7
    1a4e:	eb95                	bnez	a5,1a82 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a50:	0075f793          	and	a5,a1,7
    1a54:	e7b1                	bnez	a5,1aa0 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a56:	6198                	ld	a4,0(a1)
    1a58:	00000617          	auipc	a2,0x0
    1a5c:	63063603          	ld	a2,1584(a2) # 2088 <__clone+0x11e>
    1a60:	00000817          	auipc	a6,0x0
    1a64:	63083803          	ld	a6,1584(a6) # 2090 <__clone+0x126>
    1a68:	a029                	j	1a72 <strcpy+0x2a>
    1a6a:	05a1                	add	a1,a1,8
    1a6c:	e118                	sd	a4,0(a0)
    1a6e:	6198                	ld	a4,0(a1)
    1a70:	0521                	add	a0,a0,8
    1a72:	00c707b3          	add	a5,a4,a2
    1a76:	fff74693          	not	a3,a4
    1a7a:	8ff5                	and	a5,a5,a3
    1a7c:	0107f7b3          	and	a5,a5,a6
    1a80:	d7ed                	beqz	a5,1a6a <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a82:	0005c783          	lbu	a5,0(a1)
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	c785                	beqz	a5,1ab2 <strcpy+0x6a>
    1a8c:	0015c783          	lbu	a5,1(a1)
    1a90:	0505                	add	a0,a0,1
    1a92:	0585                	add	a1,a1,1
    1a94:	00f50023          	sb	a5,0(a0)
    1a98:	fbf5                	bnez	a5,1a8c <strcpy+0x44>
        ;
    return d;
}
    1a9a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a9c:	0505                	add	a0,a0,1
    1a9e:	df45                	beqz	a4,1a56 <strcpy+0xe>
            if (!(*d = *s))
    1aa0:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aa4:	0585                	add	a1,a1,1
    1aa6:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aaa:	00f50023          	sb	a5,0(a0)
    1aae:	f7fd                	bnez	a5,1a9c <strcpy+0x54>
}
    1ab0:	8082                	ret
    1ab2:	8082                	ret

0000000000001ab4 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ab4:	00a5c7b3          	xor	a5,a1,a0
    1ab8:	8b9d                	and	a5,a5,7
    1aba:	e3b5                	bnez	a5,1b1e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1abc:	0075f793          	and	a5,a1,7
    1ac0:	cf99                	beqz	a5,1ade <strncpy+0x2a>
    1ac2:	ea09                	bnez	a2,1ad4 <strncpy+0x20>
    1ac4:	a421                	j	1ccc <strncpy+0x218>
    1ac6:	0585                	add	a1,a1,1
    1ac8:	0075f793          	and	a5,a1,7
    1acc:	167d                	add	a2,a2,-1
    1ace:	0505                	add	a0,a0,1
    1ad0:	c799                	beqz	a5,1ade <strncpy+0x2a>
    1ad2:	c225                	beqz	a2,1b32 <strncpy+0x7e>
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	00f50023          	sb	a5,0(a0)
    1adc:	f7ed                	bnez	a5,1ac6 <strncpy+0x12>
            ;
        if (!n || !*s)
    1ade:	ca31                	beqz	a2,1b32 <strncpy+0x7e>
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	cba1                	beqz	a5,1b34 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae6:	479d                	li	a5,7
    1ae8:	02c7fc63          	bgeu	a5,a2,1b20 <strncpy+0x6c>
    1aec:	00000897          	auipc	a7,0x0
    1af0:	59c8b883          	ld	a7,1436(a7) # 2088 <__clone+0x11e>
    1af4:	00000817          	auipc	a6,0x0
    1af8:	59c83803          	ld	a6,1436(a6) # 2090 <__clone+0x126>
    1afc:	431d                	li	t1,7
    1afe:	a039                	j	1b0c <strncpy+0x58>
            *wd = *ws;
    1b00:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b02:	1661                	add	a2,a2,-8
    1b04:	05a1                	add	a1,a1,8
    1b06:	0521                	add	a0,a0,8
    1b08:	00c37b63          	bgeu	t1,a2,1b1e <strncpy+0x6a>
    1b0c:	6198                	ld	a4,0(a1)
    1b0e:	011707b3          	add	a5,a4,a7
    1b12:	fff74693          	not	a3,a4
    1b16:	8ff5                	and	a5,a5,a3
    1b18:	0107f7b3          	and	a5,a5,a6
    1b1c:	d3f5                	beqz	a5,1b00 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b1e:	ca11                	beqz	a2,1b32 <strncpy+0x7e>
    1b20:	0005c783          	lbu	a5,0(a1)
    1b24:	0585                	add	a1,a1,1
    1b26:	00f50023          	sb	a5,0(a0)
    1b2a:	c789                	beqz	a5,1b34 <strncpy+0x80>
    1b2c:	167d                	add	a2,a2,-1
    1b2e:	0505                	add	a0,a0,1
    1b30:	fa65                	bnez	a2,1b20 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b32:	8082                	ret
    1b34:	4805                	li	a6,1
    1b36:	14061b63          	bnez	a2,1c8c <strncpy+0x1d8>
    1b3a:	40a00733          	neg	a4,a0
    1b3e:	00777793          	and	a5,a4,7
    1b42:	4581                	li	a1,0
    1b44:	12061c63          	bnez	a2,1c7c <strncpy+0x1c8>
    1b48:	00778693          	add	a3,a5,7
    1b4c:	48ad                	li	a7,11
    1b4e:	1316e563          	bltu	a3,a7,1c78 <strncpy+0x1c4>
    1b52:	16d5e263          	bltu	a1,a3,1cb6 <strncpy+0x202>
    1b56:	14078c63          	beqz	a5,1cae <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b5a:	00050023          	sb	zero,0(a0)
    1b5e:	00677693          	and	a3,a4,6
    1b62:	14068263          	beqz	a3,1ca6 <strncpy+0x1f2>
    1b66:	000500a3          	sb	zero,1(a0)
    1b6a:	4689                	li	a3,2
    1b6c:	14f6f863          	bgeu	a3,a5,1cbc <strncpy+0x208>
    1b70:	00050123          	sb	zero,2(a0)
    1b74:	8b11                	and	a4,a4,4
    1b76:	12070463          	beqz	a4,1c9e <strncpy+0x1ea>
    1b7a:	000501a3          	sb	zero,3(a0)
    1b7e:	4711                	li	a4,4
    1b80:	00450693          	add	a3,a0,4
    1b84:	02f77563          	bgeu	a4,a5,1bae <strncpy+0xfa>
    1b88:	00050223          	sb	zero,4(a0)
    1b8c:	4715                	li	a4,5
    1b8e:	00550693          	add	a3,a0,5
    1b92:	00e78e63          	beq	a5,a4,1bae <strncpy+0xfa>
    1b96:	fff50713          	add	a4,a0,-1
    1b9a:	000502a3          	sb	zero,5(a0)
    1b9e:	8b1d                	and	a4,a4,7
    1ba0:	12071263          	bnez	a4,1cc4 <strncpy+0x210>
    1ba4:	00750693          	add	a3,a0,7
    1ba8:	00050323          	sb	zero,6(a0)
    1bac:	471d                	li	a4,7
    1bae:	40f80833          	sub	a6,a6,a5
    1bb2:	ff887593          	and	a1,a6,-8
    1bb6:	97aa                	add	a5,a5,a0
    1bb8:	95be                	add	a1,a1,a5
    1bba:	0007b023          	sd	zero,0(a5)
    1bbe:	07a1                	add	a5,a5,8
    1bc0:	feb79de3          	bne	a5,a1,1bba <strncpy+0x106>
    1bc4:	ff887593          	and	a1,a6,-8
    1bc8:	00787813          	and	a6,a6,7
    1bcc:	00e587bb          	addw	a5,a1,a4
    1bd0:	00b68733          	add	a4,a3,a1
    1bd4:	0e080063          	beqz	a6,1cb4 <strncpy+0x200>
    1bd8:	00070023          	sb	zero,0(a4)
    1bdc:	0017869b          	addw	a3,a5,1
    1be0:	f4c6f9e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1be4:	000700a3          	sb	zero,1(a4)
    1be8:	0027869b          	addw	a3,a5,2
    1bec:	f4c6f3e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1bf0:	00070123          	sb	zero,2(a4)
    1bf4:	0037869b          	addw	a3,a5,3
    1bf8:	f2c6fde3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1bfc:	000701a3          	sb	zero,3(a4)
    1c00:	0047869b          	addw	a3,a5,4
    1c04:	f2c6f7e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c08:	00070223          	sb	zero,4(a4)
    1c0c:	0057869b          	addw	a3,a5,5
    1c10:	f2c6f1e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c14:	000702a3          	sb	zero,5(a4)
    1c18:	0067869b          	addw	a3,a5,6
    1c1c:	f0c6fbe3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c20:	00070323          	sb	zero,6(a4)
    1c24:	0077869b          	addw	a3,a5,7
    1c28:	f0c6f5e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c2c:	000703a3          	sb	zero,7(a4)
    1c30:	0087869b          	addw	a3,a5,8
    1c34:	eec6ffe3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c38:	00070423          	sb	zero,8(a4)
    1c3c:	0097869b          	addw	a3,a5,9
    1c40:	eec6f9e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c44:	000704a3          	sb	zero,9(a4)
    1c48:	00a7869b          	addw	a3,a5,10
    1c4c:	eec6f3e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c50:	00070523          	sb	zero,10(a4)
    1c54:	00b7869b          	addw	a3,a5,11
    1c58:	ecc6fde3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c5c:	000705a3          	sb	zero,11(a4)
    1c60:	00c7869b          	addw	a3,a5,12
    1c64:	ecc6f7e3          	bgeu	a3,a2,1b32 <strncpy+0x7e>
    1c68:	00070623          	sb	zero,12(a4)
    1c6c:	27b5                	addw	a5,a5,13
    1c6e:	ecc7f2e3          	bgeu	a5,a2,1b32 <strncpy+0x7e>
    1c72:	000706a3          	sb	zero,13(a4)
}
    1c76:	8082                	ret
    1c78:	46ad                	li	a3,11
    1c7a:	bde1                	j	1b52 <strncpy+0x9e>
    1c7c:	00778693          	add	a3,a5,7
    1c80:	48ad                	li	a7,11
    1c82:	fff60593          	add	a1,a2,-1
    1c86:	ed16f6e3          	bgeu	a3,a7,1b52 <strncpy+0x9e>
    1c8a:	b7fd                	j	1c78 <strncpy+0x1c4>
    1c8c:	40a00733          	neg	a4,a0
    1c90:	8832                	mv	a6,a2
    1c92:	00777793          	and	a5,a4,7
    1c96:	4581                	li	a1,0
    1c98:	ea0608e3          	beqz	a2,1b48 <strncpy+0x94>
    1c9c:	b7c5                	j	1c7c <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c9e:	00350693          	add	a3,a0,3
    1ca2:	470d                	li	a4,3
    1ca4:	b729                	j	1bae <strncpy+0xfa>
    1ca6:	00150693          	add	a3,a0,1
    1caa:	4705                	li	a4,1
    1cac:	b709                	j	1bae <strncpy+0xfa>
tail:
    1cae:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb0:	4701                	li	a4,0
    1cb2:	bdf5                	j	1bae <strncpy+0xfa>
    1cb4:	8082                	ret
tail:
    1cb6:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb8:	4781                	li	a5,0
    1cba:	bf39                	j	1bd8 <strncpy+0x124>
    1cbc:	00250693          	add	a3,a0,2
    1cc0:	4709                	li	a4,2
    1cc2:	b5f5                	j	1bae <strncpy+0xfa>
    1cc4:	00650693          	add	a3,a0,6
    1cc8:	4719                	li	a4,6
    1cca:	b5d5                	j	1bae <strncpy+0xfa>
    1ccc:	8082                	ret

0000000000001cce <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cce:	87aa                	mv	a5,a0
    1cd0:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cd2:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cd6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cda:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cdc:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cde:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <openat>:
    register long a7 __asm__("a7") = n;
    1ce6:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cea:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cee:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <close>:
    register long a7 __asm__("a7") = n;
    1cf6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <read>:
    register long a7 __asm__("a7") = n;
    1d02:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d06:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d0a:	8082                	ret

0000000000001d0c <write>:
    register long a7 __asm__("a7") = n;
    1d0c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d10:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d14:	8082                	ret

0000000000001d16 <getpid>:
    register long a7 __asm__("a7") = n;
    1d16:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d1a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <getppid>:
    register long a7 __asm__("a7") = n;
    1d22:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d26:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d2e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d32:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <fork>:
    register long a7 __asm__("a7") = n;
    1d3a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d3e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d40:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d42:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d4a:	85b2                	mv	a1,a2
    1d4c:	863a                	mv	a2,a4
    if (stack)
    1d4e:	c191                	beqz	a1,1d52 <clone+0x8>
	stack += stack_size;
    1d50:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d52:	4781                	li	a5,0
    1d54:	4701                	li	a4,0
    1d56:	4681                	li	a3,0
    1d58:	2601                	sext.w	a2,a2
    1d5a:	ac01                	j	1f6a <__clone>

0000000000001d5c <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d5c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d60:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d64:	8082                	ret

0000000000001d66 <exit>:
    register long a7 __asm__("a7") = n;
    1d66:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d6a:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d6e:	8082                	ret

0000000000001d70 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d70:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d74:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d76:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <exec>:
    register long a7 __asm__("a7") = n;
    1d7e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d82:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <execve>:
    register long a7 __asm__("a7") = n;
    1d8a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <times>:
    register long a7 __asm__("a7") = n;
    1d96:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d9a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <get_time>:

int64 get_time()
{
    1da2:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1da4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1da8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1daa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1db0:	2501                	sext.w	a0,a0
    1db2:	ed09                	bnez	a0,1dcc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1db4:	67a2                	ld	a5,8(sp)
    1db6:	3e800713          	li	a4,1000
    1dba:	00015503          	lhu	a0,0(sp)
    1dbe:	02e7d7b3          	divu	a5,a5,a4
    1dc2:	02e50533          	mul	a0,a0,a4
    1dc6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dc8:	0141                	add	sp,sp,16
    1dca:	8082                	ret
        return -1;
    1dcc:	557d                	li	a0,-1
    1dce:	bfed                	j	1dc8 <get_time+0x26>

0000000000001dd0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dd0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <time>:
    register long a7 __asm__("a7") = n;
    1ddc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <sleep>:

int sleep(unsigned long long time)
{
    1de8:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dea:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dec:	850a                	mv	a0,sp
    1dee:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1df0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1df4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dfa:	e501                	bnez	a0,1e02 <sleep+0x1a>
    return 0;
    1dfc:	4501                	li	a0,0
}
    1dfe:	0141                	add	sp,sp,16
    1e00:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e02:	4502                	lw	a0,0(sp)
}
    1e04:	0141                	add	sp,sp,16
    1e06:	8082                	ret

0000000000001e08 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e08:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e14:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e18:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e1c:	8082                	ret

0000000000001e1e <mprotect>:
    register long a7 __asm__("a7") = n;
    1e1e:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <munmap>:
    register long a7 __asm__("a7") = n;
    1e2a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <wait>:

int wait(int *code)
{
    1e36:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e38:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e3c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e3e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e40:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e42:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <spawn>:
    register long a7 __asm__("a7") = n;
    1e4a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <mailread>:
    register long a7 __asm__("a7") = n;
    1e56:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e62:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <fstat>:
    register long a7 __asm__("a7") = n;
    1e6e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e7a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7c:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e80:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e8a:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e8c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e90:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e92:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e9a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e9c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ea0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <link>:

int link(char *old_path, char *new_path)
{
    1eaa:	87aa                	mv	a5,a0
    1eac:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eae:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1eb2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ebc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ebe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <unlink>:

int unlink(char *path)
{
    1ec6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ec8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ecc:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ed0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <uname>:
    register long a7 __asm__("a7") = n;
    1eda:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ede:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <brk>:
    register long a7 __asm__("a7") = n;
    1ee6:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eea:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ef2:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ef8:	8082                	ret

0000000000001efa <chdir>:
    register long a7 __asm__("a7") = n;
    1efa:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1efe:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f06:	862e                	mv	a2,a1
    1f08:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f0a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f10:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f14:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f16:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f18:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <getdents>:
    register long a7 __asm__("a7") = n;
    1f20:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <pipe>:
    register long a7 __asm__("a7") = n;
    1f2c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f30:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f32:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <dup>:
    register long a7 __asm__("a7") = n;
    1f3a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f3c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <dup2>:
    register long a7 __asm__("a7") = n;
    1f44:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f46:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f48:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <mount>:
    register long a7 __asm__("a7") = n;
    1f50:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f54:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <umount>:
    register long a7 __asm__("a7") = n;
    1f5c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f60:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f62:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f6a:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f6c:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f6e:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f70:	8532                	mv	a0,a2
	mv a2, a4
    1f72:	863a                	mv	a2,a4
	mv a3, a5
    1f74:	86be                	mv	a3,a5
	mv a4, a6
    1f76:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f78:	0dc00893          	li	a7,220
	ecall
    1f7c:	00000073          	ecall

	beqz a0, 1f
    1f80:	c111                	beqz	a0,1f84 <__clone+0x1a>
	# Parent
	ret
    1f82:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f84:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f86:	6522                	ld	a0,8(sp)
	jalr a1
    1f88:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f8a:	05d00893          	li	a7,93
	ecall
    1f8e:	00000073          	ecall
