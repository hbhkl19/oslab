
/home/hbh/oslab/oslab/user/build/riscv64/close:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a865                	j	10ba <__start_main>

0000000000001004 <test_close>:
 * "  close success."
 * 测试失败则输出：
 * "  close error."
 */

void test_close(void) {
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	add	a0,a0,-278 # 1ef0 <__clone+0x28>
void test_close(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	300000ef          	jal	1312 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f8a50513          	add	a0,a0,-118 # 1fa0 <__func__.0>
    101e:	2f4000ef          	jal	1312 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ee650513          	add	a0,a0,-282 # 1f08 <__clone+0x40>
    102a:	2e8000ef          	jal	1312 <puts>
    int fd = open("test_close.txt", O_CREATE | O_RDWR);
    102e:	04200593          	li	a1,66
    1032:	00001517          	auipc	a0,0x1
    1036:	ee650513          	add	a0,a0,-282 # 1f18 <__clone+0x50>
    103a:	3f3000ef          	jal	1c2c <open>
    103e:	842a                	mv	s0,a0
    //assert(fd > 0);
    const char *str = "  close error.\n";
    int str_len = strlen(str);
    1040:	00001517          	auipc	a0,0x1
    1044:	ee850513          	add	a0,a0,-280 # 1f28 <__clone+0x60>
    1048:	047000ef          	jal	188e <strlen>
    //assert(write(fd, str, str_len) == str_len);
    write(fd, str, str_len);
    104c:	0005061b          	sext.w	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	ed858593          	add	a1,a1,-296 # 1f28 <__clone+0x60>
    1058:	8522                	mv	a0,s0
    105a:	411000ef          	jal	1c6a <write>
    int rt = close(fd);	
    105e:	8522                	mv	a0,s0
    1060:	3f5000ef          	jal	1c54 <close>
    assert(rt == 0);
    1064:	ed05                	bnez	a0,109c <test_close+0x98>
    printf("  close %d success.\n", fd);
    1066:	85a2                	mv	a1,s0
    1068:	00001517          	auipc	a0,0x1
    106c:	ef050513          	add	a0,a0,-272 # 1f58 <__clone+0x90>
    1070:	2c4000ef          	jal	1334 <printf>
	
    TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	efc50513          	add	a0,a0,-260 # 1f70 <__clone+0xa8>
    107c:	296000ef          	jal	1312 <puts>
    1080:	00001517          	auipc	a0,0x1
    1084:	f2050513          	add	a0,a0,-224 # 1fa0 <__func__.0>
    1088:	28a000ef          	jal	1312 <puts>
}
    108c:	6402                	ld	s0,0(sp)
    108e:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1090:	00001517          	auipc	a0,0x1
    1094:	e7850513          	add	a0,a0,-392 # 1f08 <__clone+0x40>
}
    1098:	0141                	add	sp,sp,16
    TEST_END(__func__);
    109a:	aca5                	j	1312 <puts>
    assert(rt == 0);
    109c:	00001517          	auipc	a0,0x1
    10a0:	e9c50513          	add	a0,a0,-356 # 1f38 <__clone+0x70>
    10a4:	50a000ef          	jal	15ae <panic>
    10a8:	bf7d                	j	1066 <test_close+0x62>

00000000000010aa <main>:

int main(void) {
    10aa:	1141                	add	sp,sp,-16
    10ac:	e406                	sd	ra,8(sp)
    test_close();
    10ae:	f57ff0ef          	jal	1004 <test_close>
    return 0;
}
    10b2:	60a2                	ld	ra,8(sp)
    10b4:	4501                	li	a0,0
    10b6:	0141                	add	sp,sp,16
    10b8:	8082                	ret

