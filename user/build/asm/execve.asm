
/home/hbh/oslab/oslab/user/build/riscv64/execve:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a08d                	j	1064 <__start_main>

0000000000001004 <test_execve>:
 * 测试成功则输出：
 * "  I am test_echo."
 * 测试失败则输出：
 * "  execve error."
 */
void test_execve(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e8250513          	add	a0,a0,-382 # 1e88 <__clone+0x28>
void test_execve(void){
    100e:	f406                	sd	ra,40(sp)
    TEST_START(__func__);
    1010:	2ac000ef          	jal	12bc <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	ee450513          	add	a0,a0,-284 # 1ef8 <__func__.0>
    101c:	2a0000ef          	jal	12bc <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e8050513          	add	a0,a0,-384 # 1ea0 <__clone+0x40>
    1028:	294000ef          	jal	12bc <puts>
    char *newargv[] = {"test_echo", NULL};
    char *newenviron[] = {NULL};
    execve("test_echo", newargv, newenviron);
    102c:	0030                	add	a2,sp,8
    102e:	080c                	add	a1,sp,16
    char *newargv[] = {"test_echo", NULL};
    1030:	00001517          	auipc	a0,0x1
    1034:	e8050513          	add	a0,a0,-384 # 1eb0 <__clone+0x50>
    1038:	e82a                	sd	a0,16(sp)
    103a:	ec02                	sd	zero,24(sp)
    char *newenviron[] = {NULL};
    103c:	e402                	sd	zero,8(sp)
    execve("test_echo", newargv, newenviron);
    103e:	443000ef          	jal	1c80 <execve>
    printf("  execve error.\n");
    1042:	00001517          	auipc	a0,0x1
    1046:	e7e50513          	add	a0,a0,-386 # 1ec0 <__clone+0x60>
    104a:	294000ef          	jal	12de <printf>
    //TEST_END(__func__);
}
    104e:	70a2                	ld	ra,40(sp)
    1050:	6145                	add	sp,sp,48
    1052:	8082                	ret

0000000000001054 <main>:

int main(void){
    1054:	1141                	add	sp,sp,-16
    1056:	e406                	sd	ra,8(sp)
    test_execve();
    1058:	fadff0ef          	jal	1004 <test_execve>
    return 0;
}
    105c:	60a2                	ld	ra,8(sp)
    105e:	4501                	li	a0,0
    1060:	0141                	add	sp,sp,16
    1062:	8082                	ret

0000000000001064 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1064:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1066:	4108                	lw	a0,0(a0)
{
    1068:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    106a:	05a1                	add	a1,a1,8
{
    106c:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    106e:	fe7ff0ef          	jal	1054 <main>
    1072:	3eb000ef          	jal	1c5c <exit>
	return 0;
}
    1076:	60a2                	ld	ra,8(sp)
    1078:	4501                	li	a0,0
    107a:	0141                	add	sp,sp,16
    107c:	8082                	ret

000000000000107e <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    107e:	7179                	add	sp,sp,-48
    1080:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1082:	12054863          	bltz	a0,11b2 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1086:	02b577bb          	remuw	a5,a0,a1
    108a:	00001697          	auipc	a3,0x1
    108e:	e7e68693          	add	a3,a3,-386 # 1f08 <digits>
    buf[16] = 0;
    1092:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1096:	0005871b          	sext.w	a4,a1
    109a:	1782                	sll	a5,a5,0x20
    109c:	9381                	srl	a5,a5,0x20
    109e:	97b6                	add	a5,a5,a3
    10a0:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10a4:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10a8:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10ac:	1ab56663          	bltu	a0,a1,1258 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10b0:	02e8763b          	remuw	a2,a6,a4
    10b4:	1602                	sll	a2,a2,0x20
    10b6:	9201                	srl	a2,a2,0x20
    10b8:	9636                	add	a2,a2,a3
    10ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10be:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10c2:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10c6:	12e86c63          	bltu	a6,a4,11fe <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10ca:	02e5f63b          	remuw	a2,a1,a4
    10ce:	1602                	sll	a2,a2,0x20
    10d0:	9201                	srl	a2,a2,0x20
    10d2:	9636                	add	a2,a2,a3
    10d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10d8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10dc:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10e0:	12e5e863          	bltu	a1,a4,1210 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10e4:	02e8763b          	remuw	a2,a6,a4
    10e8:	1602                	sll	a2,a2,0x20
    10ea:	9201                	srl	a2,a2,0x20
    10ec:	9636                	add	a2,a2,a3
    10ee:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10f6:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    10fa:	12e86463          	bltu	a6,a4,1222 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    10fe:	02e5f63b          	remuw	a2,a1,a4
    1102:	1602                	sll	a2,a2,0x20
    1104:	9201                	srl	a2,a2,0x20
    1106:	9636                	add	a2,a2,a3
    1108:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1110:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1114:	12e5e063          	bltu	a1,a4,1234 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1118:	02e8763b          	remuw	a2,a6,a4
    111c:	1602                	sll	a2,a2,0x20
    111e:	9201                	srl	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    112e:	0ae86f63          	bltu	a6,a4,11ec <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1132:	02e5f63b          	remuw	a2,a1,a4
    1136:	1602                	sll	a2,a2,0x20
    1138:	9201                	srl	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1144:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1148:	0ee5ef63          	bltu	a1,a4,1246 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    114c:	02e8763b          	remuw	a2,a6,a4
    1150:	1602                	sll	a2,a2,0x20
    1152:	9201                	srl	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115e:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1162:	0ee86d63          	bltu	a6,a4,125c <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1166:	02e5f63b          	remuw	a2,a1,a4
    116a:	1602                	sll	a2,a2,0x20
    116c:	9201                	srl	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1178:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    117c:	0ee5e963          	bltu	a1,a4,126e <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1180:	1782                	sll	a5,a5,0x20
    1182:	9381                	srl	a5,a5,0x20
    1184:	96be                	add	a3,a3,a5
    1186:	0006c783          	lbu	a5,0(a3)
    118a:	4599                	li	a1,6
    118c:	00f10723          	sb	a5,14(sp)

    if (sign)
    1190:	00055763          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1194:	02d00793          	li	a5,45
    1198:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    119c:	4595                	li	a1,5
    write(f, s, l);
    119e:	003c                	add	a5,sp,8
    11a0:	4641                	li	a2,16
    11a2:	9e0d                	subw	a2,a2,a1
    11a4:	4505                	li	a0,1
    11a6:	95be                	add	a1,a1,a5
    11a8:	25b000ef          	jal	1c02 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ac:	70a2                	ld	ra,40(sp)
    11ae:	6145                	add	sp,sp,48
    11b0:	8082                	ret
        x = -xx;
    11b2:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11b6:	02b677bb          	remuw	a5,a2,a1
    11ba:	00001697          	auipc	a3,0x1
    11be:	d4e68693          	add	a3,a3,-690 # 1f08 <digits>
    buf[16] = 0;
    11c2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11c6:	0005871b          	sext.w	a4,a1
    11ca:	1782                	sll	a5,a5,0x20
    11cc:	9381                	srl	a5,a5,0x20
    11ce:	97b6                	add	a5,a5,a3
    11d0:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11d4:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11d8:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11dc:	ecb67ae3          	bgeu	a2,a1,10b0 <printint.constprop.0+0x32>
        buf[i--] = '-';
    11e0:	02d00793          	li	a5,45
    11e4:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11e8:	45b9                	li	a1,14
    11ea:	bf55                	j	119e <printint.constprop.0+0x120>
    11ec:	45a9                	li	a1,10
    if (sign)
    11ee:	fa0558e3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    11f2:	02d00793          	li	a5,45
    11f6:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11fa:	45a5                	li	a1,9
    11fc:	b74d                	j	119e <printint.constprop.0+0x120>
    11fe:	45b9                	li	a1,14
    if (sign)
    1200:	f8055fe3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1204:	02d00793          	li	a5,45
    1208:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    120c:	45b5                	li	a1,13
    120e:	bf41                	j	119e <printint.constprop.0+0x120>
    1210:	45b5                	li	a1,13
    if (sign)
    1212:	f80556e3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    121e:	45b1                	li	a1,12
    1220:	bfbd                	j	119e <printint.constprop.0+0x120>
    1222:	45b1                	li	a1,12
    if (sign)
    1224:	f6055de3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1230:	45ad                	li	a1,11
    1232:	b7b5                	j	119e <printint.constprop.0+0x120>
    1234:	45ad                	li	a1,11
    if (sign)
    1236:	f60554e3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1242:	45a9                	li	a1,10
    1244:	bfa9                	j	119e <printint.constprop.0+0x120>
    1246:	45a5                	li	a1,9
    if (sign)
    1248:	f4055be3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1254:	45a1                	li	a1,8
    1256:	b7a1                	j	119e <printint.constprop.0+0x120>
    i = 15;
    1258:	45bd                	li	a1,15
    125a:	b791                	j	119e <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    125c:	45a1                	li	a1,8
    if (sign)
    125e:	f40550e3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    126a:	459d                	li	a1,7
    126c:	bf0d                	j	119e <printint.constprop.0+0x120>
    126e:	459d                	li	a1,7
    if (sign)
    1270:	f20557e3          	bgez	a0,119e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    127c:	4599                	li	a1,6
    127e:	b705                	j	119e <printint.constprop.0+0x120>

0000000000001280 <getchar>:
{
    1280:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1282:	00f10593          	add	a1,sp,15
    1286:	4605                	li	a2,1
    1288:	4501                	li	a0,0
{
    128a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    128c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1290:	169000ef          	jal	1bf8 <read>
}
    1294:	60e2                	ld	ra,24(sp)
    1296:	00f14503          	lbu	a0,15(sp)
    129a:	6105                	add	sp,sp,32
    129c:	8082                	ret

000000000000129e <putchar>:
{
    129e:	1101                	add	sp,sp,-32
    12a0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a2:	00f10593          	add	a1,sp,15
    12a6:	4605                	li	a2,1
    12a8:	4505                	li	a0,1
{
    12aa:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ac:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12b0:	153000ef          	jal	1c02 <write>
}
    12b4:	60e2                	ld	ra,24(sp)
    12b6:	2501                	sext.w	a0,a0
    12b8:	6105                	add	sp,sp,32
    12ba:	8082                	ret

00000000000012bc <puts>:
{
    12bc:	1141                	add	sp,sp,-16
    12be:	e406                	sd	ra,8(sp)
    12c0:	e022                	sd	s0,0(sp)
    12c2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c4:	562000ef          	jal	1826 <strlen>
    12c8:	862a                	mv	a2,a0
    12ca:	85a2                	mv	a1,s0
    12cc:	4505                	li	a0,1
    12ce:	135000ef          	jal	1c02 <write>
}
    12d2:	60a2                	ld	ra,8(sp)
    12d4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d6:	957d                	sra	a0,a0,0x3f
    return r;
    12d8:	2501                	sext.w	a0,a0
}
    12da:	0141                	add	sp,sp,16
    12dc:	8082                	ret

00000000000012de <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12de:	7171                	add	sp,sp,-176
    12e0:	f85a                	sd	s6,48(sp)
    12e2:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12e4:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e6:	18bc                	add	a5,sp,120
{
    12e8:	e8ca                	sd	s2,80(sp)
    12ea:	e4ce                	sd	s3,72(sp)
    12ec:	e0d2                	sd	s4,64(sp)
    12ee:	fc56                	sd	s5,56(sp)
    12f0:	f486                	sd	ra,104(sp)
    12f2:	f0a2                	sd	s0,96(sp)
    12f4:	eca6                	sd	s1,88(sp)
    12f6:	fcae                	sd	a1,120(sp)
    12f8:	e132                	sd	a2,128(sp)
    12fa:	e536                	sd	a3,136(sp)
    12fc:	e93a                	sd	a4,144(sp)
    12fe:	f142                	sd	a6,160(sp)
    1300:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1302:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1304:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1308:	07300a13          	li	s4,115
    130c:	07800a93          	li	s5,120
    buf[i++] = '0';
    1310:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1314:	00001997          	auipc	s3,0x1
    1318:	bf498993          	add	s3,s3,-1036 # 1f08 <digits>
        if (!*s)
    131c:	00054783          	lbu	a5,0(a0)
    1320:	16078a63          	beqz	a5,1494 <printf+0x1b6>
    1324:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1326:	19278d63          	beq	a5,s2,14c0 <printf+0x1e2>
    132a:	00164783          	lbu	a5,1(a2)
    132e:	0605                	add	a2,a2,1
    1330:	fbfd                	bnez	a5,1326 <printf+0x48>
    1332:	84b2                	mv	s1,a2
        l = z - a;
    1334:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1338:	85aa                	mv	a1,a0
    133a:	8622                	mv	a2,s0
    133c:	4505                	li	a0,1
    133e:	0c5000ef          	jal	1c02 <write>
        if (l)
    1342:	1a041463          	bnez	s0,14ea <printf+0x20c>
        if (s[1] == 0)
    1346:	0014c783          	lbu	a5,1(s1)
    134a:	14078563          	beqz	a5,1494 <printf+0x1b6>
        switch (s[1])
    134e:	1b478063          	beq	a5,s4,14ee <printf+0x210>
    1352:	14fa6b63          	bltu	s4,a5,14a8 <printf+0x1ca>
    1356:	06400713          	li	a4,100
    135a:	1ee78063          	beq	a5,a4,153a <printf+0x25c>
    135e:	07000713          	li	a4,112
    1362:	1ae79963          	bne	a5,a4,1514 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1366:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1368:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    136c:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    136e:	631c                	ld	a5,0(a4)
    1370:	0721                	add	a4,a4,8
    1372:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1374:	00479293          	sll	t0,a5,0x4
    1378:	00879f93          	sll	t6,a5,0x8
    137c:	00c79f13          	sll	t5,a5,0xc
    1380:	01079e93          	sll	t4,a5,0x10
    1384:	01479e13          	sll	t3,a5,0x14
    1388:	01879313          	sll	t1,a5,0x18
    138c:	01c79893          	sll	a7,a5,0x1c
    1390:	02479813          	sll	a6,a5,0x24
    1394:	02879513          	sll	a0,a5,0x28
    1398:	02c79593          	sll	a1,a5,0x2c
    139c:	03079693          	sll	a3,a5,0x30
    13a0:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a4:	03c7d413          	srl	s0,a5,0x3c
    13a8:	01c7d39b          	srlw	t2,a5,0x1c
    13ac:	03c2d293          	srl	t0,t0,0x3c
    13b0:	03cfdf93          	srl	t6,t6,0x3c
    13b4:	03cf5f13          	srl	t5,t5,0x3c
    13b8:	03cede93          	srl	t4,t4,0x3c
    13bc:	03ce5e13          	srl	t3,t3,0x3c
    13c0:	03c35313          	srl	t1,t1,0x3c
    13c4:	03c8d893          	srl	a7,a7,0x3c
    13c8:	03c85813          	srl	a6,a6,0x3c
    13cc:	9171                	srl	a0,a0,0x3c
    13ce:	91f1                	srl	a1,a1,0x3c
    13d0:	92f1                	srl	a3,a3,0x3c
    13d2:	9371                	srl	a4,a4,0x3c
    13d4:	96ce                	add	a3,a3,s3
    13d6:	974e                	add	a4,a4,s3
    13d8:	944e                	add	s0,s0,s3
    13da:	92ce                	add	t0,t0,s3
    13dc:	9fce                	add	t6,t6,s3
    13de:	9f4e                	add	t5,t5,s3
    13e0:	9ece                	add	t4,t4,s3
    13e2:	9e4e                	add	t3,t3,s3
    13e4:	934e                	add	t1,t1,s3
    13e6:	98ce                	add	a7,a7,s3
    13e8:	93ce                	add	t2,t2,s3
    13ea:	984e                	add	a6,a6,s3
    13ec:	954e                	add	a0,a0,s3
    13ee:	95ce                	add	a1,a1,s3
    13f0:	0006c083          	lbu	ra,0(a3)
    13f4:	0002c283          	lbu	t0,0(t0)
    13f8:	00074683          	lbu	a3,0(a4)
    13fc:	000fcf83          	lbu	t6,0(t6)
    1400:	000f4f03          	lbu	t5,0(t5)
    1404:	000ece83          	lbu	t4,0(t4)
    1408:	000e4e03          	lbu	t3,0(t3)
    140c:	00034303          	lbu	t1,0(t1)
    1410:	0008c883          	lbu	a7,0(a7)
    1414:	0003c383          	lbu	t2,0(t2)
    1418:	00084803          	lbu	a6,0(a6)
    141c:	00054503          	lbu	a0,0(a0)
    1420:	0005c583          	lbu	a1,0(a1)
    1424:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1428:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142c:	9371                	srl	a4,a4,0x3c
    142e:	8bbd                	and	a5,a5,15
    1430:	974e                	add	a4,a4,s3
    1432:	97ce                	add	a5,a5,s3
    1434:	005105a3          	sb	t0,11(sp)
    1438:	01f10623          	sb	t6,12(sp)
    143c:	01e106a3          	sb	t5,13(sp)
    1440:	01d10723          	sb	t4,14(sp)
    1444:	01c107a3          	sb	t3,15(sp)
    1448:	00610823          	sb	t1,16(sp)
    144c:	011108a3          	sb	a7,17(sp)
    1450:	00710923          	sb	t2,18(sp)
    1454:	010109a3          	sb	a6,19(sp)
    1458:	00a10a23          	sb	a0,20(sp)
    145c:	00b10aa3          	sb	a1,21(sp)
    1460:	00110b23          	sb	ra,22(sp)
    1464:	00d10ba3          	sb	a3,23(sp)
    1468:	00810523          	sb	s0,10(sp)
    146c:	00074703          	lbu	a4,0(a4)
    1470:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1474:	002c                	add	a1,sp,8
    1476:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1478:	00e10c23          	sb	a4,24(sp)
    147c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1480:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1484:	77e000ef          	jal	1c02 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1488:	00248513          	add	a0,s1,2
        if (!*s)
    148c:	00054783          	lbu	a5,0(a0)
    1490:	e8079ae3          	bnez	a5,1324 <printf+0x46>
    }
    va_end(ap);
}
    1494:	70a6                	ld	ra,104(sp)
    1496:	7406                	ld	s0,96(sp)
    1498:	64e6                	ld	s1,88(sp)
    149a:	6946                	ld	s2,80(sp)
    149c:	69a6                	ld	s3,72(sp)
    149e:	6a06                	ld	s4,64(sp)
    14a0:	7ae2                	ld	s5,56(sp)
    14a2:	7b42                	ld	s6,48(sp)
    14a4:	614d                	add	sp,sp,176
    14a6:	8082                	ret
        switch (s[1])
    14a8:	07579663          	bne	a5,s5,1514 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14ac:	6782                	ld	a5,0(sp)
    14ae:	45c1                	li	a1,16
    14b0:	4388                	lw	a0,0(a5)
    14b2:	07a1                	add	a5,a5,8
    14b4:	e03e                	sd	a5,0(sp)
    14b6:	bc9ff0ef          	jal	107e <printint.constprop.0>
        s += 2;
    14ba:	00248513          	add	a0,s1,2
    14be:	b7f9                	j	148c <printf+0x1ae>
    14c0:	84b2                	mv	s1,a2
    14c2:	a039                	j	14d0 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14c4:	0024c783          	lbu	a5,2(s1)
    14c8:	0605                	add	a2,a2,1
    14ca:	0489                	add	s1,s1,2
    14cc:	e72794e3          	bne	a5,s2,1334 <printf+0x56>
    14d0:	0014c783          	lbu	a5,1(s1)
    14d4:	ff2788e3          	beq	a5,s2,14c4 <printf+0x1e6>
        l = z - a;
    14d8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14dc:	85aa                	mv	a1,a0
    14de:	8622                	mv	a2,s0
    14e0:	4505                	li	a0,1
    14e2:	720000ef          	jal	1c02 <write>
        if (l)
    14e6:	e60400e3          	beqz	s0,1346 <printf+0x68>
    14ea:	8526                	mv	a0,s1
    14ec:	bd05                	j	131c <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    14ee:	6782                	ld	a5,0(sp)
    14f0:	6380                	ld	s0,0(a5)
    14f2:	07a1                	add	a5,a5,8
    14f4:	e03e                	sd	a5,0(sp)
    14f6:	cc21                	beqz	s0,154e <printf+0x270>
            l = strnlen(a, 200);
    14f8:	0c800593          	li	a1,200
    14fc:	8522                	mv	a0,s0
    14fe:	412000ef          	jal	1910 <strnlen>
    write(f, s, l);
    1502:	0005061b          	sext.w	a2,a0
    1506:	85a2                	mv	a1,s0
    1508:	4505                	li	a0,1
    150a:	6f8000ef          	jal	1c02 <write>
        s += 2;
    150e:	00248513          	add	a0,s1,2
    1512:	bfad                	j	148c <printf+0x1ae>
    return write(stdout, &byte, 1);
    1514:	4605                	li	a2,1
    1516:	002c                	add	a1,sp,8
    1518:	4505                	li	a0,1
    char byte = c;
    151a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    151e:	6e4000ef          	jal	1c02 <write>
    char byte = c;
    1522:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1526:	4605                	li	a2,1
    1528:	002c                	add	a1,sp,8
    152a:	4505                	li	a0,1
    char byte = c;
    152c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1530:	6d2000ef          	jal	1c02 <write>
        s += 2;
    1534:	00248513          	add	a0,s1,2
    1538:	bf91                	j	148c <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    153a:	6782                	ld	a5,0(sp)
    153c:	45a9                	li	a1,10
    153e:	4388                	lw	a0,0(a5)
    1540:	07a1                	add	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	b3bff0ef          	jal	107e <printint.constprop.0>
        s += 2;
    1548:	00248513          	add	a0,s1,2
    154c:	b781                	j	148c <printf+0x1ae>
                a = "(null)";
    154e:	00001417          	auipc	s0,0x1
    1552:	98a40413          	add	s0,s0,-1654 # 1ed8 <__clone+0x78>
    1556:	b74d                	j	14f8 <printf+0x21a>

0000000000001558 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1558:	02000793          	li	a5,32
    155c:	00f50663          	beq	a0,a5,1568 <isspace+0x10>
    1560:	355d                	addw	a0,a0,-9
    1562:	00553513          	sltiu	a0,a0,5
    1566:	8082                	ret
    1568:	4505                	li	a0,1
}
    156a:	8082                	ret

000000000000156c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    156c:	fd05051b          	addw	a0,a0,-48
}
    1570:	00a53513          	sltiu	a0,a0,10
    1574:	8082                	ret

