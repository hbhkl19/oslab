
/home/hbh/oslab/oslab/user/build/riscv64/read:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a06d                	j	10ac <__start_main>

0000000000001004 <test_read>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_read() {
    1004:	712d                	add	sp,sp,-288
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ee250513          	add	a0,a0,-286 # 1ee8 <__clone+0x2e>
void test_read() {
    100e:	ee06                	sd	ra,280(sp)
    1010:	ea22                	sd	s0,272(sp)
	TEST_START(__func__);
    1012:	2f2000ef          	jal	1304 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f5a50513          	add	a0,a0,-166 # 1f70 <__func__.0>
    101e:	2e6000ef          	jal	1304 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ede50513          	add	a0,a0,-290 # 1f00 <__clone+0x46>
    102a:	2da000ef          	jal	1304 <puts>
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	ee050513          	add	a0,a0,-288 # 1f10 <__clone+0x56>
    1038:	3e7000ef          	jal	1c1e <open>
	char buf[256];
	int size = read(fd, buf, 256);
    103c:	10000613          	li	a2,256
    1040:	080c                	add	a1,sp,16
	int fd = open("./text.txt", 0);
    1042:	842a                	mv	s0,a0
	int size = read(fd, buf, 256);
    1044:	40f000ef          	jal	1c52 <read>
    1048:	0005061b          	sext.w	a2,a0
	assert(size >= 0);
    104c:	02064f63          	bltz	a2,108a <test_read+0x86>

	write(STDOUT, buf, size);
    1050:	080c                	add	a1,sp,16
    1052:	4505                	li	a0,1
    1054:	409000ef          	jal	1c5c <write>
	close(fd);
    1058:	8522                	mv	a0,s0
    105a:	3ed000ef          	jal	1c46 <close>
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	ee250513          	add	a0,a0,-286 # 1f40 <__clone+0x86>
    1066:	29e000ef          	jal	1304 <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	f0650513          	add	a0,a0,-250 # 1f70 <__func__.0>
    1072:	292000ef          	jal	1304 <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	e8a50513          	add	a0,a0,-374 # 1f00 <__clone+0x46>
    107e:	286000ef          	jal	1304 <puts>
}
    1082:	60f2                	ld	ra,280(sp)
    1084:	6452                	ld	s0,272(sp)
    1086:	6115                	add	sp,sp,288
    1088:	8082                	ret
	assert(size >= 0);
    108a:	00001517          	auipc	a0,0x1
    108e:	e9650513          	add	a0,a0,-362 # 1f20 <__clone+0x66>
    1092:	e432                	sd	a2,8(sp)
    1094:	50c000ef          	jal	15a0 <panic>
    1098:	6622                	ld	a2,8(sp)
    109a:	bf5d                	j	1050 <test_read+0x4c>

000000000000109c <main>:

int main(void) {
    109c:	1141                	add	sp,sp,-16
    109e:	e406                	sd	ra,8(sp)
	test_read();
    10a0:	f65ff0ef          	jal	1004 <test_read>
	return 0;
}
    10a4:	60a2                	ld	ra,8(sp)
    10a6:	4501                	li	a0,0
    10a8:	0141                	add	sp,sp,16
    10aa:	8082                	ret

00000000000010ac <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ac:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ae:	4108                	lw	a0,0(a0)
{
    10b0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10b2:	05a1                	add	a1,a1,8
{
    10b4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b6:	fe7ff0ef          	jal	109c <main>
    10ba:	3fd000ef          	jal	1cb6 <exit>
	return 0;
}
    10be:	60a2                	ld	ra,8(sp)
    10c0:	4501                	li	a0,0
    10c2:	0141                	add	sp,sp,16
    10c4:	8082                	ret

00000000000010c6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c6:	7179                	add	sp,sp,-48
    10c8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ca:	12054863          	bltz	a0,11fa <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ce:	02b577bb          	remuw	a5,a0,a1
    10d2:	00001697          	auipc	a3,0x1
    10d6:	eae68693          	add	a3,a3,-338 # 1f80 <digits>
    buf[16] = 0;
    10da:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10de:	0005871b          	sext.w	a4,a1
    10e2:	1782                	sll	a5,a5,0x20
    10e4:	9381                	srl	a5,a5,0x20
    10e6:	97b6                	add	a5,a5,a3
    10e8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ec:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f4:	1ab56663          	bltu	a0,a1,12a0 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10f8:	02e8763b          	remuw	a2,a6,a4
    10fc:	1602                	sll	a2,a2,0x20
    10fe:	9201                	srl	a2,a2,0x20
    1100:	9636                	add	a2,a2,a3
    1102:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1106:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    110a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    110e:	12e86c63          	bltu	a6,a4,1246 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1112:	02e5f63b          	remuw	a2,a1,a4
    1116:	1602                	sll	a2,a2,0x20
    1118:	9201                	srl	a2,a2,0x20
    111a:	9636                	add	a2,a2,a3
    111c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1120:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1124:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1128:	12e5e863          	bltu	a1,a4,1258 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    112c:	02e8763b          	remuw	a2,a6,a4
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1142:	12e86463          	bltu	a6,a4,126a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1146:	02e5f63b          	remuw	a2,a1,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1158:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    115c:	12e5e063          	bltu	a1,a4,127c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1160:	02e8763b          	remuw	a2,a6,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1172:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1176:	0ae86f63          	bltu	a6,a4,1234 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    117a:	02e5f63b          	remuw	a2,a1,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1190:	0ee5ef63          	bltu	a1,a4,128e <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1194:	02e8763b          	remuw	a2,a6,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11aa:	0ee86d63          	bltu	a6,a4,12a4 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11ae:	02e5f63b          	remuw	a2,a1,a4
    11b2:	1602                	sll	a2,a2,0x20
    11b4:	9201                	srl	a2,a2,0x20
    11b6:	9636                	add	a2,a2,a3
    11b8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11bc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c4:	0ee5e963          	bltu	a1,a4,12b6 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11c8:	1782                	sll	a5,a5,0x20
    11ca:	9381                	srl	a5,a5,0x20
    11cc:	96be                	add	a3,a3,a5
    11ce:	0006c783          	lbu	a5,0(a3)
    11d2:	4599                	li	a1,6
    11d4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11d8:	00055763          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11dc:	02d00793          	li	a5,45
    11e0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11e4:	4595                	li	a1,5
    write(f, s, l);
    11e6:	003c                	add	a5,sp,8
    11e8:	4641                	li	a2,16
    11ea:	9e0d                	subw	a2,a2,a1
    11ec:	4505                	li	a0,1
    11ee:	95be                	add	a1,a1,a5
    11f0:	26d000ef          	jal	1c5c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f4:	70a2                	ld	ra,40(sp)
    11f6:	6145                	add	sp,sp,48
    11f8:	8082                	ret
        x = -xx;
    11fa:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11fe:	02b677bb          	remuw	a5,a2,a1
    1202:	00001697          	auipc	a3,0x1
    1206:	d7e68693          	add	a3,a3,-642 # 1f80 <digits>
    buf[16] = 0;
    120a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    120e:	0005871b          	sext.w	a4,a1
    1212:	1782                	sll	a5,a5,0x20
    1214:	9381                	srl	a5,a5,0x20
    1216:	97b6                	add	a5,a5,a3
    1218:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1220:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1224:	ecb67ae3          	bgeu	a2,a1,10f8 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1230:	45b9                	li	a1,14
    1232:	bf55                	j	11e6 <printint.constprop.0+0x120>
    1234:	45a9                	li	a1,10
    if (sign)
    1236:	fa0558e3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1242:	45a5                	li	a1,9
    1244:	b74d                	j	11e6 <printint.constprop.0+0x120>
    1246:	45b9                	li	a1,14
    if (sign)
    1248:	f8055fe3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1254:	45b5                	li	a1,13
    1256:	bf41                	j	11e6 <printint.constprop.0+0x120>
    1258:	45b5                	li	a1,13
    if (sign)
    125a:	f80556e3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1266:	45b1                	li	a1,12
    1268:	bfbd                	j	11e6 <printint.constprop.0+0x120>
    126a:	45b1                	li	a1,12
    if (sign)
    126c:	f6055de3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1278:	45ad                	li	a1,11
    127a:	b7b5                	j	11e6 <printint.constprop.0+0x120>
    127c:	45ad                	li	a1,11
    if (sign)
    127e:	f60554e3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    128a:	45a9                	li	a1,10
    128c:	bfa9                	j	11e6 <printint.constprop.0+0x120>
    128e:	45a5                	li	a1,9
    if (sign)
    1290:	f4055be3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    129c:	45a1                	li	a1,8
    129e:	b7a1                	j	11e6 <printint.constprop.0+0x120>
    i = 15;
    12a0:	45bd                	li	a1,15
    12a2:	b791                	j	11e6 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12a4:	45a1                	li	a1,8
    if (sign)
    12a6:	f40550e3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12b2:	459d                	li	a1,7
    12b4:	bf0d                	j	11e6 <printint.constprop.0+0x120>
    12b6:	459d                	li	a1,7
    if (sign)
    12b8:	f20557e3          	bgez	a0,11e6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12c4:	4599                	li	a1,6
    12c6:	b705                	j	11e6 <printint.constprop.0+0x120>

00000000000012c8 <getchar>:
{
    12c8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ca:	00f10593          	add	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4501                	li	a0,0
{
    12d2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d8:	17b000ef          	jal	1c52 <read>
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	00f14503          	lbu	a0,15(sp)
    12e2:	6105                	add	sp,sp,32
    12e4:	8082                	ret

00000000000012e6 <putchar>:
{
    12e6:	1101                	add	sp,sp,-32
    12e8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ea:	00f10593          	add	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4505                	li	a0,1
{
    12f2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f8:	165000ef          	jal	1c5c <write>
}
    12fc:	60e2                	ld	ra,24(sp)
    12fe:	2501                	sext.w	a0,a0
    1300:	6105                	add	sp,sp,32
    1302:	8082                	ret

0000000000001304 <puts>:
{
    1304:	1141                	add	sp,sp,-16
    1306:	e406                	sd	ra,8(sp)
    1308:	e022                	sd	s0,0(sp)
    130a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    130c:	574000ef          	jal	1880 <strlen>
    1310:	862a                	mv	a2,a0
    1312:	85a2                	mv	a1,s0
    1314:	4505                	li	a0,1
    1316:	147000ef          	jal	1c5c <write>
}
    131a:	60a2                	ld	ra,8(sp)
    131c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    131e:	957d                	sra	a0,a0,0x3f
    return r;
    1320:	2501                	sext.w	a0,a0
}
    1322:	0141                	add	sp,sp,16
    1324:	8082                	ret

0000000000001326 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1326:	7171                	add	sp,sp,-176
    1328:	f85a                	sd	s6,48(sp)
    132a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    132c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    132e:	18bc                	add	a5,sp,120
{
    1330:	e8ca                	sd	s2,80(sp)
    1332:	e4ce                	sd	s3,72(sp)
    1334:	e0d2                	sd	s4,64(sp)
    1336:	fc56                	sd	s5,56(sp)
    1338:	f486                	sd	ra,104(sp)
    133a:	f0a2                	sd	s0,96(sp)
    133c:	eca6                	sd	s1,88(sp)
    133e:	fcae                	sd	a1,120(sp)
    1340:	e132                	sd	a2,128(sp)
    1342:	e536                	sd	a3,136(sp)
    1344:	e93a                	sd	a4,144(sp)
    1346:	f142                	sd	a6,160(sp)
    1348:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    134a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    134c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1350:	07300a13          	li	s4,115
    1354:	07800a93          	li	s5,120
    buf[i++] = '0';
    1358:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135c:	00001997          	auipc	s3,0x1
    1360:	c2498993          	add	s3,s3,-988 # 1f80 <digits>
        if (!*s)
    1364:	00054783          	lbu	a5,0(a0)
    1368:	16078a63          	beqz	a5,14dc <printf+0x1b6>
    136c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136e:	19278d63          	beq	a5,s2,1508 <printf+0x1e2>
    1372:	00164783          	lbu	a5,1(a2)
    1376:	0605                	add	a2,a2,1
    1378:	fbfd                	bnez	a5,136e <printf+0x48>
    137a:	84b2                	mv	s1,a2
        l = z - a;
    137c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1380:	85aa                	mv	a1,a0
    1382:	8622                	mv	a2,s0
    1384:	4505                	li	a0,1
    1386:	0d7000ef          	jal	1c5c <write>
        if (l)
    138a:	1a041463          	bnez	s0,1532 <printf+0x20c>
        if (s[1] == 0)
    138e:	0014c783          	lbu	a5,1(s1)
    1392:	14078563          	beqz	a5,14dc <printf+0x1b6>
        switch (s[1])
    1396:	1b478063          	beq	a5,s4,1536 <printf+0x210>
    139a:	14fa6b63          	bltu	s4,a5,14f0 <printf+0x1ca>
    139e:	06400713          	li	a4,100
    13a2:	1ee78063          	beq	a5,a4,1582 <printf+0x25c>
    13a6:	07000713          	li	a4,112
    13aa:	1ae79963          	bne	a5,a4,155c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13ae:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13b4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b6:	631c                	ld	a5,0(a4)
    13b8:	0721                	add	a4,a4,8
    13ba:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13bc:	00479293          	sll	t0,a5,0x4
    13c0:	00879f93          	sll	t6,a5,0x8
    13c4:	00c79f13          	sll	t5,a5,0xc
    13c8:	01079e93          	sll	t4,a5,0x10
    13cc:	01479e13          	sll	t3,a5,0x14
    13d0:	01879313          	sll	t1,a5,0x18
    13d4:	01c79893          	sll	a7,a5,0x1c
    13d8:	02479813          	sll	a6,a5,0x24
    13dc:	02879513          	sll	a0,a5,0x28
    13e0:	02c79593          	sll	a1,a5,0x2c
    13e4:	03079693          	sll	a3,a5,0x30
    13e8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ec:	03c7d413          	srl	s0,a5,0x3c
    13f0:	01c7d39b          	srlw	t2,a5,0x1c
    13f4:	03c2d293          	srl	t0,t0,0x3c
    13f8:	03cfdf93          	srl	t6,t6,0x3c
    13fc:	03cf5f13          	srl	t5,t5,0x3c
    1400:	03cede93          	srl	t4,t4,0x3c
    1404:	03ce5e13          	srl	t3,t3,0x3c
    1408:	03c35313          	srl	t1,t1,0x3c
    140c:	03c8d893          	srl	a7,a7,0x3c
    1410:	03c85813          	srl	a6,a6,0x3c
    1414:	9171                	srl	a0,a0,0x3c
    1416:	91f1                	srl	a1,a1,0x3c
    1418:	92f1                	srl	a3,a3,0x3c
    141a:	9371                	srl	a4,a4,0x3c
    141c:	96ce                	add	a3,a3,s3
    141e:	974e                	add	a4,a4,s3
    1420:	944e                	add	s0,s0,s3
    1422:	92ce                	add	t0,t0,s3
    1424:	9fce                	add	t6,t6,s3
    1426:	9f4e                	add	t5,t5,s3
    1428:	9ece                	add	t4,t4,s3
    142a:	9e4e                	add	t3,t3,s3
    142c:	934e                	add	t1,t1,s3
    142e:	98ce                	add	a7,a7,s3
    1430:	93ce                	add	t2,t2,s3
    1432:	984e                	add	a6,a6,s3
    1434:	954e                	add	a0,a0,s3
    1436:	95ce                	add	a1,a1,s3
    1438:	0006c083          	lbu	ra,0(a3)
    143c:	0002c283          	lbu	t0,0(t0)
    1440:	00074683          	lbu	a3,0(a4)
    1444:	000fcf83          	lbu	t6,0(t6)
    1448:	000f4f03          	lbu	t5,0(t5)
    144c:	000ece83          	lbu	t4,0(t4)
    1450:	000e4e03          	lbu	t3,0(t3)
    1454:	00034303          	lbu	t1,0(t1)
    1458:	0008c883          	lbu	a7,0(a7)
    145c:	0003c383          	lbu	t2,0(t2)
    1460:	00084803          	lbu	a6,0(a6)
    1464:	00054503          	lbu	a0,0(a0)
    1468:	0005c583          	lbu	a1,0(a1)
    146c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1470:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1474:	9371                	srl	a4,a4,0x3c
    1476:	8bbd                	and	a5,a5,15
    1478:	974e                	add	a4,a4,s3
    147a:	97ce                	add	a5,a5,s3
    147c:	005105a3          	sb	t0,11(sp)
    1480:	01f10623          	sb	t6,12(sp)
    1484:	01e106a3          	sb	t5,13(sp)
    1488:	01d10723          	sb	t4,14(sp)
    148c:	01c107a3          	sb	t3,15(sp)
    1490:	00610823          	sb	t1,16(sp)
    1494:	011108a3          	sb	a7,17(sp)
    1498:	00710923          	sb	t2,18(sp)
    149c:	010109a3          	sb	a6,19(sp)
    14a0:	00a10a23          	sb	a0,20(sp)
    14a4:	00b10aa3          	sb	a1,21(sp)
    14a8:	00110b23          	sb	ra,22(sp)
    14ac:	00d10ba3          	sb	a3,23(sp)
    14b0:	00810523          	sb	s0,10(sp)
    14b4:	00074703          	lbu	a4,0(a4)
    14b8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14bc:	002c                	add	a1,sp,8
    14be:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c0:	00e10c23          	sb	a4,24(sp)
    14c4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14cc:	790000ef          	jal	1c5c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d0:	00248513          	add	a0,s1,2
        if (!*s)
    14d4:	00054783          	lbu	a5,0(a0)
    14d8:	e8079ae3          	bnez	a5,136c <printf+0x46>
    }
    va_end(ap);
}
    14dc:	70a6                	ld	ra,104(sp)
    14de:	7406                	ld	s0,96(sp)
    14e0:	64e6                	ld	s1,88(sp)
    14e2:	6946                	ld	s2,80(sp)
    14e4:	69a6                	ld	s3,72(sp)
    14e6:	6a06                	ld	s4,64(sp)
    14e8:	7ae2                	ld	s5,56(sp)
    14ea:	7b42                	ld	s6,48(sp)
    14ec:	614d                	add	sp,sp,176
    14ee:	8082                	ret
        switch (s[1])
    14f0:	07579663          	bne	a5,s5,155c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14f4:	6782                	ld	a5,0(sp)
    14f6:	45c1                	li	a1,16
    14f8:	4388                	lw	a0,0(a5)
    14fa:	07a1                	add	a5,a5,8
    14fc:	e03e                	sd	a5,0(sp)
    14fe:	bc9ff0ef          	jal	10c6 <printint.constprop.0>
        s += 2;
    1502:	00248513          	add	a0,s1,2
    1506:	b7f9                	j	14d4 <printf+0x1ae>
    1508:	84b2                	mv	s1,a2
    150a:	a039                	j	1518 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    150c:	0024c783          	lbu	a5,2(s1)
    1510:	0605                	add	a2,a2,1
    1512:	0489                	add	s1,s1,2
    1514:	e72794e3          	bne	a5,s2,137c <printf+0x56>
    1518:	0014c783          	lbu	a5,1(s1)
    151c:	ff2788e3          	beq	a5,s2,150c <printf+0x1e6>
        l = z - a;
    1520:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1524:	85aa                	mv	a1,a0
    1526:	8622                	mv	a2,s0
    1528:	4505                	li	a0,1
    152a:	732000ef          	jal	1c5c <write>
        if (l)
    152e:	e60400e3          	beqz	s0,138e <printf+0x68>
    1532:	8526                	mv	a0,s1
    1534:	bd05                	j	1364 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1536:	6782                	ld	a5,0(sp)
    1538:	6380                	ld	s0,0(a5)
    153a:	07a1                	add	a5,a5,8
    153c:	e03e                	sd	a5,0(sp)
    153e:	cc21                	beqz	s0,1596 <printf+0x270>
            l = strnlen(a, 200);
    1540:	0c800593          	li	a1,200
    1544:	8522                	mv	a0,s0
    1546:	424000ef          	jal	196a <strnlen>
    write(f, s, l);
    154a:	0005061b          	sext.w	a2,a0
    154e:	85a2                	mv	a1,s0
    1550:	4505                	li	a0,1
    1552:	70a000ef          	jal	1c5c <write>
        s += 2;
    1556:	00248513          	add	a0,s1,2
    155a:	bfad                	j	14d4 <printf+0x1ae>
    return write(stdout, &byte, 1);
    155c:	4605                	li	a2,1
    155e:	002c                	add	a1,sp,8
    1560:	4505                	li	a0,1
    char byte = c;
    1562:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1566:	6f6000ef          	jal	1c5c <write>
    char byte = c;
    156a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    156e:	4605                	li	a2,1
    1570:	002c                	add	a1,sp,8
    1572:	4505                	li	a0,1
    char byte = c;
    1574:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1578:	6e4000ef          	jal	1c5c <write>
        s += 2;
    157c:	00248513          	add	a0,s1,2
    1580:	bf91                	j	14d4 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1582:	6782                	ld	a5,0(sp)
    1584:	45a9                	li	a1,10
    1586:	4388                	lw	a0,0(a5)
    1588:	07a1                	add	a5,a5,8
    158a:	e03e                	sd	a5,0(sp)
    158c:	b3bff0ef          	jal	10c6 <printint.constprop.0>
        s += 2;
    1590:	00248513          	add	a0,s1,2
    1594:	b781                	j	14d4 <printf+0x1ae>
                a = "(null)";
    1596:	00001417          	auipc	s0,0x1
    159a:	9ba40413          	add	s0,s0,-1606 # 1f50 <__clone+0x96>
    159e:	b74d                	j	1540 <printf+0x21a>

00000000000015a0 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a0:	1141                	add	sp,sp,-16
    15a2:	e406                	sd	ra,8(sp)
    puts(m);
    15a4:	d61ff0ef          	jal	1304 <puts>
    exit(-100);
}
    15a8:	60a2                	ld	ra,8(sp)
    exit(-100);
    15aa:	f9c00513          	li	a0,-100
}
    15ae:	0141                	add	sp,sp,16
    exit(-100);
    15b0:	a719                	j	1cb6 <exit>

00000000000015b2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b2:	02000793          	li	a5,32
    15b6:	00f50663          	beq	a0,a5,15c2 <isspace+0x10>
    15ba:	355d                	addw	a0,a0,-9
    15bc:	00553513          	sltiu	a0,a0,5
    15c0:	8082                	ret
    15c2:	4505                	li	a0,1
}
    15c4:	8082                	ret

