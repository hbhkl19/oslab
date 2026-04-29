
/home/hbh/oslab/oslab/user/build/riscv64/dup2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a871                	j	109e <__start_main>

0000000000001004 <test_dup2>:

/*
 * 测试通过时应输出：
 * "  from fd 100"
 */
void test_dup2(){
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2c>
void test_dup2(){
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2e6000ef          	jal	12f6 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f4c50513          	add	a0,a0,-180 # 1f60 <__func__.0>
    101c:	2da000ef          	jal	12f6 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	add	a0,a0,-304 # 1ef0 <__clone+0x44>
    1028:	2ce000ef          	jal	12f6 <puts>
	int fd = dup2(STDOUT, 100);
    102c:	06400593          	li	a1,100
    1030:	4505                	li	a0,1
    1032:	655000ef          	jal	1e86 <dup2>
	assert(fd != -1);
    1036:	57fd                	li	a5,-1
    1038:	04f50463          	beq	a0,a5,1080 <test_dup2+0x7c>
	const char *str = "  from fd 100\n";
	write(100, str, strlen(str));
    103c:	00001517          	auipc	a0,0x1
    1040:	ee450513          	add	a0,a0,-284 # 1f20 <__clone+0x74>
    1044:	02f000ef          	jal	1872 <strlen>
    1048:	862a                	mv	a2,a0
    104a:	00001597          	auipc	a1,0x1
    104e:	ed658593          	add	a1,a1,-298 # 1f20 <__clone+0x74>
    1052:	06400513          	li	a0,100
    1056:	3f9000ef          	jal	1c4e <write>
	TEST_END(__func__);
    105a:	00001517          	auipc	a0,0x1
    105e:	ed650513          	add	a0,a0,-298 # 1f30 <__clone+0x84>
    1062:	294000ef          	jal	12f6 <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	efa50513          	add	a0,a0,-262 # 1f60 <__func__.0>
    106e:	288000ef          	jal	12f6 <puts>
}
    1072:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	e7c50513          	add	a0,a0,-388 # 1ef0 <__clone+0x44>
}
    107c:	0141                	add	sp,sp,16
	TEST_END(__func__);
    107e:	aca5                	j	12f6 <puts>
	assert(fd != -1);
    1080:	00001517          	auipc	a0,0x1
    1084:	e8050513          	add	a0,a0,-384 # 1f00 <__clone+0x54>
    1088:	50a000ef          	jal	1592 <panic>
    108c:	bf45                	j	103c <test_dup2+0x38>

000000000000108e <main>:

int main(void) {
    108e:	1141                	add	sp,sp,-16
    1090:	e406                	sd	ra,8(sp)
	test_dup2();
    1092:	f73ff0ef          	jal	1004 <test_dup2>
	return 0;
}
    1096:	60a2                	ld	ra,8(sp)
    1098:	4501                	li	a0,0
    109a:	0141                	add	sp,sp,16
    109c:	8082                	ret

