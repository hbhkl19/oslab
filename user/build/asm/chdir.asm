
/home/hbh/oslab/oslab/user/build/riscv64/chdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0c9                	j	10c4 <__start_main>

0000000000001004 <test_chdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

static char buffer[30];
void test_chdir(void){
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	efa50513          	add	a0,a0,-262 # 1f00 <__clone+0x2e>
void test_chdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	30a000ef          	jal	131c <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fc250513          	add	a0,a0,-62 # 1fd8 <__func__.0>
    101e:	2fe000ef          	jal	131c <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ef650513          	add	a0,a0,-266 # 1f18 <__clone+0x46>
    102a:	2f2000ef          	jal	131c <puts>
    mkdir("test_chdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	ef650513          	add	a0,a0,-266 # 1f28 <__clone+0x56>
    103a:	635000ef          	jal	1e6e <mkdir>
    int ret = chdir("test_chdir");
    103e:	00001517          	auipc	a0,0x1
    1042:	eea50513          	add	a0,a0,-278 # 1f28 <__clone+0x56>
    1046:	61d000ef          	jal	1e62 <chdir>
    104a:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    104c:	85aa                	mv	a1,a0
    104e:	00001517          	auipc	a0,0x1
    1052:	eea50513          	add	a0,a0,-278 # 1f38 <__clone+0x66>
    1056:	2e8000ef          	jal	133e <printf>
    assert(ret == 0);
    105a:	e431                	bnez	s0,10a6 <test_chdir+0xa2>
    getcwd(buffer, 30);
    105c:	45f9                	li	a1,30
    105e:	00001517          	auipc	a0,0x1
    1062:	f5a50513          	add	a0,a0,-166 # 1fb8 <buffer>
    1066:	5f5000ef          	jal	1e5a <getcwd>
    printf("  current working dir : %s\n", buffer);
    106a:	00001597          	auipc	a1,0x1
    106e:	f4e58593          	add	a1,a1,-178 # 1fb8 <buffer>
    1072:	00001517          	auipc	a0,0x1
    1076:	ef650513          	add	a0,a0,-266 # 1f68 <__clone+0x96>
    107a:	2c4000ef          	jal	133e <printf>
    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	f0a50513          	add	a0,a0,-246 # 1f88 <__clone+0xb6>
    1086:	296000ef          	jal	131c <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	f4e50513          	add	a0,a0,-178 # 1fd8 <__func__.0>
    1092:	28a000ef          	jal	131c <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e7e50513          	add	a0,a0,-386 # 1f18 <__clone+0x46>
}
    10a2:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a4:	aca5                	j	131c <puts>
    assert(ret == 0);
    10a6:	00001517          	auipc	a0,0x1
    10aa:	ea250513          	add	a0,a0,-350 # 1f48 <__clone+0x76>
    10ae:	50a000ef          	jal	15b8 <panic>
    10b2:	b76d                	j	105c <test_chdir+0x58>

00000000000010b4 <main>:

int main(void){
    10b4:	1141                	add	sp,sp,-16
    10b6:	e406                	sd	ra,8(sp)
    test_chdir();
    10b8:	f4dff0ef          	jal	1004 <test_chdir>
    return 0;
}
    10bc:	60a2                	ld	ra,8(sp)
    10be:	4501                	li	a0,0
    10c0:	0141                	add	sp,sp,16
    10c2:	8082                	ret

00000000000010c4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c6:	4108                	lw	a0,0(a0)
{
    10c8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ca:	05a1                	add	a1,a1,8
{
    10cc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ce:	fe7ff0ef          	jal	10b4 <main>
    10d2:	3fd000ef          	jal	1cce <exit>
	return 0;
}
    10d6:	60a2                	ld	ra,8(sp)
    10d8:	4501                	li	a0,0
    10da:	0141                	add	sp,sp,16
    10dc:	8082                	ret

00000000000010de <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10de:	7179                	add	sp,sp,-48
    10e0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e2:	12054863          	bltz	a0,1212 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e6:	02b577bb          	remuw	a5,a0,a1
    10ea:	00001697          	auipc	a3,0x1
    10ee:	efe68693          	add	a3,a3,-258 # 1fe8 <digits>
    buf[16] = 0;
    10f2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f6:	0005871b          	sext.w	a4,a1
    10fa:	1782                	sll	a5,a5,0x20
    10fc:	9381                	srl	a5,a5,0x20
    10fe:	97b6                	add	a5,a5,a3
    1100:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1104:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1108:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    110c:	1ab56663          	bltu	a0,a1,12b8 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1110:	02e8763b          	remuw	a2,a6,a4
    1114:	1602                	sll	a2,a2,0x20
    1116:	9201                	srl	a2,a2,0x20
    1118:	9636                	add	a2,a2,a3
    111a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1122:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1126:	12e86c63          	bltu	a6,a4,125e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    112a:	02e5f63b          	remuw	a2,a1,a4
    112e:	1602                	sll	a2,a2,0x20
    1130:	9201                	srl	a2,a2,0x20
    1132:	9636                	add	a2,a2,a3
    1134:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1138:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    113c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1140:	12e5e863          	bltu	a1,a4,1270 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1144:	02e8763b          	remuw	a2,a6,a4
    1148:	1602                	sll	a2,a2,0x20
    114a:	9201                	srl	a2,a2,0x20
    114c:	9636                	add	a2,a2,a3
    114e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1152:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1156:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115a:	12e86463          	bltu	a6,a4,1282 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    115e:	02e5f63b          	remuw	a2,a1,a4
    1162:	1602                	sll	a2,a2,0x20
    1164:	9201                	srl	a2,a2,0x20
    1166:	9636                	add	a2,a2,a3
    1168:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1170:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1174:	12e5e063          	bltu	a1,a4,1294 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1178:	02e8763b          	remuw	a2,a6,a4
    117c:	1602                	sll	a2,a2,0x20
    117e:	9201                	srl	a2,a2,0x20
    1180:	9636                	add	a2,a2,a3
    1182:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1186:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    118a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    118e:	0ae86f63          	bltu	a6,a4,124c <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1192:	02e5f63b          	remuw	a2,a1,a4
    1196:	1602                	sll	a2,a2,0x20
    1198:	9201                	srl	a2,a2,0x20
    119a:	9636                	add	a2,a2,a3
    119c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a8:	0ee5ef63          	bltu	a1,a4,12a6 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11ac:	02e8763b          	remuw	a2,a6,a4
    11b0:	1602                	sll	a2,a2,0x20
    11b2:	9201                	srl	a2,a2,0x20
    11b4:	9636                	add	a2,a2,a3
    11b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ba:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11be:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c2:	0ee86d63          	bltu	a6,a4,12bc <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11c6:	02e5f63b          	remuw	a2,a1,a4
    11ca:	1602                	sll	a2,a2,0x20
    11cc:	9201                	srl	a2,a2,0x20
    11ce:	9636                	add	a2,a2,a3
    11d0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11dc:	0ee5e963          	bltu	a1,a4,12ce <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11e0:	1782                	sll	a5,a5,0x20
    11e2:	9381                	srl	a5,a5,0x20
    11e4:	96be                	add	a3,a3,a5
    11e6:	0006c783          	lbu	a5,0(a3)
    11ea:	4599                	li	a1,6
    11ec:	00f10723          	sb	a5,14(sp)

    if (sign)
    11f0:	00055763          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    11f4:	02d00793          	li	a5,45
    11f8:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11fc:	4595                	li	a1,5
    write(f, s, l);
    11fe:	003c                	add	a5,sp,8
    1200:	4641                	li	a2,16
    1202:	9e0d                	subw	a2,a2,a1
    1204:	4505                	li	a0,1
    1206:	95be                	add	a1,a1,a5
    1208:	26d000ef          	jal	1c74 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120c:	70a2                	ld	ra,40(sp)
    120e:	6145                	add	sp,sp,48
    1210:	8082                	ret
        x = -xx;
    1212:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1216:	02b677bb          	remuw	a5,a2,a1
    121a:	00001697          	auipc	a3,0x1
    121e:	dce68693          	add	a3,a3,-562 # 1fe8 <digits>
    buf[16] = 0;
    1222:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1226:	0005871b          	sext.w	a4,a1
    122a:	1782                	sll	a5,a5,0x20
    122c:	9381                	srl	a5,a5,0x20
    122e:	97b6                	add	a5,a5,a3
    1230:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1234:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1238:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    123c:	ecb67ae3          	bgeu	a2,a1,1110 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1248:	45b9                	li	a1,14
    124a:	bf55                	j	11fe <printint.constprop.0+0x120>
    124c:	45a9                	li	a1,10
    if (sign)
    124e:	fa0558e3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    125a:	45a5                	li	a1,9
    125c:	b74d                	j	11fe <printint.constprop.0+0x120>
    125e:	45b9                	li	a1,14
    if (sign)
    1260:	f8055fe3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    126c:	45b5                	li	a1,13
    126e:	bf41                	j	11fe <printint.constprop.0+0x120>
    1270:	45b5                	li	a1,13
    if (sign)
    1272:	f80556e3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    127e:	45b1                	li	a1,12
    1280:	bfbd                	j	11fe <printint.constprop.0+0x120>
    1282:	45b1                	li	a1,12
    if (sign)
    1284:	f6055de3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1290:	45ad                	li	a1,11
    1292:	b7b5                	j	11fe <printint.constprop.0+0x120>
    1294:	45ad                	li	a1,11
    if (sign)
    1296:	f60554e3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a2:	45a9                	li	a1,10
    12a4:	bfa9                	j	11fe <printint.constprop.0+0x120>
    12a6:	45a5                	li	a1,9
    if (sign)
    12a8:	f4055be3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b4:	45a1                	li	a1,8
    12b6:	b7a1                	j	11fe <printint.constprop.0+0x120>
    i = 15;
    12b8:	45bd                	li	a1,15
    12ba:	b791                	j	11fe <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12bc:	45a1                	li	a1,8
    if (sign)
    12be:	f40550e3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c2:	02d00793          	li	a5,45
    12c6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ca:	459d                	li	a1,7
    12cc:	bf0d                	j	11fe <printint.constprop.0+0x120>
    12ce:	459d                	li	a1,7
    if (sign)
    12d0:	f20557e3          	bgez	a0,11fe <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d4:	02d00793          	li	a5,45
    12d8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12dc:	4599                	li	a1,6
    12de:	b705                	j	11fe <printint.constprop.0+0x120>

00000000000012e0 <getchar>:
{
    12e0:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12e2:	00f10593          	add	a1,sp,15
    12e6:	4605                	li	a2,1
    12e8:	4501                	li	a0,0
{
    12ea:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ec:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f0:	17b000ef          	jal	1c6a <read>
}
    12f4:	60e2                	ld	ra,24(sp)
    12f6:	00f14503          	lbu	a0,15(sp)
    12fa:	6105                	add	sp,sp,32
    12fc:	8082                	ret

00000000000012fe <putchar>:
{
    12fe:	1101                	add	sp,sp,-32
    1300:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1302:	00f10593          	add	a1,sp,15
    1306:	4605                	li	a2,1
    1308:	4505                	li	a0,1
{
    130a:	ec06                	sd	ra,24(sp)
    char byte = c;
    130c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1310:	165000ef          	jal	1c74 <write>
}
    1314:	60e2                	ld	ra,24(sp)
    1316:	2501                	sext.w	a0,a0
    1318:	6105                	add	sp,sp,32
    131a:	8082                	ret

000000000000131c <puts>:
{
    131c:	1141                	add	sp,sp,-16
    131e:	e406                	sd	ra,8(sp)
    1320:	e022                	sd	s0,0(sp)
    1322:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1324:	574000ef          	jal	1898 <strlen>
    1328:	862a                	mv	a2,a0
    132a:	85a2                	mv	a1,s0
    132c:	4505                	li	a0,1
    132e:	147000ef          	jal	1c74 <write>
}
    1332:	60a2                	ld	ra,8(sp)
    1334:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1336:	957d                	sra	a0,a0,0x3f
    return r;
    1338:	2501                	sext.w	a0,a0
}
    133a:	0141                	add	sp,sp,16
    133c:	8082                	ret

000000000000133e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    133e:	7171                	add	sp,sp,-176
    1340:	f85a                	sd	s6,48(sp)
    1342:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1344:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1346:	18bc                	add	a5,sp,120
{
    1348:	e8ca                	sd	s2,80(sp)
    134a:	e4ce                	sd	s3,72(sp)
    134c:	e0d2                	sd	s4,64(sp)
    134e:	fc56                	sd	s5,56(sp)
    1350:	f486                	sd	ra,104(sp)
    1352:	f0a2                	sd	s0,96(sp)
    1354:	eca6                	sd	s1,88(sp)
    1356:	fcae                	sd	a1,120(sp)
    1358:	e132                	sd	a2,128(sp)
    135a:	e536                	sd	a3,136(sp)
    135c:	e93a                	sd	a4,144(sp)
    135e:	f142                	sd	a6,160(sp)
    1360:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1362:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1364:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1368:	07300a13          	li	s4,115
    136c:	07800a93          	li	s5,120
    buf[i++] = '0';
    1370:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1374:	00001997          	auipc	s3,0x1
    1378:	c7498993          	add	s3,s3,-908 # 1fe8 <digits>
        if (!*s)
    137c:	00054783          	lbu	a5,0(a0)
    1380:	16078a63          	beqz	a5,14f4 <printf+0x1b6>
    1384:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1386:	19278d63          	beq	a5,s2,1520 <printf+0x1e2>
    138a:	00164783          	lbu	a5,1(a2)
    138e:	0605                	add	a2,a2,1
    1390:	fbfd                	bnez	a5,1386 <printf+0x48>
    1392:	84b2                	mv	s1,a2
        l = z - a;
    1394:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1398:	85aa                	mv	a1,a0
    139a:	8622                	mv	a2,s0
    139c:	4505                	li	a0,1
    139e:	0d7000ef          	jal	1c74 <write>
        if (l)
    13a2:	1a041463          	bnez	s0,154a <printf+0x20c>
        if (s[1] == 0)
    13a6:	0014c783          	lbu	a5,1(s1)
    13aa:	14078563          	beqz	a5,14f4 <printf+0x1b6>
        switch (s[1])
    13ae:	1b478063          	beq	a5,s4,154e <printf+0x210>
    13b2:	14fa6b63          	bltu	s4,a5,1508 <printf+0x1ca>
    13b6:	06400713          	li	a4,100
    13ba:	1ee78063          	beq	a5,a4,159a <printf+0x25c>
    13be:	07000713          	li	a4,112
    13c2:	1ae79963          	bne	a5,a4,1574 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13c6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c8:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13cc:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ce:	631c                	ld	a5,0(a4)
    13d0:	0721                	add	a4,a4,8
    13d2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d4:	00479293          	sll	t0,a5,0x4
    13d8:	00879f93          	sll	t6,a5,0x8
    13dc:	00c79f13          	sll	t5,a5,0xc
    13e0:	01079e93          	sll	t4,a5,0x10
    13e4:	01479e13          	sll	t3,a5,0x14
    13e8:	01879313          	sll	t1,a5,0x18
    13ec:	01c79893          	sll	a7,a5,0x1c
    13f0:	02479813          	sll	a6,a5,0x24
    13f4:	02879513          	sll	a0,a5,0x28
    13f8:	02c79593          	sll	a1,a5,0x2c
    13fc:	03079693          	sll	a3,a5,0x30
    1400:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1404:	03c7d413          	srl	s0,a5,0x3c
    1408:	01c7d39b          	srlw	t2,a5,0x1c
    140c:	03c2d293          	srl	t0,t0,0x3c
    1410:	03cfdf93          	srl	t6,t6,0x3c
    1414:	03cf5f13          	srl	t5,t5,0x3c
    1418:	03cede93          	srl	t4,t4,0x3c
    141c:	03ce5e13          	srl	t3,t3,0x3c
    1420:	03c35313          	srl	t1,t1,0x3c
    1424:	03c8d893          	srl	a7,a7,0x3c
    1428:	03c85813          	srl	a6,a6,0x3c
    142c:	9171                	srl	a0,a0,0x3c
    142e:	91f1                	srl	a1,a1,0x3c
    1430:	92f1                	srl	a3,a3,0x3c
    1432:	9371                	srl	a4,a4,0x3c
    1434:	96ce                	add	a3,a3,s3
    1436:	974e                	add	a4,a4,s3
    1438:	944e                	add	s0,s0,s3
    143a:	92ce                	add	t0,t0,s3
    143c:	9fce                	add	t6,t6,s3
    143e:	9f4e                	add	t5,t5,s3
    1440:	9ece                	add	t4,t4,s3
    1442:	9e4e                	add	t3,t3,s3
    1444:	934e                	add	t1,t1,s3
    1446:	98ce                	add	a7,a7,s3
    1448:	93ce                	add	t2,t2,s3
    144a:	984e                	add	a6,a6,s3
    144c:	954e                	add	a0,a0,s3
    144e:	95ce                	add	a1,a1,s3
    1450:	0006c083          	lbu	ra,0(a3)
    1454:	0002c283          	lbu	t0,0(t0)
    1458:	00074683          	lbu	a3,0(a4)
    145c:	000fcf83          	lbu	t6,0(t6)
    1460:	000f4f03          	lbu	t5,0(t5)
    1464:	000ece83          	lbu	t4,0(t4)
    1468:	000e4e03          	lbu	t3,0(t3)
    146c:	00034303          	lbu	t1,0(t1)
    1470:	0008c883          	lbu	a7,0(a7)
    1474:	0003c383          	lbu	t2,0(t2)
    1478:	00084803          	lbu	a6,0(a6)
    147c:	00054503          	lbu	a0,0(a0)
    1480:	0005c583          	lbu	a1,0(a1)
    1484:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1488:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148c:	9371                	srl	a4,a4,0x3c
    148e:	8bbd                	and	a5,a5,15
    1490:	974e                	add	a4,a4,s3
    1492:	97ce                	add	a5,a5,s3
    1494:	005105a3          	sb	t0,11(sp)
    1498:	01f10623          	sb	t6,12(sp)
    149c:	01e106a3          	sb	t5,13(sp)
    14a0:	01d10723          	sb	t4,14(sp)
    14a4:	01c107a3          	sb	t3,15(sp)
    14a8:	00610823          	sb	t1,16(sp)
    14ac:	011108a3          	sb	a7,17(sp)
    14b0:	00710923          	sb	t2,18(sp)
    14b4:	010109a3          	sb	a6,19(sp)
    14b8:	00a10a23          	sb	a0,20(sp)
    14bc:	00b10aa3          	sb	a1,21(sp)
    14c0:	00110b23          	sb	ra,22(sp)
    14c4:	00d10ba3          	sb	a3,23(sp)
    14c8:	00810523          	sb	s0,10(sp)
    14cc:	00074703          	lbu	a4,0(a4)
    14d0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d4:	002c                	add	a1,sp,8
    14d6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d8:	00e10c23          	sb	a4,24(sp)
    14dc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14e4:	790000ef          	jal	1c74 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14e8:	00248513          	add	a0,s1,2
        if (!*s)
    14ec:	00054783          	lbu	a5,0(a0)
    14f0:	e8079ae3          	bnez	a5,1384 <printf+0x46>
    }
    va_end(ap);
}
    14f4:	70a6                	ld	ra,104(sp)
    14f6:	7406                	ld	s0,96(sp)
    14f8:	64e6                	ld	s1,88(sp)
    14fa:	6946                	ld	s2,80(sp)
    14fc:	69a6                	ld	s3,72(sp)
    14fe:	6a06                	ld	s4,64(sp)
    1500:	7ae2                	ld	s5,56(sp)
    1502:	7b42                	ld	s6,48(sp)
    1504:	614d                	add	sp,sp,176
    1506:	8082                	ret
        switch (s[1])
    1508:	07579663          	bne	a5,s5,1574 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    150c:	6782                	ld	a5,0(sp)
    150e:	45c1                	li	a1,16
    1510:	4388                	lw	a0,0(a5)
    1512:	07a1                	add	a5,a5,8
    1514:	e03e                	sd	a5,0(sp)
    1516:	bc9ff0ef          	jal	10de <printint.constprop.0>
        s += 2;
    151a:	00248513          	add	a0,s1,2
    151e:	b7f9                	j	14ec <printf+0x1ae>
    1520:	84b2                	mv	s1,a2
    1522:	a039                	j	1530 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1524:	0024c783          	lbu	a5,2(s1)
    1528:	0605                	add	a2,a2,1
    152a:	0489                	add	s1,s1,2
    152c:	e72794e3          	bne	a5,s2,1394 <printf+0x56>
    1530:	0014c783          	lbu	a5,1(s1)
    1534:	ff2788e3          	beq	a5,s2,1524 <printf+0x1e6>
        l = z - a;
    1538:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    153c:	85aa                	mv	a1,a0
    153e:	8622                	mv	a2,s0
    1540:	4505                	li	a0,1
    1542:	732000ef          	jal	1c74 <write>
        if (l)
    1546:	e60400e3          	beqz	s0,13a6 <printf+0x68>
    154a:	8526                	mv	a0,s1
    154c:	bd05                	j	137c <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    154e:	6782                	ld	a5,0(sp)
    1550:	6380                	ld	s0,0(a5)
    1552:	07a1                	add	a5,a5,8
    1554:	e03e                	sd	a5,0(sp)
    1556:	cc21                	beqz	s0,15ae <printf+0x270>
            l = strnlen(a, 200);
    1558:	0c800593          	li	a1,200
    155c:	8522                	mv	a0,s0
    155e:	424000ef          	jal	1982 <strnlen>
    write(f, s, l);
    1562:	0005061b          	sext.w	a2,a0
    1566:	85a2                	mv	a1,s0
    1568:	4505                	li	a0,1
    156a:	70a000ef          	jal	1c74 <write>
        s += 2;
    156e:	00248513          	add	a0,s1,2
    1572:	bfad                	j	14ec <printf+0x1ae>
    return write(stdout, &byte, 1);
    1574:	4605                	li	a2,1
    1576:	002c                	add	a1,sp,8
    1578:	4505                	li	a0,1
    char byte = c;
    157a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    157e:	6f6000ef          	jal	1c74 <write>
    char byte = c;
    1582:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1586:	4605                	li	a2,1
    1588:	002c                	add	a1,sp,8
    158a:	4505                	li	a0,1
    char byte = c;
    158c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1590:	6e4000ef          	jal	1c74 <write>
        s += 2;
    1594:	00248513          	add	a0,s1,2
    1598:	bf91                	j	14ec <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    159a:	6782                	ld	a5,0(sp)
    159c:	45a9                	li	a1,10
    159e:	4388                	lw	a0,0(a5)
    15a0:	07a1                	add	a5,a5,8
    15a2:	e03e                	sd	a5,0(sp)
    15a4:	b3bff0ef          	jal	10de <printint.constprop.0>
        s += 2;
    15a8:	00248513          	add	a0,s1,2
    15ac:	b781                	j	14ec <printf+0x1ae>
                a = "(null)";
    15ae:	00001417          	auipc	s0,0x1
    15b2:	9ea40413          	add	s0,s0,-1558 # 1f98 <__clone+0xc6>
    15b6:	b74d                	j	1558 <printf+0x21a>

00000000000015b8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15b8:	1141                	add	sp,sp,-16
    15ba:	e406                	sd	ra,8(sp)
    puts(m);
    15bc:	d61ff0ef          	jal	131c <puts>
    exit(-100);
}
    15c0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c2:	f9c00513          	li	a0,-100
}
    15c6:	0141                	add	sp,sp,16
    exit(-100);
    15c8:	a719                	j	1cce <exit>

