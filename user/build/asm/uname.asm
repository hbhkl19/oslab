
/home/hbh/oslab/oslab/user/build/riscv64/uname:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_uname>:
	char domainname[65];
};

struct utsname un;

void test_uname() {
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ef250513          	add	a0,a0,-270 # 1ef8 <__clone+0x2e>
void test_uname() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	304000ef          	jal	1314 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	10450513          	add	a0,a0,260 # 2118 <__func__.0>
    101c:	2f8000ef          	jal	1314 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ef050513          	add	a0,a0,-272 # 1f10 <__clone+0x46>
    1028:	2ec000ef          	jal	1314 <puts>
	int test_ret = uname(&un);
    102c:	00001517          	auipc	a0,0x1
    1030:	f6450513          	add	a0,a0,-156 # 1f90 <un>
    1034:	607000ef          	jal	1e3a <uname>
	assert(test_ret >= 0);
    1038:	06054363          	bltz	a0,109e <test_uname+0x9a>

	printf("Uname: %s %s %s %s %s %s\n", 
    103c:	00001817          	auipc	a6,0x1
    1040:	09980813          	add	a6,a6,153 # 20d5 <un+0x145>
    1044:	00001797          	auipc	a5,0x1
    1048:	05078793          	add	a5,a5,80 # 2094 <un+0x104>
    104c:	00001717          	auipc	a4,0x1
    1050:	00770713          	add	a4,a4,7 # 2053 <un+0xc3>
    1054:	00001697          	auipc	a3,0x1
    1058:	fbe68693          	add	a3,a3,-66 # 2012 <un+0x82>
    105c:	00001617          	auipc	a2,0x1
    1060:	f7560613          	add	a2,a2,-139 # 1fd1 <un+0x41>
    1064:	00001597          	auipc	a1,0x1
    1068:	f2c58593          	add	a1,a1,-212 # 1f90 <un>
    106c:	00001517          	auipc	a0,0x1
    1070:	ed450513          	add	a0,a0,-300 # 1f40 <__clone+0x76>
    1074:	2c2000ef          	jal	1336 <printf>
		un.sysname, un.nodename, un.release, un.version, un.machine, un.domainname);

	TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	ee850513          	add	a0,a0,-280 # 1f60 <__clone+0x96>
    1080:	294000ef          	jal	1314 <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	09450513          	add	a0,a0,148 # 2118 <__func__.0>
    108c:	288000ef          	jal	1314 <puts>
}
    1090:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	e7e50513          	add	a0,a0,-386 # 1f10 <__clone+0x46>
}
    109a:	0141                	add	sp,sp,16
	TEST_END(__func__);
    109c:	aca5                	j	1314 <puts>
	assert(test_ret >= 0);
    109e:	00001517          	auipc	a0,0x1
    10a2:	e8250513          	add	a0,a0,-382 # 1f20 <__clone+0x56>
    10a6:	50a000ef          	jal	15b0 <panic>
    10aa:	bf49                	j	103c <test_uname+0x38>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	add	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
	test_uname();
    10b0:	f55ff0ef          	jal	1004 <test_uname>
	return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	add	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10be:	4108                	lw	a0,0(a0)
{
    10c0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	add	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	10ac <main>
    10ca:	3fd000ef          	jal	1cc6 <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	add	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	add	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	12054863          	bltz	a0,120a <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10de:	02b577bb          	remuw	a5,a0,a1
    10e2:	00001697          	auipc	a3,0x1
    10e6:	04668693          	add	a3,a3,70 # 2128 <digits>
    buf[16] = 0;
    10ea:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ee:	0005871b          	sext.w	a4,a1
    10f2:	1782                	sll	a5,a5,0x20
    10f4:	9381                	srl	a5,a5,0x20
    10f6:	97b6                	add	a5,a5,a3
    10f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10fc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1100:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1104:	1ab56663          	bltu	a0,a1,12b0 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1108:	02e8763b          	remuw	a2,a6,a4
    110c:	1602                	sll	a2,a2,0x20
    110e:	9201                	srl	a2,a2,0x20
    1110:	9636                	add	a2,a2,a3
    1112:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1116:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111e:	12e86c63          	bltu	a6,a4,1256 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1122:	02e5f63b          	remuw	a2,a1,a4
    1126:	1602                	sll	a2,a2,0x20
    1128:	9201                	srl	a2,a2,0x20
    112a:	9636                	add	a2,a2,a3
    112c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1130:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1134:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1138:	12e5e863          	bltu	a1,a4,1268 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    113c:	02e8763b          	remuw	a2,a6,a4
    1140:	1602                	sll	a2,a2,0x20
    1142:	9201                	srl	a2,a2,0x20
    1144:	9636                	add	a2,a2,a3
    1146:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1152:	12e86463          	bltu	a6,a4,127a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1156:	02e5f63b          	remuw	a2,a1,a4
    115a:	1602                	sll	a2,a2,0x20
    115c:	9201                	srl	a2,a2,0x20
    115e:	9636                	add	a2,a2,a3
    1160:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1164:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1168:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    116c:	12e5e063          	bltu	a1,a4,128c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1170:	02e8763b          	remuw	a2,a6,a4
    1174:	1602                	sll	a2,a2,0x20
    1176:	9201                	srl	a2,a2,0x20
    1178:	9636                	add	a2,a2,a3
    117a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1182:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1186:	0ae86f63          	bltu	a6,a4,1244 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    118a:	02e5f63b          	remuw	a2,a1,a4
    118e:	1602                	sll	a2,a2,0x20
    1190:	9201                	srl	a2,a2,0x20
    1192:	9636                	add	a2,a2,a3
    1194:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1198:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a0:	0ee5ef63          	bltu	a1,a4,129e <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11a4:	02e8763b          	remuw	a2,a6,a4
    11a8:	1602                	sll	a2,a2,0x20
    11aa:	9201                	srl	a2,a2,0x20
    11ac:	9636                	add	a2,a2,a3
    11ae:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ba:	0ee86d63          	bltu	a6,a4,12b4 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11be:	02e5f63b          	remuw	a2,a1,a4
    11c2:	1602                	sll	a2,a2,0x20
    11c4:	9201                	srl	a2,a2,0x20
    11c6:	9636                	add	a2,a2,a3
    11c8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11cc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d4:	0ee5e963          	bltu	a1,a4,12c6 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11d8:	1782                	sll	a5,a5,0x20
    11da:	9381                	srl	a5,a5,0x20
    11dc:	96be                	add	a3,a3,a5
    11de:	0006c783          	lbu	a5,0(a3)
    11e2:	4599                	li	a1,6
    11e4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e8:	00055763          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11ec:	02d00793          	li	a5,45
    11f0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11f4:	4595                	li	a1,5
    write(f, s, l);
    11f6:	003c                	add	a5,sp,8
    11f8:	4641                	li	a2,16
    11fa:	9e0d                	subw	a2,a2,a1
    11fc:	4505                	li	a0,1
    11fe:	95be                	add	a1,a1,a5
    1200:	26d000ef          	jal	1c6c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1204:	70a2                	ld	ra,40(sp)
    1206:	6145                	add	sp,sp,48
    1208:	8082                	ret
        x = -xx;
    120a:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    120e:	02b677bb          	remuw	a5,a2,a1
    1212:	00001697          	auipc	a3,0x1
    1216:	f1668693          	add	a3,a3,-234 # 2128 <digits>
    buf[16] = 0;
    121a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    121e:	0005871b          	sext.w	a4,a1
    1222:	1782                	sll	a5,a5,0x20
    1224:	9381                	srl	a5,a5,0x20
    1226:	97b6                	add	a5,a5,a3
    1228:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1230:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1234:	ecb67ae3          	bgeu	a2,a1,1108 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1238:	02d00793          	li	a5,45
    123c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1240:	45b9                	li	a1,14
    1242:	bf55                	j	11f6 <printint.constprop.0+0x120>
    1244:	45a9                	li	a1,10
    if (sign)
    1246:	fa0558e3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1252:	45a5                	li	a1,9
    1254:	b74d                	j	11f6 <printint.constprop.0+0x120>
    1256:	45b9                	li	a1,14
    if (sign)
    1258:	f8055fe3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1264:	45b5                	li	a1,13
    1266:	bf41                	j	11f6 <printint.constprop.0+0x120>
    1268:	45b5                	li	a1,13
    if (sign)
    126a:	f80556e3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1276:	45b1                	li	a1,12
    1278:	bfbd                	j	11f6 <printint.constprop.0+0x120>
    127a:	45b1                	li	a1,12
    if (sign)
    127c:	f6055de3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1288:	45ad                	li	a1,11
    128a:	b7b5                	j	11f6 <printint.constprop.0+0x120>
    128c:	45ad                	li	a1,11
    if (sign)
    128e:	f60554e3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    129a:	45a9                	li	a1,10
    129c:	bfa9                	j	11f6 <printint.constprop.0+0x120>
    129e:	45a5                	li	a1,9
    if (sign)
    12a0:	f4055be3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12ac:	45a1                	li	a1,8
    12ae:	b7a1                	j	11f6 <printint.constprop.0+0x120>
    i = 15;
    12b0:	45bd                	li	a1,15
    12b2:	b791                	j	11f6 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12b4:	45a1                	li	a1,8
    if (sign)
    12b6:	f40550e3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12c2:	459d                	li	a1,7
    12c4:	bf0d                	j	11f6 <printint.constprop.0+0x120>
    12c6:	459d                	li	a1,7
    if (sign)
    12c8:	f20557e3          	bgez	a0,11f6 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12d4:	4599                	li	a1,6
    12d6:	b705                	j	11f6 <printint.constprop.0+0x120>

00000000000012d8 <getchar>:
{
    12d8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12da:	00f10593          	add	a1,sp,15
    12de:	4605                	li	a2,1
    12e0:	4501                	li	a0,0
{
    12e2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12e4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e8:	17b000ef          	jal	1c62 <read>
}
    12ec:	60e2                	ld	ra,24(sp)
    12ee:	00f14503          	lbu	a0,15(sp)
    12f2:	6105                	add	sp,sp,32
    12f4:	8082                	ret

00000000000012f6 <putchar>:
{
    12f6:	1101                	add	sp,sp,-32
    12f8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12fa:	00f10593          	add	a1,sp,15
    12fe:	4605                	li	a2,1
    1300:	4505                	li	a0,1
{
    1302:	ec06                	sd	ra,24(sp)
    char byte = c;
    1304:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1308:	165000ef          	jal	1c6c <write>
}
    130c:	60e2                	ld	ra,24(sp)
    130e:	2501                	sext.w	a0,a0
    1310:	6105                	add	sp,sp,32
    1312:	8082                	ret

0000000000001314 <puts>:
{
    1314:	1141                	add	sp,sp,-16
    1316:	e406                	sd	ra,8(sp)
    1318:	e022                	sd	s0,0(sp)
    131a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    131c:	574000ef          	jal	1890 <strlen>
    1320:	862a                	mv	a2,a0
    1322:	85a2                	mv	a1,s0
    1324:	4505                	li	a0,1
    1326:	147000ef          	jal	1c6c <write>
}
    132a:	60a2                	ld	ra,8(sp)
    132c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    132e:	957d                	sra	a0,a0,0x3f
    return r;
    1330:	2501                	sext.w	a0,a0
}
    1332:	0141                	add	sp,sp,16
    1334:	8082                	ret

0000000000001336 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1336:	7171                	add	sp,sp,-176
    1338:	f85a                	sd	s6,48(sp)
    133a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    133c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    133e:	18bc                	add	a5,sp,120
{
    1340:	e8ca                	sd	s2,80(sp)
    1342:	e4ce                	sd	s3,72(sp)
    1344:	e0d2                	sd	s4,64(sp)
    1346:	fc56                	sd	s5,56(sp)
    1348:	f486                	sd	ra,104(sp)
    134a:	f0a2                	sd	s0,96(sp)
    134c:	eca6                	sd	s1,88(sp)
    134e:	fcae                	sd	a1,120(sp)
    1350:	e132                	sd	a2,128(sp)
    1352:	e536                	sd	a3,136(sp)
    1354:	e93a                	sd	a4,144(sp)
    1356:	f142                	sd	a6,160(sp)
    1358:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    135a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    135c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1360:	07300a13          	li	s4,115
    1364:	07800a93          	li	s5,120
    buf[i++] = '0';
    1368:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    136c:	00001997          	auipc	s3,0x1
    1370:	dbc98993          	add	s3,s3,-580 # 2128 <digits>
        if (!*s)
    1374:	00054783          	lbu	a5,0(a0)
    1378:	16078a63          	beqz	a5,14ec <printf+0x1b6>
    137c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    137e:	19278d63          	beq	a5,s2,1518 <printf+0x1e2>
    1382:	00164783          	lbu	a5,1(a2)
    1386:	0605                	add	a2,a2,1
    1388:	fbfd                	bnez	a5,137e <printf+0x48>
    138a:	84b2                	mv	s1,a2
        l = z - a;
    138c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1390:	85aa                	mv	a1,a0
    1392:	8622                	mv	a2,s0
    1394:	4505                	li	a0,1
    1396:	0d7000ef          	jal	1c6c <write>
        if (l)
    139a:	1a041463          	bnez	s0,1542 <printf+0x20c>
        if (s[1] == 0)
    139e:	0014c783          	lbu	a5,1(s1)
    13a2:	14078563          	beqz	a5,14ec <printf+0x1b6>
        switch (s[1])
    13a6:	1b478063          	beq	a5,s4,1546 <printf+0x210>
    13aa:	14fa6b63          	bltu	s4,a5,1500 <printf+0x1ca>
    13ae:	06400713          	li	a4,100
    13b2:	1ee78063          	beq	a5,a4,1592 <printf+0x25c>
    13b6:	07000713          	li	a4,112
    13ba:	1ae79963          	bne	a5,a4,156c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13be:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13c4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c6:	631c                	ld	a5,0(a4)
    13c8:	0721                	add	a4,a4,8
    13ca:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13cc:	00479293          	sll	t0,a5,0x4
    13d0:	00879f93          	sll	t6,a5,0x8
    13d4:	00c79f13          	sll	t5,a5,0xc
    13d8:	01079e93          	sll	t4,a5,0x10
    13dc:	01479e13          	sll	t3,a5,0x14
    13e0:	01879313          	sll	t1,a5,0x18
    13e4:	01c79893          	sll	a7,a5,0x1c
    13e8:	02479813          	sll	a6,a5,0x24
    13ec:	02879513          	sll	a0,a5,0x28
    13f0:	02c79593          	sll	a1,a5,0x2c
    13f4:	03079693          	sll	a3,a5,0x30
    13f8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fc:	03c7d413          	srl	s0,a5,0x3c
    1400:	01c7d39b          	srlw	t2,a5,0x1c
    1404:	03c2d293          	srl	t0,t0,0x3c
    1408:	03cfdf93          	srl	t6,t6,0x3c
    140c:	03cf5f13          	srl	t5,t5,0x3c
    1410:	03cede93          	srl	t4,t4,0x3c
    1414:	03ce5e13          	srl	t3,t3,0x3c
    1418:	03c35313          	srl	t1,t1,0x3c
    141c:	03c8d893          	srl	a7,a7,0x3c
    1420:	03c85813          	srl	a6,a6,0x3c
    1424:	9171                	srl	a0,a0,0x3c
    1426:	91f1                	srl	a1,a1,0x3c
    1428:	92f1                	srl	a3,a3,0x3c
    142a:	9371                	srl	a4,a4,0x3c
    142c:	96ce                	add	a3,a3,s3
    142e:	974e                	add	a4,a4,s3
    1430:	944e                	add	s0,s0,s3
    1432:	92ce                	add	t0,t0,s3
    1434:	9fce                	add	t6,t6,s3
    1436:	9f4e                	add	t5,t5,s3
    1438:	9ece                	add	t4,t4,s3
    143a:	9e4e                	add	t3,t3,s3
    143c:	934e                	add	t1,t1,s3
    143e:	98ce                	add	a7,a7,s3
    1440:	93ce                	add	t2,t2,s3
    1442:	984e                	add	a6,a6,s3
    1444:	954e                	add	a0,a0,s3
    1446:	95ce                	add	a1,a1,s3
    1448:	0006c083          	lbu	ra,0(a3)
    144c:	0002c283          	lbu	t0,0(t0)
    1450:	00074683          	lbu	a3,0(a4)
    1454:	000fcf83          	lbu	t6,0(t6)
    1458:	000f4f03          	lbu	t5,0(t5)
    145c:	000ece83          	lbu	t4,0(t4)
    1460:	000e4e03          	lbu	t3,0(t3)
    1464:	00034303          	lbu	t1,0(t1)
    1468:	0008c883          	lbu	a7,0(a7)
    146c:	0003c383          	lbu	t2,0(t2)
    1470:	00084803          	lbu	a6,0(a6)
    1474:	00054503          	lbu	a0,0(a0)
    1478:	0005c583          	lbu	a1,0(a1)
    147c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1480:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1484:	9371                	srl	a4,a4,0x3c
    1486:	8bbd                	and	a5,a5,15
    1488:	974e                	add	a4,a4,s3
    148a:	97ce                	add	a5,a5,s3
    148c:	005105a3          	sb	t0,11(sp)
    1490:	01f10623          	sb	t6,12(sp)
    1494:	01e106a3          	sb	t5,13(sp)
    1498:	01d10723          	sb	t4,14(sp)
    149c:	01c107a3          	sb	t3,15(sp)
    14a0:	00610823          	sb	t1,16(sp)
    14a4:	011108a3          	sb	a7,17(sp)
    14a8:	00710923          	sb	t2,18(sp)
    14ac:	010109a3          	sb	a6,19(sp)
    14b0:	00a10a23          	sb	a0,20(sp)
    14b4:	00b10aa3          	sb	a1,21(sp)
    14b8:	00110b23          	sb	ra,22(sp)
    14bc:	00d10ba3          	sb	a3,23(sp)
    14c0:	00810523          	sb	s0,10(sp)
    14c4:	00074703          	lbu	a4,0(a4)
    14c8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14cc:	002c                	add	a1,sp,8
    14ce:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d0:	00e10c23          	sb	a4,24(sp)
    14d4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14dc:	790000ef          	jal	1c6c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14e0:	00248513          	add	a0,s1,2
        if (!*s)
    14e4:	00054783          	lbu	a5,0(a0)
    14e8:	e8079ae3          	bnez	a5,137c <printf+0x46>
    }
    va_end(ap);
}
    14ec:	70a6                	ld	ra,104(sp)
    14ee:	7406                	ld	s0,96(sp)
    14f0:	64e6                	ld	s1,88(sp)
    14f2:	6946                	ld	s2,80(sp)
    14f4:	69a6                	ld	s3,72(sp)
    14f6:	6a06                	ld	s4,64(sp)
    14f8:	7ae2                	ld	s5,56(sp)
    14fa:	7b42                	ld	s6,48(sp)
    14fc:	614d                	add	sp,sp,176
    14fe:	8082                	ret
        switch (s[1])
    1500:	07579663          	bne	a5,s5,156c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1504:	6782                	ld	a5,0(sp)
    1506:	45c1                	li	a1,16
    1508:	4388                	lw	a0,0(a5)
    150a:	07a1                	add	a5,a5,8
    150c:	e03e                	sd	a5,0(sp)
    150e:	bc9ff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    1512:	00248513          	add	a0,s1,2
    1516:	b7f9                	j	14e4 <printf+0x1ae>
    1518:	84b2                	mv	s1,a2
    151a:	a039                	j	1528 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    151c:	0024c783          	lbu	a5,2(s1)
    1520:	0605                	add	a2,a2,1
    1522:	0489                	add	s1,s1,2
    1524:	e72794e3          	bne	a5,s2,138c <printf+0x56>
    1528:	0014c783          	lbu	a5,1(s1)
    152c:	ff2788e3          	beq	a5,s2,151c <printf+0x1e6>
        l = z - a;
    1530:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1534:	85aa                	mv	a1,a0
    1536:	8622                	mv	a2,s0
    1538:	4505                	li	a0,1
    153a:	732000ef          	jal	1c6c <write>
        if (l)
    153e:	e60400e3          	beqz	s0,139e <printf+0x68>
    1542:	8526                	mv	a0,s1
    1544:	bd05                	j	1374 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1546:	6782                	ld	a5,0(sp)
    1548:	6380                	ld	s0,0(a5)
    154a:	07a1                	add	a5,a5,8
    154c:	e03e                	sd	a5,0(sp)
    154e:	cc21                	beqz	s0,15a6 <printf+0x270>
            l = strnlen(a, 200);
    1550:	0c800593          	li	a1,200
    1554:	8522                	mv	a0,s0
    1556:	424000ef          	jal	197a <strnlen>
    write(f, s, l);
    155a:	0005061b          	sext.w	a2,a0
    155e:	85a2                	mv	a1,s0
    1560:	4505                	li	a0,1
    1562:	70a000ef          	jal	1c6c <write>
        s += 2;
    1566:	00248513          	add	a0,s1,2
    156a:	bfad                	j	14e4 <printf+0x1ae>
    return write(stdout, &byte, 1);
    156c:	4605                	li	a2,1
    156e:	002c                	add	a1,sp,8
    1570:	4505                	li	a0,1
    char byte = c;
    1572:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1576:	6f6000ef          	jal	1c6c <write>
    char byte = c;
    157a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	add	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1588:	6e4000ef          	jal	1c6c <write>
        s += 2;
    158c:	00248513          	add	a0,s1,2
    1590:	bf91                	j	14e4 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1592:	6782                	ld	a5,0(sp)
    1594:	45a9                	li	a1,10
    1596:	4388                	lw	a0,0(a5)
    1598:	07a1                	add	a5,a5,8
    159a:	e03e                	sd	a5,0(sp)
    159c:	b3bff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    15a0:	00248513          	add	a0,s1,2
    15a4:	b781                	j	14e4 <printf+0x1ae>
                a = "(null)";
    15a6:	00001417          	auipc	s0,0x1
    15aa:	9ca40413          	add	s0,s0,-1590 # 1f70 <__clone+0xa6>
    15ae:	b74d                	j	1550 <printf+0x21a>

00000000000015b0 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15b0:	1141                	add	sp,sp,-16
    15b2:	e406                	sd	ra,8(sp)
    puts(m);
    15b4:	d61ff0ef          	jal	1314 <puts>
    exit(-100);
}
    15b8:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ba:	f9c00513          	li	a0,-100
}
    15be:	0141                	add	sp,sp,16
    exit(-100);
    15c0:	a719                	j	1cc6 <exit>

