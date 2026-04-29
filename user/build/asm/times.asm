
/home/hbh/oslab/oslab/user/build/riscv64/times:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a869                	j	109c <__start_main>

0000000000001004 <test_times>:
	long tms_cstime; 
};

struct tms mytimes;

void test_times() {
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2e>
void test_times() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2e4000ef          	jal	12f4 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	fac50513          	add	a0,a0,-84 # 1fc0 <__func__.0>
    101c:	2d8000ef          	jal	12f4 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	add	a0,a0,-304 # 1ef0 <__clone+0x46>
    1028:	2cc000ef          	jal	12f4 <puts>

	int test_ret = times(&mytimes);
    102c:	00001517          	auipc	a0,0x1
    1030:	f7450513          	add	a0,a0,-140 # 1fa0 <mytimes>
    1034:	4a3000ef          	jal	1cd6 <times>
	assert(test_ret >= 0);
    1038:	04054363          	bltz	a0,107e <test_times+0x7a>

	printf("mytimes success\n{tms_utime:%d, tms_stime:%d, tms_cutime:%d, tms_cstime:%d}\n",
    103c:	00001797          	auipc	a5,0x1
    1040:	f6478793          	add	a5,a5,-156 # 1fa0 <mytimes>
    1044:	6f98                	ld	a4,24(a5)
    1046:	6b94                	ld	a3,16(a5)
    1048:	6790                	ld	a2,8(a5)
    104a:	638c                	ld	a1,0(a5)
    104c:	00001517          	auipc	a0,0x1
    1050:	ed450513          	add	a0,a0,-300 # 1f20 <__clone+0x76>
    1054:	2c2000ef          	jal	1316 <printf>
		mytimes.tms_utime, mytimes.tms_stime, mytimes.tms_cutime, mytimes.tms_cstime);
	TEST_END(__func__);
    1058:	00001517          	auipc	a0,0x1
    105c:	f1850513          	add	a0,a0,-232 # 1f70 <__clone+0xc6>
    1060:	294000ef          	jal	12f4 <puts>
    1064:	00001517          	auipc	a0,0x1
    1068:	f5c50513          	add	a0,a0,-164 # 1fc0 <__func__.0>
    106c:	288000ef          	jal	12f4 <puts>
}
    1070:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1072:	00001517          	auipc	a0,0x1
    1076:	e7e50513          	add	a0,a0,-386 # 1ef0 <__clone+0x46>
}
    107a:	0141                	add	sp,sp,16
	TEST_END(__func__);
    107c:	aca5                	j	12f4 <puts>
	assert(test_ret >= 0);
    107e:	00001517          	auipc	a0,0x1
    1082:	e8250513          	add	a0,a0,-382 # 1f00 <__clone+0x56>
    1086:	50a000ef          	jal	1590 <panic>
    108a:	bf4d                	j	103c <test_times+0x38>

000000000000108c <main>:

int main(void) {
    108c:	1141                	add	sp,sp,-16
    108e:	e406                	sd	ra,8(sp)
	test_times();
    1090:	f75ff0ef          	jal	1004 <test_times>
	return 0;
}
    1094:	60a2                	ld	ra,8(sp)
    1096:	4501                	li	a0,0
    1098:	0141                	add	sp,sp,16
    109a:	8082                	ret

