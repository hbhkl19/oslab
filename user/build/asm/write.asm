
/home/hbh/oslab/oslab/user/build/riscv64/write:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a851                	j	1096 <__start_main>

0000000000001004 <test_write>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

void test_write(){
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eca50513          	add	a0,a0,-310 # 1ed0 <__clone+0x2c>
void test_write(){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1012:	2dc000ef          	jal	12ee <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f5a50513          	add	a0,a0,-166 # 1f70 <__func__.0>
    101e:	2d0000ef          	jal	12ee <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ec650513          	add	a0,a0,-314 # 1ee8 <__clone+0x44>
    102a:	2c4000ef          	jal	12ee <puts>
	const char *str = "Hello operating system contest.\n";
	int str_len = strlen(str);
    102e:	00001517          	auipc	a0,0x1
    1032:	eca50513          	add	a0,a0,-310 # 1ef8 <__clone+0x54>
    1036:	035000ef          	jal	186a <strlen>
    103a:	0005041b          	sext.w	s0,a0
	assert(write(STDOUT, str, str_len) == str_len);
    103e:	8622                	mv	a2,s0
    1040:	00001597          	auipc	a1,0x1
    1044:	eb858593          	add	a1,a1,-328 # 1ef8 <__clone+0x54>
    1048:	4505                	li	a0,1
    104a:	3fd000ef          	jal	1c46 <write>
    104e:	00850863          	beq	a0,s0,105e <test_write+0x5a>
    1052:	00001517          	auipc	a0,0x1
    1056:	ece50513          	add	a0,a0,-306 # 1f20 <__clone+0x7c>
    105a:	530000ef          	jal	158a <panic>
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	ee250513          	add	a0,a0,-286 # 1f40 <__clone+0x9c>
    1066:	288000ef          	jal	12ee <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	f0650513          	add	a0,a0,-250 # 1f70 <__func__.0>
    1072:	27c000ef          	jal	12ee <puts>
}
    1076:	6402                	ld	s0,0(sp)
    1078:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    107a:	00001517          	auipc	a0,0x1
    107e:	e6e50513          	add	a0,a0,-402 # 1ee8 <__clone+0x44>
}
    1082:	0141                	add	sp,sp,16
	TEST_END(__func__);
    1084:	a4ad                	j	12ee <puts>

0000000000001086 <main>:

int main(void) {
    1086:	1141                	add	sp,sp,-16
    1088:	e406                	sd	ra,8(sp)
	test_write();
    108a:	f7bff0ef          	jal	1004 <test_write>
	return 0;
}
    108e:	60a2                	ld	ra,8(sp)
    1090:	4501                	li	a0,0
    1092:	0141                	add	sp,sp,16
    1094:	8082                	ret