00000000000015c6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c6:	fd05051b          	addw	a0,a0,-48
}
    15ca:	00a53513          	sltiu	a0,a0,10
    15ce:	8082                	ret

00000000000015d0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d0:	02000693          	li	a3,32
    15d4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	ff77871b          	addw	a4,a5,-9
    15de:	04d78c63          	beq	a5,a3,1636 <atoi+0x66>
    15e2:	0007861b          	sext.w	a2,a5
    15e6:	04e5f863          	bgeu	a1,a4,1636 <atoi+0x66>
        s++;
    switch (*s)
    15ea:	02b00713          	li	a4,43
    15ee:	04e78963          	beq	a5,a4,1640 <atoi+0x70>
    15f2:	02d00713          	li	a4,45
    15f6:	06e78263          	beq	a5,a4,165a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fa:	fd06069b          	addw	a3,a2,-48
    15fe:	47a5                	li	a5,9
    1600:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1602:	4301                	li	t1,0
    while (isdigit(*s))
    1604:	04d7e963          	bltu	a5,a3,1656 <atoi+0x86>
    int n = 0, neg = 0;
    1608:	4501                	li	a0,0
    while (isdigit(*s))
    160a:	48a5                	li	a7,9
    160c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1610:	0025179b          	sllw	a5,a0,0x2
    1614:	9fa9                	addw	a5,a5,a0
    1616:	fd06059b          	addw	a1,a2,-48
    161a:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    161e:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1622:	0705                	add	a4,a4,1
    1624:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1628:	0006861b          	sext.w	a2,a3
    162c:	ff08f0e3          	bgeu	a7,a6,160c <atoi+0x3c>
    return neg ? n : -n;
    1630:	00030563          	beqz	t1,163a <atoi+0x6a>
}
    1634:	8082                	ret
        s++;
    1636:	0505                	add	a0,a0,1
    1638:	bf79                	j	15d6 <atoi+0x6>
    return neg ? n : -n;
    163a:	40f5853b          	subw	a0,a1,a5
    163e:	8082                	ret
    while (isdigit(*s))
    1640:	00154603          	lbu	a2,1(a0)
    1644:	47a5                	li	a5,9
        s++;
    1646:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    164a:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    164e:	4301                	li	t1,0
    while (isdigit(*s))
    1650:	2601                	sext.w	a2,a2
    1652:	fad7fbe3          	bgeu	a5,a3,1608 <atoi+0x38>
    1656:	4501                	li	a0,0
}
    1658:	8082                	ret
    while (isdigit(*s))
    165a:	00154603          	lbu	a2,1(a0)
    165e:	47a5                	li	a5,9
        s++;
    1660:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1664:	fd06069b          	addw	a3,a2,-48
    1668:	2601                	sext.w	a2,a2
    166a:	fed7e6e3          	bltu	a5,a3,1656 <atoi+0x86>
        neg = 1;
    166e:	4305                	li	t1,1
    1670:	bf61                	j	1608 <atoi+0x38>

