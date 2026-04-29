
/home/hbh/oslab/oslab/user/build/riscv64/getppid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a051                	j	1086 <__start_main>

0000000000001004 <test_getppid>:
 * 不能通过测试则输出：
 * "  getppid error."
 */

int test_getppid()
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eaa50513          	add	a0,a0,-342 # 1eb0 <__clone+0x2e>
{
    100e:	e406                	sd	ra,8(sp)
    TEST_START(__func__);
    1010:	2ce000ef          	jal	12de <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f2c50513          	add	a0,a0,-212 # 1f40 <__func__.0>
    101c:	2c2000ef          	jal	12de <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ea850513          	add	a0,a0,-344 # 1ec8 <__clone+0x46>
    1028:	2b6000ef          	jal	12de <puts>
    pid_t ppid = getppid();
    102c:	40f000ef          	jal	1c3a <getppid>
    if(ppid > 0) printf("  getppid success. ppid : %d\n", ppid);
    1030:	02a05c63          	blez	a0,1068 <test_getppid+0x64>
    1034:	85aa                	mv	a1,a0
    1036:	00001517          	auipc	a0,0x1
    103a:	ea250513          	add	a0,a0,-350 # 1ed8 <__clone+0x56>
    103e:	2c2000ef          	jal	1300 <printf>
    else printf("  getppid error.\n");
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	ece50513          	add	a0,a0,-306 # 1f10 <__clone+0x8e>
    104a:	294000ef          	jal	12de <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	ef250513          	add	a0,a0,-270 # 1f40 <__func__.0>
    1056:	288000ef          	jal	12de <puts>
}
    105a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e6c50513          	add	a0,a0,-404 # 1ec8 <__clone+0x46>
}
    1064:	0141                	add	sp,sp,16
    TEST_END(__func__);
    1066:	aca5                	j	12de <puts>
    else printf("  getppid error.\n");
    1068:	00001517          	auipc	a0,0x1
    106c:	e9050513          	add	a0,a0,-368 # 1ef8 <__clone+0x76>
    1070:	290000ef          	jal	1300 <printf>
    1074:	b7f9                	j	1042 <test_getppid+0x3e>

0000000000001076 <main>:

