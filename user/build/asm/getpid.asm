
/home/hbh/oslab/oslab/user/build/riscv64/getpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a061                	j	108a <__start_main>

0000000000001004 <test_getpid>:
/*
理想结果：得到进程 pid，注意要关注 pid 是否符合内核逻辑，不要单纯以 Test OK! 作为判断。
*/

int test_getpid()
{
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eba50513          	add	a0,a0,-326 # 1ec0 <__clone+0x28>
{
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	2d2000ef          	jal	12e2 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f4450513          	add	a0,a0,-188 # 1f58 <__func__.0>
    101c:	2c6000ef          	jal	12e2 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	eb850513          	add	a0,a0,-328 # 1ed8 <__clone+0x40>
    1028:	2ba000ef          	jal	12e2 <puts>
    int pid = getpid();
    102c:	419000ef          	jal	1c44 <getpid>
    1030:	85aa                	mv	a1,a0
    assert(pid >= 0);
    1032:	02054b63          	bltz	a0,1068 <test_getpid+0x64>
    printf("getpid success.\npid = %d\n", pid);
    1036:	00001517          	auipc	a0,0x1
    103a:	ed250513          	add	a0,a0,-302 # 1f08 <__clone+0x70>
    103e:	2c6000ef          	jal	1304 <printf>
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	ee650513          	add	a0,a0,-282 # 1f28 <__clone+0x90>
    104a:	298000ef          	jal	12e2 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	f0a50513          	add	a0,a0,-246 # 1f58 <__func__.0>
    1056:	28c000ef          	jal	12e2 <puts>
}
    105a:	60e2                	ld	ra,24(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e7c50513          	add	a0,a0,-388 # 1ed8 <__clone+0x40>
}
    1064:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1066:	acb5                	j	12e2 <puts>
    1068:	e42a                	sd	a0,8(sp)
    assert(pid >= 0);
    106a:	00001517          	auipc	a0,0x1
    106e:	e7e50513          	add	a0,a0,-386 # 1ee8 <__clone+0x50>
    1072:	50c000ef          	jal	157e <panic>
    1076:	65a2                	ld	a1,8(sp)
    1078:	bf7d                	j	1036 <test_getpid+0x32>

000000000000107a <main>:

int main(void) {
    107a:	1141                	add	sp,sp,-16
    107c:	e406                	sd	ra,8(sp)
	test_getpid();
    107e:	f87ff0ef          	jal	1004 <test_getpid>
	return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	add	sp,sp,16
    1088:	8082                	ret

000000000000108a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108c:	4108                	lw	a0,0(a0)
{
    108e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1090:	05a1                	add	a1,a1,8
{
    1092:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1094:	fe7ff0ef          	jal	107a <main>
    1098:	3fd000ef          	jal	1c94 <exit>
	return 0;
}
    109c:	60a2                	ld	ra,8(sp)
    109e:	4501                	li	a0,0
    10a0:	0141                	add	sp,sp,16
    10a2:	8082                	ret

00000000000010a4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a4:	7179                	add	sp,sp,-48
    10a6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a8:	12054863          	bltz	a0,11d8 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ac:	02b577bb          	remuw	a5,a0,a1
    10b0:	00001697          	auipc	a3,0x1
    10b4:	eb868693          	add	a3,a3,-328 # 1f68 <digits>
    buf[16] = 0;
    10b8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10bc:	0005871b          	sext.w	a4,a1
    10c0:	1782                	sll	a5,a5,0x20
    10c2:	9381                	srl	a5,a5,0x20
    10c4:	97b6                	add	a5,a5,a3
    10c6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ca:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ce:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d2:	1ab56663          	bltu	a0,a1,127e <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    10d6:	02e8763b          	remuw	a2,a6,a4
    10da:	1602                	sll	a2,a2,0x20
    10dc:	9201                	srl	a2,a2,0x20
    10de:	9636                	add	a2,a2,a3
    10e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10e8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ec:	12e86c63          	bltu	a6,a4,1224 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10f0:	02e5f63b          	remuw	a2,a1,a4
    10f4:	1602                	sll	a2,a2,0x20
    10f6:	9201                	srl	a2,a2,0x20
    10f8:	9636                	add	a2,a2,a3
    10fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fe:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1102:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1106:	12e5e863          	bltu	a1,a4,1236 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    110a:	02e8763b          	remuw	a2,a6,a4
    110e:	1602                	sll	a2,a2,0x20
    1110:	9201                	srl	a2,a2,0x20
    1112:	9636                	add	a2,a2,a3
    1114:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1118:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1120:	12e86463          	bltu	a6,a4,1248 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1124:	02e5f63b          	remuw	a2,a1,a4
    1128:	1602                	sll	a2,a2,0x20
    112a:	9201                	srl	a2,a2,0x20
    112c:	9636                	add	a2,a2,a3
    112e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1132:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1136:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    113a:	12e5e063          	bltu	a1,a4,125a <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    113e:	02e8763b          	remuw	a2,a6,a4
    1142:	1602                	sll	a2,a2,0x20
    1144:	9201                	srl	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1150:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1154:	0ae86f63          	bltu	a6,a4,1212 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1158:	02e5f63b          	remuw	a2,a1,a4
    115c:	1602                	sll	a2,a2,0x20
    115e:	9201                	srl	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    116e:	0ee5ef63          	bltu	a1,a4,126c <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1172:	02e8763b          	remuw	a2,a6,a4
    1176:	1602                	sll	a2,a2,0x20
    1178:	9201                	srl	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1184:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1188:	0ee86d63          	bltu	a6,a4,1282 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    118c:	02e5f63b          	remuw	a2,a1,a4
    1190:	1602                	sll	a2,a2,0x20
    1192:	9201                	srl	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    119e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11a2:	0ee5e963          	bltu	a1,a4,1294 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11a6:	1782                	sll	a5,a5,0x20
    11a8:	9381                	srl	a5,a5,0x20
    11aa:	96be                	add	a3,a3,a5
    11ac:	0006c783          	lbu	a5,0(a3)
    11b0:	4599                	li	a1,6
    11b2:	00f10723          	sb	a5,14(sp)

    if (sign)
    11b6:	00055763          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11ba:	02d00793          	li	a5,45
    11be:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11c2:	4595                	li	a1,5
    write(f, s, l);
    11c4:	003c                	add	a5,sp,8
    11c6:	4641                	li	a2,16
    11c8:	9e0d                	subw	a2,a2,a1
    11ca:	4505                	li	a0,1
    11cc:	95be                	add	a1,a1,a5
    11ce:	26d000ef          	jal	1c3a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d2:	70a2                	ld	ra,40(sp)
    11d4:	6145                	add	sp,sp,48
    11d6:	8082                	ret
        x = -xx;
    11d8:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11dc:	02b677bb          	remuw	a5,a2,a1
    11e0:	00001697          	auipc	a3,0x1
    11e4:	d8868693          	add	a3,a3,-632 # 1f68 <digits>
    buf[16] = 0;
    11e8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11ec:	0005871b          	sext.w	a4,a1
    11f0:	1782                	sll	a5,a5,0x20
    11f2:	9381                	srl	a5,a5,0x20
    11f4:	97b6                	add	a5,a5,a3
    11f6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11fa:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11fe:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1202:	ecb67ae3          	bgeu	a2,a1,10d6 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1206:	02d00793          	li	a5,45
    120a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    120e:	45b9                	li	a1,14
    1210:	bf55                	j	11c4 <printint.constprop.0+0x120>
    1212:	45a9                	li	a1,10
    if (sign)
    1214:	fa0558e3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1218:	02d00793          	li	a5,45
    121c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1220:	45a5                	li	a1,9
    1222:	b74d                	j	11c4 <printint.constprop.0+0x120>
    1224:	45b9                	li	a1,14
    if (sign)
    1226:	f8055fe3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    122a:	02d00793          	li	a5,45
    122e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1232:	45b5                	li	a1,13
    1234:	bf41                	j	11c4 <printint.constprop.0+0x120>
    1236:	45b5                	li	a1,13
    if (sign)
    1238:	f80556e3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    123c:	02d00793          	li	a5,45
    1240:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1244:	45b1                	li	a1,12
    1246:	bfbd                	j	11c4 <printint.constprop.0+0x120>
    1248:	45b1                	li	a1,12
    if (sign)
    124a:	f6055de3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1256:	45ad                	li	a1,11
    1258:	b7b5                	j	11c4 <printint.constprop.0+0x120>
    125a:	45ad                	li	a1,11
    if (sign)
    125c:	f60554e3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1268:	45a9                	li	a1,10
    126a:	bfa9                	j	11c4 <printint.constprop.0+0x120>
    126c:	45a5                	li	a1,9
    if (sign)
    126e:	f4055be3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    127a:	45a1                	li	a1,8
    127c:	b7a1                	j	11c4 <printint.constprop.0+0x120>
    i = 15;
    127e:	45bd                	li	a1,15
    1280:	b791                	j	11c4 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1282:	45a1                	li	a1,8
    if (sign)
    1284:	f40550e3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1290:	459d                	li	a1,7
    1292:	bf0d                	j	11c4 <printint.constprop.0+0x120>
    1294:	459d                	li	a1,7
    if (sign)
    1296:	f20557e3          	bgez	a0,11c4 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12a2:	4599                	li	a1,6
    12a4:	b705                	j	11c4 <printint.constprop.0+0x120>

00000000000012a6 <getchar>:
{
    12a6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12a8:	00f10593          	add	a1,sp,15
    12ac:	4605                	li	a2,1
    12ae:	4501                	li	a0,0
{
    12b0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b6:	17b000ef          	jal	1c30 <read>
}
    12ba:	60e2                	ld	ra,24(sp)
    12bc:	00f14503          	lbu	a0,15(sp)
    12c0:	6105                	add	sp,sp,32
    12c2:	8082                	ret

00000000000012c4 <putchar>:
{
    12c4:	1101                	add	sp,sp,-32
    12c6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12c8:	00f10593          	add	a1,sp,15
    12cc:	4605                	li	a2,1
    12ce:	4505                	li	a0,1
{
    12d0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12d6:	165000ef          	jal	1c3a <write>
}
    12da:	60e2                	ld	ra,24(sp)
    12dc:	2501                	sext.w	a0,a0
    12de:	6105                	add	sp,sp,32
    12e0:	8082                	ret

00000000000012e2 <puts>:
{
    12e2:	1141                	add	sp,sp,-16
    12e4:	e406                	sd	ra,8(sp)
    12e6:	e022                	sd	s0,0(sp)
    12e8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ea:	574000ef          	jal	185e <strlen>
    12ee:	862a                	mv	a2,a0
    12f0:	85a2                	mv	a1,s0
    12f2:	4505                	li	a0,1
    12f4:	147000ef          	jal	1c3a <write>
}
    12f8:	60a2                	ld	ra,8(sp)
    12fa:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fc:	957d                	sra	a0,a0,0x3f
    return r;
    12fe:	2501                	sext.w	a0,a0
}
    1300:	0141                	add	sp,sp,16
    1302:	8082                	ret

0000000000001304 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1304:	7171                	add	sp,sp,-176
    1306:	f85a                	sd	s6,48(sp)
    1308:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    130a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130c:	18bc                	add	a5,sp,120
{
    130e:	e8ca                	sd	s2,80(sp)
    1310:	e4ce                	sd	s3,72(sp)
    1312:	e0d2                	sd	s4,64(sp)
    1314:	fc56                	sd	s5,56(sp)
    1316:	f486                	sd	ra,104(sp)
    1318:	f0a2                	sd	s0,96(sp)
    131a:	eca6                	sd	s1,88(sp)
    131c:	fcae                	sd	a1,120(sp)
    131e:	e132                	sd	a2,128(sp)
    1320:	e536                	sd	a3,136(sp)
    1322:	e93a                	sd	a4,144(sp)
    1324:	f142                	sd	a6,160(sp)
    1326:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1328:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    132e:	07300a13          	li	s4,115
    1332:	07800a93          	li	s5,120
    buf[i++] = '0';
    1336:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    133a:	00001997          	auipc	s3,0x1
    133e:	c2e98993          	add	s3,s3,-978 # 1f68 <digits>
        if (!*s)
    1342:	00054783          	lbu	a5,0(a0)
    1346:	16078a63          	beqz	a5,14ba <printf+0x1b6>
    134a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    134c:	19278d63          	beq	a5,s2,14e6 <printf+0x1e2>
    1350:	00164783          	lbu	a5,1(a2)
    1354:	0605                	add	a2,a2,1
    1356:	fbfd                	bnez	a5,134c <printf+0x48>
    1358:	84b2                	mv	s1,a2
        l = z - a;
    135a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135e:	85aa                	mv	a1,a0
    1360:	8622                	mv	a2,s0
    1362:	4505                	li	a0,1
    1364:	0d7000ef          	jal	1c3a <write>
        if (l)
    1368:	1a041463          	bnez	s0,1510 <printf+0x20c>
        if (s[1] == 0)
    136c:	0014c783          	lbu	a5,1(s1)
    1370:	14078563          	beqz	a5,14ba <printf+0x1b6>
        switch (s[1])
    1374:	1b478063          	beq	a5,s4,1514 <printf+0x210>
    1378:	14fa6b63          	bltu	s4,a5,14ce <printf+0x1ca>
    137c:	06400713          	li	a4,100
    1380:	1ee78063          	beq	a5,a4,1560 <printf+0x25c>
    1384:	07000713          	li	a4,112
    1388:	1ae79963          	bne	a5,a4,153a <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    138c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    138e:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1392:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1394:	631c                	ld	a5,0(a4)
    1396:	0721                	add	a4,a4,8
    1398:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    139a:	00479293          	sll	t0,a5,0x4
    139e:	00879f93          	sll	t6,a5,0x8
    13a2:	00c79f13          	sll	t5,a5,0xc
    13a6:	01079e93          	sll	t4,a5,0x10
    13aa:	01479e13          	sll	t3,a5,0x14
    13ae:	01879313          	sll	t1,a5,0x18
    13b2:	01c79893          	sll	a7,a5,0x1c
    13b6:	02479813          	sll	a6,a5,0x24
    13ba:	02879513          	sll	a0,a5,0x28
    13be:	02c79593          	sll	a1,a5,0x2c
    13c2:	03079693          	sll	a3,a5,0x30
    13c6:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ca:	03c7d413          	srl	s0,a5,0x3c
    13ce:	01c7d39b          	srlw	t2,a5,0x1c
    13d2:	03c2d293          	srl	t0,t0,0x3c
    13d6:	03cfdf93          	srl	t6,t6,0x3c
    13da:	03cf5f13          	srl	t5,t5,0x3c
    13de:	03cede93          	srl	t4,t4,0x3c
    13e2:	03ce5e13          	srl	t3,t3,0x3c
    13e6:	03c35313          	srl	t1,t1,0x3c
    13ea:	03c8d893          	srl	a7,a7,0x3c
    13ee:	03c85813          	srl	a6,a6,0x3c
    13f2:	9171                	srl	a0,a0,0x3c
    13f4:	91f1                	srl	a1,a1,0x3c
    13f6:	92f1                	srl	a3,a3,0x3c
    13f8:	9371                	srl	a4,a4,0x3c
    13fa:	96ce                	add	a3,a3,s3
    13fc:	974e                	add	a4,a4,s3
    13fe:	944e                	add	s0,s0,s3
    1400:	92ce                	add	t0,t0,s3
    1402:	9fce                	add	t6,t6,s3
    1404:	9f4e                	add	t5,t5,s3
    1406:	9ece                	add	t4,t4,s3
    1408:	9e4e                	add	t3,t3,s3
    140a:	934e                	add	t1,t1,s3
    140c:	98ce                	add	a7,a7,s3
    140e:	93ce                	add	t2,t2,s3
    1410:	984e                	add	a6,a6,s3
    1412:	954e                	add	a0,a0,s3
    1414:	95ce                	add	a1,a1,s3
    1416:	0006c083          	lbu	ra,0(a3)
    141a:	0002c283          	lbu	t0,0(t0)
    141e:	00074683          	lbu	a3,0(a4)
    1422:	000fcf83          	lbu	t6,0(t6)
    1426:	000f4f03          	lbu	t5,0(t5)
    142a:	000ece83          	lbu	t4,0(t4)
    142e:	000e4e03          	lbu	t3,0(t3)
    1432:	00034303          	lbu	t1,0(t1)
    1436:	0008c883          	lbu	a7,0(a7)
    143a:	0003c383          	lbu	t2,0(t2)
    143e:	00084803          	lbu	a6,0(a6)
    1442:	00054503          	lbu	a0,0(a0)
    1446:	0005c583          	lbu	a1,0(a1)
    144a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    144e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1452:	9371                	srl	a4,a4,0x3c
    1454:	8bbd                	and	a5,a5,15
    1456:	974e                	add	a4,a4,s3
    1458:	97ce                	add	a5,a5,s3
    145a:	005105a3          	sb	t0,11(sp)
    145e:	01f10623          	sb	t6,12(sp)
    1462:	01e106a3          	sb	t5,13(sp)
    1466:	01d10723          	sb	t4,14(sp)
    146a:	01c107a3          	sb	t3,15(sp)
    146e:	00610823          	sb	t1,16(sp)
    1472:	011108a3          	sb	a7,17(sp)
    1476:	00710923          	sb	t2,18(sp)
    147a:	010109a3          	sb	a6,19(sp)
    147e:	00a10a23          	sb	a0,20(sp)
    1482:	00b10aa3          	sb	a1,21(sp)
    1486:	00110b23          	sb	ra,22(sp)
    148a:	00d10ba3          	sb	a3,23(sp)
    148e:	00810523          	sb	s0,10(sp)
    1492:	00074703          	lbu	a4,0(a4)
    1496:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    149a:	002c                	add	a1,sp,8
    149c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149e:	00e10c23          	sb	a4,24(sp)
    14a2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14a6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14aa:	790000ef          	jal	1c3a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ae:	00248513          	add	a0,s1,2
        if (!*s)
    14b2:	00054783          	lbu	a5,0(a0)
    14b6:	e8079ae3          	bnez	a5,134a <printf+0x46>
    }
    va_end(ap);
}
    14ba:	70a6                	ld	ra,104(sp)
    14bc:	7406                	ld	s0,96(sp)
    14be:	64e6                	ld	s1,88(sp)
    14c0:	6946                	ld	s2,80(sp)
    14c2:	69a6                	ld	s3,72(sp)
    14c4:	6a06                	ld	s4,64(sp)
    14c6:	7ae2                	ld	s5,56(sp)
    14c8:	7b42                	ld	s6,48(sp)
    14ca:	614d                	add	sp,sp,176
    14cc:	8082                	ret
        switch (s[1])
    14ce:	07579663          	bne	a5,s5,153a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14d2:	6782                	ld	a5,0(sp)
    14d4:	45c1                	li	a1,16
    14d6:	4388                	lw	a0,0(a5)
    14d8:	07a1                	add	a5,a5,8
    14da:	e03e                	sd	a5,0(sp)
    14dc:	bc9ff0ef          	jal	10a4 <printint.constprop.0>
        s += 2;
    14e0:	00248513          	add	a0,s1,2
    14e4:	b7f9                	j	14b2 <printf+0x1ae>
    14e6:	84b2                	mv	s1,a2
    14e8:	a039                	j	14f6 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ea:	0024c783          	lbu	a5,2(s1)
    14ee:	0605                	add	a2,a2,1
    14f0:	0489                	add	s1,s1,2
    14f2:	e72794e3          	bne	a5,s2,135a <printf+0x56>
    14f6:	0014c783          	lbu	a5,1(s1)
    14fa:	ff2788e3          	beq	a5,s2,14ea <printf+0x1e6>
        l = z - a;
    14fe:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1502:	85aa                	mv	a1,a0
    1504:	8622                	mv	a2,s0
    1506:	4505                	li	a0,1
    1508:	732000ef          	jal	1c3a <write>
        if (l)
    150c:	e60400e3          	beqz	s0,136c <printf+0x68>
    1510:	8526                	mv	a0,s1
    1512:	bd05                	j	1342 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1514:	6782                	ld	a5,0(sp)
    1516:	6380                	ld	s0,0(a5)
    1518:	07a1                	add	a5,a5,8
    151a:	e03e                	sd	a5,0(sp)
    151c:	cc21                	beqz	s0,1574 <printf+0x270>
            l = strnlen(a, 200);
    151e:	0c800593          	li	a1,200
    1522:	8522                	mv	a0,s0
    1524:	424000ef          	jal	1948 <strnlen>
    write(f, s, l);
    1528:	0005061b          	sext.w	a2,a0
    152c:	85a2                	mv	a1,s0
    152e:	4505                	li	a0,1
    1530:	70a000ef          	jal	1c3a <write>
        s += 2;
    1534:	00248513          	add	a0,s1,2
    1538:	bfad                	j	14b2 <printf+0x1ae>
    return write(stdout, &byte, 1);
    153a:	4605                	li	a2,1
    153c:	002c                	add	a1,sp,8
    153e:	4505                	li	a0,1
    char byte = c;
    1540:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1544:	6f6000ef          	jal	1c3a <write>
    char byte = c;
    1548:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154c:	4605                	li	a2,1
    154e:	002c                	add	a1,sp,8
    1550:	4505                	li	a0,1
    char byte = c;
    1552:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1556:	6e4000ef          	jal	1c3a <write>
        s += 2;
    155a:	00248513          	add	a0,s1,2
    155e:	bf91                	j	14b2 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1560:	6782                	ld	a5,0(sp)
    1562:	45a9                	li	a1,10
    1564:	4388                	lw	a0,0(a5)
    1566:	07a1                	add	a5,a5,8
    1568:	e03e                	sd	a5,0(sp)
    156a:	b3bff0ef          	jal	10a4 <printint.constprop.0>
        s += 2;
    156e:	00248513          	add	a0,s1,2
    1572:	b781                	j	14b2 <printf+0x1ae>
                a = "(null)";
    1574:	00001417          	auipc	s0,0x1
    1578:	9c440413          	add	s0,s0,-1596 # 1f38 <__clone+0xa0>
    157c:	b74d                	j	151e <printf+0x21a>

000000000000157e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    157e:	1141                	add	sp,sp,-16
    1580:	e406                	sd	ra,8(sp)
    puts(m);
    1582:	d61ff0ef          	jal	12e2 <puts>
    exit(-100);
}
    1586:	60a2                	ld	ra,8(sp)
    exit(-100);
    1588:	f9c00513          	li	a0,-100
}
    158c:	0141                	add	sp,sp,16
    exit(-100);
    158e:	a719                	j	1c94 <exit>

0000000000001590 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1590:	02000793          	li	a5,32
    1594:	00f50663          	beq	a0,a5,15a0 <isspace+0x10>
    1598:	355d                	addw	a0,a0,-9
    159a:	00553513          	sltiu	a0,a0,5
    159e:	8082                	ret
    15a0:	4505                	li	a0,1
}
    15a2:	8082                	ret

