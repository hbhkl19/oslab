
/home/hbh/oslab/oslab/user/build/riscv64/gettimeofday:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8d9                	j	10d8 <__start_main>

0000000000001004 <test_gettimeofday>:
 * "start:[num], end:[num]"
 * "interval: [num]"	注：数字[num]的值应大于0
 * 测试失败时的输出：
 * "gettimeofday error."
 */
void test_gettimeofday() {
    1004:	7179                	add	sp,sp,-48
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	efa50513          	add	a0,a0,-262 # 1f00 <__clone+0x2c>
void test_gettimeofday() {
    100e:	f406                	sd	ra,40(sp)
    1010:	ec26                	sd	s1,24(sp)
    1012:	f022                	sd	s0,32(sp)
	TEST_START(__func__);
    1014:	31c000ef          	jal	1330 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f9850513          	add	a0,a0,-104 # 1fb0 <__func__.0>
    1020:	310000ef          	jal	1330 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	ef450513          	add	a0,a0,-268 # 1f18 <__clone+0x44>
    102c:	304000ef          	jal	1330 <puts>
	int test_ret1 = get_time();
    1030:	4dd000ef          	jal	1d0c <get_time>
	volatile int i = 12500000;	// qemu时钟频率12500000
    1034:	00bec7b7          	lui	a5,0xbec
    1038:	c2078793          	add	a5,a5,-992 # bebc20 <digits+0xbe9c58>
    103c:	c63e                	sw	a5,12(sp)
	while(i > 0) i--;
    103e:	47b2                	lw	a5,12(sp)
	int test_ret1 = get_time();
    1040:	0005049b          	sext.w	s1,a0
	while(i > 0) i--;
    1044:	00f05863          	blez	a5,1054 <test_gettimeofday+0x50>
    1048:	47b2                	lw	a5,12(sp)
    104a:	37fd                	addw	a5,a5,-1
    104c:	c63e                	sw	a5,12(sp)
    104e:	47b2                	lw	a5,12(sp)
    1050:	fef04ce3          	bgtz	a5,1048 <test_gettimeofday+0x44>
	int test_ret2 = get_time();
    1054:	4b9000ef          	jal	1d0c <get_time>
	if(test_ret1 > 0 && test_ret2 > 0){
    1058:	00905663          	blez	s1,1064 <test_gettimeofday+0x60>
	int test_ret2 = get_time();
    105c:	0005041b          	sext.w	s0,a0
	if(test_ret1 > 0 && test_ret2 > 0){
    1060:	02804d63          	bgtz	s0,109a <test_gettimeofday+0x96>
		printf("gettimeofday success.\n");
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
                printf("interval: %d\n", test_ret2 - test_ret1);
	}else{
		printf("gettimeofday error.\n");
    1064:	00001517          	auipc	a0,0x1
    1068:	f0450513          	add	a0,a0,-252 # 1f68 <__clone+0x94>
    106c:	2e6000ef          	jal	1352 <printf>
	}
	TEST_END(__func__);
    1070:	00001517          	auipc	a0,0x1
    1074:	f1050513          	add	a0,a0,-240 # 1f80 <__clone+0xac>
    1078:	2b8000ef          	jal	1330 <puts>
    107c:	00001517          	auipc	a0,0x1
    1080:	f3450513          	add	a0,a0,-204 # 1fb0 <__func__.0>
    1084:	2ac000ef          	jal	1330 <puts>
}
    1088:	7402                	ld	s0,32(sp)
    108a:	70a2                	ld	ra,40(sp)
    108c:	64e2                	ld	s1,24(sp)
	TEST_END(__func__);
    108e:	00001517          	auipc	a0,0x1
    1092:	e8a50513          	add	a0,a0,-374 # 1f18 <__clone+0x44>
}
    1096:	6145                	add	sp,sp,48
	TEST_END(__func__);
    1098:	ac61                	j	1330 <puts>
		printf("gettimeofday success.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	e8e50513          	add	a0,a0,-370 # 1f28 <__clone+0x54>
    10a2:	2b0000ef          	jal	1352 <printf>
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
    10a6:	85a6                	mv	a1,s1
    10a8:	8622                	mv	a2,s0
    10aa:	00001517          	auipc	a0,0x1
    10ae:	e9650513          	add	a0,a0,-362 # 1f40 <__clone+0x6c>
    10b2:	2a0000ef          	jal	1352 <printf>
                printf("interval: %d\n", test_ret2 - test_ret1);
    10b6:	409405bb          	subw	a1,s0,s1
    10ba:	00001517          	auipc	a0,0x1
    10be:	e9e50513          	add	a0,a0,-354 # 1f58 <__clone+0x84>
    10c2:	290000ef          	jal	1352 <printf>
    10c6:	b76d                	j	1070 <test_gettimeofday+0x6c>

00000000000010c8 <main>:

int main(void) {
    10c8:	1141                	add	sp,sp,-16
    10ca:	e406                	sd	ra,8(sp)
	test_gettimeofday();
    10cc:	f39ff0ef          	jal	1004 <test_gettimeofday>
	return 0;
}
    10d0:	60a2                	ld	ra,8(sp)
    10d2:	4501                	li	a0,0
    10d4:	0141                	add	sp,sp,16
    10d6:	8082                	ret

00000000000010d8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10da:	4108                	lw	a0,0(a0)
{
    10dc:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10de:	05a1                	add	a1,a1,8
{
    10e0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10e2:	fe7ff0ef          	jal	10c8 <main>
    10e6:	3eb000ef          	jal	1cd0 <exit>
	return 0;
}
    10ea:	60a2                	ld	ra,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	0141                	add	sp,sp,16
    10f0:	8082                	ret

00000000000010f2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10f2:	7179                	add	sp,sp,-48
    10f4:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f6:	12054863          	bltz	a0,1226 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fa:	02b577bb          	remuw	a5,a0,a1
    10fe:	00001697          	auipc	a3,0x1
    1102:	eca68693          	add	a3,a3,-310 # 1fc8 <digits>
    buf[16] = 0;
    1106:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110a:	0005871b          	sext.w	a4,a1
    110e:	1782                	sll	a5,a5,0x20
    1110:	9381                	srl	a5,a5,0x20
    1112:	97b6                	add	a5,a5,a3
    1114:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1118:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    111c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1120:	1ab56663          	bltu	a0,a1,12cc <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1124:	02e8763b          	remuw	a2,a6,a4
    1128:	1602                	sll	a2,a2,0x20
    112a:	9201                	srl	a2,a2,0x20
    112c:	9636                	add	a2,a2,a3
    112e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1132:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1136:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    113a:	12e86c63          	bltu	a6,a4,1272 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    113e:	02e5f63b          	remuw	a2,a1,a4
    1142:	1602                	sll	a2,a2,0x20
    1144:	9201                	srl	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1150:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1154:	12e5e863          	bltu	a1,a4,1284 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1158:	02e8763b          	remuw	a2,a6,a4
    115c:	1602                	sll	a2,a2,0x20
    115e:	9201                	srl	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    116e:	12e86463          	bltu	a6,a4,1296 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1172:	02e5f63b          	remuw	a2,a1,a4
    1176:	1602                	sll	a2,a2,0x20
    1178:	9201                	srl	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1184:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1188:	12e5e063          	bltu	a1,a4,12a8 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    118c:	02e8763b          	remuw	a2,a6,a4
    1190:	1602                	sll	a2,a2,0x20
    1192:	9201                	srl	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    119e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11a2:	0ae86f63          	bltu	a6,a4,1260 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11a6:	02e5f63b          	remuw	a2,a1,a4
    11aa:	1602                	sll	a2,a2,0x20
    11ac:	9201                	srl	a2,a2,0x20
    11ae:	9636                	add	a2,a2,a3
    11b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11bc:	0ee5ef63          	bltu	a1,a4,12ba <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11c0:	02e8763b          	remuw	a2,a6,a4
    11c4:	1602                	sll	a2,a2,0x20
    11c6:	9201                	srl	a2,a2,0x20
    11c8:	9636                	add	a2,a2,a3
    11ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ce:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11d6:	0ee86d63          	bltu	a6,a4,12d0 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11da:	02e5f63b          	remuw	a2,a1,a4
    11de:	1602                	sll	a2,a2,0x20
    11e0:	9201                	srl	a2,a2,0x20
    11e2:	9636                	add	a2,a2,a3
    11e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ec:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f0:	0ee5e963          	bltu	a1,a4,12e2 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11f4:	1782                	sll	a5,a5,0x20
    11f6:	9381                	srl	a5,a5,0x20
    11f8:	96be                	add	a3,a3,a5
    11fa:	0006c783          	lbu	a5,0(a3)
    11fe:	4599                	li	a1,6
    1200:	00f10723          	sb	a5,14(sp)

    if (sign)
    1204:	00055763          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1210:	4595                	li	a1,5
    write(f, s, l);
    1212:	003c                	add	a5,sp,8
    1214:	4641                	li	a2,16
    1216:	9e0d                	subw	a2,a2,a1
    1218:	4505                	li	a0,1
    121a:	95be                	add	a1,a1,a5
    121c:	25b000ef          	jal	1c76 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1220:	70a2                	ld	ra,40(sp)
    1222:	6145                	add	sp,sp,48
    1224:	8082                	ret
        x = -xx;
    1226:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    122a:	02b677bb          	remuw	a5,a2,a1
    122e:	00001697          	auipc	a3,0x1
    1232:	d9a68693          	add	a3,a3,-614 # 1fc8 <digits>
    buf[16] = 0;
    1236:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    123a:	0005871b          	sext.w	a4,a1
    123e:	1782                	sll	a5,a5,0x20
    1240:	9381                	srl	a5,a5,0x20
    1242:	97b6                	add	a5,a5,a3
    1244:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1248:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    124c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1250:	ecb67ae3          	bgeu	a2,a1,1124 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    125c:	45b9                	li	a1,14
    125e:	bf55                	j	1212 <printint.constprop.0+0x120>
    1260:	45a9                	li	a1,10
    if (sign)
    1262:	fa0558e3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    126e:	45a5                	li	a1,9
    1270:	b74d                	j	1212 <printint.constprop.0+0x120>
    1272:	45b9                	li	a1,14
    if (sign)
    1274:	f8055fe3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1278:	02d00793          	li	a5,45
    127c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1280:	45b5                	li	a1,13
    1282:	bf41                	j	1212 <printint.constprop.0+0x120>
    1284:	45b5                	li	a1,13
    if (sign)
    1286:	f80556e3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1292:	45b1                	li	a1,12
    1294:	bfbd                	j	1212 <printint.constprop.0+0x120>
    1296:	45b1                	li	a1,12
    if (sign)
    1298:	f6055de3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12a4:	45ad                	li	a1,11
    12a6:	b7b5                	j	1212 <printint.constprop.0+0x120>
    12a8:	45ad                	li	a1,11
    if (sign)
    12aa:	f60554e3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12b6:	45a9                	li	a1,10
    12b8:	bfa9                	j	1212 <printint.constprop.0+0x120>
    12ba:	45a5                	li	a1,9
    if (sign)
    12bc:	f4055be3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c8:	45a1                	li	a1,8
    12ca:	b7a1                	j	1212 <printint.constprop.0+0x120>
    i = 15;
    12cc:	45bd                	li	a1,15
    12ce:	b791                	j	1212 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12d0:	45a1                	li	a1,8
    if (sign)
    12d2:	f40550e3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d6:	02d00793          	li	a5,45
    12da:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12de:	459d                	li	a1,7
    12e0:	bf0d                	j	1212 <printint.constprop.0+0x120>
    12e2:	459d                	li	a1,7
    if (sign)
    12e4:	f20557e3          	bgez	a0,1212 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e8:	02d00793          	li	a5,45
    12ec:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12f0:	4599                	li	a1,6
    12f2:	b705                	j	1212 <printint.constprop.0+0x120>

00000000000012f4 <getchar>:
{
    12f4:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12f6:	00f10593          	add	a1,sp,15
    12fa:	4605                	li	a2,1
    12fc:	4501                	li	a0,0
{
    12fe:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1300:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1304:	169000ef          	jal	1c6c <read>
}
    1308:	60e2                	ld	ra,24(sp)
    130a:	00f14503          	lbu	a0,15(sp)
    130e:	6105                	add	sp,sp,32
    1310:	8082                	ret

0000000000001312 <putchar>:
{
    1312:	1101                	add	sp,sp,-32
    1314:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1316:	00f10593          	add	a1,sp,15
    131a:	4605                	li	a2,1
    131c:	4505                	li	a0,1
{
    131e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1320:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1324:	153000ef          	jal	1c76 <write>
}
    1328:	60e2                	ld	ra,24(sp)
    132a:	2501                	sext.w	a0,a0
    132c:	6105                	add	sp,sp,32
    132e:	8082                	ret

0000000000001330 <puts>:
{
    1330:	1141                	add	sp,sp,-16
    1332:	e406                	sd	ra,8(sp)
    1334:	e022                	sd	s0,0(sp)
    1336:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1338:	562000ef          	jal	189a <strlen>
    133c:	862a                	mv	a2,a0
    133e:	85a2                	mv	a1,s0
    1340:	4505                	li	a0,1
    1342:	135000ef          	jal	1c76 <write>
}
    1346:	60a2                	ld	ra,8(sp)
    1348:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    134a:	957d                	sra	a0,a0,0x3f
    return r;
    134c:	2501                	sext.w	a0,a0
}
    134e:	0141                	add	sp,sp,16
    1350:	8082                	ret

0000000000001352 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1352:	7171                	add	sp,sp,-176
    1354:	f85a                	sd	s6,48(sp)
    1356:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1358:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    135a:	18bc                	add	a5,sp,120
{
    135c:	e8ca                	sd	s2,80(sp)
    135e:	e4ce                	sd	s3,72(sp)
    1360:	e0d2                	sd	s4,64(sp)
    1362:	fc56                	sd	s5,56(sp)
    1364:	f486                	sd	ra,104(sp)
    1366:	f0a2                	sd	s0,96(sp)
    1368:	eca6                	sd	s1,88(sp)
    136a:	fcae                	sd	a1,120(sp)
    136c:	e132                	sd	a2,128(sp)
    136e:	e536                	sd	a3,136(sp)
    1370:	e93a                	sd	a4,144(sp)
    1372:	f142                	sd	a6,160(sp)
    1374:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1376:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1378:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    137c:	07300a13          	li	s4,115
    1380:	07800a93          	li	s5,120
    buf[i++] = '0';
    1384:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1388:	00001997          	auipc	s3,0x1
    138c:	c4098993          	add	s3,s3,-960 # 1fc8 <digits>
        if (!*s)
    1390:	00054783          	lbu	a5,0(a0)
    1394:	16078a63          	beqz	a5,1508 <printf+0x1b6>
    1398:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    139a:	19278d63          	beq	a5,s2,1534 <printf+0x1e2>
    139e:	00164783          	lbu	a5,1(a2)
    13a2:	0605                	add	a2,a2,1
    13a4:	fbfd                	bnez	a5,139a <printf+0x48>
    13a6:	84b2                	mv	s1,a2
        l = z - a;
    13a8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13ac:	85aa                	mv	a1,a0
    13ae:	8622                	mv	a2,s0
    13b0:	4505                	li	a0,1
    13b2:	0c5000ef          	jal	1c76 <write>
        if (l)
    13b6:	1a041463          	bnez	s0,155e <printf+0x20c>
        if (s[1] == 0)
    13ba:	0014c783          	lbu	a5,1(s1)
    13be:	14078563          	beqz	a5,1508 <printf+0x1b6>
        switch (s[1])
    13c2:	1b478063          	beq	a5,s4,1562 <printf+0x210>
    13c6:	14fa6b63          	bltu	s4,a5,151c <printf+0x1ca>
    13ca:	06400713          	li	a4,100
    13ce:	1ee78063          	beq	a5,a4,15ae <printf+0x25c>
    13d2:	07000713          	li	a4,112
    13d6:	1ae79963          	bne	a5,a4,1588 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13da:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13dc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13e0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13e2:	631c                	ld	a5,0(a4)
    13e4:	0721                	add	a4,a4,8
    13e6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e8:	00479293          	sll	t0,a5,0x4
    13ec:	00879f93          	sll	t6,a5,0x8
    13f0:	00c79f13          	sll	t5,a5,0xc
    13f4:	01079e93          	sll	t4,a5,0x10
    13f8:	01479e13          	sll	t3,a5,0x14
    13fc:	01879313          	sll	t1,a5,0x18
    1400:	01c79893          	sll	a7,a5,0x1c
    1404:	02479813          	sll	a6,a5,0x24
    1408:	02879513          	sll	a0,a5,0x28
    140c:	02c79593          	sll	a1,a5,0x2c
    1410:	03079693          	sll	a3,a5,0x30
    1414:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1418:	03c7d413          	srl	s0,a5,0x3c
    141c:	01c7d39b          	srlw	t2,a5,0x1c
    1420:	03c2d293          	srl	t0,t0,0x3c
    1424:	03cfdf93          	srl	t6,t6,0x3c
    1428:	03cf5f13          	srl	t5,t5,0x3c
    142c:	03cede93          	srl	t4,t4,0x3c
    1430:	03ce5e13          	srl	t3,t3,0x3c
    1434:	03c35313          	srl	t1,t1,0x3c
    1438:	03c8d893          	srl	a7,a7,0x3c
    143c:	03c85813          	srl	a6,a6,0x3c
    1440:	9171                	srl	a0,a0,0x3c
    1442:	91f1                	srl	a1,a1,0x3c
    1444:	92f1                	srl	a3,a3,0x3c
    1446:	9371                	srl	a4,a4,0x3c
    1448:	96ce                	add	a3,a3,s3
    144a:	974e                	add	a4,a4,s3
    144c:	944e                	add	s0,s0,s3
    144e:	92ce                	add	t0,t0,s3
    1450:	9fce                	add	t6,t6,s3
    1452:	9f4e                	add	t5,t5,s3
    1454:	9ece                	add	t4,t4,s3
    1456:	9e4e                	add	t3,t3,s3
    1458:	934e                	add	t1,t1,s3
    145a:	98ce                	add	a7,a7,s3
    145c:	93ce                	add	t2,t2,s3
    145e:	984e                	add	a6,a6,s3
    1460:	954e                	add	a0,a0,s3
    1462:	95ce                	add	a1,a1,s3
    1464:	0006c083          	lbu	ra,0(a3)
    1468:	0002c283          	lbu	t0,0(t0)
    146c:	00074683          	lbu	a3,0(a4)
    1470:	000fcf83          	lbu	t6,0(t6)
    1474:	000f4f03          	lbu	t5,0(t5)
    1478:	000ece83          	lbu	t4,0(t4)
    147c:	000e4e03          	lbu	t3,0(t3)
    1480:	00034303          	lbu	t1,0(t1)
    1484:	0008c883          	lbu	a7,0(a7)
    1488:	0003c383          	lbu	t2,0(t2)
    148c:	00084803          	lbu	a6,0(a6)
    1490:	00054503          	lbu	a0,0(a0)
    1494:	0005c583          	lbu	a1,0(a1)
    1498:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    149c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a0:	9371                	srl	a4,a4,0x3c
    14a2:	8bbd                	and	a5,a5,15
    14a4:	974e                	add	a4,a4,s3
    14a6:	97ce                	add	a5,a5,s3
    14a8:	005105a3          	sb	t0,11(sp)
    14ac:	01f10623          	sb	t6,12(sp)
    14b0:	01e106a3          	sb	t5,13(sp)
    14b4:	01d10723          	sb	t4,14(sp)
    14b8:	01c107a3          	sb	t3,15(sp)
    14bc:	00610823          	sb	t1,16(sp)
    14c0:	011108a3          	sb	a7,17(sp)
    14c4:	00710923          	sb	t2,18(sp)
    14c8:	010109a3          	sb	a6,19(sp)
    14cc:	00a10a23          	sb	a0,20(sp)
    14d0:	00b10aa3          	sb	a1,21(sp)
    14d4:	00110b23          	sb	ra,22(sp)
    14d8:	00d10ba3          	sb	a3,23(sp)
    14dc:	00810523          	sb	s0,10(sp)
    14e0:	00074703          	lbu	a4,0(a4)
    14e4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e8:	002c                	add	a1,sp,8
    14ea:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ec:	00e10c23          	sb	a4,24(sp)
    14f0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14f8:	77e000ef          	jal	1c76 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14fc:	00248513          	add	a0,s1,2
        if (!*s)
    1500:	00054783          	lbu	a5,0(a0)
    1504:	e8079ae3          	bnez	a5,1398 <printf+0x46>
    }
    va_end(ap);
}
    1508:	70a6                	ld	ra,104(sp)
    150a:	7406                	ld	s0,96(sp)
    150c:	64e6                	ld	s1,88(sp)
    150e:	6946                	ld	s2,80(sp)
    1510:	69a6                	ld	s3,72(sp)
    1512:	6a06                	ld	s4,64(sp)
    1514:	7ae2                	ld	s5,56(sp)
    1516:	7b42                	ld	s6,48(sp)
    1518:	614d                	add	sp,sp,176
    151a:	8082                	ret
        switch (s[1])
    151c:	07579663          	bne	a5,s5,1588 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1520:	6782                	ld	a5,0(sp)
    1522:	45c1                	li	a1,16
    1524:	4388                	lw	a0,0(a5)
    1526:	07a1                	add	a5,a5,8
    1528:	e03e                	sd	a5,0(sp)
    152a:	bc9ff0ef          	jal	10f2 <printint.constprop.0>
        s += 2;
    152e:	00248513          	add	a0,s1,2
    1532:	b7f9                	j	1500 <printf+0x1ae>
    1534:	84b2                	mv	s1,a2
    1536:	a039                	j	1544 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1538:	0024c783          	lbu	a5,2(s1)
    153c:	0605                	add	a2,a2,1
    153e:	0489                	add	s1,s1,2
    1540:	e72794e3          	bne	a5,s2,13a8 <printf+0x56>
    1544:	0014c783          	lbu	a5,1(s1)
    1548:	ff2788e3          	beq	a5,s2,1538 <printf+0x1e6>
        l = z - a;
    154c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1550:	85aa                	mv	a1,a0
    1552:	8622                	mv	a2,s0
    1554:	4505                	li	a0,1
    1556:	720000ef          	jal	1c76 <write>
        if (l)
    155a:	e60400e3          	beqz	s0,13ba <printf+0x68>
    155e:	8526                	mv	a0,s1
    1560:	bd05                	j	1390 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1562:	6782                	ld	a5,0(sp)
    1564:	6380                	ld	s0,0(a5)
    1566:	07a1                	add	a5,a5,8
    1568:	e03e                	sd	a5,0(sp)
    156a:	cc21                	beqz	s0,15c2 <printf+0x270>
            l = strnlen(a, 200);
    156c:	0c800593          	li	a1,200
    1570:	8522                	mv	a0,s0
    1572:	412000ef          	jal	1984 <strnlen>
    write(f, s, l);
    1576:	0005061b          	sext.w	a2,a0
    157a:	85a2                	mv	a1,s0
    157c:	4505                	li	a0,1
    157e:	6f8000ef          	jal	1c76 <write>
        s += 2;
    1582:	00248513          	add	a0,s1,2
    1586:	bfad                	j	1500 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1588:	4605                	li	a2,1
    158a:	002c                	add	a1,sp,8
    158c:	4505                	li	a0,1
    char byte = c;
    158e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1592:	6e4000ef          	jal	1c76 <write>
    char byte = c;
    1596:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    159a:	4605                	li	a2,1
    159c:	002c                	add	a1,sp,8
    159e:	4505                	li	a0,1
    char byte = c;
    15a0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a4:	6d2000ef          	jal	1c76 <write>
        s += 2;
    15a8:	00248513          	add	a0,s1,2
    15ac:	bf91                	j	1500 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15ae:	6782                	ld	a5,0(sp)
    15b0:	45a9                	li	a1,10
    15b2:	4388                	lw	a0,0(a5)
    15b4:	07a1                	add	a5,a5,8
    15b6:	e03e                	sd	a5,0(sp)
    15b8:	b3bff0ef          	jal	10f2 <printint.constprop.0>
        s += 2;
    15bc:	00248513          	add	a0,s1,2
    15c0:	b781                	j	1500 <printf+0x1ae>
                a = "(null)";
    15c2:	00001417          	auipc	s0,0x1
    15c6:	9ce40413          	add	s0,s0,-1586 # 1f90 <__clone+0xbc>
    15ca:	b74d                	j	156c <printf+0x21a>

00000000000015cc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	02000793          	li	a5,32
    15d0:	00f50663          	beq	a0,a5,15dc <isspace+0x10>
    15d4:	355d                	addw	a0,a0,-9
    15d6:	00553513          	sltiu	a0,a0,5
    15da:	8082                	ret
    15dc:	4505                	li	a0,1
}
    15de:	8082                	ret

00000000000015e0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e0:	fd05051b          	addw	a0,a0,-48
}
    15e4:	00a53513          	sltiu	a0,a0,10
    15e8:	8082                	ret

00000000000015ea <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ea:	02000693          	li	a3,32
    15ee:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f0:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f4:	ff77871b          	addw	a4,a5,-9
    15f8:	04d78c63          	beq	a5,a3,1650 <atoi+0x66>
    15fc:	0007861b          	sext.w	a2,a5
    1600:	04e5f863          	bgeu	a1,a4,1650 <atoi+0x66>
        s++;
    switch (*s)
    1604:	02b00713          	li	a4,43
    1608:	04e78963          	beq	a5,a4,165a <atoi+0x70>
    160c:	02d00713          	li	a4,45
    1610:	06e78263          	beq	a5,a4,1674 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1614:	fd06069b          	addw	a3,a2,-48
    1618:	47a5                	li	a5,9
    161a:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    161c:	4301                	li	t1,0
    while (isdigit(*s))
    161e:	04d7e963          	bltu	a5,a3,1670 <atoi+0x86>
    int n = 0, neg = 0;
    1622:	4501                	li	a0,0
    while (isdigit(*s))
    1624:	48a5                	li	a7,9
    1626:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    162a:	0025179b          	sllw	a5,a0,0x2
    162e:	9fa9                	addw	a5,a5,a0
    1630:	fd06059b          	addw	a1,a2,-48
    1634:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1638:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    163c:	0705                	add	a4,a4,1
    163e:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1642:	0006861b          	sext.w	a2,a3
    1646:	ff08f0e3          	bgeu	a7,a6,1626 <atoi+0x3c>
    return neg ? n : -n;
    164a:	00030563          	beqz	t1,1654 <atoi+0x6a>
}
    164e:	8082                	ret
        s++;
    1650:	0505                	add	a0,a0,1
    1652:	bf79                	j	15f0 <atoi+0x6>
    return neg ? n : -n;
    1654:	40f5853b          	subw	a0,a1,a5
    1658:	8082                	ret
    while (isdigit(*s))
    165a:	00154603          	lbu	a2,1(a0)
    165e:	47a5                	li	a5,9
        s++;
    1660:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1664:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1668:	4301                	li	t1,0
    while (isdigit(*s))
    166a:	2601                	sext.w	a2,a2
    166c:	fad7fbe3          	bgeu	a5,a3,1622 <atoi+0x38>
    1670:	4501                	li	a0,0
}
    1672:	8082                	ret
    while (isdigit(*s))
    1674:	00154603          	lbu	a2,1(a0)
    1678:	47a5                	li	a5,9
        s++;
    167a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    167e:	fd06069b          	addw	a3,a2,-48
    1682:	2601                	sext.w	a2,a2
    1684:	fed7e6e3          	bltu	a5,a3,1670 <atoi+0x86>
        neg = 1;
    1688:	4305                	li	t1,1
    168a:	bf61                	j	1622 <atoi+0x38>

