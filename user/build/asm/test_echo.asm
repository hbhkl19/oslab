
/home/hbh/oslab/oslab/user/build/riscv64/test_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a83d                	j	1040 <__start_main>

0000000000001004 <main>:

/*
 * for execve
 */

int main(int argc, char *argv[]){
    1004:	1141                	add	sp,sp,-16
    printf("  I am test_echo.\nexecve success.\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	e6250513          	add	a0,a0,-414 # 1e68 <__clone+0x2c>
int main(int argc, char *argv[]){
    100e:	e406                	sd	ra,8(sp)
    printf("  I am test_echo.\nexecve success.\n");
    1010:	2aa000ef          	jal	12ba <printf>
    TEST_END(__func__);
    1014:	00001517          	auipc	a0,0x1
    1018:	e7c50513          	add	a0,a0,-388 # 1e90 <__clone+0x54>
    101c:	27c000ef          	jal	1298 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e9850513          	add	a0,a0,-360 # 1eb8 <__func__.0>
    1028:	270000ef          	jal	1298 <puts>
    102c:	00001517          	auipc	a0,0x1
    1030:	e7450513          	add	a0,a0,-396 # 1ea0 <__clone+0x64>
    1034:	264000ef          	jal	1298 <puts>
    return 0;
}
    1038:	60a2                	ld	ra,8(sp)
    103a:	4501                	li	a0,0
    103c:	0141                	add	sp,sp,16
    103e:	8082                	ret

0000000000001040 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1040:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1042:	4108                	lw	a0,0(a0)
{
    1044:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1046:	05a1                	add	a1,a1,8
{
    1048:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    104a:	fbbff0ef          	jal	1004 <main>
    104e:	3eb000ef          	jal	1c38 <exit>
	return 0;
}
    1052:	60a2                	ld	ra,8(sp)
    1054:	4501                	li	a0,0
    1056:	0141                	add	sp,sp,16
    1058:	8082                	ret

000000000000105a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    105a:	7179                	add	sp,sp,-48
    105c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    105e:	12054863          	bltz	a0,118e <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1062:	02b577bb          	remuw	a5,a0,a1
    1066:	00001697          	auipc	a3,0x1
    106a:	e7268693          	add	a3,a3,-398 # 1ed8 <digits>
    buf[16] = 0;
    106e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1072:	0005871b          	sext.w	a4,a1
    1076:	1782                	sll	a5,a5,0x20
    1078:	9381                	srl	a5,a5,0x20
    107a:	97b6                	add	a5,a5,a3
    107c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1080:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1084:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1088:	1ab56663          	bltu	a0,a1,1234 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    108c:	02e8763b          	remuw	a2,a6,a4
    1090:	1602                	sll	a2,a2,0x20
    1092:	9201                	srl	a2,a2,0x20
    1094:	9636                	add	a2,a2,a3
    1096:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    109a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    109e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10a2:	12e86c63          	bltu	a6,a4,11da <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10a6:	02e5f63b          	remuw	a2,a1,a4
    10aa:	1602                	sll	a2,a2,0x20
    10ac:	9201                	srl	a2,a2,0x20
    10ae:	9636                	add	a2,a2,a3
    10b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10b4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10b8:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10bc:	12e5e863          	bltu	a1,a4,11ec <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10c0:	02e8763b          	remuw	a2,a6,a4
    10c4:	1602                	sll	a2,a2,0x20
    10c6:	9201                	srl	a2,a2,0x20
    10c8:	9636                	add	a2,a2,a3
    10ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ce:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10d2:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    10d6:	12e86463          	bltu	a6,a4,11fe <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    10da:	02e5f63b          	remuw	a2,a1,a4
    10de:	1602                	sll	a2,a2,0x20
    10e0:	9201                	srl	a2,a2,0x20
    10e2:	9636                	add	a2,a2,a3
    10e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10ec:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    10f0:	12e5e063          	bltu	a1,a4,1210 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    10f4:	02e8763b          	remuw	a2,a6,a4
    10f8:	1602                	sll	a2,a2,0x20
    10fa:	9201                	srl	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1106:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    110a:	0ae86f63          	bltu	a6,a4,11c8 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    110e:	02e5f63b          	remuw	a2,a1,a4
    1112:	1602                	sll	a2,a2,0x20
    1114:	9201                	srl	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1120:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1124:	0ee5ef63          	bltu	a1,a4,1222 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1128:	02e8763b          	remuw	a2,a6,a4
    112c:	1602                	sll	a2,a2,0x20
    112e:	9201                	srl	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    113e:	0ee86d63          	bltu	a6,a4,1238 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	sll	a2,a2,0x20
    1148:	9201                	srl	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1158:	0ee5e963          	bltu	a1,a4,124a <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    115c:	1782                	sll	a5,a5,0x20
    115e:	9381                	srl	a5,a5,0x20
    1160:	96be                	add	a3,a3,a5
    1162:	0006c783          	lbu	a5,0(a3)
    1166:	4599                	li	a1,6
    1168:	00f10723          	sb	a5,14(sp)

    if (sign)
    116c:	00055763          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1170:	02d00793          	li	a5,45
    1174:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1178:	4595                	li	a1,5
    write(f, s, l);
    117a:	003c                	add	a5,sp,8
    117c:	4641                	li	a2,16
    117e:	9e0d                	subw	a2,a2,a1
    1180:	4505                	li	a0,1
    1182:	95be                	add	a1,a1,a5
    1184:	25b000ef          	jal	1bde <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1188:	70a2                	ld	ra,40(sp)
    118a:	6145                	add	sp,sp,48
    118c:	8082                	ret
        x = -xx;
    118e:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1192:	02b677bb          	remuw	a5,a2,a1
    1196:	00001697          	auipc	a3,0x1
    119a:	d4268693          	add	a3,a3,-702 # 1ed8 <digits>
    buf[16] = 0;
    119e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11a2:	0005871b          	sext.w	a4,a1
    11a6:	1782                	sll	a5,a5,0x20
    11a8:	9381                	srl	a5,a5,0x20
    11aa:	97b6                	add	a5,a5,a3
    11ac:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11b0:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11b4:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11b8:	ecb67ae3          	bgeu	a2,a1,108c <printint.constprop.0+0x32>
        buf[i--] = '-';
    11bc:	02d00793          	li	a5,45
    11c0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11c4:	45b9                	li	a1,14
    11c6:	bf55                	j	117a <printint.constprop.0+0x120>
    11c8:	45a9                	li	a1,10
    if (sign)
    11ca:	fa0558e3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    11ce:	02d00793          	li	a5,45
    11d2:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11d6:	45a5                	li	a1,9
    11d8:	b74d                	j	117a <printint.constprop.0+0x120>
    11da:	45b9                	li	a1,14
    if (sign)
    11dc:	f8055fe3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    11e0:	02d00793          	li	a5,45
    11e4:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    11e8:	45b5                	li	a1,13
    11ea:	bf41                	j	117a <printint.constprop.0+0x120>
    11ec:	45b5                	li	a1,13
    if (sign)
    11ee:	f80556e3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    11f2:	02d00793          	li	a5,45
    11f6:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    11fa:	45b1                	li	a1,12
    11fc:	bfbd                	j	117a <printint.constprop.0+0x120>
    11fe:	45b1                	li	a1,12
    if (sign)
    1200:	f6055de3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1204:	02d00793          	li	a5,45
    1208:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    120c:	45ad                	li	a1,11
    120e:	b7b5                	j	117a <printint.constprop.0+0x120>
    1210:	45ad                	li	a1,11
    if (sign)
    1212:	f60554e3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    121e:	45a9                	li	a1,10
    1220:	bfa9                	j	117a <printint.constprop.0+0x120>
    1222:	45a5                	li	a1,9
    if (sign)
    1224:	f4055be3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1230:	45a1                	li	a1,8
    1232:	b7a1                	j	117a <printint.constprop.0+0x120>
    i = 15;
    1234:	45bd                	li	a1,15
    1236:	b791                	j	117a <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1238:	45a1                	li	a1,8
    if (sign)
    123a:	f40550e3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1246:	459d                	li	a1,7
    1248:	bf0d                	j	117a <printint.constprop.0+0x120>
    124a:	459d                	li	a1,7
    if (sign)
    124c:	f20557e3          	bgez	a0,117a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1258:	4599                	li	a1,6
    125a:	b705                	j	117a <printint.constprop.0+0x120>

000000000000125c <getchar>:
{
    125c:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    125e:	00f10593          	add	a1,sp,15
    1262:	4605                	li	a2,1
    1264:	4501                	li	a0,0
{
    1266:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1268:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    126c:	169000ef          	jal	1bd4 <read>
}
    1270:	60e2                	ld	ra,24(sp)
    1272:	00f14503          	lbu	a0,15(sp)
    1276:	6105                	add	sp,sp,32
    1278:	8082                	ret

000000000000127a <putchar>:
{
    127a:	1101                	add	sp,sp,-32
    127c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    127e:	00f10593          	add	a1,sp,15
    1282:	4605                	li	a2,1
    1284:	4505                	li	a0,1
{
    1286:	ec06                	sd	ra,24(sp)
    char byte = c;
    1288:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    128c:	153000ef          	jal	1bde <write>
}
    1290:	60e2                	ld	ra,24(sp)
    1292:	2501                	sext.w	a0,a0
    1294:	6105                	add	sp,sp,32
    1296:	8082                	ret

0000000000001298 <puts>:
{
    1298:	1141                	add	sp,sp,-16
    129a:	e406                	sd	ra,8(sp)
    129c:	e022                	sd	s0,0(sp)
    129e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a0:	562000ef          	jal	1802 <strlen>
    12a4:	862a                	mv	a2,a0
    12a6:	85a2                	mv	a1,s0
    12a8:	4505                	li	a0,1
    12aa:	135000ef          	jal	1bde <write>
}
    12ae:	60a2                	ld	ra,8(sp)
    12b0:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12b2:	957d                	sra	a0,a0,0x3f
    return r;
    12b4:	2501                	sext.w	a0,a0
}
    12b6:	0141                	add	sp,sp,16
    12b8:	8082                	ret

00000000000012ba <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ba:	7171                	add	sp,sp,-176
    12bc:	f85a                	sd	s6,48(sp)
    12be:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12c0:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12c2:	18bc                	add	a5,sp,120
{
    12c4:	e8ca                	sd	s2,80(sp)
    12c6:	e4ce                	sd	s3,72(sp)
    12c8:	e0d2                	sd	s4,64(sp)
    12ca:	fc56                	sd	s5,56(sp)
    12cc:	f486                	sd	ra,104(sp)
    12ce:	f0a2                	sd	s0,96(sp)
    12d0:	eca6                	sd	s1,88(sp)
    12d2:	fcae                	sd	a1,120(sp)
    12d4:	e132                	sd	a2,128(sp)
    12d6:	e536                	sd	a3,136(sp)
    12d8:	e93a                	sd	a4,144(sp)
    12da:	f142                	sd	a6,160(sp)
    12dc:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12de:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12e0:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12e4:	07300a13          	li	s4,115
    12e8:	07800a93          	li	s5,120
    buf[i++] = '0';
    12ec:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f0:	00001997          	auipc	s3,0x1
    12f4:	be898993          	add	s3,s3,-1048 # 1ed8 <digits>
        if (!*s)
    12f8:	00054783          	lbu	a5,0(a0)
    12fc:	16078a63          	beqz	a5,1470 <printf+0x1b6>
    1300:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1302:	19278d63          	beq	a5,s2,149c <printf+0x1e2>
    1306:	00164783          	lbu	a5,1(a2)
    130a:	0605                	add	a2,a2,1
    130c:	fbfd                	bnez	a5,1302 <printf+0x48>
    130e:	84b2                	mv	s1,a2
        l = z - a;
    1310:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1314:	85aa                	mv	a1,a0
    1316:	8622                	mv	a2,s0
    1318:	4505                	li	a0,1
    131a:	0c5000ef          	jal	1bde <write>
        if (l)
    131e:	1a041463          	bnez	s0,14c6 <printf+0x20c>
        if (s[1] == 0)
    1322:	0014c783          	lbu	a5,1(s1)
    1326:	14078563          	beqz	a5,1470 <printf+0x1b6>
        switch (s[1])
    132a:	1b478063          	beq	a5,s4,14ca <printf+0x210>
    132e:	14fa6b63          	bltu	s4,a5,1484 <printf+0x1ca>
    1332:	06400713          	li	a4,100
    1336:	1ee78063          	beq	a5,a4,1516 <printf+0x25c>
    133a:	07000713          	li	a4,112
    133e:	1ae79963          	bne	a5,a4,14f0 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1342:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1344:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1348:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    134a:	631c                	ld	a5,0(a4)
    134c:	0721                	add	a4,a4,8
    134e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1350:	00479293          	sll	t0,a5,0x4
    1354:	00879f93          	sll	t6,a5,0x8
    1358:	00c79f13          	sll	t5,a5,0xc
    135c:	01079e93          	sll	t4,a5,0x10
    1360:	01479e13          	sll	t3,a5,0x14
    1364:	01879313          	sll	t1,a5,0x18
    1368:	01c79893          	sll	a7,a5,0x1c
    136c:	02479813          	sll	a6,a5,0x24
    1370:	02879513          	sll	a0,a5,0x28
    1374:	02c79593          	sll	a1,a5,0x2c
    1378:	03079693          	sll	a3,a5,0x30
    137c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1380:	03c7d413          	srl	s0,a5,0x3c
    1384:	01c7d39b          	srlw	t2,a5,0x1c
    1388:	03c2d293          	srl	t0,t0,0x3c
    138c:	03cfdf93          	srl	t6,t6,0x3c
    1390:	03cf5f13          	srl	t5,t5,0x3c
    1394:	03cede93          	srl	t4,t4,0x3c
    1398:	03ce5e13          	srl	t3,t3,0x3c
    139c:	03c35313          	srl	t1,t1,0x3c
    13a0:	03c8d893          	srl	a7,a7,0x3c
    13a4:	03c85813          	srl	a6,a6,0x3c
    13a8:	9171                	srl	a0,a0,0x3c
    13aa:	91f1                	srl	a1,a1,0x3c
    13ac:	92f1                	srl	a3,a3,0x3c
    13ae:	9371                	srl	a4,a4,0x3c
    13b0:	96ce                	add	a3,a3,s3
    13b2:	974e                	add	a4,a4,s3
    13b4:	944e                	add	s0,s0,s3
    13b6:	92ce                	add	t0,t0,s3
    13b8:	9fce                	add	t6,t6,s3
    13ba:	9f4e                	add	t5,t5,s3
    13bc:	9ece                	add	t4,t4,s3
    13be:	9e4e                	add	t3,t3,s3
    13c0:	934e                	add	t1,t1,s3
    13c2:	98ce                	add	a7,a7,s3
    13c4:	93ce                	add	t2,t2,s3
    13c6:	984e                	add	a6,a6,s3
    13c8:	954e                	add	a0,a0,s3
    13ca:	95ce                	add	a1,a1,s3
    13cc:	0006c083          	lbu	ra,0(a3)
    13d0:	0002c283          	lbu	t0,0(t0)
    13d4:	00074683          	lbu	a3,0(a4)
    13d8:	000fcf83          	lbu	t6,0(t6)
    13dc:	000f4f03          	lbu	t5,0(t5)
    13e0:	000ece83          	lbu	t4,0(t4)
    13e4:	000e4e03          	lbu	t3,0(t3)
    13e8:	00034303          	lbu	t1,0(t1)
    13ec:	0008c883          	lbu	a7,0(a7)
    13f0:	0003c383          	lbu	t2,0(t2)
    13f4:	00084803          	lbu	a6,0(a6)
    13f8:	00054503          	lbu	a0,0(a0)
    13fc:	0005c583          	lbu	a1,0(a1)
    1400:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1404:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1408:	9371                	srl	a4,a4,0x3c
    140a:	8bbd                	and	a5,a5,15
    140c:	974e                	add	a4,a4,s3
    140e:	97ce                	add	a5,a5,s3
    1410:	005105a3          	sb	t0,11(sp)
    1414:	01f10623          	sb	t6,12(sp)
    1418:	01e106a3          	sb	t5,13(sp)
    141c:	01d10723          	sb	t4,14(sp)
    1420:	01c107a3          	sb	t3,15(sp)
    1424:	00610823          	sb	t1,16(sp)
    1428:	011108a3          	sb	a7,17(sp)
    142c:	00710923          	sb	t2,18(sp)
    1430:	010109a3          	sb	a6,19(sp)
    1434:	00a10a23          	sb	a0,20(sp)
    1438:	00b10aa3          	sb	a1,21(sp)
    143c:	00110b23          	sb	ra,22(sp)
    1440:	00d10ba3          	sb	a3,23(sp)
    1444:	00810523          	sb	s0,10(sp)
    1448:	00074703          	lbu	a4,0(a4)
    144c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1450:	002c                	add	a1,sp,8
    1452:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1454:	00e10c23          	sb	a4,24(sp)
    1458:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    145c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1460:	77e000ef          	jal	1bde <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1464:	00248513          	add	a0,s1,2
        if (!*s)
    1468:	00054783          	lbu	a5,0(a0)
    146c:	e8079ae3          	bnez	a5,1300 <printf+0x46>
    }
    va_end(ap);
}
    1470:	70a6                	ld	ra,104(sp)
    1472:	7406                	ld	s0,96(sp)
    1474:	64e6                	ld	s1,88(sp)
    1476:	6946                	ld	s2,80(sp)
    1478:	69a6                	ld	s3,72(sp)
    147a:	6a06                	ld	s4,64(sp)
    147c:	7ae2                	ld	s5,56(sp)
    147e:	7b42                	ld	s6,48(sp)
    1480:	614d                	add	sp,sp,176
    1482:	8082                	ret
        switch (s[1])
    1484:	07579663          	bne	a5,s5,14f0 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1488:	6782                	ld	a5,0(sp)
    148a:	45c1                	li	a1,16
    148c:	4388                	lw	a0,0(a5)
    148e:	07a1                	add	a5,a5,8
    1490:	e03e                	sd	a5,0(sp)
    1492:	bc9ff0ef          	jal	105a <printint.constprop.0>
        s += 2;
    1496:	00248513          	add	a0,s1,2
    149a:	b7f9                	j	1468 <printf+0x1ae>
    149c:	84b2                	mv	s1,a2
    149e:	a039                	j	14ac <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14a0:	0024c783          	lbu	a5,2(s1)
    14a4:	0605                	add	a2,a2,1
    14a6:	0489                	add	s1,s1,2
    14a8:	e72794e3          	bne	a5,s2,1310 <printf+0x56>
    14ac:	0014c783          	lbu	a5,1(s1)
    14b0:	ff2788e3          	beq	a5,s2,14a0 <printf+0x1e6>
        l = z - a;
    14b4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14b8:	85aa                	mv	a1,a0
    14ba:	8622                	mv	a2,s0
    14bc:	4505                	li	a0,1
    14be:	720000ef          	jal	1bde <write>
        if (l)
    14c2:	e60400e3          	beqz	s0,1322 <printf+0x68>
    14c6:	8526                	mv	a0,s1
    14c8:	bd05                	j	12f8 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    14ca:	6782                	ld	a5,0(sp)
    14cc:	6380                	ld	s0,0(a5)
    14ce:	07a1                	add	a5,a5,8
    14d0:	e03e                	sd	a5,0(sp)
    14d2:	cc21                	beqz	s0,152a <printf+0x270>
            l = strnlen(a, 200);
    14d4:	0c800593          	li	a1,200
    14d8:	8522                	mv	a0,s0
    14da:	412000ef          	jal	18ec <strnlen>
    write(f, s, l);
    14de:	0005061b          	sext.w	a2,a0
    14e2:	85a2                	mv	a1,s0
    14e4:	4505                	li	a0,1
    14e6:	6f8000ef          	jal	1bde <write>
        s += 2;
    14ea:	00248513          	add	a0,s1,2
    14ee:	bfad                	j	1468 <printf+0x1ae>
    return write(stdout, &byte, 1);
    14f0:	4605                	li	a2,1
    14f2:	002c                	add	a1,sp,8
    14f4:	4505                	li	a0,1
    char byte = c;
    14f6:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    14fa:	6e4000ef          	jal	1bde <write>
    char byte = c;
    14fe:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1502:	4605                	li	a2,1
    1504:	002c                	add	a1,sp,8
    1506:	4505                	li	a0,1
    char byte = c;
    1508:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    150c:	6d2000ef          	jal	1bde <write>
        s += 2;
    1510:	00248513          	add	a0,s1,2
    1514:	bf91                	j	1468 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1516:	6782                	ld	a5,0(sp)
    1518:	45a9                	li	a1,10
    151a:	4388                	lw	a0,0(a5)
    151c:	07a1                	add	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	b3bff0ef          	jal	105a <printint.constprop.0>
        s += 2;
    1524:	00248513          	add	a0,s1,2
    1528:	b781                	j	1468 <printf+0x1ae>
                a = "(null)";
    152a:	00001417          	auipc	s0,0x1
    152e:	98640413          	add	s0,s0,-1658 # 1eb0 <__clone+0x74>
    1532:	b74d                	j	14d4 <printf+0x21a>

0000000000001534 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1534:	02000793          	li	a5,32
    1538:	00f50663          	beq	a0,a5,1544 <isspace+0x10>
    153c:	355d                	addw	a0,a0,-9
    153e:	00553513          	sltiu	a0,a0,5
    1542:	8082                	ret
    1544:	4505                	li	a0,1
}
    1546:	8082                	ret

0000000000001548 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1548:	fd05051b          	addw	a0,a0,-48
}
    154c:	00a53513          	sltiu	a0,a0,10
    1550:	8082                	ret

0000000000001552 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1552:	02000693          	li	a3,32
    1556:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1558:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    155c:	ff77871b          	addw	a4,a5,-9
    1560:	04d78c63          	beq	a5,a3,15b8 <atoi+0x66>
    1564:	0007861b          	sext.w	a2,a5
    1568:	04e5f863          	bgeu	a1,a4,15b8 <atoi+0x66>
        s++;
    switch (*s)
    156c:	02b00713          	li	a4,43
    1570:	04e78963          	beq	a5,a4,15c2 <atoi+0x70>
    1574:	02d00713          	li	a4,45
    1578:	06e78263          	beq	a5,a4,15dc <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    157c:	fd06069b          	addw	a3,a2,-48
    1580:	47a5                	li	a5,9
    1582:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1584:	4301                	li	t1,0
    while (isdigit(*s))
    1586:	04d7e963          	bltu	a5,a3,15d8 <atoi+0x86>
    int n = 0, neg = 0;
    158a:	4501                	li	a0,0
    while (isdigit(*s))
    158c:	48a5                	li	a7,9
    158e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1592:	0025179b          	sllw	a5,a0,0x2
    1596:	9fa9                	addw	a5,a5,a0
    1598:	fd06059b          	addw	a1,a2,-48
    159c:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    15a0:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    15a4:	0705                	add	a4,a4,1
    15a6:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    15aa:	0006861b          	sext.w	a2,a3
    15ae:	ff08f0e3          	bgeu	a7,a6,158e <atoi+0x3c>
    return neg ? n : -n;
    15b2:	00030563          	beqz	t1,15bc <atoi+0x6a>
}
    15b6:	8082                	ret
        s++;
    15b8:	0505                	add	a0,a0,1
    15ba:	bf79                	j	1558 <atoi+0x6>
    return neg ? n : -n;
    15bc:	40f5853b          	subw	a0,a1,a5
    15c0:	8082                	ret
    while (isdigit(*s))
    15c2:	00154603          	lbu	a2,1(a0)
    15c6:	47a5                	li	a5,9
        s++;
    15c8:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    15cc:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    15d0:	4301                	li	t1,0
    while (isdigit(*s))
    15d2:	2601                	sext.w	a2,a2
    15d4:	fad7fbe3          	bgeu	a5,a3,158a <atoi+0x38>
    15d8:	4501                	li	a0,0
}
    15da:	8082                	ret
    while (isdigit(*s))
    15dc:	00154603          	lbu	a2,1(a0)
    15e0:	47a5                	li	a5,9
        s++;
    15e2:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    15e6:	fd06069b          	addw	a3,a2,-48
    15ea:	2601                	sext.w	a2,a2
    15ec:	fed7e6e3          	bltu	a5,a3,15d8 <atoi+0x86>
        neg = 1;
    15f0:	4305                	li	t1,1
    15f2:	bf61                	j	158a <atoi+0x38>

