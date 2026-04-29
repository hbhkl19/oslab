
/home/hbh/oslab/oslab/user/build/riscv64/sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8c9                	j	10d4 <__start_main>

0000000000001004 <test_sleep>:
 * 测试通过时的输出：
 * "sleep success."
 * 测试失败时的输出：
 * "sleep error."
 */
void test_sleep() {
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0a50513          	add	a0,a0,-246 # 1f10 <__clone+0x2e>
void test_sleep() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
	TEST_START(__func__);
    1014:	318000ef          	jal	132c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f9050513          	add	a0,a0,-112 # 1fa8 <__func__.0>
    1020:	30c000ef          	jal	132c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f0450513          	add	a0,a0,-252 # 1f28 <__clone+0x46>
    102c:	300000ef          	jal	132c <puts>

	int time1 = get_time();
    1030:	4eb000ef          	jal	1d1a <get_time>
    1034:	0005041b          	sext.w	s0,a0
	assert(time1 >= 0);
    1038:	06044f63          	bltz	s0,10b6 <test_sleep+0xb2>
	int ret = sleep(1);
    103c:	4505                	li	a0,1
    103e:	523000ef          	jal	1d60 <sleep>
	assert(ret == 0);
    1042:	e13d                	bnez	a0,10a8 <test_sleep+0xa4>
	int time2 = get_time();
    1044:	4d7000ef          	jal	1d1a <get_time>
    1048:	0005049b          	sext.w	s1,a0
	assert(time2 >= 0);
    104c:	0204cf63          	bltz	s1,108a <test_sleep+0x86>

	if(time2 - time1 >= 1){	
    1050:	04945563          	bge	s0,s1,109a <test_sleep+0x96>
		printf("sleep success.\n");
    1054:	00001517          	auipc	a0,0x1
    1058:	f0450513          	add	a0,a0,-252 # 1f58 <__clone+0x76>
    105c:	2f2000ef          	jal	134e <printf>
	}else{
		printf("sleep error.\n");
	}
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	f1850513          	add	a0,a0,-232 # 1f78 <__clone+0x96>
    1068:	2c4000ef          	jal	132c <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	f3c50513          	add	a0,a0,-196 # 1fa8 <__func__.0>
    1074:	2b8000ef          	jal	132c <puts>
}
    1078:	6442                	ld	s0,16(sp)
    107a:	60e2                	ld	ra,24(sp)
    107c:	64a2                	ld	s1,8(sp)
	TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	eaa50513          	add	a0,a0,-342 # 1f28 <__clone+0x46>
}
    1086:	6105                	add	sp,sp,32
	TEST_END(__func__);
    1088:	a455                	j	132c <puts>
	assert(time2 >= 0);
    108a:	00001517          	auipc	a0,0x1
    108e:	eae50513          	add	a0,a0,-338 # 1f38 <__clone+0x56>
    1092:	536000ef          	jal	15c8 <panic>
	if(time2 - time1 >= 1){	
    1096:	fa944fe3          	blt	s0,s1,1054 <test_sleep+0x50>
		printf("sleep error.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	ece50513          	add	a0,a0,-306 # 1f68 <__clone+0x86>
    10a2:	2ac000ef          	jal	134e <printf>
    10a6:	bf6d                	j	1060 <test_sleep+0x5c>
	assert(ret == 0);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	e9050513          	add	a0,a0,-368 # 1f38 <__clone+0x56>
    10b0:	518000ef          	jal	15c8 <panic>
    10b4:	bf41                	j	1044 <test_sleep+0x40>
	assert(time1 >= 0);
    10b6:	00001517          	auipc	a0,0x1
    10ba:	e8250513          	add	a0,a0,-382 # 1f38 <__clone+0x56>
    10be:	50a000ef          	jal	15c8 <panic>
    10c2:	bfad                	j	103c <test_sleep+0x38>

00000000000010c4 <main>:

int main(void) {
    10c4:	1141                	add	sp,sp,-16
    10c6:	e406                	sd	ra,8(sp)
	test_sleep();
    10c8:	f3dff0ef          	jal	1004 <test_sleep>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	add	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d6:	4108                	lw	a0,0(a0)
{
    10d8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10da:	05a1                	add	a1,a1,8
{
    10dc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10de:	fe7ff0ef          	jal	10c4 <main>
    10e2:	3fd000ef          	jal	1cde <exit>
	return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	add	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ee:	7179                	add	sp,sp,-48
    10f0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f2:	12054863          	bltz	a0,1222 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f6:	02b577bb          	remuw	a5,a0,a1
    10fa:	00001697          	auipc	a3,0x1
    10fe:	ebe68693          	add	a3,a3,-322 # 1fb8 <digits>
    buf[16] = 0;
    1102:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1106:	0005871b          	sext.w	a4,a1
    110a:	1782                	sll	a5,a5,0x20
    110c:	9381                	srl	a5,a5,0x20
    110e:	97b6                	add	a5,a5,a3
    1110:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1114:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1118:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    111c:	1ab56663          	bltu	a0,a1,12c8 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1120:	02e8763b          	remuw	a2,a6,a4
    1124:	1602                	sll	a2,a2,0x20
    1126:	9201                	srl	a2,a2,0x20
    1128:	9636                	add	a2,a2,a3
    112a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1132:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1136:	12e86c63          	bltu	a6,a4,126e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    113a:	02e5f63b          	remuw	a2,a1,a4
    113e:	1602                	sll	a2,a2,0x20
    1140:	9201                	srl	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    114c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1150:	12e5e863          	bltu	a1,a4,1280 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1154:	02e8763b          	remuw	a2,a6,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1166:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    116a:	12e86463          	bltu	a6,a4,1292 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    116e:	02e5f63b          	remuw	a2,a1,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1180:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1184:	12e5e063          	bltu	a1,a4,12a4 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1188:	02e8763b          	remuw	a2,a6,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    119a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    119e:	0ae86f63          	bltu	a6,a4,125c <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11a2:	02e5f63b          	remuw	a2,a1,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b8:	0ee5ef63          	bltu	a1,a4,12b6 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11bc:	02e8763b          	remuw	a2,a6,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ce:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11d2:	0ee86d63          	bltu	a6,a4,12cc <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11d6:	02e5f63b          	remuw	a2,a1,a4
    11da:	1602                	sll	a2,a2,0x20
    11dc:	9201                	srl	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ec:	0ee5e963          	bltu	a1,a4,12de <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11f0:	1782                	sll	a5,a5,0x20
    11f2:	9381                	srl	a5,a5,0x20
    11f4:	96be                	add	a3,a3,a5
    11f6:	0006c783          	lbu	a5,0(a3)
    11fa:	4599                	li	a1,6
    11fc:	00f10723          	sb	a5,14(sp)

    if (sign)
    1200:	00055763          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1204:	02d00793          	li	a5,45
    1208:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    120c:	4595                	li	a1,5
    write(f, s, l);
    120e:	003c                	add	a5,sp,8
    1210:	4641                	li	a2,16
    1212:	9e0d                	subw	a2,a2,a1
    1214:	4505                	li	a0,1
    1216:	95be                	add	a1,a1,a5
    1218:	26d000ef          	jal	1c84 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121c:	70a2                	ld	ra,40(sp)
    121e:	6145                	add	sp,sp,48
    1220:	8082                	ret
        x = -xx;
    1222:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1226:	02b677bb          	remuw	a5,a2,a1
    122a:	00001697          	auipc	a3,0x1
    122e:	d8e68693          	add	a3,a3,-626 # 1fb8 <digits>
    buf[16] = 0;
    1232:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1236:	0005871b          	sext.w	a4,a1
    123a:	1782                	sll	a5,a5,0x20
    123c:	9381                	srl	a5,a5,0x20
    123e:	97b6                	add	a5,a5,a3
    1240:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1244:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1248:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124c:	ecb67ae3          	bgeu	a2,a1,1120 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1258:	45b9                	li	a1,14
    125a:	bf55                	j	120e <printint.constprop.0+0x120>
    125c:	45a9                	li	a1,10
    if (sign)
    125e:	fa0558e3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    126a:	45a5                	li	a1,9
    126c:	b74d                	j	120e <printint.constprop.0+0x120>
    126e:	45b9                	li	a1,14
    if (sign)
    1270:	f8055fe3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    127c:	45b5                	li	a1,13
    127e:	bf41                	j	120e <printint.constprop.0+0x120>
    1280:	45b5                	li	a1,13
    if (sign)
    1282:	f80556e3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    128e:	45b1                	li	a1,12
    1290:	bfbd                	j	120e <printint.constprop.0+0x120>
    1292:	45b1                	li	a1,12
    if (sign)
    1294:	f6055de3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12a0:	45ad                	li	a1,11
    12a2:	b7b5                	j	120e <printint.constprop.0+0x120>
    12a4:	45ad                	li	a1,11
    if (sign)
    12a6:	f60554e3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12b2:	45a9                	li	a1,10
    12b4:	bfa9                	j	120e <printint.constprop.0+0x120>
    12b6:	45a5                	li	a1,9
    if (sign)
    12b8:	f4055be3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c4:	45a1                	li	a1,8
    12c6:	b7a1                	j	120e <printint.constprop.0+0x120>
    i = 15;
    12c8:	45bd                	li	a1,15
    12ca:	b791                	j	120e <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12cc:	45a1                	li	a1,8
    if (sign)
    12ce:	f40550e3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12da:	459d                	li	a1,7
    12dc:	bf0d                	j	120e <printint.constprop.0+0x120>
    12de:	459d                	li	a1,7
    if (sign)
    12e0:	f20557e3          	bgez	a0,120e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e4:	02d00793          	li	a5,45
    12e8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ec:	4599                	li	a1,6
    12ee:	b705                	j	120e <printint.constprop.0+0x120>

00000000000012f0 <getchar>:
{
    12f0:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12f2:	00f10593          	add	a1,sp,15
    12f6:	4605                	li	a2,1
    12f8:	4501                	li	a0,0
{
    12fa:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12fc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1300:	17b000ef          	jal	1c7a <read>
}
    1304:	60e2                	ld	ra,24(sp)
    1306:	00f14503          	lbu	a0,15(sp)
    130a:	6105                	add	sp,sp,32
    130c:	8082                	ret

000000000000130e <putchar>:
{
    130e:	1101                	add	sp,sp,-32
    1310:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1312:	00f10593          	add	a1,sp,15
    1316:	4605                	li	a2,1
    1318:	4505                	li	a0,1
{
    131a:	ec06                	sd	ra,24(sp)
    char byte = c;
    131c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1320:	165000ef          	jal	1c84 <write>
}
    1324:	60e2                	ld	ra,24(sp)
    1326:	2501                	sext.w	a0,a0
    1328:	6105                	add	sp,sp,32
    132a:	8082                	ret

000000000000132c <puts>:
{
    132c:	1141                	add	sp,sp,-16
    132e:	e406                	sd	ra,8(sp)
    1330:	e022                	sd	s0,0(sp)
    1332:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1334:	574000ef          	jal	18a8 <strlen>
    1338:	862a                	mv	a2,a0
    133a:	85a2                	mv	a1,s0
    133c:	4505                	li	a0,1
    133e:	147000ef          	jal	1c84 <write>
}
    1342:	60a2                	ld	ra,8(sp)
    1344:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1346:	957d                	sra	a0,a0,0x3f
    return r;
    1348:	2501                	sext.w	a0,a0
}
    134a:	0141                	add	sp,sp,16
    134c:	8082                	ret

000000000000134e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    134e:	7171                	add	sp,sp,-176
    1350:	f85a                	sd	s6,48(sp)
    1352:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1354:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1356:	18bc                	add	a5,sp,120
{
    1358:	e8ca                	sd	s2,80(sp)
    135a:	e4ce                	sd	s3,72(sp)
    135c:	e0d2                	sd	s4,64(sp)
    135e:	fc56                	sd	s5,56(sp)
    1360:	f486                	sd	ra,104(sp)
    1362:	f0a2                	sd	s0,96(sp)
    1364:	eca6                	sd	s1,88(sp)
    1366:	fcae                	sd	a1,120(sp)
    1368:	e132                	sd	a2,128(sp)
    136a:	e536                	sd	a3,136(sp)
    136c:	e93a                	sd	a4,144(sp)
    136e:	f142                	sd	a6,160(sp)
    1370:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1372:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1374:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1378:	07300a13          	li	s4,115
    137c:	07800a93          	li	s5,120
    buf[i++] = '0';
    1380:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1384:	00001997          	auipc	s3,0x1
    1388:	c3498993          	add	s3,s3,-972 # 1fb8 <digits>
        if (!*s)
    138c:	00054783          	lbu	a5,0(a0)
    1390:	16078a63          	beqz	a5,1504 <printf+0x1b6>
    1394:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1396:	19278d63          	beq	a5,s2,1530 <printf+0x1e2>
    139a:	00164783          	lbu	a5,1(a2)
    139e:	0605                	add	a2,a2,1
    13a0:	fbfd                	bnez	a5,1396 <printf+0x48>
    13a2:	84b2                	mv	s1,a2
        l = z - a;
    13a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a8:	85aa                	mv	a1,a0
    13aa:	8622                	mv	a2,s0
    13ac:	4505                	li	a0,1
    13ae:	0d7000ef          	jal	1c84 <write>
        if (l)
    13b2:	1a041463          	bnez	s0,155a <printf+0x20c>
        if (s[1] == 0)
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	14078563          	beqz	a5,1504 <printf+0x1b6>
        switch (s[1])
    13be:	1b478063          	beq	a5,s4,155e <printf+0x210>
    13c2:	14fa6b63          	bltu	s4,a5,1518 <printf+0x1ca>
    13c6:	06400713          	li	a4,100
    13ca:	1ee78063          	beq	a5,a4,15aa <printf+0x25c>
    13ce:	07000713          	li	a4,112
    13d2:	1ae79963          	bne	a5,a4,1584 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13d6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d8:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13dc:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13de:	631c                	ld	a5,0(a4)
    13e0:	0721                	add	a4,a4,8
    13e2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e4:	00479293          	sll	t0,a5,0x4
    13e8:	00879f93          	sll	t6,a5,0x8
    13ec:	00c79f13          	sll	t5,a5,0xc
    13f0:	01079e93          	sll	t4,a5,0x10
    13f4:	01479e13          	sll	t3,a5,0x14
    13f8:	01879313          	sll	t1,a5,0x18
    13fc:	01c79893          	sll	a7,a5,0x1c
    1400:	02479813          	sll	a6,a5,0x24
    1404:	02879513          	sll	a0,a5,0x28
    1408:	02c79593          	sll	a1,a5,0x2c
    140c:	03079693          	sll	a3,a5,0x30
    1410:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1414:	03c7d413          	srl	s0,a5,0x3c
    1418:	01c7d39b          	srlw	t2,a5,0x1c
    141c:	03c2d293          	srl	t0,t0,0x3c
    1420:	03cfdf93          	srl	t6,t6,0x3c
    1424:	03cf5f13          	srl	t5,t5,0x3c
    1428:	03cede93          	srl	t4,t4,0x3c
    142c:	03ce5e13          	srl	t3,t3,0x3c
    1430:	03c35313          	srl	t1,t1,0x3c
    1434:	03c8d893          	srl	a7,a7,0x3c
    1438:	03c85813          	srl	a6,a6,0x3c
    143c:	9171                	srl	a0,a0,0x3c
    143e:	91f1                	srl	a1,a1,0x3c
    1440:	92f1                	srl	a3,a3,0x3c
    1442:	9371                	srl	a4,a4,0x3c
    1444:	96ce                	add	a3,a3,s3
    1446:	974e                	add	a4,a4,s3
    1448:	944e                	add	s0,s0,s3
    144a:	92ce                	add	t0,t0,s3
    144c:	9fce                	add	t6,t6,s3
    144e:	9f4e                	add	t5,t5,s3
    1450:	9ece                	add	t4,t4,s3
    1452:	9e4e                	add	t3,t3,s3
    1454:	934e                	add	t1,t1,s3
    1456:	98ce                	add	a7,a7,s3
    1458:	93ce                	add	t2,t2,s3
    145a:	984e                	add	a6,a6,s3
    145c:	954e                	add	a0,a0,s3
    145e:	95ce                	add	a1,a1,s3
    1460:	0006c083          	lbu	ra,0(a3)
    1464:	0002c283          	lbu	t0,0(t0)
    1468:	00074683          	lbu	a3,0(a4)
    146c:	000fcf83          	lbu	t6,0(t6)
    1470:	000f4f03          	lbu	t5,0(t5)
    1474:	000ece83          	lbu	t4,0(t4)
    1478:	000e4e03          	lbu	t3,0(t3)
    147c:	00034303          	lbu	t1,0(t1)
    1480:	0008c883          	lbu	a7,0(a7)
    1484:	0003c383          	lbu	t2,0(t2)
    1488:	00084803          	lbu	a6,0(a6)
    148c:	00054503          	lbu	a0,0(a0)
    1490:	0005c583          	lbu	a1,0(a1)
    1494:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1498:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149c:	9371                	srl	a4,a4,0x3c
    149e:	8bbd                	and	a5,a5,15
    14a0:	974e                	add	a4,a4,s3
    14a2:	97ce                	add	a5,a5,s3
    14a4:	005105a3          	sb	t0,11(sp)
    14a8:	01f10623          	sb	t6,12(sp)
    14ac:	01e106a3          	sb	t5,13(sp)
    14b0:	01d10723          	sb	t4,14(sp)
    14b4:	01c107a3          	sb	t3,15(sp)
    14b8:	00610823          	sb	t1,16(sp)
    14bc:	011108a3          	sb	a7,17(sp)
    14c0:	00710923          	sb	t2,18(sp)
    14c4:	010109a3          	sb	a6,19(sp)
    14c8:	00a10a23          	sb	a0,20(sp)
    14cc:	00b10aa3          	sb	a1,21(sp)
    14d0:	00110b23          	sb	ra,22(sp)
    14d4:	00d10ba3          	sb	a3,23(sp)
    14d8:	00810523          	sb	s0,10(sp)
    14dc:	00074703          	lbu	a4,0(a4)
    14e0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e4:	002c                	add	a1,sp,8
    14e6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e8:	00e10c23          	sb	a4,24(sp)
    14ec:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14f4:	790000ef          	jal	1c84 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f8:	00248513          	add	a0,s1,2
        if (!*s)
    14fc:	00054783          	lbu	a5,0(a0)
    1500:	e8079ae3          	bnez	a5,1394 <printf+0x46>
    }
    va_end(ap);
}
    1504:	70a6                	ld	ra,104(sp)
    1506:	7406                	ld	s0,96(sp)
    1508:	64e6                	ld	s1,88(sp)
    150a:	6946                	ld	s2,80(sp)
    150c:	69a6                	ld	s3,72(sp)
    150e:	6a06                	ld	s4,64(sp)
    1510:	7ae2                	ld	s5,56(sp)
    1512:	7b42                	ld	s6,48(sp)
    1514:	614d                	add	sp,sp,176
    1516:	8082                	ret
        switch (s[1])
    1518:	07579663          	bne	a5,s5,1584 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    151c:	6782                	ld	a5,0(sp)
    151e:	45c1                	li	a1,16
    1520:	4388                	lw	a0,0(a5)
    1522:	07a1                	add	a5,a5,8
    1524:	e03e                	sd	a5,0(sp)
    1526:	bc9ff0ef          	jal	10ee <printint.constprop.0>
        s += 2;
    152a:	00248513          	add	a0,s1,2
    152e:	b7f9                	j	14fc <printf+0x1ae>
    1530:	84b2                	mv	s1,a2
    1532:	a039                	j	1540 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1534:	0024c783          	lbu	a5,2(s1)
    1538:	0605                	add	a2,a2,1
    153a:	0489                	add	s1,s1,2
    153c:	e72794e3          	bne	a5,s2,13a4 <printf+0x56>
    1540:	0014c783          	lbu	a5,1(s1)
    1544:	ff2788e3          	beq	a5,s2,1534 <printf+0x1e6>
        l = z - a;
    1548:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    154c:	85aa                	mv	a1,a0
    154e:	8622                	mv	a2,s0
    1550:	4505                	li	a0,1
    1552:	732000ef          	jal	1c84 <write>
        if (l)
    1556:	e60400e3          	beqz	s0,13b6 <printf+0x68>
    155a:	8526                	mv	a0,s1
    155c:	bd05                	j	138c <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    155e:	6782                	ld	a5,0(sp)
    1560:	6380                	ld	s0,0(a5)
    1562:	07a1                	add	a5,a5,8
    1564:	e03e                	sd	a5,0(sp)
    1566:	cc21                	beqz	s0,15be <printf+0x270>
            l = strnlen(a, 200);
    1568:	0c800593          	li	a1,200
    156c:	8522                	mv	a0,s0
    156e:	424000ef          	jal	1992 <strnlen>
    write(f, s, l);
    1572:	0005061b          	sext.w	a2,a0
    1576:	85a2                	mv	a1,s0
    1578:	4505                	li	a0,1
    157a:	70a000ef          	jal	1c84 <write>
        s += 2;
    157e:	00248513          	add	a0,s1,2
    1582:	bfad                	j	14fc <printf+0x1ae>
    return write(stdout, &byte, 1);
    1584:	4605                	li	a2,1
    1586:	002c                	add	a1,sp,8
    1588:	4505                	li	a0,1
    char byte = c;
    158a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    158e:	6f6000ef          	jal	1c84 <write>
    char byte = c;
    1592:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1596:	4605                	li	a2,1
    1598:	002c                	add	a1,sp,8
    159a:	4505                	li	a0,1
    char byte = c;
    159c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a0:	6e4000ef          	jal	1c84 <write>
        s += 2;
    15a4:	00248513          	add	a0,s1,2
    15a8:	bf91                	j	14fc <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15aa:	6782                	ld	a5,0(sp)
    15ac:	45a9                	li	a1,10
    15ae:	4388                	lw	a0,0(a5)
    15b0:	07a1                	add	a5,a5,8
    15b2:	e03e                	sd	a5,0(sp)
    15b4:	b3bff0ef          	jal	10ee <printint.constprop.0>
        s += 2;
    15b8:	00248513          	add	a0,s1,2
    15bc:	b781                	j	14fc <printf+0x1ae>
                a = "(null)";
    15be:	00001417          	auipc	s0,0x1
    15c2:	9ca40413          	add	s0,s0,-1590 # 1f88 <__clone+0xa6>
    15c6:	b74d                	j	1568 <printf+0x21a>

00000000000015c8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c8:	1141                	add	sp,sp,-16
    15ca:	e406                	sd	ra,8(sp)
    puts(m);
    15cc:	d61ff0ef          	jal	132c <puts>
    exit(-100);
}
    15d0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15d2:	f9c00513          	li	a0,-100
}
    15d6:	0141                	add	sp,sp,16
    exit(-100);
    15d8:	a719                	j	1cde <exit>

00000000000015da <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	02000793          	li	a5,32
    15de:	00f50663          	beq	a0,a5,15ea <isspace+0x10>
    15e2:	355d                	addw	a0,a0,-9
    15e4:	00553513          	sltiu	a0,a0,5
    15e8:	8082                	ret
    15ea:	4505                	li	a0,1
}
    15ec:	8082                	ret

00000000000015ee <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ee:	fd05051b          	addw	a0,a0,-48
}
    15f2:	00a53513          	sltiu	a0,a0,10
    15f6:	8082                	ret

00000000000015f8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	02000693          	li	a3,32
    15fc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fe:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1602:	ff77871b          	addw	a4,a5,-9
    1606:	04d78c63          	beq	a5,a3,165e <atoi+0x66>
    160a:	0007861b          	sext.w	a2,a5
    160e:	04e5f863          	bgeu	a1,a4,165e <atoi+0x66>
        s++;
    switch (*s)
    1612:	02b00713          	li	a4,43
    1616:	04e78963          	beq	a5,a4,1668 <atoi+0x70>
    161a:	02d00713          	li	a4,45
    161e:	06e78263          	beq	a5,a4,1682 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1622:	fd06069b          	addw	a3,a2,-48
    1626:	47a5                	li	a5,9
    1628:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    162a:	4301                	li	t1,0
    while (isdigit(*s))
    162c:	04d7e963          	bltu	a5,a3,167e <atoi+0x86>
    int n = 0, neg = 0;
    1630:	4501                	li	a0,0
    while (isdigit(*s))
    1632:	48a5                	li	a7,9
    1634:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1638:	0025179b          	sllw	a5,a0,0x2
    163c:	9fa9                	addw	a5,a5,a0
    163e:	fd06059b          	addw	a1,a2,-48
    1642:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1646:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    164a:	0705                	add	a4,a4,1
    164c:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1650:	0006861b          	sext.w	a2,a3
    1654:	ff08f0e3          	bgeu	a7,a6,1634 <atoi+0x3c>
    return neg ? n : -n;
    1658:	00030563          	beqz	t1,1662 <atoi+0x6a>
}
    165c:	8082                	ret
        s++;
    165e:	0505                	add	a0,a0,1
    1660:	bf79                	j	15fe <atoi+0x6>
    return neg ? n : -n;
    1662:	40f5853b          	subw	a0,a1,a5
    1666:	8082                	ret
    while (isdigit(*s))
    1668:	00154603          	lbu	a2,1(a0)
    166c:	47a5                	li	a5,9
        s++;
    166e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1672:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1676:	4301                	li	t1,0
    while (isdigit(*s))
    1678:	2601                	sext.w	a2,a2
    167a:	fad7fbe3          	bgeu	a5,a3,1630 <atoi+0x38>
    167e:	4501                	li	a0,0
}
    1680:	8082                	ret
    while (isdigit(*s))
    1682:	00154603          	lbu	a2,1(a0)
    1686:	47a5                	li	a5,9
        s++;
    1688:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    168c:	fd06069b          	addw	a3,a2,-48
    1690:	2601                	sext.w	a2,a2
    1692:	fed7e6e3          	bltu	a5,a3,167e <atoi+0x86>
        neg = 1;
    1696:	4305                	li	t1,1
    1698:	bf61                	j	1630 <atoi+0x38>

