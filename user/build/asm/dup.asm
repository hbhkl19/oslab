
/home/hbh/oslab/oslab/user/build/riscv64/dup:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a069                	j	108c <__start_main>

0000000000001004 <test_dup>:
/*
 * 测试通过时应输出：
 * "  new fd is 3."
 */

void test_dup(){
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ec250513          	add	a0,a0,-318 # 1ec8 <__clone+0x2e>
void test_dup(){
    100e:	ec06                	sd	ra,24(sp)
	TEST_START(__func__);
    1010:	2d4000ef          	jal	12e4 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f4450513          	add	a0,a0,-188 # 1f58 <__func__.0>
    101c:	2c8000ef          	jal	12e4 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ec050513          	add	a0,a0,-320 # 1ee0 <__clone+0x46>
    1028:	2bc000ef          	jal	12e4 <puts>
	int fd = dup(STDOUT);
    102c:	4505                	li	a0,1
    102e:	63d000ef          	jal	1e6a <dup>
    1032:	85aa                	mv	a1,a0
	assert(fd >=0);
    1034:	02054b63          	bltz	a0,106a <test_dup+0x66>
	printf("  new fd is %d.\n", fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	ed850513          	add	a0,a0,-296 # 1f10 <__clone+0x76>
    1040:	2c6000ef          	jal	1306 <printf>
	TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	ee450513          	add	a0,a0,-284 # 1f28 <__clone+0x8e>
    104c:	298000ef          	jal	12e4 <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	f0850513          	add	a0,a0,-248 # 1f58 <__func__.0>
    1058:	28c000ef          	jal	12e4 <puts>
}
    105c:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e8250513          	add	a0,a0,-382 # 1ee0 <__clone+0x46>
}
    1066:	6105                	add	sp,sp,32
	TEST_END(__func__);
    1068:	acb5                	j	12e4 <puts>
    106a:	e42a                	sd	a0,8(sp)
	assert(fd >=0);
    106c:	00001517          	auipc	a0,0x1
    1070:	e8450513          	add	a0,a0,-380 # 1ef0 <__clone+0x56>
    1074:	50c000ef          	jal	1580 <panic>
    1078:	65a2                	ld	a1,8(sp)
    107a:	bf7d                	j	1038 <test_dup+0x34>

000000000000107c <main>:

int main(void) {
    107c:	1141                	add	sp,sp,-16
    107e:	e406                	sd	ra,8(sp)
	test_dup();
    1080:	f85ff0ef          	jal	1004 <test_dup>
	return 0;
}
    1084:	60a2                	ld	ra,8(sp)
    1086:	4501                	li	a0,0
    1088:	0141                	add	sp,sp,16
    108a:	8082                	ret

000000000000108c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108e:	4108                	lw	a0,0(a0)
{
    1090:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1092:	05a1                	add	a1,a1,8
{
    1094:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1096:	fe7ff0ef          	jal	107c <main>
    109a:	3fd000ef          	jal	1c96 <exit>
	return 0;
}
    109e:	60a2                	ld	ra,8(sp)
    10a0:	4501                	li	a0,0
    10a2:	0141                	add	sp,sp,16
    10a4:	8082                	ret

00000000000010a6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a6:	7179                	add	sp,sp,-48
    10a8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10aa:	12054863          	bltz	a0,11da <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ae:	02b577bb          	remuw	a5,a0,a1
    10b2:	00001697          	auipc	a3,0x1
    10b6:	eb668693          	add	a3,a3,-330 # 1f68 <digits>
    buf[16] = 0;
    10ba:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10be:	0005871b          	sext.w	a4,a1
    10c2:	1782                	sll	a5,a5,0x20
    10c4:	9381                	srl	a5,a5,0x20
    10c6:	97b6                	add	a5,a5,a3
    10c8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10cc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10d0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d4:	1ab56663          	bltu	a0,a1,1280 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10d8:	02e8763b          	remuw	a2,a6,a4
    10dc:	1602                	sll	a2,a2,0x20
    10de:	9201                	srl	a2,a2,0x20
    10e0:	9636                	add	a2,a2,a3
    10e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10ea:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ee:	12e86c63          	bltu	a6,a4,1226 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10f2:	02e5f63b          	remuw	a2,a1,a4
    10f6:	1602                	sll	a2,a2,0x20
    10f8:	9201                	srl	a2,a2,0x20
    10fa:	9636                	add	a2,a2,a3
    10fc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1100:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1104:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1108:	12e5e863          	bltu	a1,a4,1238 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    110c:	02e8763b          	remuw	a2,a6,a4
    1110:	1602                	sll	a2,a2,0x20
    1112:	9201                	srl	a2,a2,0x20
    1114:	9636                	add	a2,a2,a3
    1116:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1122:	12e86463          	bltu	a6,a4,124a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1126:	02e5f63b          	remuw	a2,a1,a4
    112a:	1602                	sll	a2,a2,0x20
    112c:	9201                	srl	a2,a2,0x20
    112e:	9636                	add	a2,a2,a3
    1130:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1134:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1138:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    113c:	12e5e063          	bltu	a1,a4,125c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1140:	02e8763b          	remuw	a2,a6,a4
    1144:	1602                	sll	a2,a2,0x20
    1146:	9201                	srl	a2,a2,0x20
    1148:	9636                	add	a2,a2,a3
    114a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1152:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1156:	0ae86f63          	bltu	a6,a4,1214 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    115a:	02e5f63b          	remuw	a2,a1,a4
    115e:	1602                	sll	a2,a2,0x20
    1160:	9201                	srl	a2,a2,0x20
    1162:	9636                	add	a2,a2,a3
    1164:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1168:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1170:	0ee5ef63          	bltu	a1,a4,126e <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1174:	02e8763b          	remuw	a2,a6,a4
    1178:	1602                	sll	a2,a2,0x20
    117a:	9201                	srl	a2,a2,0x20
    117c:	9636                	add	a2,a2,a3
    117e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1182:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1186:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    118a:	0ee86d63          	bltu	a6,a4,1284 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    118e:	02e5f63b          	remuw	a2,a1,a4
    1192:	1602                	sll	a2,a2,0x20
    1194:	9201                	srl	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11a0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11a4:	0ee5e963          	bltu	a1,a4,1296 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11a8:	1782                	sll	a5,a5,0x20
    11aa:	9381                	srl	a5,a5,0x20
    11ac:	96be                	add	a3,a3,a5
    11ae:	0006c783          	lbu	a5,0(a3)
    11b2:	4599                	li	a1,6
    11b4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11b8:	00055763          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11bc:	02d00793          	li	a5,45
    11c0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11c4:	4595                	li	a1,5
    write(f, s, l);
    11c6:	003c                	add	a5,sp,8
    11c8:	4641                	li	a2,16
    11ca:	9e0d                	subw	a2,a2,a1
    11cc:	4505                	li	a0,1
    11ce:	95be                	add	a1,a1,a5
    11d0:	26d000ef          	jal	1c3c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d4:	70a2                	ld	ra,40(sp)
    11d6:	6145                	add	sp,sp,48
    11d8:	8082                	ret
        x = -xx;
    11da:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11de:	02b677bb          	remuw	a5,a2,a1
    11e2:	00001697          	auipc	a3,0x1
    11e6:	d8668693          	add	a3,a3,-634 # 1f68 <digits>
    buf[16] = 0;
    11ea:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11ee:	0005871b          	sext.w	a4,a1
    11f2:	1782                	sll	a5,a5,0x20
    11f4:	9381                	srl	a5,a5,0x20
    11f6:	97b6                	add	a5,a5,a3
    11f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11fc:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1200:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1204:	ecb67ae3          	bgeu	a2,a1,10d8 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1210:	45b9                	li	a1,14
    1212:	bf55                	j	11c6 <printint.constprop.0+0x120>
    1214:	45a9                	li	a1,10
    if (sign)
    1216:	fa0558e3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1222:	45a5                	li	a1,9
    1224:	b74d                	j	11c6 <printint.constprop.0+0x120>
    1226:	45b9                	li	a1,14
    if (sign)
    1228:	f8055fe3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1234:	45b5                	li	a1,13
    1236:	bf41                	j	11c6 <printint.constprop.0+0x120>
    1238:	45b5                	li	a1,13
    if (sign)
    123a:	f80556e3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1246:	45b1                	li	a1,12
    1248:	bfbd                	j	11c6 <printint.constprop.0+0x120>
    124a:	45b1                	li	a1,12
    if (sign)
    124c:	f6055de3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1258:	45ad                	li	a1,11
    125a:	b7b5                	j	11c6 <printint.constprop.0+0x120>
    125c:	45ad                	li	a1,11
    if (sign)
    125e:	f60554e3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    126a:	45a9                	li	a1,10
    126c:	bfa9                	j	11c6 <printint.constprop.0+0x120>
    126e:	45a5                	li	a1,9
    if (sign)
    1270:	f4055be3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    127c:	45a1                	li	a1,8
    127e:	b7a1                	j	11c6 <printint.constprop.0+0x120>
    i = 15;
    1280:	45bd                	li	a1,15
    1282:	b791                	j	11c6 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1284:	45a1                	li	a1,8
    if (sign)
    1286:	f40550e3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1292:	459d                	li	a1,7
    1294:	bf0d                	j	11c6 <printint.constprop.0+0x120>
    1296:	459d                	li	a1,7
    if (sign)
    1298:	f20557e3          	bgez	a0,11c6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12a4:	4599                	li	a1,6
    12a6:	b705                	j	11c6 <printint.constprop.0+0x120>

00000000000012a8 <getchar>:
{
    12a8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12aa:	00f10593          	add	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4501                	li	a0,0
{
    12b2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b8:	17b000ef          	jal	1c32 <read>
}
    12bc:	60e2                	ld	ra,24(sp)
    12be:	00f14503          	lbu	a0,15(sp)
    12c2:	6105                	add	sp,sp,32
    12c4:	8082                	ret

00000000000012c6 <putchar>:
{
    12c6:	1101                	add	sp,sp,-32
    12c8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ca:	00f10593          	add	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4505                	li	a0,1
{
    12d2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12d8:	165000ef          	jal	1c3c <write>
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	2501                	sext.w	a0,a0
    12e0:	6105                	add	sp,sp,32
    12e2:	8082                	ret

00000000000012e4 <puts>:
{
    12e4:	1141                	add	sp,sp,-16
    12e6:	e406                	sd	ra,8(sp)
    12e8:	e022                	sd	s0,0(sp)
    12ea:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ec:	574000ef          	jal	1860 <strlen>
    12f0:	862a                	mv	a2,a0
    12f2:	85a2                	mv	a1,s0
    12f4:	4505                	li	a0,1
    12f6:	147000ef          	jal	1c3c <write>
}
    12fa:	60a2                	ld	ra,8(sp)
    12fc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fe:	957d                	sra	a0,a0,0x3f
    return r;
    1300:	2501                	sext.w	a0,a0
}
    1302:	0141                	add	sp,sp,16
    1304:	8082                	ret

0000000000001306 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1306:	7171                	add	sp,sp,-176
    1308:	f85a                	sd	s6,48(sp)
    130a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    130c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130e:	18bc                	add	a5,sp,120
{
    1310:	e8ca                	sd	s2,80(sp)
    1312:	e4ce                	sd	s3,72(sp)
    1314:	e0d2                	sd	s4,64(sp)
    1316:	fc56                	sd	s5,56(sp)
    1318:	f486                	sd	ra,104(sp)
    131a:	f0a2                	sd	s0,96(sp)
    131c:	eca6                	sd	s1,88(sp)
    131e:	fcae                	sd	a1,120(sp)
    1320:	e132                	sd	a2,128(sp)
    1322:	e536                	sd	a3,136(sp)
    1324:	e93a                	sd	a4,144(sp)
    1326:	f142                	sd	a6,160(sp)
    1328:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    132a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1330:	07300a13          	li	s4,115
    1334:	07800a93          	li	s5,120
    buf[i++] = '0';
    1338:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    133c:	00001997          	auipc	s3,0x1
    1340:	c2c98993          	add	s3,s3,-980 # 1f68 <digits>
        if (!*s)
    1344:	00054783          	lbu	a5,0(a0)
    1348:	16078a63          	beqz	a5,14bc <printf+0x1b6>
    134c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    134e:	19278d63          	beq	a5,s2,14e8 <printf+0x1e2>
    1352:	00164783          	lbu	a5,1(a2)
    1356:	0605                	add	a2,a2,1
    1358:	fbfd                	bnez	a5,134e <printf+0x48>
    135a:	84b2                	mv	s1,a2
        l = z - a;
    135c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1360:	85aa                	mv	a1,a0
    1362:	8622                	mv	a2,s0
    1364:	4505                	li	a0,1
    1366:	0d7000ef          	jal	1c3c <write>
        if (l)
    136a:	1a041463          	bnez	s0,1512 <printf+0x20c>
        if (s[1] == 0)
    136e:	0014c783          	lbu	a5,1(s1)
    1372:	14078563          	beqz	a5,14bc <printf+0x1b6>
        switch (s[1])
    1376:	1b478063          	beq	a5,s4,1516 <printf+0x210>
    137a:	14fa6b63          	bltu	s4,a5,14d0 <printf+0x1ca>
    137e:	06400713          	li	a4,100
    1382:	1ee78063          	beq	a5,a4,1562 <printf+0x25c>
    1386:	07000713          	li	a4,112
    138a:	1ae79963          	bne	a5,a4,153c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    138e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1390:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1394:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1396:	631c                	ld	a5,0(a4)
    1398:	0721                	add	a4,a4,8
    139a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    139c:	00479293          	sll	t0,a5,0x4
    13a0:	00879f93          	sll	t6,a5,0x8
    13a4:	00c79f13          	sll	t5,a5,0xc
    13a8:	01079e93          	sll	t4,a5,0x10
    13ac:	01479e13          	sll	t3,a5,0x14
    13b0:	01879313          	sll	t1,a5,0x18
    13b4:	01c79893          	sll	a7,a5,0x1c
    13b8:	02479813          	sll	a6,a5,0x24
    13bc:	02879513          	sll	a0,a5,0x28
    13c0:	02c79593          	sll	a1,a5,0x2c
    13c4:	03079693          	sll	a3,a5,0x30
    13c8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13cc:	03c7d413          	srl	s0,a5,0x3c
    13d0:	01c7d39b          	srlw	t2,a5,0x1c
    13d4:	03c2d293          	srl	t0,t0,0x3c
    13d8:	03cfdf93          	srl	t6,t6,0x3c
    13dc:	03cf5f13          	srl	t5,t5,0x3c
    13e0:	03cede93          	srl	t4,t4,0x3c
    13e4:	03ce5e13          	srl	t3,t3,0x3c
    13e8:	03c35313          	srl	t1,t1,0x3c
    13ec:	03c8d893          	srl	a7,a7,0x3c
    13f0:	03c85813          	srl	a6,a6,0x3c
    13f4:	9171                	srl	a0,a0,0x3c
    13f6:	91f1                	srl	a1,a1,0x3c
    13f8:	92f1                	srl	a3,a3,0x3c
    13fa:	9371                	srl	a4,a4,0x3c
    13fc:	96ce                	add	a3,a3,s3
    13fe:	974e                	add	a4,a4,s3
    1400:	944e                	add	s0,s0,s3
    1402:	92ce                	add	t0,t0,s3
    1404:	9fce                	add	t6,t6,s3
    1406:	9f4e                	add	t5,t5,s3
    1408:	9ece                	add	t4,t4,s3
    140a:	9e4e                	add	t3,t3,s3
    140c:	934e                	add	t1,t1,s3
    140e:	98ce                	add	a7,a7,s3
    1410:	93ce                	add	t2,t2,s3
    1412:	984e                	add	a6,a6,s3
    1414:	954e                	add	a0,a0,s3
    1416:	95ce                	add	a1,a1,s3
    1418:	0006c083          	lbu	ra,0(a3)
    141c:	0002c283          	lbu	t0,0(t0)
    1420:	00074683          	lbu	a3,0(a4)
    1424:	000fcf83          	lbu	t6,0(t6)
    1428:	000f4f03          	lbu	t5,0(t5)
    142c:	000ece83          	lbu	t4,0(t4)
    1430:	000e4e03          	lbu	t3,0(t3)
    1434:	00034303          	lbu	t1,0(t1)
    1438:	0008c883          	lbu	a7,0(a7)
    143c:	0003c383          	lbu	t2,0(t2)
    1440:	00084803          	lbu	a6,0(a6)
    1444:	00054503          	lbu	a0,0(a0)
    1448:	0005c583          	lbu	a1,0(a1)
    144c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1450:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1454:	9371                	srl	a4,a4,0x3c
    1456:	8bbd                	and	a5,a5,15
    1458:	974e                	add	a4,a4,s3
    145a:	97ce                	add	a5,a5,s3
    145c:	005105a3          	sb	t0,11(sp)
    1460:	01f10623          	sb	t6,12(sp)
    1464:	01e106a3          	sb	t5,13(sp)
    1468:	01d10723          	sb	t4,14(sp)
    146c:	01c107a3          	sb	t3,15(sp)
    1470:	00610823          	sb	t1,16(sp)
    1474:	011108a3          	sb	a7,17(sp)
    1478:	00710923          	sb	t2,18(sp)
    147c:	010109a3          	sb	a6,19(sp)
    1480:	00a10a23          	sb	a0,20(sp)
    1484:	00b10aa3          	sb	a1,21(sp)
    1488:	00110b23          	sb	ra,22(sp)
    148c:	00d10ba3          	sb	a3,23(sp)
    1490:	00810523          	sb	s0,10(sp)
    1494:	00074703          	lbu	a4,0(a4)
    1498:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    149c:	002c                	add	a1,sp,8
    149e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a0:	00e10c23          	sb	a4,24(sp)
    14a4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14a8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ac:	790000ef          	jal	1c3c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14b0:	00248513          	add	a0,s1,2
        if (!*s)
    14b4:	00054783          	lbu	a5,0(a0)
    14b8:	e8079ae3          	bnez	a5,134c <printf+0x46>
    }
    va_end(ap);
}
    14bc:	70a6                	ld	ra,104(sp)
    14be:	7406                	ld	s0,96(sp)
    14c0:	64e6                	ld	s1,88(sp)
    14c2:	6946                	ld	s2,80(sp)
    14c4:	69a6                	ld	s3,72(sp)
    14c6:	6a06                	ld	s4,64(sp)
    14c8:	7ae2                	ld	s5,56(sp)
    14ca:	7b42                	ld	s6,48(sp)
    14cc:	614d                	add	sp,sp,176
    14ce:	8082                	ret
        switch (s[1])
    14d0:	07579663          	bne	a5,s5,153c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14d4:	6782                	ld	a5,0(sp)
    14d6:	45c1                	li	a1,16
    14d8:	4388                	lw	a0,0(a5)
    14da:	07a1                	add	a5,a5,8
    14dc:	e03e                	sd	a5,0(sp)
    14de:	bc9ff0ef          	jal	10a6 <printint.constprop.0>
        s += 2;
    14e2:	00248513          	add	a0,s1,2
    14e6:	b7f9                	j	14b4 <printf+0x1ae>
    14e8:	84b2                	mv	s1,a2
    14ea:	a039                	j	14f8 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ec:	0024c783          	lbu	a5,2(s1)
    14f0:	0605                	add	a2,a2,1
    14f2:	0489                	add	s1,s1,2
    14f4:	e72794e3          	bne	a5,s2,135c <printf+0x56>
    14f8:	0014c783          	lbu	a5,1(s1)
    14fc:	ff2788e3          	beq	a5,s2,14ec <printf+0x1e6>
        l = z - a;
    1500:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1504:	85aa                	mv	a1,a0
    1506:	8622                	mv	a2,s0
    1508:	4505                	li	a0,1
    150a:	732000ef          	jal	1c3c <write>
        if (l)
    150e:	e60400e3          	beqz	s0,136e <printf+0x68>
    1512:	8526                	mv	a0,s1
    1514:	bd05                	j	1344 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1516:	6782                	ld	a5,0(sp)
    1518:	6380                	ld	s0,0(a5)
    151a:	07a1                	add	a5,a5,8
    151c:	e03e                	sd	a5,0(sp)
    151e:	cc21                	beqz	s0,1576 <printf+0x270>
            l = strnlen(a, 200);
    1520:	0c800593          	li	a1,200
    1524:	8522                	mv	a0,s0
    1526:	424000ef          	jal	194a <strnlen>
    write(f, s, l);
    152a:	0005061b          	sext.w	a2,a0
    152e:	85a2                	mv	a1,s0
    1530:	4505                	li	a0,1
    1532:	70a000ef          	jal	1c3c <write>
        s += 2;
    1536:	00248513          	add	a0,s1,2
    153a:	bfad                	j	14b4 <printf+0x1ae>
    return write(stdout, &byte, 1);
    153c:	4605                	li	a2,1
    153e:	002c                	add	a1,sp,8
    1540:	4505                	li	a0,1
    char byte = c;
    1542:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1546:	6f6000ef          	jal	1c3c <write>
    char byte = c;
    154a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154e:	4605                	li	a2,1
    1550:	002c                	add	a1,sp,8
    1552:	4505                	li	a0,1
    char byte = c;
    1554:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1558:	6e4000ef          	jal	1c3c <write>
        s += 2;
    155c:	00248513          	add	a0,s1,2
    1560:	bf91                	j	14b4 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1562:	6782                	ld	a5,0(sp)
    1564:	45a9                	li	a1,10
    1566:	4388                	lw	a0,0(a5)
    1568:	07a1                	add	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	b3bff0ef          	jal	10a6 <printint.constprop.0>
        s += 2;
    1570:	00248513          	add	a0,s1,2
    1574:	b781                	j	14b4 <printf+0x1ae>
                a = "(null)";
    1576:	00001417          	auipc	s0,0x1
    157a:	9c240413          	add	s0,s0,-1598 # 1f38 <__clone+0x9e>
    157e:	b74d                	j	1520 <printf+0x21a>

0000000000001580 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1580:	1141                	add	sp,sp,-16
    1582:	e406                	sd	ra,8(sp)
    puts(m);
    1584:	d61ff0ef          	jal	12e4 <puts>
    exit(-100);
}
    1588:	60a2                	ld	ra,8(sp)
    exit(-100);
    158a:	f9c00513          	li	a0,-100
}
    158e:	0141                	add	sp,sp,16
    exit(-100);
    1590:	a719                	j	1c96 <exit>

0000000000001592 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	02000793          	li	a5,32
    1596:	00f50663          	beq	a0,a5,15a2 <isspace+0x10>
    159a:	355d                	addw	a0,a0,-9
    159c:	00553513          	sltiu	a0,a0,5
    15a0:	8082                	ret
    15a2:	4505                	li	a0,1
}
    15a4:	8082                	ret