00000000000015f4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15f4:	18060163          	beqz	a2,1776 <memset+0x182>
    15f8:	40a006b3          	neg	a3,a0
    15fc:	0076f793          	and	a5,a3,7
    1600:	00778813          	add	a6,a5,7
    1604:	48ad                	li	a7,11
    1606:	0ff5f713          	zext.b	a4,a1
    160a:	fff60593          	add	a1,a2,-1
    160e:	17186563          	bltu	a6,a7,1778 <memset+0x184>
    1612:	1705ed63          	bltu	a1,a6,178c <memset+0x198>
    1616:	16078363          	beqz	a5,177c <memset+0x188>
    161a:	00e50023          	sb	a4,0(a0)
    161e:	0066f593          	and	a1,a3,6
    1622:	16058063          	beqz	a1,1782 <memset+0x18e>
    1626:	00e500a3          	sb	a4,1(a0)
    162a:	4589                	li	a1,2
    162c:	16f5f363          	bgeu	a1,a5,1792 <memset+0x19e>
    1630:	00e50123          	sb	a4,2(a0)
    1634:	8a91                	and	a3,a3,4
    1636:	00350593          	add	a1,a0,3
    163a:	4e0d                	li	t3,3
    163c:	ce9d                	beqz	a3,167a <memset+0x86>
    163e:	00e501a3          	sb	a4,3(a0)
    1642:	4691                	li	a3,4
    1644:	00450593          	add	a1,a0,4
    1648:	4e11                	li	t3,4
    164a:	02f6f863          	bgeu	a3,a5,167a <memset+0x86>
    164e:	00e50223          	sb	a4,4(a0)
    1652:	4695                	li	a3,5
    1654:	00550593          	add	a1,a0,5
    1658:	4e15                	li	t3,5
    165a:	02d78063          	beq	a5,a3,167a <memset+0x86>
    165e:	fff50693          	add	a3,a0,-1
    1662:	00e502a3          	sb	a4,5(a0)
    1666:	8a9d                	and	a3,a3,7
    1668:	00650593          	add	a1,a0,6
    166c:	4e19                	li	t3,6
    166e:	e691                	bnez	a3,167a <memset+0x86>
    1670:	00750593          	add	a1,a0,7
    1674:	00e50323          	sb	a4,6(a0)
    1678:	4e1d                	li	t3,7
    167a:	00871693          	sll	a3,a4,0x8
    167e:	01071813          	sll	a6,a4,0x10
    1682:	8ed9                	or	a3,a3,a4
    1684:	01871893          	sll	a7,a4,0x18
    1688:	0106e6b3          	or	a3,a3,a6
    168c:	0116e6b3          	or	a3,a3,a7
    1690:	02071813          	sll	a6,a4,0x20
    1694:	02871313          	sll	t1,a4,0x28
    1698:	0106e6b3          	or	a3,a3,a6
    169c:	40f608b3          	sub	a7,a2,a5
    16a0:	03071813          	sll	a6,a4,0x30
    16a4:	0066e6b3          	or	a3,a3,t1
    16a8:	0106e6b3          	or	a3,a3,a6
    16ac:	03871313          	sll	t1,a4,0x38
    16b0:	97aa                	add	a5,a5,a0
    16b2:	ff88f813          	and	a6,a7,-8
    16b6:	0066e6b3          	or	a3,a3,t1
    16ba:	983e                	add	a6,a6,a5
    16bc:	e394                	sd	a3,0(a5)
    16be:	07a1                	add	a5,a5,8
    16c0:	ff079ee3          	bne	a5,a6,16bc <memset+0xc8>
    16c4:	ff88f793          	and	a5,a7,-8
    16c8:	0078f893          	and	a7,a7,7
    16cc:	00f586b3          	add	a3,a1,a5
    16d0:	01c787bb          	addw	a5,a5,t3
    16d4:	0a088b63          	beqz	a7,178a <memset+0x196>
    16d8:	00e68023          	sb	a4,0(a3)
    16dc:	0017859b          	addw	a1,a5,1
    16e0:	08c5fb63          	bgeu	a1,a2,1776 <memset+0x182>
    16e4:	00e680a3          	sb	a4,1(a3)
    16e8:	0027859b          	addw	a1,a5,2
    16ec:	08c5f563          	bgeu	a1,a2,1776 <memset+0x182>
    16f0:	00e68123          	sb	a4,2(a3)
    16f4:	0037859b          	addw	a1,a5,3
    16f8:	06c5ff63          	bgeu	a1,a2,1776 <memset+0x182>
    16fc:	00e681a3          	sb	a4,3(a3)
    1700:	0047859b          	addw	a1,a5,4
    1704:	06c5f963          	bgeu	a1,a2,1776 <memset+0x182>
    1708:	00e68223          	sb	a4,4(a3)
    170c:	0057859b          	addw	a1,a5,5
    1710:	06c5f363          	bgeu	a1,a2,1776 <memset+0x182>
    1714:	00e682a3          	sb	a4,5(a3)
    1718:	0067859b          	addw	a1,a5,6
    171c:	04c5fd63          	bgeu	a1,a2,1776 <memset+0x182>
    1720:	00e68323          	sb	a4,6(a3)
    1724:	0077859b          	addw	a1,a5,7
    1728:	04c5f763          	bgeu	a1,a2,1776 <memset+0x182>
    172c:	00e683a3          	sb	a4,7(a3)
    1730:	0087859b          	addw	a1,a5,8
    1734:	04c5f163          	bgeu	a1,a2,1776 <memset+0x182>
    1738:	00e68423          	sb	a4,8(a3)
    173c:	0097859b          	addw	a1,a5,9
    1740:	02c5fb63          	bgeu	a1,a2,1776 <memset+0x182>
    1744:	00e684a3          	sb	a4,9(a3)
    1748:	00a7859b          	addw	a1,a5,10
    174c:	02c5f563          	bgeu	a1,a2,1776 <memset+0x182>
    1750:	00e68523          	sb	a4,10(a3)
    1754:	00b7859b          	addw	a1,a5,11
    1758:	00c5ff63          	bgeu	a1,a2,1776 <memset+0x182>
    175c:	00e685a3          	sb	a4,11(a3)
    1760:	00c7859b          	addw	a1,a5,12
    1764:	00c5f963          	bgeu	a1,a2,1776 <memset+0x182>
    1768:	00e68623          	sb	a4,12(a3)
    176c:	27b5                	addw	a5,a5,13
    176e:	00c7f463          	bgeu	a5,a2,1776 <memset+0x182>
    1772:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1776:	8082                	ret
    1778:	482d                	li	a6,11
    177a:	bd61                	j	1612 <memset+0x1e>
    char *p = dest;
    177c:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    177e:	4e01                	li	t3,0
    1780:	bded                	j	167a <memset+0x86>
    1782:	00150593          	add	a1,a0,1
    1786:	4e05                	li	t3,1
    1788:	bdcd                	j	167a <memset+0x86>
    178a:	8082                	ret
    char *p = dest;
    178c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    178e:	4781                	li	a5,0
    1790:	b7a1                	j	16d8 <memset+0xe4>
    1792:	00250593          	add	a1,a0,2
    1796:	4e09                	li	t3,2
    1798:	b5cd                	j	167a <memset+0x86>