00000000000010ba <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ba:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10bc:	4108                	lw	a0,0(a0)
{
    10be:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10c0:	05a1                	add	a1,a1,8
{
    10c2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c4:	fe7ff0ef          	jal	10aa <main>
    10c8:	3fd000ef          	jal	1cc4 <exit>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	add	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d4:	7179                	add	sp,sp,-48
    10d6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d8:	12054863          	bltz	a0,1208 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10dc:	02b577bb          	remuw	a5,a0,a1
    10e0:	00001697          	auipc	a3,0x1
    10e4:	ed068693          	add	a3,a3,-304 # 1fb0 <digits>
    buf[16] = 0;
    10e8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ec:	0005871b          	sext.w	a4,a1
    10f0:	1782                	sll	a5,a5,0x20
    10f2:	9381                	srl	a5,a5,0x20
    10f4:	97b6                	add	a5,a5,a3
    10f6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10fa:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10fe:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1102:	1ab56663          	bltu	a0,a1,12ae <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1106:	02e8763b          	remuw	a2,a6,a4
    110a:	1602                	sll	a2,a2,0x20
    110c:	9201                	srl	a2,a2,0x20
    110e:	9636                	add	a2,a2,a3
    1110:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1114:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1118:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111c:	12e86c63          	bltu	a6,a4,1254 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1120:	02e5f63b          	remuw	a2,a1,a4
    1124:	1602                	sll	a2,a2,0x20
    1126:	9201                	srl	a2,a2,0x20
    1128:	9636                	add	a2,a2,a3
    112a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1132:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1136:	12e5e863          	bltu	a1,a4,1266 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    113a:	02e8763b          	remuw	a2,a6,a4
    113e:	1602                	sll	a2,a2,0x20
    1140:	9201                	srl	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1150:	12e86463          	bltu	a6,a4,1278 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    116a:	12e5e063          	bltu	a1,a4,128a <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    116e:	02e8763b          	remuw	a2,a6,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1180:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1184:	0ae86f63          	bltu	a6,a4,1242 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    119e:	0ee5ef63          	bltu	a1,a4,129c <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11a2:	02e8763b          	remuw	a2,a6,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b8:	0ee86d63          	bltu	a6,a4,12b2 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11bc:	02e5f63b          	remuw	a2,a1,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ce:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d2:	0ee5e963          	bltu	a1,a4,12c4 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11d6:	1782                	sll	a5,a5,0x20
    11d8:	9381                	srl	a5,a5,0x20
    11da:	96be                	add	a3,a3,a5
    11dc:	0006c783          	lbu	a5,0(a3)
    11e0:	4599                	li	a1,6
    11e2:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e6:	00055763          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11ea:	02d00793          	li	a5,45
    11ee:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11f2:	4595                	li	a1,5
    write(f, s, l);
    11f4:	003c                	add	a5,sp,8
    11f6:	4641                	li	a2,16
    11f8:	9e0d                	subw	a2,a2,a1
    11fa:	4505                	li	a0,1
    11fc:	95be                	add	a1,a1,a5
    11fe:	26d000ef          	jal	1c6a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1202:	70a2                	ld	ra,40(sp)
    1204:	6145                	add	sp,sp,48
    1206:	8082                	ret
        x = -xx;
    1208:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    120c:	02b677bb          	remuw	a5,a2,a1
    1210:	00001697          	auipc	a3,0x1
    1214:	da068693          	add	a3,a3,-608 # 1fb0 <digits>
    buf[16] = 0;
    1218:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    121c:	0005871b          	sext.w	a4,a1
    1220:	1782                	sll	a5,a5,0x20
    1222:	9381                	srl	a5,a5,0x20
    1224:	97b6                	add	a5,a5,a3
    1226:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1232:	ecb67ae3          	bgeu	a2,a1,1106 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1236:	02d00793          	li	a5,45
    123a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123e:	45b9                	li	a1,14
    1240:	bf55                	j	11f4 <printint.constprop.0+0x120>
    1242:	45a9                	li	a1,10
    if (sign)
    1244:	fa0558e3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1248:	02d00793          	li	a5,45
    124c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1250:	45a5                	li	a1,9
    1252:	b74d                	j	11f4 <printint.constprop.0+0x120>
    1254:	45b9                	li	a1,14
    if (sign)
    1256:	f8055fe3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125a:	02d00793          	li	a5,45
    125e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1262:	45b5                	li	a1,13
    1264:	bf41                	j	11f4 <printint.constprop.0+0x120>
    1266:	45b5                	li	a1,13
    if (sign)
    1268:	f80556e3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1274:	45b1                	li	a1,12
    1276:	bfbd                	j	11f4 <printint.constprop.0+0x120>
    1278:	45b1                	li	a1,12
    if (sign)
    127a:	f6055de3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1286:	45ad                	li	a1,11
    1288:	b7b5                	j	11f4 <printint.constprop.0+0x120>
    128a:	45ad                	li	a1,11
    if (sign)
    128c:	f60554e3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1290:	02d00793          	li	a5,45
    1294:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1298:	45a9                	li	a1,10
    129a:	bfa9                	j	11f4 <printint.constprop.0+0x120>
    129c:	45a5                	li	a1,9
    if (sign)
    129e:	f4055be3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12aa:	45a1                	li	a1,8
    12ac:	b7a1                	j	11f4 <printint.constprop.0+0x120>
    i = 15;
    12ae:	45bd                	li	a1,15
    12b0:	b791                	j	11f4 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12b2:	45a1                	li	a1,8
    if (sign)
    12b4:	f40550e3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12c0:	459d                	li	a1,7
    12c2:	bf0d                	j	11f4 <printint.constprop.0+0x120>
    12c4:	459d                	li	a1,7
    if (sign)
    12c6:	f20557e3          	bgez	a0,11f4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ca:	02d00793          	li	a5,45
    12ce:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12d2:	4599                	li	a1,6
    12d4:	b705                	j	11f4 <printint.constprop.0+0x120>

00000000000012d6 <getchar>:
{
    12d6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12d8:	00f10593          	add	a1,sp,15
    12dc:	4605                	li	a2,1
    12de:	4501                	li	a0,0
{
    12e0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12e2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e6:	17b000ef          	jal	1c60 <read>
}
    12ea:	60e2                	ld	ra,24(sp)
    12ec:	00f14503          	lbu	a0,15(sp)
    12f0:	6105                	add	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <putchar>:
{
    12f4:	1101                	add	sp,sp,-32
    12f6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12f8:	00f10593          	add	a1,sp,15
    12fc:	4605                	li	a2,1
    12fe:	4505                	li	a0,1
{
    1300:	ec06                	sd	ra,24(sp)
    char byte = c;
    1302:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1306:	165000ef          	jal	1c6a <write>
}
    130a:	60e2                	ld	ra,24(sp)
    130c:	2501                	sext.w	a0,a0
    130e:	6105                	add	sp,sp,32
    1310:	8082                	ret

0000000000001312 <puts>:
{
    1312:	1141                	add	sp,sp,-16
    1314:	e406                	sd	ra,8(sp)
    1316:	e022                	sd	s0,0(sp)
    1318:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    131a:	574000ef          	jal	188e <strlen>
    131e:	862a                	mv	a2,a0
    1320:	85a2                	mv	a1,s0
    1322:	4505                	li	a0,1
    1324:	147000ef          	jal	1c6a <write>
}
    1328:	60a2                	ld	ra,8(sp)
    132a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    132c:	957d                	sra	a0,a0,0x3f
    return r;
    132e:	2501                	sext.w	a0,a0
}
    1330:	0141                	add	sp,sp,16
    1332:	8082                	ret

0000000000001334 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1334:	7171                	add	sp,sp,-176
    1336:	f85a                	sd	s6,48(sp)
    1338:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    133a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    133c:	18bc                	add	a5,sp,120
{
    133e:	e8ca                	sd	s2,80(sp)
    1340:	e4ce                	sd	s3,72(sp)
    1342:	e0d2                	sd	s4,64(sp)
    1344:	fc56                	sd	s5,56(sp)
    1346:	f486                	sd	ra,104(sp)
    1348:	f0a2                	sd	s0,96(sp)
    134a:	eca6                	sd	s1,88(sp)
    134c:	fcae                	sd	a1,120(sp)
    134e:	e132                	sd	a2,128(sp)
    1350:	e536                	sd	a3,136(sp)
    1352:	e93a                	sd	a4,144(sp)
    1354:	f142                	sd	a6,160(sp)
    1356:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1358:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    135a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    135e:	07300a13          	li	s4,115
    1362:	07800a93          	li	s5,120
    buf[i++] = '0';
    1366:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    136a:	00001997          	auipc	s3,0x1
    136e:	c4698993          	add	s3,s3,-954 # 1fb0 <digits>
        if (!*s)
    1372:	00054783          	lbu	a5,0(a0)
    1376:	16078a63          	beqz	a5,14ea <printf+0x1b6>
    137a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    137c:	19278d63          	beq	a5,s2,1516 <printf+0x1e2>
    1380:	00164783          	lbu	a5,1(a2)
    1384:	0605                	add	a2,a2,1
    1386:	fbfd                	bnez	a5,137c <printf+0x48>
    1388:	84b2                	mv	s1,a2
        l = z - a;
    138a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    138e:	85aa                	mv	a1,a0
    1390:	8622                	mv	a2,s0
    1392:	4505                	li	a0,1
    1394:	0d7000ef          	jal	1c6a <write>
        if (l)
    1398:	1a041463          	bnez	s0,1540 <printf+0x20c>
        if (s[1] == 0)
    139c:	0014c783          	lbu	a5,1(s1)
    13a0:	14078563          	beqz	a5,14ea <printf+0x1b6>
        switch (s[1])
    13a4:	1b478063          	beq	a5,s4,1544 <printf+0x210>
    13a8:	14fa6b63          	bltu	s4,a5,14fe <printf+0x1ca>
    13ac:	06400713          	li	a4,100
    13b0:	1ee78063          	beq	a5,a4,1590 <printf+0x25c>
    13b4:	07000713          	li	a4,112
    13b8:	1ae79963          	bne	a5,a4,156a <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13bc:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13be:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13c2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c4:	631c                	ld	a5,0(a4)
    13c6:	0721                	add	a4,a4,8
    13c8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ca:	00479293          	sll	t0,a5,0x4
    13ce:	00879f93          	sll	t6,a5,0x8
    13d2:	00c79f13          	sll	t5,a5,0xc
    13d6:	01079e93          	sll	t4,a5,0x10
    13da:	01479e13          	sll	t3,a5,0x14
    13de:	01879313          	sll	t1,a5,0x18
    13e2:	01c79893          	sll	a7,a5,0x1c
    13e6:	02479813          	sll	a6,a5,0x24
    13ea:	02879513          	sll	a0,a5,0x28
    13ee:	02c79593          	sll	a1,a5,0x2c
    13f2:	03079693          	sll	a3,a5,0x30
    13f6:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fa:	03c7d413          	srl	s0,a5,0x3c
    13fe:	01c7d39b          	srlw	t2,a5,0x1c
    1402:	03c2d293          	srl	t0,t0,0x3c
    1406:	03cfdf93          	srl	t6,t6,0x3c
    140a:	03cf5f13          	srl	t5,t5,0x3c
    140e:	03cede93          	srl	t4,t4,0x3c
    1412:	03ce5e13          	srl	t3,t3,0x3c
    1416:	03c35313          	srl	t1,t1,0x3c
    141a:	03c8d893          	srl	a7,a7,0x3c
    141e:	03c85813          	srl	a6,a6,0x3c
    1422:	9171                	srl	a0,a0,0x3c
    1424:	91f1                	srl	a1,a1,0x3c
    1426:	92f1                	srl	a3,a3,0x3c
    1428:	9371                	srl	a4,a4,0x3c
    142a:	96ce                	add	a3,a3,s3
    142c:	974e                	add	a4,a4,s3
    142e:	944e                	add	s0,s0,s3
    1430:	92ce                	add	t0,t0,s3
    1432:	9fce                	add	t6,t6,s3
    1434:	9f4e                	add	t5,t5,s3
    1436:	9ece                	add	t4,t4,s3
    1438:	9e4e                	add	t3,t3,s3
    143a:	934e                	add	t1,t1,s3
    143c:	98ce                	add	a7,a7,s3
    143e:	93ce                	add	t2,t2,s3
    1440:	984e                	add	a6,a6,s3
    1442:	954e                	add	a0,a0,s3
    1444:	95ce                	add	a1,a1,s3
    1446:	0006c083          	lbu	ra,0(a3)
    144a:	0002c283          	lbu	t0,0(t0)
    144e:	00074683          	lbu	a3,0(a4)
    1452:	000fcf83          	lbu	t6,0(t6)
    1456:	000f4f03          	lbu	t5,0(t5)
    145a:	000ece83          	lbu	t4,0(t4)
    145e:	000e4e03          	lbu	t3,0(t3)
    1462:	00034303          	lbu	t1,0(t1)
    1466:	0008c883          	lbu	a7,0(a7)
    146a:	0003c383          	lbu	t2,0(t2)
    146e:	00084803          	lbu	a6,0(a6)
    1472:	00054503          	lbu	a0,0(a0)
    1476:	0005c583          	lbu	a1,0(a1)
    147a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1482:	9371                	srl	a4,a4,0x3c
    1484:	8bbd                	and	a5,a5,15
    1486:	974e                	add	a4,a4,s3
    1488:	97ce                	add	a5,a5,s3
    148a:	005105a3          	sb	t0,11(sp)
    148e:	01f10623          	sb	t6,12(sp)
    1492:	01e106a3          	sb	t5,13(sp)
    1496:	01d10723          	sb	t4,14(sp)
    149a:	01c107a3          	sb	t3,15(sp)
    149e:	00610823          	sb	t1,16(sp)
    14a2:	011108a3          	sb	a7,17(sp)
    14a6:	00710923          	sb	t2,18(sp)
    14aa:	010109a3          	sb	a6,19(sp)
    14ae:	00a10a23          	sb	a0,20(sp)
    14b2:	00b10aa3          	sb	a1,21(sp)
    14b6:	00110b23          	sb	ra,22(sp)
    14ba:	00d10ba3          	sb	a3,23(sp)
    14be:	00810523          	sb	s0,10(sp)
    14c2:	00074703          	lbu	a4,0(a4)
    14c6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ca:	002c                	add	a1,sp,8
    14cc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ce:	00e10c23          	sb	a4,24(sp)
    14d2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14da:	790000ef          	jal	1c6a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14de:	00248513          	add	a0,s1,2
        if (!*s)
    14e2:	00054783          	lbu	a5,0(a0)
    14e6:	e8079ae3          	bnez	a5,137a <printf+0x46>
    }
    va_end(ap);
}
    14ea:	70a6                	ld	ra,104(sp)
    14ec:	7406                	ld	s0,96(sp)
    14ee:	64e6                	ld	s1,88(sp)
    14f0:	6946                	ld	s2,80(sp)
    14f2:	69a6                	ld	s3,72(sp)
    14f4:	6a06                	ld	s4,64(sp)
    14f6:	7ae2                	ld	s5,56(sp)
    14f8:	7b42                	ld	s6,48(sp)
    14fa:	614d                	add	sp,sp,176
    14fc:	8082                	ret
        switch (s[1])
    14fe:	07579663          	bne	a5,s5,156a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1502:	6782                	ld	a5,0(sp)
    1504:	45c1                	li	a1,16
    1506:	4388                	lw	a0,0(a5)
    1508:	07a1                	add	a5,a5,8
    150a:	e03e                	sd	a5,0(sp)
    150c:	bc9ff0ef          	jal	10d4 <printint.constprop.0>
        s += 2;
    1510:	00248513          	add	a0,s1,2
    1514:	b7f9                	j	14e2 <printf+0x1ae>
    1516:	84b2                	mv	s1,a2
    1518:	a039                	j	1526 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    151a:	0024c783          	lbu	a5,2(s1)
    151e:	0605                	add	a2,a2,1
    1520:	0489                	add	s1,s1,2
    1522:	e72794e3          	bne	a5,s2,138a <printf+0x56>
    1526:	0014c783          	lbu	a5,1(s1)
    152a:	ff2788e3          	beq	a5,s2,151a <printf+0x1e6>
        l = z - a;
    152e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1532:	85aa                	mv	a1,a0
    1534:	8622                	mv	a2,s0
    1536:	4505                	li	a0,1
    1538:	732000ef          	jal	1c6a <write>
        if (l)
    153c:	e60400e3          	beqz	s0,139c <printf+0x68>
    1540:	8526                	mv	a0,s1
    1542:	bd05                	j	1372 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1544:	6782                	ld	a5,0(sp)
    1546:	6380                	ld	s0,0(a5)
    1548:	07a1                	add	a5,a5,8
    154a:	e03e                	sd	a5,0(sp)
    154c:	cc21                	beqz	s0,15a4 <printf+0x270>
            l = strnlen(a, 200);
    154e:	0c800593          	li	a1,200
    1552:	8522                	mv	a0,s0
    1554:	424000ef          	jal	1978 <strnlen>
    write(f, s, l);
    1558:	0005061b          	sext.w	a2,a0
    155c:	85a2                	mv	a1,s0
    155e:	4505                	li	a0,1
    1560:	70a000ef          	jal	1c6a <write>
        s += 2;
    1564:	00248513          	add	a0,s1,2
    1568:	bfad                	j	14e2 <printf+0x1ae>
    return write(stdout, &byte, 1);
    156a:	4605                	li	a2,1
    156c:	002c                	add	a1,sp,8
    156e:	4505                	li	a0,1
    char byte = c;
    1570:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1574:	6f6000ef          	jal	1c6a <write>
    char byte = c;
    1578:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157c:	4605                	li	a2,1
    157e:	002c                	add	a1,sp,8
    1580:	4505                	li	a0,1
    char byte = c;
    1582:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1586:	6e4000ef          	jal	1c6a <write>
        s += 2;
    158a:	00248513          	add	a0,s1,2
    158e:	bf91                	j	14e2 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1590:	6782                	ld	a5,0(sp)
    1592:	45a9                	li	a1,10
    1594:	4388                	lw	a0,0(a5)
    1596:	07a1                	add	a5,a5,8
    1598:	e03e                	sd	a5,0(sp)
    159a:	b3bff0ef          	jal	10d4 <printint.constprop.0>
        s += 2;
    159e:	00248513          	add	a0,s1,2
    15a2:	b781                	j	14e2 <printf+0x1ae>
                a = "(null)";
    15a4:	00001417          	auipc	s0,0x1
    15a8:	9dc40413          	add	s0,s0,-1572 # 1f80 <__clone+0xb8>
    15ac:	b74d                	j	154e <printf+0x21a>

00000000000015ae <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ae:	1141                	add	sp,sp,-16
    15b0:	e406                	sd	ra,8(sp)
    puts(m);
    15b2:	d61ff0ef          	jal	1312 <puts>
    exit(-100);
}
    15b6:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b8:	f9c00513          	li	a0,-100
}
    15bc:	0141                	add	sp,sp,16
    exit(-100);
    15be:	a719                	j	1cc4 <exit>

