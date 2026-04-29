
/home/hbh/oslab/oslab/user/build/riscv64/open:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a855                	j	10b6 <__start_main>

0000000000001004 <test_open>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_open() {
    1004:	716d                	add	sp,sp,-272
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	add	a0,a0,-278 # 1ef0 <__clone+0x2c>
void test_open() {
    100e:	e606                	sd	ra,264(sp)
    1010:	e222                	sd	s0,256(sp)
	TEST_START(__func__);
    1012:	2fc000ef          	jal	130e <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f6250513          	add	a0,a0,-158 # 1f78 <__func__.0>
    101e:	2f0000ef          	jal	130e <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ee650513          	add	a0,a0,-282 # 1f08 <__clone+0x44>
    102a:	2e4000ef          	jal	130e <puts>
	// O_RDONLY = 0, O_WRONLY = 1
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	ee850513          	add	a0,a0,-280 # 1f18 <__clone+0x54>
    1038:	3f1000ef          	jal	1c28 <open>
    103c:	842a                	mv	s0,a0
	assert(fd >= 0);
    103e:	04054d63          	bltz	a0,1098 <test_open+0x94>
	char buf[256];
	int size = read(fd, buf, 256);
    1042:	858a                	mv	a1,sp
    1044:	10000613          	li	a2,256
    1048:	8522                	mv	a0,s0
    104a:	413000ef          	jal	1c5c <read>
	if (size < 0) {
    104e:	0005079b          	sext.w	a5,a0
    1052:	fff7c793          	not	a5,a5
    1056:	97fd                	sra	a5,a5,0x3f
    1058:	00f57633          	and	a2,a0,a5
		size = 0;
	}
	write(STDOUT, buf, size);
    105c:	858a                	mv	a1,sp
    105e:	2601                	sext.w	a2,a2
    1060:	4505                	li	a0,1
    1062:	405000ef          	jal	1c66 <write>
	close(fd);
    1066:	8522                	mv	a0,s0
    1068:	3e9000ef          	jal	1c50 <close>
	TEST_END(__func__);
    106c:	00001517          	auipc	a0,0x1
    1070:	edc50513          	add	a0,a0,-292 # 1f48 <__clone+0x84>
    1074:	29a000ef          	jal	130e <puts>
    1078:	00001517          	auipc	a0,0x1
    107c:	f0050513          	add	a0,a0,-256 # 1f78 <__func__.0>
    1080:	28e000ef          	jal	130e <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	e8450513          	add	a0,a0,-380 # 1f08 <__clone+0x44>
    108c:	282000ef          	jal	130e <puts>
}
    1090:	60b2                	ld	ra,264(sp)
    1092:	6412                	ld	s0,256(sp)
    1094:	6151                	add	sp,sp,272
    1096:	8082                	ret
	assert(fd >= 0);
    1098:	00001517          	auipc	a0,0x1
    109c:	e9050513          	add	a0,a0,-368 # 1f28 <__clone+0x64>
    10a0:	50a000ef          	jal	15aa <panic>
    10a4:	bf79                	j	1042 <test_open+0x3e>

00000000000010a6 <main>:

int main(void) {
    10a6:	1141                	add	sp,sp,-16
    10a8:	e406                	sd	ra,8(sp)
	test_open();
    10aa:	f5bff0ef          	jal	1004 <test_open>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b8:	4108                	lw	a0,0(a0)
{
    10ba:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10bc:	05a1                	add	a1,a1,8
{
    10be:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c0:	fe7ff0ef          	jal	10a6 <main>
    10c4:	3fd000ef          	jal	1cc0 <exit>
	return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d0:	7179                	add	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d4:	12054863          	bltz	a0,1204 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d8:	02b577bb          	remuw	a5,a0,a1
    10dc:	00001697          	auipc	a3,0x1
    10e0:	eac68693          	add	a3,a3,-340 # 1f88 <digits>
    buf[16] = 0;
    10e4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e8:	0005871b          	sext.w	a4,a1
    10ec:	1782                	sll	a5,a5,0x20
    10ee:	9381                	srl	a5,a5,0x20
    10f0:	97b6                	add	a5,a5,a3
    10f2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10fa:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10fe:	1ab56663          	bltu	a0,a1,12aa <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1102:	02e8763b          	remuw	a2,a6,a4
    1106:	1602                	sll	a2,a2,0x20
    1108:	9201                	srl	a2,a2,0x20
    110a:	9636                	add	a2,a2,a3
    110c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1110:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1114:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1118:	12e86c63          	bltu	a6,a4,1250 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    111c:	02e5f63b          	remuw	a2,a1,a4
    1120:	1602                	sll	a2,a2,0x20
    1122:	9201                	srl	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    112e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1132:	12e5e863          	bltu	a1,a4,1262 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1136:	02e8763b          	remuw	a2,a6,a4
    113a:	1602                	sll	a2,a2,0x20
    113c:	9201                	srl	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1148:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    114c:	12e86463          	bltu	a6,a4,1274 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1150:	02e5f63b          	remuw	a2,a1,a4
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1162:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1166:	12e5e063          	bltu	a1,a4,1286 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    116a:	02e8763b          	remuw	a2,a6,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1180:	0ae86f63          	bltu	a6,a4,123e <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1184:	02e5f63b          	remuw	a2,a1,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1196:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    119a:	0ee5ef63          	bltu	a1,a4,1298 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    119e:	02e8763b          	remuw	a2,a6,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b4:	0ee86d63          	bltu	a6,a4,12ae <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11b8:	02e5f63b          	remuw	a2,a1,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ca:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ce:	0ee5e963          	bltu	a1,a4,12c0 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11d2:	1782                	sll	a5,a5,0x20
    11d4:	9381                	srl	a5,a5,0x20
    11d6:	96be                	add	a3,a3,a5
    11d8:	0006c783          	lbu	a5,0(a3)
    11dc:	4599                	li	a1,6
    11de:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e2:	00055763          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11e6:	02d00793          	li	a5,45
    11ea:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ee:	4595                	li	a1,5
    write(f, s, l);
    11f0:	003c                	add	a5,sp,8
    11f2:	4641                	li	a2,16
    11f4:	9e0d                	subw	a2,a2,a1
    11f6:	4505                	li	a0,1
    11f8:	95be                	add	a1,a1,a5
    11fa:	26d000ef          	jal	1c66 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fe:	70a2                	ld	ra,40(sp)
    1200:	6145                	add	sp,sp,48
    1202:	8082                	ret
        x = -xx;
    1204:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1208:	02b677bb          	remuw	a5,a2,a1
    120c:	00001697          	auipc	a3,0x1
    1210:	d7c68693          	add	a3,a3,-644 # 1f88 <digits>
    buf[16] = 0;
    1214:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1218:	0005871b          	sext.w	a4,a1
    121c:	1782                	sll	a5,a5,0x20
    121e:	9381                	srl	a5,a5,0x20
    1220:	97b6                	add	a5,a5,a3
    1222:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1226:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122e:	ecb67ae3          	bgeu	a2,a1,1102 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123a:	45b9                	li	a1,14
    123c:	bf55                	j	11f0 <printint.constprop.0+0x120>
    123e:	45a9                	li	a1,10
    if (sign)
    1240:	fa0558e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    124c:	45a5                	li	a1,9
    124e:	b74d                	j	11f0 <printint.constprop.0+0x120>
    1250:	45b9                	li	a1,14
    if (sign)
    1252:	f8055fe3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    125e:	45b5                	li	a1,13
    1260:	bf41                	j	11f0 <printint.constprop.0+0x120>
    1262:	45b5                	li	a1,13
    if (sign)
    1264:	f80556e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1270:	45b1                	li	a1,12
    1272:	bfbd                	j	11f0 <printint.constprop.0+0x120>
    1274:	45b1                	li	a1,12
    if (sign)
    1276:	f6055de3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1282:	45ad                	li	a1,11
    1284:	b7b5                	j	11f0 <printint.constprop.0+0x120>
    1286:	45ad                	li	a1,11
    if (sign)
    1288:	f60554e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1294:	45a9                	li	a1,10
    1296:	bfa9                	j	11f0 <printint.constprop.0+0x120>
    1298:	45a5                	li	a1,9
    if (sign)
    129a:	f4055be3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a6:	45a1                	li	a1,8
    12a8:	b7a1                	j	11f0 <printint.constprop.0+0x120>
    i = 15;
    12aa:	45bd                	li	a1,15
    12ac:	b791                	j	11f0 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12ae:	45a1                	li	a1,8
    if (sign)
    12b0:	f40550e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12bc:	459d                	li	a1,7
    12be:	bf0d                	j	11f0 <printint.constprop.0+0x120>
    12c0:	459d                	li	a1,7
    if (sign)
    12c2:	f20557e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ce:	4599                	li	a1,6
    12d0:	b705                	j	11f0 <printint.constprop.0+0x120>

00000000000012d2 <getchar>:
{
    12d2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12d4:	00f10593          	add	a1,sp,15
    12d8:	4605                	li	a2,1
    12da:	4501                	li	a0,0
{
    12dc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12de:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e2:	17b000ef          	jal	1c5c <read>
}
    12e6:	60e2                	ld	ra,24(sp)
    12e8:	00f14503          	lbu	a0,15(sp)
    12ec:	6105                	add	sp,sp,32
    12ee:	8082                	ret

00000000000012f0 <putchar>:
{
    12f0:	1101                	add	sp,sp,-32
    12f2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12f4:	00f10593          	add	a1,sp,15
    12f8:	4605                	li	a2,1
    12fa:	4505                	li	a0,1
{
    12fc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12fe:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1302:	165000ef          	jal	1c66 <write>
}
    1306:	60e2                	ld	ra,24(sp)
    1308:	2501                	sext.w	a0,a0
    130a:	6105                	add	sp,sp,32
    130c:	8082                	ret

000000000000130e <puts>:
{
    130e:	1141                	add	sp,sp,-16
    1310:	e406                	sd	ra,8(sp)
    1312:	e022                	sd	s0,0(sp)
    1314:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1316:	574000ef          	jal	188a <strlen>
    131a:	862a                	mv	a2,a0
    131c:	85a2                	mv	a1,s0
    131e:	4505                	li	a0,1
    1320:	147000ef          	jal	1c66 <write>
}
    1324:	60a2                	ld	ra,8(sp)
    1326:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1328:	957d                	sra	a0,a0,0x3f
    return r;
    132a:	2501                	sext.w	a0,a0
}
    132c:	0141                	add	sp,sp,16
    132e:	8082                	ret

0000000000001330 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1330:	7171                	add	sp,sp,-176
    1332:	f85a                	sd	s6,48(sp)
    1334:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1336:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1338:	18bc                	add	a5,sp,120
{
    133a:	e8ca                	sd	s2,80(sp)
    133c:	e4ce                	sd	s3,72(sp)
    133e:	e0d2                	sd	s4,64(sp)
    1340:	fc56                	sd	s5,56(sp)
    1342:	f486                	sd	ra,104(sp)
    1344:	f0a2                	sd	s0,96(sp)
    1346:	eca6                	sd	s1,88(sp)
    1348:	fcae                	sd	a1,120(sp)
    134a:	e132                	sd	a2,128(sp)
    134c:	e536                	sd	a3,136(sp)
    134e:	e93a                	sd	a4,144(sp)
    1350:	f142                	sd	a6,160(sp)
    1352:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1354:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1356:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    135a:	07300a13          	li	s4,115
    135e:	07800a93          	li	s5,120
    buf[i++] = '0';
    1362:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1366:	00001997          	auipc	s3,0x1
    136a:	c2298993          	add	s3,s3,-990 # 1f88 <digits>
        if (!*s)
    136e:	00054783          	lbu	a5,0(a0)
    1372:	16078a63          	beqz	a5,14e6 <printf+0x1b6>
    1376:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1378:	19278d63          	beq	a5,s2,1512 <printf+0x1e2>
    137c:	00164783          	lbu	a5,1(a2)
    1380:	0605                	add	a2,a2,1
    1382:	fbfd                	bnez	a5,1378 <printf+0x48>
    1384:	84b2                	mv	s1,a2
        l = z - a;
    1386:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    138a:	85aa                	mv	a1,a0
    138c:	8622                	mv	a2,s0
    138e:	4505                	li	a0,1
    1390:	0d7000ef          	jal	1c66 <write>
        if (l)
    1394:	1a041463          	bnez	s0,153c <printf+0x20c>
        if (s[1] == 0)
    1398:	0014c783          	lbu	a5,1(s1)
    139c:	14078563          	beqz	a5,14e6 <printf+0x1b6>
        switch (s[1])
    13a0:	1b478063          	beq	a5,s4,1540 <printf+0x210>
    13a4:	14fa6b63          	bltu	s4,a5,14fa <printf+0x1ca>
    13a8:	06400713          	li	a4,100
    13ac:	1ee78063          	beq	a5,a4,158c <printf+0x25c>
    13b0:	07000713          	li	a4,112
    13b4:	1ae79963          	bne	a5,a4,1566 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ba:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13be:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c0:	631c                	ld	a5,0(a4)
    13c2:	0721                	add	a4,a4,8
    13c4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c6:	00479293          	sll	t0,a5,0x4
    13ca:	00879f93          	sll	t6,a5,0x8
    13ce:	00c79f13          	sll	t5,a5,0xc
    13d2:	01079e93          	sll	t4,a5,0x10
    13d6:	01479e13          	sll	t3,a5,0x14
    13da:	01879313          	sll	t1,a5,0x18
    13de:	01c79893          	sll	a7,a5,0x1c
    13e2:	02479813          	sll	a6,a5,0x24
    13e6:	02879513          	sll	a0,a5,0x28
    13ea:	02c79593          	sll	a1,a5,0x2c
    13ee:	03079693          	sll	a3,a5,0x30
    13f2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f6:	03c7d413          	srl	s0,a5,0x3c
    13fa:	01c7d39b          	srlw	t2,a5,0x1c
    13fe:	03c2d293          	srl	t0,t0,0x3c
    1402:	03cfdf93          	srl	t6,t6,0x3c
    1406:	03cf5f13          	srl	t5,t5,0x3c
    140a:	03cede93          	srl	t4,t4,0x3c
    140e:	03ce5e13          	srl	t3,t3,0x3c
    1412:	03c35313          	srl	t1,t1,0x3c
    1416:	03c8d893          	srl	a7,a7,0x3c
    141a:	03c85813          	srl	a6,a6,0x3c
    141e:	9171                	srl	a0,a0,0x3c
    1420:	91f1                	srl	a1,a1,0x3c
    1422:	92f1                	srl	a3,a3,0x3c
    1424:	9371                	srl	a4,a4,0x3c
    1426:	96ce                	add	a3,a3,s3
    1428:	974e                	add	a4,a4,s3
    142a:	944e                	add	s0,s0,s3
    142c:	92ce                	add	t0,t0,s3
    142e:	9fce                	add	t6,t6,s3
    1430:	9f4e                	add	t5,t5,s3
    1432:	9ece                	add	t4,t4,s3
    1434:	9e4e                	add	t3,t3,s3
    1436:	934e                	add	t1,t1,s3
    1438:	98ce                	add	a7,a7,s3
    143a:	93ce                	add	t2,t2,s3
    143c:	984e                	add	a6,a6,s3
    143e:	954e                	add	a0,a0,s3
    1440:	95ce                	add	a1,a1,s3
    1442:	0006c083          	lbu	ra,0(a3)
    1446:	0002c283          	lbu	t0,0(t0)
    144a:	00074683          	lbu	a3,0(a4)
    144e:	000fcf83          	lbu	t6,0(t6)
    1452:	000f4f03          	lbu	t5,0(t5)
    1456:	000ece83          	lbu	t4,0(t4)
    145a:	000e4e03          	lbu	t3,0(t3)
    145e:	00034303          	lbu	t1,0(t1)
    1462:	0008c883          	lbu	a7,0(a7)
    1466:	0003c383          	lbu	t2,0(t2)
    146a:	00084803          	lbu	a6,0(a6)
    146e:	00054503          	lbu	a0,0(a0)
    1472:	0005c583          	lbu	a1,0(a1)
    1476:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147e:	9371                	srl	a4,a4,0x3c
    1480:	8bbd                	and	a5,a5,15
    1482:	974e                	add	a4,a4,s3
    1484:	97ce                	add	a5,a5,s3
    1486:	005105a3          	sb	t0,11(sp)
    148a:	01f10623          	sb	t6,12(sp)
    148e:	01e106a3          	sb	t5,13(sp)
    1492:	01d10723          	sb	t4,14(sp)
    1496:	01c107a3          	sb	t3,15(sp)
    149a:	00610823          	sb	t1,16(sp)
    149e:	011108a3          	sb	a7,17(sp)
    14a2:	00710923          	sb	t2,18(sp)
    14a6:	010109a3          	sb	a6,19(sp)
    14aa:	00a10a23          	sb	a0,20(sp)
    14ae:	00b10aa3          	sb	a1,21(sp)
    14b2:	00110b23          	sb	ra,22(sp)
    14b6:	00d10ba3          	sb	a3,23(sp)
    14ba:	00810523          	sb	s0,10(sp)
    14be:	00074703          	lbu	a4,0(a4)
    14c2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c6:	002c                	add	a1,sp,8
    14c8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	00e10c23          	sb	a4,24(sp)
    14ce:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14d6:	790000ef          	jal	1c66 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14da:	00248513          	add	a0,s1,2
        if (!*s)
    14de:	00054783          	lbu	a5,0(a0)
    14e2:	e8079ae3          	bnez	a5,1376 <printf+0x46>
    }
    va_end(ap);
}
    14e6:	70a6                	ld	ra,104(sp)
    14e8:	7406                	ld	s0,96(sp)
    14ea:	64e6                	ld	s1,88(sp)
    14ec:	6946                	ld	s2,80(sp)
    14ee:	69a6                	ld	s3,72(sp)
    14f0:	6a06                	ld	s4,64(sp)
    14f2:	7ae2                	ld	s5,56(sp)
    14f4:	7b42                	ld	s6,48(sp)
    14f6:	614d                	add	sp,sp,176
    14f8:	8082                	ret
        switch (s[1])
    14fa:	07579663          	bne	a5,s5,1566 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14fe:	6782                	ld	a5,0(sp)
    1500:	45c1                	li	a1,16
    1502:	4388                	lw	a0,0(a5)
    1504:	07a1                	add	a5,a5,8
    1506:	e03e                	sd	a5,0(sp)
    1508:	bc9ff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    150c:	00248513          	add	a0,s1,2
    1510:	b7f9                	j	14de <printf+0x1ae>
    1512:	84b2                	mv	s1,a2
    1514:	a039                	j	1522 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1516:	0024c783          	lbu	a5,2(s1)
    151a:	0605                	add	a2,a2,1
    151c:	0489                	add	s1,s1,2
    151e:	e72794e3          	bne	a5,s2,1386 <printf+0x56>
    1522:	0014c783          	lbu	a5,1(s1)
    1526:	ff2788e3          	beq	a5,s2,1516 <printf+0x1e6>
        l = z - a;
    152a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    152e:	85aa                	mv	a1,a0
    1530:	8622                	mv	a2,s0
    1532:	4505                	li	a0,1
    1534:	732000ef          	jal	1c66 <write>
        if (l)
    1538:	e60400e3          	beqz	s0,1398 <printf+0x68>
    153c:	8526                	mv	a0,s1
    153e:	bd05                	j	136e <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1540:	6782                	ld	a5,0(sp)
    1542:	6380                	ld	s0,0(a5)
    1544:	07a1                	add	a5,a5,8
    1546:	e03e                	sd	a5,0(sp)
    1548:	cc21                	beqz	s0,15a0 <printf+0x270>
            l = strnlen(a, 200);
    154a:	0c800593          	li	a1,200
    154e:	8522                	mv	a0,s0
    1550:	424000ef          	jal	1974 <strnlen>
    write(f, s, l);
    1554:	0005061b          	sext.w	a2,a0
    1558:	85a2                	mv	a1,s0
    155a:	4505                	li	a0,1
    155c:	70a000ef          	jal	1c66 <write>
        s += 2;
    1560:	00248513          	add	a0,s1,2
    1564:	bfad                	j	14de <printf+0x1ae>
    return write(stdout, &byte, 1);
    1566:	4605                	li	a2,1
    1568:	002c                	add	a1,sp,8
    156a:	4505                	li	a0,1
    char byte = c;
    156c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1570:	6f6000ef          	jal	1c66 <write>
    char byte = c;
    1574:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	add	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1582:	6e4000ef          	jal	1c66 <write>
        s += 2;
    1586:	00248513          	add	a0,s1,2
    158a:	bf91                	j	14de <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    158c:	6782                	ld	a5,0(sp)
    158e:	45a9                	li	a1,10
    1590:	4388                	lw	a0,0(a5)
    1592:	07a1                	add	a5,a5,8
    1594:	e03e                	sd	a5,0(sp)
    1596:	b3bff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    159a:	00248513          	add	a0,s1,2
    159e:	b781                	j	14de <printf+0x1ae>
                a = "(null)";
    15a0:	00001417          	auipc	s0,0x1
    15a4:	9b840413          	add	s0,s0,-1608 # 1f58 <__clone+0x94>
    15a8:	b74d                	j	154a <printf+0x21a>

00000000000015aa <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15aa:	1141                	add	sp,sp,-16
    15ac:	e406                	sd	ra,8(sp)
    puts(m);
    15ae:	d61ff0ef          	jal	130e <puts>
    exit(-100);
}
    15b2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b4:	f9c00513          	li	a0,-100
}
    15b8:	0141                	add	sp,sp,16
    exit(-100);
    15ba:	a719                	j	1cc0 <exit>

00000000000015bc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15bc:	02000793          	li	a5,32
    15c0:	00f50663          	beq	a0,a5,15cc <isspace+0x10>
    15c4:	355d                	addw	a0,a0,-9
    15c6:	00553513          	sltiu	a0,a0,5
    15ca:	8082                	ret
    15cc:	4505                	li	a0,1
}
    15ce:	8082                	ret

00000000000015d0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d0:	fd05051b          	addw	a0,a0,-48
}
    15d4:	00a53513          	sltiu	a0,a0,10
    15d8:	8082                	ret