00000000000015ca <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	02000793          	li	a5,32
    15ce:	00f50663          	beq	a0,a5,15da <isspace+0x10>
    15d2:	355d                	addw	a0,a0,-9
    15d4:	00553513          	sltiu	a0,a0,5
    15d8:	8082                	ret
    15da:	4505                	li	a0,1
}
    15dc:	8082                	ret

00000000000015de <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15de:	fd05051b          	addw	a0,a0,-48
}
    15e2:	00a53513          	sltiu	a0,a0,10
    15e6:	8082                	ret

00000000000015e8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e8:	02000693          	li	a3,32
    15ec:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ee:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f2:	ff77871b          	addw	a4,a5,-9
    15f6:	04d78c63          	beq	a5,a3,164e <atoi+0x66>
    15fa:	0007861b          	sext.w	a2,a5
    15fe:	04e5f863          	bgeu	a1,a4,164e <atoi+0x66>
        s++;
    switch (*s)
    1602:	02b00713          	li	a4,43
    1606:	04e78963          	beq	a5,a4,1658 <atoi+0x70>
    160a:	02d00713          	li	a4,45
    160e:	06e78263          	beq	a5,a4,1672 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1612:	fd06069b          	addw	a3,a2,-48
    1616:	47a5                	li	a5,9
    1618:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    161a:	4301                	li	t1,0
    while (isdigit(*s))
    161c:	04d7e963          	bltu	a5,a3,166e <atoi+0x86>
    int n = 0, neg = 0;
    1620:	4501                	li	a0,0
    while (isdigit(*s))
    1622:	48a5                	li	a7,9
    1624:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1628:	0025179b          	sllw	a5,a0,0x2
    162c:	9fa9                	addw	a5,a5,a0
    162e:	fd06059b          	addw	a1,a2,-48
    1632:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1636:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    163a:	0705                	add	a4,a4,1
    163c:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1640:	0006861b          	sext.w	a2,a3
    1644:	ff08f0e3          	bgeu	a7,a6,1624 <atoi+0x3c>
    return neg ? n : -n;
    1648:	00030563          	beqz	t1,1652 <atoi+0x6a>
}
    164c:	8082                	ret
        s++;
    164e:	0505                	add	a0,a0,1
    1650:	bf79                	j	15ee <atoi+0x6>
    return neg ? n : -n;
    1652:	40f5853b          	subw	a0,a1,a5
    1656:	8082                	ret
    while (isdigit(*s))
    1658:	00154603          	lbu	a2,1(a0)
    165c:	47a5                	li	a5,9
        s++;
    165e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1662:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1666:	4301                	li	t1,0
    while (isdigit(*s))
    1668:	2601                	sext.w	a2,a2
    166a:	fad7fbe3          	bgeu	a5,a3,1620 <atoi+0x38>
    166e:	4501                	li	a0,0
}
    1670:	8082                	ret
    while (isdigit(*s))
    1672:	00154603          	lbu	a2,1(a0)
    1676:	47a5                	li	a5,9
        s++;
    1678:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    167c:	fd06069b          	addw	a3,a2,-48
    1680:	2601                	sext.w	a2,a2
    1682:	fed7e6e3          	bltu	a5,a3,166e <atoi+0x86>
        neg = 1;
    1686:	4305                	li	t1,1
    1688:	bf61                	j	1620 <atoi+0x38>