00000000000015c0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c0:	02000793          	li	a5,32
    15c4:	00f50663          	beq	a0,a5,15d0 <isspace+0x10>
    15c8:	355d                	addw	a0,a0,-9
    15ca:	00553513          	sltiu	a0,a0,5
    15ce:	8082                	ret
    15d0:	4505                	li	a0,1
}
    15d2:	8082                	ret

00000000000015d4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d4:	fd05051b          	addw	a0,a0,-48
}
    15d8:	00a53513          	sltiu	a0,a0,10
    15dc:	8082                	ret

00000000000015de <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15de:	02000693          	li	a3,32
    15e2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e8:	ff77871b          	addw	a4,a5,-9
    15ec:	04d78c63          	beq	a5,a3,1644 <atoi+0x66>
    15f0:	0007861b          	sext.w	a2,a5
    15f4:	04e5f863          	bgeu	a1,a4,1644 <atoi+0x66>
        s++;
    switch (*s)
    15f8:	02b00713          	li	a4,43
    15fc:	04e78963          	beq	a5,a4,164e <atoi+0x70>
    1600:	02d00713          	li	a4,45
    1604:	06e78263          	beq	a5,a4,1668 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1608:	fd06069b          	addw	a3,a2,-48
    160c:	47a5                	li	a5,9
    160e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1610:	4301                	li	t1,0
    while (isdigit(*s))
    1612:	04d7e963          	bltu	a5,a3,1664 <atoi+0x86>
    int n = 0, neg = 0;
    1616:	4501                	li	a0,0
    while (isdigit(*s))
    1618:	48a5                	li	a7,9
    161a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    161e:	0025179b          	sllw	a5,a0,0x2
    1622:	9fa9                	addw	a5,a5,a0
    1624:	fd06059b          	addw	a1,a2,-48
    1628:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    162c:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1630:	0705                	add	a4,a4,1
    1632:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1636:	0006861b          	sext.w	a2,a3
    163a:	ff08f0e3          	bgeu	a7,a6,161a <atoi+0x3c>
    return neg ? n : -n;
    163e:	00030563          	beqz	t1,1648 <atoi+0x6a>
}
    1642:	8082                	ret
        s++;
    1644:	0505                	add	a0,a0,1
    1646:	bf79                	j	15e4 <atoi+0x6>
    return neg ? n : -n;
    1648:	40f5853b          	subw	a0,a1,a5
    164c:	8082                	ret
    while (isdigit(*s))
    164e:	00154603          	lbu	a2,1(a0)
    1652:	47a5                	li	a5,9
        s++;
    1654:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1658:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    165c:	4301                	li	t1,0
    while (isdigit(*s))
    165e:	2601                	sext.w	a2,a2
    1660:	fad7fbe3          	bgeu	a5,a3,1616 <atoi+0x38>
    1664:	4501                	li	a0,0
}
    1666:	8082                	ret
    while (isdigit(*s))
    1668:	00154603          	lbu	a2,1(a0)
    166c:	47a5                	li	a5,9
        s++;
    166e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1672:	fd06069b          	addw	a3,a2,-48
    1676:	2601                	sext.w	a2,a2
    1678:	fed7e6e3          	bltu	a5,a3,1664 <atoi+0x86>
        neg = 1;
    167c:	4305                	li	t1,1
    167e:	bf61                	j	1616 <atoi+0x38>