int main(void) {
    1076:	1141                	add	sp,sp,-16
    1078:	e406                	sd	ra,8(sp)
	test_getppid();
    107a:	f8bff0ef          	jal	1004 <test_getppid>
	return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	4501                	li	a0,0
    1082:	0141                	add	sp,sp,16
    1084:	8082                	ret

0000000000001086 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1086:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1088:	4108                	lw	a0,0(a0)
{
    108a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    108c:	05a1                	add	a1,a1,8
{
    108e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1090:	fe7ff0ef          	jal	1076 <main>
    1094:	3eb000ef          	jal	1c7e <exit>
	return 0;
}
    1098:	60a2                	ld	ra,8(sp)
    109a:	4501                	li	a0,0
    109c:	0141                	add	sp,sp,16
    109e:	8082                	ret

00000000000010a0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a0:	7179                	add	sp,sp,-48
    10a2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a4:	12054863          	bltz	a0,11d4 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10a8:	02b577bb          	remuw	a5,a0,a1
    10ac:	00001697          	auipc	a3,0x1
    10b0:	ea468693          	add	a3,a3,-348 # 1f50 <digits>
    buf[16] = 0;
    10b4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10b8:	0005871b          	sext.w	a4,a1
    10bc:	1782                	sll	a5,a5,0x20
    10be:	9381                	srl	a5,a5,0x20
    10c0:	97b6                	add	a5,a5,a3
    10c2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10c6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ca:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10ce:	1ab56663          	bltu	a0,a1,127a <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10d2:	02e8763b          	remuw	a2,a6,a4
    10d6:	1602                	sll	a2,a2,0x20
    10d8:	9201                	srl	a2,a2,0x20
    10da:	9636                	add	a2,a2,a3
    10dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10e4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10e8:	12e86c63          	bltu	a6,a4,1220 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10ec:	02e5f63b          	remuw	a2,a1,a4
    10f0:	1602                	sll	a2,a2,0x20
    10f2:	9201                	srl	a2,a2,0x20
    10f4:	9636                	add	a2,a2,a3
    10f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10fe:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1102:	12e5e863          	bltu	a1,a4,1232 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1106:	02e8763b          	remuw	a2,a6,a4
    110a:	1602                	sll	a2,a2,0x20
    110c:	9201                	srl	a2,a2,0x20
    110e:	9636                	add	a2,a2,a3
    1110:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1114:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1118:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    111c:	12e86463          	bltu	a6,a4,1244 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1120:	02e5f63b          	remuw	a2,a1,a4
    1124:	1602                	sll	a2,a2,0x20
    1126:	9201                	srl	a2,a2,0x20
    1128:	9636                	add	a2,a2,a3
    112a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1132:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1136:	12e5e063          	bltu	a1,a4,1256 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    113a:	02e8763b          	remuw	a2,a6,a4
    113e:	1602                	sll	a2,a2,0x20
    1140:	9201                	srl	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1150:	0ae86f63          	bltu	a6,a4,120e <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    116a:	0ee5ef63          	bltu	a1,a4,1268 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    116e:	02e8763b          	remuw	a2,a6,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1180:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1184:	0ee86d63          	bltu	a6,a4,127e <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    119e:	0ee5e963          	bltu	a1,a4,1290 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11a2:	1782                	sll	a5,a5,0x20
    11a4:	9381                	srl	a5,a5,0x20
    11a6:	96be                	add	a3,a3,a5
    11a8:	0006c783          	lbu	a5,0(a3)
    11ac:	4599                	li	a1,6
    11ae:	00f10723          	sb	a5,14(sp)

    if (sign)
    11b2:	00055763          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11b6:	02d00793          	li	a5,45
    11ba:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11be:	4595                	li	a1,5
    write(f, s, l);
    11c0:	003c                	add	a5,sp,8
    11c2:	4641                	li	a2,16
    11c4:	9e0d                	subw	a2,a2,a1
    11c6:	4505                	li	a0,1
    11c8:	95be                	add	a1,a1,a5
    11ca:	25b000ef          	jal	1c24 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ce:	70a2                	ld	ra,40(sp)
    11d0:	6145                	add	sp,sp,48
    11d2:	8082                	ret
        x = -xx;
    11d4:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11d8:	02b677bb          	remuw	a5,a2,a1
    11dc:	00001697          	auipc	a3,0x1
    11e0:	d7468693          	add	a3,a3,-652 # 1f50 <digits>
    buf[16] = 0;
    11e4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11e8:	0005871b          	sext.w	a4,a1
    11ec:	1782                	sll	a5,a5,0x20
    11ee:	9381                	srl	a5,a5,0x20
    11f0:	97b6                	add	a5,a5,a3
    11f2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11f6:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11fa:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11fe:	ecb67ae3          	bgeu	a2,a1,10d2 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1202:	02d00793          	li	a5,45
    1206:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    120a:	45b9                	li	a1,14
    120c:	bf55                	j	11c0 <printint.constprop.0+0x120>
    120e:	45a9                	li	a1,10
    if (sign)
    1210:	fa0558e3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1214:	02d00793          	li	a5,45
    1218:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    121c:	45a5                	li	a1,9
    121e:	b74d                	j	11c0 <printint.constprop.0+0x120>
    1220:	45b9                	li	a1,14
    if (sign)
    1222:	f8055fe3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1226:	02d00793          	li	a5,45
    122a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    122e:	45b5                	li	a1,13
    1230:	bf41                	j	11c0 <printint.constprop.0+0x120>
    1232:	45b5                	li	a1,13
    if (sign)
    1234:	f80556e3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1238:	02d00793          	li	a5,45
    123c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1240:	45b1                	li	a1,12
    1242:	bfbd                	j	11c0 <printint.constprop.0+0x120>
    1244:	45b1                	li	a1,12
    if (sign)
    1246:	f6055de3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1252:	45ad                	li	a1,11
    1254:	b7b5                	j	11c0 <printint.constprop.0+0x120>
    1256:	45ad                	li	a1,11
    if (sign)
    1258:	f60554e3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1264:	45a9                	li	a1,10
    1266:	bfa9                	j	11c0 <printint.constprop.0+0x120>
    1268:	45a5                	li	a1,9
    if (sign)
    126a:	f4055be3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1276:	45a1                	li	a1,8
    1278:	b7a1                	j	11c0 <printint.constprop.0+0x120>
    i = 15;
    127a:	45bd                	li	a1,15
    127c:	b791                	j	11c0 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    127e:	45a1                	li	a1,8
    if (sign)
    1280:	f40550e3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    128c:	459d                	li	a1,7
    128e:	bf0d                	j	11c0 <printint.constprop.0+0x120>
    1290:	459d                	li	a1,7
    if (sign)
    1292:	f20557e3          	bgez	a0,11c0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    129e:	4599                	li	a1,6
    12a0:	b705                	j	11c0 <printint.constprop.0+0x120>

00000000000012a2 <getchar>:
{
    12a2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12a4:	00f10593          	add	a1,sp,15
    12a8:	4605                	li	a2,1
    12aa:	4501                	li	a0,0
{
    12ac:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ae:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b2:	169000ef          	jal	1c1a <read>
}
    12b6:	60e2                	ld	ra,24(sp)
    12b8:	00f14503          	lbu	a0,15(sp)
    12bc:	6105                	add	sp,sp,32
    12be:	8082                	ret

00000000000012c0 <putchar>:
{
    12c0:	1101                	add	sp,sp,-32
    12c2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12c4:	00f10593          	add	a1,sp,15
    12c8:	4605                	li	a2,1
    12ca:	4505                	li	a0,1
{
    12cc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ce:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12d2:	153000ef          	jal	1c24 <write>
}
    12d6:	60e2                	ld	ra,24(sp)
    12d8:	2501                	sext.w	a0,a0
    12da:	6105                	add	sp,sp,32
    12dc:	8082                	ret

00000000000012de <puts>:
{
    12de:	1141                	add	sp,sp,-16
    12e0:	e406                	sd	ra,8(sp)
    12e2:	e022                	sd	s0,0(sp)
    12e4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12e6:	562000ef          	jal	1848 <strlen>
    12ea:	862a                	mv	a2,a0
    12ec:	85a2                	mv	a1,s0
    12ee:	4505                	li	a0,1
    12f0:	135000ef          	jal	1c24 <write>
}
    12f4:	60a2                	ld	ra,8(sp)
    12f6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12f8:	957d                	sra	a0,a0,0x3f
    return r;
    12fa:	2501                	sext.w	a0,a0
}
    12fc:	0141                	add	sp,sp,16
    12fe:	8082                	ret

0000000000001300 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1300:	7171                	add	sp,sp,-176
    1302:	f85a                	sd	s6,48(sp)
    1304:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1306:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1308:	18bc                	add	a5,sp,120
{
    130a:	e8ca                	sd	s2,80(sp)
    130c:	e4ce                	sd	s3,72(sp)
    130e:	e0d2                	sd	s4,64(sp)
    1310:	fc56                	sd	s5,56(sp)
    1312:	f486                	sd	ra,104(sp)
    1314:	f0a2                	sd	s0,96(sp)
    1316:	eca6                	sd	s1,88(sp)
    1318:	fcae                	sd	a1,120(sp)
    131a:	e132                	sd	a2,128(sp)
    131c:	e536                	sd	a3,136(sp)
    131e:	e93a                	sd	a4,144(sp)
    1320:	f142                	sd	a6,160(sp)
    1322:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1324:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1326:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    132a:	07300a13          	li	s4,115
    132e:	07800a93          	li	s5,120
    buf[i++] = '0';
    1332:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1336:	00001997          	auipc	s3,0x1
    133a:	c1a98993          	add	s3,s3,-998 # 1f50 <digits>
        if (!*s)
    133e:	00054783          	lbu	a5,0(a0)
    1342:	16078a63          	beqz	a5,14b6 <printf+0x1b6>
    1346:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1348:	19278d63          	beq	a5,s2,14e2 <printf+0x1e2>
    134c:	00164783          	lbu	a5,1(a2)
    1350:	0605                	add	a2,a2,1
    1352:	fbfd                	bnez	a5,1348 <printf+0x48>
    1354:	84b2                	mv	s1,a2
        l = z - a;
    1356:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135a:	85aa                	mv	a1,a0
    135c:	8622                	mv	a2,s0
    135e:	4505                	li	a0,1
    1360:	0c5000ef          	jal	1c24 <write>
        if (l)
    1364:	1a041463          	bnez	s0,150c <printf+0x20c>
        if (s[1] == 0)
    1368:	0014c783          	lbu	a5,1(s1)
    136c:	14078563          	beqz	a5,14b6 <printf+0x1b6>
        switch (s[1])
    1370:	1b478063          	beq	a5,s4,1510 <printf+0x210>
    1374:	14fa6b63          	bltu	s4,a5,14ca <printf+0x1ca>
    1378:	06400713          	li	a4,100
    137c:	1ee78063          	beq	a5,a4,155c <printf+0x25c>
    1380:	07000713          	li	a4,112
    1384:	1ae79963          	bne	a5,a4,1536 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1388:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    138a:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    138e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1390:	631c                	ld	a5,0(a4)
    1392:	0721                	add	a4,a4,8
    1394:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1396:	00479293          	sll	t0,a5,0x4
    139a:	00879f93          	sll	t6,a5,0x8
    139e:	00c79f13          	sll	t5,a5,0xc
    13a2:	01079e93          	sll	t4,a5,0x10
    13a6:	01479e13          	sll	t3,a5,0x14
    13aa:	01879313          	sll	t1,a5,0x18
    13ae:	01c79893          	sll	a7,a5,0x1c
    13b2:	02479813          	sll	a6,a5,0x24
    13b6:	02879513          	sll	a0,a5,0x28
    13ba:	02c79593          	sll	a1,a5,0x2c
    13be:	03079693          	sll	a3,a5,0x30
    13c2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c6:	03c7d413          	srl	s0,a5,0x3c
    13ca:	01c7d39b          	srlw	t2,a5,0x1c
    13ce:	03c2d293          	srl	t0,t0,0x3c
    13d2:	03cfdf93          	srl	t6,t6,0x3c
    13d6:	03cf5f13          	srl	t5,t5,0x3c
    13da:	03cede93          	srl	t4,t4,0x3c
    13de:	03ce5e13          	srl	t3,t3,0x3c
    13e2:	03c35313          	srl	t1,t1,0x3c
    13e6:	03c8d893          	srl	a7,a7,0x3c
    13ea:	03c85813          	srl	a6,a6,0x3c
    13ee:	9171                	srl	a0,a0,0x3c
    13f0:	91f1                	srl	a1,a1,0x3c
    13f2:	92f1                	srl	a3,a3,0x3c
    13f4:	9371                	srl	a4,a4,0x3c
    13f6:	96ce                	add	a3,a3,s3
    13f8:	974e                	add	a4,a4,s3
    13fa:	944e                	add	s0,s0,s3
    13fc:	92ce                	add	t0,t0,s3
    13fe:	9fce                	add	t6,t6,s3
    1400:	9f4e                	add	t5,t5,s3
    1402:	9ece                	add	t4,t4,s3
    1404:	9e4e                	add	t3,t3,s3
    1406:	934e                	add	t1,t1,s3
    1408:	98ce                	add	a7,a7,s3
    140a:	93ce                	add	t2,t2,s3
    140c:	984e                	add	a6,a6,s3
    140e:	954e                	add	a0,a0,s3
    1410:	95ce                	add	a1,a1,s3
    1412:	0006c083          	lbu	ra,0(a3)
    1416:	0002c283          	lbu	t0,0(t0)
    141a:	00074683          	lbu	a3,0(a4)
    141e:	000fcf83          	lbu	t6,0(t6)
    1422:	000f4f03          	lbu	t5,0(t5)
    1426:	000ece83          	lbu	t4,0(t4)
    142a:	000e4e03          	lbu	t3,0(t3)
    142e:	00034303          	lbu	t1,0(t1)
    1432:	0008c883          	lbu	a7,0(a7)
    1436:	0003c383          	lbu	t2,0(t2)
    143a:	00084803          	lbu	a6,0(a6)
    143e:	00054503          	lbu	a0,0(a0)
    1442:	0005c583          	lbu	a1,0(a1)
    1446:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    144a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144e:	9371                	srl	a4,a4,0x3c
    1450:	8bbd                	and	a5,a5,15
    1452:	974e                	add	a4,a4,s3
    1454:	97ce                	add	a5,a5,s3
    1456:	005105a3          	sb	t0,11(sp)
    145a:	01f10623          	sb	t6,12(sp)
    145e:	01e106a3          	sb	t5,13(sp)
    1462:	01d10723          	sb	t4,14(sp)
    1466:	01c107a3          	sb	t3,15(sp)
    146a:	00610823          	sb	t1,16(sp)
    146e:	011108a3          	sb	a7,17(sp)
    1472:	00710923          	sb	t2,18(sp)
    1476:	010109a3          	sb	a6,19(sp)
    147a:	00a10a23          	sb	a0,20(sp)
    147e:	00b10aa3          	sb	a1,21(sp)
    1482:	00110b23          	sb	ra,22(sp)
    1486:	00d10ba3          	sb	a3,23(sp)
    148a:	00810523          	sb	s0,10(sp)
    148e:	00074703          	lbu	a4,0(a4)
    1492:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1496:	002c                	add	a1,sp,8
    1498:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149a:	00e10c23          	sb	a4,24(sp)
    149e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14a2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14a6:	77e000ef          	jal	1c24 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14aa:	00248513          	add	a0,s1,2
        if (!*s)
    14ae:	00054783          	lbu	a5,0(a0)
    14b2:	e8079ae3          	bnez	a5,1346 <printf+0x46>
    }
    va_end(ap);
}
    14b6:	70a6                	ld	ra,104(sp)
    14b8:	7406                	ld	s0,96(sp)
    14ba:	64e6                	ld	s1,88(sp)
    14bc:	6946                	ld	s2,80(sp)
    14be:	69a6                	ld	s3,72(sp)
    14c0:	6a06                	ld	s4,64(sp)
    14c2:	7ae2                	ld	s5,56(sp)
    14c4:	7b42                	ld	s6,48(sp)
    14c6:	614d                	add	sp,sp,176
    14c8:	8082                	ret
        switch (s[1])
    14ca:	07579663          	bne	a5,s5,1536 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14ce:	6782                	ld	a5,0(sp)
    14d0:	45c1                	li	a1,16
    14d2:	4388                	lw	a0,0(a5)
    14d4:	07a1                	add	a5,a5,8
    14d6:	e03e                	sd	a5,0(sp)
    14d8:	bc9ff0ef          	jal	10a0 <printint.constprop.0>
        s += 2;
    14dc:	00248513          	add	a0,s1,2
    14e0:	b7f9                	j	14ae <printf+0x1ae>
    14e2:	84b2                	mv	s1,a2
    14e4:	a039                	j	14f2 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e6:	0024c783          	lbu	a5,2(s1)
    14ea:	0605                	add	a2,a2,1
    14ec:	0489                	add	s1,s1,2
    14ee:	e72794e3          	bne	a5,s2,1356 <printf+0x56>
    14f2:	0014c783          	lbu	a5,1(s1)
    14f6:	ff2788e3          	beq	a5,s2,14e6 <printf+0x1e6>
        l = z - a;
    14fa:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14fe:	85aa                	mv	a1,a0
    1500:	8622                	mv	a2,s0
    1502:	4505                	li	a0,1
    1504:	720000ef          	jal	1c24 <write>
        if (l)
    1508:	e60400e3          	beqz	s0,1368 <printf+0x68>
    150c:	8526                	mv	a0,s1
    150e:	bd05                	j	133e <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1510:	6782                	ld	a5,0(sp)
    1512:	6380                	ld	s0,0(a5)
    1514:	07a1                	add	a5,a5,8
    1516:	e03e                	sd	a5,0(sp)
    1518:	cc21                	beqz	s0,1570 <printf+0x270>
            l = strnlen(a, 200);
    151a:	0c800593          	li	a1,200
    151e:	8522                	mv	a0,s0
    1520:	412000ef          	jal	1932 <strnlen>
    write(f, s, l);
    1524:	0005061b          	sext.w	a2,a0
    1528:	85a2                	mv	a1,s0
    152a:	4505                	li	a0,1
    152c:	6f8000ef          	jal	1c24 <write>
        s += 2;
    1530:	00248513          	add	a0,s1,2
    1534:	bfad                	j	14ae <printf+0x1ae>
    return write(stdout, &byte, 1);
    1536:	4605                	li	a2,1
    1538:	002c                	add	a1,sp,8
    153a:	4505                	li	a0,1
    char byte = c;
    153c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1540:	6e4000ef          	jal	1c24 <write>
    char byte = c;
    1544:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1548:	4605                	li	a2,1
    154a:	002c                	add	a1,sp,8
    154c:	4505                	li	a0,1
    char byte = c;
    154e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1552:	6d2000ef          	jal	1c24 <write>
        s += 2;
    1556:	00248513          	add	a0,s1,2
    155a:	bf91                	j	14ae <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    155c:	6782                	ld	a5,0(sp)
    155e:	45a9                	li	a1,10
    1560:	4388                	lw	a0,0(a5)
    1562:	07a1                	add	a5,a5,8
    1564:	e03e                	sd	a5,0(sp)
    1566:	b3bff0ef          	jal	10a0 <printint.constprop.0>
        s += 2;
    156a:	00248513          	add	a0,s1,2
    156e:	b781                	j	14ae <printf+0x1ae>
                a = "(null)";
    1570:	00001417          	auipc	s0,0x1
    1574:	9b040413          	add	s0,s0,-1616 # 1f20 <__clone+0x9e>
    1578:	b74d                	j	151a <printf+0x21a>

000000000000157a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    157a:	02000793          	li	a5,32
    157e:	00f50663          	beq	a0,a5,158a <isspace+0x10>
    1582:	355d                	addw	a0,a0,-9
    1584:	00553513          	sltiu	a0,a0,5
    1588:	8082                	ret
    158a:	4505                	li	a0,1
}
    158c:	8082                	ret

000000000000158e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    158e:	fd05051b          	addw	a0,a0,-48
}
    1592:	00a53513          	sltiu	a0,a0,10
    1596:	8082                	ret