000000000000179a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    179a:	00054783          	lbu	a5,0(a0)
    179e:	0005c703          	lbu	a4,0(a1)
    17a2:	00e79863          	bne	a5,a4,17b2 <strcmp+0x18>
    17a6:	0505                	add	a0,a0,1
    17a8:	0585                	add	a1,a1,1
    17aa:	fbe5                	bnez	a5,179a <strcmp>
    17ac:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ae:	9d19                	subw	a0,a0,a4
    17b0:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17b2:	0007851b          	sext.w	a0,a5
    17b6:	bfe5                	j	17ae <strcmp+0x14>

00000000000017b8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17b8:	ca15                	beqz	a2,17ec <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ba:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17be:	167d                	add	a2,a2,-1
    17c0:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17c4:	eb99                	bnez	a5,17da <strncmp+0x22>
    17c6:	a815                	j	17fa <strncmp+0x42>
    17c8:	00a68e63          	beq	a3,a0,17e4 <strncmp+0x2c>
    17cc:	0505                	add	a0,a0,1
    17ce:	00f71b63          	bne	a4,a5,17e4 <strncmp+0x2c>
    17d2:	00054783          	lbu	a5,0(a0)
    17d6:	cf89                	beqz	a5,17f0 <strncmp+0x38>
    17d8:	85b2                	mv	a1,a2
    17da:	0005c703          	lbu	a4,0(a1)
    17de:	00158613          	add	a2,a1,1
    17e2:	f37d                	bnez	a4,17c8 <strncmp+0x10>
        ;
    return *l - *r;
    17e4:	0007851b          	sext.w	a0,a5
    17e8:	9d19                	subw	a0,a0,a4
    17ea:	8082                	ret
        return 0;
    17ec:	4501                	li	a0,0
}
    17ee:	8082                	ret
    return *l - *r;
    17f0:	0015c703          	lbu	a4,1(a1)
    17f4:	4501                	li	a0,0
    17f6:	9d19                	subw	a0,a0,a4
    17f8:	8082                	ret
    17fa:	0005c703          	lbu	a4,0(a1)
    17fe:	4501                	li	a0,0
    1800:	b7e5                	j	17e8 <strncmp+0x30>