000000000000109e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10a0:	4108                	lw	a0,0(a0)
{
    10a2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10a4:	05a1                	add	a1,a1,8
{
    10a6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a8:	fe7ff0ef          	jal	108e <main>
    10ac:	3fd000ef          	jal	1ca8 <exit>
	return 0;
}
    10b0:	60a2                	ld	ra,8(sp)
    10b2:	4501                	li	a0,0
    10b4:	0141                	add	sp,sp,16
    10b6:	8082                	ret

00000000000010b8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b8:	7179                	add	sp,sp,-48
    10ba:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10bc:	12054863          	bltz	a0,11ec <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c0:	02b577bb          	remuw	a5,a0,a1
    10c4:	00001697          	auipc	a3,0x1
    10c8:	eac68693          	add	a3,a3,-340 # 1f70 <digits>
    buf[16] = 0;
    10cc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d0:	0005871b          	sext.w	a4,a1
    10d4:	1782                	sll	a5,a5,0x20
    10d6:	9381                	srl	a5,a5,0x20
    10d8:	97b6                	add	a5,a5,a3
    10da:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10de:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10e2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10e6:	1ab56663          	bltu	a0,a1,1292 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10ea:	02e8763b          	remuw	a2,a6,a4
    10ee:	1602                	sll	a2,a2,0x20
    10f0:	9201                	srl	a2,a2,0x20
    10f2:	9636                	add	a2,a2,a3
    10f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10fc:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1100:	12e86c63          	bltu	a6,a4,1238 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1104:	02e5f63b          	remuw	a2,a1,a4
    1108:	1602                	sll	a2,a2,0x20
    110a:	9201                	srl	a2,a2,0x20
    110c:	9636                	add	a2,a2,a3
    110e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1112:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1116:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    111a:	12e5e863          	bltu	a1,a4,124a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    111e:	02e8763b          	remuw	a2,a6,a4
    1122:	1602                	sll	a2,a2,0x20
    1124:	9201                	srl	a2,a2,0x20
    1126:	9636                	add	a2,a2,a3
    1128:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1130:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1134:	12e86463          	bltu	a6,a4,125c <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1138:	02e5f63b          	remuw	a2,a1,a4
    113c:	1602                	sll	a2,a2,0x20
    113e:	9201                	srl	a2,a2,0x20
    1140:	9636                	add	a2,a2,a3
    1142:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1146:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    114a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    114e:	12e5e063          	bltu	a1,a4,126e <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1152:	02e8763b          	remuw	a2,a6,a4
    1156:	1602                	sll	a2,a2,0x20
    1158:	9201                	srl	a2,a2,0x20
    115a:	9636                	add	a2,a2,a3
    115c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1160:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1164:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1168:	0ae86f63          	bltu	a6,a4,1226 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    116c:	02e5f63b          	remuw	a2,a1,a4
    1170:	1602                	sll	a2,a2,0x20
    1172:	9201                	srl	a2,a2,0x20
    1174:	9636                	add	a2,a2,a3
    1176:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1182:	0ee5ef63          	bltu	a1,a4,1280 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1186:	02e8763b          	remuw	a2,a6,a4
    118a:	1602                	sll	a2,a2,0x20
    118c:	9201                	srl	a2,a2,0x20
    118e:	9636                	add	a2,a2,a3
    1190:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1194:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1198:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    119c:	0ee86d63          	bltu	a6,a4,1296 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11a0:	02e5f63b          	remuw	a2,a1,a4
    11a4:	1602                	sll	a2,a2,0x20
    11a6:	9201                	srl	a2,a2,0x20
    11a8:	9636                	add	a2,a2,a3
    11aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ae:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11b2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11b6:	0ee5e963          	bltu	a1,a4,12a8 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11ba:	1782                	sll	a5,a5,0x20
    11bc:	9381                	srl	a5,a5,0x20
    11be:	96be                	add	a3,a3,a5
    11c0:	0006c783          	lbu	a5,0(a3)
    11c4:	4599                	li	a1,6
    11c6:	00f10723          	sb	a5,14(sp)

    if (sign)
    11ca:	00055763          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11ce:	02d00793          	li	a5,45
    11d2:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11d6:	4595                	li	a1,5
    write(f, s, l);
    11d8:	003c                	add	a5,sp,8
    11da:	4641                	li	a2,16
    11dc:	9e0d                	subw	a2,a2,a1
    11de:	4505                	li	a0,1
    11e0:	95be                	add	a1,a1,a5
    11e2:	26d000ef          	jal	1c4e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e6:	70a2                	ld	ra,40(sp)
    11e8:	6145                	add	sp,sp,48
    11ea:	8082                	ret
        x = -xx;
    11ec:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11f0:	02b677bb          	remuw	a5,a2,a1
    11f4:	00001697          	auipc	a3,0x1
    11f8:	d7c68693          	add	a3,a3,-644 # 1f70 <digits>
    buf[16] = 0;
    11fc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1200:	0005871b          	sext.w	a4,a1
    1204:	1782                	sll	a5,a5,0x20
    1206:	9381                	srl	a5,a5,0x20
    1208:	97b6                	add	a5,a5,a3
    120a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    120e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1212:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1216:	ecb67ae3          	bgeu	a2,a1,10ea <printint.constprop.0+0x32>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1222:	45b9                	li	a1,14
    1224:	bf55                	j	11d8 <printint.constprop.0+0x120>
    1226:	45a9                	li	a1,10
    if (sign)
    1228:	fa0558e3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1234:	45a5                	li	a1,9
    1236:	b74d                	j	11d8 <printint.constprop.0+0x120>
    1238:	45b9                	li	a1,14
    if (sign)
    123a:	f8055fe3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1246:	45b5                	li	a1,13
    1248:	bf41                	j	11d8 <printint.constprop.0+0x120>
    124a:	45b5                	li	a1,13
    if (sign)
    124c:	f80556e3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1258:	45b1                	li	a1,12
    125a:	bfbd                	j	11d8 <printint.constprop.0+0x120>
    125c:	45b1                	li	a1,12
    if (sign)
    125e:	f6055de3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    126a:	45ad                	li	a1,11
    126c:	b7b5                	j	11d8 <printint.constprop.0+0x120>
    126e:	45ad                	li	a1,11
    if (sign)
    1270:	f60554e3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    127c:	45a9                	li	a1,10
    127e:	bfa9                	j	11d8 <printint.constprop.0+0x120>
    1280:	45a5                	li	a1,9
    if (sign)
    1282:	f4055be3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    128e:	45a1                	li	a1,8
    1290:	b7a1                	j	11d8 <printint.constprop.0+0x120>
    i = 15;
    1292:	45bd                	li	a1,15
    1294:	b791                	j	11d8 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1296:	45a1                	li	a1,8
    if (sign)
    1298:	f40550e3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a4:	459d                	li	a1,7
    12a6:	bf0d                	j	11d8 <printint.constprop.0+0x120>
    12a8:	459d                	li	a1,7
    if (sign)
    12aa:	f20557e3          	bgez	a0,11d8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b6:	4599                	li	a1,6
    12b8:	b705                	j	11d8 <printint.constprop.0+0x120>

00000000000012ba <getchar>:
{
    12ba:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12bc:	00f10593          	add	a1,sp,15
    12c0:	4605                	li	a2,1
    12c2:	4501                	li	a0,0
{
    12c4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ca:	17b000ef          	jal	1c44 <read>
}
    12ce:	60e2                	ld	ra,24(sp)
    12d0:	00f14503          	lbu	a0,15(sp)
    12d4:	6105                	add	sp,sp,32
    12d6:	8082                	ret

00000000000012d8 <putchar>:
{
    12d8:	1101                	add	sp,sp,-32
    12da:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12dc:	00f10593          	add	a1,sp,15
    12e0:	4605                	li	a2,1
    12e2:	4505                	li	a0,1
{
    12e4:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ea:	165000ef          	jal	1c4e <write>
}
    12ee:	60e2                	ld	ra,24(sp)
    12f0:	2501                	sext.w	a0,a0
    12f2:	6105                	add	sp,sp,32
    12f4:	8082                	ret

00000000000012f6 <puts>:
{
    12f6:	1141                	add	sp,sp,-16
    12f8:	e406                	sd	ra,8(sp)
    12fa:	e022                	sd	s0,0(sp)
    12fc:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fe:	574000ef          	jal	1872 <strlen>
    1302:	862a                	mv	a2,a0
    1304:	85a2                	mv	a1,s0
    1306:	4505                	li	a0,1
    1308:	147000ef          	jal	1c4e <write>
}
    130c:	60a2                	ld	ra,8(sp)
    130e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1310:	957d                	sra	a0,a0,0x3f
    return r;
    1312:	2501                	sext.w	a0,a0
}
    1314:	0141                	add	sp,sp,16
    1316:	8082                	ret

0000000000001318 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1318:	7171                	add	sp,sp,-176
    131a:	f85a                	sd	s6,48(sp)
    131c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    131e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1320:	18bc                	add	a5,sp,120
{
    1322:	e8ca                	sd	s2,80(sp)
    1324:	e4ce                	sd	s3,72(sp)
    1326:	e0d2                	sd	s4,64(sp)
    1328:	fc56                	sd	s5,56(sp)
    132a:	f486                	sd	ra,104(sp)
    132c:	f0a2                	sd	s0,96(sp)
    132e:	eca6                	sd	s1,88(sp)
    1330:	fcae                	sd	a1,120(sp)
    1332:	e132                	sd	a2,128(sp)
    1334:	e536                	sd	a3,136(sp)
    1336:	e93a                	sd	a4,144(sp)
    1338:	f142                	sd	a6,160(sp)
    133a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    133c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    133e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1342:	07300a13          	li	s4,115
    1346:	07800a93          	li	s5,120
    buf[i++] = '0';
    134a:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134e:	00001997          	auipc	s3,0x1
    1352:	c2298993          	add	s3,s3,-990 # 1f70 <digits>
        if (!*s)
    1356:	00054783          	lbu	a5,0(a0)
    135a:	16078a63          	beqz	a5,14ce <printf+0x1b6>
    135e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1360:	19278d63          	beq	a5,s2,14fa <printf+0x1e2>
    1364:	00164783          	lbu	a5,1(a2)
    1368:	0605                	add	a2,a2,1
    136a:	fbfd                	bnez	a5,1360 <printf+0x48>
    136c:	84b2                	mv	s1,a2
        l = z - a;
    136e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1372:	85aa                	mv	a1,a0
    1374:	8622                	mv	a2,s0
    1376:	4505                	li	a0,1
    1378:	0d7000ef          	jal	1c4e <write>
        if (l)
    137c:	1a041463          	bnez	s0,1524 <printf+0x20c>
        if (s[1] == 0)
    1380:	0014c783          	lbu	a5,1(s1)
    1384:	14078563          	beqz	a5,14ce <printf+0x1b6>
        switch (s[1])
    1388:	1b478063          	beq	a5,s4,1528 <printf+0x210>
    138c:	14fa6b63          	bltu	s4,a5,14e2 <printf+0x1ca>
    1390:	06400713          	li	a4,100
    1394:	1ee78063          	beq	a5,a4,1574 <printf+0x25c>
    1398:	07000713          	li	a4,112
    139c:	1ae79963          	bne	a5,a4,154e <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13a0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13a6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a8:	631c                	ld	a5,0(a4)
    13aa:	0721                	add	a4,a4,8
    13ac:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ae:	00479293          	sll	t0,a5,0x4
    13b2:	00879f93          	sll	t6,a5,0x8
    13b6:	00c79f13          	sll	t5,a5,0xc
    13ba:	01079e93          	sll	t4,a5,0x10
    13be:	01479e13          	sll	t3,a5,0x14
    13c2:	01879313          	sll	t1,a5,0x18
    13c6:	01c79893          	sll	a7,a5,0x1c
    13ca:	02479813          	sll	a6,a5,0x24
    13ce:	02879513          	sll	a0,a5,0x28
    13d2:	02c79593          	sll	a1,a5,0x2c
    13d6:	03079693          	sll	a3,a5,0x30
    13da:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13de:	03c7d413          	srl	s0,a5,0x3c
    13e2:	01c7d39b          	srlw	t2,a5,0x1c
    13e6:	03c2d293          	srl	t0,t0,0x3c
    13ea:	03cfdf93          	srl	t6,t6,0x3c
    13ee:	03cf5f13          	srl	t5,t5,0x3c
    13f2:	03cede93          	srl	t4,t4,0x3c
    13f6:	03ce5e13          	srl	t3,t3,0x3c
    13fa:	03c35313          	srl	t1,t1,0x3c
    13fe:	03c8d893          	srl	a7,a7,0x3c
    1402:	03c85813          	srl	a6,a6,0x3c
    1406:	9171                	srl	a0,a0,0x3c
    1408:	91f1                	srl	a1,a1,0x3c
    140a:	92f1                	srl	a3,a3,0x3c
    140c:	9371                	srl	a4,a4,0x3c
    140e:	96ce                	add	a3,a3,s3
    1410:	974e                	add	a4,a4,s3
    1412:	944e                	add	s0,s0,s3
    1414:	92ce                	add	t0,t0,s3
    1416:	9fce                	add	t6,t6,s3
    1418:	9f4e                	add	t5,t5,s3
    141a:	9ece                	add	t4,t4,s3
    141c:	9e4e                	add	t3,t3,s3
    141e:	934e                	add	t1,t1,s3
    1420:	98ce                	add	a7,a7,s3
    1422:	93ce                	add	t2,t2,s3
    1424:	984e                	add	a6,a6,s3
    1426:	954e                	add	a0,a0,s3
    1428:	95ce                	add	a1,a1,s3
    142a:	0006c083          	lbu	ra,0(a3)
    142e:	0002c283          	lbu	t0,0(t0)
    1432:	00074683          	lbu	a3,0(a4)
    1436:	000fcf83          	lbu	t6,0(t6)
    143a:	000f4f03          	lbu	t5,0(t5)
    143e:	000ece83          	lbu	t4,0(t4)
    1442:	000e4e03          	lbu	t3,0(t3)
    1446:	00034303          	lbu	t1,0(t1)
    144a:	0008c883          	lbu	a7,0(a7)
    144e:	0003c383          	lbu	t2,0(t2)
    1452:	00084803          	lbu	a6,0(a6)
    1456:	00054503          	lbu	a0,0(a0)
    145a:	0005c583          	lbu	a1,0(a1)
    145e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1462:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1466:	9371                	srl	a4,a4,0x3c
    1468:	8bbd                	and	a5,a5,15
    146a:	974e                	add	a4,a4,s3
    146c:	97ce                	add	a5,a5,s3
    146e:	005105a3          	sb	t0,11(sp)
    1472:	01f10623          	sb	t6,12(sp)
    1476:	01e106a3          	sb	t5,13(sp)
    147a:	01d10723          	sb	t4,14(sp)
    147e:	01c107a3          	sb	t3,15(sp)
    1482:	00610823          	sb	t1,16(sp)
    1486:	011108a3          	sb	a7,17(sp)
    148a:	00710923          	sb	t2,18(sp)
    148e:	010109a3          	sb	a6,19(sp)
    1492:	00a10a23          	sb	a0,20(sp)
    1496:	00b10aa3          	sb	a1,21(sp)
    149a:	00110b23          	sb	ra,22(sp)
    149e:	00d10ba3          	sb	a3,23(sp)
    14a2:	00810523          	sb	s0,10(sp)
    14a6:	00074703          	lbu	a4,0(a4)
    14aa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ae:	002c                	add	a1,sp,8
    14b0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b2:	00e10c23          	sb	a4,24(sp)
    14b6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ba:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14be:	790000ef          	jal	1c4e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c2:	00248513          	add	a0,s1,2
        if (!*s)
    14c6:	00054783          	lbu	a5,0(a0)
    14ca:	e8079ae3          	bnez	a5,135e <printf+0x46>
    }
    va_end(ap);
}
    14ce:	70a6                	ld	ra,104(sp)
    14d0:	7406                	ld	s0,96(sp)
    14d2:	64e6                	ld	s1,88(sp)
    14d4:	6946                	ld	s2,80(sp)
    14d6:	69a6                	ld	s3,72(sp)
    14d8:	6a06                	ld	s4,64(sp)
    14da:	7ae2                	ld	s5,56(sp)
    14dc:	7b42                	ld	s6,48(sp)
    14de:	614d                	add	sp,sp,176
    14e0:	8082                	ret
        switch (s[1])
    14e2:	07579663          	bne	a5,s5,154e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14e6:	6782                	ld	a5,0(sp)
    14e8:	45c1                	li	a1,16
    14ea:	4388                	lw	a0,0(a5)
    14ec:	07a1                	add	a5,a5,8
    14ee:	e03e                	sd	a5,0(sp)
    14f0:	bc9ff0ef          	jal	10b8 <printint.constprop.0>
        s += 2;
    14f4:	00248513          	add	a0,s1,2
    14f8:	b7f9                	j	14c6 <printf+0x1ae>
    14fa:	84b2                	mv	s1,a2
    14fc:	a039                	j	150a <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14fe:	0024c783          	lbu	a5,2(s1)
    1502:	0605                	add	a2,a2,1
    1504:	0489                	add	s1,s1,2
    1506:	e72794e3          	bne	a5,s2,136e <printf+0x56>
    150a:	0014c783          	lbu	a5,1(s1)
    150e:	ff2788e3          	beq	a5,s2,14fe <printf+0x1e6>
        l = z - a;
    1512:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1516:	85aa                	mv	a1,a0
    1518:	8622                	mv	a2,s0
    151a:	4505                	li	a0,1
    151c:	732000ef          	jal	1c4e <write>
        if (l)
    1520:	e60400e3          	beqz	s0,1380 <printf+0x68>
    1524:	8526                	mv	a0,s1
    1526:	bd05                	j	1356 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1528:	6782                	ld	a5,0(sp)
    152a:	6380                	ld	s0,0(a5)
    152c:	07a1                	add	a5,a5,8
    152e:	e03e                	sd	a5,0(sp)
    1530:	cc21                	beqz	s0,1588 <printf+0x270>
            l = strnlen(a, 200);
    1532:	0c800593          	li	a1,200
    1536:	8522                	mv	a0,s0
    1538:	424000ef          	jal	195c <strnlen>
    write(f, s, l);
    153c:	0005061b          	sext.w	a2,a0
    1540:	85a2                	mv	a1,s0
    1542:	4505                	li	a0,1
    1544:	70a000ef          	jal	1c4e <write>
        s += 2;
    1548:	00248513          	add	a0,s1,2
    154c:	bfad                	j	14c6 <printf+0x1ae>
    return write(stdout, &byte, 1);
    154e:	4605                	li	a2,1
    1550:	002c                	add	a1,sp,8
    1552:	4505                	li	a0,1
    char byte = c;
    1554:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1558:	6f6000ef          	jal	1c4e <write>
    char byte = c;
    155c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1560:	4605                	li	a2,1
    1562:	002c                	add	a1,sp,8
    1564:	4505                	li	a0,1
    char byte = c;
    1566:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    156a:	6e4000ef          	jal	1c4e <write>
        s += 2;
    156e:	00248513          	add	a0,s1,2
    1572:	bf91                	j	14c6 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1574:	6782                	ld	a5,0(sp)
    1576:	45a9                	li	a1,10
    1578:	4388                	lw	a0,0(a5)
    157a:	07a1                	add	a5,a5,8
    157c:	e03e                	sd	a5,0(sp)
    157e:	b3bff0ef          	jal	10b8 <printint.constprop.0>
        s += 2;
    1582:	00248513          	add	a0,s1,2
    1586:	b781                	j	14c6 <printf+0x1ae>
                a = "(null)";
    1588:	00001417          	auipc	s0,0x1
    158c:	9b840413          	add	s0,s0,-1608 # 1f40 <__clone+0x94>
    1590:	b74d                	j	1532 <printf+0x21a>

0000000000001592 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1592:	1141                	add	sp,sp,-16
    1594:	e406                	sd	ra,8(sp)
    puts(m);
    1596:	d61ff0ef          	jal	12f6 <puts>
    exit(-100);
}
    159a:	60a2                	ld	ra,8(sp)
    exit(-100);
    159c:	f9c00513          	li	a0,-100
}
    15a0:	0141                	add	sp,sp,16
    exit(-100);
    15a2:	a719                	j	1ca8 <exit>