00000000000015da <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	02000693          	li	a3,32
    15de:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e0:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e4:	ff77871b          	addw	a4,a5,-9
    15e8:	04d78c63          	beq	a5,a3,1640 <atoi+0x66>
    15ec:	0007861b          	sext.w	a2,a5
    15f0:	04e5f863          	bgeu	a1,a4,1640 <atoi+0x66>
        s++;
    switch (*s)
    15f4:	02b00713          	li	a4,43
    15f8:	04e78963          	beq	a5,a4,164a <atoi+0x70>
    15fc:	02d00713          	li	a4,45
    1600:	06e78263          	beq	a5,a4,1664 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1604:	fd06069b          	addw	a3,a2,-48
    1608:	47a5                	li	a5,9
    160a:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    160c:	4301                	li	t1,0
    while (isdigit(*s))
    160e:	04d7e963          	bltu	a5,a3,1660 <atoi+0x86>
    int n = 0, neg = 0;
    1612:	4501                	li	a0,0
    while (isdigit(*s))
    1614:	48a5                	li	a7,9
    1616:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    161a:	0025179b          	sllw	a5,a0,0x2
    161e:	9fa9                	addw	a5,a5,a0
    1620:	fd06059b          	addw	a1,a2,-48
    1624:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1628:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    162c:	0705                	add	a4,a4,1
    162e:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1632:	0006861b          	sext.w	a2,a3
    1636:	ff08f0e3          	bgeu	a7,a6,1616 <atoi+0x3c>
    return neg ? n : -n;
    163a:	00030563          	beqz	t1,1644 <atoi+0x6a>
}
    163e:	8082                	ret
        s++;
    1640:	0505                	add	a0,a0,1
    1642:	bf79                	j	15e0 <atoi+0x6>
    return neg ? n : -n;
    1644:	40f5853b          	subw	a0,a1,a5
    1648:	8082                	ret
    while (isdigit(*s))
    164a:	00154603          	lbu	a2,1(a0)
    164e:	47a5                	li	a5,9
        s++;
    1650:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1654:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1658:	4301                	li	t1,0
    while (isdigit(*s))
    165a:	2601                	sext.w	a2,a2
    165c:	fad7fbe3          	bgeu	a5,a3,1612 <atoi+0x38>
    1660:	4501                	li	a0,0
}
    1662:	8082                	ret
    while (isdigit(*s))
    1664:	00154603          	lbu	a2,1(a0)
    1668:	47a5                	li	a5,9
        s++;
    166a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    166e:	fd06069b          	addw	a3,a2,-48
    1672:	2601                	sext.w	a2,a2
    1674:	fed7e6e3          	bltu	a5,a3,1660 <atoi+0x86>
        neg = 1;
    1678:	4305                	li	t1,1
    167a:	bf61                	j	1612 <atoi+0x38>