0000000000001598 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1598:	02000693          	li	a3,32
    159c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    159e:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	ff77871b          	addw	a4,a5,-9
    15a6:	04d78c63          	beq	a5,a3,15fe <atoi+0x66>
    15aa:	0007861b          	sext.w	a2,a5
    15ae:	04e5f863          	bgeu	a1,a4,15fe <atoi+0x66>
        s++;
    switch (*s)
    15b2:	02b00713          	li	a4,43
    15b6:	04e78963          	beq	a5,a4,1608 <atoi+0x70>
    15ba:	02d00713          	li	a4,45
    15be:	06e78263          	beq	a5,a4,1622 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c2:	fd06069b          	addw	a3,a2,-48
    15c6:	47a5                	li	a5,9
    15c8:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15ca:	4301                	li	t1,0
    while (isdigit(*s))
    15cc:	04d7e963          	bltu	a5,a3,161e <atoi+0x86>
    int n = 0, neg = 0;
    15d0:	4501                	li	a0,0
    while (isdigit(*s))
    15d2:	48a5                	li	a7,9
    15d4:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15d8:	0025179b          	sllw	a5,a0,0x2
    15dc:	9fa9                	addw	a5,a5,a0
    15de:	fd06059b          	addw	a1,a2,-48
    15e2:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    15e6:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    15ea:	0705                	add	a4,a4,1
    15ec:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    15f0:	0006861b          	sext.w	a2,a3
    15f4:	ff08f0e3          	bgeu	a7,a6,15d4 <atoi+0x3c>
    return neg ? n : -n;
    15f8:	00030563          	beqz	t1,1602 <atoi+0x6a>
}
    15fc:	8082                	ret
        s++;
    15fe:	0505                	add	a0,a0,1
    1600:	bf79                	j	159e <atoi+0x6>
    return neg ? n : -n;
    1602:	40f5853b          	subw	a0,a1,a5
    1606:	8082                	ret
    while (isdigit(*s))
    1608:	00154603          	lbu	a2,1(a0)
    160c:	47a5                	li	a5,9
        s++;
    160e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1612:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1616:	4301                	li	t1,0
    while (isdigit(*s))
    1618:	2601                	sext.w	a2,a2
    161a:	fad7fbe3          	bgeu	a5,a3,15d0 <atoi+0x38>
    161e:	4501                	li	a0,0
}
    1620:	8082                	ret
    while (isdigit(*s))
    1622:	00154603          	lbu	a2,1(a0)
    1626:	47a5                	li	a5,9
        s++;
    1628:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    162c:	fd06069b          	addw	a3,a2,-48
    1630:	2601                	sext.w	a2,a2
    1632:	fed7e6e3          	bltu	a5,a3,161e <atoi+0x86>
        neg = 1;
    1636:	4305                	li	t1,1
    1638:	bf61                	j	15d0 <atoi+0x38>