00000000000015c2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000793          	li	a5,32
    15c6:	00f50663          	beq	a0,a5,15d2 <isspace+0x10>
    15ca:	355d                	addw	a0,a0,-9
    15cc:	00553513          	sltiu	a0,a0,5
    15d0:	8082                	ret
    15d2:	4505                	li	a0,1
}
    15d4:	8082                	ret

00000000000015d6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d6:	fd05051b          	addw	a0,a0,-48
}
    15da:	00a53513          	sltiu	a0,a0,10
    15de:	8082                	ret

00000000000015e0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e0:	02000693          	li	a3,32
    15e4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ea:	ff77871b          	addw	a4,a5,-9
    15ee:	04d78c63          	beq	a5,a3,1646 <atoi+0x66>
    15f2:	0007861b          	sext.w	a2,a5
    15f6:	04e5f863          	bgeu	a1,a4,1646 <atoi+0x66>
        s++;
    switch (*s)
    15fa:	02b00713          	li	a4,43
    15fe:	04e78963          	beq	a5,a4,1650 <atoi+0x70>
    1602:	02d00713          	li	a4,45
    1606:	06e78263          	beq	a5,a4,166a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    160a:	fd06069b          	addw	a3,a2,-48
    160e:	47a5                	li	a5,9
    1610:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1612:	4301                	li	t1,0
    while (isdigit(*s))
    1614:	04d7e963          	bltu	a5,a3,1666 <atoi+0x86>
    int n = 0, neg = 0;
    1618:	4501                	li	a0,0
    while (isdigit(*s))
    161a:	48a5                	li	a7,9
    161c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1620:	0025179b          	sllw	a5,a0,0x2
    1624:	9fa9                	addw	a5,a5,a0
    1626:	fd06059b          	addw	a1,a2,-48
    162a:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    162e:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1632:	0705                	add	a4,a4,1
    1634:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1638:	0006861b          	sext.w	a2,a3
    163c:	ff08f0e3          	bgeu	a7,a6,161c <atoi+0x3c>
    return neg ? n : -n;
    1640:	00030563          	beqz	t1,164a <atoi+0x6a>
}
    1644:	8082                	ret
        s++;
    1646:	0505                	add	a0,a0,1
    1648:	bf79                	j	15e6 <atoi+0x6>
    return neg ? n : -n;
    164a:	40f5853b          	subw	a0,a1,a5
    164e:	8082                	ret
    while (isdigit(*s))
    1650:	00154603          	lbu	a2,1(a0)
    1654:	47a5                	li	a5,9
        s++;
    1656:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    165a:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    165e:	4301                	li	t1,0
    while (isdigit(*s))
    1660:	2601                	sext.w	a2,a2
    1662:	fad7fbe3          	bgeu	a5,a3,1618 <atoi+0x38>
    1666:	4501                	li	a0,0
}
    1668:	8082                	ret
    while (isdigit(*s))
    166a:	00154603          	lbu	a2,1(a0)
    166e:	47a5                	li	a5,9
        s++;
    1670:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1674:	fd06069b          	addw	a3,a2,-48
    1678:	2601                	sext.w	a2,a2
    167a:	fed7e6e3          	bltu	a5,a3,1666 <atoi+0x86>
        neg = 1;
    167e:	4305                	li	t1,1
    1680:	bf61                	j	1618 <atoi+0x38>