000000000000109c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    109e:	4108                	lw	a0,0(a0)
{
    10a0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10a2:	05a1                	add	a1,a1,8
{
    10a4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a6:	fe7ff0ef          	jal	108c <main>
    10aa:	3fd000ef          	jal	1ca6 <exit>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b6:	7179                	add	sp,sp,-48
    10b8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ba:	12054863          	bltz	a0,11ea <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10be:	02b577bb          	remuw	a5,a0,a1
    10c2:	00001697          	auipc	a3,0x1
    10c6:	f0e68693          	add	a3,a3,-242 # 1fd0 <digits>
    buf[16] = 0;
    10ca:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ce:	0005871b          	sext.w	a4,a1
    10d2:	1782                	sll	a5,a5,0x20
    10d4:	9381                	srl	a5,a5,0x20
    10d6:	97b6                	add	a5,a5,a3
    10d8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10dc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10e0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10e4:	1ab56663          	bltu	a0,a1,1290 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10e8:	02e8763b          	remuw	a2,a6,a4
    10ec:	1602                	sll	a2,a2,0x20
    10ee:	9201                	srl	a2,a2,0x20
    10f0:	9636                	add	a2,a2,a3
    10f2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10fa:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10fe:	12e86c63          	bltu	a6,a4,1236 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1102:	02e5f63b          	remuw	a2,a1,a4
    1106:	1602                	sll	a2,a2,0x20
    1108:	9201                	srl	a2,a2,0x20
    110a:	9636                	add	a2,a2,a3
    110c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1110:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1114:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1118:	12e5e863          	bltu	a1,a4,1248 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    111c:	02e8763b          	remuw	a2,a6,a4
    1120:	1602                	sll	a2,a2,0x20
    1122:	9201                	srl	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1132:	12e86463          	bltu	a6,a4,125a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1136:	02e5f63b          	remuw	a2,a1,a4
    113a:	1602                	sll	a2,a2,0x20
    113c:	9201                	srl	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1148:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    114c:	12e5e063          	bltu	a1,a4,126c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1150:	02e8763b          	remuw	a2,a6,a4
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1162:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1166:	0ae86f63          	bltu	a6,a4,1224 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    116a:	02e5f63b          	remuw	a2,a1,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1180:	0ee5ef63          	bltu	a1,a4,127e <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1184:	02e8763b          	remuw	a2,a6,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1196:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    119a:	0ee86d63          	bltu	a6,a4,1294 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    119e:	02e5f63b          	remuw	a2,a1,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11b4:	0ee5e963          	bltu	a1,a4,12a6 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11b8:	1782                	sll	a5,a5,0x20
    11ba:	9381                	srl	a5,a5,0x20
    11bc:	96be                	add	a3,a3,a5
    11be:	0006c783          	lbu	a5,0(a3)
    11c2:	4599                	li	a1,6
    11c4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11c8:	00055763          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11cc:	02d00793          	li	a5,45
    11d0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11d4:	4595                	li	a1,5
    write(f, s, l);
    11d6:	003c                	add	a5,sp,8
    11d8:	4641                	li	a2,16
    11da:	9e0d                	subw	a2,a2,a1
    11dc:	4505                	li	a0,1
    11de:	95be                	add	a1,a1,a5
    11e0:	26d000ef          	jal	1c4c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e4:	70a2                	ld	ra,40(sp)
    11e6:	6145                	add	sp,sp,48
    11e8:	8082                	ret
        x = -xx;
    11ea:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11ee:	02b677bb          	remuw	a5,a2,a1
    11f2:	00001697          	auipc	a3,0x1
    11f6:	dde68693          	add	a3,a3,-546 # 1fd0 <digits>
    buf[16] = 0;
    11fa:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11fe:	0005871b          	sext.w	a4,a1
    1202:	1782                	sll	a5,a5,0x20
    1204:	9381                	srl	a5,a5,0x20
    1206:	97b6                	add	a5,a5,a3
    1208:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    120c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1210:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1214:	ecb67ae3          	bgeu	a2,a1,10e8 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1218:	02d00793          	li	a5,45
    121c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1220:	45b9                	li	a1,14
    1222:	bf55                	j	11d6 <printint.constprop.0+0x120>
    1224:	45a9                	li	a1,10
    if (sign)
    1226:	fa0558e3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    122a:	02d00793          	li	a5,45
    122e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1232:	45a5                	li	a1,9
    1234:	b74d                	j	11d6 <printint.constprop.0+0x120>
    1236:	45b9                	li	a1,14
    if (sign)
    1238:	f8055fe3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123c:	02d00793          	li	a5,45
    1240:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1244:	45b5                	li	a1,13
    1246:	bf41                	j	11d6 <printint.constprop.0+0x120>
    1248:	45b5                	li	a1,13
    if (sign)
    124a:	f80556e3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1256:	45b1                	li	a1,12
    1258:	bfbd                	j	11d6 <printint.constprop.0+0x120>
    125a:	45b1                	li	a1,12
    if (sign)
    125c:	f6055de3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1268:	45ad                	li	a1,11
    126a:	b7b5                	j	11d6 <printint.constprop.0+0x120>
    126c:	45ad                	li	a1,11
    if (sign)
    126e:	f60554e3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    127a:	45a9                	li	a1,10
    127c:	bfa9                	j	11d6 <printint.constprop.0+0x120>
    127e:	45a5                	li	a1,9
    if (sign)
    1280:	f4055be3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    128c:	45a1                	li	a1,8
    128e:	b7a1                	j	11d6 <printint.constprop.0+0x120>
    i = 15;
    1290:	45bd                	li	a1,15
    1292:	b791                	j	11d6 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1294:	45a1                	li	a1,8
    if (sign)
    1296:	f40550e3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a2:	459d                	li	a1,7
    12a4:	bf0d                	j	11d6 <printint.constprop.0+0x120>
    12a6:	459d                	li	a1,7
    if (sign)
    12a8:	f20557e3          	bgez	a0,11d6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b4:	4599                	li	a1,6
    12b6:	b705                	j	11d6 <printint.constprop.0+0x120>

00000000000012b8 <getchar>:
{
    12b8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ba:	00f10593          	add	a1,sp,15
    12be:	4605                	li	a2,1
    12c0:	4501                	li	a0,0
{
    12c2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c8:	17b000ef          	jal	1c42 <read>
}
    12cc:	60e2                	ld	ra,24(sp)
    12ce:	00f14503          	lbu	a0,15(sp)
    12d2:	6105                	add	sp,sp,32
    12d4:	8082                	ret

00000000000012d6 <putchar>:
{
    12d6:	1101                	add	sp,sp,-32
    12d8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12da:	00f10593          	add	a1,sp,15
    12de:	4605                	li	a2,1
    12e0:	4505                	li	a0,1
{
    12e2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e8:	165000ef          	jal	1c4c <write>
}
    12ec:	60e2                	ld	ra,24(sp)
    12ee:	2501                	sext.w	a0,a0
    12f0:	6105                	add	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <puts>:
{
    12f4:	1141                	add	sp,sp,-16
    12f6:	e406                	sd	ra,8(sp)
    12f8:	e022                	sd	s0,0(sp)
    12fa:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fc:	574000ef          	jal	1870 <strlen>
    1300:	862a                	mv	a2,a0
    1302:	85a2                	mv	a1,s0
    1304:	4505                	li	a0,1
    1306:	147000ef          	jal	1c4c <write>
}
    130a:	60a2                	ld	ra,8(sp)
    130c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130e:	957d                	sra	a0,a0,0x3f
    return r;
    1310:	2501                	sext.w	a0,a0
}
    1312:	0141                	add	sp,sp,16
    1314:	8082                	ret

0000000000001316 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1316:	7171                	add	sp,sp,-176
    1318:	f85a                	sd	s6,48(sp)
    131a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    131c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131e:	18bc                	add	a5,sp,120
{
    1320:	e8ca                	sd	s2,80(sp)
    1322:	e4ce                	sd	s3,72(sp)
    1324:	e0d2                	sd	s4,64(sp)
    1326:	fc56                	sd	s5,56(sp)
    1328:	f486                	sd	ra,104(sp)
    132a:	f0a2                	sd	s0,96(sp)
    132c:	eca6                	sd	s1,88(sp)
    132e:	fcae                	sd	a1,120(sp)
    1330:	e132                	sd	a2,128(sp)
    1332:	e536                	sd	a3,136(sp)
    1334:	e93a                	sd	a4,144(sp)
    1336:	f142                	sd	a6,160(sp)
    1338:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    133a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    133c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1340:	07300a13          	li	s4,115
    1344:	07800a93          	li	s5,120
    buf[i++] = '0';
    1348:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134c:	00001997          	auipc	s3,0x1
    1350:	c8498993          	add	s3,s3,-892 # 1fd0 <digits>
        if (!*s)
    1354:	00054783          	lbu	a5,0(a0)
    1358:	16078a63          	beqz	a5,14cc <printf+0x1b6>
    135c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135e:	19278d63          	beq	a5,s2,14f8 <printf+0x1e2>
    1362:	00164783          	lbu	a5,1(a2)
    1366:	0605                	add	a2,a2,1
    1368:	fbfd                	bnez	a5,135e <printf+0x48>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	0d7000ef          	jal	1c4c <write>
        if (l)
    137a:	1a041463          	bnez	s0,1522 <printf+0x20c>
        if (s[1] == 0)
    137e:	0014c783          	lbu	a5,1(s1)
    1382:	14078563          	beqz	a5,14cc <printf+0x1b6>
        switch (s[1])
    1386:	1b478063          	beq	a5,s4,1526 <printf+0x210>
    138a:	14fa6b63          	bltu	s4,a5,14e0 <printf+0x1ca>
    138e:	06400713          	li	a4,100
    1392:	1ee78063          	beq	a5,a4,1572 <printf+0x25c>
    1396:	07000713          	li	a4,112
    139a:	1ae79963          	bne	a5,a4,154c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    139e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13a4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a6:	631c                	ld	a5,0(a4)
    13a8:	0721                	add	a4,a4,8
    13aa:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ac:	00479293          	sll	t0,a5,0x4
    13b0:	00879f93          	sll	t6,a5,0x8
    13b4:	00c79f13          	sll	t5,a5,0xc
    13b8:	01079e93          	sll	t4,a5,0x10
    13bc:	01479e13          	sll	t3,a5,0x14
    13c0:	01879313          	sll	t1,a5,0x18
    13c4:	01c79893          	sll	a7,a5,0x1c
    13c8:	02479813          	sll	a6,a5,0x24
    13cc:	02879513          	sll	a0,a5,0x28
    13d0:	02c79593          	sll	a1,a5,0x2c
    13d4:	03079693          	sll	a3,a5,0x30
    13d8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13dc:	03c7d413          	srl	s0,a5,0x3c
    13e0:	01c7d39b          	srlw	t2,a5,0x1c
    13e4:	03c2d293          	srl	t0,t0,0x3c
    13e8:	03cfdf93          	srl	t6,t6,0x3c
    13ec:	03cf5f13          	srl	t5,t5,0x3c
    13f0:	03cede93          	srl	t4,t4,0x3c
    13f4:	03ce5e13          	srl	t3,t3,0x3c
    13f8:	03c35313          	srl	t1,t1,0x3c
    13fc:	03c8d893          	srl	a7,a7,0x3c
    1400:	03c85813          	srl	a6,a6,0x3c
    1404:	9171                	srl	a0,a0,0x3c
    1406:	91f1                	srl	a1,a1,0x3c
    1408:	92f1                	srl	a3,a3,0x3c
    140a:	9371                	srl	a4,a4,0x3c
    140c:	96ce                	add	a3,a3,s3
    140e:	974e                	add	a4,a4,s3
    1410:	944e                	add	s0,s0,s3
    1412:	92ce                	add	t0,t0,s3
    1414:	9fce                	add	t6,t6,s3
    1416:	9f4e                	add	t5,t5,s3
    1418:	9ece                	add	t4,t4,s3
    141a:	9e4e                	add	t3,t3,s3
    141c:	934e                	add	t1,t1,s3
    141e:	98ce                	add	a7,a7,s3
    1420:	93ce                	add	t2,t2,s3
    1422:	984e                	add	a6,a6,s3
    1424:	954e                	add	a0,a0,s3
    1426:	95ce                	add	a1,a1,s3
    1428:	0006c083          	lbu	ra,0(a3)
    142c:	0002c283          	lbu	t0,0(t0)
    1430:	00074683          	lbu	a3,0(a4)
    1434:	000fcf83          	lbu	t6,0(t6)
    1438:	000f4f03          	lbu	t5,0(t5)
    143c:	000ece83          	lbu	t4,0(t4)
    1440:	000e4e03          	lbu	t3,0(t3)
    1444:	00034303          	lbu	t1,0(t1)
    1448:	0008c883          	lbu	a7,0(a7)
    144c:	0003c383          	lbu	t2,0(t2)
    1450:	00084803          	lbu	a6,0(a6)
    1454:	00054503          	lbu	a0,0(a0)
    1458:	0005c583          	lbu	a1,0(a1)
    145c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1460:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1464:	9371                	srl	a4,a4,0x3c
    1466:	8bbd                	and	a5,a5,15
    1468:	974e                	add	a4,a4,s3
    146a:	97ce                	add	a5,a5,s3
    146c:	005105a3          	sb	t0,11(sp)
    1470:	01f10623          	sb	t6,12(sp)
    1474:	01e106a3          	sb	t5,13(sp)
    1478:	01d10723          	sb	t4,14(sp)
    147c:	01c107a3          	sb	t3,15(sp)
    1480:	00610823          	sb	t1,16(sp)
    1484:	011108a3          	sb	a7,17(sp)
    1488:	00710923          	sb	t2,18(sp)
    148c:	010109a3          	sb	a6,19(sp)
    1490:	00a10a23          	sb	a0,20(sp)
    1494:	00b10aa3          	sb	a1,21(sp)
    1498:	00110b23          	sb	ra,22(sp)
    149c:	00d10ba3          	sb	a3,23(sp)
    14a0:	00810523          	sb	s0,10(sp)
    14a4:	00074703          	lbu	a4,0(a4)
    14a8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ac:	002c                	add	a1,sp,8
    14ae:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	00e10c23          	sb	a4,24(sp)
    14b4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14bc:	790000ef          	jal	1c4c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c0:	00248513          	add	a0,s1,2
        if (!*s)
    14c4:	00054783          	lbu	a5,0(a0)
    14c8:	e8079ae3          	bnez	a5,135c <printf+0x46>
    }
    va_end(ap);
}
    14cc:	70a6                	ld	ra,104(sp)
    14ce:	7406                	ld	s0,96(sp)
    14d0:	64e6                	ld	s1,88(sp)
    14d2:	6946                	ld	s2,80(sp)
    14d4:	69a6                	ld	s3,72(sp)
    14d6:	6a06                	ld	s4,64(sp)
    14d8:	7ae2                	ld	s5,56(sp)
    14da:	7b42                	ld	s6,48(sp)
    14dc:	614d                	add	sp,sp,176
    14de:	8082                	ret
        switch (s[1])
    14e0:	07579663          	bne	a5,s5,154c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14e4:	6782                	ld	a5,0(sp)
    14e6:	45c1                	li	a1,16
    14e8:	4388                	lw	a0,0(a5)
    14ea:	07a1                	add	a5,a5,8
    14ec:	e03e                	sd	a5,0(sp)
    14ee:	bc9ff0ef          	jal	10b6 <printint.constprop.0>
        s += 2;
    14f2:	00248513          	add	a0,s1,2
    14f6:	b7f9                	j	14c4 <printf+0x1ae>
    14f8:	84b2                	mv	s1,a2
    14fa:	a039                	j	1508 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14fc:	0024c783          	lbu	a5,2(s1)
    1500:	0605                	add	a2,a2,1
    1502:	0489                	add	s1,s1,2
    1504:	e72794e3          	bne	a5,s2,136c <printf+0x56>
    1508:	0014c783          	lbu	a5,1(s1)
    150c:	ff2788e3          	beq	a5,s2,14fc <printf+0x1e6>
        l = z - a;
    1510:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1514:	85aa                	mv	a1,a0
    1516:	8622                	mv	a2,s0
    1518:	4505                	li	a0,1
    151a:	732000ef          	jal	1c4c <write>
        if (l)
    151e:	e60400e3          	beqz	s0,137e <printf+0x68>
    1522:	8526                	mv	a0,s1
    1524:	bd05                	j	1354 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1526:	6782                	ld	a5,0(sp)
    1528:	6380                	ld	s0,0(a5)
    152a:	07a1                	add	a5,a5,8
    152c:	e03e                	sd	a5,0(sp)
    152e:	cc21                	beqz	s0,1586 <printf+0x270>
            l = strnlen(a, 200);
    1530:	0c800593          	li	a1,200
    1534:	8522                	mv	a0,s0
    1536:	424000ef          	jal	195a <strnlen>
    write(f, s, l);
    153a:	0005061b          	sext.w	a2,a0
    153e:	85a2                	mv	a1,s0
    1540:	4505                	li	a0,1
    1542:	70a000ef          	jal	1c4c <write>
        s += 2;
    1546:	00248513          	add	a0,s1,2
    154a:	bfad                	j	14c4 <printf+0x1ae>
    return write(stdout, &byte, 1);
    154c:	4605                	li	a2,1
    154e:	002c                	add	a1,sp,8
    1550:	4505                	li	a0,1
    char byte = c;
    1552:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1556:	6f6000ef          	jal	1c4c <write>
    char byte = c;
    155a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    155e:	4605                	li	a2,1
    1560:	002c                	add	a1,sp,8
    1562:	4505                	li	a0,1
    char byte = c;
    1564:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1568:	6e4000ef          	jal	1c4c <write>
        s += 2;
    156c:	00248513          	add	a0,s1,2
    1570:	bf91                	j	14c4 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1572:	6782                	ld	a5,0(sp)
    1574:	45a9                	li	a1,10
    1576:	4388                	lw	a0,0(a5)
    1578:	07a1                	add	a5,a5,8
    157a:	e03e                	sd	a5,0(sp)
    157c:	b3bff0ef          	jal	10b6 <printint.constprop.0>
        s += 2;
    1580:	00248513          	add	a0,s1,2
    1584:	b781                	j	14c4 <printf+0x1ae>
                a = "(null)";
    1586:	00001417          	auipc	s0,0x1
    158a:	9fa40413          	add	s0,s0,-1542 # 1f80 <__clone+0xd6>
    158e:	b74d                	j	1530 <printf+0x21a>

0000000000001590 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1590:	1141                	add	sp,sp,-16
    1592:	e406                	sd	ra,8(sp)
    puts(m);
    1594:	d61ff0ef          	jal	12f4 <puts>
    exit(-100);
}
    1598:	60a2                	ld	ra,8(sp)
    exit(-100);
    159a:	f9c00513          	li	a0,-100
}
    159e:	0141                	add	sp,sp,16
    exit(-100);
    15a0:	a719                	j	1ca6 <exit>