00000000000015a4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000793          	li	a5,32
    15a8:	00f50663          	beq	a0,a5,15b4 <isspace+0x10>
    15ac:	355d                	addw	a0,a0,-9
    15ae:	00553513          	sltiu	a0,a0,5
    15b2:	8082                	ret
    15b4:	4505                	li	a0,1
}
    15b6:	8082                	ret

00000000000015b8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b8:	fd05051b          	addw	a0,a0,-48
}
    15bc:	00a53513          	sltiu	a0,a0,10
    15c0:	8082                	ret

00000000000015c2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000693          	li	a3,32
    15c6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c8:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	ff77871b          	addw	a4,a5,-9
    15d0:	04d78c63          	beq	a5,a3,1628 <atoi+0x66>
    15d4:	0007861b          	sext.w	a2,a5
    15d8:	04e5f863          	bgeu	a1,a4,1628 <atoi+0x66>
        s++;
    switch (*s)
    15dc:	02b00713          	li	a4,43
    15e0:	04e78963          	beq	a5,a4,1632 <atoi+0x70>
    15e4:	02d00713          	li	a4,45
    15e8:	06e78263          	beq	a5,a4,164c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ec:	fd06069b          	addw	a3,a2,-48
    15f0:	47a5                	li	a5,9
    15f2:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15f4:	4301                	li	t1,0
    while (isdigit(*s))
    15f6:	04d7e963          	bltu	a5,a3,1648 <atoi+0x86>
    int n = 0, neg = 0;
    15fa:	4501                	li	a0,0
    while (isdigit(*s))
    15fc:	48a5                	li	a7,9
    15fe:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1602:	0025179b          	sllw	a5,a0,0x2
    1606:	9fa9                	addw	a5,a5,a0
    1608:	fd06059b          	addw	a1,a2,-48
    160c:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1610:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1614:	0705                	add	a4,a4,1
    1616:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    161a:	0006861b          	sext.w	a2,a3
    161e:	ff08f0e3          	bgeu	a7,a6,15fe <atoi+0x3c>
    return neg ? n : -n;
    1622:	00030563          	beqz	t1,162c <atoi+0x6a>
}
    1626:	8082                	ret
        s++;
    1628:	0505                	add	a0,a0,1
    162a:	bf79                	j	15c8 <atoi+0x6>
    return neg ? n : -n;
    162c:	40f5853b          	subw	a0,a1,a5
    1630:	8082                	ret
    while (isdigit(*s))
    1632:	00154603          	lbu	a2,1(a0)
    1636:	47a5                	li	a5,9
        s++;
    1638:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    163c:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1640:	4301                	li	t1,0
    while (isdigit(*s))
    1642:	2601                	sext.w	a2,a2
    1644:	fad7fbe3          	bgeu	a5,a3,15fa <atoi+0x38>
    1648:	4501                	li	a0,0
}
    164a:	8082                	ret
    while (isdigit(*s))
    164c:	00154603          	lbu	a2,1(a0)
    1650:	47a5                	li	a5,9
        s++;
    1652:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1656:	fd06069b          	addw	a3,a2,-48
    165a:	2601                	sext.w	a2,a2
    165c:	fed7e6e3          	bltu	a5,a3,1648 <atoi+0x86>
        neg = 1;
    1660:	4305                	li	t1,1
    1662:	bf61                	j	15fa <atoi+0x38>