000000000000169a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    169a:	18060163          	beqz	a2,181c <memset+0x182>
    169e:	40a006b3          	neg	a3,a0
    16a2:	0076f793          	and	a5,a3,7
    16a6:	00778813          	add	a6,a5,7
    16aa:	48ad                	li	a7,11
    16ac:	0ff5f713          	zext.b	a4,a1
    16b0:	fff60593          	add	a1,a2,-1
    16b4:	17186563          	bltu	a6,a7,181e <memset+0x184>
    16b8:	1705ed63          	bltu	a1,a6,1832 <memset+0x198>
    16bc:	16078363          	beqz	a5,1822 <memset+0x188>
    16c0:	00e50023          	sb	a4,0(a0)
    16c4:	0066f593          	and	a1,a3,6
    16c8:	16058063          	beqz	a1,1828 <memset+0x18e>
    16cc:	00e500a3          	sb	a4,1(a0)
    16d0:	4589                	li	a1,2
    16d2:	16f5f363          	bgeu	a1,a5,1838 <memset+0x19e>
    16d6:	00e50123          	sb	a4,2(a0)
    16da:	8a91                	and	a3,a3,4
    16dc:	00350593          	add	a1,a0,3
    16e0:	4e0d                	li	t3,3
    16e2:	ce9d                	beqz	a3,1720 <memset+0x86>
    16e4:	00e501a3          	sb	a4,3(a0)
    16e8:	4691                	li	a3,4
    16ea:	00450593          	add	a1,a0,4
    16ee:	4e11                	li	t3,4
    16f0:	02f6f863          	bgeu	a3,a5,1720 <memset+0x86>
    16f4:	00e50223          	sb	a4,4(a0)
    16f8:	4695                	li	a3,5
    16fa:	00550593          	add	a1,a0,5
    16fe:	4e15                	li	t3,5
    1700:	02d78063          	beq	a5,a3,1720 <memset+0x86>
    1704:	fff50693          	add	a3,a0,-1
    1708:	00e502a3          	sb	a4,5(a0)
    170c:	8a9d                	and	a3,a3,7
    170e:	00650593          	add	a1,a0,6
    1712:	4e19                	li	t3,6
    1714:	e691                	bnez	a3,1720 <memset+0x86>
    1716:	00750593          	add	a1,a0,7
    171a:	00e50323          	sb	a4,6(a0)
    171e:	4e1d                	li	t3,7
    1720:	00871693          	sll	a3,a4,0x8
    1724:	01071813          	sll	a6,a4,0x10
    1728:	8ed9                	or	a3,a3,a4
    172a:	01871893          	sll	a7,a4,0x18
    172e:	0106e6b3          	or	a3,a3,a6
    1732:	0116e6b3          	or	a3,a3,a7
    1736:	02071813          	sll	a6,a4,0x20
    173a:	02871313          	sll	t1,a4,0x28
    173e:	0106e6b3          	or	a3,a3,a6
    1742:	40f608b3          	sub	a7,a2,a5
    1746:	03071813          	sll	a6,a4,0x30
    174a:	0066e6b3          	or	a3,a3,t1
    174e:	0106e6b3          	or	a3,a3,a6
    1752:	03871313          	sll	t1,a4,0x38
    1756:	97aa                	add	a5,a5,a0
    1758:	ff88f813          	and	a6,a7,-8
    175c:	0066e6b3          	or	a3,a3,t1
    1760:	983e                	add	a6,a6,a5
    1762:	e394                	sd	a3,0(a5)
    1764:	07a1                	add	a5,a5,8
    1766:	ff079ee3          	bne	a5,a6,1762 <memset+0xc8>
    176a:	ff88f793          	and	a5,a7,-8
    176e:	0078f893          	and	a7,a7,7
    1772:	00f586b3          	add	a3,a1,a5
    1776:	01c787bb          	addw	a5,a5,t3
    177a:	0a088b63          	beqz	a7,1830 <memset+0x196>
    177e:	00e68023          	sb	a4,0(a3)
    1782:	0017859b          	addw	a1,a5,1
    1786:	08c5fb63          	bgeu	a1,a2,181c <memset+0x182>
    178a:	00e680a3          	sb	a4,1(a3)
    178e:	0027859b          	addw	a1,a5,2
    1792:	08c5f563          	bgeu	a1,a2,181c <memset+0x182>
    1796:	00e68123          	sb	a4,2(a3)
    179a:	0037859b          	addw	a1,a5,3
    179e:	06c5ff63          	bgeu	a1,a2,181c <memset+0x182>
    17a2:	00e681a3          	sb	a4,3(a3)
    17a6:	0047859b          	addw	a1,a5,4
    17aa:	06c5f963          	bgeu	a1,a2,181c <memset+0x182>
    17ae:	00e68223          	sb	a4,4(a3)
    17b2:	0057859b          	addw	a1,a5,5
    17b6:	06c5f363          	bgeu	a1,a2,181c <memset+0x182>
    17ba:	00e682a3          	sb	a4,5(a3)
    17be:	0067859b          	addw	a1,a5,6
    17c2:	04c5fd63          	bgeu	a1,a2,181c <memset+0x182>
    17c6:	00e68323          	sb	a4,6(a3)
    17ca:	0077859b          	addw	a1,a5,7
    17ce:	04c5f763          	bgeu	a1,a2,181c <memset+0x182>
    17d2:	00e683a3          	sb	a4,7(a3)
    17d6:	0087859b          	addw	a1,a5,8
    17da:	04c5f163          	bgeu	a1,a2,181c <memset+0x182>
    17de:	00e68423          	sb	a4,8(a3)
    17e2:	0097859b          	addw	a1,a5,9
    17e6:	02c5fb63          	bgeu	a1,a2,181c <memset+0x182>
    17ea:	00e684a3          	sb	a4,9(a3)
    17ee:	00a7859b          	addw	a1,a5,10
    17f2:	02c5f563          	bgeu	a1,a2,181c <memset+0x182>
    17f6:	00e68523          	sb	a4,10(a3)
    17fa:	00b7859b          	addw	a1,a5,11
    17fe:	00c5ff63          	bgeu	a1,a2,181c <memset+0x182>
    1802:	00e685a3          	sb	a4,11(a3)
    1806:	00c7859b          	addw	a1,a5,12
    180a:	00c5f963          	bgeu	a1,a2,181c <memset+0x182>
    180e:	00e68623          	sb	a4,12(a3)
    1812:	27b5                	addw	a5,a5,13
    1814:	00c7f463          	bgeu	a5,a2,181c <memset+0x182>
    1818:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    181c:	8082                	ret
    181e:	482d                	li	a6,11
    1820:	bd61                	j	16b8 <memset+0x1e>
    char *p = dest;
    1822:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1824:	4e01                	li	t3,0
    1826:	bded                	j	1720 <memset+0x86>
    1828:	00150593          	add	a1,a0,1
    182c:	4e05                	li	t3,1
    182e:	bdcd                	j	1720 <memset+0x86>
    1830:	8082                	ret
    char *p = dest;
    1832:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1834:	4781                	li	a5,0
    1836:	b7a1                	j	177e <memset+0xe4>
    1838:	00250593          	add	a1,a0,2
    183c:	4e09                	li	t3,2
    183e:	b5cd                	j	1720 <memset+0x86>