00000000000015a2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	02000793          	li	a5,32
    15a6:	00f50663          	beq	a0,a5,15b2 <isspace+0x10>
    15aa:	355d                	addw	a0,a0,-9
    15ac:	00553513          	sltiu	a0,a0,5
    15b0:	8082                	ret
    15b2:	4505                	li	a0,1
}
    15b4:	8082                	ret

00000000000015b6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b6:	fd05051b          	addw	a0,a0,-48
}
    15ba:	00a53513          	sltiu	a0,a0,10
    15be:	8082                	ret

00000000000015c0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c0:	02000693          	li	a3,32
    15c4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	ff77871b          	addw	a4,a5,-9
    15ce:	04d78c63          	beq	a5,a3,1626 <atoi+0x66>
    15d2:	0007861b          	sext.w	a2,a5
    15d6:	04e5f863          	bgeu	a1,a4,1626 <atoi+0x66>
        s++;
    switch (*s)
    15da:	02b00713          	li	a4,43
    15de:	04e78963          	beq	a5,a4,1630 <atoi+0x70>
    15e2:	02d00713          	li	a4,45
    15e6:	06e78263          	beq	a5,a4,164a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ea:	fd06069b          	addw	a3,a2,-48
    15ee:	47a5                	li	a5,9
    15f0:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15f2:	4301                	li	t1,0
    while (isdigit(*s))
    15f4:	04d7e963          	bltu	a5,a3,1646 <atoi+0x86>
    int n = 0, neg = 0;
    15f8:	4501                	li	a0,0
    while (isdigit(*s))
    15fa:	48a5                	li	a7,9
    15fc:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1600:	0025179b          	sllw	a5,a0,0x2
    1604:	9fa9                	addw	a5,a5,a0
    1606:	fd06059b          	addw	a1,a2,-48
    160a:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    160e:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1612:	0705                	add	a4,a4,1
    1614:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1618:	0006861b          	sext.w	a2,a3
    161c:	ff08f0e3          	bgeu	a7,a6,15fc <atoi+0x3c>
    return neg ? n : -n;
    1620:	00030563          	beqz	t1,162a <atoi+0x6a>
}
    1624:	8082                	ret
        s++;
    1626:	0505                	add	a0,a0,1
    1628:	bf79                	j	15c6 <atoi+0x6>
    return neg ? n : -n;
    162a:	40f5853b          	subw	a0,a1,a5
    162e:	8082                	ret
    while (isdigit(*s))
    1630:	00154603          	lbu	a2,1(a0)
    1634:	47a5                	li	a5,9
        s++;
    1636:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    163a:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    163e:	4301                	li	t1,0
    while (isdigit(*s))
    1640:	2601                	sext.w	a2,a2
    1642:	fad7fbe3          	bgeu	a5,a3,15f8 <atoi+0x38>
    1646:	4501                	li	a0,0
}
    1648:	8082                	ret
    while (isdigit(*s))
    164a:	00154603          	lbu	a2,1(a0)
    164e:	47a5                	li	a5,9
        s++;
    1650:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1654:	fd06069b          	addw	a3,a2,-48
    1658:	2601                	sext.w	a2,a2
    165a:	fed7e6e3          	bltu	a5,a3,1646 <atoi+0x86>
        neg = 1;
    165e:	4305                	li	t1,1
    1660:	bf61                	j	15f8 <atoi+0x38>