000000000000167c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    167c:	18060163          	beqz	a2,17fe <memset+0x182>
    1680:	40a006b3          	neg	a3,a0
    1684:	0076f793          	and	a5,a3,7
    1688:	00778813          	add	a6,a5,7
    168c:	48ad                	li	a7,11
    168e:	0ff5f713          	zext.b	a4,a1
    1692:	fff60593          	add	a1,a2,-1
    1696:	17186563          	bltu	a6,a7,1800 <memset+0x184>
    169a:	1705ed63          	bltu	a1,a6,1814 <memset+0x198>
    169e:	16078363          	beqz	a5,1804 <memset+0x188>
    16a2:	00e50023          	sb	a4,0(a0)
    16a6:	0066f593          	and	a1,a3,6
    16aa:	16058063          	beqz	a1,180a <memset+0x18e>
    16ae:	00e500a3          	sb	a4,1(a0)
    16b2:	4589                	li	a1,2
    16b4:	16f5f363          	bgeu	a1,a5,181a <memset+0x19e>
    16b8:	00e50123          	sb	a4,2(a0)
    16bc:	8a91                	and	a3,a3,4
    16be:	00350593          	add	a1,a0,3
    16c2:	4e0d                	li	t3,3
    16c4:	ce9d                	beqz	a3,1702 <memset+0x86>
    16c6:	00e501a3          	sb	a4,3(a0)
    16ca:	4691                	li	a3,4
    16cc:	00450593          	add	a1,a0,4
    16d0:	4e11                	li	t3,4
    16d2:	02f6f863          	bgeu	a3,a5,1702 <memset+0x86>
    16d6:	00e50223          	sb	a4,4(a0)
    16da:	4695                	li	a3,5
    16dc:	00550593          	add	a1,a0,5
    16e0:	4e15                	li	t3,5
    16e2:	02d78063          	beq	a5,a3,1702 <memset+0x86>
    16e6:	fff50693          	add	a3,a0,-1
    16ea:	00e502a3          	sb	a4,5(a0)
    16ee:	8a9d                	and	a3,a3,7
    16f0:	00650593          	add	a1,a0,6
    16f4:	4e19                	li	t3,6
    16f6:	e691                	bnez	a3,1702 <memset+0x86>
    16f8:	00750593          	add	a1,a0,7
    16fc:	00e50323          	sb	a4,6(a0)
    1700:	4e1d                	li	t3,7
    1702:	00871693          	sll	a3,a4,0x8
    1706:	01071813          	sll	a6,a4,0x10
    170a:	8ed9                	or	a3,a3,a4
    170c:	01871893          	sll	a7,a4,0x18
    1710:	0106e6b3          	or	a3,a3,a6
    1714:	0116e6b3          	or	a3,a3,a7
    1718:	02071813          	sll	a6,a4,0x20
    171c:	02871313          	sll	t1,a4,0x28
    1720:	0106e6b3          	or	a3,a3,a6
    1724:	40f608b3          	sub	a7,a2,a5
    1728:	03071813          	sll	a6,a4,0x30
    172c:	0066e6b3          	or	a3,a3,t1
    1730:	0106e6b3          	or	a3,a3,a6
    1734:	03871313          	sll	t1,a4,0x38
    1738:	97aa                	add	a5,a5,a0
    173a:	ff88f813          	and	a6,a7,-8
    173e:	0066e6b3          	or	a3,a3,t1
    1742:	983e                	add	a6,a6,a5
    1744:	e394                	sd	a3,0(a5)
    1746:	07a1                	add	a5,a5,8
    1748:	ff079ee3          	bne	a5,a6,1744 <memset+0xc8>
    174c:	ff88f793          	and	a5,a7,-8
    1750:	0078f893          	and	a7,a7,7
    1754:	00f586b3          	add	a3,a1,a5
    1758:	01c787bb          	addw	a5,a5,t3
    175c:	0a088b63          	beqz	a7,1812 <memset+0x196>
    1760:	00e68023          	sb	a4,0(a3)
    1764:	0017859b          	addw	a1,a5,1
    1768:	08c5fb63          	bgeu	a1,a2,17fe <memset+0x182>
    176c:	00e680a3          	sb	a4,1(a3)
    1770:	0027859b          	addw	a1,a5,2
    1774:	08c5f563          	bgeu	a1,a2,17fe <memset+0x182>
    1778:	00e68123          	sb	a4,2(a3)
    177c:	0037859b          	addw	a1,a5,3
    1780:	06c5ff63          	bgeu	a1,a2,17fe <memset+0x182>
    1784:	00e681a3          	sb	a4,3(a3)
    1788:	0047859b          	addw	a1,a5,4
    178c:	06c5f963          	bgeu	a1,a2,17fe <memset+0x182>
    1790:	00e68223          	sb	a4,4(a3)
    1794:	0057859b          	addw	a1,a5,5
    1798:	06c5f363          	bgeu	a1,a2,17fe <memset+0x182>
    179c:	00e682a3          	sb	a4,5(a3)
    17a0:	0067859b          	addw	a1,a5,6
    17a4:	04c5fd63          	bgeu	a1,a2,17fe <memset+0x182>
    17a8:	00e68323          	sb	a4,6(a3)
    17ac:	0077859b          	addw	a1,a5,7
    17b0:	04c5f763          	bgeu	a1,a2,17fe <memset+0x182>
    17b4:	00e683a3          	sb	a4,7(a3)
    17b8:	0087859b          	addw	a1,a5,8
    17bc:	04c5f163          	bgeu	a1,a2,17fe <memset+0x182>
    17c0:	00e68423          	sb	a4,8(a3)
    17c4:	0097859b          	addw	a1,a5,9
    17c8:	02c5fb63          	bgeu	a1,a2,17fe <memset+0x182>
    17cc:	00e684a3          	sb	a4,9(a3)
    17d0:	00a7859b          	addw	a1,a5,10
    17d4:	02c5f563          	bgeu	a1,a2,17fe <memset+0x182>
    17d8:	00e68523          	sb	a4,10(a3)
    17dc:	00b7859b          	addw	a1,a5,11
    17e0:	00c5ff63          	bgeu	a1,a2,17fe <memset+0x182>
    17e4:	00e685a3          	sb	a4,11(a3)
    17e8:	00c7859b          	addw	a1,a5,12
    17ec:	00c5f963          	bgeu	a1,a2,17fe <memset+0x182>
    17f0:	00e68623          	sb	a4,12(a3)
    17f4:	27b5                	addw	a5,a5,13
    17f6:	00c7f463          	bgeu	a5,a2,17fe <memset+0x182>
    17fa:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17fe:	8082                	ret
    1800:	482d                	li	a6,11
    1802:	bd61                	j	169a <memset+0x1e>
    char *p = dest;
    1804:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1806:	4e01                	li	t3,0
    1808:	bded                	j	1702 <memset+0x86>
    180a:	00150593          	add	a1,a0,1
    180e:	4e05                	li	t3,1
    1810:	bdcd                	j	1702 <memset+0x86>
    1812:	8082                	ret
    char *p = dest;
    1814:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1816:	4781                	li	a5,0
    1818:	b7a1                	j	1760 <memset+0xe4>
    181a:	00250593          	add	a1,a0,2
    181e:	4e09                	li	t3,2
    1820:	b5cd                	j	1702 <memset+0x86>