00000000000015a4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a4:	fd05051b          	addw	a0,a0,-48
}
    15a8:	00a53513          	sltiu	a0,a0,10
    15ac:	8082                	ret

00000000000015ae <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	02000693          	li	a3,32
    15b2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b8:	ff77871b          	addw	a4,a5,-9
    15bc:	04d78c63          	beq	a5,a3,1614 <atoi+0x66>
    15c0:	0007861b          	sext.w	a2,a5
    15c4:	04e5f863          	bgeu	a1,a4,1614 <atoi+0x66>
        s++;
    switch (*s)
    15c8:	02b00713          	li	a4,43
    15cc:	04e78963          	beq	a5,a4,161e <atoi+0x70>
    15d0:	02d00713          	li	a4,45
    15d4:	06e78263          	beq	a5,a4,1638 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d8:	fd06069b          	addw	a3,a2,-48
    15dc:	47a5                	li	a5,9
    15de:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15e0:	4301                	li	t1,0
    while (isdigit(*s))
    15e2:	04d7e963          	bltu	a5,a3,1634 <atoi+0x86>
    int n = 0, neg = 0;
    15e6:	4501                	li	a0,0
    while (isdigit(*s))
    15e8:	48a5                	li	a7,9
    15ea:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15ee:	0025179b          	sllw	a5,a0,0x2
    15f2:	9fa9                	addw	a5,a5,a0
    15f4:	fd06059b          	addw	a1,a2,-48
    15f8:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    15fc:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1600:	0705                	add	a4,a4,1
    1602:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1606:	0006861b          	sext.w	a2,a3
    160a:	ff08f0e3          	bgeu	a7,a6,15ea <atoi+0x3c>
    return neg ? n : -n;
    160e:	00030563          	beqz	t1,1618 <atoi+0x6a>
}
    1612:	8082                	ret
        s++;
    1614:	0505                	add	a0,a0,1
    1616:	bf79                	j	15b4 <atoi+0x6>
    return neg ? n : -n;
    1618:	40f5853b          	subw	a0,a1,a5
    161c:	8082                	ret
    while (isdigit(*s))
    161e:	00154603          	lbu	a2,1(a0)
    1622:	47a5                	li	a5,9
        s++;
    1624:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1628:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    162c:	4301                	li	t1,0
    while (isdigit(*s))
    162e:	2601                	sext.w	a2,a2
    1630:	fad7fbe3          	bgeu	a5,a3,15e6 <atoi+0x38>
    1634:	4501                	li	a0,0
}
    1636:	8082                	ret
    while (isdigit(*s))
    1638:	00154603          	lbu	a2,1(a0)
    163c:	47a5                	li	a5,9
        s++;
    163e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1642:	fd06069b          	addw	a3,a2,-48
    1646:	2601                	sext.w	a2,a2
    1648:	fed7e6e3          	bltu	a5,a3,1634 <atoi+0x86>
        neg = 1;
    164c:	4305                	li	t1,1
    164e:	bf61                	j	15e6 <atoi+0x38>