0000000000001672 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1672:	18060163          	beqz	a2,17f4 <memset+0x182>
    1676:	40a006b3          	neg	a3,a0
    167a:	0076f793          	and	a5,a3,7
    167e:	00778813          	add	a6,a5,7
    1682:	48ad                	li	a7,11
    1684:	0ff5f713          	zext.b	a4,a1
    1688:	fff60593          	add	a1,a2,-1
    168c:	17186563          	bltu	a6,a7,17f6 <memset+0x184>
    1690:	1705ed63          	bltu	a1,a6,180a <memset+0x198>
    1694:	16078363          	beqz	a5,17fa <memset+0x188>
    1698:	00e50023          	sb	a4,0(a0)
    169c:	0066f593          	and	a1,a3,6
    16a0:	16058063          	beqz	a1,1800 <memset+0x18e>
    16a4:	00e500a3          	sb	a4,1(a0)
    16a8:	4589                	li	a1,2
    16aa:	16f5f363          	bgeu	a1,a5,1810 <memset+0x19e>
    16ae:	00e50123          	sb	a4,2(a0)
    16b2:	8a91                	and	a3,a3,4
    16b4:	00350593          	add	a1,a0,3
    16b8:	4e0d                	li	t3,3
    16ba:	ce9d                	beqz	a3,16f8 <memset+0x86>
    16bc:	00e501a3          	sb	a4,3(a0)
    16c0:	4691                	li	a3,4
    16c2:	00450593          	add	a1,a0,4
    16c6:	4e11                	li	t3,4
    16c8:	02f6f863          	bgeu	a3,a5,16f8 <memset+0x86>
    16cc:	00e50223          	sb	a4,4(a0)
    16d0:	4695                	li	a3,5
    16d2:	00550593          	add	a1,a0,5
    16d6:	4e15                	li	t3,5
    16d8:	02d78063          	beq	a5,a3,16f8 <memset+0x86>
    16dc:	fff50693          	add	a3,a0,-1
    16e0:	00e502a3          	sb	a4,5(a0)
    16e4:	8a9d                	and	a3,a3,7
    16e6:	00650593          	add	a1,a0,6
    16ea:	4e19                	li	t3,6
    16ec:	e691                	bnez	a3,16f8 <memset+0x86>
    16ee:	00750593          	add	a1,a0,7
    16f2:	00e50323          	sb	a4,6(a0)
    16f6:	4e1d                	li	t3,7
    16f8:	00871693          	sll	a3,a4,0x8
    16fc:	01071813          	sll	a6,a4,0x10
    1700:	8ed9                	or	a3,a3,a4
    1702:	01871893          	sll	a7,a4,0x18
    1706:	0106e6b3          	or	a3,a3,a6
    170a:	0116e6b3          	or	a3,a3,a7
    170e:	02071813          	sll	a6,a4,0x20
    1712:	02871313          	sll	t1,a4,0x28
    1716:	0106e6b3          	or	a3,a3,a6
    171a:	40f608b3          	sub	a7,a2,a5
    171e:	03071813          	sll	a6,a4,0x30
    1722:	0066e6b3          	or	a3,a3,t1
    1726:	0106e6b3          	or	a3,a3,a6
    172a:	03871313          	sll	t1,a4,0x38
    172e:	97aa                	add	a5,a5,a0
    1730:	ff88f813          	and	a6,a7,-8
    1734:	0066e6b3          	or	a3,a3,t1
    1738:	983e                	add	a6,a6,a5
    173a:	e394                	sd	a3,0(a5)
    173c:	07a1                	add	a5,a5,8
    173e:	ff079ee3          	bne	a5,a6,173a <memset+0xc8>
    1742:	ff88f793          	and	a5,a7,-8
    1746:	0078f893          	and	a7,a7,7
    174a:	00f586b3          	add	a3,a1,a5
    174e:	01c787bb          	addw	a5,a5,t3
    1752:	0a088b63          	beqz	a7,1808 <memset+0x196>
    1756:	00e68023          	sb	a4,0(a3)
    175a:	0017859b          	addw	a1,a5,1
    175e:	08c5fb63          	bgeu	a1,a2,17f4 <memset+0x182>
    1762:	00e680a3          	sb	a4,1(a3)
    1766:	0027859b          	addw	a1,a5,2
    176a:	08c5f563          	bgeu	a1,a2,17f4 <memset+0x182>
    176e:	00e68123          	sb	a4,2(a3)
    1772:	0037859b          	addw	a1,a5,3
    1776:	06c5ff63          	bgeu	a1,a2,17f4 <memset+0x182>
    177a:	00e681a3          	sb	a4,3(a3)
    177e:	0047859b          	addw	a1,a5,4
    1782:	06c5f963          	bgeu	a1,a2,17f4 <memset+0x182>
    1786:	00e68223          	sb	a4,4(a3)
    178a:	0057859b          	addw	a1,a5,5
    178e:	06c5f363          	bgeu	a1,a2,17f4 <memset+0x182>
    1792:	00e682a3          	sb	a4,5(a3)
    1796:	0067859b          	addw	a1,a5,6
    179a:	04c5fd63          	bgeu	a1,a2,17f4 <memset+0x182>
    179e:	00e68323          	sb	a4,6(a3)
    17a2:	0077859b          	addw	a1,a5,7
    17a6:	04c5f763          	bgeu	a1,a2,17f4 <memset+0x182>
    17aa:	00e683a3          	sb	a4,7(a3)
    17ae:	0087859b          	addw	a1,a5,8
    17b2:	04c5f163          	bgeu	a1,a2,17f4 <memset+0x182>
    17b6:	00e68423          	sb	a4,8(a3)
    17ba:	0097859b          	addw	a1,a5,9
    17be:	02c5fb63          	bgeu	a1,a2,17f4 <memset+0x182>
    17c2:	00e684a3          	sb	a4,9(a3)
    17c6:	00a7859b          	addw	a1,a5,10
    17ca:	02c5f563          	bgeu	a1,a2,17f4 <memset+0x182>
    17ce:	00e68523          	sb	a4,10(a3)
    17d2:	00b7859b          	addw	a1,a5,11
    17d6:	00c5ff63          	bgeu	a1,a2,17f4 <memset+0x182>
    17da:	00e685a3          	sb	a4,11(a3)
    17de:	00c7859b          	addw	a1,a5,12
    17e2:	00c5f963          	bgeu	a1,a2,17f4 <memset+0x182>
    17e6:	00e68623          	sb	a4,12(a3)
    17ea:	27b5                	addw	a5,a5,13
    17ec:	00c7f463          	bgeu	a5,a2,17f4 <memset+0x182>
    17f0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f4:	8082                	ret
    17f6:	482d                	li	a6,11
    17f8:	bd61                	j	1690 <memset+0x1e>
    char *p = dest;
    17fa:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fc:	4e01                	li	t3,0
    17fe:	bded                	j	16f8 <memset+0x86>
    1800:	00150593          	add	a1,a0,1
    1804:	4e05                	li	t3,1
    1806:	bdcd                	j	16f8 <memset+0x86>
    1808:	8082                	ret
    char *p = dest;
    180a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180c:	4781                	li	a5,0
    180e:	b7a1                	j	1756 <memset+0xe4>
    1810:	00250593          	add	a1,a0,2
    1814:	4e09                	li	t3,2
    1816:	b5cd                	j	16f8 <memset+0x86>