0000000000001680 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1680:	18060163          	beqz	a2,1802 <memset+0x182>
    1684:	40a006b3          	neg	a3,a0
    1688:	0076f793          	and	a5,a3,7
    168c:	00778813          	add	a6,a5,7
    1690:	48ad                	li	a7,11
    1692:	0ff5f713          	zext.b	a4,a1
    1696:	fff60593          	add	a1,a2,-1
    169a:	17186563          	bltu	a6,a7,1804 <memset+0x184>
    169e:	1705ed63          	bltu	a1,a6,1818 <memset+0x198>
    16a2:	16078363          	beqz	a5,1808 <memset+0x188>
    16a6:	00e50023          	sb	a4,0(a0)
    16aa:	0066f593          	and	a1,a3,6
    16ae:	16058063          	beqz	a1,180e <memset+0x18e>
    16b2:	00e500a3          	sb	a4,1(a0)
    16b6:	4589                	li	a1,2
    16b8:	16f5f363          	bgeu	a1,a5,181e <memset+0x19e>
    16bc:	00e50123          	sb	a4,2(a0)
    16c0:	8a91                	and	a3,a3,4
    16c2:	00350593          	add	a1,a0,3
    16c6:	4e0d                	li	t3,3
    16c8:	ce9d                	beqz	a3,1706 <memset+0x86>
    16ca:	00e501a3          	sb	a4,3(a0)
    16ce:	4691                	li	a3,4
    16d0:	00450593          	add	a1,a0,4
    16d4:	4e11                	li	t3,4
    16d6:	02f6f863          	bgeu	a3,a5,1706 <memset+0x86>
    16da:	00e50223          	sb	a4,4(a0)
    16de:	4695                	li	a3,5
    16e0:	00550593          	add	a1,a0,5
    16e4:	4e15                	li	t3,5
    16e6:	02d78063          	beq	a5,a3,1706 <memset+0x86>
    16ea:	fff50693          	add	a3,a0,-1
    16ee:	00e502a3          	sb	a4,5(a0)
    16f2:	8a9d                	and	a3,a3,7
    16f4:	00650593          	add	a1,a0,6
    16f8:	4e19                	li	t3,6
    16fa:	e691                	bnez	a3,1706 <memset+0x86>
    16fc:	00750593          	add	a1,a0,7
    1700:	00e50323          	sb	a4,6(a0)
    1704:	4e1d                	li	t3,7
    1706:	00871693          	sll	a3,a4,0x8
    170a:	01071813          	sll	a6,a4,0x10
    170e:	8ed9                	or	a3,a3,a4
    1710:	01871893          	sll	a7,a4,0x18
    1714:	0106e6b3          	or	a3,a3,a6
    1718:	0116e6b3          	or	a3,a3,a7
    171c:	02071813          	sll	a6,a4,0x20
    1720:	02871313          	sll	t1,a4,0x28
    1724:	0106e6b3          	or	a3,a3,a6
    1728:	40f608b3          	sub	a7,a2,a5
    172c:	03071813          	sll	a6,a4,0x30
    1730:	0066e6b3          	or	a3,a3,t1
    1734:	0106e6b3          	or	a3,a3,a6
    1738:	03871313          	sll	t1,a4,0x38
    173c:	97aa                	add	a5,a5,a0
    173e:	ff88f813          	and	a6,a7,-8
    1742:	0066e6b3          	or	a3,a3,t1
    1746:	983e                	add	a6,a6,a5
    1748:	e394                	sd	a3,0(a5)
    174a:	07a1                	add	a5,a5,8
    174c:	ff079ee3          	bne	a5,a6,1748 <memset+0xc8>
    1750:	ff88f793          	and	a5,a7,-8
    1754:	0078f893          	and	a7,a7,7
    1758:	00f586b3          	add	a3,a1,a5
    175c:	01c787bb          	addw	a5,a5,t3
    1760:	0a088b63          	beqz	a7,1816 <memset+0x196>
    1764:	00e68023          	sb	a4,0(a3)
    1768:	0017859b          	addw	a1,a5,1
    176c:	08c5fb63          	bgeu	a1,a2,1802 <memset+0x182>
    1770:	00e680a3          	sb	a4,1(a3)
    1774:	0027859b          	addw	a1,a5,2
    1778:	08c5f563          	bgeu	a1,a2,1802 <memset+0x182>
    177c:	00e68123          	sb	a4,2(a3)
    1780:	0037859b          	addw	a1,a5,3
    1784:	06c5ff63          	bgeu	a1,a2,1802 <memset+0x182>
    1788:	00e681a3          	sb	a4,3(a3)
    178c:	0047859b          	addw	a1,a5,4
    1790:	06c5f963          	bgeu	a1,a2,1802 <memset+0x182>
    1794:	00e68223          	sb	a4,4(a3)
    1798:	0057859b          	addw	a1,a5,5
    179c:	06c5f363          	bgeu	a1,a2,1802 <memset+0x182>
    17a0:	00e682a3          	sb	a4,5(a3)
    17a4:	0067859b          	addw	a1,a5,6
    17a8:	04c5fd63          	bgeu	a1,a2,1802 <memset+0x182>
    17ac:	00e68323          	sb	a4,6(a3)
    17b0:	0077859b          	addw	a1,a5,7
    17b4:	04c5f763          	bgeu	a1,a2,1802 <memset+0x182>
    17b8:	00e683a3          	sb	a4,7(a3)
    17bc:	0087859b          	addw	a1,a5,8
    17c0:	04c5f163          	bgeu	a1,a2,1802 <memset+0x182>
    17c4:	00e68423          	sb	a4,8(a3)
    17c8:	0097859b          	addw	a1,a5,9
    17cc:	02c5fb63          	bgeu	a1,a2,1802 <memset+0x182>
    17d0:	00e684a3          	sb	a4,9(a3)
    17d4:	00a7859b          	addw	a1,a5,10
    17d8:	02c5f563          	bgeu	a1,a2,1802 <memset+0x182>
    17dc:	00e68523          	sb	a4,10(a3)
    17e0:	00b7859b          	addw	a1,a5,11
    17e4:	00c5ff63          	bgeu	a1,a2,1802 <memset+0x182>
    17e8:	00e685a3          	sb	a4,11(a3)
    17ec:	00c7859b          	addw	a1,a5,12
    17f0:	00c5f963          	bgeu	a1,a2,1802 <memset+0x182>
    17f4:	00e68623          	sb	a4,12(a3)
    17f8:	27b5                	addw	a5,a5,13
    17fa:	00c7f463          	bgeu	a5,a2,1802 <memset+0x182>
    17fe:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1802:	8082                	ret
    1804:	482d                	li	a6,11
    1806:	bd61                	j	169e <memset+0x1e>
    char *p = dest;
    1808:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180a:	4e01                	li	t3,0
    180c:	bded                	j	1706 <memset+0x86>
    180e:	00150593          	add	a1,a0,1
    1812:	4e05                	li	t3,1
    1814:	bdcd                	j	1706 <memset+0x86>
    1816:	8082                	ret
    char *p = dest;
    1818:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181a:	4781                	li	a5,0
    181c:	b7a1                	j	1764 <memset+0xe4>
    181e:	00250593          	add	a1,a0,2
    1822:	4e09                	li	t3,2
    1824:	b5cd                	j	1706 <memset+0x86>