000000000000168a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168a:	18060163          	beqz	a2,180c <memset+0x182>
    168e:	40a006b3          	neg	a3,a0
    1692:	0076f793          	and	a5,a3,7
    1696:	00778813          	add	a6,a5,7
    169a:	48ad                	li	a7,11
    169c:	0ff5f713          	zext.b	a4,a1
    16a0:	fff60593          	add	a1,a2,-1
    16a4:	17186563          	bltu	a6,a7,180e <memset+0x184>
    16a8:	1705ed63          	bltu	a1,a6,1822 <memset+0x198>
    16ac:	16078363          	beqz	a5,1812 <memset+0x188>
    16b0:	00e50023          	sb	a4,0(a0)
    16b4:	0066f593          	and	a1,a3,6
    16b8:	16058063          	beqz	a1,1818 <memset+0x18e>
    16bc:	00e500a3          	sb	a4,1(a0)
    16c0:	4589                	li	a1,2
    16c2:	16f5f363          	bgeu	a1,a5,1828 <memset+0x19e>
    16c6:	00e50123          	sb	a4,2(a0)
    16ca:	8a91                	and	a3,a3,4
    16cc:	00350593          	add	a1,a0,3
    16d0:	4e0d                	li	t3,3
    16d2:	ce9d                	beqz	a3,1710 <memset+0x86>
    16d4:	00e501a3          	sb	a4,3(a0)
    16d8:	4691                	li	a3,4
    16da:	00450593          	add	a1,a0,4
    16de:	4e11                	li	t3,4
    16e0:	02f6f863          	bgeu	a3,a5,1710 <memset+0x86>
    16e4:	00e50223          	sb	a4,4(a0)
    16e8:	4695                	li	a3,5
    16ea:	00550593          	add	a1,a0,5
    16ee:	4e15                	li	t3,5
    16f0:	02d78063          	beq	a5,a3,1710 <memset+0x86>
    16f4:	fff50693          	add	a3,a0,-1
    16f8:	00e502a3          	sb	a4,5(a0)
    16fc:	8a9d                	and	a3,a3,7
    16fe:	00650593          	add	a1,a0,6
    1702:	4e19                	li	t3,6
    1704:	e691                	bnez	a3,1710 <memset+0x86>
    1706:	00750593          	add	a1,a0,7
    170a:	00e50323          	sb	a4,6(a0)
    170e:	4e1d                	li	t3,7
    1710:	00871693          	sll	a3,a4,0x8
    1714:	01071813          	sll	a6,a4,0x10
    1718:	8ed9                	or	a3,a3,a4
    171a:	01871893          	sll	a7,a4,0x18
    171e:	0106e6b3          	or	a3,a3,a6
    1722:	0116e6b3          	or	a3,a3,a7
    1726:	02071813          	sll	a6,a4,0x20
    172a:	02871313          	sll	t1,a4,0x28
    172e:	0106e6b3          	or	a3,a3,a6
    1732:	40f608b3          	sub	a7,a2,a5
    1736:	03071813          	sll	a6,a4,0x30
    173a:	0066e6b3          	or	a3,a3,t1
    173e:	0106e6b3          	or	a3,a3,a6
    1742:	03871313          	sll	t1,a4,0x38
    1746:	97aa                	add	a5,a5,a0
    1748:	ff88f813          	and	a6,a7,-8
    174c:	0066e6b3          	or	a3,a3,t1
    1750:	983e                	add	a6,a6,a5
    1752:	e394                	sd	a3,0(a5)
    1754:	07a1                	add	a5,a5,8
    1756:	ff079ee3          	bne	a5,a6,1752 <memset+0xc8>
    175a:	ff88f793          	and	a5,a7,-8
    175e:	0078f893          	and	a7,a7,7
    1762:	00f586b3          	add	a3,a1,a5
    1766:	01c787bb          	addw	a5,a5,t3
    176a:	0a088b63          	beqz	a7,1820 <memset+0x196>
    176e:	00e68023          	sb	a4,0(a3)
    1772:	0017859b          	addw	a1,a5,1
    1776:	08c5fb63          	bgeu	a1,a2,180c <memset+0x182>
    177a:	00e680a3          	sb	a4,1(a3)
    177e:	0027859b          	addw	a1,a5,2
    1782:	08c5f563          	bgeu	a1,a2,180c <memset+0x182>
    1786:	00e68123          	sb	a4,2(a3)
    178a:	0037859b          	addw	a1,a5,3
    178e:	06c5ff63          	bgeu	a1,a2,180c <memset+0x182>
    1792:	00e681a3          	sb	a4,3(a3)
    1796:	0047859b          	addw	a1,a5,4
    179a:	06c5f963          	bgeu	a1,a2,180c <memset+0x182>
    179e:	00e68223          	sb	a4,4(a3)
    17a2:	0057859b          	addw	a1,a5,5
    17a6:	06c5f363          	bgeu	a1,a2,180c <memset+0x182>
    17aa:	00e682a3          	sb	a4,5(a3)
    17ae:	0067859b          	addw	a1,a5,6
    17b2:	04c5fd63          	bgeu	a1,a2,180c <memset+0x182>
    17b6:	00e68323          	sb	a4,6(a3)
    17ba:	0077859b          	addw	a1,a5,7
    17be:	04c5f763          	bgeu	a1,a2,180c <memset+0x182>
    17c2:	00e683a3          	sb	a4,7(a3)
    17c6:	0087859b          	addw	a1,a5,8
    17ca:	04c5f163          	bgeu	a1,a2,180c <memset+0x182>
    17ce:	00e68423          	sb	a4,8(a3)
    17d2:	0097859b          	addw	a1,a5,9
    17d6:	02c5fb63          	bgeu	a1,a2,180c <memset+0x182>
    17da:	00e684a3          	sb	a4,9(a3)
    17de:	00a7859b          	addw	a1,a5,10
    17e2:	02c5f563          	bgeu	a1,a2,180c <memset+0x182>
    17e6:	00e68523          	sb	a4,10(a3)
    17ea:	00b7859b          	addw	a1,a5,11
    17ee:	00c5ff63          	bgeu	a1,a2,180c <memset+0x182>
    17f2:	00e685a3          	sb	a4,11(a3)
    17f6:	00c7859b          	addw	a1,a5,12
    17fa:	00c5f963          	bgeu	a1,a2,180c <memset+0x182>
    17fe:	00e68623          	sb	a4,12(a3)
    1802:	27b5                	addw	a5,a5,13
    1804:	00c7f463          	bgeu	a5,a2,180c <memset+0x182>
    1808:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    180c:	8082                	ret
    180e:	482d                	li	a6,11
    1810:	bd61                	j	16a8 <memset+0x1e>
    char *p = dest;
    1812:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1814:	4e01                	li	t3,0
    1816:	bded                	j	1710 <memset+0x86>
    1818:	00150593          	add	a1,a0,1
    181c:	4e05                	li	t3,1
    181e:	bdcd                	j	1710 <memset+0x86>
    1820:	8082                	ret
    char *p = dest;
    1822:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1824:	4781                	li	a5,0
    1826:	b7a1                	j	176e <memset+0xe4>
    1828:	00250593          	add	a1,a0,2
    182c:	4e09                	li	t3,2
    182e:	b5cd                	j	1710 <memset+0x86>