0000000000001664 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1664:	18060163          	beqz	a2,17e6 <memset+0x182>
    1668:	40a006b3          	neg	a3,a0
    166c:	0076f793          	and	a5,a3,7
    1670:	00778813          	add	a6,a5,7
    1674:	48ad                	li	a7,11
    1676:	0ff5f713          	zext.b	a4,a1
    167a:	fff60593          	add	a1,a2,-1
    167e:	17186563          	bltu	a6,a7,17e8 <memset+0x184>
    1682:	1705ed63          	bltu	a1,a6,17fc <memset+0x198>
    1686:	16078363          	beqz	a5,17ec <memset+0x188>
    168a:	00e50023          	sb	a4,0(a0)
    168e:	0066f593          	and	a1,a3,6
    1692:	16058063          	beqz	a1,17f2 <memset+0x18e>
    1696:	00e500a3          	sb	a4,1(a0)
    169a:	4589                	li	a1,2
    169c:	16f5f363          	bgeu	a1,a5,1802 <memset+0x19e>
    16a0:	00e50123          	sb	a4,2(a0)
    16a4:	8a91                	and	a3,a3,4
    16a6:	00350593          	add	a1,a0,3
    16aa:	4e0d                	li	t3,3
    16ac:	ce9d                	beqz	a3,16ea <memset+0x86>
    16ae:	00e501a3          	sb	a4,3(a0)
    16b2:	4691                	li	a3,4
    16b4:	00450593          	add	a1,a0,4
    16b8:	4e11                	li	t3,4
    16ba:	02f6f863          	bgeu	a3,a5,16ea <memset+0x86>
    16be:	00e50223          	sb	a4,4(a0)
    16c2:	4695                	li	a3,5
    16c4:	00550593          	add	a1,a0,5
    16c8:	4e15                	li	t3,5
    16ca:	02d78063          	beq	a5,a3,16ea <memset+0x86>
    16ce:	fff50693          	add	a3,a0,-1
    16d2:	00e502a3          	sb	a4,5(a0)
    16d6:	8a9d                	and	a3,a3,7
    16d8:	00650593          	add	a1,a0,6
    16dc:	4e19                	li	t3,6
    16de:	e691                	bnez	a3,16ea <memset+0x86>
    16e0:	00750593          	add	a1,a0,7
    16e4:	00e50323          	sb	a4,6(a0)
    16e8:	4e1d                	li	t3,7
    16ea:	00871693          	sll	a3,a4,0x8
    16ee:	01071813          	sll	a6,a4,0x10
    16f2:	8ed9                	or	a3,a3,a4
    16f4:	01871893          	sll	a7,a4,0x18
    16f8:	0106e6b3          	or	a3,a3,a6
    16fc:	0116e6b3          	or	a3,a3,a7
    1700:	02071813          	sll	a6,a4,0x20
    1704:	02871313          	sll	t1,a4,0x28
    1708:	0106e6b3          	or	a3,a3,a6
    170c:	40f608b3          	sub	a7,a2,a5
    1710:	03071813          	sll	a6,a4,0x30
    1714:	0066e6b3          	or	a3,a3,t1
    1718:	0106e6b3          	or	a3,a3,a6
    171c:	03871313          	sll	t1,a4,0x38
    1720:	97aa                	add	a5,a5,a0
    1722:	ff88f813          	and	a6,a7,-8
    1726:	0066e6b3          	or	a3,a3,t1
    172a:	983e                	add	a6,a6,a5
    172c:	e394                	sd	a3,0(a5)
    172e:	07a1                	add	a5,a5,8
    1730:	ff079ee3          	bne	a5,a6,172c <memset+0xc8>
    1734:	ff88f793          	and	a5,a7,-8
    1738:	0078f893          	and	a7,a7,7
    173c:	00f586b3          	add	a3,a1,a5
    1740:	01c787bb          	addw	a5,a5,t3
    1744:	0a088b63          	beqz	a7,17fa <memset+0x196>
    1748:	00e68023          	sb	a4,0(a3)
    174c:	0017859b          	addw	a1,a5,1
    1750:	08c5fb63          	bgeu	a1,a2,17e6 <memset+0x182>
    1754:	00e680a3          	sb	a4,1(a3)
    1758:	0027859b          	addw	a1,a5,2
    175c:	08c5f563          	bgeu	a1,a2,17e6 <memset+0x182>
    1760:	00e68123          	sb	a4,2(a3)
    1764:	0037859b          	addw	a1,a5,3
    1768:	06c5ff63          	bgeu	a1,a2,17e6 <memset+0x182>
    176c:	00e681a3          	sb	a4,3(a3)
    1770:	0047859b          	addw	a1,a5,4
    1774:	06c5f963          	bgeu	a1,a2,17e6 <memset+0x182>
    1778:	00e68223          	sb	a4,4(a3)
    177c:	0057859b          	addw	a1,a5,5
    1780:	06c5f363          	bgeu	a1,a2,17e6 <memset+0x182>
    1784:	00e682a3          	sb	a4,5(a3)
    1788:	0067859b          	addw	a1,a5,6
    178c:	04c5fd63          	bgeu	a1,a2,17e6 <memset+0x182>
    1790:	00e68323          	sb	a4,6(a3)
    1794:	0077859b          	addw	a1,a5,7
    1798:	04c5f763          	bgeu	a1,a2,17e6 <memset+0x182>
    179c:	00e683a3          	sb	a4,7(a3)
    17a0:	0087859b          	addw	a1,a5,8
    17a4:	04c5f163          	bgeu	a1,a2,17e6 <memset+0x182>
    17a8:	00e68423          	sb	a4,8(a3)
    17ac:	0097859b          	addw	a1,a5,9
    17b0:	02c5fb63          	bgeu	a1,a2,17e6 <memset+0x182>
    17b4:	00e684a3          	sb	a4,9(a3)
    17b8:	00a7859b          	addw	a1,a5,10
    17bc:	02c5f563          	bgeu	a1,a2,17e6 <memset+0x182>
    17c0:	00e68523          	sb	a4,10(a3)
    17c4:	00b7859b          	addw	a1,a5,11
    17c8:	00c5ff63          	bgeu	a1,a2,17e6 <memset+0x182>
    17cc:	00e685a3          	sb	a4,11(a3)
    17d0:	00c7859b          	addw	a1,a5,12
    17d4:	00c5f963          	bgeu	a1,a2,17e6 <memset+0x182>
    17d8:	00e68623          	sb	a4,12(a3)
    17dc:	27b5                	addw	a5,a5,13
    17de:	00c7f463          	bgeu	a5,a2,17e6 <memset+0x182>
    17e2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17e6:	8082                	ret
    17e8:	482d                	li	a6,11
    17ea:	bd61                	j	1682 <memset+0x1e>
    char *p = dest;
    17ec:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ee:	4e01                	li	t3,0
    17f0:	bded                	j	16ea <memset+0x86>
    17f2:	00150593          	add	a1,a0,1
    17f6:	4e05                	li	t3,1
    17f8:	bdcd                	j	16ea <memset+0x86>
    17fa:	8082                	ret
    char *p = dest;
    17fc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fe:	4781                	li	a5,0
    1800:	b7a1                	j	1748 <memset+0xe4>
    1802:	00250593          	add	a1,a0,2
    1806:	4e09                	li	t3,2
    1808:	b5cd                	j	16ea <memset+0x86>