0000000000001096 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1096:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1098:	4108                	lw	a0,0(a0)
{
    109a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    109c:	05a1                	add	a1,a1,8
{
    109e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a0:	fe7ff0ef          	jal	1086 <main>
    10a4:	3fd000ef          	jal	1ca0 <exit>
	return 0;
}
    10a8:	60a2                	ld	ra,8(sp)
    10aa:	4501                	li	a0,0
    10ac:	0141                	add	sp,sp,16
    10ae:	8082                	ret

00000000000010b0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b0:	7179                	add	sp,sp,-48
    10b2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10b4:	12054863          	bltz	a0,11e4 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b8:	02b577bb          	remuw	a5,a0,a1
    10bc:	00001697          	auipc	a3,0x1
    10c0:	ec468693          	add	a3,a3,-316 # 1f80 <digits>
    buf[16] = 0;
    10c4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c8:	0005871b          	sext.w	a4,a1
    10cc:	1782                	sll	a5,a5,0x20
    10ce:	9381                	srl	a5,a5,0x20
    10d0:	97b6                	add	a5,a5,a3
    10d2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10d6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10da:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10de:	1ab56663          	bltu	a0,a1,128a <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10e2:	02e8763b          	remuw	a2,a6,a4
    10e6:	1602                	sll	a2,a2,0x20
    10e8:	9201                	srl	a2,a2,0x20
    10ea:	9636                	add	a2,a2,a3
    10ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10f4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f8:	12e86c63          	bltu	a6,a4,1230 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10fc:	02e5f63b          	remuw	a2,a1,a4
    1100:	1602                	sll	a2,a2,0x20
    1102:	9201                	srl	a2,a2,0x20
    1104:	9636                	add	a2,a2,a3
    1106:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    110e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1112:	12e5e863          	bltu	a1,a4,1242 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1116:	02e8763b          	remuw	a2,a6,a4
    111a:	1602                	sll	a2,a2,0x20
    111c:	9201                	srl	a2,a2,0x20
    111e:	9636                	add	a2,a2,a3
    1120:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1124:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1128:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    112c:	12e86463          	bltu	a6,a4,1254 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1130:	02e5f63b          	remuw	a2,a1,a4
    1134:	1602                	sll	a2,a2,0x20
    1136:	9201                	srl	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1142:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1146:	12e5e063          	bltu	a1,a4,1266 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    114a:	02e8763b          	remuw	a2,a6,a4
    114e:	1602                	sll	a2,a2,0x20
    1150:	9201                	srl	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1160:	0ae86f63          	bltu	a6,a4,121e <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1164:	02e5f63b          	remuw	a2,a1,a4
    1168:	1602                	sll	a2,a2,0x20
    116a:	9201                	srl	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1176:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    117a:	0ee5ef63          	bltu	a1,a4,1278 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    117e:	02e8763b          	remuw	a2,a6,a4
    1182:	1602                	sll	a2,a2,0x20
    1184:	9201                	srl	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1190:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1194:	0ee86d63          	bltu	a6,a4,128e <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1198:	02e5f63b          	remuw	a2,a1,a4
    119c:	1602                	sll	a2,a2,0x20
    119e:	9201                	srl	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11aa:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ae:	0ee5e963          	bltu	a1,a4,12a0 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11b2:	1782                	sll	a5,a5,0x20
    11b4:	9381                	srl	a5,a5,0x20
    11b6:	96be                	add	a3,a3,a5
    11b8:	0006c783          	lbu	a5,0(a3)
    11bc:	4599                	li	a1,6
    11be:	00f10723          	sb	a5,14(sp)

    if (sign)
    11c2:	00055763          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11c6:	02d00793          	li	a5,45
    11ca:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ce:	4595                	li	a1,5
    write(f, s, l);
    11d0:	003c                	add	a5,sp,8
    11d2:	4641                	li	a2,16
    11d4:	9e0d                	subw	a2,a2,a1
    11d6:	4505                	li	a0,1
    11d8:	95be                	add	a1,a1,a5
    11da:	26d000ef          	jal	1c46 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11de:	70a2                	ld	ra,40(sp)
    11e0:	6145                	add	sp,sp,48
    11e2:	8082                	ret
        x = -xx;
    11e4:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11e8:	02b677bb          	remuw	a5,a2,a1
    11ec:	00001697          	auipc	a3,0x1
    11f0:	d9468693          	add	a3,a3,-620 # 1f80 <digits>
    buf[16] = 0;
    11f4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11f8:	0005871b          	sext.w	a4,a1
    11fc:	1782                	sll	a5,a5,0x20
    11fe:	9381                	srl	a5,a5,0x20
    1200:	97b6                	add	a5,a5,a3
    1202:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1206:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    120a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    120e:	ecb67ae3          	bgeu	a2,a1,10e2 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1212:	02d00793          	li	a5,45
    1216:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    121a:	45b9                	li	a1,14
    121c:	bf55                	j	11d0 <printint.constprop.0+0x120>
    121e:	45a9                	li	a1,10
    if (sign)
    1220:	fa0558e3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1224:	02d00793          	li	a5,45
    1228:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    122c:	45a5                	li	a1,9
    122e:	b74d                	j	11d0 <printint.constprop.0+0x120>
    1230:	45b9                	li	a1,14
    if (sign)
    1232:	f8055fe3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1236:	02d00793          	li	a5,45
    123a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    123e:	45b5                	li	a1,13
    1240:	bf41                	j	11d0 <printint.constprop.0+0x120>
    1242:	45b5                	li	a1,13
    if (sign)
    1244:	f80556e3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1248:	02d00793          	li	a5,45
    124c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1250:	45b1                	li	a1,12
    1252:	bfbd                	j	11d0 <printint.constprop.0+0x120>
    1254:	45b1                	li	a1,12
    if (sign)
    1256:	f6055de3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125a:	02d00793          	li	a5,45
    125e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1262:	45ad                	li	a1,11
    1264:	b7b5                	j	11d0 <printint.constprop.0+0x120>
    1266:	45ad                	li	a1,11
    if (sign)
    1268:	f60554e3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1274:	45a9                	li	a1,10
    1276:	bfa9                	j	11d0 <printint.constprop.0+0x120>
    1278:	45a5                	li	a1,9
    if (sign)
    127a:	f4055be3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1286:	45a1                	li	a1,8
    1288:	b7a1                	j	11d0 <printint.constprop.0+0x120>
    i = 15;
    128a:	45bd                	li	a1,15
    128c:	b791                	j	11d0 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    128e:	45a1                	li	a1,8
    if (sign)
    1290:	f40550e3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    129c:	459d                	li	a1,7
    129e:	bf0d                	j	11d0 <printint.constprop.0+0x120>
    12a0:	459d                	li	a1,7
    if (sign)
    12a2:	f20557e3          	bgez	a0,11d0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ae:	4599                	li	a1,6
    12b0:	b705                	j	11d0 <printint.constprop.0+0x120>

00000000000012b2 <getchar>:
{
    12b2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12b4:	00f10593          	add	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4501                	li	a0,0
{
    12bc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12be:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c2:	17b000ef          	jal	1c3c <read>
}
    12c6:	60e2                	ld	ra,24(sp)
    12c8:	00f14503          	lbu	a0,15(sp)
    12cc:	6105                	add	sp,sp,32
    12ce:	8082                	ret

00000000000012d0 <putchar>:
{
    12d0:	1101                	add	sp,sp,-32
    12d2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d4:	00f10593          	add	a1,sp,15
    12d8:	4605                	li	a2,1
    12da:	4505                	li	a0,1
{
    12dc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12de:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e2:	165000ef          	jal	1c46 <write>
}
    12e6:	60e2                	ld	ra,24(sp)
    12e8:	2501                	sext.w	a0,a0
    12ea:	6105                	add	sp,sp,32
    12ec:	8082                	ret

00000000000012ee <puts>:
{
    12ee:	1141                	add	sp,sp,-16
    12f0:	e406                	sd	ra,8(sp)
    12f2:	e022                	sd	s0,0(sp)
    12f4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f6:	574000ef          	jal	186a <strlen>
    12fa:	862a                	mv	a2,a0
    12fc:	85a2                	mv	a1,s0
    12fe:	4505                	li	a0,1
    1300:	147000ef          	jal	1c46 <write>
}
    1304:	60a2                	ld	ra,8(sp)
    1306:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	957d                	sra	a0,a0,0x3f
    return r;
    130a:	2501                	sext.w	a0,a0
}
    130c:	0141                	add	sp,sp,16
    130e:	8082                	ret

0000000000001310 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1310:	7171                	add	sp,sp,-176
    1312:	f85a                	sd	s6,48(sp)
    1314:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1316:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1318:	18bc                	add	a5,sp,120
{
    131a:	e8ca                	sd	s2,80(sp)
    131c:	e4ce                	sd	s3,72(sp)
    131e:	e0d2                	sd	s4,64(sp)
    1320:	fc56                	sd	s5,56(sp)
    1322:	f486                	sd	ra,104(sp)
    1324:	f0a2                	sd	s0,96(sp)
    1326:	eca6                	sd	s1,88(sp)
    1328:	fcae                	sd	a1,120(sp)
    132a:	e132                	sd	a2,128(sp)
    132c:	e536                	sd	a3,136(sp)
    132e:	e93a                	sd	a4,144(sp)
    1330:	f142                	sd	a6,160(sp)
    1332:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1334:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1336:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    133a:	07300a13          	li	s4,115
    133e:	07800a93          	li	s5,120
    buf[i++] = '0';
    1342:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1346:	00001997          	auipc	s3,0x1
    134a:	c3a98993          	add	s3,s3,-966 # 1f80 <digits>
        if (!*s)
    134e:	00054783          	lbu	a5,0(a0)
    1352:	16078a63          	beqz	a5,14c6 <printf+0x1b6>
    1356:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1358:	19278d63          	beq	a5,s2,14f2 <printf+0x1e2>
    135c:	00164783          	lbu	a5,1(a2)
    1360:	0605                	add	a2,a2,1
    1362:	fbfd                	bnez	a5,1358 <printf+0x48>
    1364:	84b2                	mv	s1,a2
        l = z - a;
    1366:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    136a:	85aa                	mv	a1,a0
    136c:	8622                	mv	a2,s0
    136e:	4505                	li	a0,1
    1370:	0d7000ef          	jal	1c46 <write>
        if (l)
    1374:	1a041463          	bnez	s0,151c <printf+0x20c>
        if (s[1] == 0)
    1378:	0014c783          	lbu	a5,1(s1)
    137c:	14078563          	beqz	a5,14c6 <printf+0x1b6>
        switch (s[1])
    1380:	1b478063          	beq	a5,s4,1520 <printf+0x210>
    1384:	14fa6b63          	bltu	s4,a5,14da <printf+0x1ca>
    1388:	06400713          	li	a4,100
    138c:	1ee78063          	beq	a5,a4,156c <printf+0x25c>
    1390:	07000713          	li	a4,112
    1394:	1ae79963          	bne	a5,a4,1546 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1398:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    139a:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    139e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a0:	631c                	ld	a5,0(a4)
    13a2:	0721                	add	a4,a4,8
    13a4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a6:	00479293          	sll	t0,a5,0x4
    13aa:	00879f93          	sll	t6,a5,0x8
    13ae:	00c79f13          	sll	t5,a5,0xc
    13b2:	01079e93          	sll	t4,a5,0x10
    13b6:	01479e13          	sll	t3,a5,0x14
    13ba:	01879313          	sll	t1,a5,0x18
    13be:	01c79893          	sll	a7,a5,0x1c
    13c2:	02479813          	sll	a6,a5,0x24
    13c6:	02879513          	sll	a0,a5,0x28
    13ca:	02c79593          	sll	a1,a5,0x2c
    13ce:	03079693          	sll	a3,a5,0x30
    13d2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d6:	03c7d413          	srl	s0,a5,0x3c
    13da:	01c7d39b          	srlw	t2,a5,0x1c
    13de:	03c2d293          	srl	t0,t0,0x3c
    13e2:	03cfdf93          	srl	t6,t6,0x3c
    13e6:	03cf5f13          	srl	t5,t5,0x3c
    13ea:	03cede93          	srl	t4,t4,0x3c
    13ee:	03ce5e13          	srl	t3,t3,0x3c
    13f2:	03c35313          	srl	t1,t1,0x3c
    13f6:	03c8d893          	srl	a7,a7,0x3c
    13fa:	03c85813          	srl	a6,a6,0x3c
    13fe:	9171                	srl	a0,a0,0x3c
    1400:	91f1                	srl	a1,a1,0x3c
    1402:	92f1                	srl	a3,a3,0x3c
    1404:	9371                	srl	a4,a4,0x3c
    1406:	96ce                	add	a3,a3,s3
    1408:	974e                	add	a4,a4,s3
    140a:	944e                	add	s0,s0,s3
    140c:	92ce                	add	t0,t0,s3
    140e:	9fce                	add	t6,t6,s3
    1410:	9f4e                	add	t5,t5,s3
    1412:	9ece                	add	t4,t4,s3
    1414:	9e4e                	add	t3,t3,s3
    1416:	934e                	add	t1,t1,s3
    1418:	98ce                	add	a7,a7,s3
    141a:	93ce                	add	t2,t2,s3
    141c:	984e                	add	a6,a6,s3
    141e:	954e                	add	a0,a0,s3
    1420:	95ce                	add	a1,a1,s3
    1422:	0006c083          	lbu	ra,0(a3)
    1426:	0002c283          	lbu	t0,0(t0)
    142a:	00074683          	lbu	a3,0(a4)
    142e:	000fcf83          	lbu	t6,0(t6)
    1432:	000f4f03          	lbu	t5,0(t5)
    1436:	000ece83          	lbu	t4,0(t4)
    143a:	000e4e03          	lbu	t3,0(t3)
    143e:	00034303          	lbu	t1,0(t1)
    1442:	0008c883          	lbu	a7,0(a7)
    1446:	0003c383          	lbu	t2,0(t2)
    144a:	00084803          	lbu	a6,0(a6)
    144e:	00054503          	lbu	a0,0(a0)
    1452:	0005c583          	lbu	a1,0(a1)
    1456:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145e:	9371                	srl	a4,a4,0x3c
    1460:	8bbd                	and	a5,a5,15
    1462:	974e                	add	a4,a4,s3
    1464:	97ce                	add	a5,a5,s3
    1466:	005105a3          	sb	t0,11(sp)
    146a:	01f10623          	sb	t6,12(sp)
    146e:	01e106a3          	sb	t5,13(sp)
    1472:	01d10723          	sb	t4,14(sp)
    1476:	01c107a3          	sb	t3,15(sp)
    147a:	00610823          	sb	t1,16(sp)
    147e:	011108a3          	sb	a7,17(sp)
    1482:	00710923          	sb	t2,18(sp)
    1486:	010109a3          	sb	a6,19(sp)
    148a:	00a10a23          	sb	a0,20(sp)
    148e:	00b10aa3          	sb	a1,21(sp)
    1492:	00110b23          	sb	ra,22(sp)
    1496:	00d10ba3          	sb	a3,23(sp)
    149a:	00810523          	sb	s0,10(sp)
    149e:	00074703          	lbu	a4,0(a4)
    14a2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a6:	002c                	add	a1,sp,8
    14a8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14aa:	00e10c23          	sb	a4,24(sp)
    14ae:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b6:	790000ef          	jal	1c46 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ba:	00248513          	add	a0,s1,2
        if (!*s)
    14be:	00054783          	lbu	a5,0(a0)
    14c2:	e8079ae3          	bnez	a5,1356 <printf+0x46>
    }
    va_end(ap);
}
    14c6:	70a6                	ld	ra,104(sp)
    14c8:	7406                	ld	s0,96(sp)
    14ca:	64e6                	ld	s1,88(sp)
    14cc:	6946                	ld	s2,80(sp)
    14ce:	69a6                	ld	s3,72(sp)
    14d0:	6a06                	ld	s4,64(sp)
    14d2:	7ae2                	ld	s5,56(sp)
    14d4:	7b42                	ld	s6,48(sp)
    14d6:	614d                	add	sp,sp,176
    14d8:	8082                	ret
        switch (s[1])
    14da:	07579663          	bne	a5,s5,1546 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14de:	6782                	ld	a5,0(sp)
    14e0:	45c1                	li	a1,16
    14e2:	4388                	lw	a0,0(a5)
    14e4:	07a1                	add	a5,a5,8
    14e6:	e03e                	sd	a5,0(sp)
    14e8:	bc9ff0ef          	jal	10b0 <printint.constprop.0>
        s += 2;
    14ec:	00248513          	add	a0,s1,2
    14f0:	b7f9                	j	14be <printf+0x1ae>
    14f2:	84b2                	mv	s1,a2
    14f4:	a039                	j	1502 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14f6:	0024c783          	lbu	a5,2(s1)
    14fa:	0605                	add	a2,a2,1
    14fc:	0489                	add	s1,s1,2
    14fe:	e72794e3          	bne	a5,s2,1366 <printf+0x56>
    1502:	0014c783          	lbu	a5,1(s1)
    1506:	ff2788e3          	beq	a5,s2,14f6 <printf+0x1e6>
        l = z - a;
    150a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    150e:	85aa                	mv	a1,a0
    1510:	8622                	mv	a2,s0
    1512:	4505                	li	a0,1
    1514:	732000ef          	jal	1c46 <write>
        if (l)
    1518:	e60400e3          	beqz	s0,1378 <printf+0x68>
    151c:	8526                	mv	a0,s1
    151e:	bd05                	j	134e <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1520:	6782                	ld	a5,0(sp)
    1522:	6380                	ld	s0,0(a5)
    1524:	07a1                	add	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	cc21                	beqz	s0,1580 <printf+0x270>
            l = strnlen(a, 200);
    152a:	0c800593          	li	a1,200
    152e:	8522                	mv	a0,s0
    1530:	424000ef          	jal	1954 <strnlen>
    write(f, s, l);
    1534:	0005061b          	sext.w	a2,a0
    1538:	85a2                	mv	a1,s0
    153a:	4505                	li	a0,1
    153c:	70a000ef          	jal	1c46 <write>
        s += 2;
    1540:	00248513          	add	a0,s1,2
    1544:	bfad                	j	14be <printf+0x1ae>
    return write(stdout, &byte, 1);
    1546:	4605                	li	a2,1
    1548:	002c                	add	a1,sp,8
    154a:	4505                	li	a0,1
    char byte = c;
    154c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1550:	6f6000ef          	jal	1c46 <write>
    char byte = c;
    1554:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1558:	4605                	li	a2,1
    155a:	002c                	add	a1,sp,8
    155c:	4505                	li	a0,1
    char byte = c;
    155e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1562:	6e4000ef          	jal	1c46 <write>
        s += 2;
    1566:	00248513          	add	a0,s1,2
    156a:	bf91                	j	14be <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    156c:	6782                	ld	a5,0(sp)
    156e:	45a9                	li	a1,10
    1570:	4388                	lw	a0,0(a5)
    1572:	07a1                	add	a5,a5,8
    1574:	e03e                	sd	a5,0(sp)
    1576:	b3bff0ef          	jal	10b0 <printint.constprop.0>
        s += 2;
    157a:	00248513          	add	a0,s1,2
    157e:	b781                	j	14be <printf+0x1ae>
                a = "(null)";
    1580:	00001417          	auipc	s0,0x1
    1584:	9d040413          	add	s0,s0,-1584 # 1f50 <__clone+0xac>
    1588:	b74d                	j	152a <printf+0x21a>

000000000000158a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    158a:	1141                	add	sp,sp,-16
    158c:	e406                	sd	ra,8(sp)
    puts(m);
    158e:	d61ff0ef          	jal	12ee <puts>
    exit(-100);
}
    1592:	60a2                	ld	ra,8(sp)
    exit(-100);
    1594:	f9c00513          	li	a0,-100
}
    1598:	0141                	add	sp,sp,16
    exit(-100);
    159a:	a719                	j	1ca0 <exit>