0000000000001682 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1682:	18060163          	beqz	a2,1804 <memset+0x182>
    1686:	40a006b3          	neg	a3,a0
    168a:	0076f793          	and	a5,a3,7
    168e:	00778813          	add	a6,a5,7
    1692:	48ad                	li	a7,11
    1694:	0ff5f713          	zext.b	a4,a1
    1698:	fff60593          	add	a1,a2,-1
    169c:	17186563          	bltu	a6,a7,1806 <memset+0x184>
    16a0:	1705ed63          	bltu	a1,a6,181a <memset+0x198>
    16a4:	16078363          	beqz	a5,180a <memset+0x188>
    16a8:	00e50023          	sb	a4,0(a0)
    16ac:	0066f593          	and	a1,a3,6
    16b0:	16058063          	beqz	a1,1810 <memset+0x18e>
    16b4:	00e500a3          	sb	a4,1(a0)
    16b8:	4589                	li	a1,2
    16ba:	16f5f363          	bgeu	a1,a5,1820 <memset+0x19e>
    16be:	00e50123          	sb	a4,2(a0)
    16c2:	8a91                	and	a3,a3,4
    16c4:	00350593          	add	a1,a0,3
    16c8:	4e0d                	li	t3,3
    16ca:	ce9d                	beqz	a3,1708 <memset+0x86>
    16cc:	00e501a3          	sb	a4,3(a0)
    16d0:	4691                	li	a3,4
    16d2:	00450593          	add	a1,a0,4
    16d6:	4e11                	li	t3,4
    16d8:	02f6f863          	bgeu	a3,a5,1708 <memset+0x86>
    16dc:	00e50223          	sb	a4,4(a0)
    16e0:	4695                	li	a3,5
    16e2:	00550593          	add	a1,a0,5
    16e6:	4e15                	li	t3,5
    16e8:	02d78063          	beq	a5,a3,1708 <memset+0x86>
    16ec:	fff50693          	add	a3,a0,-1
    16f0:	00e502a3          	sb	a4,5(a0)
    16f4:	8a9d                	and	a3,a3,7
    16f6:	00650593          	add	a1,a0,6
    16fa:	4e19                	li	t3,6
    16fc:	e691                	bnez	a3,1708 <memset+0x86>
    16fe:	00750593          	add	a1,a0,7
    1702:	00e50323          	sb	a4,6(a0)
    1706:	4e1d                	li	t3,7
    1708:	00871693          	sll	a3,a4,0x8
    170c:	01071813          	sll	a6,a4,0x10
    1710:	8ed9                	or	a3,a3,a4
    1712:	01871893          	sll	a7,a4,0x18
    1716:	0106e6b3          	or	a3,a3,a6
    171a:	0116e6b3          	or	a3,a3,a7
    171e:	02071813          	sll	a6,a4,0x20
    1722:	02871313          	sll	t1,a4,0x28
    1726:	0106e6b3          	or	a3,a3,a6
    172a:	40f608b3          	sub	a7,a2,a5
    172e:	03071813          	sll	a6,a4,0x30
    1732:	0066e6b3          	or	a3,a3,t1
    1736:	0106e6b3          	or	a3,a3,a6
    173a:	03871313          	sll	t1,a4,0x38
    173e:	97aa                	add	a5,a5,a0
    1740:	ff88f813          	and	a6,a7,-8
    1744:	0066e6b3          	or	a3,a3,t1
    1748:	983e                	add	a6,a6,a5
    174a:	e394                	sd	a3,0(a5)
    174c:	07a1                	add	a5,a5,8
    174e:	ff079ee3          	bne	a5,a6,174a <memset+0xc8>
    1752:	ff88f793          	and	a5,a7,-8
    1756:	0078f893          	and	a7,a7,7
    175a:	00f586b3          	add	a3,a1,a5
    175e:	01c787bb          	addw	a5,a5,t3
    1762:	0a088b63          	beqz	a7,1818 <memset+0x196>
    1766:	00e68023          	sb	a4,0(a3)
    176a:	0017859b          	addw	a1,a5,1
    176e:	08c5fb63          	bgeu	a1,a2,1804 <memset+0x182>
    1772:	00e680a3          	sb	a4,1(a3)
    1776:	0027859b          	addw	a1,a5,2
    177a:	08c5f563          	bgeu	a1,a2,1804 <memset+0x182>
    177e:	00e68123          	sb	a4,2(a3)
    1782:	0037859b          	addw	a1,a5,3
    1786:	06c5ff63          	bgeu	a1,a2,1804 <memset+0x182>
    178a:	00e681a3          	sb	a4,3(a3)
    178e:	0047859b          	addw	a1,a5,4
    1792:	06c5f963          	bgeu	a1,a2,1804 <memset+0x182>
    1796:	00e68223          	sb	a4,4(a3)
    179a:	0057859b          	addw	a1,a5,5
    179e:	06c5f363          	bgeu	a1,a2,1804 <memset+0x182>
    17a2:	00e682a3          	sb	a4,5(a3)
    17a6:	0067859b          	addw	a1,a5,6
    17aa:	04c5fd63          	bgeu	a1,a2,1804 <memset+0x182>
    17ae:	00e68323          	sb	a4,6(a3)
    17b2:	0077859b          	addw	a1,a5,7
    17b6:	04c5f763          	bgeu	a1,a2,1804 <memset+0x182>
    17ba:	00e683a3          	sb	a4,7(a3)
    17be:	0087859b          	addw	a1,a5,8
    17c2:	04c5f163          	bgeu	a1,a2,1804 <memset+0x182>
    17c6:	00e68423          	sb	a4,8(a3)
    17ca:	0097859b          	addw	a1,a5,9
    17ce:	02c5fb63          	bgeu	a1,a2,1804 <memset+0x182>
    17d2:	00e684a3          	sb	a4,9(a3)
    17d6:	00a7859b          	addw	a1,a5,10
    17da:	02c5f563          	bgeu	a1,a2,1804 <memset+0x182>
    17de:	00e68523          	sb	a4,10(a3)
    17e2:	00b7859b          	addw	a1,a5,11
    17e6:	00c5ff63          	bgeu	a1,a2,1804 <memset+0x182>
    17ea:	00e685a3          	sb	a4,11(a3)
    17ee:	00c7859b          	addw	a1,a5,12
    17f2:	00c5f963          	bgeu	a1,a2,1804 <memset+0x182>
    17f6:	00e68623          	sb	a4,12(a3)
    17fa:	27b5                	addw	a5,a5,13
    17fc:	00c7f463          	bgeu	a5,a2,1804 <memset+0x182>
    1800:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1804:	8082                	ret
    1806:	482d                	li	a6,11
    1808:	bd61                	j	16a0 <memset+0x1e>
    char *p = dest;
    180a:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180c:	4e01                	li	t3,0
    180e:	bded                	j	1708 <memset+0x86>
    1810:	00150593          	add	a1,a0,1
    1814:	4e05                	li	t3,1
    1816:	bdcd                	j	1708 <memset+0x86>
    1818:	8082                	ret
    char *p = dest;
    181a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181c:	4781                	li	a5,0
    181e:	b7a1                	j	1766 <memset+0xe4>
    1820:	00250593          	add	a1,a0,2
    1824:	4e09                	li	t3,2
    1826:	b5cd                	j	1708 <memset+0x86>