00000000000015a6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a6:	fd05051b          	addw	a0,a0,-48
}
    15aa:	00a53513          	sltiu	a0,a0,10
    15ae:	8082                	ret

00000000000015b0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	02000693          	li	a3,32
    15b4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ba:	ff77871b          	addw	a4,a5,-9
    15be:	04d78c63          	beq	a5,a3,1616 <atoi+0x66>
    15c2:	0007861b          	sext.w	a2,a5
    15c6:	04e5f863          	bgeu	a1,a4,1616 <atoi+0x66>
        s++;
    switch (*s)
    15ca:	02b00713          	li	a4,43
    15ce:	04e78963          	beq	a5,a4,1620 <atoi+0x70>
    15d2:	02d00713          	li	a4,45
    15d6:	06e78263          	beq	a5,a4,163a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15da:	fd06069b          	addw	a3,a2,-48
    15de:	47a5                	li	a5,9
    15e0:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15e2:	4301                	li	t1,0
    while (isdigit(*s))
    15e4:	04d7e963          	bltu	a5,a3,1636 <atoi+0x86>
    int n = 0, neg = 0;
    15e8:	4501                	li	a0,0
    while (isdigit(*s))
    15ea:	48a5                	li	a7,9
    15ec:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15f0:	0025179b          	sllw	a5,a0,0x2
    15f4:	9fa9                	addw	a5,a5,a0
    15f6:	fd06059b          	addw	a1,a2,-48
    15fa:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    15fe:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1602:	0705                	add	a4,a4,1
    1604:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1608:	0006861b          	sext.w	a2,a3
    160c:	ff08f0e3          	bgeu	a7,a6,15ec <atoi+0x3c>
    return neg ? n : -n;
    1610:	00030563          	beqz	t1,161a <atoi+0x6a>
}
    1614:	8082                	ret
        s++;
    1616:	0505                	add	a0,a0,1
    1618:	bf79                	j	15b6 <atoi+0x6>
    return neg ? n : -n;
    161a:	40f5853b          	subw	a0,a1,a5
    161e:	8082                	ret
    while (isdigit(*s))
    1620:	00154603          	lbu	a2,1(a0)
    1624:	47a5                	li	a5,9
        s++;
    1626:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    162a:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    162e:	4301                	li	t1,0
    while (isdigit(*s))
    1630:	2601                	sext.w	a2,a2
    1632:	fad7fbe3          	bgeu	a5,a3,15e8 <atoi+0x38>
    1636:	4501                	li	a0,0
}
    1638:	8082                	ret
    while (isdigit(*s))
    163a:	00154603          	lbu	a2,1(a0)
    163e:	47a5                	li	a5,9
        s++;
    1640:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1644:	fd06069b          	addw	a3,a2,-48
    1648:	2601                	sext.w	a2,a2
    164a:	fed7e6e3          	bltu	a5,a3,1636 <atoi+0x86>
        neg = 1;
    164e:	4305                	li	t1,1
    1650:	bf61                	j	15e8 <atoi+0x38>