0000000000001576 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1576:	02000693          	li	a3,32
    157a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    157c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1580:	ff77871b          	addw	a4,a5,-9
    1584:	04d78c63          	beq	a5,a3,15dc <atoi+0x66>
    1588:	0007861b          	sext.w	a2,a5
    158c:	04e5f863          	bgeu	a1,a4,15dc <atoi+0x66>
        s++;
    switch (*s)
    1590:	02b00713          	li	a4,43
    1594:	04e78963          	beq	a5,a4,15e6 <atoi+0x70>
    1598:	02d00713          	li	a4,45
    159c:	06e78263          	beq	a5,a4,1600 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15a0:	fd06069b          	addw	a3,a2,-48
    15a4:	47a5                	li	a5,9
    15a6:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15a8:	4301                	li	t1,0
    while (isdigit(*s))
    15aa:	04d7e963          	bltu	a5,a3,15fc <atoi+0x86>
    int n = 0, neg = 0;
    15ae:	4501                	li	a0,0
    while (isdigit(*s))
    15b0:	48a5                	li	a7,9
    15b2:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15b6:	0025179b          	sllw	a5,a0,0x2
    15ba:	9fa9                	addw	a5,a5,a0
    15bc:	fd06059b          	addw	a1,a2,-48
    15c0:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    15c4:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    15c8:	0705                	add	a4,a4,1
    15ca:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    15ce:	0006861b          	sext.w	a2,a3
    15d2:	ff08f0e3          	bgeu	a7,a6,15b2 <atoi+0x3c>
    return neg ? n : -n;
    15d6:	00030563          	beqz	t1,15e0 <atoi+0x6a>
}
    15da:	8082                	ret
        s++;
    15dc:	0505                	add	a0,a0,1
    15de:	bf79                	j	157c <atoi+0x6>
    return neg ? n : -n;
    15e0:	40f5853b          	subw	a0,a1,a5
    15e4:	8082                	ret
    while (isdigit(*s))
    15e6:	00154603          	lbu	a2,1(a0)
    15ea:	47a5                	li	a5,9
        s++;
    15ec:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    15f0:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    15f4:	4301                	li	t1,0
    while (isdigit(*s))
    15f6:	2601                	sext.w	a2,a2
    15f8:	fad7fbe3          	bgeu	a5,a3,15ae <atoi+0x38>
    15fc:	4501                	li	a0,0
}
    15fe:	8082                	ret
    while (isdigit(*s))
    1600:	00154603          	lbu	a2,1(a0)
    1604:	47a5                	li	a5,9
        s++;
    1606:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    160a:	fd06069b          	addw	a3,a2,-48
    160e:	2601                	sext.w	a2,a2
    1610:	fed7e6e3          	bltu	a5,a3,15fc <atoi+0x86>
        neg = 1;
    1614:	4305                	li	t1,1
    1616:	bf61                	j	15ae <atoi+0x38>