0000000000001650 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1650:	18060163          	beqz	a2,17d2 <memset+0x182>
    1654:	40a006b3          	neg	a3,a0
    1658:	0076f793          	and	a5,a3,7
    165c:	00778813          	add	a6,a5,7
    1660:	48ad                	li	a7,11
    1662:	0ff5f713          	zext.b	a4,a1
    1666:	fff60593          	add	a1,a2,-1
    166a:	17186563          	bltu	a6,a7,17d4 <memset+0x184>
    166e:	1705ed63          	bltu	a1,a6,17e8 <memset+0x198>
    1672:	16078363          	beqz	a5,17d8 <memset+0x188>
    1676:	00e50023          	sb	a4,0(a0)
    167a:	0066f593          	and	a1,a3,6
    167e:	16058063          	beqz	a1,17de <memset+0x18e>
    1682:	00e500a3          	sb	a4,1(a0)
    1686:	4589                	li	a1,2
    1688:	16f5f363          	bgeu	a1,a5,17ee <memset+0x19e>
    168c:	00e50123          	sb	a4,2(a0)
    1690:	8a91                	and	a3,a3,4
    1692:	00350593          	add	a1,a0,3
    1696:	4e0d                	li	t3,3
    1698:	ce9d                	beqz	a3,16d6 <memset+0x86>
    169a:	00e501a3          	sb	a4,3(a0)
    169e:	4691                	li	a3,4
    16a0:	00450593          	add	a1,a0,4
    16a4:	4e11                	li	t3,4
    16a6:	02f6f863          	bgeu	a3,a5,16d6 <memset+0x86>
    16aa:	00e50223          	sb	a4,4(a0)
    16ae:	4695                	li	a3,5
    16b0:	00550593          	add	a1,a0,5
    16b4:	4e15                	li	t3,5
    16b6:	02d78063          	beq	a5,a3,16d6 <memset+0x86>
    16ba:	fff50693          	add	a3,a0,-1
    16be:	00e502a3          	sb	a4,5(a0)
    16c2:	8a9d                	and	a3,a3,7
    16c4:	00650593          	add	a1,a0,6
    16c8:	4e19                	li	t3,6
    16ca:	e691                	bnez	a3,16d6 <memset+0x86>
    16cc:	00750593          	add	a1,a0,7
    16d0:	00e50323          	sb	a4,6(a0)
    16d4:	4e1d                	li	t3,7
    16d6:	00871693          	sll	a3,a4,0x8
    16da:	01071813          	sll	a6,a4,0x10
    16de:	8ed9                	or	a3,a3,a4
    16e0:	01871893          	sll	a7,a4,0x18
    16e4:	0106e6b3          	or	a3,a3,a6
    16e8:	0116e6b3          	or	a3,a3,a7
    16ec:	02071813          	sll	a6,a4,0x20
    16f0:	02871313          	sll	t1,a4,0x28
    16f4:	0106e6b3          	or	a3,a3,a6
    16f8:	40f608b3          	sub	a7,a2,a5
    16fc:	03071813          	sll	a6,a4,0x30
    1700:	0066e6b3          	or	a3,a3,t1
    1704:	0106e6b3          	or	a3,a3,a6
    1708:	03871313          	sll	t1,a4,0x38
    170c:	97aa                	add	a5,a5,a0
    170e:	ff88f813          	and	a6,a7,-8
    1712:	0066e6b3          	or	a3,a3,t1
    1716:	983e                	add	a6,a6,a5
    1718:	e394                	sd	a3,0(a5)
    171a:	07a1                	add	a5,a5,8
    171c:	ff079ee3          	bne	a5,a6,1718 <memset+0xc8>
    1720:	ff88f793          	and	a5,a7,-8
    1724:	0078f893          	and	a7,a7,7
    1728:	00f586b3          	add	a3,a1,a5
    172c:	01c787bb          	addw	a5,a5,t3
    1730:	0a088b63          	beqz	a7,17e6 <memset+0x196>
    1734:	00e68023          	sb	a4,0(a3)
    1738:	0017859b          	addw	a1,a5,1
    173c:	08c5fb63          	bgeu	a1,a2,17d2 <memset+0x182>
    1740:	00e680a3          	sb	a4,1(a3)
    1744:	0027859b          	addw	a1,a5,2
    1748:	08c5f563          	bgeu	a1,a2,17d2 <memset+0x182>
    174c:	00e68123          	sb	a4,2(a3)
    1750:	0037859b          	addw	a1,a5,3
    1754:	06c5ff63          	bgeu	a1,a2,17d2 <memset+0x182>
    1758:	00e681a3          	sb	a4,3(a3)
    175c:	0047859b          	addw	a1,a5,4
    1760:	06c5f963          	bgeu	a1,a2,17d2 <memset+0x182>
    1764:	00e68223          	sb	a4,4(a3)
    1768:	0057859b          	addw	a1,a5,5
    176c:	06c5f363          	bgeu	a1,a2,17d2 <memset+0x182>
    1770:	00e682a3          	sb	a4,5(a3)
    1774:	0067859b          	addw	a1,a5,6
    1778:	04c5fd63          	bgeu	a1,a2,17d2 <memset+0x182>
    177c:	00e68323          	sb	a4,6(a3)
    1780:	0077859b          	addw	a1,a5,7
    1784:	04c5f763          	bgeu	a1,a2,17d2 <memset+0x182>
    1788:	00e683a3          	sb	a4,7(a3)
    178c:	0087859b          	addw	a1,a5,8
    1790:	04c5f163          	bgeu	a1,a2,17d2 <memset+0x182>
    1794:	00e68423          	sb	a4,8(a3)
    1798:	0097859b          	addw	a1,a5,9
    179c:	02c5fb63          	bgeu	a1,a2,17d2 <memset+0x182>
    17a0:	00e684a3          	sb	a4,9(a3)
    17a4:	00a7859b          	addw	a1,a5,10
    17a8:	02c5f563          	bgeu	a1,a2,17d2 <memset+0x182>
    17ac:	00e68523          	sb	a4,10(a3)
    17b0:	00b7859b          	addw	a1,a5,11
    17b4:	00c5ff63          	bgeu	a1,a2,17d2 <memset+0x182>
    17b8:	00e685a3          	sb	a4,11(a3)
    17bc:	00c7859b          	addw	a1,a5,12
    17c0:	00c5f963          	bgeu	a1,a2,17d2 <memset+0x182>
    17c4:	00e68623          	sb	a4,12(a3)
    17c8:	27b5                	addw	a5,a5,13
    17ca:	00c7f463          	bgeu	a5,a2,17d2 <memset+0x182>
    17ce:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d2:	8082                	ret
    17d4:	482d                	li	a6,11
    17d6:	bd61                	j	166e <memset+0x1e>
    char *p = dest;
    17d8:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17da:	4e01                	li	t3,0
    17dc:	bded                	j	16d6 <memset+0x86>
    17de:	00150593          	add	a1,a0,1
    17e2:	4e05                	li	t3,1
    17e4:	bdcd                	j	16d6 <memset+0x86>
    17e6:	8082                	ret
    char *p = dest;
    17e8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	4781                	li	a5,0
    17ec:	b7a1                	j	1734 <memset+0xe4>
    17ee:	00250593          	add	a1,a0,2
    17f2:	4e09                	li	t3,2
    17f4:	b5cd                	j	16d6 <memset+0x86>