000000000000163a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    163a:	18060163          	beqz	a2,17bc <memset+0x182>
    163e:	40a006b3          	neg	a3,a0
    1642:	0076f793          	and	a5,a3,7
    1646:	00778813          	add	a6,a5,7
    164a:	48ad                	li	a7,11
    164c:	0ff5f713          	zext.b	a4,a1
    1650:	fff60593          	add	a1,a2,-1
    1654:	17186563          	bltu	a6,a7,17be <memset+0x184>
    1658:	1705ed63          	bltu	a1,a6,17d2 <memset+0x198>
    165c:	16078363          	beqz	a5,17c2 <memset+0x188>
    1660:	00e50023          	sb	a4,0(a0)
    1664:	0066f593          	and	a1,a3,6
    1668:	16058063          	beqz	a1,17c8 <memset+0x18e>
    166c:	00e500a3          	sb	a4,1(a0)
    1670:	4589                	li	a1,2
    1672:	16f5f363          	bgeu	a1,a5,17d8 <memset+0x19e>
    1676:	00e50123          	sb	a4,2(a0)
    167a:	8a91                	and	a3,a3,4
    167c:	00350593          	add	a1,a0,3
    1680:	4e0d                	li	t3,3
    1682:	ce9d                	beqz	a3,16c0 <memset+0x86>
    1684:	00e501a3          	sb	a4,3(a0)
    1688:	4691                	li	a3,4
    168a:	00450593          	add	a1,a0,4
    168e:	4e11                	li	t3,4
    1690:	02f6f863          	bgeu	a3,a5,16c0 <memset+0x86>
    1694:	00e50223          	sb	a4,4(a0)
    1698:	4695                	li	a3,5
    169a:	00550593          	add	a1,a0,5
    169e:	4e15                	li	t3,5
    16a0:	02d78063          	beq	a5,a3,16c0 <memset+0x86>
    16a4:	fff50693          	add	a3,a0,-1
    16a8:	00e502a3          	sb	a4,5(a0)
    16ac:	8a9d                	and	a3,a3,7
    16ae:	00650593          	add	a1,a0,6
    16b2:	4e19                	li	t3,6
    16b4:	e691                	bnez	a3,16c0 <memset+0x86>
    16b6:	00750593          	add	a1,a0,7
    16ba:	00e50323          	sb	a4,6(a0)
    16be:	4e1d                	li	t3,7
    16c0:	00871693          	sll	a3,a4,0x8
    16c4:	01071813          	sll	a6,a4,0x10
    16c8:	8ed9                	or	a3,a3,a4
    16ca:	01871893          	sll	a7,a4,0x18
    16ce:	0106e6b3          	or	a3,a3,a6
    16d2:	0116e6b3          	or	a3,a3,a7
    16d6:	02071813          	sll	a6,a4,0x20
    16da:	02871313          	sll	t1,a4,0x28
    16de:	0106e6b3          	or	a3,a3,a6
    16e2:	40f608b3          	sub	a7,a2,a5
    16e6:	03071813          	sll	a6,a4,0x30
    16ea:	0066e6b3          	or	a3,a3,t1
    16ee:	0106e6b3          	or	a3,a3,a6
    16f2:	03871313          	sll	t1,a4,0x38
    16f6:	97aa                	add	a5,a5,a0
    16f8:	ff88f813          	and	a6,a7,-8
    16fc:	0066e6b3          	or	a3,a3,t1
    1700:	983e                	add	a6,a6,a5
    1702:	e394                	sd	a3,0(a5)
    1704:	07a1                	add	a5,a5,8
    1706:	ff079ee3          	bne	a5,a6,1702 <memset+0xc8>
    170a:	ff88f793          	and	a5,a7,-8
    170e:	0078f893          	and	a7,a7,7
    1712:	00f586b3          	add	a3,a1,a5
    1716:	01c787bb          	addw	a5,a5,t3
    171a:	0a088b63          	beqz	a7,17d0 <memset+0x196>
    171e:	00e68023          	sb	a4,0(a3)
    1722:	0017859b          	addw	a1,a5,1
    1726:	08c5fb63          	bgeu	a1,a2,17bc <memset+0x182>
    172a:	00e680a3          	sb	a4,1(a3)
    172e:	0027859b          	addw	a1,a5,2
    1732:	08c5f563          	bgeu	a1,a2,17bc <memset+0x182>
    1736:	00e68123          	sb	a4,2(a3)
    173a:	0037859b          	addw	a1,a5,3
    173e:	06c5ff63          	bgeu	a1,a2,17bc <memset+0x182>
    1742:	00e681a3          	sb	a4,3(a3)
    1746:	0047859b          	addw	a1,a5,4
    174a:	06c5f963          	bgeu	a1,a2,17bc <memset+0x182>
    174e:	00e68223          	sb	a4,4(a3)
    1752:	0057859b          	addw	a1,a5,5
    1756:	06c5f363          	bgeu	a1,a2,17bc <memset+0x182>
    175a:	00e682a3          	sb	a4,5(a3)
    175e:	0067859b          	addw	a1,a5,6
    1762:	04c5fd63          	bgeu	a1,a2,17bc <memset+0x182>
    1766:	00e68323          	sb	a4,6(a3)
    176a:	0077859b          	addw	a1,a5,7
    176e:	04c5f763          	bgeu	a1,a2,17bc <memset+0x182>
    1772:	00e683a3          	sb	a4,7(a3)
    1776:	0087859b          	addw	a1,a5,8
    177a:	04c5f163          	bgeu	a1,a2,17bc <memset+0x182>
    177e:	00e68423          	sb	a4,8(a3)
    1782:	0097859b          	addw	a1,a5,9
    1786:	02c5fb63          	bgeu	a1,a2,17bc <memset+0x182>
    178a:	00e684a3          	sb	a4,9(a3)
    178e:	00a7859b          	addw	a1,a5,10
    1792:	02c5f563          	bgeu	a1,a2,17bc <memset+0x182>
    1796:	00e68523          	sb	a4,10(a3)
    179a:	00b7859b          	addw	a1,a5,11
    179e:	00c5ff63          	bgeu	a1,a2,17bc <memset+0x182>
    17a2:	00e685a3          	sb	a4,11(a3)
    17a6:	00c7859b          	addw	a1,a5,12
    17aa:	00c5f963          	bgeu	a1,a2,17bc <memset+0x182>
    17ae:	00e68623          	sb	a4,12(a3)
    17b2:	27b5                	addw	a5,a5,13
    17b4:	00c7f463          	bgeu	a5,a2,17bc <memset+0x182>
    17b8:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17bc:	8082                	ret
    17be:	482d                	li	a6,11
    17c0:	bd61                	j	1658 <memset+0x1e>
    char *p = dest;
    17c2:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c4:	4e01                	li	t3,0
    17c6:	bded                	j	16c0 <memset+0x86>
    17c8:	00150593          	add	a1,a0,1
    17cc:	4e05                	li	t3,1
    17ce:	bdcd                	j	16c0 <memset+0x86>
    17d0:	8082                	ret
    char *p = dest;
    17d2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d4:	4781                	li	a5,0
    17d6:	b7a1                	j	171e <memset+0xe4>
    17d8:	00250593          	add	a1,a0,2
    17dc:	4e09                	li	t3,2
    17de:	b5cd                	j	16c0 <memset+0x86>