0000000000001840 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1840:	00054783          	lbu	a5,0(a0)
    1844:	0005c703          	lbu	a4,0(a1)
    1848:	00e79863          	bne	a5,a4,1858 <strcmp+0x18>
    184c:	0505                	add	a0,a0,1
    184e:	0585                	add	a1,a1,1
    1850:	fbe5                	bnez	a5,1840 <strcmp>
    1852:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1854:	9d19                	subw	a0,a0,a4
    1856:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1858:	0007851b          	sext.w	a0,a5
    185c:	bfe5                	j	1854 <strcmp+0x14>

000000000000185e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    185e:	ca15                	beqz	a2,1892 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1860:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1864:	167d                	add	a2,a2,-1
    1866:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186a:	eb99                	bnez	a5,1880 <strncmp+0x22>
    186c:	a815                	j	18a0 <strncmp+0x42>
    186e:	00a68e63          	beq	a3,a0,188a <strncmp+0x2c>
    1872:	0505                	add	a0,a0,1
    1874:	00f71b63          	bne	a4,a5,188a <strncmp+0x2c>
    1878:	00054783          	lbu	a5,0(a0)
    187c:	cf89                	beqz	a5,1896 <strncmp+0x38>
    187e:	85b2                	mv	a1,a2
    1880:	0005c703          	lbu	a4,0(a1)
    1884:	00158613          	add	a2,a1,1
    1888:	f37d                	bnez	a4,186e <strncmp+0x10>
        ;
    return *l - *r;
    188a:	0007851b          	sext.w	a0,a5
    188e:	9d19                	subw	a0,a0,a4
    1890:	8082                	ret
        return 0;
    1892:	4501                	li	a0,0
}
    1894:	8082                	ret
    return *l - *r;
    1896:	0015c703          	lbu	a4,1(a1)
    189a:	4501                	li	a0,0
    189c:	9d19                	subw	a0,a0,a4
    189e:	8082                	ret
    18a0:	0005c703          	lbu	a4,0(a1)
    18a4:	4501                	li	a0,0
    18a6:	b7e5                	j	188e <strncmp+0x30>