0000000000001818 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1818:	00054783          	lbu	a5,0(a0)
    181c:	0005c703          	lbu	a4,0(a1)
    1820:	00e79863          	bne	a5,a4,1830 <strcmp+0x18>
    1824:	0505                	add	a0,a0,1
    1826:	0585                	add	a1,a1,1
    1828:	fbe5                	bnez	a5,1818 <strcmp>
    182a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182c:	9d19                	subw	a0,a0,a4
    182e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1830:	0007851b          	sext.w	a0,a5
    1834:	bfe5                	j	182c <strcmp+0x14>

0000000000001836 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1836:	ca15                	beqz	a2,186a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1838:	00054783          	lbu	a5,0(a0)
    if (!n--)
    183c:	167d                	add	a2,a2,-1
    183e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1842:	eb99                	bnez	a5,1858 <strncmp+0x22>
    1844:	a815                	j	1878 <strncmp+0x42>
    1846:	00a68e63          	beq	a3,a0,1862 <strncmp+0x2c>
    184a:	0505                	add	a0,a0,1
    184c:	00f71b63          	bne	a4,a5,1862 <strncmp+0x2c>
    1850:	00054783          	lbu	a5,0(a0)
    1854:	cf89                	beqz	a5,186e <strncmp+0x38>
    1856:	85b2                	mv	a1,a2
    1858:	0005c703          	lbu	a4,0(a1)
    185c:	00158613          	add	a2,a1,1
    1860:	f37d                	bnez	a4,1846 <strncmp+0x10>
        ;
    return *l - *r;
    1862:	0007851b          	sext.w	a0,a5
    1866:	9d19                	subw	a0,a0,a4
    1868:	8082                	ret
        return 0;
    186a:	4501                	li	a0,0
}
    186c:	8082                	ret
    return *l - *r;
    186e:	0015c703          	lbu	a4,1(a1)
    1872:	4501                	li	a0,0
    1874:	9d19                	subw	a0,a0,a4
    1876:	8082                	ret
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	4501                	li	a0,0
    187e:	b7e5                	j	1866 <strncmp+0x30>