00000000000017e0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e0:	00054783          	lbu	a5,0(a0)
    17e4:	0005c703          	lbu	a4,0(a1)
    17e8:	00e79863          	bne	a5,a4,17f8 <strcmp+0x18>
    17ec:	0505                	add	a0,a0,1
    17ee:	0585                	add	a1,a1,1
    17f0:	fbe5                	bnez	a5,17e0 <strcmp>
    17f2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17f4:	9d19                	subw	a0,a0,a4
    17f6:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17f8:	0007851b          	sext.w	a0,a5
    17fc:	bfe5                	j	17f4 <strcmp+0x14>

00000000000017fe <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17fe:	ca15                	beqz	a2,1832 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1800:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1804:	167d                	add	a2,a2,-1
    1806:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180a:	eb99                	bnez	a5,1820 <strncmp+0x22>
    180c:	a815                	j	1840 <strncmp+0x42>
    180e:	00a68e63          	beq	a3,a0,182a <strncmp+0x2c>
    1812:	0505                	add	a0,a0,1
    1814:	00f71b63          	bne	a4,a5,182a <strncmp+0x2c>
    1818:	00054783          	lbu	a5,0(a0)
    181c:	cf89                	beqz	a5,1836 <strncmp+0x38>
    181e:	85b2                	mv	a1,a2
    1820:	0005c703          	lbu	a4,0(a1)
    1824:	00158613          	add	a2,a1,1
    1828:	f37d                	bnez	a4,180e <strncmp+0x10>
        ;
    return *l - *r;
    182a:	0007851b          	sext.w	a0,a5
    182e:	9d19                	subw	a0,a0,a4
    1830:	8082                	ret
        return 0;
    1832:	4501                	li	a0,0
}
    1834:	8082                	ret
    return *l - *r;
    1836:	0015c703          	lbu	a4,1(a1)
    183a:	4501                	li	a0,0
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
    1840:	0005c703          	lbu	a4,0(a1)
    1844:	4501                	li	a0,0
    1846:	b7e5                	j	182e <strncmp+0x30>

0000000000001848 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1848:	00757793          	and	a5,a0,7
    184c:	cf89                	beqz	a5,1866 <strlen+0x1e>
    184e:	87aa                	mv	a5,a0
    1850:	a029                	j	185a <strlen+0x12>
    1852:	0785                	add	a5,a5,1
    1854:	0077f713          	and	a4,a5,7
    1858:	cb01                	beqz	a4,1868 <strlen+0x20>
        if (!*s)
    185a:	0007c703          	lbu	a4,0(a5)
    185e:	fb75                	bnez	a4,1852 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1860:	40a78533          	sub	a0,a5,a0
}
    1864:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1866:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1868:	6394                	ld	a3,0(a5)
    186a:	00000597          	auipc	a1,0x0
    186e:	6be5b583          	ld	a1,1726(a1) # 1f28 <__clone+0xa6>
    1872:	00000617          	auipc	a2,0x0
    1876:	6be63603          	ld	a2,1726(a2) # 1f30 <__clone+0xae>
    187a:	a019                	j	1880 <strlen+0x38>
    187c:	6794                	ld	a3,8(a5)
    187e:	07a1                	add	a5,a5,8
    1880:	00b68733          	add	a4,a3,a1
    1884:	fff6c693          	not	a3,a3
    1888:	8f75                	and	a4,a4,a3
    188a:	8f71                	and	a4,a4,a2
    188c:	db65                	beqz	a4,187c <strlen+0x34>
    for (; *s; s++)
    188e:	0007c703          	lbu	a4,0(a5)
    1892:	d779                	beqz	a4,1860 <strlen+0x18>
    1894:	0017c703          	lbu	a4,1(a5)
    1898:	0785                	add	a5,a5,1
    189a:	d379                	beqz	a4,1860 <strlen+0x18>
    189c:	0017c703          	lbu	a4,1(a5)
    18a0:	0785                	add	a5,a5,1
    18a2:	fb6d                	bnez	a4,1894 <strlen+0x4c>
    18a4:	bf75                	j	1860 <strlen+0x18>