0000000000001826 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1826:	00054783          	lbu	a5,0(a0)
    182a:	0005c703          	lbu	a4,0(a1)
    182e:	00e79863          	bne	a5,a4,183e <strcmp+0x18>
    1832:	0505                	add	a0,a0,1
    1834:	0585                	add	a1,a1,1
    1836:	fbe5                	bnez	a5,1826 <strcmp>
    1838:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    183a:	9d19                	subw	a0,a0,a4
    183c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    183e:	0007851b          	sext.w	a0,a5
    1842:	bfe5                	j	183a <strcmp+0x14>

0000000000001844 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1844:	ca15                	beqz	a2,1878 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1846:	00054783          	lbu	a5,0(a0)
    if (!n--)
    184a:	167d                	add	a2,a2,-1
    184c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1850:	eb99                	bnez	a5,1866 <strncmp+0x22>
    1852:	a815                	j	1886 <strncmp+0x42>
    1854:	00a68e63          	beq	a3,a0,1870 <strncmp+0x2c>
    1858:	0505                	add	a0,a0,1
    185a:	00f71b63          	bne	a4,a5,1870 <strncmp+0x2c>
    185e:	00054783          	lbu	a5,0(a0)
    1862:	cf89                	beqz	a5,187c <strncmp+0x38>
    1864:	85b2                	mv	a1,a2
    1866:	0005c703          	lbu	a4,0(a1)
    186a:	00158613          	add	a2,a1,1
    186e:	f37d                	bnez	a4,1854 <strncmp+0x10>
        ;
    return *l - *r;
    1870:	0007851b          	sext.w	a0,a5
    1874:	9d19                	subw	a0,a0,a4
    1876:	8082                	ret
        return 0;
    1878:	4501                	li	a0,0
}
    187a:	8082                	ret
    return *l - *r;
    187c:	0015c703          	lbu	a4,1(a1)
    1880:	4501                	li	a0,0
    1882:	9d19                	subw	a0,a0,a4
    1884:	8082                	ret
    1886:	0005c703          	lbu	a4,0(a1)
    188a:	4501                	li	a0,0
    188c:	b7e5                	j	1874 <strncmp+0x30>

000000000000188e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188e:	00757793          	and	a5,a0,7
    1892:	cf89                	beqz	a5,18ac <strlen+0x1e>
    1894:	87aa                	mv	a5,a0
    1896:	a029                	j	18a0 <strlen+0x12>
    1898:	0785                	add	a5,a5,1
    189a:	0077f713          	and	a4,a5,7
    189e:	cb01                	beqz	a4,18ae <strlen+0x20>
        if (!*s)
    18a0:	0007c703          	lbu	a4,0(a5)
    18a4:	fb75                	bnez	a4,1898 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a6:	40a78533          	sub	a0,a5,a0
}
    18aa:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ac:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ae:	6394                	ld	a3,0(a5)
    18b0:	00000597          	auipc	a1,0x0
    18b4:	6d85b583          	ld	a1,1752(a1) # 1f88 <__clone+0xc0>
    18b8:	00000617          	auipc	a2,0x0
    18bc:	6d863603          	ld	a2,1752(a2) # 1f90 <__clone+0xc8>
    18c0:	a019                	j	18c6 <strlen+0x38>
    18c2:	6794                	ld	a3,8(a5)
    18c4:	07a1                	add	a5,a5,8
    18c6:	00b68733          	add	a4,a3,a1
    18ca:	fff6c693          	not	a3,a3
    18ce:	8f75                	and	a4,a4,a3
    18d0:	8f71                	and	a4,a4,a2
    18d2:	db65                	beqz	a4,18c2 <strlen+0x34>
    for (; *s; s++)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	d779                	beqz	a4,18a6 <strlen+0x18>
    18da:	0017c703          	lbu	a4,1(a5)
    18de:	0785                	add	a5,a5,1
    18e0:	d379                	beqz	a4,18a6 <strlen+0x18>
    18e2:	0017c703          	lbu	a4,1(a5)
    18e6:	0785                	add	a5,a5,1
    18e8:	fb6d                	bnez	a4,18da <strlen+0x4c>
    18ea:	bf75                	j	18a6 <strlen+0x18>

