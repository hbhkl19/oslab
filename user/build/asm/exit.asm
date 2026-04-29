
/home/hbh/oslab/oslab/user/build/riscv64/exit:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a075                	j	10ae <__start_main>

0000000000001004 <test_exit>:
 * 测试成功则输出：
 * "exit OK."
 * 测试失败则输出：
 * "exit ERR."
 */
void test_exit(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ee250513          	add	a0,a0,-286 # 1ee8 <__clone+0x2c>
void test_exit(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    1012:	2f4000ef          	jal	1306 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f6a50513          	add	a0,a0,-150 # 1f80 <__func__.0>
    101e:	2e8000ef          	jal	1306 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ede50513          	add	a0,a0,-290 # 1f00 <__clone+0x44>
    102a:	2dc000ef          	jal	1306 <puts>
    int cpid, waitret, wstatus;
    cpid = fork();
    102e:	45f000ef          	jal	1c8c <fork>
    assert(cpid != -1);
    1032:	57fd                	li	a5,-1
    cpid = fork();
    1034:	842a                	mv	s0,a0
    assert(cpid != -1);
    1036:	02f50b63          	beq	a0,a5,106c <test_exit+0x68>
    if(cpid == 0){
    103a:	ed1d                	bnez	a0,1078 <test_exit+0x74>
        exit(0);
    103c:	47d000ef          	jal	1cb8 <exit>
    }else{
        waitret = wait(&wstatus);
        if(waitret == cpid) printf("exit OK.\n");
        else printf("exit ERR.\n");
    }
    TEST_END(__func__);
    1040:	00001517          	auipc	a0,0x1
    1044:	f1050513          	add	a0,a0,-240 # 1f50 <__clone+0x94>
    1048:	2be000ef          	jal	1306 <puts>
    104c:	00001517          	auipc	a0,0x1
    1050:	f3450513          	add	a0,a0,-204 # 1f80 <__func__.0>
    1054:	2b2000ef          	jal	1306 <puts>
    1058:	00001517          	auipc	a0,0x1
    105c:	ea850513          	add	a0,a0,-344 # 1f00 <__clone+0x44>
    1060:	2a6000ef          	jal	1306 <puts>
}
    1064:	60e2                	ld	ra,24(sp)
    1066:	6442                	ld	s0,16(sp)
    1068:	6105                	add	sp,sp,32
    106a:	8082                	ret
    assert(cpid != -1);
    106c:	00001517          	auipc	a0,0x1
    1070:	ea450513          	add	a0,a0,-348 # 1f10 <__clone+0x54>
    1074:	52e000ef          	jal	15a2 <panic>
        waitret = wait(&wstatus);
    1078:	0068                	add	a0,sp,12
    107a:	50f000ef          	jal	1d88 <wait>
        if(waitret == cpid) printf("exit OK.\n");
    107e:	00a40963          	beq	s0,a0,1090 <test_exit+0x8c>
        else printf("exit ERR.\n");
    1082:	00001517          	auipc	a0,0x1
    1086:	ebe50513          	add	a0,a0,-322 # 1f40 <__clone+0x84>
    108a:	29e000ef          	jal	1328 <printf>
    108e:	bf4d                	j	1040 <test_exit+0x3c>
        if(waitret == cpid) printf("exit OK.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	ea050513          	add	a0,a0,-352 # 1f30 <__clone+0x74>
    1098:	290000ef          	jal	1328 <printf>
    109c:	b755                	j	1040 <test_exit+0x3c>

000000000000109e <main>:

int main(void){
    109e:	1141                	add	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
    test_exit();
    10a2:	f63ff0ef          	jal	1004 <test_exit>
    return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	add	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ae:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b0:	4108                	lw	a0,0(a0)
{
    10b2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10b4:	05a1                	add	a1,a1,8
{
    10b6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b8:	fe7ff0ef          	jal	109e <main>
    10bc:	3fd000ef          	jal	1cb8 <exit>
	return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	add	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c8:	7179                	add	sp,sp,-48
    10ca:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10cc:	12054863          	bltz	a0,11fc <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d0:	02b577bb          	remuw	a5,a0,a1
    10d4:	00001697          	auipc	a3,0x1
    10d8:	ebc68693          	add	a3,a3,-324 # 1f90 <digits>
    buf[16] = 0;
    10dc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e0:	0005871b          	sext.w	a4,a1
    10e4:	1782                	sll	a5,a5,0x20
    10e6:	9381                	srl	a5,a5,0x20
    10e8:	97b6                	add	a5,a5,a3
    10ea:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ee:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f6:	1ab56663          	bltu	a0,a1,12a2 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10fa:	02e8763b          	remuw	a2,a6,a4
    10fe:	1602                	sll	a2,a2,0x20
    1100:	9201                	srl	a2,a2,0x20
    1102:	9636                	add	a2,a2,a3
    1104:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1108:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    110c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1110:	12e86c63          	bltu	a6,a4,1248 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1114:	02e5f63b          	remuw	a2,a1,a4
    1118:	1602                	sll	a2,a2,0x20
    111a:	9201                	srl	a2,a2,0x20
    111c:	9636                	add	a2,a2,a3
    111e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1122:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1126:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    112a:	12e5e863          	bltu	a1,a4,125a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    112e:	02e8763b          	remuw	a2,a6,a4
    1132:	1602                	sll	a2,a2,0x20
    1134:	9201                	srl	a2,a2,0x20
    1136:	9636                	add	a2,a2,a3
    1138:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1140:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1144:	12e86463          	bltu	a6,a4,126c <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1148:	02e5f63b          	remuw	a2,a1,a4
    114c:	1602                	sll	a2,a2,0x20
    114e:	9201                	srl	a2,a2,0x20
    1150:	9636                	add	a2,a2,a3
    1152:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1156:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    115a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    115e:	12e5e063          	bltu	a1,a4,127e <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1162:	02e8763b          	remuw	a2,a6,a4
    1166:	1602                	sll	a2,a2,0x20
    1168:	9201                	srl	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1174:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1178:	0ae86f63          	bltu	a6,a4,1236 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    117c:	02e5f63b          	remuw	a2,a1,a4
    1180:	1602                	sll	a2,a2,0x20
    1182:	9201                	srl	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1192:	0ee5ef63          	bltu	a1,a4,1290 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1196:	02e8763b          	remuw	a2,a6,a4
    119a:	1602                	sll	a2,a2,0x20
    119c:	9201                	srl	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ac:	0ee86d63          	bltu	a6,a4,12a6 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11b0:	02e5f63b          	remuw	a2,a1,a4
    11b4:	1602                	sll	a2,a2,0x20
    11b6:	9201                	srl	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c6:	0ee5e963          	bltu	a1,a4,12b8 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11ca:	1782                	sll	a5,a5,0x20
    11cc:	9381                	srl	a5,a5,0x20
    11ce:	96be                	add	a3,a3,a5
    11d0:	0006c783          	lbu	a5,0(a3)
    11d4:	4599                	li	a1,6
    11d6:	00f10723          	sb	a5,14(sp)

    if (sign)
    11da:	00055763          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11de:	02d00793          	li	a5,45
    11e2:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11e6:	4595                	li	a1,5
    write(f, s, l);
    11e8:	003c                	add	a5,sp,8
    11ea:	4641                	li	a2,16
    11ec:	9e0d                	subw	a2,a2,a1
    11ee:	4505                	li	a0,1
    11f0:	95be                	add	a1,a1,a5
    11f2:	26d000ef          	jal	1c5e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f6:	70a2                	ld	ra,40(sp)
    11f8:	6145                	add	sp,sp,48
    11fa:	8082                	ret
        x = -xx;
    11fc:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1200:	02b677bb          	remuw	a5,a2,a1
    1204:	00001697          	auipc	a3,0x1
    1208:	d8c68693          	add	a3,a3,-628 # 1f90 <digits>
    buf[16] = 0;
    120c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1210:	0005871b          	sext.w	a4,a1
    1214:	1782                	sll	a5,a5,0x20
    1216:	9381                	srl	a5,a5,0x20
    1218:	97b6                	add	a5,a5,a3
    121a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1222:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1226:	ecb67ae3          	bgeu	a2,a1,10fa <printint.constprop.0+0x32>
        buf[i--] = '-';
    122a:	02d00793          	li	a5,45
    122e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1232:	45b9                	li	a1,14
    1234:	bf55                	j	11e8 <printint.constprop.0+0x120>
    1236:	45a9                	li	a1,10
    if (sign)
    1238:	fa0558e3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123c:	02d00793          	li	a5,45
    1240:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1244:	45a5                	li	a1,9
    1246:	b74d                	j	11e8 <printint.constprop.0+0x120>
    1248:	45b9                	li	a1,14
    if (sign)
    124a:	f8055fe3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1256:	45b5                	li	a1,13
    1258:	bf41                	j	11e8 <printint.constprop.0+0x120>
    125a:	45b5                	li	a1,13
    if (sign)
    125c:	f80556e3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1268:	45b1                	li	a1,12
    126a:	bfbd                	j	11e8 <printint.constprop.0+0x120>
    126c:	45b1                	li	a1,12
    if (sign)
    126e:	f6055de3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    127a:	45ad                	li	a1,11
    127c:	b7b5                	j	11e8 <printint.constprop.0+0x120>
    127e:	45ad                	li	a1,11
    if (sign)
    1280:	f60554e3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    128c:	45a9                	li	a1,10
    128e:	bfa9                	j	11e8 <printint.constprop.0+0x120>
    1290:	45a5                	li	a1,9
    if (sign)
    1292:	f4055be3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    129e:	45a1                	li	a1,8
    12a0:	b7a1                	j	11e8 <printint.constprop.0+0x120>
    i = 15;
    12a2:	45bd                	li	a1,15
    12a4:	b791                	j	11e8 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12a6:	45a1                	li	a1,8
    if (sign)
    12a8:	f40550e3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12b4:	459d                	li	a1,7
    12b6:	bf0d                	j	11e8 <printint.constprop.0+0x120>
    12b8:	459d                	li	a1,7
    if (sign)
    12ba:	f20557e3          	bgez	a0,11e8 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12c6:	4599                	li	a1,6
    12c8:	b705                	j	11e8 <printint.constprop.0+0x120>

00000000000012ca <getchar>:
{
    12ca:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12cc:	00f10593          	add	a1,sp,15
    12d0:	4605                	li	a2,1
    12d2:	4501                	li	a0,0
{
    12d4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12da:	17b000ef          	jal	1c54 <read>
}
    12de:	60e2                	ld	ra,24(sp)
    12e0:	00f14503          	lbu	a0,15(sp)
    12e4:	6105                	add	sp,sp,32
    12e6:	8082                	ret

00000000000012e8 <putchar>:
{
    12e8:	1101                	add	sp,sp,-32
    12ea:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ec:	00f10593          	add	a1,sp,15
    12f0:	4605                	li	a2,1
    12f2:	4505                	li	a0,1
{
    12f4:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12fa:	165000ef          	jal	1c5e <write>
}
    12fe:	60e2                	ld	ra,24(sp)
    1300:	2501                	sext.w	a0,a0
    1302:	6105                	add	sp,sp,32
    1304:	8082                	ret

0000000000001306 <puts>:
{
    1306:	1141                	add	sp,sp,-16
    1308:	e406                	sd	ra,8(sp)
    130a:	e022                	sd	s0,0(sp)
    130c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    130e:	574000ef          	jal	1882 <strlen>
    1312:	862a                	mv	a2,a0
    1314:	85a2                	mv	a1,s0
    1316:	4505                	li	a0,1
    1318:	147000ef          	jal	1c5e <write>
}
    131c:	60a2                	ld	ra,8(sp)
    131e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1320:	957d                	sra	a0,a0,0x3f
    return r;
    1322:	2501                	sext.w	a0,a0
}
    1324:	0141                	add	sp,sp,16
    1326:	8082                	ret

0000000000001328 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1328:	7171                	add	sp,sp,-176
    132a:	f85a                	sd	s6,48(sp)
    132c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    132e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1330:	18bc                	add	a5,sp,120
{
    1332:	e8ca                	sd	s2,80(sp)
    1334:	e4ce                	sd	s3,72(sp)
    1336:	e0d2                	sd	s4,64(sp)
    1338:	fc56                	sd	s5,56(sp)
    133a:	f486                	sd	ra,104(sp)
    133c:	f0a2                	sd	s0,96(sp)
    133e:	eca6                	sd	s1,88(sp)
    1340:	fcae                	sd	a1,120(sp)
    1342:	e132                	sd	a2,128(sp)
    1344:	e536                	sd	a3,136(sp)
    1346:	e93a                	sd	a4,144(sp)
    1348:	f142                	sd	a6,160(sp)
    134a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    134c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    134e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1352:	07300a13          	li	s4,115
    1356:	07800a93          	li	s5,120
    buf[i++] = '0';
    135a:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135e:	00001997          	auipc	s3,0x1
    1362:	c3298993          	add	s3,s3,-974 # 1f90 <digits>
        if (!*s)
    1366:	00054783          	lbu	a5,0(a0)
    136a:	16078a63          	beqz	a5,14de <printf+0x1b6>
    136e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1370:	19278d63          	beq	a5,s2,150a <printf+0x1e2>
    1374:	00164783          	lbu	a5,1(a2)
    1378:	0605                	add	a2,a2,1
    137a:	fbfd                	bnez	a5,1370 <printf+0x48>
    137c:	84b2                	mv	s1,a2
        l = z - a;
    137e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1382:	85aa                	mv	a1,a0
    1384:	8622                	mv	a2,s0
    1386:	4505                	li	a0,1
    1388:	0d7000ef          	jal	1c5e <write>
        if (l)
    138c:	1a041463          	bnez	s0,1534 <printf+0x20c>
        if (s[1] == 0)
    1390:	0014c783          	lbu	a5,1(s1)
    1394:	14078563          	beqz	a5,14de <printf+0x1b6>
        switch (s[1])
    1398:	1b478063          	beq	a5,s4,1538 <printf+0x210>
    139c:	14fa6b63          	bltu	s4,a5,14f2 <printf+0x1ca>
    13a0:	06400713          	li	a4,100
    13a4:	1ee78063          	beq	a5,a4,1584 <printf+0x25c>
    13a8:	07000713          	li	a4,112
    13ac:	1ae79963          	bne	a5,a4,155e <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13b6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b8:	631c                	ld	a5,0(a4)
    13ba:	0721                	add	a4,a4,8
    13bc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13be:	00479293          	sll	t0,a5,0x4
    13c2:	00879f93          	sll	t6,a5,0x8
    13c6:	00c79f13          	sll	t5,a5,0xc
    13ca:	01079e93          	sll	t4,a5,0x10
    13ce:	01479e13          	sll	t3,a5,0x14
    13d2:	01879313          	sll	t1,a5,0x18
    13d6:	01c79893          	sll	a7,a5,0x1c
    13da:	02479813          	sll	a6,a5,0x24
    13de:	02879513          	sll	a0,a5,0x28
    13e2:	02c79593          	sll	a1,a5,0x2c
    13e6:	03079693          	sll	a3,a5,0x30
    13ea:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ee:	03c7d413          	srl	s0,a5,0x3c
    13f2:	01c7d39b          	srlw	t2,a5,0x1c
    13f6:	03c2d293          	srl	t0,t0,0x3c
    13fa:	03cfdf93          	srl	t6,t6,0x3c
    13fe:	03cf5f13          	srl	t5,t5,0x3c
    1402:	03cede93          	srl	t4,t4,0x3c
    1406:	03ce5e13          	srl	t3,t3,0x3c
    140a:	03c35313          	srl	t1,t1,0x3c
    140e:	03c8d893          	srl	a7,a7,0x3c
    1412:	03c85813          	srl	a6,a6,0x3c
    1416:	9171                	srl	a0,a0,0x3c
    1418:	91f1                	srl	a1,a1,0x3c
    141a:	92f1                	srl	a3,a3,0x3c
    141c:	9371                	srl	a4,a4,0x3c
    141e:	96ce                	add	a3,a3,s3
    1420:	974e                	add	a4,a4,s3
    1422:	944e                	add	s0,s0,s3
    1424:	92ce                	add	t0,t0,s3
    1426:	9fce                	add	t6,t6,s3
    1428:	9f4e                	add	t5,t5,s3
    142a:	9ece                	add	t4,t4,s3
    142c:	9e4e                	add	t3,t3,s3
    142e:	934e                	add	t1,t1,s3
    1430:	98ce                	add	a7,a7,s3
    1432:	93ce                	add	t2,t2,s3
    1434:	984e                	add	a6,a6,s3
    1436:	954e                	add	a0,a0,s3
    1438:	95ce                	add	a1,a1,s3
    143a:	0006c083          	lbu	ra,0(a3)
    143e:	0002c283          	lbu	t0,0(t0)
    1442:	00074683          	lbu	a3,0(a4)
    1446:	000fcf83          	lbu	t6,0(t6)
    144a:	000f4f03          	lbu	t5,0(t5)
    144e:	000ece83          	lbu	t4,0(t4)
    1452:	000e4e03          	lbu	t3,0(t3)
    1456:	00034303          	lbu	t1,0(t1)
    145a:	0008c883          	lbu	a7,0(a7)
    145e:	0003c383          	lbu	t2,0(t2)
    1462:	00084803          	lbu	a6,0(a6)
    1466:	00054503          	lbu	a0,0(a0)
    146a:	0005c583          	lbu	a1,0(a1)
    146e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1472:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1476:	9371                	srl	a4,a4,0x3c
    1478:	8bbd                	and	a5,a5,15
    147a:	974e                	add	a4,a4,s3
    147c:	97ce                	add	a5,a5,s3
    147e:	005105a3          	sb	t0,11(sp)
    1482:	01f10623          	sb	t6,12(sp)
    1486:	01e106a3          	sb	t5,13(sp)
    148a:	01d10723          	sb	t4,14(sp)
    148e:	01c107a3          	sb	t3,15(sp)
    1492:	00610823          	sb	t1,16(sp)
    1496:	011108a3          	sb	a7,17(sp)
    149a:	00710923          	sb	t2,18(sp)
    149e:	010109a3          	sb	a6,19(sp)
    14a2:	00a10a23          	sb	a0,20(sp)
    14a6:	00b10aa3          	sb	a1,21(sp)
    14aa:	00110b23          	sb	ra,22(sp)
    14ae:	00d10ba3          	sb	a3,23(sp)
    14b2:	00810523          	sb	s0,10(sp)
    14b6:	00074703          	lbu	a4,0(a4)
    14ba:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14be:	002c                	add	a1,sp,8
    14c0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c2:	00e10c23          	sb	a4,24(sp)
    14c6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ca:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ce:	790000ef          	jal	1c5e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d2:	00248513          	add	a0,s1,2
        if (!*s)
    14d6:	00054783          	lbu	a5,0(a0)
    14da:	e8079ae3          	bnez	a5,136e <printf+0x46>
    }
    va_end(ap);
}
    14de:	70a6                	ld	ra,104(sp)
    14e0:	7406                	ld	s0,96(sp)
    14e2:	64e6                	ld	s1,88(sp)
    14e4:	6946                	ld	s2,80(sp)
    14e6:	69a6                	ld	s3,72(sp)
    14e8:	6a06                	ld	s4,64(sp)
    14ea:	7ae2                	ld	s5,56(sp)
    14ec:	7b42                	ld	s6,48(sp)
    14ee:	614d                	add	sp,sp,176
    14f0:	8082                	ret
        switch (s[1])
    14f2:	07579663          	bne	a5,s5,155e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14f6:	6782                	ld	a5,0(sp)
    14f8:	45c1                	li	a1,16
    14fa:	4388                	lw	a0,0(a5)
    14fc:	07a1                	add	a5,a5,8
    14fe:	e03e                	sd	a5,0(sp)
    1500:	bc9ff0ef          	jal	10c8 <printint.constprop.0>
        s += 2;
    1504:	00248513          	add	a0,s1,2
    1508:	b7f9                	j	14d6 <printf+0x1ae>
    150a:	84b2                	mv	s1,a2
    150c:	a039                	j	151a <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    150e:	0024c783          	lbu	a5,2(s1)
    1512:	0605                	add	a2,a2,1
    1514:	0489                	add	s1,s1,2
    1516:	e72794e3          	bne	a5,s2,137e <printf+0x56>
    151a:	0014c783          	lbu	a5,1(s1)
    151e:	ff2788e3          	beq	a5,s2,150e <printf+0x1e6>
        l = z - a;
    1522:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1526:	85aa                	mv	a1,a0
    1528:	8622                	mv	a2,s0
    152a:	4505                	li	a0,1
    152c:	732000ef          	jal	1c5e <write>
        if (l)
    1530:	e60400e3          	beqz	s0,1390 <printf+0x68>
    1534:	8526                	mv	a0,s1
    1536:	bd05                	j	1366 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1538:	6782                	ld	a5,0(sp)
    153a:	6380                	ld	s0,0(a5)
    153c:	07a1                	add	a5,a5,8
    153e:	e03e                	sd	a5,0(sp)
    1540:	cc21                	beqz	s0,1598 <printf+0x270>
            l = strnlen(a, 200);
    1542:	0c800593          	li	a1,200
    1546:	8522                	mv	a0,s0
    1548:	424000ef          	jal	196c <strnlen>
    write(f, s, l);
    154c:	0005061b          	sext.w	a2,a0
    1550:	85a2                	mv	a1,s0
    1552:	4505                	li	a0,1
    1554:	70a000ef          	jal	1c5e <write>
        s += 2;
    1558:	00248513          	add	a0,s1,2
    155c:	bfad                	j	14d6 <printf+0x1ae>
    return write(stdout, &byte, 1);
    155e:	4605                	li	a2,1
    1560:	002c                	add	a1,sp,8
    1562:	4505                	li	a0,1
    char byte = c;
    1564:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1568:	6f6000ef          	jal	1c5e <write>
    char byte = c;
    156c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	add	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	6e4000ef          	jal	1c5e <write>
        s += 2;
    157e:	00248513          	add	a0,s1,2
    1582:	bf91                	j	14d6 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1584:	6782                	ld	a5,0(sp)
    1586:	45a9                	li	a1,10
    1588:	4388                	lw	a0,0(a5)
    158a:	07a1                	add	a5,a5,8
    158c:	e03e                	sd	a5,0(sp)
    158e:	b3bff0ef          	jal	10c8 <printint.constprop.0>
        s += 2;
    1592:	00248513          	add	a0,s1,2
    1596:	b781                	j	14d6 <printf+0x1ae>
                a = "(null)";
    1598:	00001417          	auipc	s0,0x1
    159c:	9c840413          	add	s0,s0,-1592 # 1f60 <__clone+0xa4>
    15a0:	b74d                	j	1542 <printf+0x21a>

00000000000015a2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a2:	1141                	add	sp,sp,-16
    15a4:	e406                	sd	ra,8(sp)
    puts(m);
    15a6:	d61ff0ef          	jal	1306 <puts>
    exit(-100);
}
    15aa:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ac:	f9c00513          	li	a0,-100
}
    15b0:	0141                	add	sp,sp,16
    exit(-100);
    15b2:	a719                	j	1cb8 <exit>

00000000000015b4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b4:	02000793          	li	a5,32
    15b8:	00f50663          	beq	a0,a5,15c4 <isspace+0x10>
    15bc:	355d                	addw	a0,a0,-9
    15be:	00553513          	sltiu	a0,a0,5
    15c2:	8082                	ret
    15c4:	4505                	li	a0,1
}
    15c6:	8082                	ret

00000000000015c8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c8:	fd05051b          	addw	a0,a0,-48
}
    15cc:	00a53513          	sltiu	a0,a0,10
    15d0:	8082                	ret

00000000000015d2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	02000693          	li	a3,32
    15d6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d8:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15dc:	ff77871b          	addw	a4,a5,-9
    15e0:	04d78c63          	beq	a5,a3,1638 <atoi+0x66>
    15e4:	0007861b          	sext.w	a2,a5
    15e8:	04e5f863          	bgeu	a1,a4,1638 <atoi+0x66>
        s++;
    switch (*s)
    15ec:	02b00713          	li	a4,43
    15f0:	04e78963          	beq	a5,a4,1642 <atoi+0x70>
    15f4:	02d00713          	li	a4,45
    15f8:	06e78263          	beq	a5,a4,165c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fc:	fd06069b          	addw	a3,a2,-48
    1600:	47a5                	li	a5,9
    1602:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1604:	4301                	li	t1,0
    while (isdigit(*s))
    1606:	04d7e963          	bltu	a5,a3,1658 <atoi+0x86>
    int n = 0, neg = 0;
    160a:	4501                	li	a0,0
    while (isdigit(*s))
    160c:	48a5                	li	a7,9
    160e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1612:	0025179b          	sllw	a5,a0,0x2
    1616:	9fa9                	addw	a5,a5,a0
    1618:	fd06059b          	addw	a1,a2,-48
    161c:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1620:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1624:	0705                	add	a4,a4,1
    1626:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    162a:	0006861b          	sext.w	a2,a3
    162e:	ff08f0e3          	bgeu	a7,a6,160e <atoi+0x3c>
    return neg ? n : -n;
    1632:	00030563          	beqz	t1,163c <atoi+0x6a>
}
    1636:	8082                	ret
        s++;
    1638:	0505                	add	a0,a0,1
    163a:	bf79                	j	15d8 <atoi+0x6>
    return neg ? n : -n;
    163c:	40f5853b          	subw	a0,a1,a5
    1640:	8082                	ret
    while (isdigit(*s))
    1642:	00154603          	lbu	a2,1(a0)
    1646:	47a5                	li	a5,9
        s++;
    1648:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    164c:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1650:	4301                	li	t1,0
    while (isdigit(*s))
    1652:	2601                	sext.w	a2,a2
    1654:	fad7fbe3          	bgeu	a5,a3,160a <atoi+0x38>
    1658:	4501                	li	a0,0
}
    165a:	8082                	ret
    while (isdigit(*s))
    165c:	00154603          	lbu	a2,1(a0)
    1660:	47a5                	li	a5,9
        s++;
    1662:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1666:	fd06069b          	addw	a3,a2,-48
    166a:	2601                	sext.w	a2,a2
    166c:	fed7e6e3          	bltu	a5,a3,1658 <atoi+0x86>
        neg = 1;
    1670:	4305                	li	t1,1
    1672:	bf61                	j	160a <atoi+0x38>