0000000000001802 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1802:	00757793          	and	a5,a0,7
    1806:	cf89                	beqz	a5,1820 <strlen+0x1e>
    1808:	87aa                	mv	a5,a0
    180a:	a029                	j	1814 <strlen+0x12>
    180c:	0785                	add	a5,a5,1
    180e:	0077f713          	and	a4,a5,7
    1812:	cb01                	beqz	a4,1822 <strlen+0x20>
        if (!*s)
    1814:	0007c703          	lbu	a4,0(a5)
    1818:	fb75                	bnez	a4,180c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    181a:	40a78533          	sub	a0,a5,a0
}
    181e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1820:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1822:	6394                	ld	a3,0(a5)
    1824:	00000597          	auipc	a1,0x0
    1828:	69c5b583          	ld	a1,1692(a1) # 1ec0 <__func__.0+0x8>
    182c:	00000617          	auipc	a2,0x0
    1830:	69c63603          	ld	a2,1692(a2) # 1ec8 <__func__.0+0x10>
    1834:	a019                	j	183a <strlen+0x38>
    1836:	6794                	ld	a3,8(a5)
    1838:	07a1                	add	a5,a5,8
    183a:	00b68733          	add	a4,a3,a1
    183e:	fff6c693          	not	a3,a3
    1842:	8f75                	and	a4,a4,a3
    1844:	8f71                	and	a4,a4,a2
    1846:	db65                	beqz	a4,1836 <strlen+0x34>
    for (; *s; s++)
    1848:	0007c703          	lbu	a4,0(a5)
    184c:	d779                	beqz	a4,181a <strlen+0x18>
    184e:	0017c703          	lbu	a4,1(a5)
    1852:	0785                	add	a5,a5,1
    1854:	d379                	beqz	a4,181a <strlen+0x18>
    1856:	0017c703          	lbu	a4,1(a5)
    185a:	0785                	add	a5,a5,1
    185c:	fb6d                	bnez	a4,184e <strlen+0x4c>
    185e:	bf75                	j	181a <strlen+0x18>