0000000000001662 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1662:	18060163          	beqz	a2,17e4 <memset+0x182>
    1666:	40a006b3          	neg	a3,a0
    166a:	0076f793          	and	a5,a3,7
    166e:	00778813          	add	a6,a5,7
    1672:	48ad                	li	a7,11
    1674:	0ff5f713          	zext.b	a4,a1
    1678:	fff60593          	add	a1,a2,-1
    167c:	17186563          	bltu	a6,a7,17e6 <memset+0x184>
    1680:	1705ed63          	bltu	a1,a6,17fa <memset+0x198>
    1684:	16078363          	beqz	a5,17ea <memset+0x188>
    1688:	00e50023          	sb	a4,0(a0)
    168c:	0066f593          	and	a1,a3,6
    1690:	16058063          	beqz	a1,17f0 <memset+0x18e>
    1694:	00e500a3          	sb	a4,1(a0)
    1698:	4589                	li	a1,2
    169a:	16f5f363          	bgeu	a1,a5,1800 <memset+0x19e>
    169e:	00e50123          	sb	a4,2(a0)
    16a2:	8a91                	and	a3,a3,4
    16a4:	00350593          	add	a1,a0,3
    16a8:	4e0d                	li	t3,3
    16aa:	ce9d                	beqz	a3,16e8 <memset+0x86>
    16ac:	00e501a3          	sb	a4,3(a0)
    16b0:	4691                	li	a3,4
    16b2:	00450593          	add	a1,a0,4
    16b6:	4e11                	li	t3,4
    16b8:	02f6f863          	bgeu	a3,a5,16e8 <memset+0x86>
    16bc:	00e50223          	sb	a4,4(a0)
    16c0:	4695                	li	a3,5
    16c2:	00550593          	add	a1,a0,5
    16c6:	4e15                	li	t3,5
    16c8:	02d78063          	beq	a5,a3,16e8 <memset+0x86>
    16cc:	fff50693          	add	a3,a0,-1
    16d0:	00e502a3          	sb	a4,5(a0)
    16d4:	8a9d                	and	a3,a3,7
    16d6:	00650593          	add	a1,a0,6
    16da:	4e19                	li	t3,6
    16dc:	e691                	bnez	a3,16e8 <memset+0x86>
    16de:	00750593          	add	a1,a0,7
    16e2:	00e50323          	sb	a4,6(a0)
    16e6:	4e1d                	li	t3,7
    16e8:	00871693          	sll	a3,a4,0x8
    16ec:	01071813          	sll	a6,a4,0x10
    16f0:	8ed9                	or	a3,a3,a4
    16f2:	01871893          	sll	a7,a4,0x18
    16f6:	0106e6b3          	or	a3,a3,a6
    16fa:	0116e6b3          	or	a3,a3,a7
    16fe:	02071813          	sll	a6,a4,0x20
    1702:	02871313          	sll	t1,a4,0x28
    1706:	0106e6b3          	or	a3,a3,a6
    170a:	40f608b3          	sub	a7,a2,a5
    170e:	03071813          	sll	a6,a4,0x30
    1712:	0066e6b3          	or	a3,a3,t1
    1716:	0106e6b3          	or	a3,a3,a6
    171a:	03871313          	sll	t1,a4,0x38
    171e:	97aa                	add	a5,a5,a0
    1720:	ff88f813          	and	a6,a7,-8
    1724:	0066e6b3          	or	a3,a3,t1
    1728:	983e                	add	a6,a6,a5
    172a:	e394                	sd	a3,0(a5)
    172c:	07a1                	add	a5,a5,8
    172e:	ff079ee3          	bne	a5,a6,172a <memset+0xc8>
    1732:	ff88f793          	and	a5,a7,-8
    1736:	0078f893          	and	a7,a7,7
    173a:	00f586b3          	add	a3,a1,a5
    173e:	01c787bb          	addw	a5,a5,t3
    1742:	0a088b63          	beqz	a7,17f8 <memset+0x196>
    1746:	00e68023          	sb	a4,0(a3)
    174a:	0017859b          	addw	a1,a5,1
    174e:	08c5fb63          	bgeu	a1,a2,17e4 <memset+0x182>
    1752:	00e680a3          	sb	a4,1(a3)
    1756:	0027859b          	addw	a1,a5,2
    175a:	08c5f563          	bgeu	a1,a2,17e4 <memset+0x182>
    175e:	00e68123          	sb	a4,2(a3)
    1762:	0037859b          	addw	a1,a5,3
    1766:	06c5ff63          	bgeu	a1,a2,17e4 <memset+0x182>
    176a:	00e681a3          	sb	a4,3(a3)
    176e:	0047859b          	addw	a1,a5,4
    1772:	06c5f963          	bgeu	a1,a2,17e4 <memset+0x182>
    1776:	00e68223          	sb	a4,4(a3)
    177a:	0057859b          	addw	a1,a5,5
    177e:	06c5f363          	bgeu	a1,a2,17e4 <memset+0x182>
    1782:	00e682a3          	sb	a4,5(a3)
    1786:	0067859b          	addw	a1,a5,6
    178a:	04c5fd63          	bgeu	a1,a2,17e4 <memset+0x182>
    178e:	00e68323          	sb	a4,6(a3)
    1792:	0077859b          	addw	a1,a5,7
    1796:	04c5f763          	bgeu	a1,a2,17e4 <memset+0x182>
    179a:	00e683a3          	sb	a4,7(a3)
    179e:	0087859b          	addw	a1,a5,8
    17a2:	04c5f163          	bgeu	a1,a2,17e4 <memset+0x182>
    17a6:	00e68423          	sb	a4,8(a3)
    17aa:	0097859b          	addw	a1,a5,9
    17ae:	02c5fb63          	bgeu	a1,a2,17e4 <memset+0x182>
    17b2:	00e684a3          	sb	a4,9(a3)
    17b6:	00a7859b          	addw	a1,a5,10
    17ba:	02c5f563          	bgeu	a1,a2,17e4 <memset+0x182>
    17be:	00e68523          	sb	a4,10(a3)
    17c2:	00b7859b          	addw	a1,a5,11
    17c6:	00c5ff63          	bgeu	a1,a2,17e4 <memset+0x182>
    17ca:	00e685a3          	sb	a4,11(a3)
    17ce:	00c7859b          	addw	a1,a5,12
    17d2:	00c5f963          	bgeu	a1,a2,17e4 <memset+0x182>
    17d6:	00e68623          	sb	a4,12(a3)
    17da:	27b5                	addw	a5,a5,13
    17dc:	00c7f463          	bgeu	a5,a2,17e4 <memset+0x182>
    17e0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17e4:	8082                	ret
    17e6:	482d                	li	a6,11
    17e8:	bd61                	j	1680 <memset+0x1e>
    char *p = dest;
    17ea:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ec:	4e01                	li	t3,0
    17ee:	bded                	j	16e8 <memset+0x86>
    17f0:	00150593          	add	a1,a0,1
    17f4:	4e05                	li	t3,1
    17f6:	bdcd                	j	16e8 <memset+0x86>
    17f8:	8082                	ret
    char *p = dest;
    17fa:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fc:	4781                	li	a5,0
    17fe:	b7a1                	j	1746 <memset+0xe4>
    1800:	00250593          	add	a1,a0,2
    1804:	4e09                	li	t3,2
    1806:	b5cd                	j	16e8 <memset+0x86>