0000000000001830 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1830:	00054783          	lbu	a5,0(a0)
    1834:	0005c703          	lbu	a4,0(a1)
    1838:	00e79863          	bne	a5,a4,1848 <strcmp+0x18>
    183c:	0505                	add	a0,a0,1
    183e:	0585                	add	a1,a1,1
    1840:	fbe5                	bnez	a5,1830 <strcmp>
    1842:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1844:	9d19                	subw	a0,a0,a4
    1846:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1848:	0007851b          	sext.w	a0,a5
    184c:	bfe5                	j	1844 <strcmp+0x14>

000000000000184e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    184e:	ca15                	beqz	a2,1882 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1850:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1854:	167d                	add	a2,a2,-1
    1856:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185a:	eb99                	bnez	a5,1870 <strncmp+0x22>
    185c:	a815                	j	1890 <strncmp+0x42>
    185e:	00a68e63          	beq	a3,a0,187a <strncmp+0x2c>
    1862:	0505                	add	a0,a0,1
    1864:	00f71b63          	bne	a4,a5,187a <strncmp+0x2c>
    1868:	00054783          	lbu	a5,0(a0)
    186c:	cf89                	beqz	a5,1886 <strncmp+0x38>
    186e:	85b2                	mv	a1,a2
    1870:	0005c703          	lbu	a4,0(a1)
    1874:	00158613          	add	a2,a1,1
    1878:	f37d                	bnez	a4,185e <strncmp+0x10>
        ;
    return *l - *r;
    187a:	0007851b          	sext.w	a0,a5
    187e:	9d19                	subw	a0,a0,a4
    1880:	8082                	ret
        return 0;
    1882:	4501                	li	a0,0
}
    1884:	8082                	ret
    return *l - *r;
    1886:	0015c703          	lbu	a4,1(a1)
    188a:	4501                	li	a0,0
    188c:	9d19                	subw	a0,a0,a4
    188e:	8082                	ret
    1890:	0005c703          	lbu	a4,0(a1)
    1894:	4501                	li	a0,0
    1896:	b7e5                	j	187e <strncmp+0x30>