00000000000018a6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a6:	00757713          	and	a4,a0,7
{
    18aa:	87aa                	mv	a5,a0
    18ac:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b0:	cb19                	beqz	a4,18c6 <memchr+0x20>
    18b2:	ce25                	beqz	a2,192a <memchr+0x84>
    18b4:	0007c703          	lbu	a4,0(a5)
    18b8:	00b70763          	beq	a4,a1,18c6 <memchr+0x20>
    18bc:	0785                	add	a5,a5,1
    18be:	0077f713          	and	a4,a5,7
    18c2:	167d                	add	a2,a2,-1
    18c4:	f77d                	bnez	a4,18b2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18c6:	4501                	li	a0,0
    if (n && *s != c)
    18c8:	c235                	beqz	a2,192c <memchr+0x86>
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	06b70063          	beq	a4,a1,192e <memchr+0x88>
        size_t k = ONES * c;
    18d2:	00000517          	auipc	a0,0x0
    18d6:	66653503          	ld	a0,1638(a0) # 1f38 <__clone+0xb6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18da:	471d                	li	a4,7
        size_t k = ONES * c;
    18dc:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e0:	04c77763          	bgeu	a4,a2,192e <memchr+0x88>
    18e4:	00000897          	auipc	a7,0x0
    18e8:	6448b883          	ld	a7,1604(a7) # 1f28 <__clone+0xa6>
    18ec:	00000817          	auipc	a6,0x0
    18f0:	64483803          	ld	a6,1604(a6) # 1f30 <__clone+0xae>
    18f4:	431d                	li	t1,7
    18f6:	a029                	j	1900 <memchr+0x5a>
    18f8:	1661                	add	a2,a2,-8
    18fa:	07a1                	add	a5,a5,8
    18fc:	00c37c63          	bgeu	t1,a2,1914 <memchr+0x6e>
    1900:	6398                	ld	a4,0(a5)
    1902:	8f29                	xor	a4,a4,a0
    1904:	011706b3          	add	a3,a4,a7
    1908:	fff74713          	not	a4,a4
    190c:	8f75                	and	a4,a4,a3
    190e:	01077733          	and	a4,a4,a6
    1912:	d37d                	beqz	a4,18f8 <memchr+0x52>
    1914:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1916:	e601                	bnez	a2,191e <memchr+0x78>
    1918:	a809                	j	192a <memchr+0x84>
    191a:	0505                	add	a0,a0,1
    191c:	c619                	beqz	a2,192a <memchr+0x84>
    191e:	00054783          	lbu	a5,0(a0)
    1922:	167d                	add	a2,a2,-1
    1924:	feb79be3          	bne	a5,a1,191a <memchr+0x74>
    1928:	8082                	ret
    return n ? (void *)s : 0;
    192a:	4501                	li	a0,0
}
    192c:	8082                	ret
    if (n && *s != c)
    192e:	853e                	mv	a0,a5
    1930:	b7fd                	j	191e <memchr+0x78>

0000000000001932 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1932:	1101                	add	sp,sp,-32
    1934:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1936:	862e                	mv	a2,a1
{
    1938:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    193a:	4581                	li	a1,0
{
    193c:	e426                	sd	s1,8(sp)
    193e:	ec06                	sd	ra,24(sp)
    1940:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1942:	f65ff0ef          	jal	18a6 <memchr>
    return p ? p - s : n;
    1946:	c519                	beqz	a0,1954 <strnlen+0x22>
}
    1948:	60e2                	ld	ra,24(sp)
    194a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    194c:	8d05                	sub	a0,a0,s1
}
    194e:	64a2                	ld	s1,8(sp)
    1950:	6105                	add	sp,sp,32
    1952:	8082                	ret
    1954:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1956:	8522                	mv	a0,s0
}
    1958:	6442                	ld	s0,16(sp)
    195a:	64a2                	ld	s1,8(sp)
    195c:	6105                	add	sp,sp,32
    195e:	8082                	ret

0000000000001960 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1960:	00a5c7b3          	xor	a5,a1,a0
    1964:	8b9d                	and	a5,a5,7
    1966:	eb95                	bnez	a5,199a <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1968:	0075f793          	and	a5,a1,7
    196c:	e7b1                	bnez	a5,19b8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    196e:	6198                	ld	a4,0(a1)
    1970:	00000617          	auipc	a2,0x0
    1974:	5b863603          	ld	a2,1464(a2) # 1f28 <__clone+0xa6>
    1978:	00000817          	auipc	a6,0x0
    197c:	5b883803          	ld	a6,1464(a6) # 1f30 <__clone+0xae>
    1980:	a029                	j	198a <strcpy+0x2a>
    1982:	05a1                	add	a1,a1,8
    1984:	e118                	sd	a4,0(a0)
    1986:	6198                	ld	a4,0(a1)
    1988:	0521                	add	a0,a0,8
    198a:	00c707b3          	add	a5,a4,a2
    198e:	fff74693          	not	a3,a4
    1992:	8ff5                	and	a5,a5,a3
    1994:	0107f7b3          	and	a5,a5,a6
    1998:	d7ed                	beqz	a5,1982 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    199a:	0005c783          	lbu	a5,0(a1)
    199e:	00f50023          	sb	a5,0(a0)
    19a2:	c785                	beqz	a5,19ca <strcpy+0x6a>
    19a4:	0015c783          	lbu	a5,1(a1)
    19a8:	0505                	add	a0,a0,1
    19aa:	0585                	add	a1,a1,1
    19ac:	00f50023          	sb	a5,0(a0)
    19b0:	fbf5                	bnez	a5,19a4 <strcpy+0x44>
        ;
    return d;
}
    19b2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19b4:	0505                	add	a0,a0,1
    19b6:	df45                	beqz	a4,196e <strcpy+0xe>
            if (!(*d = *s))
    19b8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19bc:	0585                	add	a1,a1,1
    19be:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19c2:	00f50023          	sb	a5,0(a0)
    19c6:	f7fd                	bnez	a5,19b4 <strcpy+0x54>
}
    19c8:	8082                	ret
    19ca:	8082                	ret

