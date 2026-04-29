
/home/hbh/oslab/oslab/user/build/riscv64/mkdir_:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f9                	j	10d0 <__start_main>

0000000000001004 <test_mkdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_mkdir(void){
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0250513          	add	a0,a0,-254 # 1f08 <__clone+0x2a>
void test_mkdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	316000ef          	jal	1328 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fb250513          	add	a0,a0,-78 # 1fc8 <__func__.0>
    101e:	30a000ef          	jal	1328 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	efe50513          	add	a0,a0,-258 # 1f20 <__clone+0x42>
    102a:	2fe000ef          	jal	1328 <puts>
    int rt, fd;

    rt = mkdir("test_mkdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	efe50513          	add	a0,a0,-258 # 1f30 <__clone+0x52>
    103a:	641000ef          	jal	1e7a <mkdir>
    printf("mkdir ret: %d\n", rt);
    103e:	85aa                	mv	a1,a0
    rt = mkdir("test_mkdir", 0666);
    1040:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", rt);
    1042:	00001517          	auipc	a0,0x1
    1046:	efe50513          	add	a0,a0,-258 # 1f40 <__clone+0x62>
    104a:	300000ef          	jal	134a <printf>
    assert(rt != -1);
    104e:	57fd                	li	a5,-1
    1050:	06f40163          	beq	s0,a5,10b2 <test_mkdir+0xae>
    fd = open("test_mkdir", O_RDONLY | O_DIRECTORY);
    1054:	002005b7          	lui	a1,0x200
    1058:	00001517          	auipc	a0,0x1
    105c:	ed850513          	add	a0,a0,-296 # 1f30 <__clone+0x52>
    1060:	3e3000ef          	jal	1c42 <open>
    1064:	842a                	mv	s0,a0
    if(fd > 0){
    1066:	02a05f63          	blez	a0,10a4 <test_mkdir+0xa0>
        printf("  mkdir success.\n");
    106a:	00001517          	auipc	a0,0x1
    106e:	f0650513          	add	a0,a0,-250 # 1f70 <__clone+0x92>
    1072:	2d8000ef          	jal	134a <printf>
        close(fd);
    1076:	8522                	mv	a0,s0
    1078:	3f3000ef          	jal	1c6a <close>
    }
    else printf("  mkdir error.\n");
    TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f1c50513          	add	a0,a0,-228 # 1f98 <__clone+0xba>
    1084:	2a4000ef          	jal	1328 <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	f4050513          	add	a0,a0,-192 # 1fc8 <__func__.0>
    1090:	298000ef          	jal	1328 <puts>
}
    1094:	6402                	ld	s0,0(sp)
    1096:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	e8850513          	add	a0,a0,-376 # 1f20 <__clone+0x42>
}
    10a0:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a2:	a459                	j	1328 <puts>
    else printf("  mkdir error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	ee450513          	add	a0,a0,-284 # 1f88 <__clone+0xaa>
    10ac:	29e000ef          	jal	134a <printf>
    10b0:	b7f1                	j	107c <test_mkdir+0x78>
    assert(rt != -1);
    10b2:	00001517          	auipc	a0,0x1
    10b6:	e9e50513          	add	a0,a0,-354 # 1f50 <__clone+0x72>
    10ba:	50a000ef          	jal	15c4 <panic>
    10be:	bf59                	j	1054 <test_mkdir+0x50>

00000000000010c0 <main>:

int main(void){
    10c0:	1141                	add	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    test_mkdir();
    10c4:	f41ff0ef          	jal	1004 <test_mkdir>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d2:	4108                	lw	a0,0(a0)
{
    10d4:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d6:	05a1                	add	a1,a1,8 # 200008 <digits+0x1fe030>
{
    10d8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10da:	fe7ff0ef          	jal	10c0 <main>
    10de:	3fd000ef          	jal	1cda <exit>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	add	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ea:	7179                	add	sp,sp,-48
    10ec:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ee:	12054863          	bltz	a0,121e <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f2:	02b577bb          	remuw	a5,a0,a1
    10f6:	00001697          	auipc	a3,0x1
    10fa:	ee268693          	add	a3,a3,-286 # 1fd8 <digits>
    buf[16] = 0;
    10fe:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1102:	0005871b          	sext.w	a4,a1
    1106:	1782                	sll	a5,a5,0x20
    1108:	9381                	srl	a5,a5,0x20
    110a:	97b6                	add	a5,a5,a3
    110c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1110:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1114:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1118:	1ab56663          	bltu	a0,a1,12c4 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    111c:	02e8763b          	remuw	a2,a6,a4
    1120:	1602                	sll	a2,a2,0x20
    1122:	9201                	srl	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1132:	12e86c63          	bltu	a6,a4,126a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1136:	02e5f63b          	remuw	a2,a1,a4
    113a:	1602                	sll	a2,a2,0x20
    113c:	9201                	srl	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1148:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    114c:	12e5e863          	bltu	a1,a4,127c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1150:	02e8763b          	remuw	a2,a6,a4
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1162:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1166:	12e86463          	bltu	a6,a4,128e <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    116a:	02e5f63b          	remuw	a2,a1,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1180:	12e5e063          	bltu	a1,a4,12a0 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1184:	02e8763b          	remuw	a2,a6,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1196:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    119a:	0ae86f63          	bltu	a6,a4,1258 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    119e:	02e5f63b          	remuw	a2,a1,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b4:	0ee5ef63          	bltu	a1,a4,12b2 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11b8:	02e8763b          	remuw	a2,a6,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ca:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ce:	0ee86d63          	bltu	a6,a4,12c8 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11d2:	02e5f63b          	remuw	a2,a1,a4
    11d6:	1602                	sll	a2,a2,0x20
    11d8:	9201                	srl	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e8:	0ee5e963          	bltu	a1,a4,12da <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11ec:	1782                	sll	a5,a5,0x20
    11ee:	9381                	srl	a5,a5,0x20
    11f0:	96be                	add	a3,a3,a5
    11f2:	0006c783          	lbu	a5,0(a3)
    11f6:	4599                	li	a1,6
    11f8:	00f10723          	sb	a5,14(sp)

    if (sign)
    11fc:	00055763          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1200:	02d00793          	li	a5,45
    1204:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1208:	4595                	li	a1,5
    write(f, s, l);
    120a:	003c                	add	a5,sp,8
    120c:	4641                	li	a2,16
    120e:	9e0d                	subw	a2,a2,a1
    1210:	4505                	li	a0,1
    1212:	95be                	add	a1,a1,a5
    1214:	26d000ef          	jal	1c80 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1218:	70a2                	ld	ra,40(sp)
    121a:	6145                	add	sp,sp,48
    121c:	8082                	ret
        x = -xx;
    121e:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1222:	02b677bb          	remuw	a5,a2,a1
    1226:	00001697          	auipc	a3,0x1
    122a:	db268693          	add	a3,a3,-590 # 1fd8 <digits>
    buf[16] = 0;
    122e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1232:	0005871b          	sext.w	a4,a1
    1236:	1782                	sll	a5,a5,0x20
    1238:	9381                	srl	a5,a5,0x20
    123a:	97b6                	add	a5,a5,a3
    123c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1240:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1244:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1248:	ecb67ae3          	bgeu	a2,a1,111c <printint.constprop.0+0x32>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1254:	45b9                	li	a1,14
    1256:	bf55                	j	120a <printint.constprop.0+0x120>
    1258:	45a9                	li	a1,10
    if (sign)
    125a:	fa0558e3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1266:	45a5                	li	a1,9
    1268:	b74d                	j	120a <printint.constprop.0+0x120>
    126a:	45b9                	li	a1,14
    if (sign)
    126c:	f8055fe3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1278:	45b5                	li	a1,13
    127a:	bf41                	j	120a <printint.constprop.0+0x120>
    127c:	45b5                	li	a1,13
    if (sign)
    127e:	f80556e3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    128a:	45b1                	li	a1,12
    128c:	bfbd                	j	120a <printint.constprop.0+0x120>
    128e:	45b1                	li	a1,12
    if (sign)
    1290:	f6055de3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    129c:	45ad                	li	a1,11
    129e:	b7b5                	j	120a <printint.constprop.0+0x120>
    12a0:	45ad                	li	a1,11
    if (sign)
    12a2:	f60554e3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12ae:	45a9                	li	a1,10
    12b0:	bfa9                	j	120a <printint.constprop.0+0x120>
    12b2:	45a5                	li	a1,9
    if (sign)
    12b4:	f4055be3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c0:	45a1                	li	a1,8
    12c2:	b7a1                	j	120a <printint.constprop.0+0x120>
    i = 15;
    12c4:	45bd                	li	a1,15
    12c6:	b791                	j	120a <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12c8:	45a1                	li	a1,8
    if (sign)
    12ca:	f40550e3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ce:	02d00793          	li	a5,45
    12d2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d6:	459d                	li	a1,7
    12d8:	bf0d                	j	120a <printint.constprop.0+0x120>
    12da:	459d                	li	a1,7
    if (sign)
    12dc:	f20557e3          	bgez	a0,120a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e0:	02d00793          	li	a5,45
    12e4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e8:	4599                	li	a1,6
    12ea:	b705                	j	120a <printint.constprop.0+0x120>

00000000000012ec <getchar>:
{
    12ec:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ee:	00f10593          	add	a1,sp,15
    12f2:	4605                	li	a2,1
    12f4:	4501                	li	a0,0
{
    12f6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12fc:	17b000ef          	jal	1c76 <read>
}
    1300:	60e2                	ld	ra,24(sp)
    1302:	00f14503          	lbu	a0,15(sp)
    1306:	6105                	add	sp,sp,32
    1308:	8082                	ret

000000000000130a <putchar>:
{
    130a:	1101                	add	sp,sp,-32
    130c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    130e:	00f10593          	add	a1,sp,15
    1312:	4605                	li	a2,1
    1314:	4505                	li	a0,1
{
    1316:	ec06                	sd	ra,24(sp)
    char byte = c;
    1318:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    131c:	165000ef          	jal	1c80 <write>
}
    1320:	60e2                	ld	ra,24(sp)
    1322:	2501                	sext.w	a0,a0
    1324:	6105                	add	sp,sp,32
    1326:	8082                	ret

0000000000001328 <puts>:
{
    1328:	1141                	add	sp,sp,-16
    132a:	e406                	sd	ra,8(sp)
    132c:	e022                	sd	s0,0(sp)
    132e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1330:	574000ef          	jal	18a4 <strlen>
    1334:	862a                	mv	a2,a0
    1336:	85a2                	mv	a1,s0
    1338:	4505                	li	a0,1
    133a:	147000ef          	jal	1c80 <write>
}
    133e:	60a2                	ld	ra,8(sp)
    1340:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1342:	957d                	sra	a0,a0,0x3f
    return r;
    1344:	2501                	sext.w	a0,a0
}
    1346:	0141                	add	sp,sp,16
    1348:	8082                	ret

000000000000134a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    134a:	7171                	add	sp,sp,-176
    134c:	f85a                	sd	s6,48(sp)
    134e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1350:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1352:	18bc                	add	a5,sp,120
{
    1354:	e8ca                	sd	s2,80(sp)
    1356:	e4ce                	sd	s3,72(sp)
    1358:	e0d2                	sd	s4,64(sp)
    135a:	fc56                	sd	s5,56(sp)
    135c:	f486                	sd	ra,104(sp)
    135e:	f0a2                	sd	s0,96(sp)
    1360:	eca6                	sd	s1,88(sp)
    1362:	fcae                	sd	a1,120(sp)
    1364:	e132                	sd	a2,128(sp)
    1366:	e536                	sd	a3,136(sp)
    1368:	e93a                	sd	a4,144(sp)
    136a:	f142                	sd	a6,160(sp)
    136c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    136e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1370:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1374:	07300a13          	li	s4,115
    1378:	07800a93          	li	s5,120
    buf[i++] = '0';
    137c:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1380:	00001997          	auipc	s3,0x1
    1384:	c5898993          	add	s3,s3,-936 # 1fd8 <digits>
        if (!*s)
    1388:	00054783          	lbu	a5,0(a0)
    138c:	16078a63          	beqz	a5,1500 <printf+0x1b6>
    1390:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1392:	19278d63          	beq	a5,s2,152c <printf+0x1e2>
    1396:	00164783          	lbu	a5,1(a2)
    139a:	0605                	add	a2,a2,1
    139c:	fbfd                	bnez	a5,1392 <printf+0x48>
    139e:	84b2                	mv	s1,a2
        l = z - a;
    13a0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a4:	85aa                	mv	a1,a0
    13a6:	8622                	mv	a2,s0
    13a8:	4505                	li	a0,1
    13aa:	0d7000ef          	jal	1c80 <write>
        if (l)
    13ae:	1a041463          	bnez	s0,1556 <printf+0x20c>
        if (s[1] == 0)
    13b2:	0014c783          	lbu	a5,1(s1)
    13b6:	14078563          	beqz	a5,1500 <printf+0x1b6>
        switch (s[1])
    13ba:	1b478063          	beq	a5,s4,155a <printf+0x210>
    13be:	14fa6b63          	bltu	s4,a5,1514 <printf+0x1ca>
    13c2:	06400713          	li	a4,100
    13c6:	1ee78063          	beq	a5,a4,15a6 <printf+0x25c>
    13ca:	07000713          	li	a4,112
    13ce:	1ae79963          	bne	a5,a4,1580 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13d2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d4:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13da:	631c                	ld	a5,0(a4)
    13dc:	0721                	add	a4,a4,8
    13de:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e0:	00479293          	sll	t0,a5,0x4
    13e4:	00879f93          	sll	t6,a5,0x8
    13e8:	00c79f13          	sll	t5,a5,0xc
    13ec:	01079e93          	sll	t4,a5,0x10
    13f0:	01479e13          	sll	t3,a5,0x14
    13f4:	01879313          	sll	t1,a5,0x18
    13f8:	01c79893          	sll	a7,a5,0x1c
    13fc:	02479813          	sll	a6,a5,0x24
    1400:	02879513          	sll	a0,a5,0x28
    1404:	02c79593          	sll	a1,a5,0x2c
    1408:	03079693          	sll	a3,a5,0x30
    140c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1410:	03c7d413          	srl	s0,a5,0x3c
    1414:	01c7d39b          	srlw	t2,a5,0x1c
    1418:	03c2d293          	srl	t0,t0,0x3c
    141c:	03cfdf93          	srl	t6,t6,0x3c
    1420:	03cf5f13          	srl	t5,t5,0x3c
    1424:	03cede93          	srl	t4,t4,0x3c
    1428:	03ce5e13          	srl	t3,t3,0x3c
    142c:	03c35313          	srl	t1,t1,0x3c
    1430:	03c8d893          	srl	a7,a7,0x3c
    1434:	03c85813          	srl	a6,a6,0x3c
    1438:	9171                	srl	a0,a0,0x3c
    143a:	91f1                	srl	a1,a1,0x3c
    143c:	92f1                	srl	a3,a3,0x3c
    143e:	9371                	srl	a4,a4,0x3c
    1440:	96ce                	add	a3,a3,s3
    1442:	974e                	add	a4,a4,s3
    1444:	944e                	add	s0,s0,s3
    1446:	92ce                	add	t0,t0,s3
    1448:	9fce                	add	t6,t6,s3
    144a:	9f4e                	add	t5,t5,s3
    144c:	9ece                	add	t4,t4,s3
    144e:	9e4e                	add	t3,t3,s3
    1450:	934e                	add	t1,t1,s3
    1452:	98ce                	add	a7,a7,s3
    1454:	93ce                	add	t2,t2,s3
    1456:	984e                	add	a6,a6,s3
    1458:	954e                	add	a0,a0,s3
    145a:	95ce                	add	a1,a1,s3
    145c:	0006c083          	lbu	ra,0(a3)
    1460:	0002c283          	lbu	t0,0(t0)
    1464:	00074683          	lbu	a3,0(a4)
    1468:	000fcf83          	lbu	t6,0(t6)
    146c:	000f4f03          	lbu	t5,0(t5)
    1470:	000ece83          	lbu	t4,0(t4)
    1474:	000e4e03          	lbu	t3,0(t3)
    1478:	00034303          	lbu	t1,0(t1)
    147c:	0008c883          	lbu	a7,0(a7)
    1480:	0003c383          	lbu	t2,0(t2)
    1484:	00084803          	lbu	a6,0(a6)
    1488:	00054503          	lbu	a0,0(a0)
    148c:	0005c583          	lbu	a1,0(a1)
    1490:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1494:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1498:	9371                	srl	a4,a4,0x3c
    149a:	8bbd                	and	a5,a5,15
    149c:	974e                	add	a4,a4,s3
    149e:	97ce                	add	a5,a5,s3
    14a0:	005105a3          	sb	t0,11(sp)
    14a4:	01f10623          	sb	t6,12(sp)
    14a8:	01e106a3          	sb	t5,13(sp)
    14ac:	01d10723          	sb	t4,14(sp)
    14b0:	01c107a3          	sb	t3,15(sp)
    14b4:	00610823          	sb	t1,16(sp)
    14b8:	011108a3          	sb	a7,17(sp)
    14bc:	00710923          	sb	t2,18(sp)
    14c0:	010109a3          	sb	a6,19(sp)
    14c4:	00a10a23          	sb	a0,20(sp)
    14c8:	00b10aa3          	sb	a1,21(sp)
    14cc:	00110b23          	sb	ra,22(sp)
    14d0:	00d10ba3          	sb	a3,23(sp)
    14d4:	00810523          	sb	s0,10(sp)
    14d8:	00074703          	lbu	a4,0(a4)
    14dc:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e0:	002c                	add	a1,sp,8
    14e2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e4:	00e10c23          	sb	a4,24(sp)
    14e8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ec:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14f0:	790000ef          	jal	1c80 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f4:	00248513          	add	a0,s1,2
        if (!*s)
    14f8:	00054783          	lbu	a5,0(a0)
    14fc:	e8079ae3          	bnez	a5,1390 <printf+0x46>
    }
    va_end(ap);
}
    1500:	70a6                	ld	ra,104(sp)
    1502:	7406                	ld	s0,96(sp)
    1504:	64e6                	ld	s1,88(sp)
    1506:	6946                	ld	s2,80(sp)
    1508:	69a6                	ld	s3,72(sp)
    150a:	6a06                	ld	s4,64(sp)
    150c:	7ae2                	ld	s5,56(sp)
    150e:	7b42                	ld	s6,48(sp)
    1510:	614d                	add	sp,sp,176
    1512:	8082                	ret
        switch (s[1])
    1514:	07579663          	bne	a5,s5,1580 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1518:	6782                	ld	a5,0(sp)
    151a:	45c1                	li	a1,16
    151c:	4388                	lw	a0,0(a5)
    151e:	07a1                	add	a5,a5,8
    1520:	e03e                	sd	a5,0(sp)
    1522:	bc9ff0ef          	jal	10ea <printint.constprop.0>
        s += 2;
    1526:	00248513          	add	a0,s1,2
    152a:	b7f9                	j	14f8 <printf+0x1ae>
    152c:	84b2                	mv	s1,a2
    152e:	a039                	j	153c <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1530:	0024c783          	lbu	a5,2(s1)
    1534:	0605                	add	a2,a2,1
    1536:	0489                	add	s1,s1,2
    1538:	e72794e3          	bne	a5,s2,13a0 <printf+0x56>
    153c:	0014c783          	lbu	a5,1(s1)
    1540:	ff2788e3          	beq	a5,s2,1530 <printf+0x1e6>
        l = z - a;
    1544:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1548:	85aa                	mv	a1,a0
    154a:	8622                	mv	a2,s0
    154c:	4505                	li	a0,1
    154e:	732000ef          	jal	1c80 <write>
        if (l)
    1552:	e60400e3          	beqz	s0,13b2 <printf+0x68>
    1556:	8526                	mv	a0,s1
    1558:	bd05                	j	1388 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    155a:	6782                	ld	a5,0(sp)
    155c:	6380                	ld	s0,0(a5)
    155e:	07a1                	add	a5,a5,8
    1560:	e03e                	sd	a5,0(sp)
    1562:	cc21                	beqz	s0,15ba <printf+0x270>
            l = strnlen(a, 200);
    1564:	0c800593          	li	a1,200
    1568:	8522                	mv	a0,s0
    156a:	424000ef          	jal	198e <strnlen>
    write(f, s, l);
    156e:	0005061b          	sext.w	a2,a0
    1572:	85a2                	mv	a1,s0
    1574:	4505                	li	a0,1
    1576:	70a000ef          	jal	1c80 <write>
        s += 2;
    157a:	00248513          	add	a0,s1,2
    157e:	bfad                	j	14f8 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1580:	4605                	li	a2,1
    1582:	002c                	add	a1,sp,8
    1584:	4505                	li	a0,1
    char byte = c;
    1586:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    158a:	6f6000ef          	jal	1c80 <write>
    char byte = c;
    158e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1592:	4605                	li	a2,1
    1594:	002c                	add	a1,sp,8
    1596:	4505                	li	a0,1
    char byte = c;
    1598:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159c:	6e4000ef          	jal	1c80 <write>
        s += 2;
    15a0:	00248513          	add	a0,s1,2
    15a4:	bf91                	j	14f8 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15a6:	6782                	ld	a5,0(sp)
    15a8:	45a9                	li	a1,10
    15aa:	4388                	lw	a0,0(a5)
    15ac:	07a1                	add	a5,a5,8
    15ae:	e03e                	sd	a5,0(sp)
    15b0:	b3bff0ef          	jal	10ea <printint.constprop.0>
        s += 2;
    15b4:	00248513          	add	a0,s1,2
    15b8:	b781                	j	14f8 <printf+0x1ae>
                a = "(null)";
    15ba:	00001417          	auipc	s0,0x1
    15be:	9ee40413          	add	s0,s0,-1554 # 1fa8 <__clone+0xca>
    15c2:	b74d                	j	1564 <printf+0x21a>

00000000000015c4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c4:	1141                	add	sp,sp,-16
    15c6:	e406                	sd	ra,8(sp)
    puts(m);
    15c8:	d61ff0ef          	jal	1328 <puts>
    exit(-100);
}
    15cc:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ce:	f9c00513          	li	a0,-100
}
    15d2:	0141                	add	sp,sp,16
    exit(-100);
    15d4:	a719                	j	1cda <exit>

00000000000015d6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d6:	02000793          	li	a5,32
    15da:	00f50663          	beq	a0,a5,15e6 <isspace+0x10>
    15de:	355d                	addw	a0,a0,-9
    15e0:	00553513          	sltiu	a0,a0,5
    15e4:	8082                	ret
    15e6:	4505                	li	a0,1
}
    15e8:	8082                	ret

00000000000015ea <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ea:	fd05051b          	addw	a0,a0,-48
}
    15ee:	00a53513          	sltiu	a0,a0,10
    15f2:	8082                	ret