0000000000001674 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1674:	18060163          	beqz	a2,17f6 <memset+0x182>
    1678:	40a006b3          	neg	a3,a0
    167c:	0076f793          	and	a5,a3,7
    1680:	00778813          	add	a6,a5,7
    1684:	48ad                	li	a7,11
    1686:	0ff5f713          	zext.b	a4,a1
    168a:	fff60593          	add	a1,a2,-1
    168e:	17186563          	bltu	a6,a7,17f8 <memset+0x184>
    1692:	1705ed63          	bltu	a1,a6,180c <memset+0x198>
    1696:	16078363          	beqz	a5,17fc <memset+0x188>
    169a:	00e50023          	sb	a4,0(a0)
    169e:	0066f593          	and	a1,a3,6
    16a2:	16058063          	beqz	a1,1802 <memset+0x18e>
    16a6:	00e500a3          	sb	a4,1(a0)
    16aa:	4589                	li	a1,2
    16ac:	16f5f363          	bgeu	a1,a5,1812 <memset+0x19e>
    16b0:	00e50123          	sb	a4,2(a0)
    16b4:	8a91                	and	a3,a3,4
    16b6:	00350593          	add	a1,a0,3
    16ba:	4e0d                	li	t3,3
    16bc:	ce9d                	beqz	a3,16fa <memset+0x86>
    16be:	00e501a3          	sb	a4,3(a0)
    16c2:	4691                	li	a3,4
    16c4:	00450593          	add	a1,a0,4
    16c8:	4e11                	li	t3,4
    16ca:	02f6f863          	bgeu	a3,a5,16fa <memset+0x86>
    16ce:	00e50223          	sb	a4,4(a0)
    16d2:	4695                	li	a3,5
    16d4:	00550593          	add	a1,a0,5
    16d8:	4e15                	li	t3,5
    16da:	02d78063          	beq	a5,a3,16fa <memset+0x86>
    16de:	fff50693          	add	a3,a0,-1
    16e2:	00e502a3          	sb	a4,5(a0)
    16e6:	8a9d                	and	a3,a3,7
    16e8:	00650593          	add	a1,a0,6
    16ec:	4e19                	li	t3,6
    16ee:	e691                	bnez	a3,16fa <memset+0x86>
    16f0:	00750593          	add	a1,a0,7
    16f4:	00e50323          	sb	a4,6(a0)
    16f8:	4e1d                	li	t3,7
    16fa:	00871693          	sll	a3,a4,0x8
    16fe:	01071813          	sll	a6,a4,0x10
    1702:	8ed9                	or	a3,a3,a4
    1704:	01871893          	sll	a7,a4,0x18
    1708:	0106e6b3          	or	a3,a3,a6
    170c:	0116e6b3          	or	a3,a3,a7
    1710:	02071813          	sll	a6,a4,0x20
    1714:	02871313          	sll	t1,a4,0x28
    1718:	0106e6b3          	or	a3,a3,a6
    171c:	40f608b3          	sub	a7,a2,a5
    1720:	03071813          	sll	a6,a4,0x30
    1724:	0066e6b3          	or	a3,a3,t1
    1728:	0106e6b3          	or	a3,a3,a6
    172c:	03871313          	sll	t1,a4,0x38
    1730:	97aa                	add	a5,a5,a0
    1732:	ff88f813          	and	a6,a7,-8
    1736:	0066e6b3          	or	a3,a3,t1
    173a:	983e                	add	a6,a6,a5
    173c:	e394                	sd	a3,0(a5)
    173e:	07a1                	add	a5,a5,8
    1740:	ff079ee3          	bne	a5,a6,173c <memset+0xc8>
    1744:	ff88f793          	and	a5,a7,-8
    1748:	0078f893          	and	a7,a7,7
    174c:	00f586b3          	add	a3,a1,a5
    1750:	01c787bb          	addw	a5,a5,t3
    1754:	0a088b63          	beqz	a7,180a <memset+0x196>
    1758:	00e68023          	sb	a4,0(a3)
    175c:	0017859b          	addw	a1,a5,1
    1760:	08c5fb63          	bgeu	a1,a2,17f6 <memset+0x182>
    1764:	00e680a3          	sb	a4,1(a3)
    1768:	0027859b          	addw	a1,a5,2
    176c:	08c5f563          	bgeu	a1,a2,17f6 <memset+0x182>
    1770:	00e68123          	sb	a4,2(a3)
    1774:	0037859b          	addw	a1,a5,3
    1778:	06c5ff63          	bgeu	a1,a2,17f6 <memset+0x182>
    177c:	00e681a3          	sb	a4,3(a3)
    1780:	0047859b          	addw	a1,a5,4
    1784:	06c5f963          	bgeu	a1,a2,17f6 <memset+0x182>
    1788:	00e68223          	sb	a4,4(a3)
    178c:	0057859b          	addw	a1,a5,5
    1790:	06c5f363          	bgeu	a1,a2,17f6 <memset+0x182>
    1794:	00e682a3          	sb	a4,5(a3)
    1798:	0067859b          	addw	a1,a5,6
    179c:	04c5fd63          	bgeu	a1,a2,17f6 <memset+0x182>
    17a0:	00e68323          	sb	a4,6(a3)
    17a4:	0077859b          	addw	a1,a5,7
    17a8:	04c5f763          	bgeu	a1,a2,17f6 <memset+0x182>
    17ac:	00e683a3          	sb	a4,7(a3)
    17b0:	0087859b          	addw	a1,a5,8
    17b4:	04c5f163          	bgeu	a1,a2,17f6 <memset+0x182>
    17b8:	00e68423          	sb	a4,8(a3)
    17bc:	0097859b          	addw	a1,a5,9
    17c0:	02c5fb63          	bgeu	a1,a2,17f6 <memset+0x182>
    17c4:	00e684a3          	sb	a4,9(a3)
    17c8:	00a7859b          	addw	a1,a5,10
    17cc:	02c5f563          	bgeu	a1,a2,17f6 <memset+0x182>
    17d0:	00e68523          	sb	a4,10(a3)
    17d4:	00b7859b          	addw	a1,a5,11
    17d8:	00c5ff63          	bgeu	a1,a2,17f6 <memset+0x182>
    17dc:	00e685a3          	sb	a4,11(a3)
    17e0:	00c7859b          	addw	a1,a5,12
    17e4:	00c5f963          	bgeu	a1,a2,17f6 <memset+0x182>
    17e8:	00e68623          	sb	a4,12(a3)
    17ec:	27b5                	addw	a5,a5,13
    17ee:	00c7f463          	bgeu	a5,a2,17f6 <memset+0x182>
    17f2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f6:	8082                	ret
    17f8:	482d                	li	a6,11
    17fa:	bd61                	j	1692 <memset+0x1e>
    char *p = dest;
    17fc:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fe:	4e01                	li	t3,0
    1800:	bded                	j	16fa <memset+0x86>
    1802:	00150593          	add	a1,a0,1
    1806:	4e05                	li	t3,1
    1808:	bdcd                	j	16fa <memset+0x86>
    180a:	8082                	ret
    char *p = dest;
    180c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180e:	4781                	li	a5,0
    1810:	b7a1                	j	1758 <memset+0xe4>
    1812:	00250593          	add	a1,a0,2
    1816:	4e09                	li	t3,2
    1818:	b5cd                	j	16fa <memset+0x86>