000000000000159c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    159c:	02000793          	li	a5,32
    15a0:	00f50663          	beq	a0,a5,15ac <isspace+0x10>
    15a4:	355d                	addw	a0,a0,-9
    15a6:	00553513          	sltiu	a0,a0,5
    15aa:	8082                	ret
    15ac:	4505                	li	a0,1
}
    15ae:	8082                	ret

00000000000015b0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b0:	fd05051b          	addw	a0,a0,-48
}
    15b4:	00a53513          	sltiu	a0,a0,10
    15b8:	8082                	ret

00000000000015ba <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ba:	02000693          	li	a3,32
    15be:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c0:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c4:	ff77871b          	addw	a4,a5,-9
    15c8:	04d78c63          	beq	a5,a3,1620 <atoi+0x66>
    15cc:	0007861b          	sext.w	a2,a5
    15d0:	04e5f863          	bgeu	a1,a4,1620 <atoi+0x66>
        s++;
    switch (*s)
    15d4:	02b00713          	li	a4,43
    15d8:	04e78963          	beq	a5,a4,162a <atoi+0x70>
    15dc:	02d00713          	li	a4,45
    15e0:	06e78263          	beq	a5,a4,1644 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e4:	fd06069b          	addw	a3,a2,-48
    15e8:	47a5                	li	a5,9
    15ea:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15ec:	4301                	li	t1,0
    while (isdigit(*s))
    15ee:	04d7e963          	bltu	a5,a3,1640 <atoi+0x86>
    int n = 0, neg = 0;
    15f2:	4501                	li	a0,0
    while (isdigit(*s))
    15f4:	48a5                	li	a7,9
    15f6:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15fa:	0025179b          	sllw	a5,a0,0x2
    15fe:	9fa9                	addw	a5,a5,a0
    1600:	fd06059b          	addw	a1,a2,-48
    1604:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1608:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    160c:	0705                	add	a4,a4,1
    160e:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1612:	0006861b          	sext.w	a2,a3
    1616:	ff08f0e3          	bgeu	a7,a6,15f6 <atoi+0x3c>
    return neg ? n : -n;
    161a:	00030563          	beqz	t1,1624 <atoi+0x6a>
}
    161e:	8082                	ret
        s++;
    1620:	0505                	add	a0,a0,1
    1622:	bf79                	j	15c0 <atoi+0x6>
    return neg ? n : -n;
    1624:	40f5853b          	subw	a0,a1,a5
    1628:	8082                	ret
    while (isdigit(*s))
    162a:	00154603          	lbu	a2,1(a0)
    162e:	47a5                	li	a5,9
        s++;
    1630:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1634:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1638:	4301                	li	t1,0
    while (isdigit(*s))
    163a:	2601                	sext.w	a2,a2
    163c:	fad7fbe3          	bgeu	a5,a3,15f2 <atoi+0x38>
    1640:	4501                	li	a0,0
}
    1642:	8082                	ret
    while (isdigit(*s))
    1644:	00154603          	lbu	a2,1(a0)
    1648:	47a5                	li	a5,9
        s++;
    164a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    164e:	fd06069b          	addw	a3,a2,-48
    1652:	2601                	sext.w	a2,a2
    1654:	fed7e6e3          	bltu	a5,a3,1640 <atoi+0x86>
        neg = 1;
    1658:	4305                	li	t1,1
    165a:	bf61                	j	15f2 <atoi+0x38>