0000000000001860 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1860:	00757713          	and	a4,a0,7
{
    1864:	87aa                	mv	a5,a0
    1866:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    186a:	cb19                	beqz	a4,1880 <memchr+0x20>
    186c:	ce25                	beqz	a2,18e4 <memchr+0x84>
    186e:	0007c703          	lbu	a4,0(a5)
    1872:	00b70763          	beq	a4,a1,1880 <memchr+0x20>
    1876:	0785                	add	a5,a5,1
    1878:	0077f713          	and	a4,a5,7
    187c:	167d                	add	a2,a2,-1
    187e:	f77d                	bnez	a4,186c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1880:	4501                	li	a0,0
    if (n && *s != c)
    1882:	c235                	beqz	a2,18e6 <memchr+0x86>
    1884:	0007c703          	lbu	a4,0(a5)
    1888:	06b70063          	beq	a4,a1,18e8 <memchr+0x88>
        size_t k = ONES * c;
    188c:	00000517          	auipc	a0,0x0
    1890:	64453503          	ld	a0,1604(a0) # 1ed0 <__func__.0+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1894:	471d                	li	a4,7
        size_t k = ONES * c;
    1896:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    189a:	04c77763          	bgeu	a4,a2,18e8 <memchr+0x88>
    189e:	00000897          	auipc	a7,0x0
    18a2:	6228b883          	ld	a7,1570(a7) # 1ec0 <__func__.0+0x8>
    18a6:	00000817          	auipc	a6,0x0
    18aa:	62283803          	ld	a6,1570(a6) # 1ec8 <__func__.0+0x10>
    18ae:	431d                	li	t1,7
    18b0:	a029                	j	18ba <memchr+0x5a>
    18b2:	1661                	add	a2,a2,-8
    18b4:	07a1                	add	a5,a5,8
    18b6:	00c37c63          	bgeu	t1,a2,18ce <memchr+0x6e>
    18ba:	6398                	ld	a4,0(a5)
    18bc:	8f29                	xor	a4,a4,a0
    18be:	011706b3          	add	a3,a4,a7
    18c2:	fff74713          	not	a4,a4
    18c6:	8f75                	and	a4,a4,a3
    18c8:	01077733          	and	a4,a4,a6
    18cc:	d37d                	beqz	a4,18b2 <memchr+0x52>
    18ce:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    18d0:	e601                	bnez	a2,18d8 <memchr+0x78>
    18d2:	a809                	j	18e4 <memchr+0x84>
    18d4:	0505                	add	a0,a0,1
    18d6:	c619                	beqz	a2,18e4 <memchr+0x84>
    18d8:	00054783          	lbu	a5,0(a0)
    18dc:	167d                	add	a2,a2,-1
    18de:	feb79be3          	bne	a5,a1,18d4 <memchr+0x74>
    18e2:	8082                	ret
    return n ? (void *)s : 0;
    18e4:	4501                	li	a0,0
}
    18e6:	8082                	ret
    if (n && *s != c)
    18e8:	853e                	mv	a0,a5
    18ea:	b7fd                	j	18d8 <memchr+0x78>