000000000000181a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    181a:	00054783          	lbu	a5,0(a0)
    181e:	0005c703          	lbu	a4,0(a1)
    1822:	00e79863          	bne	a5,a4,1832 <strcmp+0x18>
    1826:	0505                	add	a0,a0,1
    1828:	0585                	add	a1,a1,1
    182a:	fbe5                	bnez	a5,181a <strcmp>
    182c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182e:	9d19                	subw	a0,a0,a4
    1830:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1832:	0007851b          	sext.w	a0,a5
    1836:	bfe5                	j	182e <strcmp+0x14>

0000000000001838 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1838:	ca15                	beqz	a2,186c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    183e:	167d                	add	a2,a2,-1
    1840:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1844:	eb99                	bnez	a5,185a <strncmp+0x22>
    1846:	a815                	j	187a <strncmp+0x42>
    1848:	00a68e63          	beq	a3,a0,1864 <strncmp+0x2c>
    184c:	0505                	add	a0,a0,1
    184e:	00f71b63          	bne	a4,a5,1864 <strncmp+0x2c>
    1852:	00054783          	lbu	a5,0(a0)
    1856:	cf89                	beqz	a5,1870 <strncmp+0x38>
    1858:	85b2                	mv	a1,a2
    185a:	0005c703          	lbu	a4,0(a1)
    185e:	00158613          	add	a2,a1,1
    1862:	f37d                	bnez	a4,1848 <strncmp+0x10>
        ;
    return *l - *r;
    1864:	0007851b          	sext.w	a0,a5
    1868:	9d19                	subw	a0,a0,a4
    186a:	8082                	ret
        return 0;
    186c:	4501                	li	a0,0
}
    186e:	8082                	ret
    return *l - *r;
    1870:	0015c703          	lbu	a4,1(a1)
    1874:	4501                	li	a0,0
    1876:	9d19                	subw	a0,a0,a4
    1878:	8082                	ret
    187a:	0005c703          	lbu	a4,0(a1)
    187e:	4501                	li	a0,0
    1880:	b7e5                	j	1868 <strncmp+0x30>