0000000000001898 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1898:	00757793          	and	a5,a0,7
    189c:	cf89                	beqz	a5,18b6 <strlen+0x1e>
    189e:	87aa                	mv	a5,a0
    18a0:	a029                	j	18aa <strlen+0x12>
    18a2:	0785                	add	a5,a5,1
    18a4:	0077f713          	and	a4,a5,7
    18a8:	cb01                	beqz	a4,18b8 <strlen+0x20>
        if (!*s)
    18aa:	0007c703          	lbu	a4,0(a5)
    18ae:	fb75                	bnez	a4,18a2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b0:	40a78533          	sub	a0,a5,a0
}
    18b4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18b8:	6394                	ld	a3,0(a5)
    18ba:	00000597          	auipc	a1,0x0
    18be:	6e65b583          	ld	a1,1766(a1) # 1fa0 <__clone+0xce>
    18c2:	00000617          	auipc	a2,0x0
    18c6:	6e663603          	ld	a2,1766(a2) # 1fa8 <__clone+0xd6>
    18ca:	a019                	j	18d0 <strlen+0x38>
    18cc:	6794                	ld	a3,8(a5)
    18ce:	07a1                	add	a5,a5,8
    18d0:	00b68733          	add	a4,a3,a1
    18d4:	fff6c693          	not	a3,a3
    18d8:	8f75                	and	a4,a4,a3
    18da:	8f71                	and	a4,a4,a2
    18dc:	db65                	beqz	a4,18cc <strlen+0x34>
    for (; *s; s++)
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	d779                	beqz	a4,18b0 <strlen+0x18>
    18e4:	0017c703          	lbu	a4,1(a5)
    18e8:	0785                	add	a5,a5,1
    18ea:	d379                	beqz	a4,18b0 <strlen+0x18>
    18ec:	0017c703          	lbu	a4,1(a5)
    18f0:	0785                	add	a5,a5,1
    18f2:	fb6d                	bnez	a4,18e4 <strlen+0x4c>
    18f4:	bf75                	j	18b0 <strlen+0x18>