00000000000015f4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f4:	02000693          	li	a3,32
    15f8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fa:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fe:	ff77871b          	addw	a4,a5,-9
    1602:	04d78c63          	beq	a5,a3,165a <atoi+0x66>
    1606:	0007861b          	sext.w	a2,a5
    160a:	04e5f863          	bgeu	a1,a4,165a <atoi+0x66>
        s++;
    switch (*s)
    160e:	02b00713          	li	a4,43
    1612:	04e78963          	beq	a5,a4,1664 <atoi+0x70>
    1616:	02d00713          	li	a4,45
    161a:	06e78263          	beq	a5,a4,167e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    161e:	fd06069b          	addw	a3,a2,-48
    1622:	47a5                	li	a5,9
    1624:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1626:	4301                	li	t1,0
    while (isdigit(*s))
    1628:	04d7e963          	bltu	a5,a3,167a <atoi+0x86>
    int n = 0, neg = 0;
    162c:	4501                	li	a0,0
    while (isdigit(*s))
    162e:	48a5                	li	a7,9
    1630:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1634:	0025179b          	sllw	a5,a0,0x2
    1638:	9fa9                	addw	a5,a5,a0
    163a:	fd06059b          	addw	a1,a2,-48
    163e:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1642:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1646:	0705                	add	a4,a4,1
    1648:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    164c:	0006861b          	sext.w	a2,a3
    1650:	ff08f0e3          	bgeu	a7,a6,1630 <atoi+0x3c>
    return neg ? n : -n;
    1654:	00030563          	beqz	t1,165e <atoi+0x6a>
}
    1658:	8082                	ret
        s++;
    165a:	0505                	add	a0,a0,1
    165c:	bf79                	j	15fa <atoi+0x6>
    return neg ? n : -n;
    165e:	40f5853b          	subw	a0,a1,a5
    1662:	8082                	ret
    while (isdigit(*s))
    1664:	00154603          	lbu	a2,1(a0)
    1668:	47a5                	li	a5,9
        s++;
    166a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    166e:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1672:	4301                	li	t1,0
    while (isdigit(*s))
    1674:	2601                	sext.w	a2,a2
    1676:	fad7fbe3          	bgeu	a5,a3,162c <atoi+0x38>
    167a:	4501                	li	a0,0
}
    167c:	8082                	ret
    while (isdigit(*s))
    167e:	00154603          	lbu	a2,1(a0)
    1682:	47a5                	li	a5,9
        s++;
    1684:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1688:	fd06069b          	addw	a3,a2,-48
    168c:	2601                	sext.w	a2,a2
    168e:	fed7e6e3          	bltu	a5,a3,167a <atoi+0x86>
        neg = 1;
    1692:	4305                	li	t1,1
    1694:	bf61                	j	162c <atoi+0x38>