0000000000001822 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1822:	00054783          	lbu	a5,0(a0)
    1826:	0005c703          	lbu	a4,0(a1)
    182a:	00e79863          	bne	a5,a4,183a <strcmp+0x18>
    182e:	0505                	add	a0,a0,1
    1830:	0585                	add	a1,a1,1
    1832:	fbe5                	bnez	a5,1822 <strcmp>
    1834:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1836:	9d19                	subw	a0,a0,a4
    1838:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    183a:	0007851b          	sext.w	a0,a5
    183e:	bfe5                	j	1836 <strcmp+0x14>

0000000000001840 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1840:	ca15                	beqz	a2,1874 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1842:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1846:	167d                	add	a2,a2,-1
    1848:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184c:	eb99                	bnez	a5,1862 <strncmp+0x22>
    184e:	a815                	j	1882 <strncmp+0x42>
    1850:	00a68e63          	beq	a3,a0,186c <strncmp+0x2c>
    1854:	0505                	add	a0,a0,1
    1856:	00f71b63          	bne	a4,a5,186c <strncmp+0x2c>
    185a:	00054783          	lbu	a5,0(a0)
    185e:	cf89                	beqz	a5,1878 <strncmp+0x38>
    1860:	85b2                	mv	a1,a2
    1862:	0005c703          	lbu	a4,0(a1)
    1866:	00158613          	add	a2,a1,1
    186a:	f37d                	bnez	a4,1850 <strncmp+0x10>
        ;
    return *l - *r;
    186c:	0007851b          	sext.w	a0,a5
    1870:	9d19                	subw	a0,a0,a4
    1872:	8082                	ret
        return 0;
    1874:	4501                	li	a0,0
}
    1876:	8082                	ret
    return *l - *r;
    1878:	0015c703          	lbu	a4,1(a1)
    187c:	4501                	li	a0,0
    187e:	9d19                	subw	a0,a0,a4
    1880:	8082                	ret
    1882:	0005c703          	lbu	a4,0(a1)
    1886:	4501                	li	a0,0
    1888:	b7e5                	j	1870 <strncmp+0x30>