0000000000001808 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1808:	00054783          	lbu	a5,0(a0)
    180c:	0005c703          	lbu	a4,0(a1)
    1810:	00e79863          	bne	a5,a4,1820 <strcmp+0x18>
    1814:	0505                	add	a0,a0,1
    1816:	0585                	add	a1,a1,1
    1818:	fbe5                	bnez	a5,1808 <strcmp>
    181a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    181c:	9d19                	subw	a0,a0,a4
    181e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1820:	0007851b          	sext.w	a0,a5
    1824:	bfe5                	j	181c <strcmp+0x14>

0000000000001826 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1826:	ca15                	beqz	a2,185a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	00054783          	lbu	a5,0(a0)
    if (!n--)
    182c:	167d                	add	a2,a2,-1
    182e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1832:	eb99                	bnez	a5,1848 <strncmp+0x22>
    1834:	a815                	j	1868 <strncmp+0x42>
    1836:	00a68e63          	beq	a3,a0,1852 <strncmp+0x2c>
    183a:	0505                	add	a0,a0,1
    183c:	00f71b63          	bne	a4,a5,1852 <strncmp+0x2c>
    1840:	00054783          	lbu	a5,0(a0)
    1844:	cf89                	beqz	a5,185e <strncmp+0x38>
    1846:	85b2                	mv	a1,a2
    1848:	0005c703          	lbu	a4,0(a1)
    184c:	00158613          	add	a2,a1,1
    1850:	f37d                	bnez	a4,1836 <strncmp+0x10>
        ;
    return *l - *r;
    1852:	0007851b          	sext.w	a0,a5
    1856:	9d19                	subw	a0,a0,a4
    1858:	8082                	ret
        return 0;
    185a:	4501                	li	a0,0
}
    185c:	8082                	ret
    return *l - *r;
    185e:	0015c703          	lbu	a4,1(a1)
    1862:	4501                	li	a0,0
    1864:	9d19                	subw	a0,a0,a4
    1866:	8082                	ret
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	4501                	li	a0,0
    186e:	b7e5                	j	1856 <strncmp+0x30>

0000000000001870 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1870:	00757793          	and	a5,a0,7
    1874:	cf89                	beqz	a5,188e <strlen+0x1e>
    1876:	87aa                	mv	a5,a0
    1878:	a029                	j	1882 <strlen+0x12>
    187a:	0785                	add	a5,a5,1
    187c:	0077f713          	and	a4,a5,7
    1880:	cb01                	beqz	a4,1890 <strlen+0x20>
        if (!*s)
    1882:	0007c703          	lbu	a4,0(a5)
    1886:	fb75                	bnez	a4,187a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1888:	40a78533          	sub	a0,a5,a0
}
    188c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    188e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1890:	6394                	ld	a3,0(a5)
    1892:	00000597          	auipc	a1,0x0
    1896:	6f65b583          	ld	a1,1782(a1) # 1f88 <__clone+0xde>
    189a:	00000617          	auipc	a2,0x0
    189e:	6f663603          	ld	a2,1782(a2) # 1f90 <__clone+0xe6>
    18a2:	a019                	j	18a8 <strlen+0x38>
    18a4:	6794                	ld	a3,8(a5)
    18a6:	07a1                	add	a5,a5,8
    18a8:	00b68733          	add	a4,a3,a1
    18ac:	fff6c693          	not	a3,a3
    18b0:	8f75                	and	a4,a4,a3
    18b2:	8f71                	and	a4,a4,a2
    18b4:	db65                	beqz	a4,18a4 <strlen+0x34>
    for (; *s; s++)
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	d779                	beqz	a4,1888 <strlen+0x18>
    18bc:	0017c703          	lbu	a4,1(a5)
    18c0:	0785                	add	a5,a5,1
    18c2:	d379                	beqz	a4,1888 <strlen+0x18>
    18c4:	0017c703          	lbu	a4,1(a5)
    18c8:	0785                	add	a5,a5,1
    18ca:	fb6d                	bnez	a4,18bc <strlen+0x4c>
    18cc:	bf75                	j	1888 <strlen+0x18>