00000000000017f6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f6:	00054783          	lbu	a5,0(a0)
    17fa:	0005c703          	lbu	a4,0(a1)
    17fe:	00e79863          	bne	a5,a4,180e <strcmp+0x18>
    1802:	0505                	add	a0,a0,1
    1804:	0585                	add	a1,a1,1
    1806:	fbe5                	bnez	a5,17f6 <strcmp>
    1808:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    180a:	9d19                	subw	a0,a0,a4
    180c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    180e:	0007851b          	sext.w	a0,a5
    1812:	bfe5                	j	180a <strcmp+0x14>

0000000000001814 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1814:	ca15                	beqz	a2,1848 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1816:	00054783          	lbu	a5,0(a0)
    if (!n--)
    181a:	167d                	add	a2,a2,-1
    181c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1820:	eb99                	bnez	a5,1836 <strncmp+0x22>
    1822:	a815                	j	1856 <strncmp+0x42>
    1824:	00a68e63          	beq	a3,a0,1840 <strncmp+0x2c>
    1828:	0505                	add	a0,a0,1
    182a:	00f71b63          	bne	a4,a5,1840 <strncmp+0x2c>
    182e:	00054783          	lbu	a5,0(a0)
    1832:	cf89                	beqz	a5,184c <strncmp+0x38>
    1834:	85b2                	mv	a1,a2
    1836:	0005c703          	lbu	a4,0(a1)
    183a:	00158613          	add	a2,a1,1
    183e:	f37d                	bnez	a4,1824 <strncmp+0x10>
        ;
    return *l - *r;
    1840:	0007851b          	sext.w	a0,a5
    1844:	9d19                	subw	a0,a0,a4
    1846:	8082                	ret
        return 0;
    1848:	4501                	li	a0,0
}
    184a:	8082                	ret
    return *l - *r;
    184c:	0015c703          	lbu	a4,1(a1)
    1850:	4501                	li	a0,0
    1852:	9d19                	subw	a0,a0,a4
    1854:	8082                	ret
    1856:	0005c703          	lbu	a4,0(a1)
    185a:	4501                	li	a0,0
    185c:	b7e5                	j	1844 <strncmp+0x30>