000000000000168c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168c:	18060163          	beqz	a2,180e <memset+0x182>
    1690:	40a006b3          	neg	a3,a0
    1694:	0076f793          	and	a5,a3,7
    1698:	00778813          	add	a6,a5,7
    169c:	48ad                	li	a7,11
    169e:	0ff5f713          	zext.b	a4,a1
    16a2:	fff60593          	add	a1,a2,-1
    16a6:	17186563          	bltu	a6,a7,1810 <memset+0x184>
    16aa:	1705ed63          	bltu	a1,a6,1824 <memset+0x198>
    16ae:	16078363          	beqz	a5,1814 <memset+0x188>
    16b2:	00e50023          	sb	a4,0(a0)
    16b6:	0066f593          	and	a1,a3,6
    16ba:	16058063          	beqz	a1,181a <memset+0x18e>
    16be:	00e500a3          	sb	a4,1(a0)
    16c2:	4589                	li	a1,2
    16c4:	16f5f363          	bgeu	a1,a5,182a <memset+0x19e>
    16c8:	00e50123          	sb	a4,2(a0)
    16cc:	8a91                	and	a3,a3,4
    16ce:	00350593          	add	a1,a0,3
    16d2:	4e0d                	li	t3,3
    16d4:	ce9d                	beqz	a3,1712 <memset+0x86>
    16d6:	00e501a3          	sb	a4,3(a0)
    16da:	4691                	li	a3,4
    16dc:	00450593          	add	a1,a0,4
    16e0:	4e11                	li	t3,4
    16e2:	02f6f863          	bgeu	a3,a5,1712 <memset+0x86>
    16e6:	00e50223          	sb	a4,4(a0)
    16ea:	4695                	li	a3,5
    16ec:	00550593          	add	a1,a0,5
    16f0:	4e15                	li	t3,5
    16f2:	02d78063          	beq	a5,a3,1712 <memset+0x86>
    16f6:	fff50693          	add	a3,a0,-1
    16fa:	00e502a3          	sb	a4,5(a0)
    16fe:	8a9d                	and	a3,a3,7
    1700:	00650593          	add	a1,a0,6
    1704:	4e19                	li	t3,6
    1706:	e691                	bnez	a3,1712 <memset+0x86>
    1708:	00750593          	add	a1,a0,7
    170c:	00e50323          	sb	a4,6(a0)
    1710:	4e1d                	li	t3,7
    1712:	00871693          	sll	a3,a4,0x8
    1716:	01071813          	sll	a6,a4,0x10
    171a:	8ed9                	or	a3,a3,a4
    171c:	01871893          	sll	a7,a4,0x18
    1720:	0106e6b3          	or	a3,a3,a6
    1724:	0116e6b3          	or	a3,a3,a7
    1728:	02071813          	sll	a6,a4,0x20
    172c:	02871313          	sll	t1,a4,0x28
    1730:	0106e6b3          	or	a3,a3,a6
    1734:	40f608b3          	sub	a7,a2,a5
    1738:	03071813          	sll	a6,a4,0x30
    173c:	0066e6b3          	or	a3,a3,t1
    1740:	0106e6b3          	or	a3,a3,a6
    1744:	03871313          	sll	t1,a4,0x38
    1748:	97aa                	add	a5,a5,a0
    174a:	ff88f813          	and	a6,a7,-8
    174e:	0066e6b3          	or	a3,a3,t1
    1752:	983e                	add	a6,a6,a5
    1754:	e394                	sd	a3,0(a5)
    1756:	07a1                	add	a5,a5,8
    1758:	ff079ee3          	bne	a5,a6,1754 <memset+0xc8>
    175c:	ff88f793          	and	a5,a7,-8
    1760:	0078f893          	and	a7,a7,7
    1764:	00f586b3          	add	a3,a1,a5
    1768:	01c787bb          	addw	a5,a5,t3
    176c:	0a088b63          	beqz	a7,1822 <memset+0x196>
    1770:	00e68023          	sb	a4,0(a3)
    1774:	0017859b          	addw	a1,a5,1
    1778:	08c5fb63          	bgeu	a1,a2,180e <memset+0x182>
    177c:	00e680a3          	sb	a4,1(a3)
    1780:	0027859b          	addw	a1,a5,2
    1784:	08c5f563          	bgeu	a1,a2,180e <memset+0x182>
    1788:	00e68123          	sb	a4,2(a3)
    178c:	0037859b          	addw	a1,a5,3
    1790:	06c5ff63          	bgeu	a1,a2,180e <memset+0x182>
    1794:	00e681a3          	sb	a4,3(a3)
    1798:	0047859b          	addw	a1,a5,4
    179c:	06c5f963          	bgeu	a1,a2,180e <memset+0x182>
    17a0:	00e68223          	sb	a4,4(a3)
    17a4:	0057859b          	addw	a1,a5,5
    17a8:	06c5f363          	bgeu	a1,a2,180e <memset+0x182>
    17ac:	00e682a3          	sb	a4,5(a3)
    17b0:	0067859b          	addw	a1,a5,6
    17b4:	04c5fd63          	bgeu	a1,a2,180e <memset+0x182>
    17b8:	00e68323          	sb	a4,6(a3)
    17bc:	0077859b          	addw	a1,a5,7
    17c0:	04c5f763          	bgeu	a1,a2,180e <memset+0x182>
    17c4:	00e683a3          	sb	a4,7(a3)
    17c8:	0087859b          	addw	a1,a5,8
    17cc:	04c5f163          	bgeu	a1,a2,180e <memset+0x182>
    17d0:	00e68423          	sb	a4,8(a3)
    17d4:	0097859b          	addw	a1,a5,9
    17d8:	02c5fb63          	bgeu	a1,a2,180e <memset+0x182>
    17dc:	00e684a3          	sb	a4,9(a3)
    17e0:	00a7859b          	addw	a1,a5,10
    17e4:	02c5f563          	bgeu	a1,a2,180e <memset+0x182>
    17e8:	00e68523          	sb	a4,10(a3)
    17ec:	00b7859b          	addw	a1,a5,11
    17f0:	00c5ff63          	bgeu	a1,a2,180e <memset+0x182>
    17f4:	00e685a3          	sb	a4,11(a3)
    17f8:	00c7859b          	addw	a1,a5,12
    17fc:	00c5f963          	bgeu	a1,a2,180e <memset+0x182>
    1800:	00e68623          	sb	a4,12(a3)
    1804:	27b5                	addw	a5,a5,13
    1806:	00c7f463          	bgeu	a5,a2,180e <memset+0x182>
    180a:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    180e:	8082                	ret
    1810:	482d                	li	a6,11
    1812:	bd61                	j	16aa <memset+0x1e>
    char *p = dest;
    1814:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1816:	4e01                	li	t3,0
    1818:	bded                	j	1712 <memset+0x86>
    181a:	00150593          	add	a1,a0,1
    181e:	4e05                	li	t3,1
    1820:	bdcd                	j	1712 <memset+0x86>
    1822:	8082                	ret
    char *p = dest;
    1824:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1826:	4781                	li	a5,0
    1828:	b7a1                	j	1770 <memset+0xe4>
    182a:	00250593          	add	a1,a0,2
    182e:	4e09                	li	t3,2
    1830:	b5cd                	j	1712 <memset+0x86>