0000000000001828 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1828:	00054783          	lbu	a5,0(a0)
    182c:	0005c703          	lbu	a4,0(a1)
    1830:	00e79863          	bne	a5,a4,1840 <strcmp+0x18>
    1834:	0505                	add	a0,a0,1
    1836:	0585                	add	a1,a1,1
    1838:	fbe5                	bnez	a5,1828 <strcmp>
    183a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1840:	0007851b          	sext.w	a0,a5
    1844:	bfe5                	j	183c <strcmp+0x14>

0000000000001846 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1846:	ca15                	beqz	a2,187a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1848:	00054783          	lbu	a5,0(a0)
    if (!n--)
    184c:	167d                	add	a2,a2,-1
    184e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1852:	eb99                	bnez	a5,1868 <strncmp+0x22>
    1854:	a815                	j	1888 <strncmp+0x42>
    1856:	00a68e63          	beq	a3,a0,1872 <strncmp+0x2c>
    185a:	0505                	add	a0,a0,1
    185c:	00f71b63          	bne	a4,a5,1872 <strncmp+0x2c>
    1860:	00054783          	lbu	a5,0(a0)
    1864:	cf89                	beqz	a5,187e <strncmp+0x38>
    1866:	85b2                	mv	a1,a2
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	00158613          	add	a2,a1,1
    1870:	f37d                	bnez	a4,1856 <strncmp+0x10>
        ;
    return *l - *r;
    1872:	0007851b          	sext.w	a0,a5
    1876:	9d19                	subw	a0,a0,a4
    1878:	8082                	ret
        return 0;
    187a:	4501                	li	a0,0
}
    187c:	8082                	ret
    return *l - *r;
    187e:	0015c703          	lbu	a4,1(a1)
    1882:	4501                	li	a0,0
    1884:	9d19                	subw	a0,a0,a4
    1886:	8082                	ret
    1888:	0005c703          	lbu	a4,0(a1)
    188c:	4501                	li	a0,0
    188e:	b7e5                	j	1876 <strncmp+0x30>