0000000000001652 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1652:	18060163          	beqz	a2,17d4 <memset+0x182>
    1656:	40a006b3          	neg	a3,a0
    165a:	0076f793          	and	a5,a3,7
    165e:	00778813          	add	a6,a5,7
    1662:	48ad                	li	a7,11
    1664:	0ff5f713          	zext.b	a4,a1
    1668:	fff60593          	add	a1,a2,-1
    166c:	17186563          	bltu	a6,a7,17d6 <memset+0x184>
    1670:	1705ed63          	bltu	a1,a6,17ea <memset+0x198>
    1674:	16078363          	beqz	a5,17da <memset+0x188>
    1678:	00e50023          	sb	a4,0(a0)
    167c:	0066f593          	and	a1,a3,6
    1680:	16058063          	beqz	a1,17e0 <memset+0x18e>
    1684:	00e500a3          	sb	a4,1(a0)
    1688:	4589                	li	a1,2
    168a:	16f5f363          	bgeu	a1,a5,17f0 <memset+0x19e>
    168e:	00e50123          	sb	a4,2(a0)
    1692:	8a91                	and	a3,a3,4
    1694:	00350593          	add	a1,a0,3
    1698:	4e0d                	li	t3,3
    169a:	ce9d                	beqz	a3,16d8 <memset+0x86>
    169c:	00e501a3          	sb	a4,3(a0)
    16a0:	4691                	li	a3,4
    16a2:	00450593          	add	a1,a0,4
    16a6:	4e11                	li	t3,4
    16a8:	02f6f863          	bgeu	a3,a5,16d8 <memset+0x86>
    16ac:	00e50223          	sb	a4,4(a0)
    16b0:	4695                	li	a3,5
    16b2:	00550593          	add	a1,a0,5
    16b6:	4e15                	li	t3,5
    16b8:	02d78063          	beq	a5,a3,16d8 <memset+0x86>
    16bc:	fff50693          	add	a3,a0,-1
    16c0:	00e502a3          	sb	a4,5(a0)
    16c4:	8a9d                	and	a3,a3,7
    16c6:	00650593          	add	a1,a0,6
    16ca:	4e19                	li	t3,6
    16cc:	e691                	bnez	a3,16d8 <memset+0x86>
    16ce:	00750593          	add	a1,a0,7
    16d2:	00e50323          	sb	a4,6(a0)
    16d6:	4e1d                	li	t3,7
    16d8:	00871693          	sll	a3,a4,0x8
    16dc:	01071813          	sll	a6,a4,0x10
    16e0:	8ed9                	or	a3,a3,a4
    16e2:	01871893          	sll	a7,a4,0x18
    16e6:	0106e6b3          	or	a3,a3,a6
    16ea:	0116e6b3          	or	a3,a3,a7
    16ee:	02071813          	sll	a6,a4,0x20
    16f2:	02871313          	sll	t1,a4,0x28
    16f6:	0106e6b3          	or	a3,a3,a6
    16fa:	40f608b3          	sub	a7,a2,a5
    16fe:	03071813          	sll	a6,a4,0x30
    1702:	0066e6b3          	or	a3,a3,t1
    1706:	0106e6b3          	or	a3,a3,a6
    170a:	03871313          	sll	t1,a4,0x38
    170e:	97aa                	add	a5,a5,a0
    1710:	ff88f813          	and	a6,a7,-8
    1714:	0066e6b3          	or	a3,a3,t1
    1718:	983e                	add	a6,a6,a5
    171a:	e394                	sd	a3,0(a5)
    171c:	07a1                	add	a5,a5,8
    171e:	ff079ee3          	bne	a5,a6,171a <memset+0xc8>
    1722:	ff88f793          	and	a5,a7,-8
    1726:	0078f893          	and	a7,a7,7
    172a:	00f586b3          	add	a3,a1,a5
    172e:	01c787bb          	addw	a5,a5,t3
    1732:	0a088b63          	beqz	a7,17e8 <memset+0x196>
    1736:	00e68023          	sb	a4,0(a3)
    173a:	0017859b          	addw	a1,a5,1
    173e:	08c5fb63          	bgeu	a1,a2,17d4 <memset+0x182>
    1742:	00e680a3          	sb	a4,1(a3)
    1746:	0027859b          	addw	a1,a5,2
    174a:	08c5f563          	bgeu	a1,a2,17d4 <memset+0x182>
    174e:	00e68123          	sb	a4,2(a3)
    1752:	0037859b          	addw	a1,a5,3
    1756:	06c5ff63          	bgeu	a1,a2,17d4 <memset+0x182>
    175a:	00e681a3          	sb	a4,3(a3)
    175e:	0047859b          	addw	a1,a5,4
    1762:	06c5f963          	bgeu	a1,a2,17d4 <memset+0x182>
    1766:	00e68223          	sb	a4,4(a3)
    176a:	0057859b          	addw	a1,a5,5
    176e:	06c5f363          	bgeu	a1,a2,17d4 <memset+0x182>
    1772:	00e682a3          	sb	a4,5(a3)
    1776:	0067859b          	addw	a1,a5,6
    177a:	04c5fd63          	bgeu	a1,a2,17d4 <memset+0x182>
    177e:	00e68323          	sb	a4,6(a3)
    1782:	0077859b          	addw	a1,a5,7
    1786:	04c5f763          	bgeu	a1,a2,17d4 <memset+0x182>
    178a:	00e683a3          	sb	a4,7(a3)
    178e:	0087859b          	addw	a1,a5,8
    1792:	04c5f163          	bgeu	a1,a2,17d4 <memset+0x182>
    1796:	00e68423          	sb	a4,8(a3)
    179a:	0097859b          	addw	a1,a5,9
    179e:	02c5fb63          	bgeu	a1,a2,17d4 <memset+0x182>
    17a2:	00e684a3          	sb	a4,9(a3)
    17a6:	00a7859b          	addw	a1,a5,10
    17aa:	02c5f563          	bgeu	a1,a2,17d4 <memset+0x182>
    17ae:	00e68523          	sb	a4,10(a3)
    17b2:	00b7859b          	addw	a1,a5,11
    17b6:	00c5ff63          	bgeu	a1,a2,17d4 <memset+0x182>
    17ba:	00e685a3          	sb	a4,11(a3)
    17be:	00c7859b          	addw	a1,a5,12
    17c2:	00c5f963          	bgeu	a1,a2,17d4 <memset+0x182>
    17c6:	00e68623          	sb	a4,12(a3)
    17ca:	27b5                	addw	a5,a5,13
    17cc:	00c7f463          	bgeu	a5,a2,17d4 <memset+0x182>
    17d0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d4:	8082                	ret
    17d6:	482d                	li	a6,11
    17d8:	bd61                	j	1670 <memset+0x1e>
    char *p = dest;
    17da:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17dc:	4e01                	li	t3,0
    17de:	bded                	j	16d8 <memset+0x86>
    17e0:	00150593          	add	a1,a0,1
    17e4:	4e05                	li	t3,1
    17e6:	bdcd                	j	16d8 <memset+0x86>
    17e8:	8082                	ret
    char *p = dest;
    17ea:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ec:	4781                	li	a5,0
    17ee:	b7a1                	j	1736 <memset+0xe4>
    17f0:	00250593          	add	a1,a0,2
    17f4:	4e09                	li	t3,2
    17f6:	b5cd                	j	16d8 <memset+0x86>