000000000000180a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    180a:	00054783          	lbu	a5,0(a0)
    180e:	0005c703          	lbu	a4,0(a1)
    1812:	00e79863          	bne	a5,a4,1822 <strcmp+0x18>
    1816:	0505                	add	a0,a0,1
    1818:	0585                	add	a1,a1,1
    181a:	fbe5                	bnez	a5,180a <strcmp>
    181c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    181e:	9d19                	subw	a0,a0,a4
    1820:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1822:	0007851b          	sext.w	a0,a5
    1826:	bfe5                	j	181e <strcmp+0x14>

0000000000001828 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1828:	ca15                	beqz	a2,185c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    182e:	167d                	add	a2,a2,-1
    1830:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1834:	eb99                	bnez	a5,184a <strncmp+0x22>
    1836:	a815                	j	186a <strncmp+0x42>
    1838:	00a68e63          	beq	a3,a0,1854 <strncmp+0x2c>
    183c:	0505                	add	a0,a0,1
    183e:	00f71b63          	bne	a4,a5,1854 <strncmp+0x2c>
    1842:	00054783          	lbu	a5,0(a0)
    1846:	cf89                	beqz	a5,1860 <strncmp+0x38>
    1848:	85b2                	mv	a1,a2
    184a:	0005c703          	lbu	a4,0(a1)
    184e:	00158613          	add	a2,a1,1
    1852:	f37d                	bnez	a4,1838 <strncmp+0x10>
        ;
    return *l - *r;
    1854:	0007851b          	sext.w	a0,a5
    1858:	9d19                	subw	a0,a0,a4
    185a:	8082                	ret
        return 0;
    185c:	4501                	li	a0,0
}
    185e:	8082                	ret
    return *l - *r;
    1860:	0015c703          	lbu	a4,1(a1)
    1864:	4501                	li	a0,0
    1866:	9d19                	subw	a0,a0,a4
    1868:	8082                	ret
    186a:	0005c703          	lbu	a4,0(a1)
    186e:	4501                	li	a0,0
    1870:	b7e5                	j	1858 <strncmp+0x30>

0000000000001872 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1872:	00757793          	and	a5,a0,7
    1876:	cf89                	beqz	a5,1890 <strlen+0x1e>
    1878:	87aa                	mv	a5,a0
    187a:	a029                	j	1884 <strlen+0x12>
    187c:	0785                	add	a5,a5,1
    187e:	0077f713          	and	a4,a5,7
    1882:	cb01                	beqz	a4,1892 <strlen+0x20>
        if (!*s)
    1884:	0007c703          	lbu	a4,0(a5)
    1888:	fb75                	bnez	a4,187c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    188a:	40a78533          	sub	a0,a5,a0
}
    188e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1890:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1892:	6394                	ld	a3,0(a5)
    1894:	00000597          	auipc	a1,0x0
    1898:	6b45b583          	ld	a1,1716(a1) # 1f48 <__clone+0x9c>
    189c:	00000617          	auipc	a2,0x0
    18a0:	6b463603          	ld	a2,1716(a2) # 1f50 <__clone+0xa4>
    18a4:	a019                	j	18aa <strlen+0x38>
    18a6:	6794                	ld	a3,8(a5)
    18a8:	07a1                	add	a5,a5,8
    18aa:	00b68733          	add	a4,a3,a1
    18ae:	fff6c693          	not	a3,a3
    18b2:	8f75                	and	a4,a4,a3
    18b4:	8f71                	and	a4,a4,a2
    18b6:	db65                	beqz	a4,18a6 <strlen+0x34>
    for (; *s; s++)
    18b8:	0007c703          	lbu	a4,0(a5)
    18bc:	d779                	beqz	a4,188a <strlen+0x18>
    18be:	0017c703          	lbu	a4,1(a5)
    18c2:	0785                	add	a5,a5,1
    18c4:	d379                	beqz	a4,188a <strlen+0x18>
    18c6:	0017c703          	lbu	a4,1(a5)
    18ca:	0785                	add	a5,a5,1
    18cc:	fb6d                	bnez	a4,18be <strlen+0x4c>
    18ce:	bf75                	j	188a <strlen+0x18>