0000000000001890 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1890:	00757793          	and	a5,a0,7
    1894:	cf89                	beqz	a5,18ae <strlen+0x1e>
    1896:	87aa                	mv	a5,a0
    1898:	a029                	j	18a2 <strlen+0x12>
    189a:	0785                	add	a5,a5,1
    189c:	0077f713          	and	a4,a5,7
    18a0:	cb01                	beqz	a4,18b0 <strlen+0x20>
        if (!*s)
    18a2:	0007c703          	lbu	a4,0(a5)
    18a6:	fb75                	bnez	a4,189a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a8:	40a78533          	sub	a0,a5,a0
}
    18ac:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ae:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18b0:	6394                	ld	a3,0(a5)
    18b2:	00000597          	auipc	a1,0x0
    18b6:	6c65b583          	ld	a1,1734(a1) # 1f78 <__clone+0xae>
    18ba:	00000617          	auipc	a2,0x0
    18be:	6c663603          	ld	a2,1734(a2) # 1f80 <__clone+0xb6>
    18c2:	a019                	j	18c8 <strlen+0x38>
    18c4:	6794                	ld	a3,8(a5)
    18c6:	07a1                	add	a5,a5,8
    18c8:	00b68733          	add	a4,a3,a1
    18cc:	fff6c693          	not	a3,a3
    18d0:	8f75                	and	a4,a4,a3
    18d2:	8f71                	and	a4,a4,a2
    18d4:	db65                	beqz	a4,18c4 <strlen+0x34>
    for (; *s; s++)
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	d779                	beqz	a4,18a8 <strlen+0x18>
    18dc:	0017c703          	lbu	a4,1(a5)
    18e0:	0785                	add	a5,a5,1
    18e2:	d379                	beqz	a4,18a8 <strlen+0x18>
    18e4:	0017c703          	lbu	a4,1(a5)
    18e8:	0785                	add	a5,a5,1
    18ea:	fb6d                	bnez	a4,18dc <strlen+0x4c>
    18ec:	bf75                	j	18a8 <strlen+0x18>