00000000000019cc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19cc:	00a5c7b3          	xor	a5,a1,a0
    19d0:	8b9d                	and	a5,a5,7
    19d2:	e3b5                	bnez	a5,1a36 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19d4:	0075f793          	and	a5,a1,7
    19d8:	cf99                	beqz	a5,19f6 <strncpy+0x2a>
    19da:	ea09                	bnez	a2,19ec <strncpy+0x20>
    19dc:	a421                	j	1be4 <strncpy+0x218>
    19de:	0585                	add	a1,a1,1
    19e0:	0075f793          	and	a5,a1,7
    19e4:	167d                	add	a2,a2,-1
    19e6:	0505                	add	a0,a0,1
    19e8:	c799                	beqz	a5,19f6 <strncpy+0x2a>
    19ea:	c225                	beqz	a2,1a4a <strncpy+0x7e>
    19ec:	0005c783          	lbu	a5,0(a1)
    19f0:	00f50023          	sb	a5,0(a0)
    19f4:	f7ed                	bnez	a5,19de <strncpy+0x12>
            ;
        if (!n || !*s)
    19f6:	ca31                	beqz	a2,1a4a <strncpy+0x7e>
    19f8:	0005c783          	lbu	a5,0(a1)
    19fc:	cba1                	beqz	a5,1a4c <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    19fe:	479d                	li	a5,7
    1a00:	02c7fc63          	bgeu	a5,a2,1a38 <strncpy+0x6c>
    1a04:	00000897          	auipc	a7,0x0
    1a08:	5248b883          	ld	a7,1316(a7) # 1f28 <__clone+0xa6>
    1a0c:	00000817          	auipc	a6,0x0
    1a10:	52483803          	ld	a6,1316(a6) # 1f30 <__clone+0xae>
    1a14:	431d                	li	t1,7
    1a16:	a039                	j	1a24 <strncpy+0x58>
            *wd = *ws;
    1a18:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a1a:	1661                	add	a2,a2,-8
    1a1c:	05a1                	add	a1,a1,8
    1a1e:	0521                	add	a0,a0,8
    1a20:	00c37b63          	bgeu	t1,a2,1a36 <strncpy+0x6a>
    1a24:	6198                	ld	a4,0(a1)
    1a26:	011707b3          	add	a5,a4,a7
    1a2a:	fff74693          	not	a3,a4
    1a2e:	8ff5                	and	a5,a5,a3
    1a30:	0107f7b3          	and	a5,a5,a6
    1a34:	d3f5                	beqz	a5,1a18 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a36:	ca11                	beqz	a2,1a4a <strncpy+0x7e>
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	0585                	add	a1,a1,1
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	c789                	beqz	a5,1a4c <strncpy+0x80>
    1a44:	167d                	add	a2,a2,-1
    1a46:	0505                	add	a0,a0,1
    1a48:	fa65                	bnez	a2,1a38 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a4a:	8082                	ret
    1a4c:	4805                	li	a6,1
    1a4e:	14061b63          	bnez	a2,1ba4 <strncpy+0x1d8>
    1a52:	40a00733          	neg	a4,a0
    1a56:	00777793          	and	a5,a4,7
    1a5a:	4581                	li	a1,0
    1a5c:	12061c63          	bnez	a2,1b94 <strncpy+0x1c8>
    1a60:	00778693          	add	a3,a5,7
    1a64:	48ad                	li	a7,11
    1a66:	1316e563          	bltu	a3,a7,1b90 <strncpy+0x1c4>
    1a6a:	16d5e263          	bltu	a1,a3,1bce <strncpy+0x202>
    1a6e:	14078c63          	beqz	a5,1bc6 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a72:	00050023          	sb	zero,0(a0)
    1a76:	00677693          	and	a3,a4,6
    1a7a:	14068263          	beqz	a3,1bbe <strncpy+0x1f2>
    1a7e:	000500a3          	sb	zero,1(a0)
    1a82:	4689                	li	a3,2
    1a84:	14f6f863          	bgeu	a3,a5,1bd4 <strncpy+0x208>
    1a88:	00050123          	sb	zero,2(a0)
    1a8c:	8b11                	and	a4,a4,4
    1a8e:	12070463          	beqz	a4,1bb6 <strncpy+0x1ea>
    1a92:	000501a3          	sb	zero,3(a0)
    1a96:	4711                	li	a4,4
    1a98:	00450693          	add	a3,a0,4
    1a9c:	02f77563          	bgeu	a4,a5,1ac6 <strncpy+0xfa>
    1aa0:	00050223          	sb	zero,4(a0)
    1aa4:	4715                	li	a4,5
    1aa6:	00550693          	add	a3,a0,5
    1aaa:	00e78e63          	beq	a5,a4,1ac6 <strncpy+0xfa>
    1aae:	fff50713          	add	a4,a0,-1
    1ab2:	000502a3          	sb	zero,5(a0)
    1ab6:	8b1d                	and	a4,a4,7
    1ab8:	12071263          	bnez	a4,1bdc <strncpy+0x210>
    1abc:	00750693          	add	a3,a0,7
    1ac0:	00050323          	sb	zero,6(a0)
    1ac4:	471d                	li	a4,7
    1ac6:	40f80833          	sub	a6,a6,a5
    1aca:	ff887593          	and	a1,a6,-8
    1ace:	97aa                	add	a5,a5,a0
    1ad0:	95be                	add	a1,a1,a5
    1ad2:	0007b023          	sd	zero,0(a5)
    1ad6:	07a1                	add	a5,a5,8
    1ad8:	feb79de3          	bne	a5,a1,1ad2 <strncpy+0x106>
    1adc:	ff887593          	and	a1,a6,-8
    1ae0:	00787813          	and	a6,a6,7
    1ae4:	00e587bb          	addw	a5,a1,a4
    1ae8:	00b68733          	add	a4,a3,a1
    1aec:	0e080063          	beqz	a6,1bcc <strncpy+0x200>
    1af0:	00070023          	sb	zero,0(a4)
    1af4:	0017869b          	addw	a3,a5,1
    1af8:	f4c6f9e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1afc:	000700a3          	sb	zero,1(a4)
    1b00:	0027869b          	addw	a3,a5,2
    1b04:	f4c6f3e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b08:	00070123          	sb	zero,2(a4)
    1b0c:	0037869b          	addw	a3,a5,3
    1b10:	f2c6fde3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b14:	000701a3          	sb	zero,3(a4)
    1b18:	0047869b          	addw	a3,a5,4
    1b1c:	f2c6f7e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b20:	00070223          	sb	zero,4(a4)
    1b24:	0057869b          	addw	a3,a5,5
    1b28:	f2c6f1e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b2c:	000702a3          	sb	zero,5(a4)
    1b30:	0067869b          	addw	a3,a5,6
    1b34:	f0c6fbe3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b38:	00070323          	sb	zero,6(a4)
    1b3c:	0077869b          	addw	a3,a5,7
    1b40:	f0c6f5e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b44:	000703a3          	sb	zero,7(a4)
    1b48:	0087869b          	addw	a3,a5,8
    1b4c:	eec6ffe3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b50:	00070423          	sb	zero,8(a4)
    1b54:	0097869b          	addw	a3,a5,9
    1b58:	eec6f9e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b5c:	000704a3          	sb	zero,9(a4)
    1b60:	00a7869b          	addw	a3,a5,10
    1b64:	eec6f3e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b68:	00070523          	sb	zero,10(a4)
    1b6c:	00b7869b          	addw	a3,a5,11
    1b70:	ecc6fde3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b74:	000705a3          	sb	zero,11(a4)
    1b78:	00c7869b          	addw	a3,a5,12
    1b7c:	ecc6f7e3          	bgeu	a3,a2,1a4a <strncpy+0x7e>
    1b80:	00070623          	sb	zero,12(a4)
    1b84:	27b5                	addw	a5,a5,13
    1b86:	ecc7f2e3          	bgeu	a5,a2,1a4a <strncpy+0x7e>
    1b8a:	000706a3          	sb	zero,13(a4)
}
    1b8e:	8082                	ret
    1b90:	46ad                	li	a3,11
    1b92:	bde1                	j	1a6a <strncpy+0x9e>
    1b94:	00778693          	add	a3,a5,7
    1b98:	48ad                	li	a7,11
    1b9a:	fff60593          	add	a1,a2,-1
    1b9e:	ed16f6e3          	bgeu	a3,a7,1a6a <strncpy+0x9e>
    1ba2:	b7fd                	j	1b90 <strncpy+0x1c4>
    1ba4:	40a00733          	neg	a4,a0
    1ba8:	8832                	mv	a6,a2
    1baa:	00777793          	and	a5,a4,7
    1bae:	4581                	li	a1,0
    1bb0:	ea0608e3          	beqz	a2,1a60 <strncpy+0x94>
    1bb4:	b7c5                	j	1b94 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb6:	00350693          	add	a3,a0,3
    1bba:	470d                	li	a4,3
    1bbc:	b729                	j	1ac6 <strncpy+0xfa>
    1bbe:	00150693          	add	a3,a0,1
    1bc2:	4705                	li	a4,1
    1bc4:	b709                	j	1ac6 <strncpy+0xfa>