00000000000018ec <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ec:	00757713          	and	a4,a0,7
{
    18f0:	87aa                	mv	a5,a0
    18f2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f6:	cb19                	beqz	a4,190c <memchr+0x20>
    18f8:	ce25                	beqz	a2,1970 <memchr+0x84>
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	00b70763          	beq	a4,a1,190c <memchr+0x20>
    1902:	0785                	add	a5,a5,1
    1904:	0077f713          	and	a4,a5,7
    1908:	167d                	add	a2,a2,-1
    190a:	f77d                	bnez	a4,18f8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190c:	4501                	li	a0,0
    if (n && *s != c)
    190e:	c235                	beqz	a2,1972 <memchr+0x86>
    1910:	0007c703          	lbu	a4,0(a5)
    1914:	06b70063          	beq	a4,a1,1974 <memchr+0x88>
        size_t k = ONES * c;
    1918:	00000517          	auipc	a0,0x0
    191c:	68053503          	ld	a0,1664(a0) # 1f98 <__clone+0xd0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1920:	471d                	li	a4,7
        size_t k = ONES * c;
    1922:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1926:	04c77763          	bgeu	a4,a2,1974 <memchr+0x88>
    192a:	00000897          	auipc	a7,0x0
    192e:	65e8b883          	ld	a7,1630(a7) # 1f88 <__clone+0xc0>
    1932:	00000817          	auipc	a6,0x0
    1936:	65e83803          	ld	a6,1630(a6) # 1f90 <__clone+0xc8>
    193a:	431d                	li	t1,7
    193c:	a029                	j	1946 <memchr+0x5a>
    193e:	1661                	add	a2,a2,-8
    1940:	07a1                	add	a5,a5,8
    1942:	00c37c63          	bgeu	t1,a2,195a <memchr+0x6e>
    1946:	6398                	ld	a4,0(a5)
    1948:	8f29                	xor	a4,a4,a0
    194a:	011706b3          	add	a3,a4,a7
    194e:	fff74713          	not	a4,a4
    1952:	8f75                	and	a4,a4,a3
    1954:	01077733          	and	a4,a4,a6
    1958:	d37d                	beqz	a4,193e <memchr+0x52>
    195a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    195c:	e601                	bnez	a2,1964 <memchr+0x78>
    195e:	a809                	j	1970 <memchr+0x84>
    1960:	0505                	add	a0,a0,1
    1962:	c619                	beqz	a2,1970 <memchr+0x84>
    1964:	00054783          	lbu	a5,0(a0)
    1968:	167d                	add	a2,a2,-1
    196a:	feb79be3          	bne	a5,a1,1960 <memchr+0x74>
    196e:	8082                	ret
    return n ? (void *)s : 0;
    1970:	4501                	li	a0,0
}
    1972:	8082                	ret
    if (n && *s != c)
    1974:	853e                	mv	a0,a5
    1976:	b7fd                	j	1964 <memchr+0x78>

0000000000001978 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1978:	1101                	add	sp,sp,-32
    197a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    197c:	862e                	mv	a2,a1
{
    197e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1980:	4581                	li	a1,0
{
    1982:	e426                	sd	s1,8(sp)
    1984:	ec06                	sd	ra,24(sp)
    1986:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1988:	f65ff0ef          	jal	18ec <memchr>
    return p ? p - s : n;
    198c:	c519                	beqz	a0,199a <strnlen+0x22>
}
    198e:	60e2                	ld	ra,24(sp)
    1990:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1992:	8d05                	sub	a0,a0,s1
}
    1994:	64a2                	ld	s1,8(sp)
    1996:	6105                	add	sp,sp,32
    1998:	8082                	ret
    199a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    199c:	8522                	mv	a0,s0
}
    199e:	6442                	ld	s0,16(sp)
    19a0:	64a2                	ld	s1,8(sp)
    19a2:	6105                	add	sp,sp,32
    19a4:	8082                	ret

00000000000019a6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a6:	00a5c7b3          	xor	a5,a1,a0
    19aa:	8b9d                	and	a5,a5,7
    19ac:	eb95                	bnez	a5,19e0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ae:	0075f793          	and	a5,a1,7
    19b2:	e7b1                	bnez	a5,19fe <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b4:	6198                	ld	a4,0(a1)
    19b6:	00000617          	auipc	a2,0x0
    19ba:	5d263603          	ld	a2,1490(a2) # 1f88 <__clone+0xc0>
    19be:	00000817          	auipc	a6,0x0
    19c2:	5d283803          	ld	a6,1490(a6) # 1f90 <__clone+0xc8>
    19c6:	a029                	j	19d0 <strcpy+0x2a>
    19c8:	05a1                	add	a1,a1,8
    19ca:	e118                	sd	a4,0(a0)
    19cc:	6198                	ld	a4,0(a1)
    19ce:	0521                	add	a0,a0,8
    19d0:	00c707b3          	add	a5,a4,a2
    19d4:	fff74693          	not	a3,a4
    19d8:	8ff5                	and	a5,a5,a3
    19da:	0107f7b3          	and	a5,a5,a6
    19de:	d7ed                	beqz	a5,19c8 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19e0:	0005c783          	lbu	a5,0(a1)
    19e4:	00f50023          	sb	a5,0(a0)
    19e8:	c785                	beqz	a5,1a10 <strcpy+0x6a>
    19ea:	0015c783          	lbu	a5,1(a1)
    19ee:	0505                	add	a0,a0,1
    19f0:	0585                	add	a1,a1,1
    19f2:	00f50023          	sb	a5,0(a0)
    19f6:	fbf5                	bnez	a5,19ea <strcpy+0x44>
        ;
    return d;
}
    19f8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19fa:	0505                	add	a0,a0,1
    19fc:	df45                	beqz	a4,19b4 <strcpy+0xe>
            if (!(*d = *s))
    19fe:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a02:	0585                	add	a1,a1,1
    1a04:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	f7fd                	bnez	a5,19fa <strcpy+0x54>
}
    1a0e:	8082                	ret
    1a10:	8082                	ret