0000000000001696 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1696:	18060163          	beqz	a2,1818 <memset+0x182>
    169a:	40a006b3          	neg	a3,a0
    169e:	0076f793          	and	a5,a3,7
    16a2:	00778813          	add	a6,a5,7
    16a6:	48ad                	li	a7,11
    16a8:	0ff5f713          	zext.b	a4,a1
    16ac:	fff60593          	add	a1,a2,-1
    16b0:	17186563          	bltu	a6,a7,181a <memset+0x184>
    16b4:	1705ed63          	bltu	a1,a6,182e <memset+0x198>
    16b8:	16078363          	beqz	a5,181e <memset+0x188>
    16bc:	00e50023          	sb	a4,0(a0)
    16c0:	0066f593          	and	a1,a3,6
    16c4:	16058063          	beqz	a1,1824 <memset+0x18e>
    16c8:	00e500a3          	sb	a4,1(a0)
    16cc:	4589                	li	a1,2
    16ce:	16f5f363          	bgeu	a1,a5,1834 <memset+0x19e>
    16d2:	00e50123          	sb	a4,2(a0)
    16d6:	8a91                	and	a3,a3,4
    16d8:	00350593          	add	a1,a0,3
    16dc:	4e0d                	li	t3,3
    16de:	ce9d                	beqz	a3,171c <memset+0x86>
    16e0:	00e501a3          	sb	a4,3(a0)
    16e4:	4691                	li	a3,4
    16e6:	00450593          	add	a1,a0,4
    16ea:	4e11                	li	t3,4
    16ec:	02f6f863          	bgeu	a3,a5,171c <memset+0x86>
    16f0:	00e50223          	sb	a4,4(a0)
    16f4:	4695                	li	a3,5
    16f6:	00550593          	add	a1,a0,5
    16fa:	4e15                	li	t3,5
    16fc:	02d78063          	beq	a5,a3,171c <memset+0x86>
    1700:	fff50693          	add	a3,a0,-1
    1704:	00e502a3          	sb	a4,5(a0)
    1708:	8a9d                	and	a3,a3,7
    170a:	00650593          	add	a1,a0,6
    170e:	4e19                	li	t3,6
    1710:	e691                	bnez	a3,171c <memset+0x86>
    1712:	00750593          	add	a1,a0,7
    1716:	00e50323          	sb	a4,6(a0)
    171a:	4e1d                	li	t3,7
    171c:	00871693          	sll	a3,a4,0x8
    1720:	01071813          	sll	a6,a4,0x10
    1724:	8ed9                	or	a3,a3,a4
    1726:	01871893          	sll	a7,a4,0x18
    172a:	0106e6b3          	or	a3,a3,a6
    172e:	0116e6b3          	or	a3,a3,a7
    1732:	02071813          	sll	a6,a4,0x20
    1736:	02871313          	sll	t1,a4,0x28
    173a:	0106e6b3          	or	a3,a3,a6
    173e:	40f608b3          	sub	a7,a2,a5
    1742:	03071813          	sll	a6,a4,0x30
    1746:	0066e6b3          	or	a3,a3,t1
    174a:	0106e6b3          	or	a3,a3,a6
    174e:	03871313          	sll	t1,a4,0x38
    1752:	97aa                	add	a5,a5,a0
    1754:	ff88f813          	and	a6,a7,-8
    1758:	0066e6b3          	or	a3,a3,t1
    175c:	983e                	add	a6,a6,a5
    175e:	e394                	sd	a3,0(a5)
    1760:	07a1                	add	a5,a5,8
    1762:	ff079ee3          	bne	a5,a6,175e <memset+0xc8>
    1766:	ff88f793          	and	a5,a7,-8
    176a:	0078f893          	and	a7,a7,7
    176e:	00f586b3          	add	a3,a1,a5
    1772:	01c787bb          	addw	a5,a5,t3
    1776:	0a088b63          	beqz	a7,182c <memset+0x196>
    177a:	00e68023          	sb	a4,0(a3)
    177e:	0017859b          	addw	a1,a5,1
    1782:	08c5fb63          	bgeu	a1,a2,1818 <memset+0x182>
    1786:	00e680a3          	sb	a4,1(a3)
    178a:	0027859b          	addw	a1,a5,2
    178e:	08c5f563          	bgeu	a1,a2,1818 <memset+0x182>
    1792:	00e68123          	sb	a4,2(a3)
    1796:	0037859b          	addw	a1,a5,3
    179a:	06c5ff63          	bgeu	a1,a2,1818 <memset+0x182>
    179e:	00e681a3          	sb	a4,3(a3)
    17a2:	0047859b          	addw	a1,a5,4
    17a6:	06c5f963          	bgeu	a1,a2,1818 <memset+0x182>
    17aa:	00e68223          	sb	a4,4(a3)
    17ae:	0057859b          	addw	a1,a5,5
    17b2:	06c5f363          	bgeu	a1,a2,1818 <memset+0x182>
    17b6:	00e682a3          	sb	a4,5(a3)
    17ba:	0067859b          	addw	a1,a5,6
    17be:	04c5fd63          	bgeu	a1,a2,1818 <memset+0x182>
    17c2:	00e68323          	sb	a4,6(a3)
    17c6:	0077859b          	addw	a1,a5,7
    17ca:	04c5f763          	bgeu	a1,a2,1818 <memset+0x182>
    17ce:	00e683a3          	sb	a4,7(a3)
    17d2:	0087859b          	addw	a1,a5,8
    17d6:	04c5f163          	bgeu	a1,a2,1818 <memset+0x182>
    17da:	00e68423          	sb	a4,8(a3)
    17de:	0097859b          	addw	a1,a5,9
    17e2:	02c5fb63          	bgeu	a1,a2,1818 <memset+0x182>
    17e6:	00e684a3          	sb	a4,9(a3)
    17ea:	00a7859b          	addw	a1,a5,10
    17ee:	02c5f563          	bgeu	a1,a2,1818 <memset+0x182>
    17f2:	00e68523          	sb	a4,10(a3)
    17f6:	00b7859b          	addw	a1,a5,11
    17fa:	00c5ff63          	bgeu	a1,a2,1818 <memset+0x182>
    17fe:	00e685a3          	sb	a4,11(a3)
    1802:	00c7859b          	addw	a1,a5,12
    1806:	00c5f963          	bgeu	a1,a2,1818 <memset+0x182>
    180a:	00e68623          	sb	a4,12(a3)
    180e:	27b5                	addw	a5,a5,13
    1810:	00c7f463          	bgeu	a5,a2,1818 <memset+0x182>
    1814:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1818:	8082                	ret
    181a:	482d                	li	a6,11
    181c:	bd61                	j	16b4 <memset+0x1e>
    char *p = dest;
    181e:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1820:	4e01                	li	t3,0
    1822:	bded                	j	171c <memset+0x86>
    1824:	00150593          	add	a1,a0,1
    1828:	4e05                	li	t3,1
    182a:	bdcd                	j	171c <memset+0x86>
    182c:	8082                	ret
    char *p = dest;
    182e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1830:	4781                	li	a5,0
    1832:	b7a1                	j	177a <memset+0xe4>
    1834:	00250593          	add	a1,a0,2
    1838:	4e09                	li	t3,2
    183a:	b5cd                	j	171c <memset+0x86>