0000000000001882 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1882:	00757793          	and	a5,a0,7
    1886:	cf89                	beqz	a5,18a0 <strlen+0x1e>
    1888:	87aa                	mv	a5,a0
    188a:	a029                	j	1894 <strlen+0x12>
    188c:	0785                	add	a5,a5,1
    188e:	0077f713          	and	a4,a5,7
    1892:	cb01                	beqz	a4,18a2 <strlen+0x20>
        if (!*s)
    1894:	0007c703          	lbu	a4,0(a5)
    1898:	fb75                	bnez	a4,188c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    189a:	40a78533          	sub	a0,a5,a0
}
    189e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a2:	6394                	ld	a3,0(a5)
    18a4:	00000597          	auipc	a1,0x0
    18a8:	6c45b583          	ld	a1,1732(a1) # 1f68 <__clone+0xac>
    18ac:	00000617          	auipc	a2,0x0
    18b0:	6c463603          	ld	a2,1732(a2) # 1f70 <__clone+0xb4>
    18b4:	a019                	j	18ba <strlen+0x38>
    18b6:	6794                	ld	a3,8(a5)
    18b8:	07a1                	add	a5,a5,8
    18ba:	00b68733          	add	a4,a3,a1
    18be:	fff6c693          	not	a3,a3
    18c2:	8f75                	and	a4,a4,a3
    18c4:	8f71                	and	a4,a4,a2
    18c6:	db65                	beqz	a4,18b6 <strlen+0x34>
    for (; *s; s++)
    18c8:	0007c703          	lbu	a4,0(a5)
    18cc:	d779                	beqz	a4,189a <strlen+0x18>
    18ce:	0017c703          	lbu	a4,1(a5)
    18d2:	0785                	add	a5,a5,1
    18d4:	d379                	beqz	a4,189a <strlen+0x18>
    18d6:	0017c703          	lbu	a4,1(a5)
    18da:	0785                	add	a5,a5,1
    18dc:	fb6d                	bnez	a4,18ce <strlen+0x4c>
    18de:	bf75                	j	189a <strlen+0x18>