000000000000185e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    185e:	00757793          	and	a5,a0,7
    1862:	cf89                	beqz	a5,187c <strlen+0x1e>
    1864:	87aa                	mv	a5,a0
    1866:	a029                	j	1870 <strlen+0x12>
    1868:	0785                	add	a5,a5,1
    186a:	0077f713          	and	a4,a5,7
    186e:	cb01                	beqz	a4,187e <strlen+0x20>
        if (!*s)
    1870:	0007c703          	lbu	a4,0(a5)
    1874:	fb75                	bnez	a4,1868 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1876:	40a78533          	sub	a0,a5,a0
}
    187a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    187c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    187e:	6394                	ld	a3,0(a5)
    1880:	00000597          	auipc	a1,0x0
    1884:	6c05b583          	ld	a1,1728(a1) # 1f40 <__clone+0xa8>
    1888:	00000617          	auipc	a2,0x0
    188c:	6c063603          	ld	a2,1728(a2) # 1f48 <__clone+0xb0>
    1890:	a019                	j	1896 <strlen+0x38>
    1892:	6794                	ld	a3,8(a5)
    1894:	07a1                	add	a5,a5,8
    1896:	00b68733          	add	a4,a3,a1
    189a:	fff6c693          	not	a3,a3
    189e:	8f75                	and	a4,a4,a3
    18a0:	8f71                	and	a4,a4,a2
    18a2:	db65                	beqz	a4,1892 <strlen+0x34>
    for (; *s; s++)
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	d779                	beqz	a4,1876 <strlen+0x18>
    18aa:	0017c703          	lbu	a4,1(a5)
    18ae:	0785                	add	a5,a5,1
    18b0:	d379                	beqz	a4,1876 <strlen+0x18>
    18b2:	0017c703          	lbu	a4,1(a5)
    18b6:	0785                	add	a5,a5,1
    18b8:	fb6d                	bnez	a4,18aa <strlen+0x4c>
    18ba:	bf75                	j	1876 <strlen+0x18>