0000000000001618 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1618:	18060163          	beqz	a2,179a <memset+0x182>
    161c:	40a006b3          	neg	a3,a0
    1620:	0076f793          	and	a5,a3,7
    1624:	00778813          	add	a6,a5,7
    1628:	48ad                	li	a7,11
    162a:	0ff5f713          	zext.b	a4,a1
    162e:	fff60593          	add	a1,a2,-1
    1632:	17186563          	bltu	a6,a7,179c <memset+0x184>
    1636:	1705ed63          	bltu	a1,a6,17b0 <memset+0x198>
    163a:	16078363          	beqz	a5,17a0 <memset+0x188>
    163e:	00e50023          	sb	a4,0(a0)
    1642:	0066f593          	and	a1,a3,6
    1646:	16058063          	beqz	a1,17a6 <memset+0x18e>
    164a:	00e500a3          	sb	a4,1(a0)
    164e:	4589                	li	a1,2
    1650:	16f5f363          	bgeu	a1,a5,17b6 <memset+0x19e>
    1654:	00e50123          	sb	a4,2(a0)
    1658:	8a91                	and	a3,a3,4
    165a:	00350593          	add	a1,a0,3
    165e:	4e0d                	li	t3,3
    1660:	ce9d                	beqz	a3,169e <memset+0x86>
    1662:	00e501a3          	sb	a4,3(a0)
    1666:	4691                	li	a3,4
    1668:	00450593          	add	a1,a0,4
    166c:	4e11                	li	t3,4
    166e:	02f6f863          	bgeu	a3,a5,169e <memset+0x86>
    1672:	00e50223          	sb	a4,4(a0)
    1676:	4695                	li	a3,5
    1678:	00550593          	add	a1,a0,5
    167c:	4e15                	li	t3,5
    167e:	02d78063          	beq	a5,a3,169e <memset+0x86>
    1682:	fff50693          	add	a3,a0,-1
    1686:	00e502a3          	sb	a4,5(a0)
    168a:	8a9d                	and	a3,a3,7
    168c:	00650593          	add	a1,a0,6
    1690:	4e19                	li	t3,6
    1692:	e691                	bnez	a3,169e <memset+0x86>
    1694:	00750593          	add	a1,a0,7
    1698:	00e50323          	sb	a4,6(a0)
    169c:	4e1d                	li	t3,7
    169e:	00871693          	sll	a3,a4,0x8
    16a2:	01071813          	sll	a6,a4,0x10
    16a6:	8ed9                	or	a3,a3,a4
    16a8:	01871893          	sll	a7,a4,0x18
    16ac:	0106e6b3          	or	a3,a3,a6
    16b0:	0116e6b3          	or	a3,a3,a7
    16b4:	02071813          	sll	a6,a4,0x20
    16b8:	02871313          	sll	t1,a4,0x28
    16bc:	0106e6b3          	or	a3,a3,a6
    16c0:	40f608b3          	sub	a7,a2,a5
    16c4:	03071813          	sll	a6,a4,0x30
    16c8:	0066e6b3          	or	a3,a3,t1
    16cc:	0106e6b3          	or	a3,a3,a6
    16d0:	03871313          	sll	t1,a4,0x38
    16d4:	97aa                	add	a5,a5,a0
    16d6:	ff88f813          	and	a6,a7,-8
    16da:	0066e6b3          	or	a3,a3,t1
    16de:	983e                	add	a6,a6,a5
    16e0:	e394                	sd	a3,0(a5)
    16e2:	07a1                	add	a5,a5,8
    16e4:	ff079ee3          	bne	a5,a6,16e0 <memset+0xc8>
    16e8:	ff88f793          	and	a5,a7,-8
    16ec:	0078f893          	and	a7,a7,7
    16f0:	00f586b3          	add	a3,a1,a5
    16f4:	01c787bb          	addw	a5,a5,t3
    16f8:	0a088b63          	beqz	a7,17ae <memset+0x196>
    16fc:	00e68023          	sb	a4,0(a3)
    1700:	0017859b          	addw	a1,a5,1
    1704:	08c5fb63          	bgeu	a1,a2,179a <memset+0x182>
    1708:	00e680a3          	sb	a4,1(a3)
    170c:	0027859b          	addw	a1,a5,2
    1710:	08c5f563          	bgeu	a1,a2,179a <memset+0x182>
    1714:	00e68123          	sb	a4,2(a3)
    1718:	0037859b          	addw	a1,a5,3
    171c:	06c5ff63          	bgeu	a1,a2,179a <memset+0x182>
    1720:	00e681a3          	sb	a4,3(a3)
    1724:	0047859b          	addw	a1,a5,4
    1728:	06c5f963          	bgeu	a1,a2,179a <memset+0x182>
    172c:	00e68223          	sb	a4,4(a3)
    1730:	0057859b          	addw	a1,a5,5
    1734:	06c5f363          	bgeu	a1,a2,179a <memset+0x182>
    1738:	00e682a3          	sb	a4,5(a3)
    173c:	0067859b          	addw	a1,a5,6
    1740:	04c5fd63          	bgeu	a1,a2,179a <memset+0x182>
    1744:	00e68323          	sb	a4,6(a3)
    1748:	0077859b          	addw	a1,a5,7
    174c:	04c5f763          	bgeu	a1,a2,179a <memset+0x182>
    1750:	00e683a3          	sb	a4,7(a3)
    1754:	0087859b          	addw	a1,a5,8
    1758:	04c5f163          	bgeu	a1,a2,179a <memset+0x182>
    175c:	00e68423          	sb	a4,8(a3)
    1760:	0097859b          	addw	a1,a5,9
    1764:	02c5fb63          	bgeu	a1,a2,179a <memset+0x182>
    1768:	00e684a3          	sb	a4,9(a3)
    176c:	00a7859b          	addw	a1,a5,10
    1770:	02c5f563          	bgeu	a1,a2,179a <memset+0x182>
    1774:	00e68523          	sb	a4,10(a3)
    1778:	00b7859b          	addw	a1,a5,11
    177c:	00c5ff63          	bgeu	a1,a2,179a <memset+0x182>
    1780:	00e685a3          	sb	a4,11(a3)
    1784:	00c7859b          	addw	a1,a5,12
    1788:	00c5f963          	bgeu	a1,a2,179a <memset+0x182>
    178c:	00e68623          	sb	a4,12(a3)
    1790:	27b5                	addw	a5,a5,13
    1792:	00c7f463          	bgeu	a5,a2,179a <memset+0x182>
    1796:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    179a:	8082                	ret
    179c:	482d                	li	a6,11
    179e:	bd61                	j	1636 <memset+0x1e>
    char *p = dest;
    17a0:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17a2:	4e01                	li	t3,0
    17a4:	bded                	j	169e <memset+0x86>
    17a6:	00150593          	add	a1,a0,1
    17aa:	4e05                	li	t3,1
    17ac:	bdcd                	j	169e <memset+0x86>
    17ae:	8082                	ret
    char *p = dest;
    17b0:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b2:	4781                	li	a5,0
    17b4:	b7a1                	j	16fc <memset+0xe4>
    17b6:	00250593          	add	a1,a0,2
    17ba:	4e09                	li	t3,2
    17bc:	b5cd                	j	169e <memset+0x86>