000000000000188a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188a:	00757793          	and	a5,a0,7
    188e:	cf89                	beqz	a5,18a8 <strlen+0x1e>
    1890:	87aa                	mv	a5,a0
    1892:	a029                	j	189c <strlen+0x12>
    1894:	0785                	add	a5,a5,1
    1896:	0077f713          	and	a4,a5,7
    189a:	cb01                	beqz	a4,18aa <strlen+0x20>
        if (!*s)
    189c:	0007c703          	lbu	a4,0(a5)
    18a0:	fb75                	bnez	a4,1894 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a2:	40a78533          	sub	a0,a5,a0
}
    18a6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18aa:	6394                	ld	a3,0(a5)
    18ac:	00000597          	auipc	a1,0x0
    18b0:	6b45b583          	ld	a1,1716(a1) # 1f60 <__clone+0x9c>
    18b4:	00000617          	auipc	a2,0x0
    18b8:	6b463603          	ld	a2,1716(a2) # 1f68 <__clone+0xa4>
    18bc:	a019                	j	18c2 <strlen+0x38>
    18be:	6794                	ld	a3,8(a5)
    18c0:	07a1                	add	a5,a5,8
    18c2:	00b68733          	add	a4,a3,a1
    18c6:	fff6c693          	not	a3,a3
    18ca:	8f75                	and	a4,a4,a3
    18cc:	8f71                	and	a4,a4,a2
    18ce:	db65                	beqz	a4,18be <strlen+0x34>
    for (; *s; s++)
    18d0:	0007c703          	lbu	a4,0(a5)
    18d4:	d779                	beqz	a4,18a2 <strlen+0x18>
    18d6:	0017c703          	lbu	a4,1(a5)
    18da:	0785                	add	a5,a5,1
    18dc:	d379                	beqz	a4,18a2 <strlen+0x18>
    18de:	0017c703          	lbu	a4,1(a5)
    18e2:	0785                	add	a5,a5,1
    18e4:	fb6d                	bnez	a4,18d6 <strlen+0x4c>
    18e6:	bf75                	j	18a2 <strlen+0x18>