00000000000018e0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e0:	00757713          	and	a4,a0,7
{
    18e4:	87aa                	mv	a5,a0
    18e6:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ea:	cb19                	beqz	a4,1900 <memchr+0x20>
    18ec:	ce25                	beqz	a2,1964 <memchr+0x84>
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	00b70763          	beq	a4,a1,1900 <memchr+0x20>
    18f6:	0785                	add	a5,a5,1
    18f8:	0077f713          	and	a4,a5,7
    18fc:	167d                	add	a2,a2,-1
    18fe:	f77d                	bnez	a4,18ec <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1900:	4501                	li	a0,0
    if (n && *s != c)
    1902:	c235                	beqz	a2,1966 <memchr+0x86>
    1904:	0007c703          	lbu	a4,0(a5)
    1908:	06b70063          	beq	a4,a1,1968 <memchr+0x88>
        size_t k = ONES * c;
    190c:	00000517          	auipc	a0,0x0
    1910:	66c53503          	ld	a0,1644(a0) # 1f78 <__clone+0xbc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1914:	471d                	li	a4,7
        size_t k = ONES * c;
    1916:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	04c77763          	bgeu	a4,a2,1968 <memchr+0x88>
    191e:	00000897          	auipc	a7,0x0
    1922:	64a8b883          	ld	a7,1610(a7) # 1f68 <__clone+0xac>
    1926:	00000817          	auipc	a6,0x0
    192a:	64a83803          	ld	a6,1610(a6) # 1f70 <__clone+0xb4>
    192e:	431d                	li	t1,7
    1930:	a029                	j	193a <memchr+0x5a>
    1932:	1661                	add	a2,a2,-8
    1934:	07a1                	add	a5,a5,8
    1936:	00c37c63          	bgeu	t1,a2,194e <memchr+0x6e>
    193a:	6398                	ld	a4,0(a5)
    193c:	8f29                	xor	a4,a4,a0
    193e:	011706b3          	add	a3,a4,a7
    1942:	fff74713          	not	a4,a4
    1946:	8f75                	and	a4,a4,a3
    1948:	01077733          	and	a4,a4,a6
    194c:	d37d                	beqz	a4,1932 <memchr+0x52>
    194e:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1950:	e601                	bnez	a2,1958 <memchr+0x78>
    1952:	a809                	j	1964 <memchr+0x84>
    1954:	0505                	add	a0,a0,1
    1956:	c619                	beqz	a2,1964 <memchr+0x84>
    1958:	00054783          	lbu	a5,0(a0)
    195c:	167d                	add	a2,a2,-1
    195e:	feb79be3          	bne	a5,a1,1954 <memchr+0x74>
    1962:	8082                	ret
    return n ? (void *)s : 0;
    1964:	4501                	li	a0,0
}
    1966:	8082                	ret
    if (n && *s != c)
    1968:	853e                	mv	a0,a5
    196a:	b7fd                	j	1958 <memchr+0x78>