000000000000183c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    183c:	00054783          	lbu	a5,0(a0)
    1840:	0005c703          	lbu	a4,0(a1)
    1844:	00e79863          	bne	a5,a4,1854 <strcmp+0x18>
    1848:	0505                	add	a0,a0,1
    184a:	0585                	add	a1,a1,1
    184c:	fbe5                	bnez	a5,183c <strcmp>
    184e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1850:	9d19                	subw	a0,a0,a4
    1852:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1854:	0007851b          	sext.w	a0,a5
    1858:	bfe5                	j	1850 <strcmp+0x14>

000000000000185a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    185a:	ca15                	beqz	a2,188e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1860:	167d                	add	a2,a2,-1
    1862:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1866:	eb99                	bnez	a5,187c <strncmp+0x22>
    1868:	a815                	j	189c <strncmp+0x42>
    186a:	00a68e63          	beq	a3,a0,1886 <strncmp+0x2c>
    186e:	0505                	add	a0,a0,1
    1870:	00f71b63          	bne	a4,a5,1886 <strncmp+0x2c>
    1874:	00054783          	lbu	a5,0(a0)
    1878:	cf89                	beqz	a5,1892 <strncmp+0x38>
    187a:	85b2                	mv	a1,a2
    187c:	0005c703          	lbu	a4,0(a1)
    1880:	00158613          	add	a2,a1,1
    1884:	f37d                	bnez	a4,186a <strncmp+0x10>
        ;
    return *l - *r;
    1886:	0007851b          	sext.w	a0,a5
    188a:	9d19                	subw	a0,a0,a4
    188c:	8082                	ret
        return 0;
    188e:	4501                	li	a0,0
}
    1890:	8082                	ret
    return *l - *r;
    1892:	0015c703          	lbu	a4,1(a1)
    1896:	4501                	li	a0,0
    1898:	9d19                	subw	a0,a0,a4
    189a:	8082                	ret
    189c:	0005c703          	lbu	a4,0(a1)
    18a0:	4501                	li	a0,0
    18a2:	b7e5                	j	188a <strncmp+0x30>