00000000000018e8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e8:	00757713          	and	a4,a0,7
{
    18ec:	87aa                	mv	a5,a0
    18ee:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f2:	cb19                	beqz	a4,1908 <memchr+0x20>
    18f4:	ce25                	beqz	a2,196c <memchr+0x84>
    18f6:	0007c703          	lbu	a4,0(a5)
    18fa:	00b70763          	beq	a4,a1,1908 <memchr+0x20>
    18fe:	0785                	add	a5,a5,1
    1900:	0077f713          	and	a4,a5,7
    1904:	167d                	add	a2,a2,-1
    1906:	f77d                	bnez	a4,18f4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1908:	4501                	li	a0,0
    if (n && *s != c)
    190a:	c235                	beqz	a2,196e <memchr+0x86>
    190c:	0007c703          	lbu	a4,0(a5)
    1910:	06b70063          	beq	a4,a1,1970 <memchr+0x88>
        size_t k = ONES * c;
    1914:	00000517          	auipc	a0,0x0
    1918:	65c53503          	ld	a0,1628(a0) # 1f70 <__clone+0xac>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191c:	471d                	li	a4,7
        size_t k = ONES * c;
    191e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1922:	04c77763          	bgeu	a4,a2,1970 <memchr+0x88>
    1926:	00000897          	auipc	a7,0x0
    192a:	63a8b883          	ld	a7,1594(a7) # 1f60 <__clone+0x9c>
    192e:	00000817          	auipc	a6,0x0
    1932:	63a83803          	ld	a6,1594(a6) # 1f68 <__clone+0xa4>
    1936:	431d                	li	t1,7
    1938:	a029                	j	1942 <memchr+0x5a>
    193a:	1661                	add	a2,a2,-8
    193c:	07a1                	add	a5,a5,8
    193e:	00c37c63          	bgeu	t1,a2,1956 <memchr+0x6e>
    1942:	6398                	ld	a4,0(a5)
    1944:	8f29                	xor	a4,a4,a0
    1946:	011706b3          	add	a3,a4,a7
    194a:	fff74713          	not	a4,a4
    194e:	8f75                	and	a4,a4,a3
    1950:	01077733          	and	a4,a4,a6
    1954:	d37d                	beqz	a4,193a <memchr+0x52>
    1956:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1958:	e601                	bnez	a2,1960 <memchr+0x78>
    195a:	a809                	j	196c <memchr+0x84>
    195c:	0505                	add	a0,a0,1
    195e:	c619                	beqz	a2,196c <memchr+0x84>
    1960:	00054783          	lbu	a5,0(a0)
    1964:	167d                	add	a2,a2,-1
    1966:	feb79be3          	bne	a5,a1,195c <memchr+0x74>
    196a:	8082                	ret
    return n ? (void *)s : 0;
    196c:	4501                	li	a0,0
}
    196e:	8082                	ret
    if (n && *s != c)
    1970:	853e                	mv	a0,a5
    1972:	b7fd                	j	1960 <memchr+0x78>

0000000000001974 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1974:	1101                	add	sp,sp,-32
    1976:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1978:	862e                	mv	a2,a1
{
    197a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    197c:	4581                	li	a1,0
{
    197e:	e426                	sd	s1,8(sp)
    1980:	ec06                	sd	ra,24(sp)
    1982:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1984:	f65ff0ef          	jal	18e8 <memchr>
    return p ? p - s : n;
    1988:	c519                	beqz	a0,1996 <strnlen+0x22>
}
    198a:	60e2                	ld	ra,24(sp)
    198c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    198e:	8d05                	sub	a0,a0,s1
}
    1990:	64a2                	ld	s1,8(sp)
    1992:	6105                	add	sp,sp,32
    1994:	8082                	ret
    1996:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1998:	8522                	mv	a0,s0
}
    199a:	6442                	ld	s0,16(sp)
    199c:	64a2                	ld	s1,8(sp)
    199e:	6105                	add	sp,sp,32
    19a0:	8082                	ret

00000000000019a2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a2:	00a5c7b3          	xor	a5,a1,a0
    19a6:	8b9d                	and	a5,a5,7
    19a8:	eb95                	bnez	a5,19dc <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19aa:	0075f793          	and	a5,a1,7
    19ae:	e7b1                	bnez	a5,19fa <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b0:	6198                	ld	a4,0(a1)
    19b2:	00000617          	auipc	a2,0x0
    19b6:	5ae63603          	ld	a2,1454(a2) # 1f60 <__clone+0x9c>
    19ba:	00000817          	auipc	a6,0x0
    19be:	5ae83803          	ld	a6,1454(a6) # 1f68 <__clone+0xa4>
    19c2:	a029                	j	19cc <strcpy+0x2a>
    19c4:	05a1                	add	a1,a1,8
    19c6:	e118                	sd	a4,0(a0)
    19c8:	6198                	ld	a4,0(a1)
    19ca:	0521                	add	a0,a0,8
    19cc:	00c707b3          	add	a5,a4,a2
    19d0:	fff74693          	not	a3,a4
    19d4:	8ff5                	and	a5,a5,a3
    19d6:	0107f7b3          	and	a5,a5,a6
    19da:	d7ed                	beqz	a5,19c4 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19dc:	0005c783          	lbu	a5,0(a1)
    19e0:	00f50023          	sb	a5,0(a0)
    19e4:	c785                	beqz	a5,1a0c <strcpy+0x6a>
    19e6:	0015c783          	lbu	a5,1(a1)
    19ea:	0505                	add	a0,a0,1
    19ec:	0585                	add	a1,a1,1
    19ee:	00f50023          	sb	a5,0(a0)
    19f2:	fbf5                	bnez	a5,19e6 <strcpy+0x44>
        ;
    return d;
}
    19f4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19f6:	0505                	add	a0,a0,1
    19f8:	df45                	beqz	a4,19b0 <strcpy+0xe>
            if (!(*d = *s))
    19fa:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19fe:	0585                	add	a1,a1,1
    1a00:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a04:	00f50023          	sb	a5,0(a0)
    1a08:	f7fd                	bnez	a5,19f6 <strcpy+0x54>
}
    1a0a:	8082                	ret
    1a0c:	8082                	ret