00000000000018a8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a8:	00757793          	and	a5,a0,7
    18ac:	cf89                	beqz	a5,18c6 <strlen+0x1e>
    18ae:	87aa                	mv	a5,a0
    18b0:	a029                	j	18ba <strlen+0x12>
    18b2:	0785                	add	a5,a5,1
    18b4:	0077f713          	and	a4,a5,7
    18b8:	cb01                	beqz	a4,18c8 <strlen+0x20>
        if (!*s)
    18ba:	0007c703          	lbu	a4,0(a5)
    18be:	fb75                	bnez	a4,18b2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18c0:	40a78533          	sub	a0,a5,a0
}
    18c4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c8:	6394                	ld	a3,0(a5)
    18ca:	00000597          	auipc	a1,0x0
    18ce:	6c65b583          	ld	a1,1734(a1) # 1f90 <__clone+0xae>
    18d2:	00000617          	auipc	a2,0x0
    18d6:	6c663603          	ld	a2,1734(a2) # 1f98 <__clone+0xb6>
    18da:	a019                	j	18e0 <strlen+0x38>
    18dc:	6794                	ld	a3,8(a5)
    18de:	07a1                	add	a5,a5,8
    18e0:	00b68733          	add	a4,a3,a1
    18e4:	fff6c693          	not	a3,a3
    18e8:	8f75                	and	a4,a4,a3
    18ea:	8f71                	and	a4,a4,a2
    18ec:	db65                	beqz	a4,18dc <strlen+0x34>
    for (; *s; s++)
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	d779                	beqz	a4,18c0 <strlen+0x18>
    18f4:	0017c703          	lbu	a4,1(a5)
    18f8:	0785                	add	a5,a5,1
    18fa:	d379                	beqz	a4,18c0 <strlen+0x18>
    18fc:	0017c703          	lbu	a4,1(a5)
    1900:	0785                	add	a5,a5,1
    1902:	fb6d                	bnez	a4,18f4 <strlen+0x4c>
    1904:	bf75                	j	18c0 <strlen+0x18>