00000000000018f6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f6:	00757713          	and	a4,a0,7
{
    18fa:	87aa                	mv	a5,a0
    18fc:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1900:	cb19                	beqz	a4,1916 <memchr+0x20>
    1902:	ce25                	beqz	a2,197a <memchr+0x84>
    1904:	0007c703          	lbu	a4,0(a5)
    1908:	00b70763          	beq	a4,a1,1916 <memchr+0x20>
    190c:	0785                	add	a5,a5,1
    190e:	0077f713          	and	a4,a5,7
    1912:	167d                	add	a2,a2,-1
    1914:	f77d                	bnez	a4,1902 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1916:	4501                	li	a0,0
    if (n && *s != c)
    1918:	c235                	beqz	a2,197c <memchr+0x86>
    191a:	0007c703          	lbu	a4,0(a5)
    191e:	06b70063          	beq	a4,a1,197e <memchr+0x88>
        size_t k = ONES * c;
    1922:	00000517          	auipc	a0,0x0
    1926:	68e53503          	ld	a0,1678(a0) # 1fb0 <__clone+0xde>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192a:	471d                	li	a4,7
        size_t k = ONES * c;
    192c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1930:	04c77763          	bgeu	a4,a2,197e <memchr+0x88>
    1934:	00000897          	auipc	a7,0x0
    1938:	66c8b883          	ld	a7,1644(a7) # 1fa0 <__clone+0xce>
    193c:	00000817          	auipc	a6,0x0
    1940:	66c83803          	ld	a6,1644(a6) # 1fa8 <__clone+0xd6>
    1944:	431d                	li	t1,7
    1946:	a029                	j	1950 <memchr+0x5a>
    1948:	1661                	add	a2,a2,-8
    194a:	07a1                	add	a5,a5,8
    194c:	00c37c63          	bgeu	t1,a2,1964 <memchr+0x6e>
    1950:	6398                	ld	a4,0(a5)
    1952:	8f29                	xor	a4,a4,a0
    1954:	011706b3          	add	a3,a4,a7
    1958:	fff74713          	not	a4,a4
    195c:	8f75                	and	a4,a4,a3
    195e:	01077733          	and	a4,a4,a6
    1962:	d37d                	beqz	a4,1948 <memchr+0x52>
    1964:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1966:	e601                	bnez	a2,196e <memchr+0x78>
    1968:	a809                	j	197a <memchr+0x84>
    196a:	0505                	add	a0,a0,1
    196c:	c619                	beqz	a2,197a <memchr+0x84>
    196e:	00054783          	lbu	a5,0(a0)
    1972:	167d                	add	a2,a2,-1
    1974:	feb79be3          	bne	a5,a1,196a <memchr+0x74>
    1978:	8082                	ret
    return n ? (void *)s : 0;
    197a:	4501                	li	a0,0
}
    197c:	8082                	ret
    if (n && *s != c)
    197e:	853e                	mv	a0,a5
    1980:	b7fd                	j	196e <memchr+0x78>

0000000000001982 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1982:	1101                	add	sp,sp,-32
    1984:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1986:	862e                	mv	a2,a1
{
    1988:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    198a:	4581                	li	a1,0
{
    198c:	e426                	sd	s1,8(sp)
    198e:	ec06                	sd	ra,24(sp)
    1990:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1992:	f65ff0ef          	jal	18f6 <memchr>
    return p ? p - s : n;
    1996:	c519                	beqz	a0,19a4 <strnlen+0x22>
}
    1998:	60e2                	ld	ra,24(sp)
    199a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    199c:	8d05                	sub	a0,a0,s1
}
    199e:	64a2                	ld	s1,8(sp)
    19a0:	6105                	add	sp,sp,32
    19a2:	8082                	ret
    19a4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19a6:	8522                	mv	a0,s0
}
    19a8:	6442                	ld	s0,16(sp)
    19aa:	64a2                	ld	s1,8(sp)
    19ac:	6105                	add	sp,sp,32
    19ae:	8082                	ret

00000000000019b0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b0:	00a5c7b3          	xor	a5,a1,a0
    19b4:	8b9d                	and	a5,a5,7
    19b6:	eb95                	bnez	a5,19ea <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b8:	0075f793          	and	a5,a1,7
    19bc:	e7b1                	bnez	a5,1a08 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19be:	6198                	ld	a4,0(a1)
    19c0:	00000617          	auipc	a2,0x0
    19c4:	5e063603          	ld	a2,1504(a2) # 1fa0 <__clone+0xce>
    19c8:	00000817          	auipc	a6,0x0
    19cc:	5e083803          	ld	a6,1504(a6) # 1fa8 <__clone+0xd6>
    19d0:	a029                	j	19da <strcpy+0x2a>
    19d2:	05a1                	add	a1,a1,8
    19d4:	e118                	sd	a4,0(a0)
    19d6:	6198                	ld	a4,0(a1)
    19d8:	0521                	add	a0,a0,8
    19da:	00c707b3          	add	a5,a4,a2
    19de:	fff74693          	not	a3,a4
    19e2:	8ff5                	and	a5,a5,a3
    19e4:	0107f7b3          	and	a5,a5,a6
    19e8:	d7ed                	beqz	a5,19d2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ea:	0005c783          	lbu	a5,0(a1)
    19ee:	00f50023          	sb	a5,0(a0)
    19f2:	c785                	beqz	a5,1a1a <strcpy+0x6a>
    19f4:	0015c783          	lbu	a5,1(a1)
    19f8:	0505                	add	a0,a0,1
    19fa:	0585                	add	a1,a1,1
    19fc:	00f50023          	sb	a5,0(a0)
    1a00:	fbf5                	bnez	a5,19f4 <strcpy+0x44>
        ;
    return d;
}
    1a02:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a04:	0505                	add	a0,a0,1
    1a06:	df45                	beqz	a4,19be <strcpy+0xe>
            if (!(*d = *s))
    1a08:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a0c:	0585                	add	a1,a1,1
    1a0e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a12:	00f50023          	sb	a5,0(a0)
    1a16:	f7fd                	bnez	a5,1a04 <strcpy+0x54>
}
    1a18:	8082                	ret
    1a1a:	8082                	ret