0000000000001a0e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a0e:	00a5c7b3          	xor	a5,a1,a0
    1a12:	8b9d                	and	a5,a5,7
    1a14:	e3b5                	bnez	a5,1a78 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a16:	0075f793          	and	a5,a1,7
    1a1a:	cf99                	beqz	a5,1a38 <strncpy+0x2a>
    1a1c:	ea09                	bnez	a2,1a2e <strncpy+0x20>
    1a1e:	a421                	j	1c26 <strncpy+0x218>
    1a20:	0585                	add	a1,a1,1
    1a22:	0075f793          	and	a5,a1,7
    1a26:	167d                	add	a2,a2,-1
    1a28:	0505                	add	a0,a0,1
    1a2a:	c799                	beqz	a5,1a38 <strncpy+0x2a>
    1a2c:	c225                	beqz	a2,1a8c <strncpy+0x7e>
    1a2e:	0005c783          	lbu	a5,0(a1)
    1a32:	00f50023          	sb	a5,0(a0)
    1a36:	f7ed                	bnez	a5,1a20 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a38:	ca31                	beqz	a2,1a8c <strncpy+0x7e>
    1a3a:	0005c783          	lbu	a5,0(a1)
    1a3e:	cba1                	beqz	a5,1a8e <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a40:	479d                	li	a5,7
    1a42:	02c7fc63          	bgeu	a5,a2,1a7a <strncpy+0x6c>
    1a46:	00000897          	auipc	a7,0x0
    1a4a:	51a8b883          	ld	a7,1306(a7) # 1f60 <__clone+0x9c>
    1a4e:	00000817          	auipc	a6,0x0
    1a52:	51a83803          	ld	a6,1306(a6) # 1f68 <__clone+0xa4>
    1a56:	431d                	li	t1,7
    1a58:	a039                	j	1a66 <strncpy+0x58>
            *wd = *ws;
    1a5a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a5c:	1661                	add	a2,a2,-8
    1a5e:	05a1                	add	a1,a1,8
    1a60:	0521                	add	a0,a0,8
    1a62:	00c37b63          	bgeu	t1,a2,1a78 <strncpy+0x6a>
    1a66:	6198                	ld	a4,0(a1)
    1a68:	011707b3          	add	a5,a4,a7
    1a6c:	fff74693          	not	a3,a4
    1a70:	8ff5                	and	a5,a5,a3
    1a72:	0107f7b3          	and	a5,a5,a6
    1a76:	d3f5                	beqz	a5,1a5a <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a78:	ca11                	beqz	a2,1a8c <strncpy+0x7e>
    1a7a:	0005c783          	lbu	a5,0(a1)
    1a7e:	0585                	add	a1,a1,1
    1a80:	00f50023          	sb	a5,0(a0)
    1a84:	c789                	beqz	a5,1a8e <strncpy+0x80>
    1a86:	167d                	add	a2,a2,-1
    1a88:	0505                	add	a0,a0,1
    1a8a:	fa65                	bnez	a2,1a7a <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a8c:	8082                	ret
    1a8e:	4805                	li	a6,1
    1a90:	14061b63          	bnez	a2,1be6 <strncpy+0x1d8>
    1a94:	40a00733          	neg	a4,a0
    1a98:	00777793          	and	a5,a4,7
    1a9c:	4581                	li	a1,0
    1a9e:	12061c63          	bnez	a2,1bd6 <strncpy+0x1c8>
    1aa2:	00778693          	add	a3,a5,7
    1aa6:	48ad                	li	a7,11
    1aa8:	1316e563          	bltu	a3,a7,1bd2 <strncpy+0x1c4>
    1aac:	16d5e263          	bltu	a1,a3,1c10 <strncpy+0x202>
    1ab0:	14078c63          	beqz	a5,1c08 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ab4:	00050023          	sb	zero,0(a0)
    1ab8:	00677693          	and	a3,a4,6
    1abc:	14068263          	beqz	a3,1c00 <strncpy+0x1f2>
    1ac0:	000500a3          	sb	zero,1(a0)
    1ac4:	4689                	li	a3,2
    1ac6:	14f6f863          	bgeu	a3,a5,1c16 <strncpy+0x208>
    1aca:	00050123          	sb	zero,2(a0)
    1ace:	8b11                	and	a4,a4,4
    1ad0:	12070463          	beqz	a4,1bf8 <strncpy+0x1ea>
    1ad4:	000501a3          	sb	zero,3(a0)
    1ad8:	4711                	li	a4,4
    1ada:	00450693          	add	a3,a0,4
    1ade:	02f77563          	bgeu	a4,a5,1b08 <strncpy+0xfa>
    1ae2:	00050223          	sb	zero,4(a0)
    1ae6:	4715                	li	a4,5
    1ae8:	00550693          	add	a3,a0,5
    1aec:	00e78e63          	beq	a5,a4,1b08 <strncpy+0xfa>
    1af0:	fff50713          	add	a4,a0,-1
    1af4:	000502a3          	sb	zero,5(a0)
    1af8:	8b1d                	and	a4,a4,7
    1afa:	12071263          	bnez	a4,1c1e <strncpy+0x210>
    1afe:	00750693          	add	a3,a0,7
    1b02:	00050323          	sb	zero,6(a0)
    1b06:	471d                	li	a4,7
    1b08:	40f80833          	sub	a6,a6,a5
    1b0c:	ff887593          	and	a1,a6,-8
    1b10:	97aa                	add	a5,a5,a0
    1b12:	95be                	add	a1,a1,a5
    1b14:	0007b023          	sd	zero,0(a5)
    1b18:	07a1                	add	a5,a5,8
    1b1a:	feb79de3          	bne	a5,a1,1b14 <strncpy+0x106>
    1b1e:	ff887593          	and	a1,a6,-8
    1b22:	00787813          	and	a6,a6,7
    1b26:	00e587bb          	addw	a5,a1,a4
    1b2a:	00b68733          	add	a4,a3,a1
    1b2e:	0e080063          	beqz	a6,1c0e <strncpy+0x200>
    1b32:	00070023          	sb	zero,0(a4)
    1b36:	0017869b          	addw	a3,a5,1
    1b3a:	f4c6f9e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b3e:	000700a3          	sb	zero,1(a4)
    1b42:	0027869b          	addw	a3,a5,2
    1b46:	f4c6f3e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b4a:	00070123          	sb	zero,2(a4)
    1b4e:	0037869b          	addw	a3,a5,3
    1b52:	f2c6fde3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b56:	000701a3          	sb	zero,3(a4)
    1b5a:	0047869b          	addw	a3,a5,4
    1b5e:	f2c6f7e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b62:	00070223          	sb	zero,4(a4)
    1b66:	0057869b          	addw	a3,a5,5
    1b6a:	f2c6f1e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b6e:	000702a3          	sb	zero,5(a4)
    1b72:	0067869b          	addw	a3,a5,6
    1b76:	f0c6fbe3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b7a:	00070323          	sb	zero,6(a4)
    1b7e:	0077869b          	addw	a3,a5,7
    1b82:	f0c6f5e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b86:	000703a3          	sb	zero,7(a4)
    1b8a:	0087869b          	addw	a3,a5,8
    1b8e:	eec6ffe3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b92:	00070423          	sb	zero,8(a4)
    1b96:	0097869b          	addw	a3,a5,9
    1b9a:	eec6f9e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1b9e:	000704a3          	sb	zero,9(a4)
    1ba2:	00a7869b          	addw	a3,a5,10
    1ba6:	eec6f3e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1baa:	00070523          	sb	zero,10(a4)
    1bae:	00b7869b          	addw	a3,a5,11
    1bb2:	ecc6fde3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1bb6:	000705a3          	sb	zero,11(a4)
    1bba:	00c7869b          	addw	a3,a5,12
    1bbe:	ecc6f7e3          	bgeu	a3,a2,1a8c <strncpy+0x7e>
    1bc2:	00070623          	sb	zero,12(a4)
    1bc6:	27b5                	addw	a5,a5,13
    1bc8:	ecc7f2e3          	bgeu	a5,a2,1a8c <strncpy+0x7e>
    1bcc:	000706a3          	sb	zero,13(a4)
}
    1bd0:	8082                	ret
    1bd2:	46ad                	li	a3,11
    1bd4:	bde1                	j	1aac <strncpy+0x9e>
    1bd6:	00778693          	add	a3,a5,7
    1bda:	48ad                	li	a7,11
    1bdc:	fff60593          	add	a1,a2,-1
    1be0:	ed16f6e3          	bgeu	a3,a7,1aac <strncpy+0x9e>
    1be4:	b7fd                	j	1bd2 <strncpy+0x1c4>
    1be6:	40a00733          	neg	a4,a0
    1bea:	8832                	mv	a6,a2
    1bec:	00777793          	and	a5,a4,7
    1bf0:	4581                	li	a1,0
    1bf2:	ea0608e3          	beqz	a2,1aa2 <strncpy+0x94>
    1bf6:	b7c5                	j	1bd6 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf8:	00350693          	add	a3,a0,3
    1bfc:	470d                	li	a4,3
    1bfe:	b729                	j	1b08 <strncpy+0xfa>
    1c00:	00150693          	add	a3,a0,1
    1c04:	4705                	li	a4,1
    1c06:	b709                	j	1b08 <strncpy+0xfa>