0000000000001832 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1832:	00054783          	lbu	a5,0(a0)
    1836:	0005c703          	lbu	a4,0(a1)
    183a:	00e79863          	bne	a5,a4,184a <strcmp+0x18>
    183e:	0505                	add	a0,a0,1
    1840:	0585                	add	a1,a1,1
    1842:	fbe5                	bnez	a5,1832 <strcmp>
    1844:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1846:	9d19                	subw	a0,a0,a4
    1848:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    184a:	0007851b          	sext.w	a0,a5
    184e:	bfe5                	j	1846 <strcmp+0x14>

0000000000001850 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1850:	ca15                	beqz	a2,1884 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1852:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1856:	167d                	add	a2,a2,-1
    1858:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185c:	eb99                	bnez	a5,1872 <strncmp+0x22>
    185e:	a815                	j	1892 <strncmp+0x42>
    1860:	00a68e63          	beq	a3,a0,187c <strncmp+0x2c>
    1864:	0505                	add	a0,a0,1
    1866:	00f71b63          	bne	a4,a5,187c <strncmp+0x2c>
    186a:	00054783          	lbu	a5,0(a0)
    186e:	cf89                	beqz	a5,1888 <strncmp+0x38>
    1870:	85b2                	mv	a1,a2
    1872:	0005c703          	lbu	a4,0(a1)
    1876:	00158613          	add	a2,a1,1
    187a:	f37d                	bnez	a4,1860 <strncmp+0x10>
        ;
    return *l - *r;
    187c:	0007851b          	sext.w	a0,a5
    1880:	9d19                	subw	a0,a0,a4
    1882:	8082                	ret
        return 0;
    1884:	4501                	li	a0,0
}
    1886:	8082                	ret
    return *l - *r;
    1888:	0015c703          	lbu	a4,1(a1)
    188c:	4501                	li	a0,0
    188e:	9d19                	subw	a0,a0,a4
    1890:	8082                	ret
    1892:	0005c703          	lbu	a4,0(a1)
    1896:	4501                	li	a0,0
    1898:	b7e5                	j	1880 <strncmp+0x30>