0000000000001906 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1906:	00757713          	and	a4,a0,7
{
    190a:	87aa                	mv	a5,a0
    190c:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1910:	cb19                	beqz	a4,1926 <memchr+0x20>
    1912:	ce25                	beqz	a2,198a <memchr+0x84>
    1914:	0007c703          	lbu	a4,0(a5)
    1918:	00b70763          	beq	a4,a1,1926 <memchr+0x20>
    191c:	0785                	add	a5,a5,1
    191e:	0077f713          	and	a4,a5,7
    1922:	167d                	add	a2,a2,-1
    1924:	f77d                	bnez	a4,1912 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1926:	4501                	li	a0,0
    if (n && *s != c)
    1928:	c235                	beqz	a2,198c <memchr+0x86>
    192a:	0007c703          	lbu	a4,0(a5)
    192e:	06b70063          	beq	a4,a1,198e <memchr+0x88>
        size_t k = ONES * c;
    1932:	00000517          	auipc	a0,0x0
    1936:	66e53503          	ld	a0,1646(a0) # 1fa0 <__clone+0xbe>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193a:	471d                	li	a4,7
        size_t k = ONES * c;
    193c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1940:	04c77763          	bgeu	a4,a2,198e <memchr+0x88>
    1944:	00000897          	auipc	a7,0x0
    1948:	64c8b883          	ld	a7,1612(a7) # 1f90 <__clone+0xae>
    194c:	00000817          	auipc	a6,0x0
    1950:	64c83803          	ld	a6,1612(a6) # 1f98 <__clone+0xb6>
    1954:	431d                	li	t1,7
    1956:	a029                	j	1960 <memchr+0x5a>
    1958:	1661                	add	a2,a2,-8
    195a:	07a1                	add	a5,a5,8
    195c:	00c37c63          	bgeu	t1,a2,1974 <memchr+0x6e>
    1960:	6398                	ld	a4,0(a5)
    1962:	8f29                	xor	a4,a4,a0
    1964:	011706b3          	add	a3,a4,a7
    1968:	fff74713          	not	a4,a4
    196c:	8f75                	and	a4,a4,a3
    196e:	01077733          	and	a4,a4,a6
    1972:	d37d                	beqz	a4,1958 <memchr+0x52>
    1974:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1976:	e601                	bnez	a2,197e <memchr+0x78>
    1978:	a809                	j	198a <memchr+0x84>
    197a:	0505                	add	a0,a0,1
    197c:	c619                	beqz	a2,198a <memchr+0x84>
    197e:	00054783          	lbu	a5,0(a0)
    1982:	167d                	add	a2,a2,-1
    1984:	feb79be3          	bne	a5,a1,197a <memchr+0x74>
    1988:	8082                	ret
    return n ? (void *)s : 0;
    198a:	4501                	li	a0,0
}
    198c:	8082                	ret
    if (n && *s != c)
    198e:	853e                	mv	a0,a5
    1990:	b7fd                	j	197e <memchr+0x78>