00000000000018d0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d0:	00757713          	and	a4,a0,7
{
    18d4:	87aa                	mv	a5,a0
    18d6:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18da:	cb19                	beqz	a4,18f0 <memchr+0x20>
    18dc:	ce25                	beqz	a2,1954 <memchr+0x84>
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	00b70763          	beq	a4,a1,18f0 <memchr+0x20>
    18e6:	0785                	add	a5,a5,1
    18e8:	0077f713          	and	a4,a5,7
    18ec:	167d                	add	a2,a2,-1
    18ee:	f77d                	bnez	a4,18dc <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f0:	4501                	li	a0,0
    if (n && *s != c)
    18f2:	c235                	beqz	a2,1956 <memchr+0x86>
    18f4:	0007c703          	lbu	a4,0(a5)
    18f8:	06b70063          	beq	a4,a1,1958 <memchr+0x88>
        size_t k = ONES * c;
    18fc:	00000517          	auipc	a0,0x0
    1900:	65c53503          	ld	a0,1628(a0) # 1f58 <__clone+0xac>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1904:	471d                	li	a4,7
        size_t k = ONES * c;
    1906:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190a:	04c77763          	bgeu	a4,a2,1958 <memchr+0x88>
    190e:	00000897          	auipc	a7,0x0
    1912:	63a8b883          	ld	a7,1594(a7) # 1f48 <__clone+0x9c>
    1916:	00000817          	auipc	a6,0x0
    191a:	63a83803          	ld	a6,1594(a6) # 1f50 <__clone+0xa4>
    191e:	431d                	li	t1,7
    1920:	a029                	j	192a <memchr+0x5a>
    1922:	1661                	add	a2,a2,-8
    1924:	07a1                	add	a5,a5,8
    1926:	00c37c63          	bgeu	t1,a2,193e <memchr+0x6e>
    192a:	6398                	ld	a4,0(a5)
    192c:	8f29                	xor	a4,a4,a0
    192e:	011706b3          	add	a3,a4,a7
    1932:	fff74713          	not	a4,a4
    1936:	8f75                	and	a4,a4,a3
    1938:	01077733          	and	a4,a4,a6
    193c:	d37d                	beqz	a4,1922 <memchr+0x52>
    193e:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1940:	e601                	bnez	a2,1948 <memchr+0x78>
    1942:	a809                	j	1954 <memchr+0x84>
    1944:	0505                	add	a0,a0,1
    1946:	c619                	beqz	a2,1954 <memchr+0x84>
    1948:	00054783          	lbu	a5,0(a0)
    194c:	167d                	add	a2,a2,-1
    194e:	feb79be3          	bne	a5,a1,1944 <memchr+0x74>
    1952:	8082                	ret
    return n ? (void *)s : 0;
    1954:	4501                	li	a0,0
}
    1956:	8082                	ret
    if (n && *s != c)
    1958:	853e                	mv	a0,a5
    195a:	b7fd                	j	1948 <memchr+0x78>

000000000000195c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    195c:	1101                	add	sp,sp,-32
    195e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1960:	862e                	mv	a2,a1
{
    1962:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1964:	4581                	li	a1,0
{
    1966:	e426                	sd	s1,8(sp)
    1968:	ec06                	sd	ra,24(sp)
    196a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    196c:	f65ff0ef          	jal	18d0 <memchr>
    return p ? p - s : n;
    1970:	c519                	beqz	a0,197e <strnlen+0x22>
}
    1972:	60e2                	ld	ra,24(sp)
    1974:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1976:	8d05                	sub	a0,a0,s1
}
    1978:	64a2                	ld	s1,8(sp)
    197a:	6105                	add	sp,sp,32
    197c:	8082                	ret
    197e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1980:	8522                	mv	a0,s0
}
    1982:	6442                	ld	s0,16(sp)
    1984:	64a2                	ld	s1,8(sp)
    1986:	6105                	add	sp,sp,32
    1988:	8082                	ret

000000000000198a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    198a:	00a5c7b3          	xor	a5,a1,a0
    198e:	8b9d                	and	a5,a5,7
    1990:	eb95                	bnez	a5,19c4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1992:	0075f793          	and	a5,a1,7
    1996:	e7b1                	bnez	a5,19e2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1998:	6198                	ld	a4,0(a1)
    199a:	00000617          	auipc	a2,0x0
    199e:	5ae63603          	ld	a2,1454(a2) # 1f48 <__clone+0x9c>
    19a2:	00000817          	auipc	a6,0x0
    19a6:	5ae83803          	ld	a6,1454(a6) # 1f50 <__clone+0xa4>
    19aa:	a029                	j	19b4 <strcpy+0x2a>
    19ac:	05a1                	add	a1,a1,8
    19ae:	e118                	sd	a4,0(a0)
    19b0:	6198                	ld	a4,0(a1)
    19b2:	0521                	add	a0,a0,8
    19b4:	00c707b3          	add	a5,a4,a2
    19b8:	fff74693          	not	a3,a4
    19bc:	8ff5                	and	a5,a5,a3
    19be:	0107f7b3          	and	a5,a5,a6
    19c2:	d7ed                	beqz	a5,19ac <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c4:	0005c783          	lbu	a5,0(a1)
    19c8:	00f50023          	sb	a5,0(a0)
    19cc:	c785                	beqz	a5,19f4 <strcpy+0x6a>
    19ce:	0015c783          	lbu	a5,1(a1)
    19d2:	0505                	add	a0,a0,1
    19d4:	0585                	add	a1,a1,1
    19d6:	00f50023          	sb	a5,0(a0)
    19da:	fbf5                	bnez	a5,19ce <strcpy+0x44>
        ;
    return d;
}
    19dc:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19de:	0505                	add	a0,a0,1
    19e0:	df45                	beqz	a4,1998 <strcpy+0xe>
            if (!(*d = *s))
    19e2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19e6:	0585                	add	a1,a1,1
    19e8:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19ec:	00f50023          	sb	a5,0(a0)
    19f0:	f7fd                	bnez	a5,19de <strcpy+0x54>
}
    19f2:	8082                	ret
    19f4:	8082                	ret