00000000000018ec <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18ec:	1101                	add	sp,sp,-32
    18ee:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    18f0:	862e                	mv	a2,a1
{
    18f2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    18f4:	4581                	li	a1,0
{
    18f6:	e426                	sd	s1,8(sp)
    18f8:	ec06                	sd	ra,24(sp)
    18fa:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    18fc:	f65ff0ef          	jal	1860 <memchr>
    return p ? p - s : n;
    1900:	c519                	beqz	a0,190e <strnlen+0x22>
}
    1902:	60e2                	ld	ra,24(sp)
    1904:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1906:	8d05                	sub	a0,a0,s1
}
    1908:	64a2                	ld	s1,8(sp)
    190a:	6105                	add	sp,sp,32
    190c:	8082                	ret
    190e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1910:	8522                	mv	a0,s0
}
    1912:	6442                	ld	s0,16(sp)
    1914:	64a2                	ld	s1,8(sp)
    1916:	6105                	add	sp,sp,32
    1918:	8082                	ret

000000000000191a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    191a:	00a5c7b3          	xor	a5,a1,a0
    191e:	8b9d                	and	a5,a5,7
    1920:	eb95                	bnez	a5,1954 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1922:	0075f793          	and	a5,a1,7
    1926:	e7b1                	bnez	a5,1972 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1928:	6198                	ld	a4,0(a1)
    192a:	00000617          	auipc	a2,0x0
    192e:	59663603          	ld	a2,1430(a2) # 1ec0 <__func__.0+0x8>
    1932:	00000817          	auipc	a6,0x0
    1936:	59683803          	ld	a6,1430(a6) # 1ec8 <__func__.0+0x10>
    193a:	a029                	j	1944 <strcpy+0x2a>
    193c:	05a1                	add	a1,a1,8
    193e:	e118                	sd	a4,0(a0)
    1940:	6198                	ld	a4,0(a1)
    1942:	0521                	add	a0,a0,8
    1944:	00c707b3          	add	a5,a4,a2
    1948:	fff74693          	not	a3,a4
    194c:	8ff5                	and	a5,a5,a3
    194e:	0107f7b3          	and	a5,a5,a6
    1952:	d7ed                	beqz	a5,193c <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1954:	0005c783          	lbu	a5,0(a1)
    1958:	00f50023          	sb	a5,0(a0)
    195c:	c785                	beqz	a5,1984 <strcpy+0x6a>
    195e:	0015c783          	lbu	a5,1(a1)
    1962:	0505                	add	a0,a0,1
    1964:	0585                	add	a1,a1,1
    1966:	00f50023          	sb	a5,0(a0)
    196a:	fbf5                	bnez	a5,195e <strcpy+0x44>
        ;
    return d;
}
    196c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    196e:	0505                	add	a0,a0,1
    1970:	df45                	beqz	a4,1928 <strcpy+0xe>
            if (!(*d = *s))
    1972:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1976:	0585                	add	a1,a1,1
    1978:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    197c:	00f50023          	sb	a5,0(a0)
    1980:	f7fd                	bnez	a5,196e <strcpy+0x54>
}
    1982:	8082                	ret
    1984:	8082                	ret