0000000000001992 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1992:	1101                	add	sp,sp,-32
    1994:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1996:	862e                	mv	a2,a1
{
    1998:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    199a:	4581                	li	a1,0
{
    199c:	e426                	sd	s1,8(sp)
    199e:	ec06                	sd	ra,24(sp)
    19a0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19a2:	f65ff0ef          	jal	1906 <memchr>
    return p ? p - s : n;
    19a6:	c519                	beqz	a0,19b4 <strnlen+0x22>
}
    19a8:	60e2                	ld	ra,24(sp)
    19aa:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ac:	8d05                	sub	a0,a0,s1
}
    19ae:	64a2                	ld	s1,8(sp)
    19b0:	6105                	add	sp,sp,32
    19b2:	8082                	ret
    19b4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b6:	8522                	mv	a0,s0
}
    19b8:	6442                	ld	s0,16(sp)
    19ba:	64a2                	ld	s1,8(sp)
    19bc:	6105                	add	sp,sp,32
    19be:	8082                	ret

00000000000019c0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c0:	00a5c7b3          	xor	a5,a1,a0
    19c4:	8b9d                	and	a5,a5,7
    19c6:	eb95                	bnez	a5,19fa <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c8:	0075f793          	and	a5,a1,7
    19cc:	e7b1                	bnez	a5,1a18 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ce:	6198                	ld	a4,0(a1)
    19d0:	00000617          	auipc	a2,0x0
    19d4:	5c063603          	ld	a2,1472(a2) # 1f90 <__clone+0xae>
    19d8:	00000817          	auipc	a6,0x0
    19dc:	5c083803          	ld	a6,1472(a6) # 1f98 <__clone+0xb6>
    19e0:	a029                	j	19ea <strcpy+0x2a>
    19e2:	05a1                	add	a1,a1,8
    19e4:	e118                	sd	a4,0(a0)
    19e6:	6198                	ld	a4,0(a1)
    19e8:	0521                	add	a0,a0,8
    19ea:	00c707b3          	add	a5,a4,a2
    19ee:	fff74693          	not	a3,a4
    19f2:	8ff5                	and	a5,a5,a3
    19f4:	0107f7b3          	and	a5,a5,a6
    19f8:	d7ed                	beqz	a5,19e2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19fa:	0005c783          	lbu	a5,0(a1)
    19fe:	00f50023          	sb	a5,0(a0)
    1a02:	c785                	beqz	a5,1a2a <strcpy+0x6a>
    1a04:	0015c783          	lbu	a5,1(a1)
    1a08:	0505                	add	a0,a0,1
    1a0a:	0585                	add	a1,a1,1
    1a0c:	00f50023          	sb	a5,0(a0)
    1a10:	fbf5                	bnez	a5,1a04 <strcpy+0x44>
        ;
    return d;
}
    1a12:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a14:	0505                	add	a0,a0,1
    1a16:	df45                	beqz	a4,19ce <strcpy+0xe>
            if (!(*d = *s))
    1a18:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a1c:	0585                	add	a1,a1,1
    1a1e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a22:	00f50023          	sb	a5,0(a0)
    1a26:	f7fd                	bnez	a5,1a14 <strcpy+0x54>
}
    1a28:	8082                	ret
    1a2a:	8082                	ret