0000000000001a1c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a1c:	00a5c7b3          	xor	a5,a1,a0
    1a20:	8b9d                	and	a5,a5,7
    1a22:	e3b5                	bnez	a5,1a86 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a24:	0075f793          	and	a5,a1,7
    1a28:	cf99                	beqz	a5,1a46 <strncpy+0x2a>
    1a2a:	ea09                	bnez	a2,1a3c <strncpy+0x20>
    1a2c:	a421                	j	1c34 <strncpy+0x218>
    1a2e:	0585                	add	a1,a1,1
    1a30:	0075f793          	and	a5,a1,7
    1a34:	167d                	add	a2,a2,-1
    1a36:	0505                	add	a0,a0,1
    1a38:	c799                	beqz	a5,1a46 <strncpy+0x2a>
    1a3a:	c225                	beqz	a2,1a9a <strncpy+0x7e>
    1a3c:	0005c783          	lbu	a5,0(a1)
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	f7ed                	bnez	a5,1a2e <strncpy+0x12>
            ;
        if (!n || !*s)
    1a46:	ca31                	beqz	a2,1a9a <strncpy+0x7e>
    1a48:	0005c783          	lbu	a5,0(a1)
    1a4c:	cba1                	beqz	a5,1a9c <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a4e:	479d                	li	a5,7
    1a50:	02c7fc63          	bgeu	a5,a2,1a88 <strncpy+0x6c>
    1a54:	00000897          	auipc	a7,0x0
    1a58:	54c8b883          	ld	a7,1356(a7) # 1fa0 <__clone+0xce>
    1a5c:	00000817          	auipc	a6,0x0
    1a60:	54c83803          	ld	a6,1356(a6) # 1fa8 <__clone+0xd6>
    1a64:	431d                	li	t1,7
    1a66:	a039                	j	1a74 <strncpy+0x58>
            *wd = *ws;
    1a68:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6a:	1661                	add	a2,a2,-8
    1a6c:	05a1                	add	a1,a1,8
    1a6e:	0521                	add	a0,a0,8
    1a70:	00c37b63          	bgeu	t1,a2,1a86 <strncpy+0x6a>
    1a74:	6198                	ld	a4,0(a1)
    1a76:	011707b3          	add	a5,a4,a7
    1a7a:	fff74693          	not	a3,a4
    1a7e:	8ff5                	and	a5,a5,a3
    1a80:	0107f7b3          	and	a5,a5,a6
    1a84:	d3f5                	beqz	a5,1a68 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a86:	ca11                	beqz	a2,1a9a <strncpy+0x7e>
    1a88:	0005c783          	lbu	a5,0(a1)
    1a8c:	0585                	add	a1,a1,1
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	c789                	beqz	a5,1a9c <strncpy+0x80>
    1a94:	167d                	add	a2,a2,-1
    1a96:	0505                	add	a0,a0,1
    1a98:	fa65                	bnez	a2,1a88 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a9a:	8082                	ret
    1a9c:	4805                	li	a6,1
    1a9e:	14061b63          	bnez	a2,1bf4 <strncpy+0x1d8>
    1aa2:	40a00733          	neg	a4,a0
    1aa6:	00777793          	and	a5,a4,7
    1aaa:	4581                	li	a1,0
    1aac:	12061c63          	bnez	a2,1be4 <strncpy+0x1c8>
    1ab0:	00778693          	add	a3,a5,7
    1ab4:	48ad                	li	a7,11
    1ab6:	1316e563          	bltu	a3,a7,1be0 <strncpy+0x1c4>
    1aba:	16d5e263          	bltu	a1,a3,1c1e <strncpy+0x202>
    1abe:	14078c63          	beqz	a5,1c16 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ac2:	00050023          	sb	zero,0(a0)
    1ac6:	00677693          	and	a3,a4,6
    1aca:	14068263          	beqz	a3,1c0e <strncpy+0x1f2>
    1ace:	000500a3          	sb	zero,1(a0)
    1ad2:	4689                	li	a3,2
    1ad4:	14f6f863          	bgeu	a3,a5,1c24 <strncpy+0x208>
    1ad8:	00050123          	sb	zero,2(a0)
    1adc:	8b11                	and	a4,a4,4
    1ade:	12070463          	beqz	a4,1c06 <strncpy+0x1ea>
    1ae2:	000501a3          	sb	zero,3(a0)
    1ae6:	4711                	li	a4,4
    1ae8:	00450693          	add	a3,a0,4
    1aec:	02f77563          	bgeu	a4,a5,1b16 <strncpy+0xfa>
    1af0:	00050223          	sb	zero,4(a0)
    1af4:	4715                	li	a4,5
    1af6:	00550693          	add	a3,a0,5
    1afa:	00e78e63          	beq	a5,a4,1b16 <strncpy+0xfa>
    1afe:	fff50713          	add	a4,a0,-1
    1b02:	000502a3          	sb	zero,5(a0)
    1b06:	8b1d                	and	a4,a4,7
    1b08:	12071263          	bnez	a4,1c2c <strncpy+0x210>
    1b0c:	00750693          	add	a3,a0,7
    1b10:	00050323          	sb	zero,6(a0)
    1b14:	471d                	li	a4,7
    1b16:	40f80833          	sub	a6,a6,a5
    1b1a:	ff887593          	and	a1,a6,-8
    1b1e:	97aa                	add	a5,a5,a0
    1b20:	95be                	add	a1,a1,a5
    1b22:	0007b023          	sd	zero,0(a5)
    1b26:	07a1                	add	a5,a5,8
    1b28:	feb79de3          	bne	a5,a1,1b22 <strncpy+0x106>
    1b2c:	ff887593          	and	a1,a6,-8
    1b30:	00787813          	and	a6,a6,7
    1b34:	00e587bb          	addw	a5,a1,a4
    1b38:	00b68733          	add	a4,a3,a1
    1b3c:	0e080063          	beqz	a6,1c1c <strncpy+0x200>
    1b40:	00070023          	sb	zero,0(a4)
    1b44:	0017869b          	addw	a3,a5,1
    1b48:	f4c6f9e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b4c:	000700a3          	sb	zero,1(a4)
    1b50:	0027869b          	addw	a3,a5,2
    1b54:	f4c6f3e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b58:	00070123          	sb	zero,2(a4)
    1b5c:	0037869b          	addw	a3,a5,3
    1b60:	f2c6fde3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b64:	000701a3          	sb	zero,3(a4)
    1b68:	0047869b          	addw	a3,a5,4
    1b6c:	f2c6f7e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b70:	00070223          	sb	zero,4(a4)
    1b74:	0057869b          	addw	a3,a5,5
    1b78:	f2c6f1e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b7c:	000702a3          	sb	zero,5(a4)
    1b80:	0067869b          	addw	a3,a5,6
    1b84:	f0c6fbe3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b88:	00070323          	sb	zero,6(a4)
    1b8c:	0077869b          	addw	a3,a5,7
    1b90:	f0c6f5e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1b94:	000703a3          	sb	zero,7(a4)
    1b98:	0087869b          	addw	a3,a5,8
    1b9c:	eec6ffe3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1ba0:	00070423          	sb	zero,8(a4)
    1ba4:	0097869b          	addw	a3,a5,9
    1ba8:	eec6f9e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1bac:	000704a3          	sb	zero,9(a4)
    1bb0:	00a7869b          	addw	a3,a5,10
    1bb4:	eec6f3e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1bb8:	00070523          	sb	zero,10(a4)
    1bbc:	00b7869b          	addw	a3,a5,11
    1bc0:	ecc6fde3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1bc4:	000705a3          	sb	zero,11(a4)
    1bc8:	00c7869b          	addw	a3,a5,12
    1bcc:	ecc6f7e3          	bgeu	a3,a2,1a9a <strncpy+0x7e>
    1bd0:	00070623          	sb	zero,12(a4)
    1bd4:	27b5                	addw	a5,a5,13
    1bd6:	ecc7f2e3          	bgeu	a5,a2,1a9a <strncpy+0x7e>
    1bda:	000706a3          	sb	zero,13(a4)
}
    1bde:	8082                	ret
    1be0:	46ad                	li	a3,11
    1be2:	bde1                	j	1aba <strncpy+0x9e>
    1be4:	00778693          	add	a3,a5,7
    1be8:	48ad                	li	a7,11
    1bea:	fff60593          	add	a1,a2,-1
    1bee:	ed16f6e3          	bgeu	a3,a7,1aba <strncpy+0x9e>
    1bf2:	b7fd                	j	1be0 <strncpy+0x1c4>
    1bf4:	40a00733          	neg	a4,a0
    1bf8:	8832                	mv	a6,a2
    1bfa:	00777793          	and	a5,a4,7
    1bfe:	4581                	li	a1,0
    1c00:	ea0608e3          	beqz	a2,1ab0 <strncpy+0x94>
    1c04:	b7c5                	j	1be4 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c06:	00350693          	add	a3,a0,3
    1c0a:	470d                	li	a4,3
    1c0c:	b729                	j	1b16 <strncpy+0xfa>
    1c0e:	00150693          	add	a3,a0,1
    1c12:	4705                	li	a4,1
    1c14:	b709                	j	1b16 <strncpy+0xfa>