000000000000189a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189a:	00757793          	and	a5,a0,7
    189e:	cf89                	beqz	a5,18b8 <strlen+0x1e>
    18a0:	87aa                	mv	a5,a0
    18a2:	a029                	j	18ac <strlen+0x12>
    18a4:	0785                	add	a5,a5,1
    18a6:	0077f713          	and	a4,a5,7
    18aa:	cb01                	beqz	a4,18ba <strlen+0x20>
        if (!*s)
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	fb75                	bnez	a4,18a4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b2:	40a78533          	sub	a0,a5,a0
}
    18b6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ba:	6394                	ld	a3,0(a5)
    18bc:	00000597          	auipc	a1,0x0
    18c0:	6dc5b583          	ld	a1,1756(a1) # 1f98 <__clone+0xc4>
    18c4:	00000617          	auipc	a2,0x0
    18c8:	6dc63603          	ld	a2,1756(a2) # 1fa0 <__clone+0xcc>
    18cc:	a019                	j	18d2 <strlen+0x38>
    18ce:	6794                	ld	a3,8(a5)
    18d0:	07a1                	add	a5,a5,8
    18d2:	00b68733          	add	a4,a3,a1
    18d6:	fff6c693          	not	a3,a3
    18da:	8f75                	and	a4,a4,a3
    18dc:	8f71                	and	a4,a4,a2
    18de:	db65                	beqz	a4,18ce <strlen+0x34>
    for (; *s; s++)
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	d779                	beqz	a4,18b2 <strlen+0x18>
    18e6:	0017c703          	lbu	a4,1(a5)
    18ea:	0785                	add	a5,a5,1
    18ec:	d379                	beqz	a4,18b2 <strlen+0x18>
    18ee:	0017c703          	lbu	a4,1(a5)
    18f2:	0785                	add	a5,a5,1
    18f4:	fb6d                	bnez	a4,18e6 <strlen+0x4c>
    18f6:	bf75                	j	18b2 <strlen+0x18>