00000000000018ce <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ce:	00757713          	and	a4,a0,7
{
    18d2:	87aa                	mv	a5,a0
    18d4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d8:	cb19                	beqz	a4,18ee <memchr+0x20>
    18da:	ce25                	beqz	a2,1952 <memchr+0x84>
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	00b70763          	beq	a4,a1,18ee <memchr+0x20>
    18e4:	0785                	add	a5,a5,1
    18e6:	0077f713          	and	a4,a5,7
    18ea:	167d                	add	a2,a2,-1
    18ec:	f77d                	bnez	a4,18da <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ee:	4501                	li	a0,0
    if (n && *s != c)
    18f0:	c235                	beqz	a2,1954 <memchr+0x86>
    18f2:	0007c703          	lbu	a4,0(a5)
    18f6:	06b70063          	beq	a4,a1,1956 <memchr+0x88>
        size_t k = ONES * c;
    18fa:	00000517          	auipc	a0,0x0
    18fe:	69e53503          	ld	a0,1694(a0) # 1f98 <__clone+0xee>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	471d                	li	a4,7
        size_t k = ONES * c;
    1904:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1908:	04c77763          	bgeu	a4,a2,1956 <memchr+0x88>
    190c:	00000897          	auipc	a7,0x0
    1910:	67c8b883          	ld	a7,1660(a7) # 1f88 <__clone+0xde>
    1914:	00000817          	auipc	a6,0x0
    1918:	67c83803          	ld	a6,1660(a6) # 1f90 <__clone+0xe6>
    191c:	431d                	li	t1,7
    191e:	a029                	j	1928 <memchr+0x5a>
    1920:	1661                	add	a2,a2,-8
    1922:	07a1                	add	a5,a5,8
    1924:	00c37c63          	bgeu	t1,a2,193c <memchr+0x6e>
    1928:	6398                	ld	a4,0(a5)
    192a:	8f29                	xor	a4,a4,a0
    192c:	011706b3          	add	a3,a4,a7
    1930:	fff74713          	not	a4,a4
    1934:	8f75                	and	a4,a4,a3
    1936:	01077733          	and	a4,a4,a6
    193a:	d37d                	beqz	a4,1920 <memchr+0x52>
    193c:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    193e:	e601                	bnez	a2,1946 <memchr+0x78>
    1940:	a809                	j	1952 <memchr+0x84>
    1942:	0505                	add	a0,a0,1
    1944:	c619                	beqz	a2,1952 <memchr+0x84>
    1946:	00054783          	lbu	a5,0(a0)
    194a:	167d                	add	a2,a2,-1
    194c:	feb79be3          	bne	a5,a1,1942 <memchr+0x74>
    1950:	8082                	ret
    return n ? (void *)s : 0;
    1952:	4501                	li	a0,0
}
    1954:	8082                	ret
    if (n && *s != c)
    1956:	853e                	mv	a0,a5
    1958:	b7fd                	j	1946 <memchr+0x78>

000000000000195a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    195a:	1101                	add	sp,sp,-32
    195c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    195e:	862e                	mv	a2,a1
{
    1960:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1962:	4581                	li	a1,0
{
    1964:	e426                	sd	s1,8(sp)
    1966:	ec06                	sd	ra,24(sp)
    1968:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    196a:	f65ff0ef          	jal	18ce <memchr>
    return p ? p - s : n;
    196e:	c519                	beqz	a0,197c <strnlen+0x22>
}
    1970:	60e2                	ld	ra,24(sp)
    1972:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1974:	8d05                	sub	a0,a0,s1
}
    1976:	64a2                	ld	s1,8(sp)
    1978:	6105                	add	sp,sp,32
    197a:	8082                	ret
    197c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    197e:	8522                	mv	a0,s0
}
    1980:	6442                	ld	s0,16(sp)
    1982:	64a2                	ld	s1,8(sp)
    1984:	6105                	add	sp,sp,32
    1986:	8082                	ret

0000000000001988 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1988:	00a5c7b3          	xor	a5,a1,a0
    198c:	8b9d                	and	a5,a5,7
    198e:	eb95                	bnez	a5,19c2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1990:	0075f793          	and	a5,a1,7
    1994:	e7b1                	bnez	a5,19e0 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1996:	6198                	ld	a4,0(a1)
    1998:	00000617          	auipc	a2,0x0
    199c:	5f063603          	ld	a2,1520(a2) # 1f88 <__clone+0xde>
    19a0:	00000817          	auipc	a6,0x0
    19a4:	5f083803          	ld	a6,1520(a6) # 1f90 <__clone+0xe6>
    19a8:	a029                	j	19b2 <strcpy+0x2a>
    19aa:	05a1                	add	a1,a1,8
    19ac:	e118                	sd	a4,0(a0)
    19ae:	6198                	ld	a4,0(a1)
    19b0:	0521                	add	a0,a0,8
    19b2:	00c707b3          	add	a5,a4,a2
    19b6:	fff74693          	not	a3,a4
    19ba:	8ff5                	and	a5,a5,a3
    19bc:	0107f7b3          	and	a5,a5,a6
    19c0:	d7ed                	beqz	a5,19aa <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c2:	0005c783          	lbu	a5,0(a1)
    19c6:	00f50023          	sb	a5,0(a0)
    19ca:	c785                	beqz	a5,19f2 <strcpy+0x6a>
    19cc:	0015c783          	lbu	a5,1(a1)
    19d0:	0505                	add	a0,a0,1
    19d2:	0585                	add	a1,a1,1
    19d4:	00f50023          	sb	a5,0(a0)
    19d8:	fbf5                	bnez	a5,19cc <strcpy+0x44>
        ;
    return d;
}
    19da:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19dc:	0505                	add	a0,a0,1
    19de:	df45                	beqz	a4,1996 <strcpy+0xe>
            if (!(*d = *s))
    19e0:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0585                	add	a1,a1,1
    19e6:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19ea:	00f50023          	sb	a5,0(a0)
    19ee:	f7fd                	bnez	a5,19dc <strcpy+0x54>
}
    19f0:	8082                	ret
    19f2:	8082                	ret