0000000000001986 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1986:	00a5c7b3          	xor	a5,a1,a0
    198a:	8b9d                	and	a5,a5,7
    198c:	e3b5                	bnez	a5,19f0 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    198e:	0075f793          	and	a5,a1,7
    1992:	cf99                	beqz	a5,19b0 <strncpy+0x2a>
    1994:	ea09                	bnez	a2,19a6 <strncpy+0x20>
    1996:	a421                	j	1b9e <strncpy+0x218>
    1998:	0585                	add	a1,a1,1
    199a:	0075f793          	and	a5,a1,7
    199e:	167d                	add	a2,a2,-1
    19a0:	0505                	add	a0,a0,1
    19a2:	c799                	beqz	a5,19b0 <strncpy+0x2a>
    19a4:	c225                	beqz	a2,1a04 <strncpy+0x7e>
    19a6:	0005c783          	lbu	a5,0(a1)
    19aa:	00f50023          	sb	a5,0(a0)
    19ae:	f7ed                	bnez	a5,1998 <strncpy+0x12>
            ;
        if (!n || !*s)
    19b0:	ca31                	beqz	a2,1a04 <strncpy+0x7e>
    19b2:	0005c783          	lbu	a5,0(a1)
    19b6:	cba1                	beqz	a5,1a06 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    19b8:	479d                	li	a5,7
    19ba:	02c7fc63          	bgeu	a5,a2,19f2 <strncpy+0x6c>
    19be:	00000897          	auipc	a7,0x0
    19c2:	5028b883          	ld	a7,1282(a7) # 1ec0 <__func__.0+0x8>
    19c6:	00000817          	auipc	a6,0x0
    19ca:	50283803          	ld	a6,1282(a6) # 1ec8 <__func__.0+0x10>
    19ce:	431d                	li	t1,7
    19d0:	a039                	j	19de <strncpy+0x58>
            *wd = *ws;
    19d2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    19d4:	1661                	add	a2,a2,-8
    19d6:	05a1                	add	a1,a1,8
    19d8:	0521                	add	a0,a0,8
    19da:	00c37b63          	bgeu	t1,a2,19f0 <strncpy+0x6a>
    19de:	6198                	ld	a4,0(a1)
    19e0:	011707b3          	add	a5,a4,a7
    19e4:	fff74693          	not	a3,a4
    19e8:	8ff5                	and	a5,a5,a3
    19ea:	0107f7b3          	and	a5,a5,a6
    19ee:	d3f5                	beqz	a5,19d2 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    19f0:	ca11                	beqz	a2,1a04 <strncpy+0x7e>
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	0585                	add	a1,a1,1
    19f8:	00f50023          	sb	a5,0(a0)
    19fc:	c789                	beqz	a5,1a06 <strncpy+0x80>
    19fe:	167d                	add	a2,a2,-1
    1a00:	0505                	add	a0,a0,1
    1a02:	fa65                	bnez	a2,19f2 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a04:	8082                	ret
    1a06:	4805                	li	a6,1
    1a08:	14061b63          	bnez	a2,1b5e <strncpy+0x1d8>
    1a0c:	40a00733          	neg	a4,a0
    1a10:	00777793          	and	a5,a4,7
    1a14:	4581                	li	a1,0
    1a16:	12061c63          	bnez	a2,1b4e <strncpy+0x1c8>
    1a1a:	00778693          	add	a3,a5,7
    1a1e:	48ad                	li	a7,11
    1a20:	1316e563          	bltu	a3,a7,1b4a <strncpy+0x1c4>
    1a24:	16d5e263          	bltu	a1,a3,1b88 <strncpy+0x202>
    1a28:	14078c63          	beqz	a5,1b80 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a2c:	00050023          	sb	zero,0(a0)
    1a30:	00677693          	and	a3,a4,6
    1a34:	14068263          	beqz	a3,1b78 <strncpy+0x1f2>
    1a38:	000500a3          	sb	zero,1(a0)
    1a3c:	4689                	li	a3,2
    1a3e:	14f6f863          	bgeu	a3,a5,1b8e <strncpy+0x208>
    1a42:	00050123          	sb	zero,2(a0)
    1a46:	8b11                	and	a4,a4,4
    1a48:	12070463          	beqz	a4,1b70 <strncpy+0x1ea>
    1a4c:	000501a3          	sb	zero,3(a0)
    1a50:	4711                	li	a4,4
    1a52:	00450693          	add	a3,a0,4
    1a56:	02f77563          	bgeu	a4,a5,1a80 <strncpy+0xfa>
    1a5a:	00050223          	sb	zero,4(a0)
    1a5e:	4715                	li	a4,5
    1a60:	00550693          	add	a3,a0,5
    1a64:	00e78e63          	beq	a5,a4,1a80 <strncpy+0xfa>
    1a68:	fff50713          	add	a4,a0,-1
    1a6c:	000502a3          	sb	zero,5(a0)
    1a70:	8b1d                	and	a4,a4,7
    1a72:	12071263          	bnez	a4,1b96 <strncpy+0x210>
    1a76:	00750693          	add	a3,a0,7
    1a7a:	00050323          	sb	zero,6(a0)
    1a7e:	471d                	li	a4,7
    1a80:	40f80833          	sub	a6,a6,a5
    1a84:	ff887593          	and	a1,a6,-8
    1a88:	97aa                	add	a5,a5,a0
    1a8a:	95be                	add	a1,a1,a5
    1a8c:	0007b023          	sd	zero,0(a5)
    1a90:	07a1                	add	a5,a5,8
    1a92:	feb79de3          	bne	a5,a1,1a8c <strncpy+0x106>
    1a96:	ff887593          	and	a1,a6,-8
    1a9a:	00787813          	and	a6,a6,7
    1a9e:	00e587bb          	addw	a5,a1,a4
    1aa2:	00b68733          	add	a4,a3,a1
    1aa6:	0e080063          	beqz	a6,1b86 <strncpy+0x200>
    1aaa:	00070023          	sb	zero,0(a4)
    1aae:	0017869b          	addw	a3,a5,1
    1ab2:	f4c6f9e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1ab6:	000700a3          	sb	zero,1(a4)
    1aba:	0027869b          	addw	a3,a5,2
    1abe:	f4c6f3e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1ac2:	00070123          	sb	zero,2(a4)
    1ac6:	0037869b          	addw	a3,a5,3
    1aca:	f2c6fde3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1ace:	000701a3          	sb	zero,3(a4)
    1ad2:	0047869b          	addw	a3,a5,4
    1ad6:	f2c6f7e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1ada:	00070223          	sb	zero,4(a4)
    1ade:	0057869b          	addw	a3,a5,5
    1ae2:	f2c6f1e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1ae6:	000702a3          	sb	zero,5(a4)
    1aea:	0067869b          	addw	a3,a5,6
    1aee:	f0c6fbe3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1af2:	00070323          	sb	zero,6(a4)
    1af6:	0077869b          	addw	a3,a5,7
    1afa:	f0c6f5e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1afe:	000703a3          	sb	zero,7(a4)
    1b02:	0087869b          	addw	a3,a5,8
    1b06:	eec6ffe3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1b0a:	00070423          	sb	zero,8(a4)
    1b0e:	0097869b          	addw	a3,a5,9
    1b12:	eec6f9e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1b16:	000704a3          	sb	zero,9(a4)
    1b1a:	00a7869b          	addw	a3,a5,10
    1b1e:	eec6f3e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1b22:	00070523          	sb	zero,10(a4)
    1b26:	00b7869b          	addw	a3,a5,11
    1b2a:	ecc6fde3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1b2e:	000705a3          	sb	zero,11(a4)
    1b32:	00c7869b          	addw	a3,a5,12
    1b36:	ecc6f7e3          	bgeu	a3,a2,1a04 <strncpy+0x7e>
    1b3a:	00070623          	sb	zero,12(a4)
    1b3e:	27b5                	addw	a5,a5,13
    1b40:	ecc7f2e3          	bgeu	a5,a2,1a04 <strncpy+0x7e>
    1b44:	000706a3          	sb	zero,13(a4)
}
    1b48:	8082                	ret
    1b4a:	46ad                	li	a3,11
    1b4c:	bde1                	j	1a24 <strncpy+0x9e>
    1b4e:	00778693          	add	a3,a5,7
    1b52:	48ad                	li	a7,11
    1b54:	fff60593          	add	a1,a2,-1
    1b58:	ed16f6e3          	bgeu	a3,a7,1a24 <strncpy+0x9e>
    1b5c:	b7fd                	j	1b4a <strncpy+0x1c4>
    1b5e:	40a00733          	neg	a4,a0
    1b62:	8832                	mv	a6,a2
    1b64:	00777793          	and	a5,a4,7
    1b68:	4581                	li	a1,0
    1b6a:	ea0608e3          	beqz	a2,1a1a <strncpy+0x94>
    1b6e:	b7c5                	j	1b4e <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b70:	00350693          	add	a3,a0,3
    1b74:	470d                	li	a4,3
    1b76:	b729                	j	1a80 <strncpy+0xfa>
    1b78:	00150693          	add	a3,a0,1
    1b7c:	4705                	li	a4,1
    1b7e:	b709                	j	1a80 <strncpy+0xfa>