00000000000018bc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18bc:	00757713          	and	a4,a0,7
{
    18c0:	87aa                	mv	a5,a0
    18c2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c6:	cb19                	beqz	a4,18dc <memchr+0x20>
    18c8:	ce25                	beqz	a2,1940 <memchr+0x84>
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	00b70763          	beq	a4,a1,18dc <memchr+0x20>
    18d2:	0785                	add	a5,a5,1
    18d4:	0077f713          	and	a4,a5,7
    18d8:	167d                	add	a2,a2,-1
    18da:	f77d                	bnez	a4,18c8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18dc:	4501                	li	a0,0
    if (n && *s != c)
    18de:	c235                	beqz	a2,1942 <memchr+0x86>
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	06b70063          	beq	a4,a1,1944 <memchr+0x88>
        size_t k = ONES * c;
    18e8:	00000517          	auipc	a0,0x0
    18ec:	66853503          	ld	a0,1640(a0) # 1f50 <__clone+0xb8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f0:	471d                	li	a4,7
        size_t k = ONES * c;
    18f2:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f6:	04c77763          	bgeu	a4,a2,1944 <memchr+0x88>
    18fa:	00000897          	auipc	a7,0x0
    18fe:	6468b883          	ld	a7,1606(a7) # 1f40 <__clone+0xa8>
    1902:	00000817          	auipc	a6,0x0
    1906:	64683803          	ld	a6,1606(a6) # 1f48 <__clone+0xb0>
    190a:	431d                	li	t1,7
    190c:	a029                	j	1916 <memchr+0x5a>
    190e:	1661                	add	a2,a2,-8
    1910:	07a1                	add	a5,a5,8
    1912:	00c37c63          	bgeu	t1,a2,192a <memchr+0x6e>
    1916:	6398                	ld	a4,0(a5)
    1918:	8f29                	xor	a4,a4,a0
    191a:	011706b3          	add	a3,a4,a7
    191e:	fff74713          	not	a4,a4
    1922:	8f75                	and	a4,a4,a3
    1924:	01077733          	and	a4,a4,a6
    1928:	d37d                	beqz	a4,190e <memchr+0x52>
    192a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    192c:	e601                	bnez	a2,1934 <memchr+0x78>
    192e:	a809                	j	1940 <memchr+0x84>
    1930:	0505                	add	a0,a0,1
    1932:	c619                	beqz	a2,1940 <memchr+0x84>
    1934:	00054783          	lbu	a5,0(a0)
    1938:	167d                	add	a2,a2,-1
    193a:	feb79be3          	bne	a5,a1,1930 <memchr+0x74>
    193e:	8082                	ret
    return n ? (void *)s : 0;
    1940:	4501                	li	a0,0
}
    1942:	8082                	ret
    if (n && *s != c)
    1944:	853e                	mv	a0,a5
    1946:	b7fd                	j	1934 <memchr+0x78>

0000000000001948 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1948:	1101                	add	sp,sp,-32
    194a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    194c:	862e                	mv	a2,a1
{
    194e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1950:	4581                	li	a1,0
{
    1952:	e426                	sd	s1,8(sp)
    1954:	ec06                	sd	ra,24(sp)
    1956:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1958:	f65ff0ef          	jal	18bc <memchr>
    return p ? p - s : n;
    195c:	c519                	beqz	a0,196a <strnlen+0x22>
}
    195e:	60e2                	ld	ra,24(sp)
    1960:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1962:	8d05                	sub	a0,a0,s1
}
    1964:	64a2                	ld	s1,8(sp)
    1966:	6105                	add	sp,sp,32
    1968:	8082                	ret
    196a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    196c:	8522                	mv	a0,s0
}
    196e:	6442                	ld	s0,16(sp)
    1970:	64a2                	ld	s1,8(sp)
    1972:	6105                	add	sp,sp,32
    1974:	8082                	ret

0000000000001976 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1976:	00a5c7b3          	xor	a5,a1,a0
    197a:	8b9d                	and	a5,a5,7
    197c:	eb95                	bnez	a5,19b0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    197e:	0075f793          	and	a5,a1,7
    1982:	e7b1                	bnez	a5,19ce <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1984:	6198                	ld	a4,0(a1)
    1986:	00000617          	auipc	a2,0x0
    198a:	5ba63603          	ld	a2,1466(a2) # 1f40 <__clone+0xa8>
    198e:	00000817          	auipc	a6,0x0
    1992:	5ba83803          	ld	a6,1466(a6) # 1f48 <__clone+0xb0>
    1996:	a029                	j	19a0 <strcpy+0x2a>
    1998:	05a1                	add	a1,a1,8
    199a:	e118                	sd	a4,0(a0)
    199c:	6198                	ld	a4,0(a1)
    199e:	0521                	add	a0,a0,8
    19a0:	00c707b3          	add	a5,a4,a2
    19a4:	fff74693          	not	a3,a4
    19a8:	8ff5                	and	a5,a5,a3
    19aa:	0107f7b3          	and	a5,a5,a6
    19ae:	d7ed                	beqz	a5,1998 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19b0:	0005c783          	lbu	a5,0(a1)
    19b4:	00f50023          	sb	a5,0(a0)
    19b8:	c785                	beqz	a5,19e0 <strcpy+0x6a>
    19ba:	0015c783          	lbu	a5,1(a1)
    19be:	0505                	add	a0,a0,1
    19c0:	0585                	add	a1,a1,1
    19c2:	00f50023          	sb	a5,0(a0)
    19c6:	fbf5                	bnez	a5,19ba <strcpy+0x44>
        ;
    return d;
}
    19c8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19ca:	0505                	add	a0,a0,1
    19cc:	df45                	beqz	a4,1984 <strcpy+0xe>
            if (!(*d = *s))
    19ce:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19d2:	0585                	add	a1,a1,1
    19d4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19d8:	00f50023          	sb	a5,0(a0)
    19dc:	f7fd                	bnez	a5,19ca <strcpy+0x54>
}
    19de:	8082                	ret
    19e0:	8082                	ret