00000000000018a4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a4:	00757793          	and	a5,a0,7
    18a8:	cf89                	beqz	a5,18c2 <strlen+0x1e>
    18aa:	87aa                	mv	a5,a0
    18ac:	a029                	j	18b6 <strlen+0x12>
    18ae:	0785                	add	a5,a5,1
    18b0:	0077f713          	and	a4,a5,7
    18b4:	cb01                	beqz	a4,18c4 <strlen+0x20>
        if (!*s)
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	fb75                	bnez	a4,18ae <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18bc:	40a78533          	sub	a0,a5,a0
}
    18c0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c4:	6394                	ld	a3,0(a5)
    18c6:	00000597          	auipc	a1,0x0
    18ca:	6ea5b583          	ld	a1,1770(a1) # 1fb0 <__clone+0xd2>
    18ce:	00000617          	auipc	a2,0x0
    18d2:	6ea63603          	ld	a2,1770(a2) # 1fb8 <__clone+0xda>
    18d6:	a019                	j	18dc <strlen+0x38>
    18d8:	6794                	ld	a3,8(a5)
    18da:	07a1                	add	a5,a5,8
    18dc:	00b68733          	add	a4,a3,a1
    18e0:	fff6c693          	not	a3,a3
    18e4:	8f75                	and	a4,a4,a3
    18e6:	8f71                	and	a4,a4,a2
    18e8:	db65                	beqz	a4,18d8 <strlen+0x34>
    for (; *s; s++)
    18ea:	0007c703          	lbu	a4,0(a5)
    18ee:	d779                	beqz	a4,18bc <strlen+0x18>
    18f0:	0017c703          	lbu	a4,1(a5)
    18f4:	0785                	add	a5,a5,1
    18f6:	d379                	beqz	a4,18bc <strlen+0x18>
    18f8:	0017c703          	lbu	a4,1(a5)
    18fc:	0785                	add	a5,a5,1
    18fe:	fb6d                	bnez	a4,18f0 <strlen+0x4c>
    1900:	bf75                	j	18bc <strlen+0x18>