00000000000017f8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f8:	00054783          	lbu	a5,0(a0)
    17fc:	0005c703          	lbu	a4,0(a1)
    1800:	00e79863          	bne	a5,a4,1810 <strcmp+0x18>
    1804:	0505                	add	a0,a0,1
    1806:	0585                	add	a1,a1,1
    1808:	fbe5                	bnez	a5,17f8 <strcmp>
    180a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    180c:	9d19                	subw	a0,a0,a4
    180e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1810:	0007851b          	sext.w	a0,a5
    1814:	bfe5                	j	180c <strcmp+0x14>

0000000000001816 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1816:	ca15                	beqz	a2,184a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1818:	00054783          	lbu	a5,0(a0)
    if (!n--)
    181c:	167d                	add	a2,a2,-1
    181e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1822:	eb99                	bnez	a5,1838 <strncmp+0x22>
    1824:	a815                	j	1858 <strncmp+0x42>
    1826:	00a68e63          	beq	a3,a0,1842 <strncmp+0x2c>
    182a:	0505                	add	a0,a0,1
    182c:	00f71b63          	bne	a4,a5,1842 <strncmp+0x2c>
    1830:	00054783          	lbu	a5,0(a0)
    1834:	cf89                	beqz	a5,184e <strncmp+0x38>
    1836:	85b2                	mv	a1,a2
    1838:	0005c703          	lbu	a4,0(a1)
    183c:	00158613          	add	a2,a1,1
    1840:	f37d                	bnez	a4,1826 <strncmp+0x10>
        ;
    return *l - *r;
    1842:	0007851b          	sext.w	a0,a5
    1846:	9d19                	subw	a0,a0,a4
    1848:	8082                	ret
        return 0;
    184a:	4501                	li	a0,0
}
    184c:	8082                	ret
    return *l - *r;
    184e:	0015c703          	lbu	a4,1(a1)
    1852:	4501                	li	a0,0
    1854:	9d19                	subw	a0,a0,a4
    1856:	8082                	ret
    1858:	0005c703          	lbu	a4,0(a1)
    185c:	4501                	li	a0,0
    185e:	b7e5                	j	1846 <strncmp+0x30>