00000000000019e2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19e2:	00a5c7b3          	xor	a5,a1,a0
    19e6:	8b9d                	and	a5,a5,7
    19e8:	e3b5                	bnez	a5,1a4c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19ea:	0075f793          	and	a5,a1,7
    19ee:	cf99                	beqz	a5,1a0c <strncpy+0x2a>
    19f0:	ea09                	bnez	a2,1a02 <strncpy+0x20>
    19f2:	a421                	j	1bfa <strncpy+0x218>
    19f4:	0585                	add	a1,a1,1
    19f6:	0075f793          	and	a5,a1,7
    19fa:	167d                	add	a2,a2,-1
    19fc:	0505                	add	a0,a0,1
    19fe:	c799                	beqz	a5,1a0c <strncpy+0x2a>
    1a00:	c225                	beqz	a2,1a60 <strncpy+0x7e>
    1a02:	0005c783          	lbu	a5,0(a1)
    1a06:	00f50023          	sb	a5,0(a0)
    1a0a:	f7ed                	bnez	a5,19f4 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a0c:	ca31                	beqz	a2,1a60 <strncpy+0x7e>
    1a0e:	0005c783          	lbu	a5,0(a1)
    1a12:	cba1                	beqz	a5,1a62 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a14:	479d                	li	a5,7
    1a16:	02c7fc63          	bgeu	a5,a2,1a4e <strncpy+0x6c>
    1a1a:	00000897          	auipc	a7,0x0
    1a1e:	5268b883          	ld	a7,1318(a7) # 1f40 <__clone+0xa8>
    1a22:	00000817          	auipc	a6,0x0
    1a26:	52683803          	ld	a6,1318(a6) # 1f48 <__clone+0xb0>
    1a2a:	431d                	li	t1,7
    1a2c:	a039                	j	1a3a <strncpy+0x58>
            *wd = *ws;
    1a2e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a30:	1661                	add	a2,a2,-8
    1a32:	05a1                	add	a1,a1,8
    1a34:	0521                	add	a0,a0,8
    1a36:	00c37b63          	bgeu	t1,a2,1a4c <strncpy+0x6a>
    1a3a:	6198                	ld	a4,0(a1)
    1a3c:	011707b3          	add	a5,a4,a7
    1a40:	fff74693          	not	a3,a4
    1a44:	8ff5                	and	a5,a5,a3
    1a46:	0107f7b3          	and	a5,a5,a6
    1a4a:	d3f5                	beqz	a5,1a2e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a4c:	ca11                	beqz	a2,1a60 <strncpy+0x7e>
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	0585                	add	a1,a1,1
    1a54:	00f50023          	sb	a5,0(a0)
    1a58:	c789                	beqz	a5,1a62 <strncpy+0x80>
    1a5a:	167d                	add	a2,a2,-1
    1a5c:	0505                	add	a0,a0,1
    1a5e:	fa65                	bnez	a2,1a4e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a60:	8082                	ret
    1a62:	4805                	li	a6,1
    1a64:	14061b63          	bnez	a2,1bba <strncpy+0x1d8>
    1a68:	40a00733          	neg	a4,a0
    1a6c:	00777793          	and	a5,a4,7
    1a70:	4581                	li	a1,0
    1a72:	12061c63          	bnez	a2,1baa <strncpy+0x1c8>
    1a76:	00778693          	add	a3,a5,7
    1a7a:	48ad                	li	a7,11
    1a7c:	1316e563          	bltu	a3,a7,1ba6 <strncpy+0x1c4>
    1a80:	16d5e263          	bltu	a1,a3,1be4 <strncpy+0x202>
    1a84:	14078c63          	beqz	a5,1bdc <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a88:	00050023          	sb	zero,0(a0)
    1a8c:	00677693          	and	a3,a4,6
    1a90:	14068263          	beqz	a3,1bd4 <strncpy+0x1f2>
    1a94:	000500a3          	sb	zero,1(a0)
    1a98:	4689                	li	a3,2
    1a9a:	14f6f863          	bgeu	a3,a5,1bea <strncpy+0x208>
    1a9e:	00050123          	sb	zero,2(a0)
    1aa2:	8b11                	and	a4,a4,4
    1aa4:	12070463          	beqz	a4,1bcc <strncpy+0x1ea>
    1aa8:	000501a3          	sb	zero,3(a0)
    1aac:	4711                	li	a4,4
    1aae:	00450693          	add	a3,a0,4
    1ab2:	02f77563          	bgeu	a4,a5,1adc <strncpy+0xfa>
    1ab6:	00050223          	sb	zero,4(a0)
    1aba:	4715                	li	a4,5
    1abc:	00550693          	add	a3,a0,5
    1ac0:	00e78e63          	beq	a5,a4,1adc <strncpy+0xfa>
    1ac4:	fff50713          	add	a4,a0,-1
    1ac8:	000502a3          	sb	zero,5(a0)
    1acc:	8b1d                	and	a4,a4,7
    1ace:	12071263          	bnez	a4,1bf2 <strncpy+0x210>
    1ad2:	00750693          	add	a3,a0,7
    1ad6:	00050323          	sb	zero,6(a0)
    1ada:	471d                	li	a4,7
    1adc:	40f80833          	sub	a6,a6,a5
    1ae0:	ff887593          	and	a1,a6,-8
    1ae4:	97aa                	add	a5,a5,a0
    1ae6:	95be                	add	a1,a1,a5
    1ae8:	0007b023          	sd	zero,0(a5)
    1aec:	07a1                	add	a5,a5,8
    1aee:	feb79de3          	bne	a5,a1,1ae8 <strncpy+0x106>
    1af2:	ff887593          	and	a1,a6,-8
    1af6:	00787813          	and	a6,a6,7
    1afa:	00e587bb          	addw	a5,a1,a4
    1afe:	00b68733          	add	a4,a3,a1
    1b02:	0e080063          	beqz	a6,1be2 <strncpy+0x200>
    1b06:	00070023          	sb	zero,0(a4)
    1b0a:	0017869b          	addw	a3,a5,1
    1b0e:	f4c6f9e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b12:	000700a3          	sb	zero,1(a4)
    1b16:	0027869b          	addw	a3,a5,2
    1b1a:	f4c6f3e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b1e:	00070123          	sb	zero,2(a4)
    1b22:	0037869b          	addw	a3,a5,3
    1b26:	f2c6fde3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b2a:	000701a3          	sb	zero,3(a4)
    1b2e:	0047869b          	addw	a3,a5,4
    1b32:	f2c6f7e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b36:	00070223          	sb	zero,4(a4)
    1b3a:	0057869b          	addw	a3,a5,5
    1b3e:	f2c6f1e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b42:	000702a3          	sb	zero,5(a4)
    1b46:	0067869b          	addw	a3,a5,6
    1b4a:	f0c6fbe3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b4e:	00070323          	sb	zero,6(a4)
    1b52:	0077869b          	addw	a3,a5,7
    1b56:	f0c6f5e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b5a:	000703a3          	sb	zero,7(a4)
    1b5e:	0087869b          	addw	a3,a5,8
    1b62:	eec6ffe3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b66:	00070423          	sb	zero,8(a4)
    1b6a:	0097869b          	addw	a3,a5,9
    1b6e:	eec6f9e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b72:	000704a3          	sb	zero,9(a4)
    1b76:	00a7869b          	addw	a3,a5,10
    1b7a:	eec6f3e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b7e:	00070523          	sb	zero,10(a4)
    1b82:	00b7869b          	addw	a3,a5,11
    1b86:	ecc6fde3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b8a:	000705a3          	sb	zero,11(a4)
    1b8e:	00c7869b          	addw	a3,a5,12
    1b92:	ecc6f7e3          	bgeu	a3,a2,1a60 <strncpy+0x7e>
    1b96:	00070623          	sb	zero,12(a4)
    1b9a:	27b5                	addw	a5,a5,13
    1b9c:	ecc7f2e3          	bgeu	a5,a2,1a60 <strncpy+0x7e>
    1ba0:	000706a3          	sb	zero,13(a4)
}
    1ba4:	8082                	ret
    1ba6:	46ad                	li	a3,11
    1ba8:	bde1                	j	1a80 <strncpy+0x9e>
    1baa:	00778693          	add	a3,a5,7
    1bae:	48ad                	li	a7,11
    1bb0:	fff60593          	add	a1,a2,-1
    1bb4:	ed16f6e3          	bgeu	a3,a7,1a80 <strncpy+0x9e>
    1bb8:	b7fd                	j	1ba6 <strncpy+0x1c4>
    1bba:	40a00733          	neg	a4,a0
    1bbe:	8832                	mv	a6,a2
    1bc0:	00777793          	and	a5,a4,7
    1bc4:	4581                	li	a1,0
    1bc6:	ea0608e3          	beqz	a2,1a76 <strncpy+0x94>
    1bca:	b7c5                	j	1baa <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bcc:	00350693          	add	a3,a0,3
    1bd0:	470d                	li	a4,3
    1bd2:	b729                	j	1adc <strncpy+0xfa>
    1bd4:	00150693          	add	a3,a0,1
    1bd8:	4705                	li	a4,1
    1bda:	b709                	j	1adc <strncpy+0xfa>