0000000000001902 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1902:	00757713          	and	a4,a0,7
{
    1906:	87aa                	mv	a5,a0
    1908:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190c:	cb19                	beqz	a4,1922 <memchr+0x20>
    190e:	ce25                	beqz	a2,1986 <memchr+0x84>
    1910:	0007c703          	lbu	a4,0(a5)
    1914:	00b70763          	beq	a4,a1,1922 <memchr+0x20>
    1918:	0785                	add	a5,a5,1
    191a:	0077f713          	and	a4,a5,7
    191e:	167d                	add	a2,a2,-1
    1920:	f77d                	bnez	a4,190e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1922:	4501                	li	a0,0
    if (n && *s != c)
    1924:	c235                	beqz	a2,1988 <memchr+0x86>
    1926:	0007c703          	lbu	a4,0(a5)
    192a:	06b70063          	beq	a4,a1,198a <memchr+0x88>
        size_t k = ONES * c;
    192e:	00000517          	auipc	a0,0x0
    1932:	69253503          	ld	a0,1682(a0) # 1fc0 <__clone+0xe2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1936:	471d                	li	a4,7
        size_t k = ONES * c;
    1938:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193c:	04c77763          	bgeu	a4,a2,198a <memchr+0x88>
    1940:	00000897          	auipc	a7,0x0
    1944:	6708b883          	ld	a7,1648(a7) # 1fb0 <__clone+0xd2>
    1948:	00000817          	auipc	a6,0x0
    194c:	67083803          	ld	a6,1648(a6) # 1fb8 <__clone+0xda>
    1950:	431d                	li	t1,7
    1952:	a029                	j	195c <memchr+0x5a>
    1954:	1661                	add	a2,a2,-8
    1956:	07a1                	add	a5,a5,8
    1958:	00c37c63          	bgeu	t1,a2,1970 <memchr+0x6e>
    195c:	6398                	ld	a4,0(a5)
    195e:	8f29                	xor	a4,a4,a0
    1960:	011706b3          	add	a3,a4,a7
    1964:	fff74713          	not	a4,a4
    1968:	8f75                	and	a4,a4,a3
    196a:	01077733          	and	a4,a4,a6
    196e:	d37d                	beqz	a4,1954 <memchr+0x52>
    1970:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1972:	e601                	bnez	a2,197a <memchr+0x78>
    1974:	a809                	j	1986 <memchr+0x84>
    1976:	0505                	add	a0,a0,1
    1978:	c619                	beqz	a2,1986 <memchr+0x84>
    197a:	00054783          	lbu	a5,0(a0)
    197e:	167d                	add	a2,a2,-1
    1980:	feb79be3          	bne	a5,a1,1976 <memchr+0x74>
    1984:	8082                	ret
    return n ? (void *)s : 0;
    1986:	4501                	li	a0,0
}
    1988:	8082                	ret
    if (n && *s != c)
    198a:	853e                	mv	a0,a5
    198c:	b7fd                	j	197a <memchr+0x78>

000000000000198e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198e:	1101                	add	sp,sp,-32
    1990:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1992:	862e                	mv	a2,a1
{
    1994:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1996:	4581                	li	a1,0
{
    1998:	e426                	sd	s1,8(sp)
    199a:	ec06                	sd	ra,24(sp)
    199c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199e:	f65ff0ef          	jal	1902 <memchr>
    return p ? p - s : n;
    19a2:	c519                	beqz	a0,19b0 <strnlen+0x22>
}
    19a4:	60e2                	ld	ra,24(sp)
    19a6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a8:	8d05                	sub	a0,a0,s1
}
    19aa:	64a2                	ld	s1,8(sp)
    19ac:	6105                	add	sp,sp,32
    19ae:	8082                	ret
    19b0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b2:	8522                	mv	a0,s0
}
    19b4:	6442                	ld	s0,16(sp)
    19b6:	64a2                	ld	s1,8(sp)
    19b8:	6105                	add	sp,sp,32
    19ba:	8082                	ret

00000000000019bc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19bc:	00a5c7b3          	xor	a5,a1,a0
    19c0:	8b9d                	and	a5,a5,7
    19c2:	eb95                	bnez	a5,19f6 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c4:	0075f793          	and	a5,a1,7
    19c8:	e7b1                	bnez	a5,1a14 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ca:	6198                	ld	a4,0(a1)
    19cc:	00000617          	auipc	a2,0x0
    19d0:	5e463603          	ld	a2,1508(a2) # 1fb0 <__clone+0xd2>
    19d4:	00000817          	auipc	a6,0x0
    19d8:	5e483803          	ld	a6,1508(a6) # 1fb8 <__clone+0xda>
    19dc:	a029                	j	19e6 <strcpy+0x2a>
    19de:	05a1                	add	a1,a1,8
    19e0:	e118                	sd	a4,0(a0)
    19e2:	6198                	ld	a4,0(a1)
    19e4:	0521                	add	a0,a0,8
    19e6:	00c707b3          	add	a5,a4,a2
    19ea:	fff74693          	not	a3,a4
    19ee:	8ff5                	and	a5,a5,a3
    19f0:	0107f7b3          	and	a5,a5,a6
    19f4:	d7ed                	beqz	a5,19de <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f6:	0005c783          	lbu	a5,0(a1)
    19fa:	00f50023          	sb	a5,0(a0)
    19fe:	c785                	beqz	a5,1a26 <strcpy+0x6a>
    1a00:	0015c783          	lbu	a5,1(a1)
    1a04:	0505                	add	a0,a0,1
    1a06:	0585                	add	a1,a1,1
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	fbf5                	bnez	a5,1a00 <strcpy+0x44>
        ;
    return d;
}
    1a0e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a10:	0505                	add	a0,a0,1
    1a12:	df45                	beqz	a4,19ca <strcpy+0xe>
            if (!(*d = *s))
    1a14:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a18:	0585                	add	a1,a1,1
    1a1a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a1e:	00f50023          	sb	a5,0(a0)
    1a22:	f7fd                	bnez	a5,1a10 <strcpy+0x54>
}
    1a24:	8082                	ret
    1a26:	8082                	ret