0000000000001860 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1860:	00757793          	and	a5,a0,7
    1864:	cf89                	beqz	a5,187e <strlen+0x1e>
    1866:	87aa                	mv	a5,a0
    1868:	a029                	j	1872 <strlen+0x12>
    186a:	0785                	add	a5,a5,1
    186c:	0077f713          	and	a4,a5,7
    1870:	cb01                	beqz	a4,1880 <strlen+0x20>
        if (!*s)
    1872:	0007c703          	lbu	a4,0(a5)
    1876:	fb75                	bnez	a4,186a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1878:	40a78533          	sub	a0,a5,a0
}
    187c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    187e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1880:	6394                	ld	a3,0(a5)
    1882:	00000597          	auipc	a1,0x0
    1886:	6be5b583          	ld	a1,1726(a1) # 1f40 <__clone+0xa6>
    188a:	00000617          	auipc	a2,0x0
    188e:	6be63603          	ld	a2,1726(a2) # 1f48 <__clone+0xae>
    1892:	a019                	j	1898 <strlen+0x38>
    1894:	6794                	ld	a3,8(a5)
    1896:	07a1                	add	a5,a5,8
    1898:	00b68733          	add	a4,a3,a1
    189c:	fff6c693          	not	a3,a3
    18a0:	8f75                	and	a4,a4,a3
    18a2:	8f71                	and	a4,a4,a2
    18a4:	db65                	beqz	a4,1894 <strlen+0x34>
    for (; *s; s++)
    18a6:	0007c703          	lbu	a4,0(a5)
    18aa:	d779                	beqz	a4,1878 <strlen+0x18>
    18ac:	0017c703          	lbu	a4,1(a5)
    18b0:	0785                	add	a5,a5,1
    18b2:	d379                	beqz	a4,1878 <strlen+0x18>
    18b4:	0017c703          	lbu	a4,1(a5)
    18b8:	0785                	add	a5,a5,1
    18ba:	fb6d                	bnez	a4,18ac <strlen+0x4c>
    18bc:	bf75                	j	1878 <strlen+0x18>