00000000000017be <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17be:	00054783          	lbu	a5,0(a0)
    17c2:	0005c703          	lbu	a4,0(a1)
    17c6:	00e79863          	bne	a5,a4,17d6 <strcmp+0x18>
    17ca:	0505                	add	a0,a0,1
    17cc:	0585                	add	a1,a1,1
    17ce:	fbe5                	bnez	a5,17be <strcmp>
    17d0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17d2:	9d19                	subw	a0,a0,a4
    17d4:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17d6:	0007851b          	sext.w	a0,a5
    17da:	bfe5                	j	17d2 <strcmp+0x14>

00000000000017dc <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17dc:	ca15                	beqz	a2,1810 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17de:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17e2:	167d                	add	a2,a2,-1
    17e4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e8:	eb99                	bnez	a5,17fe <strncmp+0x22>
    17ea:	a815                	j	181e <strncmp+0x42>
    17ec:	00a68e63          	beq	a3,a0,1808 <strncmp+0x2c>
    17f0:	0505                	add	a0,a0,1
    17f2:	00f71b63          	bne	a4,a5,1808 <strncmp+0x2c>
    17f6:	00054783          	lbu	a5,0(a0)
    17fa:	cf89                	beqz	a5,1814 <strncmp+0x38>
    17fc:	85b2                	mv	a1,a2
    17fe:	0005c703          	lbu	a4,0(a1)
    1802:	00158613          	add	a2,a1,1
    1806:	f37d                	bnez	a4,17ec <strncmp+0x10>
        ;
    return *l - *r;
    1808:	0007851b          	sext.w	a0,a5
    180c:	9d19                	subw	a0,a0,a4
    180e:	8082                	ret
        return 0;
    1810:	4501                	li	a0,0
}
    1812:	8082                	ret
    return *l - *r;
    1814:	0015c703          	lbu	a4,1(a1)
    1818:	4501                	li	a0,0
    181a:	9d19                	subw	a0,a0,a4
    181c:	8082                	ret
    181e:	0005c703          	lbu	a4,0(a1)
    1822:	4501                	li	a0,0
    1824:	b7e5                	j	180c <strncmp+0x30>