0000000000001a28 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a28:	00a5c7b3          	xor	a5,a1,a0
    1a2c:	8b9d                	and	a5,a5,7
    1a2e:	e3b5                	bnez	a5,1a92 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a30:	0075f793          	and	a5,a1,7
    1a34:	cf99                	beqz	a5,1a52 <strncpy+0x2a>
    1a36:	ea09                	bnez	a2,1a48 <strncpy+0x20>
    1a38:	a421                	j	1c40 <strncpy+0x218>
    1a3a:	0585                	add	a1,a1,1
    1a3c:	0075f793          	and	a5,a1,7
    1a40:	167d                	add	a2,a2,-1
    1a42:	0505                	add	a0,a0,1
    1a44:	c799                	beqz	a5,1a52 <strncpy+0x2a>
    1a46:	c225                	beqz	a2,1aa6 <strncpy+0x7e>
    1a48:	0005c783          	lbu	a5,0(a1)
    1a4c:	00f50023          	sb	a5,0(a0)
    1a50:	f7ed                	bnez	a5,1a3a <strncpy+0x12>
            ;
        if (!n || !*s)
    1a52:	ca31                	beqz	a2,1aa6 <strncpy+0x7e>
    1a54:	0005c783          	lbu	a5,0(a1)
    1a58:	cba1                	beqz	a5,1aa8 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a5a:	479d                	li	a5,7
    1a5c:	02c7fc63          	bgeu	a5,a2,1a94 <strncpy+0x6c>
    1a60:	00000897          	auipc	a7,0x0
    1a64:	5508b883          	ld	a7,1360(a7) # 1fb0 <__clone+0xd2>
    1a68:	00000817          	auipc	a6,0x0
    1a6c:	55083803          	ld	a6,1360(a6) # 1fb8 <__clone+0xda>
    1a70:	431d                	li	t1,7
    1a72:	a039                	j	1a80 <strncpy+0x58>
            *wd = *ws;
    1a74:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a76:	1661                	add	a2,a2,-8
    1a78:	05a1                	add	a1,a1,8
    1a7a:	0521                	add	a0,a0,8
    1a7c:	00c37b63          	bgeu	t1,a2,1a92 <strncpy+0x6a>
    1a80:	6198                	ld	a4,0(a1)
    1a82:	011707b3          	add	a5,a4,a7
    1a86:	fff74693          	not	a3,a4
    1a8a:	8ff5                	and	a5,a5,a3
    1a8c:	0107f7b3          	and	a5,a5,a6
    1a90:	d3f5                	beqz	a5,1a74 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a92:	ca11                	beqz	a2,1aa6 <strncpy+0x7e>
    1a94:	0005c783          	lbu	a5,0(a1)
    1a98:	0585                	add	a1,a1,1
    1a9a:	00f50023          	sb	a5,0(a0)
    1a9e:	c789                	beqz	a5,1aa8 <strncpy+0x80>
    1aa0:	167d                	add	a2,a2,-1
    1aa2:	0505                	add	a0,a0,1
    1aa4:	fa65                	bnez	a2,1a94 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aa6:	8082                	ret
    1aa8:	4805                	li	a6,1
    1aaa:	14061b63          	bnez	a2,1c00 <strncpy+0x1d8>
    1aae:	40a00733          	neg	a4,a0
    1ab2:	00777793          	and	a5,a4,7
    1ab6:	4581                	li	a1,0
    1ab8:	12061c63          	bnez	a2,1bf0 <strncpy+0x1c8>
    1abc:	00778693          	add	a3,a5,7
    1ac0:	48ad                	li	a7,11
    1ac2:	1316e563          	bltu	a3,a7,1bec <strncpy+0x1c4>
    1ac6:	16d5e263          	bltu	a1,a3,1c2a <strncpy+0x202>
    1aca:	14078c63          	beqz	a5,1c22 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ace:	00050023          	sb	zero,0(a0)
    1ad2:	00677693          	and	a3,a4,6
    1ad6:	14068263          	beqz	a3,1c1a <strncpy+0x1f2>
    1ada:	000500a3          	sb	zero,1(a0)
    1ade:	4689                	li	a3,2
    1ae0:	14f6f863          	bgeu	a3,a5,1c30 <strncpy+0x208>
    1ae4:	00050123          	sb	zero,2(a0)
    1ae8:	8b11                	and	a4,a4,4
    1aea:	12070463          	beqz	a4,1c12 <strncpy+0x1ea>
    1aee:	000501a3          	sb	zero,3(a0)
    1af2:	4711                	li	a4,4
    1af4:	00450693          	add	a3,a0,4
    1af8:	02f77563          	bgeu	a4,a5,1b22 <strncpy+0xfa>
    1afc:	00050223          	sb	zero,4(a0)
    1b00:	4715                	li	a4,5
    1b02:	00550693          	add	a3,a0,5
    1b06:	00e78e63          	beq	a5,a4,1b22 <strncpy+0xfa>
    1b0a:	fff50713          	add	a4,a0,-1
    1b0e:	000502a3          	sb	zero,5(a0)
    1b12:	8b1d                	and	a4,a4,7
    1b14:	12071263          	bnez	a4,1c38 <strncpy+0x210>
    1b18:	00750693          	add	a3,a0,7
    1b1c:	00050323          	sb	zero,6(a0)
    1b20:	471d                	li	a4,7
    1b22:	40f80833          	sub	a6,a6,a5
    1b26:	ff887593          	and	a1,a6,-8
    1b2a:	97aa                	add	a5,a5,a0
    1b2c:	95be                	add	a1,a1,a5
    1b2e:	0007b023          	sd	zero,0(a5)
    1b32:	07a1                	add	a5,a5,8
    1b34:	feb79de3          	bne	a5,a1,1b2e <strncpy+0x106>
    1b38:	ff887593          	and	a1,a6,-8
    1b3c:	00787813          	and	a6,a6,7
    1b40:	00e587bb          	addw	a5,a1,a4
    1b44:	00b68733          	add	a4,a3,a1
    1b48:	0e080063          	beqz	a6,1c28 <strncpy+0x200>
    1b4c:	00070023          	sb	zero,0(a4)
    1b50:	0017869b          	addw	a3,a5,1
    1b54:	f4c6f9e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b58:	000700a3          	sb	zero,1(a4)
    1b5c:	0027869b          	addw	a3,a5,2
    1b60:	f4c6f3e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b64:	00070123          	sb	zero,2(a4)
    1b68:	0037869b          	addw	a3,a5,3
    1b6c:	f2c6fde3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b70:	000701a3          	sb	zero,3(a4)
    1b74:	0047869b          	addw	a3,a5,4
    1b78:	f2c6f7e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b7c:	00070223          	sb	zero,4(a4)
    1b80:	0057869b          	addw	a3,a5,5
    1b84:	f2c6f1e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b88:	000702a3          	sb	zero,5(a4)
    1b8c:	0067869b          	addw	a3,a5,6
    1b90:	f0c6fbe3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1b94:	00070323          	sb	zero,6(a4)
    1b98:	0077869b          	addw	a3,a5,7
    1b9c:	f0c6f5e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1ba0:	000703a3          	sb	zero,7(a4)
    1ba4:	0087869b          	addw	a3,a5,8
    1ba8:	eec6ffe3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1bac:	00070423          	sb	zero,8(a4)
    1bb0:	0097869b          	addw	a3,a5,9
    1bb4:	eec6f9e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1bb8:	000704a3          	sb	zero,9(a4)
    1bbc:	00a7869b          	addw	a3,a5,10
    1bc0:	eec6f3e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1bc4:	00070523          	sb	zero,10(a4)
    1bc8:	00b7869b          	addw	a3,a5,11
    1bcc:	ecc6fde3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1bd0:	000705a3          	sb	zero,11(a4)
    1bd4:	00c7869b          	addw	a3,a5,12
    1bd8:	ecc6f7e3          	bgeu	a3,a2,1aa6 <strncpy+0x7e>
    1bdc:	00070623          	sb	zero,12(a4)
    1be0:	27b5                	addw	a5,a5,13
    1be2:	ecc7f2e3          	bgeu	a5,a2,1aa6 <strncpy+0x7e>
    1be6:	000706a3          	sb	zero,13(a4)
}
    1bea:	8082                	ret
    1bec:	46ad                	li	a3,11
    1bee:	bde1                	j	1ac6 <strncpy+0x9e>
    1bf0:	00778693          	add	a3,a5,7
    1bf4:	48ad                	li	a7,11
    1bf6:	fff60593          	add	a1,a2,-1
    1bfa:	ed16f6e3          	bgeu	a3,a7,1ac6 <strncpy+0x9e>
    1bfe:	b7fd                	j	1bec <strncpy+0x1c4>
    1c00:	40a00733          	neg	a4,a0
    1c04:	8832                	mv	a6,a2
    1c06:	00777793          	and	a5,a4,7
    1c0a:	4581                	li	a1,0
    1c0c:	ea0608e3          	beqz	a2,1abc <strncpy+0x94>
    1c10:	b7c5                	j	1bf0 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c12:	00350693          	add	a3,a0,3
    1c16:	470d                	li	a4,3
    1c18:	b729                	j	1b22 <strncpy+0xfa>
    1c1a:	00150693          	add	a3,a0,1
    1c1e:	4705                	li	a4,1
    1c20:	b709                	j	1b22 <strncpy+0xfa>