00000000000018be <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18be:	00757713          	and	a4,a0,7
{
    18c2:	87aa                	mv	a5,a0
    18c4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c8:	cb19                	beqz	a4,18de <memchr+0x20>
    18ca:	ce25                	beqz	a2,1942 <memchr+0x84>
    18cc:	0007c703          	lbu	a4,0(a5)
    18d0:	00b70763          	beq	a4,a1,18de <memchr+0x20>
    18d4:	0785                	add	a5,a5,1
    18d6:	0077f713          	and	a4,a5,7
    18da:	167d                	add	a2,a2,-1
    18dc:	f77d                	bnez	a4,18ca <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18de:	4501                	li	a0,0
    if (n && *s != c)
    18e0:	c235                	beqz	a2,1944 <memchr+0x86>
    18e2:	0007c703          	lbu	a4,0(a5)
    18e6:	06b70063          	beq	a4,a1,1946 <memchr+0x88>
        size_t k = ONES * c;
    18ea:	00000517          	auipc	a0,0x0
    18ee:	66653503          	ld	a0,1638(a0) # 1f50 <__clone+0xb6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f2:	471d                	li	a4,7
        size_t k = ONES * c;
    18f4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f8:	04c77763          	bgeu	a4,a2,1946 <memchr+0x88>
    18fc:	00000897          	auipc	a7,0x0
    1900:	6448b883          	ld	a7,1604(a7) # 1f40 <__clone+0xa6>
    1904:	00000817          	auipc	a6,0x0
    1908:	64483803          	ld	a6,1604(a6) # 1f48 <__clone+0xae>
    190c:	431d                	li	t1,7
    190e:	a029                	j	1918 <memchr+0x5a>
    1910:	1661                	add	a2,a2,-8
    1912:	07a1                	add	a5,a5,8
    1914:	00c37c63          	bgeu	t1,a2,192c <memchr+0x6e>
    1918:	6398                	ld	a4,0(a5)
    191a:	8f29                	xor	a4,a4,a0
    191c:	011706b3          	add	a3,a4,a7
    1920:	fff74713          	not	a4,a4
    1924:	8f75                	and	a4,a4,a3
    1926:	01077733          	and	a4,a4,a6
    192a:	d37d                	beqz	a4,1910 <memchr+0x52>
    192c:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    192e:	e601                	bnez	a2,1936 <memchr+0x78>
    1930:	a809                	j	1942 <memchr+0x84>
    1932:	0505                	add	a0,a0,1
    1934:	c619                	beqz	a2,1942 <memchr+0x84>
    1936:	00054783          	lbu	a5,0(a0)
    193a:	167d                	add	a2,a2,-1
    193c:	feb79be3          	bne	a5,a1,1932 <memchr+0x74>
    1940:	8082                	ret
    return n ? (void *)s : 0;
    1942:	4501                	li	a0,0
}
    1944:	8082                	ret
    if (n && *s != c)
    1946:	853e                	mv	a0,a5
    1948:	b7fd                	j	1936 <memchr+0x78>

000000000000194a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    194a:	1101                	add	sp,sp,-32
    194c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    194e:	862e                	mv	a2,a1
{
    1950:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1952:	4581                	li	a1,0
{
    1954:	e426                	sd	s1,8(sp)
    1956:	ec06                	sd	ra,24(sp)
    1958:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    195a:	f65ff0ef          	jal	18be <memchr>
    return p ? p - s : n;
    195e:	c519                	beqz	a0,196c <strnlen+0x22>
}
    1960:	60e2                	ld	ra,24(sp)
    1962:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1964:	8d05                	sub	a0,a0,s1
}
    1966:	64a2                	ld	s1,8(sp)
    1968:	6105                	add	sp,sp,32
    196a:	8082                	ret
    196c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    196e:	8522                	mv	a0,s0
}
    1970:	6442                	ld	s0,16(sp)
    1972:	64a2                	ld	s1,8(sp)
    1974:	6105                	add	sp,sp,32
    1976:	8082                	ret

0000000000001978 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1978:	00a5c7b3          	xor	a5,a1,a0
    197c:	8b9d                	and	a5,a5,7
    197e:	eb95                	bnez	a5,19b2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1980:	0075f793          	and	a5,a1,7
    1984:	e7b1                	bnez	a5,19d0 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1986:	6198                	ld	a4,0(a1)
    1988:	00000617          	auipc	a2,0x0
    198c:	5b863603          	ld	a2,1464(a2) # 1f40 <__clone+0xa6>
    1990:	00000817          	auipc	a6,0x0
    1994:	5b883803          	ld	a6,1464(a6) # 1f48 <__clone+0xae>
    1998:	a029                	j	19a2 <strcpy+0x2a>
    199a:	05a1                	add	a1,a1,8
    199c:	e118                	sd	a4,0(a0)
    199e:	6198                	ld	a4,0(a1)
    19a0:	0521                	add	a0,a0,8
    19a2:	00c707b3          	add	a5,a4,a2
    19a6:	fff74693          	not	a3,a4
    19aa:	8ff5                	and	a5,a5,a3
    19ac:	0107f7b3          	and	a5,a5,a6
    19b0:	d7ed                	beqz	a5,199a <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19b2:	0005c783          	lbu	a5,0(a1)
    19b6:	00f50023          	sb	a5,0(a0)
    19ba:	c785                	beqz	a5,19e2 <strcpy+0x6a>
    19bc:	0015c783          	lbu	a5,1(a1)
    19c0:	0505                	add	a0,a0,1
    19c2:	0585                	add	a1,a1,1
    19c4:	00f50023          	sb	a5,0(a0)
    19c8:	fbf5                	bnez	a5,19bc <strcpy+0x44>
        ;
    return d;
}
    19ca:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19cc:	0505                	add	a0,a0,1
    19ce:	df45                	beqz	a4,1986 <strcpy+0xe>
            if (!(*d = *s))
    19d0:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19d4:	0585                	add	a1,a1,1
    19d6:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19da:	00f50023          	sb	a5,0(a0)
    19de:	f7fd                	bnez	a5,19cc <strcpy+0x54>
}
    19e0:	8082                	ret
    19e2:	8082                	ret