tail:
    1bdc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bde:	4701                	li	a4,0
    1be0:	bdf5                	j	1adc <strncpy+0xfa>
    1be2:	8082                	ret
tail:
    1be4:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be6:	4781                	li	a5,0
    1be8:	bf39                	j	1b06 <strncpy+0x124>
    1bea:	00250693          	add	a3,a0,2
    1bee:	4709                	li	a4,2
    1bf0:	b5f5                	j	1adc <strncpy+0xfa>
    1bf2:	00650693          	add	a3,a0,6
    1bf6:	4719                	li	a4,6
    1bf8:	b5d5                	j	1adc <strncpy+0xfa>
    1bfa:	8082                	ret

0000000000001bfc <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bfc:	87aa                	mv	a5,a0
    1bfe:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c00:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c0a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c0c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c10:	2501                	sext.w	a0,a0
    1c12:	8082                	ret

0000000000001c14 <openat>:
    register long a7 __asm__("a7") = n;
    1c14:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c18:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <close>:
    register long a7 __asm__("a7") = n;
    1c24:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c28:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <read>:
    register long a7 __asm__("a7") = n;
    1c30:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c34:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c38:	8082                	ret

0000000000001c3a <write>:
    register long a7 __asm__("a7") = n;
    1c3a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c3e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c42:	8082                	ret

0000000000001c44 <getpid>:
    register long a7 __asm__("a7") = n;
    1c44:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c48:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <getppid>:
    register long a7 __asm__("a7") = n;
    1c50:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c54:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c5c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c60:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <fork>:
    register long a7 __asm__("a7") = n;
    1c68:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c6c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c6e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c70:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c78:	85b2                	mv	a1,a2
    1c7a:	863a                	mv	a2,a4
    if (stack)
    1c7c:	c191                	beqz	a1,1c80 <clone+0x8>
	stack += stack_size;
    1c7e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c80:	4781                	li	a5,0
    1c82:	4701                	li	a4,0
    1c84:	4681                	li	a3,0
    1c86:	2601                	sext.w	a2,a2
    1c88:	ac01                	j	1e98 <__clone>

0000000000001c8a <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1c8a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1c8e:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1c92:	8082                	ret

0000000000001c94 <exit>:
    register long a7 __asm__("a7") = n;
    1c94:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c98:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c9c:	8082                	ret

0000000000001c9e <waitpid>:
    register long a7 __asm__("a7") = n;
    1c9e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ca2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <exec>:
    register long a7 __asm__("a7") = n;
    1cac:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cb0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <execve>:
    register long a7 __asm__("a7") = n;
    1cb8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <times>:
    register long a7 __asm__("a7") = n;
    1cc4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cc8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <get_time>:

int64 get_time()
{
    1cd0:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cd2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cd6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cd8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cda:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cde:	2501                	sext.w	a0,a0
    1ce0:	ed09                	bnez	a0,1cfa <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ce2:	67a2                	ld	a5,8(sp)
    1ce4:	3e800713          	li	a4,1000
    1ce8:	00015503          	lhu	a0,0(sp)
    1cec:	02e7d7b3          	divu	a5,a5,a4
    1cf0:	02e50533          	mul	a0,a0,a4
    1cf4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cf6:	0141                	add	sp,sp,16
    1cf8:	8082                	ret
        return -1;
    1cfa:	557d                	li	a0,-1
    1cfc:	bfed                	j	1cf6 <get_time+0x26>

0000000000001cfe <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cfe:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d02:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <time>:
    register long a7 __asm__("a7") = n;
    1d0a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <sleep>:

int sleep(unsigned long long time)
{
    1d16:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d18:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d1a:	850a                	mv	a0,sp
    1d1c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d1e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d22:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d28:	e501                	bnez	a0,1d30 <sleep+0x1a>
    return 0;
    1d2a:	4501                	li	a0,0
}
    1d2c:	0141                	add	sp,sp,16
    1d2e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d30:	4502                	lw	a0,0(sp)
}
    1d32:	0141                	add	sp,sp,16
    1d34:	8082                	ret

0000000000001d36 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d36:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d42:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d46:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d4a:	8082                	ret

0000000000001d4c <mprotect>:
    register long a7 __asm__("a7") = n;
    1d4c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d50:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <munmap>:
    register long a7 __asm__("a7") = n;
    1d58:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <wait>:

int wait(int *code)
{
    1d64:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d66:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d6a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d6c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d6e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d70:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <spawn>:
    register long a7 __asm__("a7") = n;
    1d78:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d7c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <mailread>:
    register long a7 __asm__("a7") = n;
    1d84:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d90:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d94:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <fstat>:
    register long a7 __asm__("a7") = n;
    1d9c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1da8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1daa:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dae:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db0:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dba:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dbe:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dca:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dce:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <link>:

int link(char *old_path, char *new_path)
{
    1dd8:	87aa                	mv	a5,a0
    1dda:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ddc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1de0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dea:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dec:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <unlink>:

int unlink(char *path)
{
    1df4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df6:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dfa:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dfe:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <uname>:
    register long a7 __asm__("a7") = n;
    1e08:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <brk>:
    register long a7 __asm__("a7") = n;
    1e14:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e20:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e22:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e26:	8082                	ret

0000000000001e28 <chdir>:
    register long a7 __asm__("a7") = n;
    1e28:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e34:	862e                	mv	a2,a1
    1e36:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e38:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e3e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e42:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e44:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e46:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <getdents>:
    register long a7 __asm__("a7") = n;
    1e4e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <pipe>:
    register long a7 __asm__("a7") = n;
    1e5a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e5e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e60:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <dup>:
    register long a7 __asm__("a7") = n;
    1e68:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e6a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <dup2>:
    register long a7 __asm__("a7") = n;
    1e72:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e74:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <mount>:
    register long a7 __asm__("a7") = n;
    1e7e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e82:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <umount>:
    register long a7 __asm__("a7") = n;
    1e8a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e98:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e9a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e9c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e9e:	8532                	mv	a0,a2
	mv a2, a4
    1ea0:	863a                	mv	a2,a4
	mv a3, a5
    1ea2:	86be                	mv	a3,a5
	mv a4, a6
    1ea4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea6:	0dc00893          	li	a7,220
	ecall
    1eaa:	00000073          	ecall

	beqz a0, 1f
    1eae:	c111                	beqz	a0,1eb2 <__clone+0x1a>
	# Parent
	ret
    1eb0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eb2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eb4:	6522                	ld	a0,8(sp)
	jalr a1
    1eb6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb8:	05d00893          	li	a7,93
	ecall
    1ebc:	00000073          	ecall