0000000000001a2c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a2c:	00a5c7b3          	xor	a5,a1,a0
    1a30:	8b9d                	and	a5,a5,7
    1a32:	e3b5                	bnez	a5,1a96 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a34:	0075f793          	and	a5,a1,7
    1a38:	cf99                	beqz	a5,1a56 <strncpy+0x2a>
    1a3a:	ea09                	bnez	a2,1a4c <strncpy+0x20>
    1a3c:	a421                	j	1c44 <strncpy+0x218>
    1a3e:	0585                	add	a1,a1,1
    1a40:	0075f793          	and	a5,a1,7
    1a44:	167d                	add	a2,a2,-1
    1a46:	0505                	add	a0,a0,1
    1a48:	c799                	beqz	a5,1a56 <strncpy+0x2a>
    1a4a:	c225                	beqz	a2,1aaa <strncpy+0x7e>
    1a4c:	0005c783          	lbu	a5,0(a1)
    1a50:	00f50023          	sb	a5,0(a0)
    1a54:	f7ed                	bnez	a5,1a3e <strncpy+0x12>
            ;
        if (!n || !*s)
    1a56:	ca31                	beqz	a2,1aaa <strncpy+0x7e>
    1a58:	0005c783          	lbu	a5,0(a1)
    1a5c:	cba1                	beqz	a5,1aac <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a5e:	479d                	li	a5,7
    1a60:	02c7fc63          	bgeu	a5,a2,1a98 <strncpy+0x6c>
    1a64:	00000897          	auipc	a7,0x0
    1a68:	52c8b883          	ld	a7,1324(a7) # 1f90 <__clone+0xae>
    1a6c:	00000817          	auipc	a6,0x0
    1a70:	52c83803          	ld	a6,1324(a6) # 1f98 <__clone+0xb6>
    1a74:	431d                	li	t1,7
    1a76:	a039                	j	1a84 <strncpy+0x58>
            *wd = *ws;
    1a78:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a7a:	1661                	add	a2,a2,-8
    1a7c:	05a1                	add	a1,a1,8
    1a7e:	0521                	add	a0,a0,8
    1a80:	00c37b63          	bgeu	t1,a2,1a96 <strncpy+0x6a>
    1a84:	6198                	ld	a4,0(a1)
    1a86:	011707b3          	add	a5,a4,a7
    1a8a:	fff74693          	not	a3,a4
    1a8e:	8ff5                	and	a5,a5,a3
    1a90:	0107f7b3          	and	a5,a5,a6
    1a94:	d3f5                	beqz	a5,1a78 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a96:	ca11                	beqz	a2,1aaa <strncpy+0x7e>
    1a98:	0005c783          	lbu	a5,0(a1)
    1a9c:	0585                	add	a1,a1,1
    1a9e:	00f50023          	sb	a5,0(a0)
    1aa2:	c789                	beqz	a5,1aac <strncpy+0x80>
    1aa4:	167d                	add	a2,a2,-1
    1aa6:	0505                	add	a0,a0,1
    1aa8:	fa65                	bnez	a2,1a98 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aaa:	8082                	ret
    1aac:	4805                	li	a6,1
    1aae:	14061b63          	bnez	a2,1c04 <strncpy+0x1d8>
    1ab2:	40a00733          	neg	a4,a0
    1ab6:	00777793          	and	a5,a4,7
    1aba:	4581                	li	a1,0
    1abc:	12061c63          	bnez	a2,1bf4 <strncpy+0x1c8>
    1ac0:	00778693          	add	a3,a5,7
    1ac4:	48ad                	li	a7,11
    1ac6:	1316e563          	bltu	a3,a7,1bf0 <strncpy+0x1c4>
    1aca:	16d5e263          	bltu	a1,a3,1c2e <strncpy+0x202>
    1ace:	14078c63          	beqz	a5,1c26 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ad2:	00050023          	sb	zero,0(a0)
    1ad6:	00677693          	and	a3,a4,6
    1ada:	14068263          	beqz	a3,1c1e <strncpy+0x1f2>
    1ade:	000500a3          	sb	zero,1(a0)
    1ae2:	4689                	li	a3,2
    1ae4:	14f6f863          	bgeu	a3,a5,1c34 <strncpy+0x208>
    1ae8:	00050123          	sb	zero,2(a0)
    1aec:	8b11                	and	a4,a4,4
    1aee:	12070463          	beqz	a4,1c16 <strncpy+0x1ea>
    1af2:	000501a3          	sb	zero,3(a0)
    1af6:	4711                	li	a4,4
    1af8:	00450693          	add	a3,a0,4
    1afc:	02f77563          	bgeu	a4,a5,1b26 <strncpy+0xfa>
    1b00:	00050223          	sb	zero,4(a0)
    1b04:	4715                	li	a4,5
    1b06:	00550693          	add	a3,a0,5
    1b0a:	00e78e63          	beq	a5,a4,1b26 <strncpy+0xfa>
    1b0e:	fff50713          	add	a4,a0,-1
    1b12:	000502a3          	sb	zero,5(a0)
    1b16:	8b1d                	and	a4,a4,7
    1b18:	12071263          	bnez	a4,1c3c <strncpy+0x210>
    1b1c:	00750693          	add	a3,a0,7
    1b20:	00050323          	sb	zero,6(a0)
    1b24:	471d                	li	a4,7
    1b26:	40f80833          	sub	a6,a6,a5
    1b2a:	ff887593          	and	a1,a6,-8
    1b2e:	97aa                	add	a5,a5,a0
    1b30:	95be                	add	a1,a1,a5
    1b32:	0007b023          	sd	zero,0(a5)
    1b36:	07a1                	add	a5,a5,8
    1b38:	feb79de3          	bne	a5,a1,1b32 <strncpy+0x106>
    1b3c:	ff887593          	and	a1,a6,-8
    1b40:	00787813          	and	a6,a6,7
    1b44:	00e587bb          	addw	a5,a1,a4
    1b48:	00b68733          	add	a4,a3,a1
    1b4c:	0e080063          	beqz	a6,1c2c <strncpy+0x200>
    1b50:	00070023          	sb	zero,0(a4)
    1b54:	0017869b          	addw	a3,a5,1
    1b58:	f4c6f9e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b5c:	000700a3          	sb	zero,1(a4)
    1b60:	0027869b          	addw	a3,a5,2
    1b64:	f4c6f3e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b68:	00070123          	sb	zero,2(a4)
    1b6c:	0037869b          	addw	a3,a5,3
    1b70:	f2c6fde3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b74:	000701a3          	sb	zero,3(a4)
    1b78:	0047869b          	addw	a3,a5,4
    1b7c:	f2c6f7e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b80:	00070223          	sb	zero,4(a4)
    1b84:	0057869b          	addw	a3,a5,5
    1b88:	f2c6f1e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b8c:	000702a3          	sb	zero,5(a4)
    1b90:	0067869b          	addw	a3,a5,6
    1b94:	f0c6fbe3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1b98:	00070323          	sb	zero,6(a4)
    1b9c:	0077869b          	addw	a3,a5,7
    1ba0:	f0c6f5e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1ba4:	000703a3          	sb	zero,7(a4)
    1ba8:	0087869b          	addw	a3,a5,8
    1bac:	eec6ffe3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1bb0:	00070423          	sb	zero,8(a4)
    1bb4:	0097869b          	addw	a3,a5,9
    1bb8:	eec6f9e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1bbc:	000704a3          	sb	zero,9(a4)
    1bc0:	00a7869b          	addw	a3,a5,10
    1bc4:	eec6f3e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1bc8:	00070523          	sb	zero,10(a4)
    1bcc:	00b7869b          	addw	a3,a5,11
    1bd0:	ecc6fde3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1bd4:	000705a3          	sb	zero,11(a4)
    1bd8:	00c7869b          	addw	a3,a5,12
    1bdc:	ecc6f7e3          	bgeu	a3,a2,1aaa <strncpy+0x7e>
    1be0:	00070623          	sb	zero,12(a4)
    1be4:	27b5                	addw	a5,a5,13
    1be6:	ecc7f2e3          	bgeu	a5,a2,1aaa <strncpy+0x7e>
    1bea:	000706a3          	sb	zero,13(a4)
}
    1bee:	8082                	ret
    1bf0:	46ad                	li	a3,11
    1bf2:	bde1                	j	1aca <strncpy+0x9e>
    1bf4:	00778693          	add	a3,a5,7
    1bf8:	48ad                	li	a7,11
    1bfa:	fff60593          	add	a1,a2,-1
    1bfe:	ed16f6e3          	bgeu	a3,a7,1aca <strncpy+0x9e>
    1c02:	b7fd                	j	1bf0 <strncpy+0x1c4>
    1c04:	40a00733          	neg	a4,a0
    1c08:	8832                	mv	a6,a2
    1c0a:	00777793          	and	a5,a4,7
    1c0e:	4581                	li	a1,0
    1c10:	ea0608e3          	beqz	a2,1ac0 <strncpy+0x94>
    1c14:	b7c5                	j	1bf4 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c16:	00350693          	add	a3,a0,3
    1c1a:	470d                	li	a4,3
    1c1c:	b729                	j	1b26 <strncpy+0xfa>
    1c1e:	00150693          	add	a3,a0,1
    1c22:	4705                	li	a4,1
    1c24:	b709                	j	1b26 <strncpy+0xfa>