tail:
    1c08:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0a:	4701                	li	a4,0
    1c0c:	bdf5                	j	1b08 <strncpy+0xfa>
    1c0e:	8082                	ret
tail:
    1c10:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c12:	4781                	li	a5,0
    1c14:	bf39                	j	1b32 <strncpy+0x124>
    1c16:	00250693          	add	a3,a0,2
    1c1a:	4709                	li	a4,2
    1c1c:	b5f5                	j	1b08 <strncpy+0xfa>
    1c1e:	00650693          	add	a3,a0,6
    1c22:	4719                	li	a4,6
    1c24:	b5d5                	j	1b08 <strncpy+0xfa>
    1c26:	8082                	ret

0000000000001c28 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c28:	87aa                	mv	a5,a0
    1c2a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c2c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c30:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c34:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c36:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c38:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <openat>:
    register long a7 __asm__("a7") = n;
    1c40:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c44:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c48:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <close>:
    register long a7 __asm__("a7") = n;
    1c50:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c54:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <read>:
    register long a7 __asm__("a7") = n;
    1c5c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c60:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c64:	8082                	ret

0000000000001c66 <write>:
    register long a7 __asm__("a7") = n;
    1c66:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c6e:	8082                	ret

0000000000001c70 <getpid>:
    register long a7 __asm__("a7") = n;
    1c70:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c74:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <getppid>:
    register long a7 __asm__("a7") = n;
    1c7c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c88:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c8c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <fork>:
    register long a7 __asm__("a7") = n;
    1c94:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c98:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c9c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ca4:	85b2                	mv	a1,a2
    1ca6:	863a                	mv	a2,a4
    if (stack)
    1ca8:	c191                	beqz	a1,1cac <clone+0x8>
	stack += stack_size;
    1caa:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cac:	4781                	li	a5,0
    1cae:	4701                	li	a4,0
    1cb0:	4681                	li	a3,0
    1cb2:	2601                	sext.w	a2,a2
    1cb4:	ac01                	j	1ec4 <__clone>

0000000000001cb6 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cb6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cba:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cbe:	8082                	ret

0000000000001cc0 <exit>:
    register long a7 __asm__("a7") = n;
    1cc0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc4:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cc8:	8082                	ret

0000000000001cca <waitpid>:
    register long a7 __asm__("a7") = n;
    1cca:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cce:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <exec>:
    register long a7 __asm__("a7") = n;
    1cd8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <execve>:
    register long a7 __asm__("a7") = n;
    1ce4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce8:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <times>:
    register long a7 __asm__("a7") = n;
    1cf0:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf4:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <get_time>:

int64 get_time()
{
    1cfc:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cfe:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d02:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d04:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d06:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	ed09                	bnez	a0,1d26 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d0e:	67a2                	ld	a5,8(sp)
    1d10:	3e800713          	li	a4,1000
    1d14:	00015503          	lhu	a0,0(sp)
    1d18:	02e7d7b3          	divu	a5,a5,a4
    1d1c:	02e50533          	mul	a0,a0,a4
    1d20:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d22:	0141                	add	sp,sp,16
    1d24:	8082                	ret
        return -1;
    1d26:	557d                	li	a0,-1
    1d28:	bfed                	j	1d22 <get_time+0x26>

0000000000001d2a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <time>:
    register long a7 __asm__("a7") = n;
    1d36:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <sleep>:

int sleep(unsigned long long time)
{
    1d42:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d44:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d46:	850a                	mv	a0,sp
    1d48:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d4e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d54:	e501                	bnez	a0,1d5c <sleep+0x1a>
    return 0;
    1d56:	4501                	li	a0,0
}
    1d58:	0141                	add	sp,sp,16
    1d5a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5c:	4502                	lw	a0,0(sp)
}
    1d5e:	0141                	add	sp,sp,16
    1d60:	8082                	ret

0000000000001d62 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d62:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d6e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d72:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d76:	8082                	ret

0000000000001d78 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d78:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7c:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <munmap>:
    register long a7 __asm__("a7") = n;
    1d84:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <wait>:

int wait(int *code)
{
    1d90:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d92:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d96:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d98:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d9a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <spawn>:
    register long a7 __asm__("a7") = n;
    1da4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mailread>:
    register long a7 __asm__("a7") = n;
    1db0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dbc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dd4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dd6:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dda:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dea:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dec:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dfa:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <link>:

int link(char *old_path, char *new_path)
{
    1e04:	87aa                	mv	a5,a0
    1e06:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e08:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e10:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e12:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e16:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e18:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <unlink>:

int unlink(char *path)
{
    1e20:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e22:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e26:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e2a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <uname>:
    register long a7 __asm__("a7") = n;
    1e34:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <brk>:
    register long a7 __asm__("a7") = n;
    1e40:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e4c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e52:	8082                	ret

0000000000001e54 <chdir>:
    register long a7 __asm__("a7") = n;
    1e54:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e60:	862e                	mv	a2,a1
    1e62:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e64:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e66:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e70:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e72:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <getdents>:
    register long a7 __asm__("a7") = n;
    1e7a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <pipe>:
    register long a7 __asm__("a7") = n;
    1e86:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <dup>:
    register long a7 __asm__("a7") = n;
    1e94:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e96:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <dup2>:
    register long a7 __asm__("a7") = n;
    1e9e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <mount>:
    register long a7 __asm__("a7") = n;
    1eaa:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eae:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <umount>:
    register long a7 __asm__("a7") = n;
    1eb6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ec6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eca:	8532                	mv	a0,a2
	mv a2, a4
    1ecc:	863a                	mv	a2,a4
	mv a3, a5
    1ece:	86be                	mv	a3,a5
	mv a4, a6
    1ed0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed2:	0dc00893          	li	a7,220
	ecall
    1ed6:	00000073          	ecall

	beqz a0, 1f
    1eda:	c111                	beqz	a0,1ede <__clone+0x1a>
	# Parent
	ret
    1edc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ede:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee0:	6522                	ld	a0,8(sp)
	jalr a1
    1ee2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee4:	05d00893          	li	a7,93
	ecall
    1ee8:	00000073          	ecall