000000000000196c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    196c:	1101                	add	sp,sp,-32
    196e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1970:	862e                	mv	a2,a1
{
    1972:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1974:	4581                	li	a1,0
{
    1976:	e426                	sd	s1,8(sp)
    1978:	ec06                	sd	ra,24(sp)
    197a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    197c:	f65ff0ef          	jal	18e0 <memchr>
    return p ? p - s : n;
    1980:	c519                	beqz	a0,198e <strnlen+0x22>
}
    1982:	60e2                	ld	ra,24(sp)
    1984:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1986:	8d05                	sub	a0,a0,s1
}
    1988:	64a2                	ld	s1,8(sp)
    198a:	6105                	add	sp,sp,32
    198c:	8082                	ret
    198e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1990:	8522                	mv	a0,s0
}
    1992:	6442                	ld	s0,16(sp)
    1994:	64a2                	ld	s1,8(sp)
    1996:	6105                	add	sp,sp,32
    1998:	8082                	ret

000000000000199a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    199a:	00a5c7b3          	xor	a5,a1,a0
    199e:	8b9d                	and	a5,a5,7
    19a0:	eb95                	bnez	a5,19d4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19a2:	0075f793          	and	a5,a1,7
    19a6:	e7b1                	bnez	a5,19f2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a8:	6198                	ld	a4,0(a1)
    19aa:	00000617          	auipc	a2,0x0
    19ae:	5be63603          	ld	a2,1470(a2) # 1f68 <__clone+0xac>
    19b2:	00000817          	auipc	a6,0x0
    19b6:	5be83803          	ld	a6,1470(a6) # 1f70 <__clone+0xb4>
    19ba:	a029                	j	19c4 <strcpy+0x2a>
    19bc:	05a1                	add	a1,a1,8
    19be:	e118                	sd	a4,0(a0)
    19c0:	6198                	ld	a4,0(a1)
    19c2:	0521                	add	a0,a0,8
    19c4:	00c707b3          	add	a5,a4,a2
    19c8:	fff74693          	not	a3,a4
    19cc:	8ff5                	and	a5,a5,a3
    19ce:	0107f7b3          	and	a5,a5,a6
    19d2:	d7ed                	beqz	a5,19bc <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19d4:	0005c783          	lbu	a5,0(a1)
    19d8:	00f50023          	sb	a5,0(a0)
    19dc:	c785                	beqz	a5,1a04 <strcpy+0x6a>
    19de:	0015c783          	lbu	a5,1(a1)
    19e2:	0505                	add	a0,a0,1
    19e4:	0585                	add	a1,a1,1
    19e6:	00f50023          	sb	a5,0(a0)
    19ea:	fbf5                	bnez	a5,19de <strcpy+0x44>
        ;
    return d;
}
    19ec:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19ee:	0505                	add	a0,a0,1
    19f0:	df45                	beqz	a4,19a8 <strcpy+0xe>
            if (!(*d = *s))
    19f2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19f6:	0585                	add	a1,a1,1
    19f8:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19fc:	00f50023          	sb	a5,0(a0)
    1a00:	f7fd                	bnez	a5,19ee <strcpy+0x54>
}
    1a02:	8082                	ret
    1a04:	8082                	ret