00000000000018f8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f8:	00757713          	and	a4,a0,7
{
    18fc:	87aa                	mv	a5,a0
    18fe:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1902:	cb19                	beqz	a4,1918 <memchr+0x20>
    1904:	ce25                	beqz	a2,197c <memchr+0x84>
    1906:	0007c703          	lbu	a4,0(a5)
    190a:	00b70763          	beq	a4,a1,1918 <memchr+0x20>
    190e:	0785                	add	a5,a5,1
    1910:	0077f713          	and	a4,a5,7
    1914:	167d                	add	a2,a2,-1
    1916:	f77d                	bnez	a4,1904 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1918:	4501                	li	a0,0
    if (n && *s != c)
    191a:	c235                	beqz	a2,197e <memchr+0x86>
    191c:	0007c703          	lbu	a4,0(a5)
    1920:	06b70063          	beq	a4,a1,1980 <memchr+0x88>
        size_t k = ONES * c;
    1924:	00000517          	auipc	a0,0x0
    1928:	68453503          	ld	a0,1668(a0) # 1fa8 <__clone+0xd4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192c:	471d                	li	a4,7
        size_t k = ONES * c;
    192e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1932:	04c77763          	bgeu	a4,a2,1980 <memchr+0x88>
    1936:	00000897          	auipc	a7,0x0
    193a:	6628b883          	ld	a7,1634(a7) # 1f98 <__clone+0xc4>
    193e:	00000817          	auipc	a6,0x0
    1942:	66283803          	ld	a6,1634(a6) # 1fa0 <__clone+0xcc>
    1946:	431d                	li	t1,7
    1948:	a029                	j	1952 <memchr+0x5a>
    194a:	1661                	add	a2,a2,-8
    194c:	07a1                	add	a5,a5,8
    194e:	00c37c63          	bgeu	t1,a2,1966 <memchr+0x6e>
    1952:	6398                	ld	a4,0(a5)
    1954:	8f29                	xor	a4,a4,a0
    1956:	011706b3          	add	a3,a4,a7
    195a:	fff74713          	not	a4,a4
    195e:	8f75                	and	a4,a4,a3
    1960:	01077733          	and	a4,a4,a6
    1964:	d37d                	beqz	a4,194a <memchr+0x52>
    1966:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1968:	e601                	bnez	a2,1970 <memchr+0x78>
    196a:	a809                	j	197c <memchr+0x84>
    196c:	0505                	add	a0,a0,1
    196e:	c619                	beqz	a2,197c <memchr+0x84>
    1970:	00054783          	lbu	a5,0(a0)
    1974:	167d                	add	a2,a2,-1
    1976:	feb79be3          	bne	a5,a1,196c <memchr+0x74>
    197a:	8082                	ret
    return n ? (void *)s : 0;
    197c:	4501                	li	a0,0
}
    197e:	8082                	ret
    if (n && *s != c)
    1980:	853e                	mv	a0,a5
    1982:	b7fd                	j	1970 <memchr+0x78>