00000000000019f4 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19f4:	00a5c7b3          	xor	a5,a1,a0
    19f8:	8b9d                	and	a5,a5,7
    19fa:	e3b5                	bnez	a5,1a5e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19fc:	0075f793          	and	a5,a1,7
    1a00:	cf99                	beqz	a5,1a1e <strncpy+0x2a>
    1a02:	ea09                	bnez	a2,1a14 <strncpy+0x20>
    1a04:	a421                	j	1c0c <strncpy+0x218>
    1a06:	0585                	add	a1,a1,1
    1a08:	0075f793          	and	a5,a1,7
    1a0c:	167d                	add	a2,a2,-1
    1a0e:	0505                	add	a0,a0,1
    1a10:	c799                	beqz	a5,1a1e <strncpy+0x2a>
    1a12:	c225                	beqz	a2,1a72 <strncpy+0x7e>
    1a14:	0005c783          	lbu	a5,0(a1)
    1a18:	00f50023          	sb	a5,0(a0)
    1a1c:	f7ed                	bnez	a5,1a06 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a1e:	ca31                	beqz	a2,1a72 <strncpy+0x7e>
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	cba1                	beqz	a5,1a74 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a26:	479d                	li	a5,7
    1a28:	02c7fc63          	bgeu	a5,a2,1a60 <strncpy+0x6c>
    1a2c:	00000897          	auipc	a7,0x0
    1a30:	55c8b883          	ld	a7,1372(a7) # 1f88 <__clone+0xde>
    1a34:	00000817          	auipc	a6,0x0
    1a38:	55c83803          	ld	a6,1372(a6) # 1f90 <__clone+0xe6>
    1a3c:	431d                	li	t1,7
    1a3e:	a039                	j	1a4c <strncpy+0x58>
            *wd = *ws;
    1a40:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a42:	1661                	add	a2,a2,-8
    1a44:	05a1                	add	a1,a1,8
    1a46:	0521                	add	a0,a0,8
    1a48:	00c37b63          	bgeu	t1,a2,1a5e <strncpy+0x6a>
    1a4c:	6198                	ld	a4,0(a1)
    1a4e:	011707b3          	add	a5,a4,a7
    1a52:	fff74693          	not	a3,a4
    1a56:	8ff5                	and	a5,a5,a3
    1a58:	0107f7b3          	and	a5,a5,a6
    1a5c:	d3f5                	beqz	a5,1a40 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a5e:	ca11                	beqz	a2,1a72 <strncpy+0x7e>
    1a60:	0005c783          	lbu	a5,0(a1)
    1a64:	0585                	add	a1,a1,1
    1a66:	00f50023          	sb	a5,0(a0)
    1a6a:	c789                	beqz	a5,1a74 <strncpy+0x80>
    1a6c:	167d                	add	a2,a2,-1
    1a6e:	0505                	add	a0,a0,1
    1a70:	fa65                	bnez	a2,1a60 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a72:	8082                	ret
    1a74:	4805                	li	a6,1
    1a76:	14061b63          	bnez	a2,1bcc <strncpy+0x1d8>
    1a7a:	40a00733          	neg	a4,a0
    1a7e:	00777793          	and	a5,a4,7
    1a82:	4581                	li	a1,0
    1a84:	12061c63          	bnez	a2,1bbc <strncpy+0x1c8>
    1a88:	00778693          	add	a3,a5,7
    1a8c:	48ad                	li	a7,11
    1a8e:	1316e563          	bltu	a3,a7,1bb8 <strncpy+0x1c4>
    1a92:	16d5e263          	bltu	a1,a3,1bf6 <strncpy+0x202>
    1a96:	14078c63          	beqz	a5,1bee <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a9a:	00050023          	sb	zero,0(a0)
    1a9e:	00677693          	and	a3,a4,6
    1aa2:	14068263          	beqz	a3,1be6 <strncpy+0x1f2>
    1aa6:	000500a3          	sb	zero,1(a0)
    1aaa:	4689                	li	a3,2
    1aac:	14f6f863          	bgeu	a3,a5,1bfc <strncpy+0x208>
    1ab0:	00050123          	sb	zero,2(a0)
    1ab4:	8b11                	and	a4,a4,4
    1ab6:	12070463          	beqz	a4,1bde <strncpy+0x1ea>
    1aba:	000501a3          	sb	zero,3(a0)
    1abe:	4711                	li	a4,4
    1ac0:	00450693          	add	a3,a0,4
    1ac4:	02f77563          	bgeu	a4,a5,1aee <strncpy+0xfa>
    1ac8:	00050223          	sb	zero,4(a0)
    1acc:	4715                	li	a4,5
    1ace:	00550693          	add	a3,a0,5
    1ad2:	00e78e63          	beq	a5,a4,1aee <strncpy+0xfa>
    1ad6:	fff50713          	add	a4,a0,-1
    1ada:	000502a3          	sb	zero,5(a0)
    1ade:	8b1d                	and	a4,a4,7
    1ae0:	12071263          	bnez	a4,1c04 <strncpy+0x210>
    1ae4:	00750693          	add	a3,a0,7
    1ae8:	00050323          	sb	zero,6(a0)
    1aec:	471d                	li	a4,7
    1aee:	40f80833          	sub	a6,a6,a5
    1af2:	ff887593          	and	a1,a6,-8
    1af6:	97aa                	add	a5,a5,a0
    1af8:	95be                	add	a1,a1,a5
    1afa:	0007b023          	sd	zero,0(a5)
    1afe:	07a1                	add	a5,a5,8
    1b00:	feb79de3          	bne	a5,a1,1afa <strncpy+0x106>
    1b04:	ff887593          	and	a1,a6,-8
    1b08:	00787813          	and	a6,a6,7
    1b0c:	00e587bb          	addw	a5,a1,a4
    1b10:	00b68733          	add	a4,a3,a1
    1b14:	0e080063          	beqz	a6,1bf4 <strncpy+0x200>
    1b18:	00070023          	sb	zero,0(a4)
    1b1c:	0017869b          	addw	a3,a5,1
    1b20:	f4c6f9e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b24:	000700a3          	sb	zero,1(a4)
    1b28:	0027869b          	addw	a3,a5,2
    1b2c:	f4c6f3e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b30:	00070123          	sb	zero,2(a4)
    1b34:	0037869b          	addw	a3,a5,3
    1b38:	f2c6fde3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b3c:	000701a3          	sb	zero,3(a4)
    1b40:	0047869b          	addw	a3,a5,4
    1b44:	f2c6f7e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b48:	00070223          	sb	zero,4(a4)
    1b4c:	0057869b          	addw	a3,a5,5
    1b50:	f2c6f1e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b54:	000702a3          	sb	zero,5(a4)
    1b58:	0067869b          	addw	a3,a5,6
    1b5c:	f0c6fbe3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b60:	00070323          	sb	zero,6(a4)
    1b64:	0077869b          	addw	a3,a5,7
    1b68:	f0c6f5e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b6c:	000703a3          	sb	zero,7(a4)
    1b70:	0087869b          	addw	a3,a5,8
    1b74:	eec6ffe3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b78:	00070423          	sb	zero,8(a4)
    1b7c:	0097869b          	addw	a3,a5,9
    1b80:	eec6f9e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b84:	000704a3          	sb	zero,9(a4)
    1b88:	00a7869b          	addw	a3,a5,10
    1b8c:	eec6f3e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b90:	00070523          	sb	zero,10(a4)
    1b94:	00b7869b          	addw	a3,a5,11
    1b98:	ecc6fde3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1b9c:	000705a3          	sb	zero,11(a4)
    1ba0:	00c7869b          	addw	a3,a5,12
    1ba4:	ecc6f7e3          	bgeu	a3,a2,1a72 <strncpy+0x7e>
    1ba8:	00070623          	sb	zero,12(a4)
    1bac:	27b5                	addw	a5,a5,13
    1bae:	ecc7f2e3          	bgeu	a5,a2,1a72 <strncpy+0x7e>
    1bb2:	000706a3          	sb	zero,13(a4)
}
    1bb6:	8082                	ret
    1bb8:	46ad                	li	a3,11
    1bba:	bde1                	j	1a92 <strncpy+0x9e>
    1bbc:	00778693          	add	a3,a5,7
    1bc0:	48ad                	li	a7,11
    1bc2:	fff60593          	add	a1,a2,-1
    1bc6:	ed16f6e3          	bgeu	a3,a7,1a92 <strncpy+0x9e>
    1bca:	b7fd                	j	1bb8 <strncpy+0x1c4>
    1bcc:	40a00733          	neg	a4,a0
    1bd0:	8832                	mv	a6,a2
    1bd2:	00777793          	and	a5,a4,7
    1bd6:	4581                	li	a1,0
    1bd8:	ea0608e3          	beqz	a2,1a88 <strncpy+0x94>
    1bdc:	b7c5                	j	1bbc <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bde:	00350693          	add	a3,a0,3
    1be2:	470d                	li	a4,3
    1be4:	b729                	j	1aee <strncpy+0xfa>
    1be6:	00150693          	add	a3,a0,1
    1bea:	4705                	li	a4,1
    1bec:	b709                	j	1aee <strncpy+0xfa>