000000000000165c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    165c:	18060163          	beqz	a2,17de <memset+0x182>
    1660:	40a006b3          	neg	a3,a0
    1664:	0076f793          	and	a5,a3,7
    1668:	00778813          	add	a6,a5,7
    166c:	48ad                	li	a7,11
    166e:	0ff5f713          	zext.b	a4,a1
    1672:	fff60593          	add	a1,a2,-1
    1676:	17186563          	bltu	a6,a7,17e0 <memset+0x184>
    167a:	1705ed63          	bltu	a1,a6,17f4 <memset+0x198>
    167e:	16078363          	beqz	a5,17e4 <memset+0x188>
    1682:	00e50023          	sb	a4,0(a0)
    1686:	0066f593          	and	a1,a3,6
    168a:	16058063          	beqz	a1,17ea <memset+0x18e>
    168e:	00e500a3          	sb	a4,1(a0)
    1692:	4589                	li	a1,2
    1694:	16f5f363          	bgeu	a1,a5,17fa <memset+0x19e>
    1698:	00e50123          	sb	a4,2(a0)
    169c:	8a91                	and	a3,a3,4
    169e:	00350593          	add	a1,a0,3
    16a2:	4e0d                	li	t3,3
    16a4:	ce9d                	beqz	a3,16e2 <memset+0x86>
    16a6:	00e501a3          	sb	a4,3(a0)
    16aa:	4691                	li	a3,4
    16ac:	00450593          	add	a1,a0,4
    16b0:	4e11                	li	t3,4
    16b2:	02f6f863          	bgeu	a3,a5,16e2 <memset+0x86>
    16b6:	00e50223          	sb	a4,4(a0)
    16ba:	4695                	li	a3,5
    16bc:	00550593          	add	a1,a0,5
    16c0:	4e15                	li	t3,5
    16c2:	02d78063          	beq	a5,a3,16e2 <memset+0x86>
    16c6:	fff50693          	add	a3,a0,-1
    16ca:	00e502a3          	sb	a4,5(a0)
    16ce:	8a9d                	and	a3,a3,7
    16d0:	00650593          	add	a1,a0,6
    16d4:	4e19                	li	t3,6
    16d6:	e691                	bnez	a3,16e2 <memset+0x86>
    16d8:	00750593          	add	a1,a0,7
    16dc:	00e50323          	sb	a4,6(a0)
    16e0:	4e1d                	li	t3,7
    16e2:	00871693          	sll	a3,a4,0x8
    16e6:	01071813          	sll	a6,a4,0x10
    16ea:	8ed9                	or	a3,a3,a4
    16ec:	01871893          	sll	a7,a4,0x18
    16f0:	0106e6b3          	or	a3,a3,a6
    16f4:	0116e6b3          	or	a3,a3,a7
    16f8:	02071813          	sll	a6,a4,0x20
    16fc:	02871313          	sll	t1,a4,0x28
    1700:	0106e6b3          	or	a3,a3,a6
    1704:	40f608b3          	sub	a7,a2,a5
    1708:	03071813          	sll	a6,a4,0x30
    170c:	0066e6b3          	or	a3,a3,t1
    1710:	0106e6b3          	or	a3,a3,a6
    1714:	03871313          	sll	t1,a4,0x38
    1718:	97aa                	add	a5,a5,a0
    171a:	ff88f813          	and	a6,a7,-8
    171e:	0066e6b3          	or	a3,a3,t1
    1722:	983e                	add	a6,a6,a5
    1724:	e394                	sd	a3,0(a5)
    1726:	07a1                	add	a5,a5,8
    1728:	ff079ee3          	bne	a5,a6,1724 <memset+0xc8>
    172c:	ff88f793          	and	a5,a7,-8
    1730:	0078f893          	and	a7,a7,7
    1734:	00f586b3          	add	a3,a1,a5
    1738:	01c787bb          	addw	a5,a5,t3
    173c:	0a088b63          	beqz	a7,17f2 <memset+0x196>
    1740:	00e68023          	sb	a4,0(a3)
    1744:	0017859b          	addw	a1,a5,1
    1748:	08c5fb63          	bgeu	a1,a2,17de <memset+0x182>
    174c:	00e680a3          	sb	a4,1(a3)
    1750:	0027859b          	addw	a1,a5,2
    1754:	08c5f563          	bgeu	a1,a2,17de <memset+0x182>
    1758:	00e68123          	sb	a4,2(a3)
    175c:	0037859b          	addw	a1,a5,3
    1760:	06c5ff63          	bgeu	a1,a2,17de <memset+0x182>
    1764:	00e681a3          	sb	a4,3(a3)
    1768:	0047859b          	addw	a1,a5,4
    176c:	06c5f963          	bgeu	a1,a2,17de <memset+0x182>
    1770:	00e68223          	sb	a4,4(a3)
    1774:	0057859b          	addw	a1,a5,5
    1778:	06c5f363          	bgeu	a1,a2,17de <memset+0x182>
    177c:	00e682a3          	sb	a4,5(a3)
    1780:	0067859b          	addw	a1,a5,6
    1784:	04c5fd63          	bgeu	a1,a2,17de <memset+0x182>
    1788:	00e68323          	sb	a4,6(a3)
    178c:	0077859b          	addw	a1,a5,7
    1790:	04c5f763          	bgeu	a1,a2,17de <memset+0x182>
    1794:	00e683a3          	sb	a4,7(a3)
    1798:	0087859b          	addw	a1,a5,8
    179c:	04c5f163          	bgeu	a1,a2,17de <memset+0x182>
    17a0:	00e68423          	sb	a4,8(a3)
    17a4:	0097859b          	addw	a1,a5,9
    17a8:	02c5fb63          	bgeu	a1,a2,17de <memset+0x182>
    17ac:	00e684a3          	sb	a4,9(a3)
    17b0:	00a7859b          	addw	a1,a5,10
    17b4:	02c5f563          	bgeu	a1,a2,17de <memset+0x182>
    17b8:	00e68523          	sb	a4,10(a3)
    17bc:	00b7859b          	addw	a1,a5,11
    17c0:	00c5ff63          	bgeu	a1,a2,17de <memset+0x182>
    17c4:	00e685a3          	sb	a4,11(a3)
    17c8:	00c7859b          	addw	a1,a5,12
    17cc:	00c5f963          	bgeu	a1,a2,17de <memset+0x182>
    17d0:	00e68623          	sb	a4,12(a3)
    17d4:	27b5                	addw	a5,a5,13
    17d6:	00c7f463          	bgeu	a5,a2,17de <memset+0x182>
    17da:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17de:	8082                	ret
    17e0:	482d                	li	a6,11
    17e2:	bd61                	j	167a <memset+0x1e>
    char *p = dest;
    17e4:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e6:	4e01                	li	t3,0
    17e8:	bded                	j	16e2 <memset+0x86>
    17ea:	00150593          	add	a1,a0,1
    17ee:	4e05                	li	t3,1
    17f0:	bdcd                	j	16e2 <memset+0x86>
    17f2:	8082                	ret
    char *p = dest;
    17f4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f6:	4781                	li	a5,0
    17f8:	b7a1                	j	1740 <memset+0xe4>
    17fa:	00250593          	add	a1,a0,2
    17fe:	4e09                	li	t3,2
    1800:	b5cd                	j	16e2 <memset+0x86>