0000000000001880 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1880:	00757793          	and	a5,a0,7
    1884:	cf89                	beqz	a5,189e <strlen+0x1e>
    1886:	87aa                	mv	a5,a0
    1888:	a029                	j	1892 <strlen+0x12>
    188a:	0785                	add	a5,a5,1
    188c:	0077f713          	and	a4,a5,7
    1890:	cb01                	beqz	a4,18a0 <strlen+0x20>
        if (!*s)
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	fb75                	bnez	a4,188a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1898:	40a78533          	sub	a0,a5,a0
}
    189c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    189e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a0:	6394                	ld	a3,0(a5)
    18a2:	00000597          	auipc	a1,0x0
    18a6:	6b65b583          	ld	a1,1718(a1) # 1f58 <__clone+0x9e>
    18aa:	00000617          	auipc	a2,0x0
    18ae:	6b663603          	ld	a2,1718(a2) # 1f60 <__clone+0xa6>
    18b2:	a019                	j	18b8 <strlen+0x38>
    18b4:	6794                	ld	a3,8(a5)
    18b6:	07a1                	add	a5,a5,8
    18b8:	00b68733          	add	a4,a3,a1
    18bc:	fff6c693          	not	a3,a3
    18c0:	8f75                	and	a4,a4,a3
    18c2:	8f71                	and	a4,a4,a2
    18c4:	db65                	beqz	a4,18b4 <strlen+0x34>
    for (; *s; s++)
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	d779                	beqz	a4,1898 <strlen+0x18>
    18cc:	0017c703          	lbu	a4,1(a5)
    18d0:	0785                	add	a5,a5,1
    18d2:	d379                	beqz	a4,1898 <strlen+0x18>
    18d4:	0017c703          	lbu	a4,1(a5)
    18d8:	0785                	add	a5,a5,1
    18da:	fb6d                	bnez	a4,18cc <strlen+0x4c>
    18dc:	bf75                	j	1898 <strlen+0x18>