0000000000001826 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1826:	00757793          	and	a5,a0,7
    182a:	cf89                	beqz	a5,1844 <strlen+0x1e>
    182c:	87aa                	mv	a5,a0
    182e:	a029                	j	1838 <strlen+0x12>
    1830:	0785                	add	a5,a5,1
    1832:	0077f713          	and	a4,a5,7
    1836:	cb01                	beqz	a4,1846 <strlen+0x20>
        if (!*s)
    1838:	0007c703          	lbu	a4,0(a5)
    183c:	fb75                	bnez	a4,1830 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    183e:	40a78533          	sub	a0,a5,a0
}
    1842:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1844:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1846:	6394                	ld	a3,0(a5)
    1848:	00000597          	auipc	a1,0x0
    184c:	6985b583          	ld	a1,1688(a1) # 1ee0 <__clone+0x80>
    1850:	00000617          	auipc	a2,0x0
    1854:	69863603          	ld	a2,1688(a2) # 1ee8 <__clone+0x88>
    1858:	a019                	j	185e <strlen+0x38>
    185a:	6794                	ld	a3,8(a5)
    185c:	07a1                	add	a5,a5,8
    185e:	00b68733          	add	a4,a3,a1
    1862:	fff6c693          	not	a3,a3
    1866:	8f75                	and	a4,a4,a3
    1868:	8f71                	and	a4,a4,a2
    186a:	db65                	beqz	a4,185a <strlen+0x34>
    for (; *s; s++)
    186c:	0007c703          	lbu	a4,0(a5)
    1870:	d779                	beqz	a4,183e <strlen+0x18>
    1872:	0017c703          	lbu	a4,1(a5)
    1876:	0785                	add	a5,a5,1
    1878:	d379                	beqz	a4,183e <strlen+0x18>
    187a:	0017c703          	lbu	a4,1(a5)
    187e:	0785                	add	a5,a5,1
    1880:	fb6d                	bnez	a4,1872 <strlen+0x4c>
    1882:	bf75                	j	183e <strlen+0x18>