0000000000001802 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1802:	00054783          	lbu	a5,0(a0)
    1806:	0005c703          	lbu	a4,0(a1)
    180a:	00e79863          	bne	a5,a4,181a <strcmp+0x18>
    180e:	0505                	add	a0,a0,1
    1810:	0585                	add	a1,a1,1
    1812:	fbe5                	bnez	a5,1802 <strcmp>
    1814:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1816:	9d19                	subw	a0,a0,a4
    1818:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    181a:	0007851b          	sext.w	a0,a5
    181e:	bfe5                	j	1816 <strcmp+0x14>

0000000000001820 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1820:	ca15                	beqz	a2,1854 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1822:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1826:	167d                	add	a2,a2,-1
    1828:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182c:	eb99                	bnez	a5,1842 <strncmp+0x22>
    182e:	a815                	j	1862 <strncmp+0x42>
    1830:	00a68e63          	beq	a3,a0,184c <strncmp+0x2c>
    1834:	0505                	add	a0,a0,1
    1836:	00f71b63          	bne	a4,a5,184c <strncmp+0x2c>
    183a:	00054783          	lbu	a5,0(a0)
    183e:	cf89                	beqz	a5,1858 <strncmp+0x38>
    1840:	85b2                	mv	a1,a2
    1842:	0005c703          	lbu	a4,0(a1)
    1846:	00158613          	add	a2,a1,1
    184a:	f37d                	bnez	a4,1830 <strncmp+0x10>
        ;
    return *l - *r;
    184c:	0007851b          	sext.w	a0,a5
    1850:	9d19                	subw	a0,a0,a4
    1852:	8082                	ret
        return 0;
    1854:	4501                	li	a0,0
}
    1856:	8082                	ret
    return *l - *r;
    1858:	0015c703          	lbu	a4,1(a1)
    185c:	4501                	li	a0,0
    185e:	9d19                	subw	a0,a0,a4
    1860:	8082                	ret
    1862:	0005c703          	lbu	a4,0(a1)
    1866:	4501                	li	a0,0
    1868:	b7e5                	j	1850 <strncmp+0x30>

000000000000186a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    186a:	00757793          	and	a5,a0,7
    186e:	cf89                	beqz	a5,1888 <strlen+0x1e>
    1870:	87aa                	mv	a5,a0
    1872:	a029                	j	187c <strlen+0x12>
    1874:	0785                	add	a5,a5,1
    1876:	0077f713          	and	a4,a5,7
    187a:	cb01                	beqz	a4,188a <strlen+0x20>
        if (!*s)
    187c:	0007c703          	lbu	a4,0(a5)
    1880:	fb75                	bnez	a4,1874 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1882:	40a78533          	sub	a0,a5,a0
}
    1886:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1888:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    188a:	6394                	ld	a3,0(a5)
    188c:	00000597          	auipc	a1,0x0
    1890:	6cc5b583          	ld	a1,1740(a1) # 1f58 <__clone+0xb4>
    1894:	00000617          	auipc	a2,0x0
    1898:	6cc63603          	ld	a2,1740(a2) # 1f60 <__clone+0xbc>
    189c:	a019                	j	18a2 <strlen+0x38>
    189e:	6794                	ld	a3,8(a5)
    18a0:	07a1                	add	a5,a5,8
    18a2:	00b68733          	add	a4,a3,a1
    18a6:	fff6c693          	not	a3,a3
    18aa:	8f75                	and	a4,a4,a3
    18ac:	8f71                	and	a4,a4,a2
    18ae:	db65                	beqz	a4,189e <strlen+0x34>
    for (; *s; s++)
    18b0:	0007c703          	lbu	a4,0(a5)
    18b4:	d779                	beqz	a4,1882 <strlen+0x18>
    18b6:	0017c703          	lbu	a4,1(a5)
    18ba:	0785                	add	a5,a5,1
    18bc:	d379                	beqz	a4,1882 <strlen+0x18>
    18be:	0017c703          	lbu	a4,1(a5)
    18c2:	0785                	add	a5,a5,1
    18c4:	fb6d                	bnez	a4,18b6 <strlen+0x4c>
    18c6:	bf75                	j	1882 <strlen+0x18>