00000000000018ee <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ee:	00757713          	and	a4,a0,7
{
    18f2:	87aa                	mv	a5,a0
    18f4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f8:	cb19                	beqz	a4,190e <memchr+0x20>
    18fa:	ce25                	beqz	a2,1972 <memchr+0x84>
    18fc:	0007c703          	lbu	a4,0(a5)
    1900:	00b70763          	beq	a4,a1,190e <memchr+0x20>
    1904:	0785                	add	a5,a5,1
    1906:	0077f713          	and	a4,a5,7
    190a:	167d                	add	a2,a2,-1
    190c:	f77d                	bnez	a4,18fa <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190e:	4501                	li	a0,0
    if (n && *s != c)
    1910:	c235                	beqz	a2,1974 <memchr+0x86>
    1912:	0007c703          	lbu	a4,0(a5)
    1916:	06b70063          	beq	a4,a1,1976 <memchr+0x88>
        size_t k = ONES * c;
    191a:	00000517          	auipc	a0,0x0
    191e:	66e53503          	ld	a0,1646(a0) # 1f88 <__clone+0xbe>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1922:	471d                	li	a4,7
        size_t k = ONES * c;
    1924:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1928:	04c77763          	bgeu	a4,a2,1976 <memchr+0x88>
    192c:	00000897          	auipc	a7,0x0
    1930:	64c8b883          	ld	a7,1612(a7) # 1f78 <__clone+0xae>
    1934:	00000817          	auipc	a6,0x0
    1938:	64c83803          	ld	a6,1612(a6) # 1f80 <__clone+0xb6>
    193c:	431d                	li	t1,7
    193e:	a029                	j	1948 <memchr+0x5a>
    1940:	1661                	add	a2,a2,-8
    1942:	07a1                	add	a5,a5,8
    1944:	00c37c63          	bgeu	t1,a2,195c <memchr+0x6e>
    1948:	6398                	ld	a4,0(a5)
    194a:	8f29                	xor	a4,a4,a0
    194c:	011706b3          	add	a3,a4,a7
    1950:	fff74713          	not	a4,a4
    1954:	8f75                	and	a4,a4,a3
    1956:	01077733          	and	a4,a4,a6
    195a:	d37d                	beqz	a4,1940 <memchr+0x52>
    195c:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    195e:	e601                	bnez	a2,1966 <memchr+0x78>
    1960:	a809                	j	1972 <memchr+0x84>
    1962:	0505                	add	a0,a0,1
    1964:	c619                	beqz	a2,1972 <memchr+0x84>
    1966:	00054783          	lbu	a5,0(a0)
    196a:	167d                	add	a2,a2,-1
    196c:	feb79be3          	bne	a5,a1,1962 <memchr+0x74>
    1970:	8082                	ret
    return n ? (void *)s : 0;
    1972:	4501                	li	a0,0
}
    1974:	8082                	ret
    if (n && *s != c)
    1976:	853e                	mv	a0,a5
    1978:	b7fd                	j	1966 <memchr+0x78>

000000000000197a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    197a:	1101                	add	sp,sp,-32
    197c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    197e:	862e                	mv	a2,a1
{
    1980:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1982:	4581                	li	a1,0
{
    1984:	e426                	sd	s1,8(sp)
    1986:	ec06                	sd	ra,24(sp)
    1988:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    198a:	f65ff0ef          	jal	18ee <memchr>
    return p ? p - s : n;
    198e:	c519                	beqz	a0,199c <strnlen+0x22>
}
    1990:	60e2                	ld	ra,24(sp)
    1992:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1994:	8d05                	sub	a0,a0,s1
}
    1996:	64a2                	ld	s1,8(sp)
    1998:	6105                	add	sp,sp,32
    199a:	8082                	ret
    199c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    199e:	8522                	mv	a0,s0
}
    19a0:	6442                	ld	s0,16(sp)
    19a2:	64a2                	ld	s1,8(sp)
    19a4:	6105                	add	sp,sp,32
    19a6:	8082                	ret

00000000000019a8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a8:	00a5c7b3          	xor	a5,a1,a0
    19ac:	8b9d                	and	a5,a5,7
    19ae:	eb95                	bnez	a5,19e2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b0:	0075f793          	and	a5,a1,7
    19b4:	e7b1                	bnez	a5,1a00 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b6:	6198                	ld	a4,0(a1)
    19b8:	00000617          	auipc	a2,0x0
    19bc:	5c063603          	ld	a2,1472(a2) # 1f78 <__clone+0xae>
    19c0:	00000817          	auipc	a6,0x0
    19c4:	5c083803          	ld	a6,1472(a6) # 1f80 <__clone+0xb6>
    19c8:	a029                	j	19d2 <strcpy+0x2a>
    19ca:	05a1                	add	a1,a1,8
    19cc:	e118                	sd	a4,0(a0)
    19ce:	6198                	ld	a4,0(a1)
    19d0:	0521                	add	a0,a0,8
    19d2:	00c707b3          	add	a5,a4,a2
    19d6:	fff74693          	not	a3,a4
    19da:	8ff5                	and	a5,a5,a3
    19dc:	0107f7b3          	and	a5,a5,a6
    19e0:	d7ed                	beqz	a5,19ca <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19e2:	0005c783          	lbu	a5,0(a1)
    19e6:	00f50023          	sb	a5,0(a0)
    19ea:	c785                	beqz	a5,1a12 <strcpy+0x6a>
    19ec:	0015c783          	lbu	a5,1(a1)
    19f0:	0505                	add	a0,a0,1
    19f2:	0585                	add	a1,a1,1
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	fbf5                	bnez	a5,19ec <strcpy+0x44>
        ;
    return d;
}
    19fa:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19fc:	0505                	add	a0,a0,1
    19fe:	df45                	beqz	a4,19b6 <strcpy+0xe>
            if (!(*d = *s))
    1a00:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a04:	0585                	add	a1,a1,1
    1a06:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a0a:	00f50023          	sb	a5,0(a0)
    1a0e:	f7fd                	bnez	a5,19fc <strcpy+0x54>
}
    1a10:	8082                	ret
    1a12:	8082                	ret