00000000000018de <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18de:	00757713          	and	a4,a0,7
{
    18e2:	87aa                	mv	a5,a0
    18e4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e8:	cb19                	beqz	a4,18fe <memchr+0x20>
    18ea:	ce25                	beqz	a2,1962 <memchr+0x84>
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	00b70763          	beq	a4,a1,18fe <memchr+0x20>
    18f4:	0785                	add	a5,a5,1
    18f6:	0077f713          	and	a4,a5,7
    18fa:	167d                	add	a2,a2,-1
    18fc:	f77d                	bnez	a4,18ea <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fe:	4501                	li	a0,0
    if (n && *s != c)
    1900:	c235                	beqz	a2,1964 <memchr+0x86>
    1902:	0007c703          	lbu	a4,0(a5)
    1906:	06b70063          	beq	a4,a1,1966 <memchr+0x88>
        size_t k = ONES * c;
    190a:	00000517          	auipc	a0,0x0
    190e:	65e53503          	ld	a0,1630(a0) # 1f68 <__clone+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1912:	471d                	li	a4,7
        size_t k = ONES * c;
    1914:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1918:	04c77763          	bgeu	a4,a2,1966 <memchr+0x88>
    191c:	00000897          	auipc	a7,0x0
    1920:	63c8b883          	ld	a7,1596(a7) # 1f58 <__clone+0x9e>
    1924:	00000817          	auipc	a6,0x0
    1928:	63c83803          	ld	a6,1596(a6) # 1f60 <__clone+0xa6>
    192c:	431d                	li	t1,7
    192e:	a029                	j	1938 <memchr+0x5a>
    1930:	1661                	add	a2,a2,-8
    1932:	07a1                	add	a5,a5,8
    1934:	00c37c63          	bgeu	t1,a2,194c <memchr+0x6e>
    1938:	6398                	ld	a4,0(a5)
    193a:	8f29                	xor	a4,a4,a0
    193c:	011706b3          	add	a3,a4,a7
    1940:	fff74713          	not	a4,a4
    1944:	8f75                	and	a4,a4,a3
    1946:	01077733          	and	a4,a4,a6
    194a:	d37d                	beqz	a4,1930 <memchr+0x52>
    194c:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    194e:	e601                	bnez	a2,1956 <memchr+0x78>
    1950:	a809                	j	1962 <memchr+0x84>
    1952:	0505                	add	a0,a0,1
    1954:	c619                	beqz	a2,1962 <memchr+0x84>
    1956:	00054783          	lbu	a5,0(a0)
    195a:	167d                	add	a2,a2,-1
    195c:	feb79be3          	bne	a5,a1,1952 <memchr+0x74>
    1960:	8082                	ret
    return n ? (void *)s : 0;
    1962:	4501                	li	a0,0
}
    1964:	8082                	ret
    if (n && *s != c)
    1966:	853e                	mv	a0,a5
    1968:	b7fd                	j	1956 <memchr+0x78>

000000000000196a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    196a:	1101                	add	sp,sp,-32
    196c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    196e:	862e                	mv	a2,a1
{
    1970:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1972:	4581                	li	a1,0
{
    1974:	e426                	sd	s1,8(sp)
    1976:	ec06                	sd	ra,24(sp)
    1978:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    197a:	f65ff0ef          	jal	18de <memchr>
    return p ? p - s : n;
    197e:	c519                	beqz	a0,198c <strnlen+0x22>
}
    1980:	60e2                	ld	ra,24(sp)
    1982:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1984:	8d05                	sub	a0,a0,s1
}
    1986:	64a2                	ld	s1,8(sp)
    1988:	6105                	add	sp,sp,32
    198a:	8082                	ret
    198c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    198e:	8522                	mv	a0,s0
}
    1990:	6442                	ld	s0,16(sp)
    1992:	64a2                	ld	s1,8(sp)
    1994:	6105                	add	sp,sp,32
    1996:	8082                	ret

0000000000001998 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1998:	00a5c7b3          	xor	a5,a1,a0
    199c:	8b9d                	and	a5,a5,7
    199e:	eb95                	bnez	a5,19d2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19a0:	0075f793          	and	a5,a1,7
    19a4:	e7b1                	bnez	a5,19f0 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a6:	6198                	ld	a4,0(a1)
    19a8:	00000617          	auipc	a2,0x0
    19ac:	5b063603          	ld	a2,1456(a2) # 1f58 <__clone+0x9e>
    19b0:	00000817          	auipc	a6,0x0
    19b4:	5b083803          	ld	a6,1456(a6) # 1f60 <__clone+0xa6>
    19b8:	a029                	j	19c2 <strcpy+0x2a>
    19ba:	05a1                	add	a1,a1,8
    19bc:	e118                	sd	a4,0(a0)
    19be:	6198                	ld	a4,0(a1)
    19c0:	0521                	add	a0,a0,8
    19c2:	00c707b3          	add	a5,a4,a2
    19c6:	fff74693          	not	a3,a4
    19ca:	8ff5                	and	a5,a5,a3
    19cc:	0107f7b3          	and	a5,a5,a6
    19d0:	d7ed                	beqz	a5,19ba <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19d2:	0005c783          	lbu	a5,0(a1)
    19d6:	00f50023          	sb	a5,0(a0)
    19da:	c785                	beqz	a5,1a02 <strcpy+0x6a>
    19dc:	0015c783          	lbu	a5,1(a1)
    19e0:	0505                	add	a0,a0,1
    19e2:	0585                	add	a1,a1,1
    19e4:	00f50023          	sb	a5,0(a0)
    19e8:	fbf5                	bnez	a5,19dc <strcpy+0x44>
        ;
    return d;
}
    19ea:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19ec:	0505                	add	a0,a0,1
    19ee:	df45                	beqz	a4,19a6 <strcpy+0xe>
            if (!(*d = *s))
    19f0:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19f4:	0585                	add	a1,a1,1
    19f6:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19fa:	00f50023          	sb	a5,0(a0)
    19fe:	f7fd                	bnez	a5,19ec <strcpy+0x54>
}
    1a00:	8082                	ret
    1a02:	8082                	ret