tail:
    1bc6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc8:	4701                	li	a4,0
    1bca:	bdf5                	j	1ac6 <strncpy+0xfa>
    1bcc:	8082                	ret
tail:
    1bce:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd0:	4781                	li	a5,0
    1bd2:	bf39                	j	1af0 <strncpy+0x124>
    1bd4:	00250693          	add	a3,a0,2
    1bd8:	4709                	li	a4,2
    1bda:	b5f5                	j	1ac6 <strncpy+0xfa>
    1bdc:	00650693          	add	a3,a0,6
    1be0:	4719                	li	a4,6
    1be2:	b5d5                	j	1ac6 <strncpy+0xfa>
    1be4:	8082                	ret

0000000000001be6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1be6:	87aa                	mv	a5,a0
    1be8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bea:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bee:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bf2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bf4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bfa:	2501                	sext.w	a0,a0
    1bfc:	8082                	ret

0000000000001bfe <openat>:
    register long a7 __asm__("a7") = n;
    1bfe:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c02:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c06:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c0a:	2501                	sext.w	a0,a0
    1c0c:	8082                	ret

0000000000001c0e <close>:
    register long a7 __asm__("a7") = n;
    1c0e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c12:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c16:	2501                	sext.w	a0,a0
    1c18:	8082                	ret

0000000000001c1a <read>:
    register long a7 __asm__("a7") = n;
    1c1a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c1e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c22:	8082                	ret

0000000000001c24 <write>:
    register long a7 __asm__("a7") = n;
    1c24:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c28:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c2c:	8082                	ret

0000000000001c2e <getpid>:
    register long a7 __asm__("a7") = n;
    1c2e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c32:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c36:	2501                	sext.w	a0,a0
    1c38:	8082                	ret

0000000000001c3a <getppid>:
    register long a7 __asm__("a7") = n;
    1c3a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c3e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c46:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c4a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <fork>:
    register long a7 __asm__("a7") = n;
    1c52:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c56:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c5a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c62:	85b2                	mv	a1,a2
    1c64:	863a                	mv	a2,a4
    if (stack)
    1c66:	c191                	beqz	a1,1c6a <clone+0x8>
	stack += stack_size;
    1c68:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c6a:	4781                	li	a5,0
    1c6c:	4701                	li	a4,0
    1c6e:	4681                	li	a3,0
    1c70:	2601                	sext.w	a2,a2
    1c72:	ac01                	j	1e82 <__clone>

0000000000001c74 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c74:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c78:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c7c:	8082                	ret

0000000000001c7e <exit>:
    register long a7 __asm__("a7") = n;
    1c7e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c82:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c86:	8082                	ret

0000000000001c88 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c88:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c8c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c8e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <exec>:
    register long a7 __asm__("a7") = n;
    1c96:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c9a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <execve>:
    register long a7 __asm__("a7") = n;
    1ca2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <times>:
    register long a7 __asm__("a7") = n;
    1cae:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <get_time>:

int64 get_time()
{
    1cba:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cbc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cc0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cc8:	2501                	sext.w	a0,a0
    1cca:	ed09                	bnez	a0,1ce4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ccc:	67a2                	ld	a5,8(sp)
    1cce:	3e800713          	li	a4,1000
    1cd2:	00015503          	lhu	a0,0(sp)
    1cd6:	02e7d7b3          	divu	a5,a5,a4
    1cda:	02e50533          	mul	a0,a0,a4
    1cde:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ce0:	0141                	add	sp,sp,16
    1ce2:	8082                	ret
        return -1;
    1ce4:	557d                	li	a0,-1
    1ce6:	bfed                	j	1ce0 <get_time+0x26>

0000000000001ce8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ce8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cec:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <time>:
    register long a7 __asm__("a7") = n;
    1cf4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <sleep>:

int sleep(unsigned long long time)
{
    1d00:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d02:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d04:	850a                	mv	a0,sp
    1d06:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d08:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d0c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d12:	e501                	bnez	a0,1d1a <sleep+0x1a>
    return 0;
    1d14:	4501                	li	a0,0
}
    1d16:	0141                	add	sp,sp,16
    1d18:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d1a:	4502                	lw	a0,0(sp)
}
    1d1c:	0141                	add	sp,sp,16
    1d1e:	8082                	ret

0000000000001d20 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d20:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d2c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d30:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d34:	8082                	ret

0000000000001d36 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d36:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d3a:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <munmap>:
    register long a7 __asm__("a7") = n;
    1d42:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <wait>:

int wait(int *code)
{
    1d4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d50:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d54:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d56:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d58:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <spawn>:
    register long a7 __asm__("a7") = n;
    1d62:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <mailread>:
    register long a7 __asm__("a7") = n;
    1d6e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d72:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d7a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <fstat>:
    register long a7 __asm__("a7") = n;
    1d86:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1d92:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d94:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1d98:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9a:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1da2:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1da4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1da8:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1daa:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1db2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1db4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1db8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dba:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <link>:

int link(char *old_path, char *new_path)
{
    1dc2:	87aa                	mv	a5,a0
    1dc4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dc6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dca:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dce:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dd0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dd4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <unlink>:

int unlink(char *path)
{
    1dde:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1de4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1de8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <uname>:
    register long a7 __asm__("a7") = n;
    1df2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <brk>:
    register long a7 __asm__("a7") = n;
    1dfe:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e0a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e10:	8082                	ret

0000000000001e12 <chdir>:
    register long a7 __asm__("a7") = n;
    1e12:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e1e:	862e                	mv	a2,a1
    1e20:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e22:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e2e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e30:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <getdents>:
    register long a7 __asm__("a7") = n;
    1e38:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <pipe>:
    register long a7 __asm__("a7") = n;
    1e44:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e48:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <dup>:
    register long a7 __asm__("a7") = n;
    1e52:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <dup2>:
    register long a7 __asm__("a7") = n;
    1e5c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e5e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e60:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <mount>:
    register long a7 __asm__("a7") = n;
    1e68:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <umount>:
    register long a7 __asm__("a7") = n;
    1e74:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e78:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e82:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e84:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e86:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e88:	8532                	mv	a0,a2
	mv a2, a4
    1e8a:	863a                	mv	a2,a4
	mv a3, a5
    1e8c:	86be                	mv	a3,a5
	mv a4, a6
    1e8e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e90:	0dc00893          	li	a7,220
	ecall
    1e94:	00000073          	ecall

	beqz a0, 1f
    1e98:	c111                	beqz	a0,1e9c <__clone+0x1a>
	# Parent
	ret
    1e9a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e9c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e9e:	6522                	ld	a0,8(sp)
	jalr a1
    1ea0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ea2:	05d00893          	li	a7,93
	ecall
    1ea6:	00000073          	ecall