0000000000001984 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1984:	1101                	add	sp,sp,-32
    1986:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1988:	862e                	mv	a2,a1
{
    198a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    198c:	4581                	li	a1,0
{
    198e:	e426                	sd	s1,8(sp)
    1990:	ec06                	sd	ra,24(sp)
    1992:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1994:	f65ff0ef          	jal	18f8 <memchr>
    return p ? p - s : n;
    1998:	c519                	beqz	a0,19a6 <strnlen+0x22>
}
    199a:	60e2                	ld	ra,24(sp)
    199c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    199e:	8d05                	sub	a0,a0,s1
}
    19a0:	64a2                	ld	s1,8(sp)
    19a2:	6105                	add	sp,sp,32
    19a4:	8082                	ret
    19a6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19a8:	8522                	mv	a0,s0
}
    19aa:	6442                	ld	s0,16(sp)
    19ac:	64a2                	ld	s1,8(sp)
    19ae:	6105                	add	sp,sp,32
    19b0:	8082                	ret

00000000000019b2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b2:	00a5c7b3          	xor	a5,a1,a0
    19b6:	8b9d                	and	a5,a5,7
    19b8:	eb95                	bnez	a5,19ec <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ba:	0075f793          	and	a5,a1,7
    19be:	e7b1                	bnez	a5,1a0a <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c0:	6198                	ld	a4,0(a1)
    19c2:	00000617          	auipc	a2,0x0
    19c6:	5d663603          	ld	a2,1494(a2) # 1f98 <__clone+0xc4>
    19ca:	00000817          	auipc	a6,0x0
    19ce:	5d683803          	ld	a6,1494(a6) # 1fa0 <__clone+0xcc>
    19d2:	a029                	j	19dc <strcpy+0x2a>
    19d4:	05a1                	add	a1,a1,8
    19d6:	e118                	sd	a4,0(a0)
    19d8:	6198                	ld	a4,0(a1)
    19da:	0521                	add	a0,a0,8
    19dc:	00c707b3          	add	a5,a4,a2
    19e0:	fff74693          	not	a3,a4
    19e4:	8ff5                	and	a5,a5,a3
    19e6:	0107f7b3          	and	a5,a5,a6
    19ea:	d7ed                	beqz	a5,19d4 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ec:	0005c783          	lbu	a5,0(a1)
    19f0:	00f50023          	sb	a5,0(a0)
    19f4:	c785                	beqz	a5,1a1c <strcpy+0x6a>
    19f6:	0015c783          	lbu	a5,1(a1)
    19fa:	0505                	add	a0,a0,1
    19fc:	0585                	add	a1,a1,1
    19fe:	00f50023          	sb	a5,0(a0)
    1a02:	fbf5                	bnez	a5,19f6 <strcpy+0x44>
        ;
    return d;
}
    1a04:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a06:	0505                	add	a0,a0,1
    1a08:	df45                	beqz	a4,19c0 <strcpy+0xe>
            if (!(*d = *s))
    1a0a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a0e:	0585                	add	a1,a1,1
    1a10:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a14:	00f50023          	sb	a5,0(a0)
    1a18:	f7fd                	bnez	a5,1a06 <strcpy+0x54>
}
    1a1a:	8082                	ret
    1a1c:	8082                	ret