00000000000019e4 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19e4:	00a5c7b3          	xor	a5,a1,a0
    19e8:	8b9d                	and	a5,a5,7
    19ea:	e3b5                	bnez	a5,1a4e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19ec:	0075f793          	and	a5,a1,7
    19f0:	cf99                	beqz	a5,1a0e <strncpy+0x2a>
    19f2:	ea09                	bnez	a2,1a04 <strncpy+0x20>
    19f4:	a421                	j	1bfc <strncpy+0x218>
    19f6:	0585                	add	a1,a1,1
    19f8:	0075f793          	and	a5,a1,7
    19fc:	167d                	add	a2,a2,-1
    19fe:	0505                	add	a0,a0,1
    1a00:	c799                	beqz	a5,1a0e <strncpy+0x2a>
    1a02:	c225                	beqz	a2,1a62 <strncpy+0x7e>
    1a04:	0005c783          	lbu	a5,0(a1)
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	f7ed                	bnez	a5,19f6 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a0e:	ca31                	beqz	a2,1a62 <strncpy+0x7e>
    1a10:	0005c783          	lbu	a5,0(a1)
    1a14:	cba1                	beqz	a5,1a64 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a16:	479d                	li	a5,7
    1a18:	02c7fc63          	bgeu	a5,a2,1a50 <strncpy+0x6c>
    1a1c:	00000897          	auipc	a7,0x0
    1a20:	5248b883          	ld	a7,1316(a7) # 1f40 <__clone+0xa6>
    1a24:	00000817          	auipc	a6,0x0
    1a28:	52483803          	ld	a6,1316(a6) # 1f48 <__clone+0xae>
    1a2c:	431d                	li	t1,7
    1a2e:	a039                	j	1a3c <strncpy+0x58>
            *wd = *ws;
    1a30:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a32:	1661                	add	a2,a2,-8
    1a34:	05a1                	add	a1,a1,8
    1a36:	0521                	add	a0,a0,8
    1a38:	00c37b63          	bgeu	t1,a2,1a4e <strncpy+0x6a>
    1a3c:	6198                	ld	a4,0(a1)
    1a3e:	011707b3          	add	a5,a4,a7
    1a42:	fff74693          	not	a3,a4
    1a46:	8ff5                	and	a5,a5,a3
    1a48:	0107f7b3          	and	a5,a5,a6
    1a4c:	d3f5                	beqz	a5,1a30 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a4e:	ca11                	beqz	a2,1a62 <strncpy+0x7e>
    1a50:	0005c783          	lbu	a5,0(a1)
    1a54:	0585                	add	a1,a1,1
    1a56:	00f50023          	sb	a5,0(a0)
    1a5a:	c789                	beqz	a5,1a64 <strncpy+0x80>
    1a5c:	167d                	add	a2,a2,-1
    1a5e:	0505                	add	a0,a0,1
    1a60:	fa65                	bnez	a2,1a50 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a62:	8082                	ret
    1a64:	4805                	li	a6,1
    1a66:	14061b63          	bnez	a2,1bbc <strncpy+0x1d8>
    1a6a:	40a00733          	neg	a4,a0
    1a6e:	00777793          	and	a5,a4,7
    1a72:	4581                	li	a1,0
    1a74:	12061c63          	bnez	a2,1bac <strncpy+0x1c8>
    1a78:	00778693          	add	a3,a5,7
    1a7c:	48ad                	li	a7,11
    1a7e:	1316e563          	bltu	a3,a7,1ba8 <strncpy+0x1c4>
    1a82:	16d5e263          	bltu	a1,a3,1be6 <strncpy+0x202>
    1a86:	14078c63          	beqz	a5,1bde <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a8a:	00050023          	sb	zero,0(a0)
    1a8e:	00677693          	and	a3,a4,6
    1a92:	14068263          	beqz	a3,1bd6 <strncpy+0x1f2>
    1a96:	000500a3          	sb	zero,1(a0)
    1a9a:	4689                	li	a3,2
    1a9c:	14f6f863          	bgeu	a3,a5,1bec <strncpy+0x208>
    1aa0:	00050123          	sb	zero,2(a0)
    1aa4:	8b11                	and	a4,a4,4
    1aa6:	12070463          	beqz	a4,1bce <strncpy+0x1ea>
    1aaa:	000501a3          	sb	zero,3(a0)
    1aae:	4711                	li	a4,4
    1ab0:	00450693          	add	a3,a0,4
    1ab4:	02f77563          	bgeu	a4,a5,1ade <strncpy+0xfa>
    1ab8:	00050223          	sb	zero,4(a0)
    1abc:	4715                	li	a4,5
    1abe:	00550693          	add	a3,a0,5
    1ac2:	00e78e63          	beq	a5,a4,1ade <strncpy+0xfa>
    1ac6:	fff50713          	add	a4,a0,-1
    1aca:	000502a3          	sb	zero,5(a0)
    1ace:	8b1d                	and	a4,a4,7
    1ad0:	12071263          	bnez	a4,1bf4 <strncpy+0x210>
    1ad4:	00750693          	add	a3,a0,7
    1ad8:	00050323          	sb	zero,6(a0)
    1adc:	471d                	li	a4,7
    1ade:	40f80833          	sub	a6,a6,a5
    1ae2:	ff887593          	and	a1,a6,-8
    1ae6:	97aa                	add	a5,a5,a0
    1ae8:	95be                	add	a1,a1,a5
    1aea:	0007b023          	sd	zero,0(a5)
    1aee:	07a1                	add	a5,a5,8
    1af0:	feb79de3          	bne	a5,a1,1aea <strncpy+0x106>
    1af4:	ff887593          	and	a1,a6,-8
    1af8:	00787813          	and	a6,a6,7
    1afc:	00e587bb          	addw	a5,a1,a4
    1b00:	00b68733          	add	a4,a3,a1
    1b04:	0e080063          	beqz	a6,1be4 <strncpy+0x200>
    1b08:	00070023          	sb	zero,0(a4)
    1b0c:	0017869b          	addw	a3,a5,1
    1b10:	f4c6f9e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b14:	000700a3          	sb	zero,1(a4)
    1b18:	0027869b          	addw	a3,a5,2
    1b1c:	f4c6f3e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b20:	00070123          	sb	zero,2(a4)
    1b24:	0037869b          	addw	a3,a5,3
    1b28:	f2c6fde3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b2c:	000701a3          	sb	zero,3(a4)
    1b30:	0047869b          	addw	a3,a5,4
    1b34:	f2c6f7e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b38:	00070223          	sb	zero,4(a4)
    1b3c:	0057869b          	addw	a3,a5,5
    1b40:	f2c6f1e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b44:	000702a3          	sb	zero,5(a4)
    1b48:	0067869b          	addw	a3,a5,6
    1b4c:	f0c6fbe3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b50:	00070323          	sb	zero,6(a4)
    1b54:	0077869b          	addw	a3,a5,7
    1b58:	f0c6f5e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b5c:	000703a3          	sb	zero,7(a4)
    1b60:	0087869b          	addw	a3,a5,8
    1b64:	eec6ffe3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b68:	00070423          	sb	zero,8(a4)
    1b6c:	0097869b          	addw	a3,a5,9
    1b70:	eec6f9e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b74:	000704a3          	sb	zero,9(a4)
    1b78:	00a7869b          	addw	a3,a5,10
    1b7c:	eec6f3e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b80:	00070523          	sb	zero,10(a4)
    1b84:	00b7869b          	addw	a3,a5,11
    1b88:	ecc6fde3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b8c:	000705a3          	sb	zero,11(a4)
    1b90:	00c7869b          	addw	a3,a5,12
    1b94:	ecc6f7e3          	bgeu	a3,a2,1a62 <strncpy+0x7e>
    1b98:	00070623          	sb	zero,12(a4)
    1b9c:	27b5                	addw	a5,a5,13
    1b9e:	ecc7f2e3          	bgeu	a5,a2,1a62 <strncpy+0x7e>
    1ba2:	000706a3          	sb	zero,13(a4)
}
    1ba6:	8082                	ret
    1ba8:	46ad                	li	a3,11
    1baa:	bde1                	j	1a82 <strncpy+0x9e>
    1bac:	00778693          	add	a3,a5,7
    1bb0:	48ad                	li	a7,11
    1bb2:	fff60593          	add	a1,a2,-1
    1bb6:	ed16f6e3          	bgeu	a3,a7,1a82 <strncpy+0x9e>
    1bba:	b7fd                	j	1ba8 <strncpy+0x1c4>
    1bbc:	40a00733          	neg	a4,a0
    1bc0:	8832                	mv	a6,a2
    1bc2:	00777793          	and	a5,a4,7
    1bc6:	4581                	li	a1,0
    1bc8:	ea0608e3          	beqz	a2,1a78 <strncpy+0x94>
    1bcc:	b7c5                	j	1bac <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bce:	00350693          	add	a3,a0,3
    1bd2:	470d                	li	a4,3
    1bd4:	b729                	j	1ade <strncpy+0xfa>
    1bd6:	00150693          	add	a3,a0,1
    1bda:	4705                	li	a4,1
    1bdc:	b709                	j	1ade <strncpy+0xfa>