0000000000001a12 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a12:	00a5c7b3          	xor	a5,a1,a0
    1a16:	8b9d                	and	a5,a5,7
    1a18:	e3b5                	bnez	a5,1a7c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a1a:	0075f793          	and	a5,a1,7
    1a1e:	cf99                	beqz	a5,1a3c <strncpy+0x2a>
    1a20:	ea09                	bnez	a2,1a32 <strncpy+0x20>
    1a22:	a421                	j	1c2a <strncpy+0x218>
    1a24:	0585                	add	a1,a1,1
    1a26:	0075f793          	and	a5,a1,7
    1a2a:	167d                	add	a2,a2,-1
    1a2c:	0505                	add	a0,a0,1
    1a2e:	c799                	beqz	a5,1a3c <strncpy+0x2a>
    1a30:	c225                	beqz	a2,1a90 <strncpy+0x7e>
    1a32:	0005c783          	lbu	a5,0(a1)
    1a36:	00f50023          	sb	a5,0(a0)
    1a3a:	f7ed                	bnez	a5,1a24 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a3c:	ca31                	beqz	a2,1a90 <strncpy+0x7e>
    1a3e:	0005c783          	lbu	a5,0(a1)
    1a42:	cba1                	beqz	a5,1a92 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a44:	479d                	li	a5,7
    1a46:	02c7fc63          	bgeu	a5,a2,1a7e <strncpy+0x6c>
    1a4a:	00000897          	auipc	a7,0x0
    1a4e:	53e8b883          	ld	a7,1342(a7) # 1f88 <__clone+0xc0>
    1a52:	00000817          	auipc	a6,0x0
    1a56:	53e83803          	ld	a6,1342(a6) # 1f90 <__clone+0xc8>
    1a5a:	431d                	li	t1,7
    1a5c:	a039                	j	1a6a <strncpy+0x58>
            *wd = *ws;
    1a5e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a60:	1661                	add	a2,a2,-8
    1a62:	05a1                	add	a1,a1,8
    1a64:	0521                	add	a0,a0,8
    1a66:	00c37b63          	bgeu	t1,a2,1a7c <strncpy+0x6a>
    1a6a:	6198                	ld	a4,0(a1)
    1a6c:	011707b3          	add	a5,a4,a7
    1a70:	fff74693          	not	a3,a4
    1a74:	8ff5                	and	a5,a5,a3
    1a76:	0107f7b3          	and	a5,a5,a6
    1a7a:	d3f5                	beqz	a5,1a5e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a7c:	ca11                	beqz	a2,1a90 <strncpy+0x7e>
    1a7e:	0005c783          	lbu	a5,0(a1)
    1a82:	0585                	add	a1,a1,1
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	c789                	beqz	a5,1a92 <strncpy+0x80>
    1a8a:	167d                	add	a2,a2,-1
    1a8c:	0505                	add	a0,a0,1
    1a8e:	fa65                	bnez	a2,1a7e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a90:	8082                	ret
    1a92:	4805                	li	a6,1
    1a94:	14061b63          	bnez	a2,1bea <strncpy+0x1d8>
    1a98:	40a00733          	neg	a4,a0
    1a9c:	00777793          	and	a5,a4,7
    1aa0:	4581                	li	a1,0
    1aa2:	12061c63          	bnez	a2,1bda <strncpy+0x1c8>
    1aa6:	00778693          	add	a3,a5,7
    1aaa:	48ad                	li	a7,11
    1aac:	1316e563          	bltu	a3,a7,1bd6 <strncpy+0x1c4>
    1ab0:	16d5e263          	bltu	a1,a3,1c14 <strncpy+0x202>
    1ab4:	14078c63          	beqz	a5,1c0c <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ab8:	00050023          	sb	zero,0(a0)
    1abc:	00677693          	and	a3,a4,6
    1ac0:	14068263          	beqz	a3,1c04 <strncpy+0x1f2>
    1ac4:	000500a3          	sb	zero,1(a0)
    1ac8:	4689                	li	a3,2
    1aca:	14f6f863          	bgeu	a3,a5,1c1a <strncpy+0x208>
    1ace:	00050123          	sb	zero,2(a0)
    1ad2:	8b11                	and	a4,a4,4
    1ad4:	12070463          	beqz	a4,1bfc <strncpy+0x1ea>
    1ad8:	000501a3          	sb	zero,3(a0)
    1adc:	4711                	li	a4,4
    1ade:	00450693          	add	a3,a0,4
    1ae2:	02f77563          	bgeu	a4,a5,1b0c <strncpy+0xfa>
    1ae6:	00050223          	sb	zero,4(a0)
    1aea:	4715                	li	a4,5
    1aec:	00550693          	add	a3,a0,5
    1af0:	00e78e63          	beq	a5,a4,1b0c <strncpy+0xfa>
    1af4:	fff50713          	add	a4,a0,-1
    1af8:	000502a3          	sb	zero,5(a0)
    1afc:	8b1d                	and	a4,a4,7
    1afe:	12071263          	bnez	a4,1c22 <strncpy+0x210>
    1b02:	00750693          	add	a3,a0,7
    1b06:	00050323          	sb	zero,6(a0)
    1b0a:	471d                	li	a4,7
    1b0c:	40f80833          	sub	a6,a6,a5
    1b10:	ff887593          	and	a1,a6,-8
    1b14:	97aa                	add	a5,a5,a0
    1b16:	95be                	add	a1,a1,a5
    1b18:	0007b023          	sd	zero,0(a5)
    1b1c:	07a1                	add	a5,a5,8
    1b1e:	feb79de3          	bne	a5,a1,1b18 <strncpy+0x106>
    1b22:	ff887593          	and	a1,a6,-8
    1b26:	00787813          	and	a6,a6,7
    1b2a:	00e587bb          	addw	a5,a1,a4
    1b2e:	00b68733          	add	a4,a3,a1
    1b32:	0e080063          	beqz	a6,1c12 <strncpy+0x200>
    1b36:	00070023          	sb	zero,0(a4)
    1b3a:	0017869b          	addw	a3,a5,1
    1b3e:	f4c6f9e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b42:	000700a3          	sb	zero,1(a4)
    1b46:	0027869b          	addw	a3,a5,2
    1b4a:	f4c6f3e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b4e:	00070123          	sb	zero,2(a4)
    1b52:	0037869b          	addw	a3,a5,3
    1b56:	f2c6fde3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b5a:	000701a3          	sb	zero,3(a4)
    1b5e:	0047869b          	addw	a3,a5,4
    1b62:	f2c6f7e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b66:	00070223          	sb	zero,4(a4)
    1b6a:	0057869b          	addw	a3,a5,5
    1b6e:	f2c6f1e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b72:	000702a3          	sb	zero,5(a4)
    1b76:	0067869b          	addw	a3,a5,6
    1b7a:	f0c6fbe3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b7e:	00070323          	sb	zero,6(a4)
    1b82:	0077869b          	addw	a3,a5,7
    1b86:	f0c6f5e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b8a:	000703a3          	sb	zero,7(a4)
    1b8e:	0087869b          	addw	a3,a5,8
    1b92:	eec6ffe3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1b96:	00070423          	sb	zero,8(a4)
    1b9a:	0097869b          	addw	a3,a5,9
    1b9e:	eec6f9e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1ba2:	000704a3          	sb	zero,9(a4)
    1ba6:	00a7869b          	addw	a3,a5,10
    1baa:	eec6f3e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1bae:	00070523          	sb	zero,10(a4)
    1bb2:	00b7869b          	addw	a3,a5,11
    1bb6:	ecc6fde3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1bba:	000705a3          	sb	zero,11(a4)
    1bbe:	00c7869b          	addw	a3,a5,12
    1bc2:	ecc6f7e3          	bgeu	a3,a2,1a90 <strncpy+0x7e>
    1bc6:	00070623          	sb	zero,12(a4)
    1bca:	27b5                	addw	a5,a5,13
    1bcc:	ecc7f2e3          	bgeu	a5,a2,1a90 <strncpy+0x7e>
    1bd0:	000706a3          	sb	zero,13(a4)
}
    1bd4:	8082                	ret
    1bd6:	46ad                	li	a3,11
    1bd8:	bde1                	j	1ab0 <strncpy+0x9e>
    1bda:	00778693          	add	a3,a5,7
    1bde:	48ad                	li	a7,11
    1be0:	fff60593          	add	a1,a2,-1
    1be4:	ed16f6e3          	bgeu	a3,a7,1ab0 <strncpy+0x9e>
    1be8:	b7fd                	j	1bd6 <strncpy+0x1c4>
    1bea:	40a00733          	neg	a4,a0
    1bee:	8832                	mv	a6,a2
    1bf0:	00777793          	and	a5,a4,7
    1bf4:	4581                	li	a1,0
    1bf6:	ea0608e3          	beqz	a2,1aa6 <strncpy+0x94>
    1bfa:	b7c5                	j	1bda <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfc:	00350693          	add	a3,a0,3
    1c00:	470d                	li	a4,3
    1c02:	b729                	j	1b0c <strncpy+0xfa>
    1c04:	00150693          	add	a3,a0,1
    1c08:	4705                	li	a4,1
    1c0a:	b709                	j	1b0c <strncpy+0xfa>