0000000000001a06 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a06:	00a5c7b3          	xor	a5,a1,a0
    1a0a:	8b9d                	and	a5,a5,7
    1a0c:	e3b5                	bnez	a5,1a70 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a0e:	0075f793          	and	a5,a1,7
    1a12:	cf99                	beqz	a5,1a30 <strncpy+0x2a>
    1a14:	ea09                	bnez	a2,1a26 <strncpy+0x20>
    1a16:	a421                	j	1c1e <strncpy+0x218>
    1a18:	0585                	add	a1,a1,1
    1a1a:	0075f793          	and	a5,a1,7
    1a1e:	167d                	add	a2,a2,-1
    1a20:	0505                	add	a0,a0,1
    1a22:	c799                	beqz	a5,1a30 <strncpy+0x2a>
    1a24:	c225                	beqz	a2,1a84 <strncpy+0x7e>
    1a26:	0005c783          	lbu	a5,0(a1)
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	f7ed                	bnez	a5,1a18 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a30:	ca31                	beqz	a2,1a84 <strncpy+0x7e>
    1a32:	0005c783          	lbu	a5,0(a1)
    1a36:	cba1                	beqz	a5,1a86 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a38:	479d                	li	a5,7
    1a3a:	02c7fc63          	bgeu	a5,a2,1a72 <strncpy+0x6c>
    1a3e:	00000897          	auipc	a7,0x0
    1a42:	52a8b883          	ld	a7,1322(a7) # 1f68 <__clone+0xac>
    1a46:	00000817          	auipc	a6,0x0
    1a4a:	52a83803          	ld	a6,1322(a6) # 1f70 <__clone+0xb4>
    1a4e:	431d                	li	t1,7
    1a50:	a039                	j	1a5e <strncpy+0x58>
            *wd = *ws;
    1a52:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a54:	1661                	add	a2,a2,-8
    1a56:	05a1                	add	a1,a1,8
    1a58:	0521                	add	a0,a0,8
    1a5a:	00c37b63          	bgeu	t1,a2,1a70 <strncpy+0x6a>
    1a5e:	6198                	ld	a4,0(a1)
    1a60:	011707b3          	add	a5,a4,a7
    1a64:	fff74693          	not	a3,a4
    1a68:	8ff5                	and	a5,a5,a3
    1a6a:	0107f7b3          	and	a5,a5,a6
    1a6e:	d3f5                	beqz	a5,1a52 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a70:	ca11                	beqz	a2,1a84 <strncpy+0x7e>
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	0585                	add	a1,a1,1
    1a78:	00f50023          	sb	a5,0(a0)
    1a7c:	c789                	beqz	a5,1a86 <strncpy+0x80>
    1a7e:	167d                	add	a2,a2,-1
    1a80:	0505                	add	a0,a0,1
    1a82:	fa65                	bnez	a2,1a72 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a84:	8082                	ret
    1a86:	4805                	li	a6,1
    1a88:	14061b63          	bnez	a2,1bde <strncpy+0x1d8>
    1a8c:	40a00733          	neg	a4,a0
    1a90:	00777793          	and	a5,a4,7
    1a94:	4581                	li	a1,0
    1a96:	12061c63          	bnez	a2,1bce <strncpy+0x1c8>
    1a9a:	00778693          	add	a3,a5,7
    1a9e:	48ad                	li	a7,11
    1aa0:	1316e563          	bltu	a3,a7,1bca <strncpy+0x1c4>
    1aa4:	16d5e263          	bltu	a1,a3,1c08 <strncpy+0x202>
    1aa8:	14078c63          	beqz	a5,1c00 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aac:	00050023          	sb	zero,0(a0)
    1ab0:	00677693          	and	a3,a4,6
    1ab4:	14068263          	beqz	a3,1bf8 <strncpy+0x1f2>
    1ab8:	000500a3          	sb	zero,1(a0)
    1abc:	4689                	li	a3,2
    1abe:	14f6f863          	bgeu	a3,a5,1c0e <strncpy+0x208>
    1ac2:	00050123          	sb	zero,2(a0)
    1ac6:	8b11                	and	a4,a4,4
    1ac8:	12070463          	beqz	a4,1bf0 <strncpy+0x1ea>
    1acc:	000501a3          	sb	zero,3(a0)
    1ad0:	4711                	li	a4,4
    1ad2:	00450693          	add	a3,a0,4
    1ad6:	02f77563          	bgeu	a4,a5,1b00 <strncpy+0xfa>
    1ada:	00050223          	sb	zero,4(a0)
    1ade:	4715                	li	a4,5
    1ae0:	00550693          	add	a3,a0,5
    1ae4:	00e78e63          	beq	a5,a4,1b00 <strncpy+0xfa>
    1ae8:	fff50713          	add	a4,a0,-1
    1aec:	000502a3          	sb	zero,5(a0)
    1af0:	8b1d                	and	a4,a4,7
    1af2:	12071263          	bnez	a4,1c16 <strncpy+0x210>
    1af6:	00750693          	add	a3,a0,7
    1afa:	00050323          	sb	zero,6(a0)
    1afe:	471d                	li	a4,7
    1b00:	40f80833          	sub	a6,a6,a5
    1b04:	ff887593          	and	a1,a6,-8
    1b08:	97aa                	add	a5,a5,a0
    1b0a:	95be                	add	a1,a1,a5
    1b0c:	0007b023          	sd	zero,0(a5)
    1b10:	07a1                	add	a5,a5,8
    1b12:	feb79de3          	bne	a5,a1,1b0c <strncpy+0x106>
    1b16:	ff887593          	and	a1,a6,-8
    1b1a:	00787813          	and	a6,a6,7
    1b1e:	00e587bb          	addw	a5,a1,a4
    1b22:	00b68733          	add	a4,a3,a1
    1b26:	0e080063          	beqz	a6,1c06 <strncpy+0x200>
    1b2a:	00070023          	sb	zero,0(a4)
    1b2e:	0017869b          	addw	a3,a5,1
    1b32:	f4c6f9e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b36:	000700a3          	sb	zero,1(a4)
    1b3a:	0027869b          	addw	a3,a5,2
    1b3e:	f4c6f3e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b42:	00070123          	sb	zero,2(a4)
    1b46:	0037869b          	addw	a3,a5,3
    1b4a:	f2c6fde3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b4e:	000701a3          	sb	zero,3(a4)
    1b52:	0047869b          	addw	a3,a5,4
    1b56:	f2c6f7e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b5a:	00070223          	sb	zero,4(a4)
    1b5e:	0057869b          	addw	a3,a5,5
    1b62:	f2c6f1e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b66:	000702a3          	sb	zero,5(a4)
    1b6a:	0067869b          	addw	a3,a5,6
    1b6e:	f0c6fbe3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b72:	00070323          	sb	zero,6(a4)
    1b76:	0077869b          	addw	a3,a5,7
    1b7a:	f0c6f5e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b7e:	000703a3          	sb	zero,7(a4)
    1b82:	0087869b          	addw	a3,a5,8
    1b86:	eec6ffe3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b8a:	00070423          	sb	zero,8(a4)
    1b8e:	0097869b          	addw	a3,a5,9
    1b92:	eec6f9e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1b96:	000704a3          	sb	zero,9(a4)
    1b9a:	00a7869b          	addw	a3,a5,10
    1b9e:	eec6f3e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1ba2:	00070523          	sb	zero,10(a4)
    1ba6:	00b7869b          	addw	a3,a5,11
    1baa:	ecc6fde3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1bae:	000705a3          	sb	zero,11(a4)
    1bb2:	00c7869b          	addw	a3,a5,12
    1bb6:	ecc6f7e3          	bgeu	a3,a2,1a84 <strncpy+0x7e>
    1bba:	00070623          	sb	zero,12(a4)
    1bbe:	27b5                	addw	a5,a5,13
    1bc0:	ecc7f2e3          	bgeu	a5,a2,1a84 <strncpy+0x7e>
    1bc4:	000706a3          	sb	zero,13(a4)
}
    1bc8:	8082                	ret
    1bca:	46ad                	li	a3,11
    1bcc:	bde1                	j	1aa4 <strncpy+0x9e>
    1bce:	00778693          	add	a3,a5,7
    1bd2:	48ad                	li	a7,11
    1bd4:	fff60593          	add	a1,a2,-1
    1bd8:	ed16f6e3          	bgeu	a3,a7,1aa4 <strncpy+0x9e>
    1bdc:	b7fd                	j	1bca <strncpy+0x1c4>
    1bde:	40a00733          	neg	a4,a0
    1be2:	8832                	mv	a6,a2
    1be4:	00777793          	and	a5,a4,7
    1be8:	4581                	li	a1,0
    1bea:	ea0608e3          	beqz	a2,1a9a <strncpy+0x94>
    1bee:	b7c5                	j	1bce <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf0:	00350693          	add	a3,a0,3
    1bf4:	470d                	li	a4,3
    1bf6:	b729                	j	1b00 <strncpy+0xfa>
    1bf8:	00150693          	add	a3,a0,1
    1bfc:	4705                	li	a4,1
    1bfe:	b709                	j	1b00 <strncpy+0xfa>