00000000000018c8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c8:	00757713          	and	a4,a0,7
{
    18cc:	87aa                	mv	a5,a0
    18ce:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d2:	cb19                	beqz	a4,18e8 <memchr+0x20>
    18d4:	ce25                	beqz	a2,194c <memchr+0x84>
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	00b70763          	beq	a4,a1,18e8 <memchr+0x20>
    18de:	0785                	add	a5,a5,1
    18e0:	0077f713          	and	a4,a5,7
    18e4:	167d                	add	a2,a2,-1
    18e6:	f77d                	bnez	a4,18d4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e8:	4501                	li	a0,0
    if (n && *s != c)
    18ea:	c235                	beqz	a2,194e <memchr+0x86>
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	06b70063          	beq	a4,a1,1950 <memchr+0x88>
        size_t k = ONES * c;
    18f4:	00000517          	auipc	a0,0x0
    18f8:	67453503          	ld	a0,1652(a0) # 1f68 <__clone+0xc4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fc:	471d                	li	a4,7
        size_t k = ONES * c;
    18fe:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	04c77763          	bgeu	a4,a2,1950 <memchr+0x88>
    1906:	00000897          	auipc	a7,0x0
    190a:	6528b883          	ld	a7,1618(a7) # 1f58 <__clone+0xb4>
    190e:	00000817          	auipc	a6,0x0
    1912:	65283803          	ld	a6,1618(a6) # 1f60 <__clone+0xbc>
    1916:	431d                	li	t1,7
    1918:	a029                	j	1922 <memchr+0x5a>
    191a:	1661                	add	a2,a2,-8
    191c:	07a1                	add	a5,a5,8
    191e:	00c37c63          	bgeu	t1,a2,1936 <memchr+0x6e>
    1922:	6398                	ld	a4,0(a5)
    1924:	8f29                	xor	a4,a4,a0
    1926:	011706b3          	add	a3,a4,a7
    192a:	fff74713          	not	a4,a4
    192e:	8f75                	and	a4,a4,a3
    1930:	01077733          	and	a4,a4,a6
    1934:	d37d                	beqz	a4,191a <memchr+0x52>
    1936:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1938:	e601                	bnez	a2,1940 <memchr+0x78>
    193a:	a809                	j	194c <memchr+0x84>
    193c:	0505                	add	a0,a0,1
    193e:	c619                	beqz	a2,194c <memchr+0x84>
    1940:	00054783          	lbu	a5,0(a0)
    1944:	167d                	add	a2,a2,-1
    1946:	feb79be3          	bne	a5,a1,193c <memchr+0x74>
    194a:	8082                	ret
    return n ? (void *)s : 0;
    194c:	4501                	li	a0,0
}
    194e:	8082                	ret
    if (n && *s != c)
    1950:	853e                	mv	a0,a5
    1952:	b7fd                	j	1940 <memchr+0x78>

0000000000001954 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1954:	1101                	add	sp,sp,-32
    1956:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1958:	862e                	mv	a2,a1
{
    195a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    195c:	4581                	li	a1,0
{
    195e:	e426                	sd	s1,8(sp)
    1960:	ec06                	sd	ra,24(sp)
    1962:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1964:	f65ff0ef          	jal	18c8 <memchr>
    return p ? p - s : n;
    1968:	c519                	beqz	a0,1976 <strnlen+0x22>
}
    196a:	60e2                	ld	ra,24(sp)
    196c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    196e:	8d05                	sub	a0,a0,s1
}
    1970:	64a2                	ld	s1,8(sp)
    1972:	6105                	add	sp,sp,32
    1974:	8082                	ret
    1976:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1978:	8522                	mv	a0,s0
}
    197a:	6442                	ld	s0,16(sp)
    197c:	64a2                	ld	s1,8(sp)
    197e:	6105                	add	sp,sp,32
    1980:	8082                	ret

0000000000001982 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1982:	00a5c7b3          	xor	a5,a1,a0
    1986:	8b9d                	and	a5,a5,7
    1988:	eb95                	bnez	a5,19bc <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    198a:	0075f793          	and	a5,a1,7
    198e:	e7b1                	bnez	a5,19da <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1990:	6198                	ld	a4,0(a1)
    1992:	00000617          	auipc	a2,0x0
    1996:	5c663603          	ld	a2,1478(a2) # 1f58 <__clone+0xb4>
    199a:	00000817          	auipc	a6,0x0
    199e:	5c683803          	ld	a6,1478(a6) # 1f60 <__clone+0xbc>
    19a2:	a029                	j	19ac <strcpy+0x2a>
    19a4:	05a1                	add	a1,a1,8
    19a6:	e118                	sd	a4,0(a0)
    19a8:	6198                	ld	a4,0(a1)
    19aa:	0521                	add	a0,a0,8
    19ac:	00c707b3          	add	a5,a4,a2
    19b0:	fff74693          	not	a3,a4
    19b4:	8ff5                	and	a5,a5,a3
    19b6:	0107f7b3          	and	a5,a5,a6
    19ba:	d7ed                	beqz	a5,19a4 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19bc:	0005c783          	lbu	a5,0(a1)
    19c0:	00f50023          	sb	a5,0(a0)
    19c4:	c785                	beqz	a5,19ec <strcpy+0x6a>
    19c6:	0015c783          	lbu	a5,1(a1)
    19ca:	0505                	add	a0,a0,1
    19cc:	0585                	add	a1,a1,1
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	fbf5                	bnez	a5,19c6 <strcpy+0x44>
        ;
    return d;
}
    19d4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19d6:	0505                	add	a0,a0,1
    19d8:	df45                	beqz	a4,1990 <strcpy+0xe>
            if (!(*d = *s))
    19da:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19de:	0585                	add	a1,a1,1
    19e0:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19e4:	00f50023          	sb	a5,0(a0)
    19e8:	f7fd                	bnez	a5,19d6 <strcpy+0x54>
}
    19ea:	8082                	ret
    19ec:	8082                	ret