tail:
    1c16:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c18:	4701                	li	a4,0
    1c1a:	bdf5                	j	1b16 <strncpy+0xfa>
    1c1c:	8082                	ret
tail:
    1c1e:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c20:	4781                	li	a5,0
    1c22:	bf39                	j	1b40 <strncpy+0x124>
    1c24:	00250693          	add	a3,a0,2
    1c28:	4709                	li	a4,2
    1c2a:	b5f5                	j	1b16 <strncpy+0xfa>
    1c2c:	00650693          	add	a3,a0,6
    1c30:	4719                	li	a4,6
    1c32:	b5d5                	j	1b16 <strncpy+0xfa>
    1c34:	8082                	ret

0000000000001c36 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c36:	87aa                	mv	a5,a0
    1c38:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c3a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c3e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c42:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c44:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c46:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c4a:	2501                	sext.w	a0,a0
    1c4c:	8082                	ret

0000000000001c4e <openat>:
    register long a7 __asm__("a7") = n;
    1c4e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c52:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c56:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <close>:
    register long a7 __asm__("a7") = n;
    1c5e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <read>:
    register long a7 __asm__("a7") = n;
    1c6a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c72:	8082                	ret

0000000000001c74 <write>:
    register long a7 __asm__("a7") = n;
    1c74:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c78:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7c:	8082                	ret

0000000000001c7e <getpid>:
    register long a7 __asm__("a7") = n;
    1c7e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c82:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <getppid>:
    register long a7 __asm__("a7") = n;
    1c8a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c8e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c96:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c9a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <fork>:
    register long a7 __asm__("a7") = n;
    1ca2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1caa:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb2:	85b2                	mv	a1,a2
    1cb4:	863a                	mv	a2,a4
    if (stack)
    1cb6:	c191                	beqz	a1,1cba <clone+0x8>
	stack += stack_size;
    1cb8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cba:	4781                	li	a5,0
    1cbc:	4701                	li	a4,0
    1cbe:	4681                	li	a3,0
    1cc0:	2601                	sext.w	a2,a2
    1cc2:	ac01                	j	1ed2 <__clone>

0000000000001cc4 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cc4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cc8:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1ccc:	8082                	ret

0000000000001cce <exit>:
    register long a7 __asm__("a7") = n;
    1cce:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd2:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd6:	8082                	ret

0000000000001cd8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cdc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cde:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <exec>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <execve>:
    register long a7 __asm__("a7") = n;
    1cf2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <times>:
    register long a7 __asm__("a7") = n;
    1cfe:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <get_time>:

int64 get_time()
{
    1d0a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d0c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d10:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d14:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d18:	2501                	sext.w	a0,a0
    1d1a:	ed09                	bnez	a0,1d34 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d1c:	67a2                	ld	a5,8(sp)
    1d1e:	3e800713          	li	a4,1000
    1d22:	00015503          	lhu	a0,0(sp)
    1d26:	02e7d7b3          	divu	a5,a5,a4
    1d2a:	02e50533          	mul	a0,a0,a4
    1d2e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d30:	0141                	add	sp,sp,16
    1d32:	8082                	ret
        return -1;
    1d34:	557d                	li	a0,-1
    1d36:	bfed                	j	1d30 <get_time+0x26>

0000000000001d38 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d38:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <time>:
    register long a7 __asm__("a7") = n;
    1d44:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d48:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <sleep>:

int sleep(unsigned long long time)
{
    1d50:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d52:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d54:	850a                	mv	a0,sp
    1d56:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d58:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d5c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d62:	e501                	bnez	a0,1d6a <sleep+0x1a>
    return 0;
    1d64:	4501                	li	a0,0
}
    1d66:	0141                	add	sp,sp,16
    1d68:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6a:	4502                	lw	a0,0(sp)
}
    1d6c:	0141                	add	sp,sp,16
    1d6e:	8082                	ret

0000000000001d70 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d70:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d7c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d80:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d84:	8082                	ret

0000000000001d86 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d86:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8a:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <munmap>:
    register long a7 __asm__("a7") = n;
    1d92:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <wait>:

int wait(int *code)
{
    1d9e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1daa:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <spawn>:
    register long a7 __asm__("a7") = n;
    1db2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <mailread>:
    register long a7 __asm__("a7") = n;
    1dbe:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dca:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dce:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1de2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de4:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1de8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1df2:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1df8:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfa:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e02:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e04:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e08:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <link>:

int link(char *old_path, char *new_path)
{
    1e12:	87aa                	mv	a5,a0
    1e14:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e16:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e1a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e20:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e24:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e26:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <unlink>:

int unlink(char *path)
{
    1e2e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e30:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e34:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e38:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <uname>:
    register long a7 __asm__("a7") = n;
    1e42:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e46:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <brk>:
    register long a7 __asm__("a7") = n;
    1e4e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e52:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e5a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e60:	8082                	ret

0000000000001e62 <chdir>:
    register long a7 __asm__("a7") = n;
    1e62:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e6e:	862e                	mv	a2,a1
    1e70:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e72:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e74:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e78:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e7e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e80:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <getdents>:
    register long a7 __asm__("a7") = n;
    1e88:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <pipe>:
    register long a7 __asm__("a7") = n;
    1e94:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e98:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <dup>:
    register long a7 __asm__("a7") = n;
    1ea2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ea4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <dup2>:
    register long a7 __asm__("a7") = n;
    1eac:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eae:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <mount>:
    register long a7 __asm__("a7") = n;
    1eb8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ebc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <umount>:
    register long a7 __asm__("a7") = n;
    1ec4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ec8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eca:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ed2:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ed4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ed8:	8532                	mv	a0,a2
	mv a2, a4
    1eda:	863a                	mv	a2,a4
	mv a3, a5
    1edc:	86be                	mv	a3,a5
	mv a4, a6
    1ede:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee0:	0dc00893          	li	a7,220
	ecall
    1ee4:	00000073          	ecall

	beqz a0, 1f
    1ee8:	c111                	beqz	a0,1eec <__clone+0x1a>
	# Parent
	ret
    1eea:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eec:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eee:	6522                	ld	a0,8(sp)
	jalr a1
    1ef0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ef2:	05d00893          	li	a7,93
	ecall
    1ef6:	00000073          	ecall