0000000000001a1e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a1e:	00a5c7b3          	xor	a5,a1,a0
    1a22:	8b9d                	and	a5,a5,7
    1a24:	e3b5                	bnez	a5,1a88 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a26:	0075f793          	and	a5,a1,7
    1a2a:	cf99                	beqz	a5,1a48 <strncpy+0x2a>
    1a2c:	ea09                	bnez	a2,1a3e <strncpy+0x20>
    1a2e:	a421                	j	1c36 <strncpy+0x218>
    1a30:	0585                	add	a1,a1,1
    1a32:	0075f793          	and	a5,a1,7
    1a36:	167d                	add	a2,a2,-1
    1a38:	0505                	add	a0,a0,1
    1a3a:	c799                	beqz	a5,1a48 <strncpy+0x2a>
    1a3c:	c225                	beqz	a2,1a9c <strncpy+0x7e>
    1a3e:	0005c783          	lbu	a5,0(a1)
    1a42:	00f50023          	sb	a5,0(a0)
    1a46:	f7ed                	bnez	a5,1a30 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a48:	ca31                	beqz	a2,1a9c <strncpy+0x7e>
    1a4a:	0005c783          	lbu	a5,0(a1)
    1a4e:	cba1                	beqz	a5,1a9e <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a50:	479d                	li	a5,7
    1a52:	02c7fc63          	bgeu	a5,a2,1a8a <strncpy+0x6c>
    1a56:	00000897          	auipc	a7,0x0
    1a5a:	5428b883          	ld	a7,1346(a7) # 1f98 <__clone+0xc4>
    1a5e:	00000817          	auipc	a6,0x0
    1a62:	54283803          	ld	a6,1346(a6) # 1fa0 <__clone+0xcc>
    1a66:	431d                	li	t1,7
    1a68:	a039                	j	1a76 <strncpy+0x58>
            *wd = *ws;
    1a6a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6c:	1661                	add	a2,a2,-8
    1a6e:	05a1                	add	a1,a1,8
    1a70:	0521                	add	a0,a0,8
    1a72:	00c37b63          	bgeu	t1,a2,1a88 <strncpy+0x6a>
    1a76:	6198                	ld	a4,0(a1)
    1a78:	011707b3          	add	a5,a4,a7
    1a7c:	fff74693          	not	a3,a4
    1a80:	8ff5                	and	a5,a5,a3
    1a82:	0107f7b3          	and	a5,a5,a6
    1a86:	d3f5                	beqz	a5,1a6a <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a88:	ca11                	beqz	a2,1a9c <strncpy+0x7e>
    1a8a:	0005c783          	lbu	a5,0(a1)
    1a8e:	0585                	add	a1,a1,1
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	c789                	beqz	a5,1a9e <strncpy+0x80>
    1a96:	167d                	add	a2,a2,-1
    1a98:	0505                	add	a0,a0,1
    1a9a:	fa65                	bnez	a2,1a8a <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a9c:	8082                	ret
    1a9e:	4805                	li	a6,1
    1aa0:	14061b63          	bnez	a2,1bf6 <strncpy+0x1d8>
    1aa4:	40a00733          	neg	a4,a0
    1aa8:	00777793          	and	a5,a4,7
    1aac:	4581                	li	a1,0
    1aae:	12061c63          	bnez	a2,1be6 <strncpy+0x1c8>
    1ab2:	00778693          	add	a3,a5,7
    1ab6:	48ad                	li	a7,11
    1ab8:	1316e563          	bltu	a3,a7,1be2 <strncpy+0x1c4>
    1abc:	16d5e263          	bltu	a1,a3,1c20 <strncpy+0x202>
    1ac0:	14078c63          	beqz	a5,1c18 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ac4:	00050023          	sb	zero,0(a0)
    1ac8:	00677693          	and	a3,a4,6
    1acc:	14068263          	beqz	a3,1c10 <strncpy+0x1f2>
    1ad0:	000500a3          	sb	zero,1(a0)
    1ad4:	4689                	li	a3,2
    1ad6:	14f6f863          	bgeu	a3,a5,1c26 <strncpy+0x208>
    1ada:	00050123          	sb	zero,2(a0)
    1ade:	8b11                	and	a4,a4,4
    1ae0:	12070463          	beqz	a4,1c08 <strncpy+0x1ea>
    1ae4:	000501a3          	sb	zero,3(a0)
    1ae8:	4711                	li	a4,4
    1aea:	00450693          	add	a3,a0,4
    1aee:	02f77563          	bgeu	a4,a5,1b18 <strncpy+0xfa>
    1af2:	00050223          	sb	zero,4(a0)
    1af6:	4715                	li	a4,5
    1af8:	00550693          	add	a3,a0,5
    1afc:	00e78e63          	beq	a5,a4,1b18 <strncpy+0xfa>
    1b00:	fff50713          	add	a4,a0,-1
    1b04:	000502a3          	sb	zero,5(a0)
    1b08:	8b1d                	and	a4,a4,7
    1b0a:	12071263          	bnez	a4,1c2e <strncpy+0x210>
    1b0e:	00750693          	add	a3,a0,7
    1b12:	00050323          	sb	zero,6(a0)
    1b16:	471d                	li	a4,7
    1b18:	40f80833          	sub	a6,a6,a5
    1b1c:	ff887593          	and	a1,a6,-8
    1b20:	97aa                	add	a5,a5,a0
    1b22:	95be                	add	a1,a1,a5
    1b24:	0007b023          	sd	zero,0(a5)
    1b28:	07a1                	add	a5,a5,8
    1b2a:	feb79de3          	bne	a5,a1,1b24 <strncpy+0x106>
    1b2e:	ff887593          	and	a1,a6,-8
    1b32:	00787813          	and	a6,a6,7
    1b36:	00e587bb          	addw	a5,a1,a4
    1b3a:	00b68733          	add	a4,a3,a1
    1b3e:	0e080063          	beqz	a6,1c1e <strncpy+0x200>
    1b42:	00070023          	sb	zero,0(a4)
    1b46:	0017869b          	addw	a3,a5,1
    1b4a:	f4c6f9e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b4e:	000700a3          	sb	zero,1(a4)
    1b52:	0027869b          	addw	a3,a5,2
    1b56:	f4c6f3e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b5a:	00070123          	sb	zero,2(a4)
    1b5e:	0037869b          	addw	a3,a5,3
    1b62:	f2c6fde3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b66:	000701a3          	sb	zero,3(a4)
    1b6a:	0047869b          	addw	a3,a5,4
    1b6e:	f2c6f7e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b72:	00070223          	sb	zero,4(a4)
    1b76:	0057869b          	addw	a3,a5,5
    1b7a:	f2c6f1e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b7e:	000702a3          	sb	zero,5(a4)
    1b82:	0067869b          	addw	a3,a5,6
    1b86:	f0c6fbe3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b8a:	00070323          	sb	zero,6(a4)
    1b8e:	0077869b          	addw	a3,a5,7
    1b92:	f0c6f5e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1b96:	000703a3          	sb	zero,7(a4)
    1b9a:	0087869b          	addw	a3,a5,8
    1b9e:	eec6ffe3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1ba2:	00070423          	sb	zero,8(a4)
    1ba6:	0097869b          	addw	a3,a5,9
    1baa:	eec6f9e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1bae:	000704a3          	sb	zero,9(a4)
    1bb2:	00a7869b          	addw	a3,a5,10
    1bb6:	eec6f3e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1bba:	00070523          	sb	zero,10(a4)
    1bbe:	00b7869b          	addw	a3,a5,11
    1bc2:	ecc6fde3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1bc6:	000705a3          	sb	zero,11(a4)
    1bca:	00c7869b          	addw	a3,a5,12
    1bce:	ecc6f7e3          	bgeu	a3,a2,1a9c <strncpy+0x7e>
    1bd2:	00070623          	sb	zero,12(a4)
    1bd6:	27b5                	addw	a5,a5,13
    1bd8:	ecc7f2e3          	bgeu	a5,a2,1a9c <strncpy+0x7e>
    1bdc:	000706a3          	sb	zero,13(a4)
}
    1be0:	8082                	ret
    1be2:	46ad                	li	a3,11
    1be4:	bde1                	j	1abc <strncpy+0x9e>
    1be6:	00778693          	add	a3,a5,7
    1bea:	48ad                	li	a7,11
    1bec:	fff60593          	add	a1,a2,-1
    1bf0:	ed16f6e3          	bgeu	a3,a7,1abc <strncpy+0x9e>
    1bf4:	b7fd                	j	1be2 <strncpy+0x1c4>
    1bf6:	40a00733          	neg	a4,a0
    1bfa:	8832                	mv	a6,a2
    1bfc:	00777793          	and	a5,a4,7
    1c00:	4581                	li	a1,0
    1c02:	ea0608e3          	beqz	a2,1ab2 <strncpy+0x94>
    1c06:	b7c5                	j	1be6 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c08:	00350693          	add	a3,a0,3
    1c0c:	470d                	li	a4,3
    1c0e:	b729                	j	1b18 <strncpy+0xfa>
    1c10:	00150693          	add	a3,a0,1
    1c14:	4705                	li	a4,1
    1c16:	b709                	j	1b18 <strncpy+0xfa>