00000000000019ee <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19ee:	00a5c7b3          	xor	a5,a1,a0
    19f2:	8b9d                	and	a5,a5,7
    19f4:	e3b5                	bnez	a5,1a58 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19f6:	0075f793          	and	a5,a1,7
    19fa:	cf99                	beqz	a5,1a18 <strncpy+0x2a>
    19fc:	ea09                	bnez	a2,1a0e <strncpy+0x20>
    19fe:	a421                	j	1c06 <strncpy+0x218>
    1a00:	0585                	add	a1,a1,1
    1a02:	0075f793          	and	a5,a1,7
    1a06:	167d                	add	a2,a2,-1
    1a08:	0505                	add	a0,a0,1
    1a0a:	c799                	beqz	a5,1a18 <strncpy+0x2a>
    1a0c:	c225                	beqz	a2,1a6c <strncpy+0x7e>
    1a0e:	0005c783          	lbu	a5,0(a1)
    1a12:	00f50023          	sb	a5,0(a0)
    1a16:	f7ed                	bnez	a5,1a00 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a18:	ca31                	beqz	a2,1a6c <strncpy+0x7e>
    1a1a:	0005c783          	lbu	a5,0(a1)
    1a1e:	cba1                	beqz	a5,1a6e <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a20:	479d                	li	a5,7
    1a22:	02c7fc63          	bgeu	a5,a2,1a5a <strncpy+0x6c>
    1a26:	00000897          	auipc	a7,0x0
    1a2a:	5328b883          	ld	a7,1330(a7) # 1f58 <__clone+0xb4>
    1a2e:	00000817          	auipc	a6,0x0
    1a32:	53283803          	ld	a6,1330(a6) # 1f60 <__clone+0xbc>
    1a36:	431d                	li	t1,7
    1a38:	a039                	j	1a46 <strncpy+0x58>
            *wd = *ws;
    1a3a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a3c:	1661                	add	a2,a2,-8
    1a3e:	05a1                	add	a1,a1,8
    1a40:	0521                	add	a0,a0,8
    1a42:	00c37b63          	bgeu	t1,a2,1a58 <strncpy+0x6a>
    1a46:	6198                	ld	a4,0(a1)
    1a48:	011707b3          	add	a5,a4,a7
    1a4c:	fff74693          	not	a3,a4
    1a50:	8ff5                	and	a5,a5,a3
    1a52:	0107f7b3          	and	a5,a5,a6
    1a56:	d3f5                	beqz	a5,1a3a <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a58:	ca11                	beqz	a2,1a6c <strncpy+0x7e>
    1a5a:	0005c783          	lbu	a5,0(a1)
    1a5e:	0585                	add	a1,a1,1
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	c789                	beqz	a5,1a6e <strncpy+0x80>
    1a66:	167d                	add	a2,a2,-1
    1a68:	0505                	add	a0,a0,1
    1a6a:	fa65                	bnez	a2,1a5a <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a6c:	8082                	ret
    1a6e:	4805                	li	a6,1
    1a70:	14061b63          	bnez	a2,1bc6 <strncpy+0x1d8>
    1a74:	40a00733          	neg	a4,a0
    1a78:	00777793          	and	a5,a4,7
    1a7c:	4581                	li	a1,0
    1a7e:	12061c63          	bnez	a2,1bb6 <strncpy+0x1c8>
    1a82:	00778693          	add	a3,a5,7
    1a86:	48ad                	li	a7,11
    1a88:	1316e563          	bltu	a3,a7,1bb2 <strncpy+0x1c4>
    1a8c:	16d5e263          	bltu	a1,a3,1bf0 <strncpy+0x202>
    1a90:	14078c63          	beqz	a5,1be8 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a94:	00050023          	sb	zero,0(a0)
    1a98:	00677693          	and	a3,a4,6
    1a9c:	14068263          	beqz	a3,1be0 <strncpy+0x1f2>
    1aa0:	000500a3          	sb	zero,1(a0)
    1aa4:	4689                	li	a3,2
    1aa6:	14f6f863          	bgeu	a3,a5,1bf6 <strncpy+0x208>
    1aaa:	00050123          	sb	zero,2(a0)
    1aae:	8b11                	and	a4,a4,4
    1ab0:	12070463          	beqz	a4,1bd8 <strncpy+0x1ea>
    1ab4:	000501a3          	sb	zero,3(a0)
    1ab8:	4711                	li	a4,4
    1aba:	00450693          	add	a3,a0,4
    1abe:	02f77563          	bgeu	a4,a5,1ae8 <strncpy+0xfa>
    1ac2:	00050223          	sb	zero,4(a0)
    1ac6:	4715                	li	a4,5
    1ac8:	00550693          	add	a3,a0,5
    1acc:	00e78e63          	beq	a5,a4,1ae8 <strncpy+0xfa>
    1ad0:	fff50713          	add	a4,a0,-1
    1ad4:	000502a3          	sb	zero,5(a0)
    1ad8:	8b1d                	and	a4,a4,7
    1ada:	12071263          	bnez	a4,1bfe <strncpy+0x210>
    1ade:	00750693          	add	a3,a0,7
    1ae2:	00050323          	sb	zero,6(a0)
    1ae6:	471d                	li	a4,7
    1ae8:	40f80833          	sub	a6,a6,a5
    1aec:	ff887593          	and	a1,a6,-8
    1af0:	97aa                	add	a5,a5,a0
    1af2:	95be                	add	a1,a1,a5
    1af4:	0007b023          	sd	zero,0(a5)
    1af8:	07a1                	add	a5,a5,8
    1afa:	feb79de3          	bne	a5,a1,1af4 <strncpy+0x106>
    1afe:	ff887593          	and	a1,a6,-8
    1b02:	00787813          	and	a6,a6,7
    1b06:	00e587bb          	addw	a5,a1,a4
    1b0a:	00b68733          	add	a4,a3,a1
    1b0e:	0e080063          	beqz	a6,1bee <strncpy+0x200>
    1b12:	00070023          	sb	zero,0(a4)
    1b16:	0017869b          	addw	a3,a5,1
    1b1a:	f4c6f9e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b1e:	000700a3          	sb	zero,1(a4)
    1b22:	0027869b          	addw	a3,a5,2
    1b26:	f4c6f3e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b2a:	00070123          	sb	zero,2(a4)
    1b2e:	0037869b          	addw	a3,a5,3
    1b32:	f2c6fde3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b36:	000701a3          	sb	zero,3(a4)
    1b3a:	0047869b          	addw	a3,a5,4
    1b3e:	f2c6f7e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b42:	00070223          	sb	zero,4(a4)
    1b46:	0057869b          	addw	a3,a5,5
    1b4a:	f2c6f1e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b4e:	000702a3          	sb	zero,5(a4)
    1b52:	0067869b          	addw	a3,a5,6
    1b56:	f0c6fbe3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b5a:	00070323          	sb	zero,6(a4)
    1b5e:	0077869b          	addw	a3,a5,7
    1b62:	f0c6f5e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b66:	000703a3          	sb	zero,7(a4)
    1b6a:	0087869b          	addw	a3,a5,8
    1b6e:	eec6ffe3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b72:	00070423          	sb	zero,8(a4)
    1b76:	0097869b          	addw	a3,a5,9
    1b7a:	eec6f9e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b7e:	000704a3          	sb	zero,9(a4)
    1b82:	00a7869b          	addw	a3,a5,10
    1b86:	eec6f3e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b8a:	00070523          	sb	zero,10(a4)
    1b8e:	00b7869b          	addw	a3,a5,11
    1b92:	ecc6fde3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1b96:	000705a3          	sb	zero,11(a4)
    1b9a:	00c7869b          	addw	a3,a5,12
    1b9e:	ecc6f7e3          	bgeu	a3,a2,1a6c <strncpy+0x7e>
    1ba2:	00070623          	sb	zero,12(a4)
    1ba6:	27b5                	addw	a5,a5,13
    1ba8:	ecc7f2e3          	bgeu	a5,a2,1a6c <strncpy+0x7e>
    1bac:	000706a3          	sb	zero,13(a4)
}
    1bb0:	8082                	ret
    1bb2:	46ad                	li	a3,11
    1bb4:	bde1                	j	1a8c <strncpy+0x9e>
    1bb6:	00778693          	add	a3,a5,7
    1bba:	48ad                	li	a7,11
    1bbc:	fff60593          	add	a1,a2,-1
    1bc0:	ed16f6e3          	bgeu	a3,a7,1a8c <strncpy+0x9e>
    1bc4:	b7fd                	j	1bb2 <strncpy+0x1c4>
    1bc6:	40a00733          	neg	a4,a0
    1bca:	8832                	mv	a6,a2
    1bcc:	00777793          	and	a5,a4,7
    1bd0:	4581                	li	a1,0
    1bd2:	ea0608e3          	beqz	a2,1a82 <strncpy+0x94>
    1bd6:	b7c5                	j	1bb6 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd8:	00350693          	add	a3,a0,3
    1bdc:	470d                	li	a4,3
    1bde:	b729                	j	1ae8 <strncpy+0xfa>
    1be0:	00150693          	add	a3,a0,1
    1be4:	4705                	li	a4,1
    1be6:	b709                	j	1ae8 <strncpy+0xfa>