0000000000001884 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1884:	00757713          	and	a4,a0,7
{
    1888:	87aa                	mv	a5,a0
    188a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    188e:	cb19                	beqz	a4,18a4 <memchr+0x20>
    1890:	ce25                	beqz	a2,1908 <memchr+0x84>
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	00b70763          	beq	a4,a1,18a4 <memchr+0x20>
    189a:	0785                	add	a5,a5,1
    189c:	0077f713          	and	a4,a5,7
    18a0:	167d                	add	a2,a2,-1
    18a2:	f77d                	bnez	a4,1890 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18a4:	4501                	li	a0,0
    if (n && *s != c)
    18a6:	c235                	beqz	a2,190a <memchr+0x86>
    18a8:	0007c703          	lbu	a4,0(a5)
    18ac:	06b70063          	beq	a4,a1,190c <memchr+0x88>
        size_t k = ONES * c;
    18b0:	00000517          	auipc	a0,0x0
    18b4:	64053503          	ld	a0,1600(a0) # 1ef0 <__clone+0x90>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18b8:	471d                	li	a4,7
        size_t k = ONES * c;
    18ba:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18be:	04c77763          	bgeu	a4,a2,190c <memchr+0x88>
    18c2:	00000897          	auipc	a7,0x0
    18c6:	61e8b883          	ld	a7,1566(a7) # 1ee0 <__clone+0x80>
    18ca:	00000817          	auipc	a6,0x0
    18ce:	61e83803          	ld	a6,1566(a6) # 1ee8 <__clone+0x88>
    18d2:	431d                	li	t1,7
    18d4:	a029                	j	18de <memchr+0x5a>
    18d6:	1661                	add	a2,a2,-8
    18d8:	07a1                	add	a5,a5,8
    18da:	00c37c63          	bgeu	t1,a2,18f2 <memchr+0x6e>
    18de:	6398                	ld	a4,0(a5)
    18e0:	8f29                	xor	a4,a4,a0
    18e2:	011706b3          	add	a3,a4,a7
    18e6:	fff74713          	not	a4,a4
    18ea:	8f75                	and	a4,a4,a3
    18ec:	01077733          	and	a4,a4,a6
    18f0:	d37d                	beqz	a4,18d6 <memchr+0x52>
    18f2:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    18f4:	e601                	bnez	a2,18fc <memchr+0x78>
    18f6:	a809                	j	1908 <memchr+0x84>
    18f8:	0505                	add	a0,a0,1
    18fa:	c619                	beqz	a2,1908 <memchr+0x84>
    18fc:	00054783          	lbu	a5,0(a0)
    1900:	167d                	add	a2,a2,-1
    1902:	feb79be3          	bne	a5,a1,18f8 <memchr+0x74>
    1906:	8082                	ret
    return n ? (void *)s : 0;
    1908:	4501                	li	a0,0
}
    190a:	8082                	ret
    if (n && *s != c)
    190c:	853e                	mv	a0,a5
    190e:	b7fd                	j	18fc <memchr+0x78>

0000000000001910 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1910:	1101                	add	sp,sp,-32
    1912:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1914:	862e                	mv	a2,a1
{
    1916:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1918:	4581                	li	a1,0
{
    191a:	e426                	sd	s1,8(sp)
    191c:	ec06                	sd	ra,24(sp)
    191e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1920:	f65ff0ef          	jal	1884 <memchr>
    return p ? p - s : n;
    1924:	c519                	beqz	a0,1932 <strnlen+0x22>
}
    1926:	60e2                	ld	ra,24(sp)
    1928:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    192a:	8d05                	sub	a0,a0,s1
}
    192c:	64a2                	ld	s1,8(sp)
    192e:	6105                	add	sp,sp,32
    1930:	8082                	ret
    1932:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1934:	8522                	mv	a0,s0
}
    1936:	6442                	ld	s0,16(sp)
    1938:	64a2                	ld	s1,8(sp)
    193a:	6105                	add	sp,sp,32
    193c:	8082                	ret

000000000000193e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    193e:	00a5c7b3          	xor	a5,a1,a0
    1942:	8b9d                	and	a5,a5,7
    1944:	eb95                	bnez	a5,1978 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1946:	0075f793          	and	a5,a1,7
    194a:	e7b1                	bnez	a5,1996 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    194c:	6198                	ld	a4,0(a1)
    194e:	00000617          	auipc	a2,0x0
    1952:	59263603          	ld	a2,1426(a2) # 1ee0 <__clone+0x80>
    1956:	00000817          	auipc	a6,0x0
    195a:	59283803          	ld	a6,1426(a6) # 1ee8 <__clone+0x88>
    195e:	a029                	j	1968 <strcpy+0x2a>
    1960:	05a1                	add	a1,a1,8
    1962:	e118                	sd	a4,0(a0)
    1964:	6198                	ld	a4,0(a1)
    1966:	0521                	add	a0,a0,8
    1968:	00c707b3          	add	a5,a4,a2
    196c:	fff74693          	not	a3,a4
    1970:	8ff5                	and	a5,a5,a3
    1972:	0107f7b3          	and	a5,a5,a6
    1976:	d7ed                	beqz	a5,1960 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1978:	0005c783          	lbu	a5,0(a1)
    197c:	00f50023          	sb	a5,0(a0)
    1980:	c785                	beqz	a5,19a8 <strcpy+0x6a>
    1982:	0015c783          	lbu	a5,1(a1)
    1986:	0505                	add	a0,a0,1
    1988:	0585                	add	a1,a1,1
    198a:	00f50023          	sb	a5,0(a0)
    198e:	fbf5                	bnez	a5,1982 <strcpy+0x44>
        ;
    return d;
}
    1990:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1992:	0505                	add	a0,a0,1
    1994:	df45                	beqz	a4,194c <strcpy+0xe>
            if (!(*d = *s))
    1996:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    199a:	0585                	add	a1,a1,1
    199c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19a0:	00f50023          	sb	a5,0(a0)
    19a4:	f7fd                	bnez	a5,1992 <strcpy+0x54>
}
    19a6:	8082                	ret
    19a8:	8082                	ret