tail:
    1c22:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	4701                	li	a4,0
    1c26:	bdf5                	j	1b22 <strncpy+0xfa>
    1c28:	8082                	ret
tail:
    1c2a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2c:	4781                	li	a5,0
    1c2e:	bf39                	j	1b4c <strncpy+0x124>
    1c30:	00250693          	add	a3,a0,2
    1c34:	4709                	li	a4,2
    1c36:	b5f5                	j	1b22 <strncpy+0xfa>
    1c38:	00650693          	add	a3,a0,6
    1c3c:	4719                	li	a4,6
    1c3e:	b5d5                	j	1b22 <strncpy+0xfa>
    1c40:	8082                	ret

0000000000001c42 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c42:	87aa                	mv	a5,a0
    1c44:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c46:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c4a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c4e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c50:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c52:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c56:	2501                	sext.w	a0,a0
    1c58:	8082                	ret

0000000000001c5a <openat>:
    register long a7 __asm__("a7") = n;
    1c5a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c5e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c62:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <close>:
    register long a7 __asm__("a7") = n;
    1c6a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c6e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <read>:
    register long a7 __asm__("a7") = n;
    1c76:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c7e:	8082                	ret

0000000000001c80 <write>:
    register long a7 __asm__("a7") = n;
    1c80:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c84:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c88:	8082                	ret

0000000000001c8a <getpid>:
    register long a7 __asm__("a7") = n;
    1c8a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c8e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <getppid>:
    register long a7 __asm__("a7") = n;
    1c96:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c9a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <fork>:
    register long a7 __asm__("a7") = n;
    1cae:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cbe:	85b2                	mv	a1,a2
    1cc0:	863a                	mv	a2,a4
    if (stack)
    1cc2:	c191                	beqz	a1,1cc6 <clone+0x8>
	stack += stack_size;
    1cc4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc6:	4781                	li	a5,0
    1cc8:	4701                	li	a4,0
    1cca:	4681                	li	a3,0
    1ccc:	2601                	sext.w	a2,a2
    1cce:	ac01                	j	1ede <__clone>

0000000000001cd0 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cd0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cd4:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cd8:	8082                	ret

0000000000001cda <exit>:
    register long a7 __asm__("a7") = n;
    1cda:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce2:	8082                	ret

0000000000001ce4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cea:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <exec>:
    register long a7 __asm__("a7") = n;
    1cf2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <execve>:
    register long a7 __asm__("a7") = n;
    1cfe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d02:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <times>:
    register long a7 __asm__("a7") = n;
    1d0a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <get_time>:

int64 get_time()
{
    1d16:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d18:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d1c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d1e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d20:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d24:	2501                	sext.w	a0,a0
    1d26:	ed09                	bnez	a0,1d40 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d28:	67a2                	ld	a5,8(sp)
    1d2a:	3e800713          	li	a4,1000
    1d2e:	00015503          	lhu	a0,0(sp)
    1d32:	02e7d7b3          	divu	a5,a5,a4
    1d36:	02e50533          	mul	a0,a0,a4
    1d3a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d3c:	0141                	add	sp,sp,16
    1d3e:	8082                	ret
        return -1;
    1d40:	557d                	li	a0,-1
    1d42:	bfed                	j	1d3c <get_time+0x26>

0000000000001d44 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d44:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d48:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <time>:
    register long a7 __asm__("a7") = n;
    1d50:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <sleep>:

int sleep(unsigned long long time)
{
    1d5c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d5e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d60:	850a                	mv	a0,sp
    1d62:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d64:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d68:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6e:	e501                	bnez	a0,1d76 <sleep+0x1a>
    return 0;
    1d70:	4501                	li	a0,0
}
    1d72:	0141                	add	sp,sp,16
    1d74:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d76:	4502                	lw	a0,0(sp)
}
    1d78:	0141                	add	sp,sp,16
    1d7a:	8082                	ret

0000000000001d7c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d7c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d88:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d8c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d90:	8082                	ret

0000000000001d92 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d92:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d96:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <munmap>:
    register long a7 __asm__("a7") = n;
    1d9e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <wait>:

int wait(int *code)
{
    1daa:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dac:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1db0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <spawn>:
    register long a7 __asm__("a7") = n;
    1dbe:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mailread>:
    register long a7 __asm__("a7") = n;
    1dca:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dce:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dda:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <fstat>:
    register long a7 __asm__("a7") = n;
    1de2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dee:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df0:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1df4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df6:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dfe:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e00:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e04:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e06:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e0e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e10:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e14:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e16:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <link>:

int link(char *old_path, char *new_path)
{
    1e1e:	87aa                	mv	a5,a0
    1e20:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e22:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e26:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e2a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e2c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e30:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e32:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <unlink>:

int unlink(char *path)
{
    1e3a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e3c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e40:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e44:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e46:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <uname>:
    register long a7 __asm__("a7") = n;
    1e4e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e52:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <brk>:
    register long a7 __asm__("a7") = n;
    1e5a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e66:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e6c:	8082                	ret

0000000000001e6e <chdir>:
    register long a7 __asm__("a7") = n;
    1e6e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e7a:	862e                	mv	a2,a1
    1e7c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e7e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e80:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e84:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e88:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e8a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <getdents>:
    register long a7 __asm__("a7") = n;
    1e94:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e98:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <pipe>:
    register long a7 __asm__("a7") = n;
    1ea0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <dup>:
    register long a7 __asm__("a7") = n;
    1eae:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eb0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eba:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebc:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <mount>:
    register long a7 __asm__("a7") = n;
    1ec4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <umount>:
    register long a7 __asm__("a7") = n;
    1ed0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ede:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ee0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ee2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee4:	8532                	mv	a0,a2
	mv a2, a4
    1ee6:	863a                	mv	a2,a4
	mv a3, a5
    1ee8:	86be                	mv	a3,a5
	mv a4, a6
    1eea:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eec:	0dc00893          	li	a7,220
	ecall
    1ef0:	00000073          	ecall

	beqz a0, 1f
    1ef4:	c111                	beqz	a0,1ef8 <__clone+0x1a>
	# Parent
	ret
    1ef6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1efa:	6522                	ld	a0,8(sp)
	jalr a1
    1efc:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1efe:	05d00893          	li	a7,93
	ecall
    1f02:	00000073          	ecall