0000000000001a04 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a04:	00a5c7b3          	xor	a5,a1,a0
    1a08:	8b9d                	and	a5,a5,7
    1a0a:	e3b5                	bnez	a5,1a6e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a0c:	0075f793          	and	a5,a1,7
    1a10:	cf99                	beqz	a5,1a2e <strncpy+0x2a>
    1a12:	ea09                	bnez	a2,1a24 <strncpy+0x20>
    1a14:	a421                	j	1c1c <strncpy+0x218>
    1a16:	0585                	add	a1,a1,1
    1a18:	0075f793          	and	a5,a1,7
    1a1c:	167d                	add	a2,a2,-1
    1a1e:	0505                	add	a0,a0,1
    1a20:	c799                	beqz	a5,1a2e <strncpy+0x2a>
    1a22:	c225                	beqz	a2,1a82 <strncpy+0x7e>
    1a24:	0005c783          	lbu	a5,0(a1)
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	f7ed                	bnez	a5,1a16 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a2e:	ca31                	beqz	a2,1a82 <strncpy+0x7e>
    1a30:	0005c783          	lbu	a5,0(a1)
    1a34:	cba1                	beqz	a5,1a84 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a36:	479d                	li	a5,7
    1a38:	02c7fc63          	bgeu	a5,a2,1a70 <strncpy+0x6c>
    1a3c:	00000897          	auipc	a7,0x0
    1a40:	51c8b883          	ld	a7,1308(a7) # 1f58 <__clone+0x9e>
    1a44:	00000817          	auipc	a6,0x0
    1a48:	51c83803          	ld	a6,1308(a6) # 1f60 <__clone+0xa6>
    1a4c:	431d                	li	t1,7
    1a4e:	a039                	j	1a5c <strncpy+0x58>
            *wd = *ws;
    1a50:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a52:	1661                	add	a2,a2,-8
    1a54:	05a1                	add	a1,a1,8
    1a56:	0521                	add	a0,a0,8
    1a58:	00c37b63          	bgeu	t1,a2,1a6e <strncpy+0x6a>
    1a5c:	6198                	ld	a4,0(a1)
    1a5e:	011707b3          	add	a5,a4,a7
    1a62:	fff74693          	not	a3,a4
    1a66:	8ff5                	and	a5,a5,a3
    1a68:	0107f7b3          	and	a5,a5,a6
    1a6c:	d3f5                	beqz	a5,1a50 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a6e:	ca11                	beqz	a2,1a82 <strncpy+0x7e>
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	0585                	add	a1,a1,1
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	c789                	beqz	a5,1a84 <strncpy+0x80>
    1a7c:	167d                	add	a2,a2,-1
    1a7e:	0505                	add	a0,a0,1
    1a80:	fa65                	bnez	a2,1a70 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a82:	8082                	ret
    1a84:	4805                	li	a6,1
    1a86:	14061b63          	bnez	a2,1bdc <strncpy+0x1d8>
    1a8a:	40a00733          	neg	a4,a0
    1a8e:	00777793          	and	a5,a4,7
    1a92:	4581                	li	a1,0
    1a94:	12061c63          	bnez	a2,1bcc <strncpy+0x1c8>
    1a98:	00778693          	add	a3,a5,7
    1a9c:	48ad                	li	a7,11
    1a9e:	1316e563          	bltu	a3,a7,1bc8 <strncpy+0x1c4>
    1aa2:	16d5e263          	bltu	a1,a3,1c06 <strncpy+0x202>
    1aa6:	14078c63          	beqz	a5,1bfe <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aaa:	00050023          	sb	zero,0(a0)
    1aae:	00677693          	and	a3,a4,6
    1ab2:	14068263          	beqz	a3,1bf6 <strncpy+0x1f2>
    1ab6:	000500a3          	sb	zero,1(a0)
    1aba:	4689                	li	a3,2
    1abc:	14f6f863          	bgeu	a3,a5,1c0c <strncpy+0x208>
    1ac0:	00050123          	sb	zero,2(a0)
    1ac4:	8b11                	and	a4,a4,4
    1ac6:	12070463          	beqz	a4,1bee <strncpy+0x1ea>
    1aca:	000501a3          	sb	zero,3(a0)
    1ace:	4711                	li	a4,4
    1ad0:	00450693          	add	a3,a0,4
    1ad4:	02f77563          	bgeu	a4,a5,1afe <strncpy+0xfa>
    1ad8:	00050223          	sb	zero,4(a0)
    1adc:	4715                	li	a4,5
    1ade:	00550693          	add	a3,a0,5
    1ae2:	00e78e63          	beq	a5,a4,1afe <strncpy+0xfa>
    1ae6:	fff50713          	add	a4,a0,-1
    1aea:	000502a3          	sb	zero,5(a0)
    1aee:	8b1d                	and	a4,a4,7
    1af0:	12071263          	bnez	a4,1c14 <strncpy+0x210>
    1af4:	00750693          	add	a3,a0,7
    1af8:	00050323          	sb	zero,6(a0)
    1afc:	471d                	li	a4,7
    1afe:	40f80833          	sub	a6,a6,a5
    1b02:	ff887593          	and	a1,a6,-8
    1b06:	97aa                	add	a5,a5,a0
    1b08:	95be                	add	a1,a1,a5
    1b0a:	0007b023          	sd	zero,0(a5)
    1b0e:	07a1                	add	a5,a5,8
    1b10:	feb79de3          	bne	a5,a1,1b0a <strncpy+0x106>
    1b14:	ff887593          	and	a1,a6,-8
    1b18:	00787813          	and	a6,a6,7
    1b1c:	00e587bb          	addw	a5,a1,a4
    1b20:	00b68733          	add	a4,a3,a1
    1b24:	0e080063          	beqz	a6,1c04 <strncpy+0x200>
    1b28:	00070023          	sb	zero,0(a4)
    1b2c:	0017869b          	addw	a3,a5,1
    1b30:	f4c6f9e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b34:	000700a3          	sb	zero,1(a4)
    1b38:	0027869b          	addw	a3,a5,2
    1b3c:	f4c6f3e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b40:	00070123          	sb	zero,2(a4)
    1b44:	0037869b          	addw	a3,a5,3
    1b48:	f2c6fde3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b4c:	000701a3          	sb	zero,3(a4)
    1b50:	0047869b          	addw	a3,a5,4
    1b54:	f2c6f7e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b58:	00070223          	sb	zero,4(a4)
    1b5c:	0057869b          	addw	a3,a5,5
    1b60:	f2c6f1e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b64:	000702a3          	sb	zero,5(a4)
    1b68:	0067869b          	addw	a3,a5,6
    1b6c:	f0c6fbe3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b70:	00070323          	sb	zero,6(a4)
    1b74:	0077869b          	addw	a3,a5,7
    1b78:	f0c6f5e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b7c:	000703a3          	sb	zero,7(a4)
    1b80:	0087869b          	addw	a3,a5,8
    1b84:	eec6ffe3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b88:	00070423          	sb	zero,8(a4)
    1b8c:	0097869b          	addw	a3,a5,9
    1b90:	eec6f9e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1b94:	000704a3          	sb	zero,9(a4)
    1b98:	00a7869b          	addw	a3,a5,10
    1b9c:	eec6f3e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1ba0:	00070523          	sb	zero,10(a4)
    1ba4:	00b7869b          	addw	a3,a5,11
    1ba8:	ecc6fde3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1bac:	000705a3          	sb	zero,11(a4)
    1bb0:	00c7869b          	addw	a3,a5,12
    1bb4:	ecc6f7e3          	bgeu	a3,a2,1a82 <strncpy+0x7e>
    1bb8:	00070623          	sb	zero,12(a4)
    1bbc:	27b5                	addw	a5,a5,13
    1bbe:	ecc7f2e3          	bgeu	a5,a2,1a82 <strncpy+0x7e>
    1bc2:	000706a3          	sb	zero,13(a4)
}
    1bc6:	8082                	ret
    1bc8:	46ad                	li	a3,11
    1bca:	bde1                	j	1aa2 <strncpy+0x9e>
    1bcc:	00778693          	add	a3,a5,7
    1bd0:	48ad                	li	a7,11
    1bd2:	fff60593          	add	a1,a2,-1
    1bd6:	ed16f6e3          	bgeu	a3,a7,1aa2 <strncpy+0x9e>
    1bda:	b7fd                	j	1bc8 <strncpy+0x1c4>
    1bdc:	40a00733          	neg	a4,a0
    1be0:	8832                	mv	a6,a2
    1be2:	00777793          	and	a5,a4,7
    1be6:	4581                	li	a1,0
    1be8:	ea0608e3          	beqz	a2,1a98 <strncpy+0x94>
    1bec:	b7c5                	j	1bcc <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bee:	00350693          	add	a3,a0,3
    1bf2:	470d                	li	a4,3
    1bf4:	b729                	j	1afe <strncpy+0xfa>
    1bf6:	00150693          	add	a3,a0,1
    1bfa:	4705                	li	a4,1
    1bfc:	b709                	j	1afe <strncpy+0xfa>