tail:
    1c00:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c02:	4701                	li	a4,0
    1c04:	bdf5                	j	1b00 <strncpy+0xfa>
    1c06:	8082                	ret
tail:
    1c08:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0a:	4781                	li	a5,0
    1c0c:	bf39                	j	1b2a <strncpy+0x124>
    1c0e:	00250693          	add	a3,a0,2
    1c12:	4709                	li	a4,2
    1c14:	b5f5                	j	1b00 <strncpy+0xfa>
    1c16:	00650693          	add	a3,a0,6
    1c1a:	4719                	li	a4,6
    1c1c:	b5d5                	j	1b00 <strncpy+0xfa>
    1c1e:	8082                	ret

0000000000001c20 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c20:	87aa                	mv	a5,a0
    1c22:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c24:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c2e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c30:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c34:	2501                	sext.w	a0,a0
    1c36:	8082                	ret

0000000000001c38 <openat>:
    register long a7 __asm__("a7") = n;
    1c38:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c3c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c40:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c44:	2501                	sext.w	a0,a0
    1c46:	8082                	ret

0000000000001c48 <close>:
    register long a7 __asm__("a7") = n;
    1c48:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c4c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <read>:
    register long a7 __asm__("a7") = n;
    1c54:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c58:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c5c:	8082                	ret

0000000000001c5e <write>:
    register long a7 __asm__("a7") = n;
    1c5e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c62:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c66:	8082                	ret

0000000000001c68 <getpid>:
    register long a7 __asm__("a7") = n;
    1c68:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c6c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <getppid>:
    register long a7 __asm__("a7") = n;
    1c74:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c78:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c80:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c84:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <fork>:
    register long a7 __asm__("a7") = n;
    1c8c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c90:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c92:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c94:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c9c:	85b2                	mv	a1,a2
    1c9e:	863a                	mv	a2,a4
    if (stack)
    1ca0:	c191                	beqz	a1,1ca4 <clone+0x8>
	stack += stack_size;
    1ca2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca4:	4781                	li	a5,0
    1ca6:	4701                	li	a4,0
    1ca8:	4681                	li	a3,0
    1caa:	2601                	sext.w	a2,a2
    1cac:	ac01                	j	1ebc <__clone>

0000000000001cae <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cae:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cb2:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cb6:	8082                	ret

0000000000001cb8 <exit>:
    register long a7 __asm__("a7") = n;
    1cb8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cbc:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cc0:	8082                	ret

0000000000001cc2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cc2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cc6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <exec>:
    register long a7 __asm__("a7") = n;
    1cd0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cd4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <execve>:
    register long a7 __asm__("a7") = n;
    1cdc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <times>:
    register long a7 __asm__("a7") = n;
    1ce8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cec:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <get_time>:

int64 get_time()
{
    1cf4:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cf6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cfa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cfc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfe:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d02:	2501                	sext.w	a0,a0
    1d04:	ed09                	bnez	a0,1d1e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d06:	67a2                	ld	a5,8(sp)
    1d08:	3e800713          	li	a4,1000
    1d0c:	00015503          	lhu	a0,0(sp)
    1d10:	02e7d7b3          	divu	a5,a5,a4
    1d14:	02e50533          	mul	a0,a0,a4
    1d18:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d1a:	0141                	add	sp,sp,16
    1d1c:	8082                	ret
        return -1;
    1d1e:	557d                	li	a0,-1
    1d20:	bfed                	j	1d1a <get_time+0x26>

0000000000001d22 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d22:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d26:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <time>:
    register long a7 __asm__("a7") = n;
    1d2e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d32:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <sleep>:

int sleep(unsigned long long time)
{
    1d3a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d3c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d3e:	850a                	mv	a0,sp
    1d40:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d42:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d46:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d48:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d4c:	e501                	bnez	a0,1d54 <sleep+0x1a>
    return 0;
    1d4e:	4501                	li	a0,0
}
    1d50:	0141                	add	sp,sp,16
    1d52:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d54:	4502                	lw	a0,0(sp)
}
    1d56:	0141                	add	sp,sp,16
    1d58:	8082                	ret

0000000000001d5a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d5a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d5e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d66:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d6a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d6e:	8082                	ret

0000000000001d70 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d70:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d74:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <munmap>:
    register long a7 __asm__("a7") = n;
    1d7c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d80:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <wait>:

int wait(int *code)
{
    1d88:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d90:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d92:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d94:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <spawn>:
    register long a7 __asm__("a7") = n;
    1d9c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <mailread>:
    register long a7 __asm__("a7") = n;
    1da8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dcc:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dce:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dd2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd4:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ddc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dde:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de2:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dec:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dee:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <link>:

int link(char *old_path, char *new_path)
{
    1dfc:	87aa                	mv	a5,a0
    1dfe:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e00:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e0a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e0e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e10:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <unlink>:

int unlink(char *path)
{
    1e18:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e1e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <uname>:
    register long a7 __asm__("a7") = n;
    1e2c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <brk>:
    register long a7 __asm__("a7") = n;
    1e38:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e44:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e4a:	8082                	ret

0000000000001e4c <chdir>:
    register long a7 __asm__("a7") = n;
    1e4c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e58:	862e                	mv	a2,a1
    1e5a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e5c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e62:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e66:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e68:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <getdents>:
    register long a7 __asm__("a7") = n;
    1e72:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <pipe>:
    register long a7 __asm__("a7") = n;
    1e7e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <dup>:
    register long a7 __asm__("a7") = n;
    1e8c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e8e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <dup2>:
    register long a7 __asm__("a7") = n;
    1e96:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e98:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <mount>:
    register long a7 __asm__("a7") = n;
    1ea2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <umount>:
    register long a7 __asm__("a7") = n;
    1eae:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ebc:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ebe:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec2:	8532                	mv	a0,a2
	mv a2, a4
    1ec4:	863a                	mv	a2,a4
	mv a3, a5
    1ec6:	86be                	mv	a3,a5
	mv a4, a6
    1ec8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eca:	0dc00893          	li	a7,220
	ecall
    1ece:	00000073          	ecall

	beqz a0, 1f
    1ed2:	c111                	beqz	a0,1ed6 <__clone+0x1a>
	# Parent
	ret
    1ed4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed8:	6522                	ld	a0,8(sp)
	jalr a1
    1eda:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1edc:	05d00893          	li	a7,93
	ecall
    1ee0:	00000073          	ecall