0000000000001a14 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a14:	00a5c7b3          	xor	a5,a1,a0
    1a18:	8b9d                	and	a5,a5,7
    1a1a:	e3b5                	bnez	a5,1a7e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a1c:	0075f793          	and	a5,a1,7
    1a20:	cf99                	beqz	a5,1a3e <strncpy+0x2a>
    1a22:	ea09                	bnez	a2,1a34 <strncpy+0x20>
    1a24:	a421                	j	1c2c <strncpy+0x218>
    1a26:	0585                	add	a1,a1,1
    1a28:	0075f793          	and	a5,a1,7
    1a2c:	167d                	add	a2,a2,-1
    1a2e:	0505                	add	a0,a0,1
    1a30:	c799                	beqz	a5,1a3e <strncpy+0x2a>
    1a32:	c225                	beqz	a2,1a92 <strncpy+0x7e>
    1a34:	0005c783          	lbu	a5,0(a1)
    1a38:	00f50023          	sb	a5,0(a0)
    1a3c:	f7ed                	bnez	a5,1a26 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a3e:	ca31                	beqz	a2,1a92 <strncpy+0x7e>
    1a40:	0005c783          	lbu	a5,0(a1)
    1a44:	cba1                	beqz	a5,1a94 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a46:	479d                	li	a5,7
    1a48:	02c7fc63          	bgeu	a5,a2,1a80 <strncpy+0x6c>
    1a4c:	00000897          	auipc	a7,0x0
    1a50:	52c8b883          	ld	a7,1324(a7) # 1f78 <__clone+0xae>
    1a54:	00000817          	auipc	a6,0x0
    1a58:	52c83803          	ld	a6,1324(a6) # 1f80 <__clone+0xb6>
    1a5c:	431d                	li	t1,7
    1a5e:	a039                	j	1a6c <strncpy+0x58>
            *wd = *ws;
    1a60:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a62:	1661                	add	a2,a2,-8
    1a64:	05a1                	add	a1,a1,8
    1a66:	0521                	add	a0,a0,8
    1a68:	00c37b63          	bgeu	t1,a2,1a7e <strncpy+0x6a>
    1a6c:	6198                	ld	a4,0(a1)
    1a6e:	011707b3          	add	a5,a4,a7
    1a72:	fff74693          	not	a3,a4
    1a76:	8ff5                	and	a5,a5,a3
    1a78:	0107f7b3          	and	a5,a5,a6
    1a7c:	d3f5                	beqz	a5,1a60 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a7e:	ca11                	beqz	a2,1a92 <strncpy+0x7e>
    1a80:	0005c783          	lbu	a5,0(a1)
    1a84:	0585                	add	a1,a1,1
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	c789                	beqz	a5,1a94 <strncpy+0x80>
    1a8c:	167d                	add	a2,a2,-1
    1a8e:	0505                	add	a0,a0,1
    1a90:	fa65                	bnez	a2,1a80 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a92:	8082                	ret
    1a94:	4805                	li	a6,1
    1a96:	14061b63          	bnez	a2,1bec <strncpy+0x1d8>
    1a9a:	40a00733          	neg	a4,a0
    1a9e:	00777793          	and	a5,a4,7
    1aa2:	4581                	li	a1,0
    1aa4:	12061c63          	bnez	a2,1bdc <strncpy+0x1c8>
    1aa8:	00778693          	add	a3,a5,7
    1aac:	48ad                	li	a7,11
    1aae:	1316e563          	bltu	a3,a7,1bd8 <strncpy+0x1c4>
    1ab2:	16d5e263          	bltu	a1,a3,1c16 <strncpy+0x202>
    1ab6:	14078c63          	beqz	a5,1c0e <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aba:	00050023          	sb	zero,0(a0)
    1abe:	00677693          	and	a3,a4,6
    1ac2:	14068263          	beqz	a3,1c06 <strncpy+0x1f2>
    1ac6:	000500a3          	sb	zero,1(a0)
    1aca:	4689                	li	a3,2
    1acc:	14f6f863          	bgeu	a3,a5,1c1c <strncpy+0x208>
    1ad0:	00050123          	sb	zero,2(a0)
    1ad4:	8b11                	and	a4,a4,4
    1ad6:	12070463          	beqz	a4,1bfe <strncpy+0x1ea>
    1ada:	000501a3          	sb	zero,3(a0)
    1ade:	4711                	li	a4,4
    1ae0:	00450693          	add	a3,a0,4
    1ae4:	02f77563          	bgeu	a4,a5,1b0e <strncpy+0xfa>
    1ae8:	00050223          	sb	zero,4(a0)
    1aec:	4715                	li	a4,5
    1aee:	00550693          	add	a3,a0,5
    1af2:	00e78e63          	beq	a5,a4,1b0e <strncpy+0xfa>
    1af6:	fff50713          	add	a4,a0,-1
    1afa:	000502a3          	sb	zero,5(a0)
    1afe:	8b1d                	and	a4,a4,7
    1b00:	12071263          	bnez	a4,1c24 <strncpy+0x210>
    1b04:	00750693          	add	a3,a0,7
    1b08:	00050323          	sb	zero,6(a0)
    1b0c:	471d                	li	a4,7
    1b0e:	40f80833          	sub	a6,a6,a5
    1b12:	ff887593          	and	a1,a6,-8
    1b16:	97aa                	add	a5,a5,a0
    1b18:	95be                	add	a1,a1,a5
    1b1a:	0007b023          	sd	zero,0(a5)
    1b1e:	07a1                	add	a5,a5,8
    1b20:	feb79de3          	bne	a5,a1,1b1a <strncpy+0x106>
    1b24:	ff887593          	and	a1,a6,-8
    1b28:	00787813          	and	a6,a6,7
    1b2c:	00e587bb          	addw	a5,a1,a4
    1b30:	00b68733          	add	a4,a3,a1
    1b34:	0e080063          	beqz	a6,1c14 <strncpy+0x200>
    1b38:	00070023          	sb	zero,0(a4)
    1b3c:	0017869b          	addw	a3,a5,1
    1b40:	f4c6f9e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b44:	000700a3          	sb	zero,1(a4)
    1b48:	0027869b          	addw	a3,a5,2
    1b4c:	f4c6f3e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b50:	00070123          	sb	zero,2(a4)
    1b54:	0037869b          	addw	a3,a5,3
    1b58:	f2c6fde3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b5c:	000701a3          	sb	zero,3(a4)
    1b60:	0047869b          	addw	a3,a5,4
    1b64:	f2c6f7e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b68:	00070223          	sb	zero,4(a4)
    1b6c:	0057869b          	addw	a3,a5,5
    1b70:	f2c6f1e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b74:	000702a3          	sb	zero,5(a4)
    1b78:	0067869b          	addw	a3,a5,6
    1b7c:	f0c6fbe3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b80:	00070323          	sb	zero,6(a4)
    1b84:	0077869b          	addw	a3,a5,7
    1b88:	f0c6f5e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b8c:	000703a3          	sb	zero,7(a4)
    1b90:	0087869b          	addw	a3,a5,8
    1b94:	eec6ffe3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1b98:	00070423          	sb	zero,8(a4)
    1b9c:	0097869b          	addw	a3,a5,9
    1ba0:	eec6f9e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1ba4:	000704a3          	sb	zero,9(a4)
    1ba8:	00a7869b          	addw	a3,a5,10
    1bac:	eec6f3e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1bb0:	00070523          	sb	zero,10(a4)
    1bb4:	00b7869b          	addw	a3,a5,11
    1bb8:	ecc6fde3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1bbc:	000705a3          	sb	zero,11(a4)
    1bc0:	00c7869b          	addw	a3,a5,12
    1bc4:	ecc6f7e3          	bgeu	a3,a2,1a92 <strncpy+0x7e>
    1bc8:	00070623          	sb	zero,12(a4)
    1bcc:	27b5                	addw	a5,a5,13
    1bce:	ecc7f2e3          	bgeu	a5,a2,1a92 <strncpy+0x7e>
    1bd2:	000706a3          	sb	zero,13(a4)
}
    1bd6:	8082                	ret
    1bd8:	46ad                	li	a3,11
    1bda:	bde1                	j	1ab2 <strncpy+0x9e>
    1bdc:	00778693          	add	a3,a5,7
    1be0:	48ad                	li	a7,11
    1be2:	fff60593          	add	a1,a2,-1
    1be6:	ed16f6e3          	bgeu	a3,a7,1ab2 <strncpy+0x9e>
    1bea:	b7fd                	j	1bd8 <strncpy+0x1c4>
    1bec:	40a00733          	neg	a4,a0
    1bf0:	8832                	mv	a6,a2
    1bf2:	00777793          	and	a5,a4,7
    1bf6:	4581                	li	a1,0
    1bf8:	ea0608e3          	beqz	a2,1aa8 <strncpy+0x94>
    1bfc:	b7c5                	j	1bdc <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfe:	00350693          	add	a3,a0,3
    1c02:	470d                	li	a4,3
    1c04:	b729                	j	1b0e <strncpy+0xfa>
    1c06:	00150693          	add	a3,a0,1
    1c0a:	4705                	li	a4,1
    1c0c:	b709                	j	1b0e <strncpy+0xfa>