00000000000019f6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19f6:	00a5c7b3          	xor	a5,a1,a0
    19fa:	8b9d                	and	a5,a5,7
    19fc:	e3b5                	bnez	a5,1a60 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19fe:	0075f793          	and	a5,a1,7
    1a02:	cf99                	beqz	a5,1a20 <strncpy+0x2a>
    1a04:	ea09                	bnez	a2,1a16 <strncpy+0x20>
    1a06:	a421                	j	1c0e <strncpy+0x218>
    1a08:	0585                	add	a1,a1,1
    1a0a:	0075f793          	and	a5,a1,7
    1a0e:	167d                	add	a2,a2,-1
    1a10:	0505                	add	a0,a0,1
    1a12:	c799                	beqz	a5,1a20 <strncpy+0x2a>
    1a14:	c225                	beqz	a2,1a74 <strncpy+0x7e>
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	f7ed                	bnez	a5,1a08 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a20:	ca31                	beqz	a2,1a74 <strncpy+0x7e>
    1a22:	0005c783          	lbu	a5,0(a1)
    1a26:	cba1                	beqz	a5,1a76 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a28:	479d                	li	a5,7
    1a2a:	02c7fc63          	bgeu	a5,a2,1a62 <strncpy+0x6c>
    1a2e:	00000897          	auipc	a7,0x0
    1a32:	51a8b883          	ld	a7,1306(a7) # 1f48 <__clone+0x9c>
    1a36:	00000817          	auipc	a6,0x0
    1a3a:	51a83803          	ld	a6,1306(a6) # 1f50 <__clone+0xa4>
    1a3e:	431d                	li	t1,7
    1a40:	a039                	j	1a4e <strncpy+0x58>
            *wd = *ws;
    1a42:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a44:	1661                	add	a2,a2,-8
    1a46:	05a1                	add	a1,a1,8
    1a48:	0521                	add	a0,a0,8
    1a4a:	00c37b63          	bgeu	t1,a2,1a60 <strncpy+0x6a>
    1a4e:	6198                	ld	a4,0(a1)
    1a50:	011707b3          	add	a5,a4,a7
    1a54:	fff74693          	not	a3,a4
    1a58:	8ff5                	and	a5,a5,a3
    1a5a:	0107f7b3          	and	a5,a5,a6
    1a5e:	d3f5                	beqz	a5,1a42 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a60:	ca11                	beqz	a2,1a74 <strncpy+0x7e>
    1a62:	0005c783          	lbu	a5,0(a1)
    1a66:	0585                	add	a1,a1,1
    1a68:	00f50023          	sb	a5,0(a0)
    1a6c:	c789                	beqz	a5,1a76 <strncpy+0x80>
    1a6e:	167d                	add	a2,a2,-1
    1a70:	0505                	add	a0,a0,1
    1a72:	fa65                	bnez	a2,1a62 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a74:	8082                	ret
    1a76:	4805                	li	a6,1
    1a78:	14061b63          	bnez	a2,1bce <strncpy+0x1d8>
    1a7c:	40a00733          	neg	a4,a0
    1a80:	00777793          	and	a5,a4,7
    1a84:	4581                	li	a1,0
    1a86:	12061c63          	bnez	a2,1bbe <strncpy+0x1c8>
    1a8a:	00778693          	add	a3,a5,7
    1a8e:	48ad                	li	a7,11
    1a90:	1316e563          	bltu	a3,a7,1bba <strncpy+0x1c4>
    1a94:	16d5e263          	bltu	a1,a3,1bf8 <strncpy+0x202>
    1a98:	14078c63          	beqz	a5,1bf0 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a9c:	00050023          	sb	zero,0(a0)
    1aa0:	00677693          	and	a3,a4,6
    1aa4:	14068263          	beqz	a3,1be8 <strncpy+0x1f2>
    1aa8:	000500a3          	sb	zero,1(a0)
    1aac:	4689                	li	a3,2
    1aae:	14f6f863          	bgeu	a3,a5,1bfe <strncpy+0x208>
    1ab2:	00050123          	sb	zero,2(a0)
    1ab6:	8b11                	and	a4,a4,4
    1ab8:	12070463          	beqz	a4,1be0 <strncpy+0x1ea>
    1abc:	000501a3          	sb	zero,3(a0)
    1ac0:	4711                	li	a4,4
    1ac2:	00450693          	add	a3,a0,4
    1ac6:	02f77563          	bgeu	a4,a5,1af0 <strncpy+0xfa>
    1aca:	00050223          	sb	zero,4(a0)
    1ace:	4715                	li	a4,5
    1ad0:	00550693          	add	a3,a0,5
    1ad4:	00e78e63          	beq	a5,a4,1af0 <strncpy+0xfa>
    1ad8:	fff50713          	add	a4,a0,-1
    1adc:	000502a3          	sb	zero,5(a0)
    1ae0:	8b1d                	and	a4,a4,7
    1ae2:	12071263          	bnez	a4,1c06 <strncpy+0x210>
    1ae6:	00750693          	add	a3,a0,7
    1aea:	00050323          	sb	zero,6(a0)
    1aee:	471d                	li	a4,7
    1af0:	40f80833          	sub	a6,a6,a5
    1af4:	ff887593          	and	a1,a6,-8
    1af8:	97aa                	add	a5,a5,a0
    1afa:	95be                	add	a1,a1,a5
    1afc:	0007b023          	sd	zero,0(a5)
    1b00:	07a1                	add	a5,a5,8
    1b02:	feb79de3          	bne	a5,a1,1afc <strncpy+0x106>
    1b06:	ff887593          	and	a1,a6,-8
    1b0a:	00787813          	and	a6,a6,7
    1b0e:	00e587bb          	addw	a5,a1,a4
    1b12:	00b68733          	add	a4,a3,a1
    1b16:	0e080063          	beqz	a6,1bf6 <strncpy+0x200>
    1b1a:	00070023          	sb	zero,0(a4)
    1b1e:	0017869b          	addw	a3,a5,1
    1b22:	f4c6f9e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b26:	000700a3          	sb	zero,1(a4)
    1b2a:	0027869b          	addw	a3,a5,2
    1b2e:	f4c6f3e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b32:	00070123          	sb	zero,2(a4)
    1b36:	0037869b          	addw	a3,a5,3
    1b3a:	f2c6fde3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b3e:	000701a3          	sb	zero,3(a4)
    1b42:	0047869b          	addw	a3,a5,4
    1b46:	f2c6f7e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b4a:	00070223          	sb	zero,4(a4)
    1b4e:	0057869b          	addw	a3,a5,5
    1b52:	f2c6f1e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b56:	000702a3          	sb	zero,5(a4)
    1b5a:	0067869b          	addw	a3,a5,6
    1b5e:	f0c6fbe3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b62:	00070323          	sb	zero,6(a4)
    1b66:	0077869b          	addw	a3,a5,7
    1b6a:	f0c6f5e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b6e:	000703a3          	sb	zero,7(a4)
    1b72:	0087869b          	addw	a3,a5,8
    1b76:	eec6ffe3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b7a:	00070423          	sb	zero,8(a4)
    1b7e:	0097869b          	addw	a3,a5,9
    1b82:	eec6f9e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b86:	000704a3          	sb	zero,9(a4)
    1b8a:	00a7869b          	addw	a3,a5,10
    1b8e:	eec6f3e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b92:	00070523          	sb	zero,10(a4)
    1b96:	00b7869b          	addw	a3,a5,11
    1b9a:	ecc6fde3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1b9e:	000705a3          	sb	zero,11(a4)
    1ba2:	00c7869b          	addw	a3,a5,12
    1ba6:	ecc6f7e3          	bgeu	a3,a2,1a74 <strncpy+0x7e>
    1baa:	00070623          	sb	zero,12(a4)
    1bae:	27b5                	addw	a5,a5,13
    1bb0:	ecc7f2e3          	bgeu	a5,a2,1a74 <strncpy+0x7e>
    1bb4:	000706a3          	sb	zero,13(a4)
}
    1bb8:	8082                	ret
    1bba:	46ad                	li	a3,11
    1bbc:	bde1                	j	1a94 <strncpy+0x9e>
    1bbe:	00778693          	add	a3,a5,7
    1bc2:	48ad                	li	a7,11
    1bc4:	fff60593          	add	a1,a2,-1
    1bc8:	ed16f6e3          	bgeu	a3,a7,1a94 <strncpy+0x9e>
    1bcc:	b7fd                	j	1bba <strncpy+0x1c4>
    1bce:	40a00733          	neg	a4,a0
    1bd2:	8832                	mv	a6,a2
    1bd4:	00777793          	and	a5,a4,7
    1bd8:	4581                	li	a1,0
    1bda:	ea0608e3          	beqz	a2,1a8a <strncpy+0x94>
    1bde:	b7c5                	j	1bbe <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	00350693          	add	a3,a0,3
    1be4:	470d                	li	a4,3
    1be6:	b729                	j	1af0 <strncpy+0xfa>
    1be8:	00150693          	add	a3,a0,1
    1bec:	4705                	li	a4,1
    1bee:	b709                	j	1af0 <strncpy+0xfa>