tail:
    1b80:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b82:	4701                	li	a4,0
    1b84:	bdf5                	j	1a80 <strncpy+0xfa>
    1b86:	8082                	ret
tail:
    1b88:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b8a:	4781                	li	a5,0
    1b8c:	bf39                	j	1aaa <strncpy+0x124>
    1b8e:	00250693          	add	a3,a0,2
    1b92:	4709                	li	a4,2
    1b94:	b5f5                	j	1a80 <strncpy+0xfa>
    1b96:	00650693          	add	a3,a0,6
    1b9a:	4719                	li	a4,6
    1b9c:	b5d5                	j	1a80 <strncpy+0xfa>
    1b9e:	8082                	ret

0000000000001ba0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1ba0:	87aa                	mv	a5,a0
    1ba2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1ba4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ba8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bac:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bae:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bb0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bb4:	2501                	sext.w	a0,a0
    1bb6:	8082                	ret

0000000000001bb8 <openat>:
    register long a7 __asm__("a7") = n;
    1bb8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bbc:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bc0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bc4:	2501                	sext.w	a0,a0
    1bc6:	8082                	ret

0000000000001bc8 <close>:
    register long a7 __asm__("a7") = n;
    1bc8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bcc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bd0:	2501                	sext.w	a0,a0
    1bd2:	8082                	ret

0000000000001bd4 <read>:
    register long a7 __asm__("a7") = n;
    1bd4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bd8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bdc:	8082                	ret

0000000000001bde <write>:
    register long a7 __asm__("a7") = n;
    1bde:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1be2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1be6:	8082                	ret

0000000000001be8 <getpid>:
    register long a7 __asm__("a7") = n;
    1be8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1bec:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1bf0:	2501                	sext.w	a0,a0
    1bf2:	8082                	ret

0000000000001bf4 <getppid>:
    register long a7 __asm__("a7") = n;
    1bf4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1bf8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1bfc:	2501                	sext.w	a0,a0
    1bfe:	8082                	ret

0000000000001c00 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c00:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c04:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c08:	2501                	sext.w	a0,a0
    1c0a:	8082                	ret

0000000000001c0c <fork>:
    register long a7 __asm__("a7") = n;
    1c0c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c10:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c14:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c18:	2501                	sext.w	a0,a0
    1c1a:	8082                	ret

0000000000001c1c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c1c:	85b2                	mv	a1,a2
    1c1e:	863a                	mv	a2,a4
    if (stack)
    1c20:	c191                	beqz	a1,1c24 <clone+0x8>
	stack += stack_size;
    1c22:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c24:	4781                	li	a5,0
    1c26:	4701                	li	a4,0
    1c28:	4681                	li	a3,0
    1c2a:	2601                	sext.w	a2,a2
    1c2c:	ac01                	j	1e3c <__clone>

0000000000001c2e <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c2e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c32:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c36:	8082                	ret

0000000000001c38 <exit>:
    register long a7 __asm__("a7") = n;
    1c38:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c3c:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c40:	8082                	ret

0000000000001c42 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c42:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c46:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c48:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <exec>:
    register long a7 __asm__("a7") = n;
    1c50:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c54:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <execve>:
    register long a7 __asm__("a7") = n;
    1c5c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c60:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <times>:
    register long a7 __asm__("a7") = n;
    1c68:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c6c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <get_time>:

int64 get_time()
{
    1c74:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c76:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c7a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c7c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c7e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c82:	2501                	sext.w	a0,a0
    1c84:	ed09                	bnez	a0,1c9e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c86:	67a2                	ld	a5,8(sp)
    1c88:	3e800713          	li	a4,1000
    1c8c:	00015503          	lhu	a0,0(sp)
    1c90:	02e7d7b3          	divu	a5,a5,a4
    1c94:	02e50533          	mul	a0,a0,a4
    1c98:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1c9a:	0141                	add	sp,sp,16
    1c9c:	8082                	ret
        return -1;
    1c9e:	557d                	li	a0,-1
    1ca0:	bfed                	j	1c9a <get_time+0x26>

0000000000001ca2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ca2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <time>:
    register long a7 __asm__("a7") = n;
    1cae:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <sleep>:

int sleep(unsigned long long time)
{
    1cba:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cbc:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cbe:	850a                	mv	a0,sp
    1cc0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cc2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cc6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ccc:	e501                	bnez	a0,1cd4 <sleep+0x1a>
    return 0;
    1cce:	4501                	li	a0,0
}
    1cd0:	0141                	add	sp,sp,16
    1cd2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cd4:	4502                	lw	a0,0(sp)
}
    1cd6:	0141                	add	sp,sp,16
    1cd8:	8082                	ret

0000000000001cda <set_priority>:
    register long a7 __asm__("a7") = n;
    1cda:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ce6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1cea:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1cee:	8082                	ret

0000000000001cf0 <mprotect>:
    register long a7 __asm__("a7") = n;
    1cf0:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf4:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <munmap>:
    register long a7 __asm__("a7") = n;
    1cfc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d00:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <wait>:

int wait(int *code)
{
    1d08:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d0a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d0e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d10:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d12:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d14:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <spawn>:
    register long a7 __asm__("a7") = n;
    1d1c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <mailread>:
    register long a7 __asm__("a7") = n;
    1d28:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d34:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d38:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <fstat>:
    register long a7 __asm__("a7") = n;
    1d40:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1d4c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d4e:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1d52:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d54:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d5c:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d5e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d62:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d64:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d6c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d6e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d72:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d74:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <link>:

int link(char *old_path, char *new_path)
{
    1d7c:	87aa                	mv	a5,a0
    1d7e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d80:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d84:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d88:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d8a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d8e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d90:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <unlink>:

int unlink(char *path)
{
    1d98:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d9a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d9e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1da2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <uname>:
    register long a7 __asm__("a7") = n;
    1dac:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1db0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <brk>:
    register long a7 __asm__("a7") = n;
    1db8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1dc4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dca:	8082                	ret

0000000000001dcc <chdir>:
    register long a7 __asm__("a7") = n;
    1dcc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dd0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dd8:	862e                	mv	a2,a1
    1dda:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ddc:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dde:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1de2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <getdents>:
    register long a7 __asm__("a7") = n;
    1df2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <pipe>:
    register long a7 __asm__("a7") = n;
    1dfe:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e02:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e04:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <dup>:
    register long a7 __asm__("a7") = n;
    1e0c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <dup2>:
    register long a7 __asm__("a7") = n;
    1e16:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e18:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <mount>:
    register long a7 __asm__("a7") = n;
    1e22:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e26:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <umount>:
    register long a7 __asm__("a7") = n;
    1e2e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e3c:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e3e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e40:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e42:	8532                	mv	a0,a2
	mv a2, a4
    1e44:	863a                	mv	a2,a4
	mv a3, a5
    1e46:	86be                	mv	a3,a5
	mv a4, a6
    1e48:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e4a:	0dc00893          	li	a7,220
	ecall
    1e4e:	00000073          	ecall

	beqz a0, 1f
    1e52:	c111                	beqz	a0,1e56 <__clone+0x1a>
	# Parent
	ret
    1e54:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e56:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e58:	6522                	ld	a0,8(sp)
	jalr a1
    1e5a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e5c:	05d00893          	li	a7,93
	ecall
    1e60:	00000073          	ecall