tail:
    1bde:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	4701                	li	a4,0
    1be2:	bdf5                	j	1ade <strncpy+0xfa>
    1be4:	8082                	ret
tail:
    1be6:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be8:	4781                	li	a5,0
    1bea:	bf39                	j	1b08 <strncpy+0x124>
    1bec:	00250693          	add	a3,a0,2
    1bf0:	4709                	li	a4,2
    1bf2:	b5f5                	j	1ade <strncpy+0xfa>
    1bf4:	00650693          	add	a3,a0,6
    1bf8:	4719                	li	a4,6
    1bfa:	b5d5                	j	1ade <strncpy+0xfa>
    1bfc:	8082                	ret

0000000000001bfe <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bfe:	87aa                	mv	a5,a0
    1c00:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c02:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c06:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c0a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c0c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c0e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c12:	2501                	sext.w	a0,a0
    1c14:	8082                	ret

0000000000001c16 <openat>:
    register long a7 __asm__("a7") = n;
    1c16:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c1a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c22:	2501                	sext.w	a0,a0
    1c24:	8082                	ret

0000000000001c26 <close>:
    register long a7 __asm__("a7") = n;
    1c26:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c2a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c2e:	2501                	sext.w	a0,a0
    1c30:	8082                	ret

0000000000001c32 <read>:
    register long a7 __asm__("a7") = n;
    1c32:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c36:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c3a:	8082                	ret

0000000000001c3c <write>:
    register long a7 __asm__("a7") = n;
    1c3c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c40:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c44:	8082                	ret

0000000000001c46 <getpid>:
    register long a7 __asm__("a7") = n;
    1c46:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c4a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <getppid>:
    register long a7 __asm__("a7") = n;
    1c52:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c56:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c5e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c62:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <fork>:
    register long a7 __asm__("a7") = n;
    1c6a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c6e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c72:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c7a:	85b2                	mv	a1,a2
    1c7c:	863a                	mv	a2,a4
    if (stack)
    1c7e:	c191                	beqz	a1,1c82 <clone+0x8>
	stack += stack_size;
    1c80:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c82:	4781                	li	a5,0
    1c84:	4701                	li	a4,0
    1c86:	4681                	li	a3,0
    1c88:	2601                	sext.w	a2,a2
    1c8a:	ac01                	j	1e9a <__clone>

0000000000001c8c <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c8c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c90:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c94:	8082                	ret

0000000000001c96 <exit>:
    register long a7 __asm__("a7") = n;
    1c96:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c9a:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c9e:	8082                	ret

0000000000001ca0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ca0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ca4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <exec>:
    register long a7 __asm__("a7") = n;
    1cae:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <execve>:
    register long a7 __asm__("a7") = n;
    1cba:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbe:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <times>:
    register long a7 __asm__("a7") = n;
    1cc6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <get_time>:

int64 get_time()
{
    1cd2:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cd4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cd8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cda:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cdc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	ed09                	bnez	a0,1cfc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ce4:	67a2                	ld	a5,8(sp)
    1ce6:	3e800713          	li	a4,1000
    1cea:	00015503          	lhu	a0,0(sp)
    1cee:	02e7d7b3          	divu	a5,a5,a4
    1cf2:	02e50533          	mul	a0,a0,a4
    1cf6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cf8:	0141                	add	sp,sp,16
    1cfa:	8082                	ret
        return -1;
    1cfc:	557d                	li	a0,-1
    1cfe:	bfed                	j	1cf8 <get_time+0x26>

0000000000001d00 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d00:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d04:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <time>:
    register long a7 __asm__("a7") = n;
    1d0c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d10:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <sleep>:

int sleep(unsigned long long time)
{
    1d18:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d1a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d1c:	850a                	mv	a0,sp
    1d1e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d20:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d24:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d26:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d2a:	e501                	bnez	a0,1d32 <sleep+0x1a>
    return 0;
    1d2c:	4501                	li	a0,0
}
    1d2e:	0141                	add	sp,sp,16
    1d30:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d32:	4502                	lw	a0,0(sp)
}
    1d34:	0141                	add	sp,sp,16
    1d36:	8082                	ret

0000000000001d38 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d38:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d3c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d44:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d48:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d4c:	8082                	ret

0000000000001d4e <mprotect>:
    register long a7 __asm__("a7") = n;
    1d4e:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d52:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <munmap>:
    register long a7 __asm__("a7") = n;
    1d5a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <wait>:

int wait(int *code)
{
    1d66:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d68:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d6c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d6e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d70:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d72:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <spawn>:
    register long a7 __asm__("a7") = n;
    1d7a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d7e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <mailread>:
    register long a7 __asm__("a7") = n;
    1d86:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d92:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d96:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <fstat>:
    register long a7 __asm__("a7") = n;
    1d9e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1daa:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dac:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1db0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db2:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dba:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dbc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dc0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dca:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dcc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dd0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <link>:

int link(char *old_path, char *new_path)
{
    1dda:	87aa                	mv	a5,a0
    1ddc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dde:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1de2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dec:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dee:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <unlink>:

int unlink(char *path)
{
    1df6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dfc:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e00:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e02:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <uname>:
    register long a7 __asm__("a7") = n;
    1e0a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <brk>:
    register long a7 __asm__("a7") = n;
    1e16:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e1a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e22:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e24:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e28:	8082                	ret

0000000000001e2a <chdir>:
    register long a7 __asm__("a7") = n;
    1e2a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e36:	862e                	mv	a2,a1
    1e38:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e3a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e46:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e48:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <getdents>:
    register long a7 __asm__("a7") = n;
    1e50:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e54:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <pipe>:
    register long a7 __asm__("a7") = n;
    1e5c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e60:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e62:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <dup>:
    register long a7 __asm__("a7") = n;
    1e6a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e6c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <dup2>:
    register long a7 __asm__("a7") = n;
    1e74:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e76:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e78:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <mount>:
    register long a7 __asm__("a7") = n;
    1e80:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e84:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <umount>:
    register long a7 __asm__("a7") = n;
    1e8c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e9a:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e9c:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e9e:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ea0:	8532                	mv	a0,a2
	mv a2, a4
    1ea2:	863a                	mv	a2,a4
	mv a3, a5
    1ea4:	86be                	mv	a3,a5
	mv a4, a6
    1ea6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea8:	0dc00893          	li	a7,220
	ecall
    1eac:	00000073          	ecall

	beqz a0, 1f
    1eb0:	c111                	beqz	a0,1eb4 <__clone+0x1a>
	# Parent
	ret
    1eb2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eb4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eb6:	6522                	ld	a0,8(sp)
	jalr a1
    1eb8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eba:	05d00893          	li	a7,93
	ecall
    1ebe:	00000073          	ecall