tail:
    1c0c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0e:	4701                	li	a4,0
    1c10:	bdf5                	j	1b0c <strncpy+0xfa>
    1c12:	8082                	ret
tail:
    1c14:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c16:	4781                	li	a5,0
    1c18:	bf39                	j	1b36 <strncpy+0x124>
    1c1a:	00250693          	add	a3,a0,2
    1c1e:	4709                	li	a4,2
    1c20:	b5f5                	j	1b0c <strncpy+0xfa>
    1c22:	00650693          	add	a3,a0,6
    1c26:	4719                	li	a4,6
    1c28:	b5d5                	j	1b0c <strncpy+0xfa>
    1c2a:	8082                	ret

0000000000001c2c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2c:	87aa                	mv	a5,a0
    1c2e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c30:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c34:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c38:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c3a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <openat>:
    register long a7 __asm__("a7") = n;
    1c44:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c48:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <close>:
    register long a7 __asm__("a7") = n;
    1c54:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c58:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c5c:	2501                	sext.w	a0,a0
    1c5e:	8082                	ret

0000000000001c60 <read>:
    register long a7 __asm__("a7") = n;
    1c60:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c64:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c68:	8082                	ret

0000000000001c6a <write>:
    register long a7 __asm__("a7") = n;
    1c6a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c72:	8082                	ret

0000000000001c74 <getpid>:
    register long a7 __asm__("a7") = n;
    1c74:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c78:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <getppid>:
    register long a7 __asm__("a7") = n;
    1c80:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c84:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c8c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c90:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <fork>:
    register long a7 __asm__("a7") = n;
    1c98:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c9c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ca8:	85b2                	mv	a1,a2
    1caa:	863a                	mv	a2,a4
    if (stack)
    1cac:	c191                	beqz	a1,1cb0 <clone+0x8>
	stack += stack_size;
    1cae:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb0:	4781                	li	a5,0
    1cb2:	4701                	li	a4,0
    1cb4:	4681                	li	a3,0
    1cb6:	2601                	sext.w	a2,a2
    1cb8:	ac01                	j	1ec8 <__clone>

0000000000001cba <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cba:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cbe:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cc2:	8082                	ret

0000000000001cc4 <exit>:
    register long a7 __asm__("a7") = n;
    1cc4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc8:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ccc:	8082                	ret

0000000000001cce <waitpid>:
    register long a7 __asm__("a7") = n;
    1cce:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <exec>:
    register long a7 __asm__("a7") = n;
    1cdc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <execve>:
    register long a7 __asm__("a7") = n;
    1ce8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cec:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <times>:
    register long a7 __asm__("a7") = n;
    1cf4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <get_time>:

int64 get_time()
{
    1d00:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d02:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d06:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d08:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0e:	2501                	sext.w	a0,a0
    1d10:	ed09                	bnez	a0,1d2a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d12:	67a2                	ld	a5,8(sp)
    1d14:	3e800713          	li	a4,1000
    1d18:	00015503          	lhu	a0,0(sp)
    1d1c:	02e7d7b3          	divu	a5,a5,a4
    1d20:	02e50533          	mul	a0,a0,a4
    1d24:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d26:	0141                	add	sp,sp,16
    1d28:	8082                	ret
        return -1;
    1d2a:	557d                	li	a0,-1
    1d2c:	bfed                	j	1d26 <get_time+0x26>

0000000000001d2e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d32:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <time>:
    register long a7 __asm__("a7") = n;
    1d3a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <sleep>:

int sleep(unsigned long long time)
{
    1d46:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d48:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d4a:	850a                	mv	a0,sp
    1d4c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d52:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d54:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d58:	e501                	bnez	a0,1d60 <sleep+0x1a>
    return 0;
    1d5a:	4501                	li	a0,0
}
    1d5c:	0141                	add	sp,sp,16
    1d5e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d60:	4502                	lw	a0,0(sp)
}
    1d62:	0141                	add	sp,sp,16
    1d64:	8082                	ret

0000000000001d66 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d66:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d6a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d72:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d76:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d7a:	8082                	ret

0000000000001d7c <mprotect>:
    register long a7 __asm__("a7") = n;
    1d7c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d80:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <munmap>:
    register long a7 __asm__("a7") = n;
    1d88:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <wait>:

int wait(int *code)
{
    1d94:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d96:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d9a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d9c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d9e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <spawn>:
    register long a7 __asm__("a7") = n;
    1da8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <mailread>:
    register long a7 __asm__("a7") = n;
    1db4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dc0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <fstat>:
    register long a7 __asm__("a7") = n;
    1dcc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dd8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dda:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dde:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dea:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dee:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dfa:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dfe:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <link>:

int link(char *old_path, char *new_path)
{
    1e08:	87aa                	mv	a5,a0
    1e0a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e0c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e10:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e14:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e16:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e1a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <unlink>:

int unlink(char *path)
{
    1e24:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e26:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e2a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e2e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e30:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <uname>:
    register long a7 __asm__("a7") = n;
    1e38:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <brk>:
    register long a7 __asm__("a7") = n;
    1e44:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e50:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e52:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e56:	8082                	ret

0000000000001e58 <chdir>:
    register long a7 __asm__("a7") = n;
    1e58:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e64:	862e                	mv	a2,a1
    1e66:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e68:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e6a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e6e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e72:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e74:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <getdents>:
    register long a7 __asm__("a7") = n;
    1e7e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <pipe>:
    register long a7 __asm__("a7") = n;
    1e8a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <dup>:
    register long a7 __asm__("a7") = n;
    1e98:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e9a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <mount>:
    register long a7 __asm__("a7") = n;
    1eae:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <umount>:
    register long a7 __asm__("a7") = n;
    1eba:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ebe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec8:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eca:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ecc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ece:	8532                	mv	a0,a2
	mv a2, a4
    1ed0:	863a                	mv	a2,a4
	mv a3, a5
    1ed2:	86be                	mv	a3,a5
	mv a4, a6
    1ed4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed6:	0dc00893          	li	a7,220
	ecall
    1eda:	00000073          	ecall

	beqz a0, 1f
    1ede:	c111                	beqz	a0,1ee2 <__clone+0x1a>
	# Parent
	ret
    1ee0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee4:	6522                	ld	a0,8(sp)
	jalr a1
    1ee6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee8:	05d00893          	li	a7,93
	ecall
    1eec:	00000073          	ecall