00000000000019aa <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19aa:	00a5c7b3          	xor	a5,a1,a0
    19ae:	8b9d                	and	a5,a5,7
    19b0:	e3b5                	bnez	a5,1a14 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19b2:	0075f793          	and	a5,a1,7
    19b6:	cf99                	beqz	a5,19d4 <strncpy+0x2a>
    19b8:	ea09                	bnez	a2,19ca <strncpy+0x20>
    19ba:	a421                	j	1bc2 <strncpy+0x218>
    19bc:	0585                	add	a1,a1,1
    19be:	0075f793          	and	a5,a1,7
    19c2:	167d                	add	a2,a2,-1
    19c4:	0505                	add	a0,a0,1
    19c6:	c799                	beqz	a5,19d4 <strncpy+0x2a>
    19c8:	c225                	beqz	a2,1a28 <strncpy+0x7e>
    19ca:	0005c783          	lbu	a5,0(a1)
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	f7ed                	bnez	a5,19bc <strncpy+0x12>
            ;
        if (!n || !*s)
    19d4:	ca31                	beqz	a2,1a28 <strncpy+0x7e>
    19d6:	0005c783          	lbu	a5,0(a1)
    19da:	cba1                	beqz	a5,1a2a <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    19dc:	479d                	li	a5,7
    19de:	02c7fc63          	bgeu	a5,a2,1a16 <strncpy+0x6c>
    19e2:	00000897          	auipc	a7,0x0
    19e6:	4fe8b883          	ld	a7,1278(a7) # 1ee0 <__clone+0x80>
    19ea:	00000817          	auipc	a6,0x0
    19ee:	4fe83803          	ld	a6,1278(a6) # 1ee8 <__clone+0x88>
    19f2:	431d                	li	t1,7
    19f4:	a039                	j	1a02 <strncpy+0x58>
            *wd = *ws;
    19f6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    19f8:	1661                	add	a2,a2,-8
    19fa:	05a1                	add	a1,a1,8
    19fc:	0521                	add	a0,a0,8
    19fe:	00c37b63          	bgeu	t1,a2,1a14 <strncpy+0x6a>
    1a02:	6198                	ld	a4,0(a1)
    1a04:	011707b3          	add	a5,a4,a7
    1a08:	fff74693          	not	a3,a4
    1a0c:	8ff5                	and	a5,a5,a3
    1a0e:	0107f7b3          	and	a5,a5,a6
    1a12:	d3f5                	beqz	a5,19f6 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a14:	ca11                	beqz	a2,1a28 <strncpy+0x7e>
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	0585                	add	a1,a1,1
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	c789                	beqz	a5,1a2a <strncpy+0x80>
    1a22:	167d                	add	a2,a2,-1
    1a24:	0505                	add	a0,a0,1
    1a26:	fa65                	bnez	a2,1a16 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a28:	8082                	ret
    1a2a:	4805                	li	a6,1
    1a2c:	14061b63          	bnez	a2,1b82 <strncpy+0x1d8>
    1a30:	40a00733          	neg	a4,a0
    1a34:	00777793          	and	a5,a4,7
    1a38:	4581                	li	a1,0
    1a3a:	12061c63          	bnez	a2,1b72 <strncpy+0x1c8>
    1a3e:	00778693          	add	a3,a5,7
    1a42:	48ad                	li	a7,11
    1a44:	1316e563          	bltu	a3,a7,1b6e <strncpy+0x1c4>
    1a48:	16d5e263          	bltu	a1,a3,1bac <strncpy+0x202>
    1a4c:	14078c63          	beqz	a5,1ba4 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a50:	00050023          	sb	zero,0(a0)
    1a54:	00677693          	and	a3,a4,6
    1a58:	14068263          	beqz	a3,1b9c <strncpy+0x1f2>
    1a5c:	000500a3          	sb	zero,1(a0)
    1a60:	4689                	li	a3,2
    1a62:	14f6f863          	bgeu	a3,a5,1bb2 <strncpy+0x208>
    1a66:	00050123          	sb	zero,2(a0)
    1a6a:	8b11                	and	a4,a4,4
    1a6c:	12070463          	beqz	a4,1b94 <strncpy+0x1ea>
    1a70:	000501a3          	sb	zero,3(a0)
    1a74:	4711                	li	a4,4
    1a76:	00450693          	add	a3,a0,4
    1a7a:	02f77563          	bgeu	a4,a5,1aa4 <strncpy+0xfa>
    1a7e:	00050223          	sb	zero,4(a0)
    1a82:	4715                	li	a4,5
    1a84:	00550693          	add	a3,a0,5
    1a88:	00e78e63          	beq	a5,a4,1aa4 <strncpy+0xfa>
    1a8c:	fff50713          	add	a4,a0,-1
    1a90:	000502a3          	sb	zero,5(a0)
    1a94:	8b1d                	and	a4,a4,7
    1a96:	12071263          	bnez	a4,1bba <strncpy+0x210>
    1a9a:	00750693          	add	a3,a0,7
    1a9e:	00050323          	sb	zero,6(a0)
    1aa2:	471d                	li	a4,7
    1aa4:	40f80833          	sub	a6,a6,a5
    1aa8:	ff887593          	and	a1,a6,-8
    1aac:	97aa                	add	a5,a5,a0
    1aae:	95be                	add	a1,a1,a5
    1ab0:	0007b023          	sd	zero,0(a5)
    1ab4:	07a1                	add	a5,a5,8
    1ab6:	feb79de3          	bne	a5,a1,1ab0 <strncpy+0x106>
    1aba:	ff887593          	and	a1,a6,-8
    1abe:	00787813          	and	a6,a6,7
    1ac2:	00e587bb          	addw	a5,a1,a4
    1ac6:	00b68733          	add	a4,a3,a1
    1aca:	0e080063          	beqz	a6,1baa <strncpy+0x200>
    1ace:	00070023          	sb	zero,0(a4)
    1ad2:	0017869b          	addw	a3,a5,1
    1ad6:	f4c6f9e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1ada:	000700a3          	sb	zero,1(a4)
    1ade:	0027869b          	addw	a3,a5,2
    1ae2:	f4c6f3e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1ae6:	00070123          	sb	zero,2(a4)
    1aea:	0037869b          	addw	a3,a5,3
    1aee:	f2c6fde3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1af2:	000701a3          	sb	zero,3(a4)
    1af6:	0047869b          	addw	a3,a5,4
    1afa:	f2c6f7e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1afe:	00070223          	sb	zero,4(a4)
    1b02:	0057869b          	addw	a3,a5,5
    1b06:	f2c6f1e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b0a:	000702a3          	sb	zero,5(a4)
    1b0e:	0067869b          	addw	a3,a5,6
    1b12:	f0c6fbe3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b16:	00070323          	sb	zero,6(a4)
    1b1a:	0077869b          	addw	a3,a5,7
    1b1e:	f0c6f5e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b22:	000703a3          	sb	zero,7(a4)
    1b26:	0087869b          	addw	a3,a5,8
    1b2a:	eec6ffe3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b2e:	00070423          	sb	zero,8(a4)
    1b32:	0097869b          	addw	a3,a5,9
    1b36:	eec6f9e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b3a:	000704a3          	sb	zero,9(a4)
    1b3e:	00a7869b          	addw	a3,a5,10
    1b42:	eec6f3e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b46:	00070523          	sb	zero,10(a4)
    1b4a:	00b7869b          	addw	a3,a5,11
    1b4e:	ecc6fde3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b52:	000705a3          	sb	zero,11(a4)
    1b56:	00c7869b          	addw	a3,a5,12
    1b5a:	ecc6f7e3          	bgeu	a3,a2,1a28 <strncpy+0x7e>
    1b5e:	00070623          	sb	zero,12(a4)
    1b62:	27b5                	addw	a5,a5,13
    1b64:	ecc7f2e3          	bgeu	a5,a2,1a28 <strncpy+0x7e>
    1b68:	000706a3          	sb	zero,13(a4)
}
    1b6c:	8082                	ret
    1b6e:	46ad                	li	a3,11
    1b70:	bde1                	j	1a48 <strncpy+0x9e>
    1b72:	00778693          	add	a3,a5,7
    1b76:	48ad                	li	a7,11
    1b78:	fff60593          	add	a1,a2,-1
    1b7c:	ed16f6e3          	bgeu	a3,a7,1a48 <strncpy+0x9e>
    1b80:	b7fd                	j	1b6e <strncpy+0x1c4>
    1b82:	40a00733          	neg	a4,a0
    1b86:	8832                	mv	a6,a2
    1b88:	00777793          	and	a5,a4,7
    1b8c:	4581                	li	a1,0
    1b8e:	ea0608e3          	beqz	a2,1a3e <strncpy+0x94>
    1b92:	b7c5                	j	1b72 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b94:	00350693          	add	a3,a0,3
    1b98:	470d                	li	a4,3
    1b9a:	b729                	j	1aa4 <strncpy+0xfa>
    1b9c:	00150693          	add	a3,a0,1
    1ba0:	4705                	li	a4,1
    1ba2:	b709                	j	1aa4 <strncpy+0xfa>