tail:
    1bfe:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c00:	4701                	li	a4,0
    1c02:	bdf5                	j	1afe <strncpy+0xfa>
    1c04:	8082                	ret
tail:
    1c06:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c08:	4781                	li	a5,0
    1c0a:	bf39                	j	1b28 <strncpy+0x124>
    1c0c:	00250693          	add	a3,a0,2
    1c10:	4709                	li	a4,2
    1c12:	b5f5                	j	1afe <strncpy+0xfa>
    1c14:	00650693          	add	a3,a0,6
    1c18:	4719                	li	a4,6
    1c1a:	b5d5                	j	1afe <strncpy+0xfa>
    1c1c:	8082                	ret

0000000000001c1e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c1e:	87aa                	mv	a5,a0
    1c20:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c22:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c26:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c2a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c2c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c32:	2501                	sext.w	a0,a0
    1c34:	8082                	ret

0000000000001c36 <openat>:
    register long a7 __asm__("a7") = n;
    1c36:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c3a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <close>:
    register long a7 __asm__("a7") = n;
    1c46:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c4a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <read>:
    register long a7 __asm__("a7") = n;
    1c52:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c56:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c5a:	8082                	ret

0000000000001c5c <write>:
    register long a7 __asm__("a7") = n;
    1c5c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c60:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c64:	8082                	ret

0000000000001c66 <getpid>:
    register long a7 __asm__("a7") = n;
    1c66:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c6a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <getppid>:
    register long a7 __asm__("a7") = n;
    1c72:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c76:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c82:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <fork>:
    register long a7 __asm__("a7") = n;
    1c8a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c92:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c9a:	85b2                	mv	a1,a2
    1c9c:	863a                	mv	a2,a4
    if (stack)
    1c9e:	c191                	beqz	a1,1ca2 <clone+0x8>
	stack += stack_size;
    1ca0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca2:	4781                	li	a5,0
    1ca4:	4701                	li	a4,0
    1ca6:	4681                	li	a3,0
    1ca8:	2601                	sext.w	a2,a2
    1caa:	ac01                	j	1eba <__clone>

0000000000001cac <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cac:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cb0:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cb4:	8082                	ret

0000000000001cb6 <exit>:
    register long a7 __asm__("a7") = n;
    1cb6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cba:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cbe:	8082                	ret

0000000000001cc0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cc0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cc4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <exec>:
    register long a7 __asm__("a7") = n;
    1cce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cd2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <execve>:
    register long a7 __asm__("a7") = n;
    1cda:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cde:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <times>:
    register long a7 __asm__("a7") = n;
    1ce6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <get_time>:

int64 get_time()
{
    1cf2:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cf4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cf8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cfa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d00:	2501                	sext.w	a0,a0
    1d02:	ed09                	bnez	a0,1d1c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d04:	67a2                	ld	a5,8(sp)
    1d06:	3e800713          	li	a4,1000
    1d0a:	00015503          	lhu	a0,0(sp)
    1d0e:	02e7d7b3          	divu	a5,a5,a4
    1d12:	02e50533          	mul	a0,a0,a4
    1d16:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d18:	0141                	add	sp,sp,16
    1d1a:	8082                	ret
        return -1;
    1d1c:	557d                	li	a0,-1
    1d1e:	bfed                	j	1d18 <get_time+0x26>

0000000000001d20 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d20:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <time>:
    register long a7 __asm__("a7") = n;
    1d2c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d30:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <sleep>:

int sleep(unsigned long long time)
{
    1d38:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d3a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d3c:	850a                	mv	a0,sp
    1d3e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d40:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d44:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d4a:	e501                	bnez	a0,1d52 <sleep+0x1a>
    return 0;
    1d4c:	4501                	li	a0,0
}
    1d4e:	0141                	add	sp,sp,16
    1d50:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d52:	4502                	lw	a0,0(sp)
}
    1d54:	0141                	add	sp,sp,16
    1d56:	8082                	ret

0000000000001d58 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d58:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d5c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d64:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d68:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d6c:	8082                	ret

0000000000001d6e <mprotect>:
    register long a7 __asm__("a7") = n;
    1d6e:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d72:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <munmap>:
    register long a7 __asm__("a7") = n;
    1d7a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <wait>:

int wait(int *code)
{
    1d86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d88:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d8e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d92:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <spawn>:
    register long a7 __asm__("a7") = n;
    1d9a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <mailread>:
    register long a7 __asm__("a7") = n;
    1da6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <fstat>:
    register long a7 __asm__("a7") = n;
    1dbe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dca:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dcc:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dd0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dda:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dea:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dec:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <link>:

int link(char *old_path, char *new_path)
{
    1dfa:	87aa                	mv	a5,a0
    1dfc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dfe:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e02:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e06:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e08:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e0c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <unlink>:

int unlink(char *path)
{
    1e16:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e18:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e1c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e20:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <uname>:
    register long a7 __asm__("a7") = n;
    1e2a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <brk>:
    register long a7 __asm__("a7") = n;
    1e36:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e42:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e48:	8082                	ret

0000000000001e4a <chdir>:
    register long a7 __asm__("a7") = n;
    1e4a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e56:	862e                	mv	a2,a1
    1e58:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e5a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e66:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <getdents>:
    register long a7 __asm__("a7") = n;
    1e70:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <pipe>:
    register long a7 __asm__("a7") = n;
    1e7c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <dup>:
    register long a7 __asm__("a7") = n;
    1e8a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <dup2>:
    register long a7 __asm__("a7") = n;
    1e94:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e96:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e98:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <mount>:
    register long a7 __asm__("a7") = n;
    1ea0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <umount>:
    register long a7 __asm__("a7") = n;
    1eac:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eba:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ebc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ebe:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec0:	8532                	mv	a0,a2
	mv a2, a4
    1ec2:	863a                	mv	a2,a4
	mv a3, a5
    1ec4:	86be                	mv	a3,a5
	mv a4, a6
    1ec6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec8:	0dc00893          	li	a7,220
	ecall
    1ecc:	00000073          	ecall

	beqz a0, 1f
    1ed0:	c111                	beqz	a0,1ed4 <__clone+0x1a>
	# Parent
	ret
    1ed2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed6:	6522                	ld	a0,8(sp)
	jalr a1
    1ed8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eda:	05d00893          	li	a7,93
	ecall
    1ede:	00000073          	ecall