tail:
    1c26:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c28:	4701                	li	a4,0
    1c2a:	bdf5                	j	1b26 <strncpy+0xfa>
    1c2c:	8082                	ret
tail:
    1c2e:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c30:	4781                	li	a5,0
    1c32:	bf39                	j	1b50 <strncpy+0x124>
    1c34:	00250693          	add	a3,a0,2
    1c38:	4709                	li	a4,2
    1c3a:	b5f5                	j	1b26 <strncpy+0xfa>
    1c3c:	00650693          	add	a3,a0,6
    1c40:	4719                	li	a4,6
    1c42:	b5d5                	j	1b26 <strncpy+0xfa>
    1c44:	8082                	ret

0000000000001c46 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c46:	87aa                	mv	a5,a0
    1c48:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c4a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c54:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c56:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <openat>:
    register long a7 __asm__("a7") = n;
    1c5e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c62:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c66:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <close>:
    register long a7 __asm__("a7") = n;
    1c6e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c72:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <read>:
    register long a7 __asm__("a7") = n;
    1c7a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c82:	8082                	ret

0000000000001c84 <write>:
    register long a7 __asm__("a7") = n;
    1c84:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c88:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c8c:	8082                	ret

0000000000001c8e <getpid>:
    register long a7 __asm__("a7") = n;
    1c8e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c92:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <getppid>:
    register long a7 __asm__("a7") = n;
    1c9a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c9e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1caa:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <fork>:
    register long a7 __asm__("a7") = n;
    1cb2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cba:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cc2:	85b2                	mv	a1,a2
    1cc4:	863a                	mv	a2,a4
    if (stack)
    1cc6:	c191                	beqz	a1,1cca <clone+0x8>
	stack += stack_size;
    1cc8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cca:	4781                	li	a5,0
    1ccc:	4701                	li	a4,0
    1cce:	4681                	li	a3,0
    1cd0:	2601                	sext.w	a2,a2
    1cd2:	ac01                	j	1ee2 <__clone>

0000000000001cd4 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cd4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cd8:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cdc:	8082                	ret

0000000000001cde <exit>:
    register long a7 __asm__("a7") = n;
    1cde:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce6:	8082                	ret

0000000000001ce8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cee:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <exec>:
    register long a7 __asm__("a7") = n;
    1cf6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <execve>:
    register long a7 __asm__("a7") = n;
    1d02:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d06:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <times>:
    register long a7 __asm__("a7") = n;
    1d0e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d12:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <get_time>:

int64 get_time()
{
    1d1a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d1c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d20:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d22:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d28:	2501                	sext.w	a0,a0
    1d2a:	ed09                	bnez	a0,1d44 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d2c:	67a2                	ld	a5,8(sp)
    1d2e:	3e800713          	li	a4,1000
    1d32:	00015503          	lhu	a0,0(sp)
    1d36:	02e7d7b3          	divu	a5,a5,a4
    1d3a:	02e50533          	mul	a0,a0,a4
    1d3e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d40:	0141                	add	sp,sp,16
    1d42:	8082                	ret
        return -1;
    1d44:	557d                	li	a0,-1
    1d46:	bfed                	j	1d40 <get_time+0x26>

0000000000001d48 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d48:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <time>:
    register long a7 __asm__("a7") = n;
    1d54:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <sleep>:

int sleep(unsigned long long time)
{
    1d60:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d62:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d64:	850a                	mv	a0,sp
    1d66:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d68:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d6c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d72:	e501                	bnez	a0,1d7a <sleep+0x1a>
    return 0;
    1d74:	4501                	li	a0,0
}
    1d76:	0141                	add	sp,sp,16
    1d78:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7a:	4502                	lw	a0,0(sp)
}
    1d7c:	0141                	add	sp,sp,16
    1d7e:	8082                	ret

0000000000001d80 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d80:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d8c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d90:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d94:	8082                	ret

0000000000001d96 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d96:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9a:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <munmap>:
    register long a7 __asm__("a7") = n;
    1da2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <wait>:

int wait(int *code)
{
    1dae:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1db4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dba:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <spawn>:
    register long a7 __asm__("a7") = n;
    1dc2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <mailread>:
    register long a7 __asm__("a7") = n;
    1dce:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dda:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dde:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <fstat>:
    register long a7 __asm__("a7") = n;
    1de6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1df2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df4:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1df8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e02:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e04:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e08:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e12:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e14:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e18:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <link>:

int link(char *old_path, char *new_path)
{
    1e22:	87aa                	mv	a5,a0
    1e24:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e26:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e2a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e2e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e30:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e34:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e36:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <unlink>:

int unlink(char *path)
{
    1e3e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e40:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e44:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e48:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <uname>:
    register long a7 __asm__("a7") = n;
    1e52:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e56:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <brk>:
    register long a7 __asm__("a7") = n;
    1e5e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e6a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e70:	8082                	ret

0000000000001e72 <chdir>:
    register long a7 __asm__("a7") = n;
    1e72:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e7e:	862e                	mv	a2,a1
    1e80:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e82:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e84:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e8e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e90:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <getdents>:
    register long a7 __asm__("a7") = n;
    1e98:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <pipe>:
    register long a7 __asm__("a7") = n;
    1ea4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eaa:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <dup>:
    register long a7 __asm__("a7") = n;
    1eb2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eb4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <dup2>:
    register long a7 __asm__("a7") = n;
    1ebc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ebe:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <mount>:
    register long a7 __asm__("a7") = n;
    1ec8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ecc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <umount>:
    register long a7 __asm__("a7") = n;
    1ed4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ee2:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ee4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ee6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee8:	8532                	mv	a0,a2
	mv a2, a4
    1eea:	863a                	mv	a2,a4
	mv a3, a5
    1eec:	86be                	mv	a3,a5
	mv a4, a6
    1eee:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ef0:	0dc00893          	li	a7,220
	ecall
    1ef4:	00000073          	ecall

	beqz a0, 1f
    1ef8:	c111                	beqz	a0,1efc <__clone+0x1a>
	# Parent
	ret
    1efa:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1efc:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1efe:	6522                	ld	a0,8(sp)
	jalr a1
    1f00:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f02:	05d00893          	li	a7,93
	ecall
    1f06:	00000073          	ecall