tail:
    1be8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bea:	4701                	li	a4,0
    1bec:	bdf5                	j	1ae8 <strncpy+0xfa>
    1bee:	8082                	ret
tail:
    1bf0:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf2:	4781                	li	a5,0
    1bf4:	bf39                	j	1b12 <strncpy+0x124>
    1bf6:	00250693          	add	a3,a0,2
    1bfa:	4709                	li	a4,2
    1bfc:	b5f5                	j	1ae8 <strncpy+0xfa>
    1bfe:	00650693          	add	a3,a0,6
    1c02:	4719                	li	a4,6
    1c04:	b5d5                	j	1ae8 <strncpy+0xfa>
    1c06:	8082                	ret

0000000000001c08 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c08:	87aa                	mv	a5,a0
    1c0a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c0c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c10:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c14:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c16:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c18:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c1c:	2501                	sext.w	a0,a0
    1c1e:	8082                	ret

0000000000001c20 <openat>:
    register long a7 __asm__("a7") = n;
    1c20:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c24:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c28:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <close>:
    register long a7 __asm__("a7") = n;
    1c30:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c34:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c38:	2501                	sext.w	a0,a0
    1c3a:	8082                	ret

0000000000001c3c <read>:
    register long a7 __asm__("a7") = n;
    1c3c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c40:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c44:	8082                	ret

0000000000001c46 <write>:
    register long a7 __asm__("a7") = n;
    1c46:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c4a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c4e:	8082                	ret

0000000000001c50 <getpid>:
    register long a7 __asm__("a7") = n;
    1c50:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c54:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <getppid>:
    register long a7 __asm__("a7") = n;
    1c5c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c60:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c68:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c6c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <fork>:
    register long a7 __asm__("a7") = n;
    1c74:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c78:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c7a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c7c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c80:	2501                	sext.w	a0,a0
    1c82:	8082                	ret

0000000000001c84 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c84:	85b2                	mv	a1,a2
    1c86:	863a                	mv	a2,a4
    if (stack)
    1c88:	c191                	beqz	a1,1c8c <clone+0x8>
	stack += stack_size;
    1c8a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c8c:	4781                	li	a5,0
    1c8e:	4701                	li	a4,0
    1c90:	4681                	li	a3,0
    1c92:	2601                	sext.w	a2,a2
    1c94:	ac01                	j	1ea4 <__clone>

0000000000001c96 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c96:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c9a:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c9e:	8082                	ret

0000000000001ca0 <exit>:
    register long a7 __asm__("a7") = n;
    1ca0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ca4:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ca8:	8082                	ret

0000000000001caa <waitpid>:
    register long a7 __asm__("a7") = n;
    1caa:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cae:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <exec>:
    register long a7 __asm__("a7") = n;
    1cb8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cbc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <execve>:
    register long a7 __asm__("a7") = n;
    1cc4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc8:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <times>:
    register long a7 __asm__("a7") = n;
    1cd0:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cd4:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <get_time>:

int64 get_time()
{
    1cdc:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cde:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ce2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ce4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce6:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cea:	2501                	sext.w	a0,a0
    1cec:	ed09                	bnez	a0,1d06 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cee:	67a2                	ld	a5,8(sp)
    1cf0:	3e800713          	li	a4,1000
    1cf4:	00015503          	lhu	a0,0(sp)
    1cf8:	02e7d7b3          	divu	a5,a5,a4
    1cfc:	02e50533          	mul	a0,a0,a4
    1d00:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d02:	0141                	add	sp,sp,16
    1d04:	8082                	ret
        return -1;
    1d06:	557d                	li	a0,-1
    1d08:	bfed                	j	1d02 <get_time+0x26>

0000000000001d0a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d0a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <time>:
    register long a7 __asm__("a7") = n;
    1d16:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d1a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <sleep>:

int sleep(unsigned long long time)
{
    1d22:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d24:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d26:	850a                	mv	a0,sp
    1d28:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d2a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d2e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d30:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d34:	e501                	bnez	a0,1d3c <sleep+0x1a>
    return 0;
    1d36:	4501                	li	a0,0
}
    1d38:	0141                	add	sp,sp,16
    1d3a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3c:	4502                	lw	a0,0(sp)
}
    1d3e:	0141                	add	sp,sp,16
    1d40:	8082                	ret

0000000000001d42 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d42:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d4e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d52:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d56:	8082                	ret

0000000000001d58 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d58:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5c:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <munmap>:
    register long a7 __asm__("a7") = n;
    1d64:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <wait>:

int wait(int *code)
{
    1d70:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d72:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d76:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d78:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d7a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <spawn>:
    register long a7 __asm__("a7") = n;
    1d84:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d88:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <mailread>:
    register long a7 __asm__("a7") = n;
    1d90:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d94:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d9c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <fstat>:
    register long a7 __asm__("a7") = n;
    1da8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1db4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1db6:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dba:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dc4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dc6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dca:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dcc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dd4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dd6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dda:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <link>:

int link(char *old_path, char *new_path)
{
    1de4:	87aa                	mv	a5,a0
    1de6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1de8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dec:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1df6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <unlink>:

int unlink(char *path)
{
    1e00:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e02:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e06:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e0a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <uname>:
    register long a7 __asm__("a7") = n;
    1e14:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <brk>:
    register long a7 __asm__("a7") = n;
    1e20:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e2c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e32:	8082                	ret

0000000000001e34 <chdir>:
    register long a7 __asm__("a7") = n;
    1e34:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e40:	862e                	mv	a2,a1
    1e42:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e44:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e46:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e4a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e4e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e50:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <getdents>:
    register long a7 __asm__("a7") = n;
    1e5a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <pipe>:
    register long a7 __asm__("a7") = n;
    1e66:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <dup>:
    register long a7 __asm__("a7") = n;
    1e74:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <dup2>:
    register long a7 __asm__("a7") = n;
    1e7e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e80:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mount>:
    register long a7 __asm__("a7") = n;
    1e8a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e8e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <umount>:
    register long a7 __asm__("a7") = n;
    1e96:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ea4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ea6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ea8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eaa:	8532                	mv	a0,a2
	mv a2, a4
    1eac:	863a                	mv	a2,a4
	mv a3, a5
    1eae:	86be                	mv	a3,a5
	mv a4, a6
    1eb0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb2:	0dc00893          	li	a7,220
	ecall
    1eb6:	00000073          	ecall

	beqz a0, 1f
    1eba:	c111                	beqz	a0,1ebe <__clone+0x1a>
	# Parent
	ret
    1ebc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ebe:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec0:	6522                	ld	a0,8(sp)
	jalr a1
    1ec2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ec4:	05d00893          	li	a7,93
	ecall
    1ec8:	00000073          	ecall