tail:
    1ba4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ba6:	4701                	li	a4,0
    1ba8:	bdf5                	j	1aa4 <strncpy+0xfa>
    1baa:	8082                	ret
tail:
    1bac:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bae:	4781                	li	a5,0
    1bb0:	bf39                	j	1ace <strncpy+0x124>
    1bb2:	00250693          	add	a3,a0,2
    1bb6:	4709                	li	a4,2
    1bb8:	b5f5                	j	1aa4 <strncpy+0xfa>
    1bba:	00650693          	add	a3,a0,6
    1bbe:	4719                	li	a4,6
    1bc0:	b5d5                	j	1aa4 <strncpy+0xfa>
    1bc2:	8082                	ret

0000000000001bc4 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bc4:	87aa                	mv	a5,a0
    1bc6:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bc8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bcc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bd0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bd2:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bd4:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bd8:	2501                	sext.w	a0,a0
    1bda:	8082                	ret

0000000000001bdc <openat>:
    register long a7 __asm__("a7") = n;
    1bdc:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1be0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1be4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1be8:	2501                	sext.w	a0,a0
    1bea:	8082                	ret

0000000000001bec <close>:
    register long a7 __asm__("a7") = n;
    1bec:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bf0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bf4:	2501                	sext.w	a0,a0
    1bf6:	8082                	ret

0000000000001bf8 <read>:
    register long a7 __asm__("a7") = n;
    1bf8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bfc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c00:	8082                	ret

0000000000001c02 <write>:
    register long a7 __asm__("a7") = n;
    1c02:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c06:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c0a:	8082                	ret

0000000000001c0c <getpid>:
    register long a7 __asm__("a7") = n;
    1c0c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c10:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c14:	2501                	sext.w	a0,a0
    1c16:	8082                	ret

0000000000001c18 <getppid>:
    register long a7 __asm__("a7") = n;
    1c18:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c1c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c24:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c28:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <fork>:
    register long a7 __asm__("a7") = n;
    1c30:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c34:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c38:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c40:	85b2                	mv	a1,a2
    1c42:	863a                	mv	a2,a4
    if (stack)
    1c44:	c191                	beqz	a1,1c48 <clone+0x8>
	stack += stack_size;
    1c46:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c48:	4781                	li	a5,0
    1c4a:	4701                	li	a4,0
    1c4c:	4681                	li	a3,0
    1c4e:	2601                	sext.w	a2,a2
    1c50:	ac01                	j	1e60 <__clone>

0000000000001c52 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c52:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c56:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c5a:	8082                	ret

0000000000001c5c <exit>:
    register long a7 __asm__("a7") = n;
    1c5c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c60:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c64:	8082                	ret

0000000000001c66 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c66:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c6a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <exec>:
    register long a7 __asm__("a7") = n;
    1c74:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c78:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <execve>:
    register long a7 __asm__("a7") = n;
    1c80:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c84:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <times>:
    register long a7 __asm__("a7") = n;
    1c8c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c90:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <get_time>:

int64 get_time()
{
    1c98:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c9a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c9e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ca0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca2:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	ed09                	bnez	a0,1cc2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1caa:	67a2                	ld	a5,8(sp)
    1cac:	3e800713          	li	a4,1000
    1cb0:	00015503          	lhu	a0,0(sp)
    1cb4:	02e7d7b3          	divu	a5,a5,a4
    1cb8:	02e50533          	mul	a0,a0,a4
    1cbc:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cbe:	0141                	add	sp,sp,16
    1cc0:	8082                	ret
        return -1;
    1cc2:	557d                	li	a0,-1
    1cc4:	bfed                	j	1cbe <get_time+0x26>

0000000000001cc6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cc6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cca:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <time>:
    register long a7 __asm__("a7") = n;
    1cd2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cd6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <sleep>:

int sleep(unsigned long long time)
{
    1cde:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ce0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ce2:	850a                	mv	a0,sp
    1ce4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ce6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cea:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cec:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf0:	e501                	bnez	a0,1cf8 <sleep+0x1a>
    return 0;
    1cf2:	4501                	li	a0,0
}
    1cf4:	0141                	add	sp,sp,16
    1cf6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf8:	4502                	lw	a0,0(sp)
}
    1cfa:	0141                	add	sp,sp,16
    1cfc:	8082                	ret

0000000000001cfe <set_priority>:
    register long a7 __asm__("a7") = n;
    1cfe:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d0a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d0e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d12:	8082                	ret

0000000000001d14 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d14:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d18:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <munmap>:
    register long a7 __asm__("a7") = n;
    1d20:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <wait>:

int wait(int *code)
{
    1d2c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d2e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d32:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d34:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d36:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d38:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <spawn>:
    register long a7 __asm__("a7") = n;
    1d40:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d44:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <mailread>:
    register long a7 __asm__("a7") = n;
    1d4c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d58:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <fstat>:
    register long a7 __asm__("a7") = n;
    1d64:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1d70:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d72:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1d76:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d78:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d80:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d82:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d86:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d88:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d90:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d92:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d96:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d98:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <link>:

int link(char *old_path, char *new_path)
{
    1da0:	87aa                	mv	a5,a0
    1da2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1da4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1da8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dac:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dae:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1db2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1db4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <unlink>:

int unlink(char *path)
{
    1dbc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dbe:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dc2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dc6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <uname>:
    register long a7 __asm__("a7") = n;
    1dd0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dd4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <brk>:
    register long a7 __asm__("a7") = n;
    1ddc:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1de8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dee:	8082                	ret

0000000000001df0 <chdir>:
    register long a7 __asm__("a7") = n;
    1df0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dfc:	862e                	mv	a2,a1
    1dfe:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e00:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e02:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e06:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e0a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e0c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <getdents>:
    register long a7 __asm__("a7") = n;
    1e16:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <pipe>:
    register long a7 __asm__("a7") = n;
    1e22:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e26:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e28:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <dup>:
    register long a7 __asm__("a7") = n;
    1e30:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <dup2>:
    register long a7 __asm__("a7") = n;
    1e3a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e3c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <mount>:
    register long a7 __asm__("a7") = n;
    1e46:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e4a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <umount>:
    register long a7 __asm__("a7") = n;
    1e52:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e56:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e60:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e62:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e64:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e66:	8532                	mv	a0,a2
	mv a2, a4
    1e68:	863a                	mv	a2,a4
	mv a3, a5
    1e6a:	86be                	mv	a3,a5
	mv a4, a6
    1e6c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e6e:	0dc00893          	li	a7,220
	ecall
    1e72:	00000073          	ecall

	beqz a0, 1f
    1e76:	c111                	beqz	a0,1e7a <__clone+0x1a>
	# Parent
	ret
    1e78:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e7a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e7c:	6522                	ld	a0,8(sp)
	jalr a1
    1e7e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e80:	05d00893          	li	a7,93
	ecall
    1e84:	00000073          	ecall