tail:
    1c0e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c10:	4701                	li	a4,0
    1c12:	bdf5                	j	1b0e <strncpy+0xfa>
    1c14:	8082                	ret
tail:
    1c16:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c18:	4781                	li	a5,0
    1c1a:	bf39                	j	1b38 <strncpy+0x124>
    1c1c:	00250693          	add	a3,a0,2
    1c20:	4709                	li	a4,2
    1c22:	b5f5                	j	1b0e <strncpy+0xfa>
    1c24:	00650693          	add	a3,a0,6
    1c28:	4719                	li	a4,6
    1c2a:	b5d5                	j	1b0e <strncpy+0xfa>
    1c2c:	8082                	ret

0000000000001c2e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2e:	87aa                	mv	a5,a0
    1c30:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c32:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c3c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <openat>:
    register long a7 __asm__("a7") = n;
    1c46:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c4a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <close>:
    register long a7 __asm__("a7") = n;
    1c56:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c5a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <read>:
    register long a7 __asm__("a7") = n;
    1c62:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c66:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c6a:	8082                	ret

0000000000001c6c <write>:
    register long a7 __asm__("a7") = n;
    1c6c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c70:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c74:	8082                	ret

0000000000001c76 <getpid>:
    register long a7 __asm__("a7") = n;
    1c76:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c7a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <getppid>:
    register long a7 __asm__("a7") = n;
    1c82:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c86:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c8e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c92:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <fork>:
    register long a7 __asm__("a7") = n;
    1c9a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c9e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1caa:	85b2                	mv	a1,a2
    1cac:	863a                	mv	a2,a4
    if (stack)
    1cae:	c191                	beqz	a1,1cb2 <clone+0x8>
	stack += stack_size;
    1cb0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb2:	4781                	li	a5,0
    1cb4:	4701                	li	a4,0
    1cb6:	4681                	li	a3,0
    1cb8:	2601                	sext.w	a2,a2
    1cba:	ac01                	j	1eca <__clone>

0000000000001cbc <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cbc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cc0:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cc4:	8082                	ret

0000000000001cc6 <exit>:
    register long a7 __asm__("a7") = n;
    1cc6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cce:	8082                	ret

0000000000001cd0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <exec>:
    register long a7 __asm__("a7") = n;
    1cde:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <execve>:
    register long a7 __asm__("a7") = n;
    1cea:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cee:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <times>:
    register long a7 __asm__("a7") = n;
    1cf6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <get_time>:

int64 get_time()
{
    1d02:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d04:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d08:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d0a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d10:	2501                	sext.w	a0,a0
    1d12:	ed09                	bnez	a0,1d2c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d14:	67a2                	ld	a5,8(sp)
    1d16:	3e800713          	li	a4,1000
    1d1a:	00015503          	lhu	a0,0(sp)
    1d1e:	02e7d7b3          	divu	a5,a5,a4
    1d22:	02e50533          	mul	a0,a0,a4
    1d26:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d28:	0141                	add	sp,sp,16
    1d2a:	8082                	ret
        return -1;
    1d2c:	557d                	li	a0,-1
    1d2e:	bfed                	j	1d28 <get_time+0x26>

0000000000001d30 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d30:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d34:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <time>:
    register long a7 __asm__("a7") = n;
    1d3c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <sleep>:

int sleep(unsigned long long time)
{
    1d48:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d4a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d4c:	850a                	mv	a0,sp
    1d4e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d50:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d54:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5a:	e501                	bnez	a0,1d62 <sleep+0x1a>
    return 0;
    1d5c:	4501                	li	a0,0
}
    1d5e:	0141                	add	sp,sp,16
    1d60:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d62:	4502                	lw	a0,0(sp)
}
    1d64:	0141                	add	sp,sp,16
    1d66:	8082                	ret

0000000000001d68 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d68:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d74:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d78:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d7c:	8082                	ret

0000000000001d7e <mprotect>:
    register long a7 __asm__("a7") = n;
    1d7e:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d82:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <munmap>:
    register long a7 __asm__("a7") = n;
    1d8a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <wait>:

int wait(int *code)
{
    1d96:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d98:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d9c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d9e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <spawn>:
    register long a7 __asm__("a7") = n;
    1daa:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <mailread>:
    register long a7 __asm__("a7") = n;
    1db6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dc2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <fstat>:
    register long a7 __asm__("a7") = n;
    1dce:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dda:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1de0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dea:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dec:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1df0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dfa:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dfc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e00:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e02:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <link>:

int link(char *old_path, char *new_path)
{
    1e0a:	87aa                	mv	a5,a0
    1e0c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e0e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e12:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e16:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e18:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e1c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <unlink>:

int unlink(char *path)
{
    1e26:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e28:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e2c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e30:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e32:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <uname>:
    register long a7 __asm__("a7") = n;
    1e3a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <brk>:
    register long a7 __asm__("a7") = n;
    1e46:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e4a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e52:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e54:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e58:	8082                	ret

0000000000001e5a <chdir>:
    register long a7 __asm__("a7") = n;
    1e5a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e66:	862e                	mv	a2,a1
    1e68:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e6a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e6c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e70:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e74:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e76:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e78:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <getdents>:
    register long a7 __asm__("a7") = n;
    1e80:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e84:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <pipe>:
    register long a7 __asm__("a7") = n;
    1e8c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <dup>:
    register long a7 __asm__("a7") = n;
    1e9a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e9c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea4:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea8:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <mount>:
    register long a7 __asm__("a7") = n;
    1eb0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <umount>:
    register long a7 __asm__("a7") = n;
    1ebc:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ec0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eca:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ecc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ece:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ed0:	8532                	mv	a0,a2
	mv a2, a4
    1ed2:	863a                	mv	a2,a4
	mv a3, a5
    1ed4:	86be                	mv	a3,a5
	mv a4, a6
    1ed6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed8:	0dc00893          	li	a7,220
	ecall
    1edc:	00000073          	ecall

	beqz a0, 1f
    1ee0:	c111                	beqz	a0,1ee4 <__clone+0x1a>
	# Parent
	ret
    1ee2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee6:	6522                	ld	a0,8(sp)
	jalr a1
    1ee8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eea:	05d00893          	li	a7,93
	ecall
    1eee:	00000073          	ecall