tail:
    1bee:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf0:	4701                	li	a4,0
    1bf2:	bdf5                	j	1aee <strncpy+0xfa>
    1bf4:	8082                	ret
tail:
    1bf6:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf8:	4781                	li	a5,0
    1bfa:	bf39                	j	1b18 <strncpy+0x124>
    1bfc:	00250693          	add	a3,a0,2
    1c00:	4709                	li	a4,2
    1c02:	b5f5                	j	1aee <strncpy+0xfa>
    1c04:	00650693          	add	a3,a0,6
    1c08:	4719                	li	a4,6
    1c0a:	b5d5                	j	1aee <strncpy+0xfa>
    1c0c:	8082                	ret

0000000000001c0e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c0e:	87aa                	mv	a5,a0
    1c10:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c12:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c1c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c22:	2501                	sext.w	a0,a0
    1c24:	8082                	ret

0000000000001c26 <openat>:
    register long a7 __asm__("a7") = n;
    1c26:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c2a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c32:	2501                	sext.w	a0,a0
    1c34:	8082                	ret

0000000000001c36 <close>:
    register long a7 __asm__("a7") = n;
    1c36:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c3a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c3e:	2501                	sext.w	a0,a0
    1c40:	8082                	ret

0000000000001c42 <read>:
    register long a7 __asm__("a7") = n;
    1c42:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c46:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c4a:	8082                	ret

0000000000001c4c <write>:
    register long a7 __asm__("a7") = n;
    1c4c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c50:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c54:	8082                	ret

0000000000001c56 <getpid>:
    register long a7 __asm__("a7") = n;
    1c56:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c5a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <getppid>:
    register long a7 __asm__("a7") = n;
    1c62:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c66:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c6e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c72:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <fork>:
    register long a7 __asm__("a7") = n;
    1c7a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c7e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c82:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c8a:	85b2                	mv	a1,a2
    1c8c:	863a                	mv	a2,a4
    if (stack)
    1c8e:	c191                	beqz	a1,1c92 <clone+0x8>
	stack += stack_size;
    1c90:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c92:	4781                	li	a5,0
    1c94:	4701                	li	a4,0
    1c96:	4681                	li	a3,0
    1c98:	2601                	sext.w	a2,a2
    1c9a:	ac01                	j	1eaa <__clone>

0000000000001c9c <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c9c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ca0:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1ca4:	8082                	ret

0000000000001ca6 <exit>:
    register long a7 __asm__("a7") = n;
    1ca6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1caa:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cae:	8082                	ret

0000000000001cb0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <exec>:
    register long a7 __asm__("a7") = n;
    1cbe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <execve>:
    register long a7 __asm__("a7") = n;
    1cca:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cce:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	8082                	ret

0000000000001cd6 <times>:
    register long a7 __asm__("a7") = n;
    1cd6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cda:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cde:	2501                	sext.w	a0,a0
    1ce0:	8082                	ret

0000000000001ce2 <get_time>:

int64 get_time()
{
    1ce2:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ce8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cea:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cec:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	ed09                	bnez	a0,1d0c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf4:	67a2                	ld	a5,8(sp)
    1cf6:	3e800713          	li	a4,1000
    1cfa:	00015503          	lhu	a0,0(sp)
    1cfe:	02e7d7b3          	divu	a5,a5,a4
    1d02:	02e50533          	mul	a0,a0,a4
    1d06:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d08:	0141                	add	sp,sp,16
    1d0a:	8082                	ret
        return -1;
    1d0c:	557d                	li	a0,-1
    1d0e:	bfed                	j	1d08 <get_time+0x26>

0000000000001d10 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d10:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d14:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <time>:
    register long a7 __asm__("a7") = n;
    1d1c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <sleep>:

int sleep(unsigned long long time)
{
    1d28:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d2a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d2c:	850a                	mv	a0,sp
    1d2e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d30:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d34:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d36:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3a:	e501                	bnez	a0,1d42 <sleep+0x1a>
    return 0;
    1d3c:	4501                	li	a0,0
}
    1d3e:	0141                	add	sp,sp,16
    1d40:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d42:	4502                	lw	a0,0(sp)
}
    1d44:	0141                	add	sp,sp,16
    1d46:	8082                	ret

0000000000001d48 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d48:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d4c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d54:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d58:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d5c:	8082                	ret

0000000000001d5e <mprotect>:
    register long a7 __asm__("a7") = n;
    1d5e:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d62:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <munmap>:
    register long a7 __asm__("a7") = n;
    1d6a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <wait>:

int wait(int *code)
{
    1d76:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d78:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d7c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d7e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d80:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d82:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <spawn>:
    register long a7 __asm__("a7") = n;
    1d8a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d8e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <mailread>:
    register long a7 __asm__("a7") = n;
    1d96:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1da2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <fstat>:
    register long a7 __asm__("a7") = n;
    1dae:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dba:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dbc:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dc0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc2:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dca:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dcc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dda:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <link>:

int link(char *old_path, char *new_path)
{
    1dea:	87aa                	mv	a5,a0
    1dec:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dee:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <unlink>:

int unlink(char *path)
{
    1e06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e08:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <uname>:
    register long a7 __asm__("a7") = n;
    1e1a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e1e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <brk>:
    register long a7 __asm__("a7") = n;
    1e26:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e32:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e38:	8082                	ret

0000000000001e3a <chdir>:
    register long a7 __asm__("a7") = n;
    1e3a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e46:	862e                	mv	a2,a1
    1e48:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e56:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <getdents>:
    register long a7 __asm__("a7") = n;
    1e60:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e64:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <pipe>:
    register long a7 __asm__("a7") = n;
    1e6c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <dup>:
    register long a7 __asm__("a7") = n;
    1e7a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <dup2>:
    register long a7 __asm__("a7") = n;
    1e84:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <mount>:
    register long a7 __asm__("a7") = n;
    1e90:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e94:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <umount>:
    register long a7 __asm__("a7") = n;
    1e9c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eaa:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eac:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eae:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb0:	8532                	mv	a0,a2
	mv a2, a4
    1eb2:	863a                	mv	a2,a4
	mv a3, a5
    1eb4:	86be                	mv	a3,a5
	mv a4, a6
    1eb6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb8:	0dc00893          	li	a7,220
	ecall
    1ebc:	00000073          	ecall

	beqz a0, 1f
    1ec0:	c111                	beqz	a0,1ec4 <__clone+0x1a>
	# Parent
	ret
    1ec2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec6:	6522                	ld	a0,8(sp)
	jalr a1
    1ec8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eca:	05d00893          	li	a7,93
	ecall
    1ece:	00000073          	ecall