tail:
    1c18:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1a:	4701                	li	a4,0
    1c1c:	bdf5                	j	1b18 <strncpy+0xfa>
    1c1e:	8082                	ret
tail:
    1c20:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c22:	4781                	li	a5,0
    1c24:	bf39                	j	1b42 <strncpy+0x124>
    1c26:	00250693          	add	a3,a0,2
    1c2a:	4709                	li	a4,2
    1c2c:	b5f5                	j	1b18 <strncpy+0xfa>
    1c2e:	00650693          	add	a3,a0,6
    1c32:	4719                	li	a4,6
    1c34:	b5d5                	j	1b18 <strncpy+0xfa>
    1c36:	8082                	ret

0000000000001c38 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c38:	87aa                	mv	a5,a0
    1c3a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c3c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c46:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c48:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <openat>:
    register long a7 __asm__("a7") = n;
    1c50:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c54:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c58:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c5c:	2501                	sext.w	a0,a0
    1c5e:	8082                	ret

0000000000001c60 <close>:
    register long a7 __asm__("a7") = n;
    1c60:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c64:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <read>:
    register long a7 __asm__("a7") = n;
    1c6c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c70:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c74:	8082                	ret

0000000000001c76 <write>:
    register long a7 __asm__("a7") = n;
    1c76:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7e:	8082                	ret

0000000000001c80 <getpid>:
    register long a7 __asm__("a7") = n;
    1c80:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c84:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <getppid>:
    register long a7 __asm__("a7") = n;
    1c8c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c90:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c98:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c9c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <fork>:
    register long a7 __asm__("a7") = n;
    1ca4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1caa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cac:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb4:	85b2                	mv	a1,a2
    1cb6:	863a                	mv	a2,a4
    if (stack)
    1cb8:	c191                	beqz	a1,1cbc <clone+0x8>
	stack += stack_size;
    1cba:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cbc:	4781                	li	a5,0
    1cbe:	4701                	li	a4,0
    1cc0:	4681                	li	a3,0
    1cc2:	2601                	sext.w	a2,a2
    1cc4:	ac01                	j	1ed4 <__clone>

0000000000001cc6 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cc6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cca:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cce:	8082                	ret

0000000000001cd0 <exit>:
    register long a7 __asm__("a7") = n;
    1cd0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd4:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd8:	8082                	ret

0000000000001cda <waitpid>:
    register long a7 __asm__("a7") = n;
    1cda:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cde:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <exec>:
    register long a7 __asm__("a7") = n;
    1ce8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cec:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <execve>:
    register long a7 __asm__("a7") = n;
    1cf4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf8:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <times>:
    register long a7 __asm__("a7") = n;
    1d00:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <get_time>:

int64 get_time()
{
    1d0c:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d0e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d12:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d14:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	ed09                	bnez	a0,1d36 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d1e:	67a2                	ld	a5,8(sp)
    1d20:	3e800713          	li	a4,1000
    1d24:	00015503          	lhu	a0,0(sp)
    1d28:	02e7d7b3          	divu	a5,a5,a4
    1d2c:	02e50533          	mul	a0,a0,a4
    1d30:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d32:	0141                	add	sp,sp,16
    1d34:	8082                	ret
        return -1;
    1d36:	557d                	li	a0,-1
    1d38:	bfed                	j	1d32 <get_time+0x26>

0000000000001d3a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d3a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <time>:
    register long a7 __asm__("a7") = n;
    1d46:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d4a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <sleep>:

int sleep(unsigned long long time)
{
    1d52:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d54:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d56:	850a                	mv	a0,sp
    1d58:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d5a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d5e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d64:	e501                	bnez	a0,1d6c <sleep+0x1a>
    return 0;
    1d66:	4501                	li	a0,0
}
    1d68:	0141                	add	sp,sp,16
    1d6a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6c:	4502                	lw	a0,0(sp)
}
    1d6e:	0141                	add	sp,sp,16
    1d70:	8082                	ret

0000000000001d72 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d72:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d7e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d82:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d86:	8082                	ret

0000000000001d88 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d88:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8c:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <munmap>:
    register long a7 __asm__("a7") = n;
    1d94:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d98:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <wait>:

int wait(int *code)
{
    1da0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1daa:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dac:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <spawn>:
    register long a7 __asm__("a7") = n;
    1db4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dcc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1de4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de6:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dea:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dec:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1df4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dfa:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e04:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e06:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e0a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <link>:

int link(char *old_path, char *new_path)
{
    1e14:	87aa                	mv	a5,a0
    1e16:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e18:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e1c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e20:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e22:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e26:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e28:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <unlink>:

int unlink(char *path)
{
    1e30:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e32:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e36:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e3a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <uname>:
    register long a7 __asm__("a7") = n;
    1e44:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <brk>:
    register long a7 __asm__("a7") = n;
    1e50:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e5c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e62:	8082                	ret

0000000000001e64 <chdir>:
    register long a7 __asm__("a7") = n;
    1e64:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e68:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e70:	862e                	mv	a2,a1
    1e72:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e74:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e76:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e7a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e80:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <getdents>:
    register long a7 __asm__("a7") = n;
    1e8a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <pipe>:
    register long a7 __asm__("a7") = n;
    1e96:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <dup>:
    register long a7 __asm__("a7") = n;
    1ea4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ea6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <dup2>:
    register long a7 __asm__("a7") = n;
    1eae:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <mount>:
    register long a7 __asm__("a7") = n;
    1eba:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ebe:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <umount>:
    register long a7 __asm__("a7") = n;
    1ec6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ecc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ed4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ed6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eda:	8532                	mv	a0,a2
	mv a2, a4
    1edc:	863a                	mv	a2,a4
	mv a3, a5
    1ede:	86be                	mv	a3,a5
	mv a4, a6
    1ee0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee2:	0dc00893          	li	a7,220
	ecall
    1ee6:	00000073          	ecall

	beqz a0, 1f
    1eea:	c111                	beqz	a0,1eee <__clone+0x1a>
	# Parent
	ret
    1eec:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eee:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef0:	6522                	ld	a0,8(sp)
	jalr a1
    1ef2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ef4:	05d00893          	li	a7,93
	ecall
    1ef8:	00000073          	ecall