tail:
    1bf0:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf2:	4701                	li	a4,0
    1bf4:	bdf5                	j	1af0 <strncpy+0xfa>
    1bf6:	8082                	ret
tail:
    1bf8:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfa:	4781                	li	a5,0
    1bfc:	bf39                	j	1b1a <strncpy+0x124>
    1bfe:	00250693          	add	a3,a0,2
    1c02:	4709                	li	a4,2
    1c04:	b5f5                	j	1af0 <strncpy+0xfa>
    1c06:	00650693          	add	a3,a0,6
    1c0a:	4719                	li	a4,6
    1c0c:	b5d5                	j	1af0 <strncpy+0xfa>
    1c0e:	8082                	ret

0000000000001c10 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c10:	87aa                	mv	a5,a0
    1c12:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c14:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c18:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c1c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c1e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c20:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c24:	2501                	sext.w	a0,a0
    1c26:	8082                	ret

0000000000001c28 <openat>:
    register long a7 __asm__("a7") = n;
    1c28:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c2c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c30:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c34:	2501                	sext.w	a0,a0
    1c36:	8082                	ret

0000000000001c38 <close>:
    register long a7 __asm__("a7") = n;
    1c38:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c3c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <read>:
    register long a7 __asm__("a7") = n;
    1c44:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c48:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c4c:	8082                	ret

0000000000001c4e <write>:
    register long a7 __asm__("a7") = n;
    1c4e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c52:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c56:	8082                	ret

0000000000001c58 <getpid>:
    register long a7 __asm__("a7") = n;
    1c58:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c5c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c60:	2501                	sext.w	a0,a0
    1c62:	8082                	ret

0000000000001c64 <getppid>:
    register long a7 __asm__("a7") = n;
    1c64:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c68:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c70:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c74:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <fork>:
    register long a7 __asm__("a7") = n;
    1c7c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c80:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c84:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c8c:	85b2                	mv	a1,a2
    1c8e:	863a                	mv	a2,a4
    if (stack)
    1c90:	c191                	beqz	a1,1c94 <clone+0x8>
	stack += stack_size;
    1c92:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c94:	4781                	li	a5,0
    1c96:	4701                	li	a4,0
    1c98:	4681                	li	a3,0
    1c9a:	2601                	sext.w	a2,a2
    1c9c:	ac01                	j	1eac <__clone>

0000000000001c9e <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c9e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ca2:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1ca6:	8082                	ret

0000000000001ca8 <exit>:
    register long a7 __asm__("a7") = n;
    1ca8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cac:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb0:	8082                	ret

0000000000001cb2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <exec>:
    register long a7 __asm__("a7") = n;
    1cc0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <execve>:
    register long a7 __asm__("a7") = n;
    1ccc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <times>:
    register long a7 __asm__("a7") = n;
    1cd8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <get_time>:

int64 get_time()
{
    1ce4:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cea:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cee:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	ed09                	bnez	a0,1d0e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf6:	67a2                	ld	a5,8(sp)
    1cf8:	3e800713          	li	a4,1000
    1cfc:	00015503          	lhu	a0,0(sp)
    1d00:	02e7d7b3          	divu	a5,a5,a4
    1d04:	02e50533          	mul	a0,a0,a4
    1d08:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d0a:	0141                	add	sp,sp,16
    1d0c:	8082                	ret
        return -1;
    1d0e:	557d                	li	a0,-1
    1d10:	bfed                	j	1d0a <get_time+0x26>

0000000000001d12 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d12:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <time>:
    register long a7 __asm__("a7") = n;
    1d1e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <sleep>:

int sleep(unsigned long long time)
{
    1d2a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d2c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d2e:	850a                	mv	a0,sp
    1d30:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d32:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d36:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d38:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3c:	e501                	bnez	a0,1d44 <sleep+0x1a>
    return 0;
    1d3e:	4501                	li	a0,0
}
    1d40:	0141                	add	sp,sp,16
    1d42:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d44:	4502                	lw	a0,0(sp)
}
    1d46:	0141                	add	sp,sp,16
    1d48:	8082                	ret

0000000000001d4a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d4a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d4e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d56:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d5a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d5e:	8082                	ret

0000000000001d60 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d60:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d64:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <munmap>:
    register long a7 __asm__("a7") = n;
    1d6c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d70:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <wait>:

int wait(int *code)
{
    1d78:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d7a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d7e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d80:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d82:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d84:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <spawn>:
    register long a7 __asm__("a7") = n;
    1d8c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d90:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <mailread>:
    register long a7 __asm__("a7") = n;
    1d98:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1da4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <fstat>:
    register long a7 __asm__("a7") = n;
    1db0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dbc:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dbe:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dc2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc4:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dcc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dce:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd2:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ddc:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dde:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <link>:

int link(char *old_path, char *new_path)
{
    1dec:	87aa                	mv	a5,a0
    1dee:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dfa:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfe:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e00:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <unlink>:

int unlink(char *path)
{
    1e08:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e12:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <uname>:
    register long a7 __asm__("a7") = n;
    1e1c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <brk>:
    register long a7 __asm__("a7") = n;
    1e28:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e34:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e3a:	8082                	ret

0000000000001e3c <chdir>:
    register long a7 __asm__("a7") = n;
    1e3c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e48:	862e                	mv	a2,a1
    1e4a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e52:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e56:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e58:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <getdents>:
    register long a7 __asm__("a7") = n;
    1e62:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <pipe>:
    register long a7 __asm__("a7") = n;
    1e6e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e72:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <dup>:
    register long a7 __asm__("a7") = n;
    1e7c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <dup2>:
    register long a7 __asm__("a7") = n;
    1e86:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e88:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <mount>:
    register long a7 __asm__("a7") = n;
    1e92:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e96:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <umount>:
    register long a7 __asm__("a7") = n;
    1e9e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eac:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eae:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb2:	8532                	mv	a0,a2
	mv a2, a4
    1eb4:	863a                	mv	a2,a4
	mv a3, a5
    1eb6:	86be                	mv	a3,a5
	mv a4, a6
    1eb8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eba:	0dc00893          	li	a7,220
	ecall
    1ebe:	00000073          	ecall

	beqz a0, 1f
    1ec2:	c111                	beqz	a0,1ec6 <__clone+0x1a>
	# Parent
	ret
    1ec4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec8:	6522                	ld	a0,8(sp)
	jalr a1
    1eca:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ecc:	05d00893          	li	a7,93
	ecall
    1ed0:	00000073          	ecall
