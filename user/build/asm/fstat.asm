
/home/hbh/oslab/oslab/user/build/riscv64/fstat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f1                	j	10ce <__start_main>

0000000000001004 <test_fstat>:

#define AT_FDCWD (-100) //相对路径

//Stat *kst;
static struct kstat kst;
void test_fstat() {
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0250513          	add	a0,a0,-254 # 1f08 <__clone+0x2c>
void test_fstat() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1012:	314000ef          	jal	1326 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	06a50513          	add	a0,a0,106 # 2080 <__func__.0>
    101e:	308000ef          	jal	1326 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	efe50513          	add	a0,a0,-258 # 1f20 <__clone+0x44>
    102a:	2fc000ef          	jal	1326 <puts>
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	f0050513          	add	a0,a0,-256 # 1f30 <__clone+0x54>
    1038:	409000ef          	jal	1c40 <open>
	int ret = fstat(fd, &kst);
    103c:	00001597          	auipc	a1,0x1
    1040:	fc458593          	add	a1,a1,-60 # 2000 <kst>
    1044:	59d000ef          	jal	1de0 <fstat>
    1048:	842a                	mv	s0,a0
	printf("fstat ret: %d\n", ret);
    104a:	85aa                	mv	a1,a0
    104c:	00001517          	auipc	a0,0x1
    1050:	ef450513          	add	a0,a0,-268 # 1f40 <__clone+0x64>
    1054:	2f4000ef          	jal	1348 <printf>
	assert(ret >= 0);
    1058:	04044c63          	bltz	s0,10b0 <test_fstat+0xac>

	printf("fstat: dev: %d, inode: %d, mode: %d, nlink: %d, size: %d, atime: %d, mtime: %d, ctime: %d\n",
    105c:	00001597          	auipc	a1,0x1
    1060:	fa458593          	add	a1,a1,-92 # 2000 <kst>
    1064:	0685b303          	ld	t1,104(a1)
    1068:	0585b883          	ld	a7,88(a1)
    106c:	0485b803          	ld	a6,72(a1)
    1070:	799c                	ld	a5,48(a1)
    1072:	49d8                	lw	a4,20(a1)
    1074:	4994                	lw	a3,16(a1)
    1076:	6590                	ld	a2,8(a1)
    1078:	618c                	ld	a1,0(a1)
    107a:	00001517          	auipc	a0,0x1
    107e:	ef650513          	add	a0,a0,-266 # 1f70 <__clone+0x94>
    1082:	e01a                	sd	t1,0(sp)
    1084:	2c4000ef          	jal	1348 <printf>
	      kst.st_dev, kst.st_ino, kst.st_mode, kst.st_nlink, kst.st_size, kst.st_atime_sec, kst.st_mtime_sec, kst.st_ctime_sec);

	TEST_END(__func__);
    1088:	00001517          	auipc	a0,0x1
    108c:	f4850513          	add	a0,a0,-184 # 1fd0 <__clone+0xf4>
    1090:	296000ef          	jal	1326 <puts>
    1094:	00001517          	auipc	a0,0x1
    1098:	fec50513          	add	a0,a0,-20 # 2080 <__func__.0>
    109c:	28a000ef          	jal	1326 <puts>
}
    10a0:	6442                	ld	s0,16(sp)
    10a2:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	e7c50513          	add	a0,a0,-388 # 1f20 <__clone+0x44>
}
    10ac:	6105                	add	sp,sp,32
	TEST_END(__func__);
    10ae:	aca5                	j	1326 <puts>
	assert(ret >= 0);
    10b0:	00001517          	auipc	a0,0x1
    10b4:	ea050513          	add	a0,a0,-352 # 1f50 <__clone+0x74>
    10b8:	50a000ef          	jal	15c2 <panic>
    10bc:	b745                	j	105c <test_fstat+0x58>

00000000000010be <main>:

int main(void) {
    10be:	1141                	add	sp,sp,-16
    10c0:	e406                	sd	ra,8(sp)
	test_fstat();
    10c2:	f43ff0ef          	jal	1004 <test_fstat>
	return 0;
}
    10c6:	60a2                	ld	ra,8(sp)
    10c8:	4501                	li	a0,0
    10ca:	0141                	add	sp,sp,16
    10cc:	8082                	ret

00000000000010ce <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ce:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d0:	4108                	lw	a0,0(a0)
{
    10d2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d4:	05a1                	add	a1,a1,8
{
    10d6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d8:	fe7ff0ef          	jal	10be <main>
    10dc:	3fd000ef          	jal	1cd8 <exit>
	return 0;
}
    10e0:	60a2                	ld	ra,8(sp)
    10e2:	4501                	li	a0,0
    10e4:	0141                	add	sp,sp,16
    10e6:	8082                	ret

00000000000010e8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e8:	7179                	add	sp,sp,-48
    10ea:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ec:	12054863          	bltz	a0,121c <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f0:	02b577bb          	remuw	a5,a0,a1
    10f4:	00001697          	auipc	a3,0x1
    10f8:	f9c68693          	add	a3,a3,-100 # 2090 <digits>
    buf[16] = 0;
    10fc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1100:	0005871b          	sext.w	a4,a1
    1104:	1782                	sll	a5,a5,0x20
    1106:	9381                	srl	a5,a5,0x20
    1108:	97b6                	add	a5,a5,a3
    110a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1112:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1116:	1ab56663          	bltu	a0,a1,12c2 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    111a:	02e8763b          	remuw	a2,a6,a4
    111e:	1602                	sll	a2,a2,0x20
    1120:	9201                	srl	a2,a2,0x20
    1122:	9636                	add	a2,a2,a3
    1124:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1128:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1130:	12e86c63          	bltu	a6,a4,1268 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1134:	02e5f63b          	remuw	a2,a1,a4
    1138:	1602                	sll	a2,a2,0x20
    113a:	9201                	srl	a2,a2,0x20
    113c:	9636                	add	a2,a2,a3
    113e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1142:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1146:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    114a:	12e5e863          	bltu	a1,a4,127a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    114e:	02e8763b          	remuw	a2,a6,a4
    1152:	1602                	sll	a2,a2,0x20
    1154:	9201                	srl	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1164:	12e86463          	bltu	a6,a4,128c <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1168:	02e5f63b          	remuw	a2,a1,a4
    116c:	1602                	sll	a2,a2,0x20
    116e:	9201                	srl	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    117e:	12e5e063          	bltu	a1,a4,129e <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	sll	a2,a2,0x20
    1188:	9201                	srl	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1198:	0ae86f63          	bltu	a6,a4,1256 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	sll	a2,a2,0x20
    11a2:	9201                	srl	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b2:	0ee5ef63          	bltu	a1,a4,12b0 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	sll	a2,a2,0x20
    11bc:	9201                	srl	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11cc:	0ee86d63          	bltu	a6,a4,12c6 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	sll	a2,a2,0x20
    11d6:	9201                	srl	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e6:	0ee5e963          	bltu	a1,a4,12d8 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11ea:	1782                	sll	a5,a5,0x20
    11ec:	9381                	srl	a5,a5,0x20
    11ee:	96be                	add	a3,a3,a5
    11f0:	0006c783          	lbu	a5,0(a3)
    11f4:	4599                	li	a1,6
    11f6:	00f10723          	sb	a5,14(sp)

    if (sign)
    11fa:	00055763          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11fe:	02d00793          	li	a5,45
    1202:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1206:	4595                	li	a1,5
    write(f, s, l);
    1208:	003c                	add	a5,sp,8
    120a:	4641                	li	a2,16
    120c:	9e0d                	subw	a2,a2,a1
    120e:	4505                	li	a0,1
    1210:	95be                	add	a1,a1,a5
    1212:	26d000ef          	jal	1c7e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1216:	70a2                	ld	ra,40(sp)
    1218:	6145                	add	sp,sp,48
    121a:	8082                	ret
        x = -xx;
    121c:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1220:	02b677bb          	remuw	a5,a2,a1
    1224:	00001697          	auipc	a3,0x1
    1228:	e6c68693          	add	a3,a3,-404 # 2090 <digits>
    buf[16] = 0;
    122c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1230:	0005871b          	sext.w	a4,a1
    1234:	1782                	sll	a5,a5,0x20
    1236:	9381                	srl	a5,a5,0x20
    1238:	97b6                	add	a5,a5,a3
    123a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1242:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1246:	ecb67ae3          	bgeu	a2,a1,111a <printint.constprop.0+0x32>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1252:	45b9                	li	a1,14
    1254:	bf55                	j	1208 <printint.constprop.0+0x120>
    1256:	45a9                	li	a1,10
    if (sign)
    1258:	fa0558e3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1264:	45a5                	li	a1,9
    1266:	b74d                	j	1208 <printint.constprop.0+0x120>
    1268:	45b9                	li	a1,14
    if (sign)
    126a:	f8055fe3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1276:	45b5                	li	a1,13
    1278:	bf41                	j	1208 <printint.constprop.0+0x120>
    127a:	45b5                	li	a1,13
    if (sign)
    127c:	f80556e3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1288:	45b1                	li	a1,12
    128a:	bfbd                	j	1208 <printint.constprop.0+0x120>
    128c:	45b1                	li	a1,12
    if (sign)
    128e:	f6055de3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    129a:	45ad                	li	a1,11
    129c:	b7b5                	j	1208 <printint.constprop.0+0x120>
    129e:	45ad                	li	a1,11
    if (sign)
    12a0:	f60554e3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12ac:	45a9                	li	a1,10
    12ae:	bfa9                	j	1208 <printint.constprop.0+0x120>
    12b0:	45a5                	li	a1,9
    if (sign)
    12b2:	f4055be3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12be:	45a1                	li	a1,8
    12c0:	b7a1                	j	1208 <printint.constprop.0+0x120>
    i = 15;
    12c2:	45bd                	li	a1,15
    12c4:	b791                	j	1208 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12c6:	45a1                	li	a1,8
    if (sign)
    12c8:	f40550e3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d4:	459d                	li	a1,7
    12d6:	bf0d                	j	1208 <printint.constprop.0+0x120>
    12d8:	459d                	li	a1,7
    if (sign)
    12da:	f20557e3          	bgez	a0,1208 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e6:	4599                	li	a1,6
    12e8:	b705                	j	1208 <printint.constprop.0+0x120>

00000000000012ea <getchar>:
{
    12ea:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ec:	00f10593          	add	a1,sp,15
    12f0:	4605                	li	a2,1
    12f2:	4501                	li	a0,0
{
    12f4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12fa:	17b000ef          	jal	1c74 <read>
}
    12fe:	60e2                	ld	ra,24(sp)
    1300:	00f14503          	lbu	a0,15(sp)
    1304:	6105                	add	sp,sp,32
    1306:	8082                	ret

0000000000001308 <putchar>:
{
    1308:	1101                	add	sp,sp,-32
    130a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    130c:	00f10593          	add	a1,sp,15
    1310:	4605                	li	a2,1
    1312:	4505                	li	a0,1
{
    1314:	ec06                	sd	ra,24(sp)
    char byte = c;
    1316:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    131a:	165000ef          	jal	1c7e <write>
}
    131e:	60e2                	ld	ra,24(sp)
    1320:	2501                	sext.w	a0,a0
    1322:	6105                	add	sp,sp,32
    1324:	8082                	ret

0000000000001326 <puts>:
{
    1326:	1141                	add	sp,sp,-16
    1328:	e406                	sd	ra,8(sp)
    132a:	e022                	sd	s0,0(sp)
    132c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    132e:	574000ef          	jal	18a2 <strlen>
    1332:	862a                	mv	a2,a0
    1334:	85a2                	mv	a1,s0
    1336:	4505                	li	a0,1
    1338:	147000ef          	jal	1c7e <write>
}
    133c:	60a2                	ld	ra,8(sp)
    133e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1340:	957d                	sra	a0,a0,0x3f
    return r;
    1342:	2501                	sext.w	a0,a0
}
    1344:	0141                	add	sp,sp,16
    1346:	8082                	ret

0000000000001348 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1348:	7171                	add	sp,sp,-176
    134a:	f85a                	sd	s6,48(sp)
    134c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    134e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1350:	18bc                	add	a5,sp,120
{
    1352:	e8ca                	sd	s2,80(sp)
    1354:	e4ce                	sd	s3,72(sp)
    1356:	e0d2                	sd	s4,64(sp)
    1358:	fc56                	sd	s5,56(sp)
    135a:	f486                	sd	ra,104(sp)
    135c:	f0a2                	sd	s0,96(sp)
    135e:	eca6                	sd	s1,88(sp)
    1360:	fcae                	sd	a1,120(sp)
    1362:	e132                	sd	a2,128(sp)
    1364:	e536                	sd	a3,136(sp)
    1366:	e93a                	sd	a4,144(sp)
    1368:	f142                	sd	a6,160(sp)
    136a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    136c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    136e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1372:	07300a13          	li	s4,115
    1376:	07800a93          	li	s5,120
    buf[i++] = '0';
    137a:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137e:	00001997          	auipc	s3,0x1
    1382:	d1298993          	add	s3,s3,-750 # 2090 <digits>
        if (!*s)
    1386:	00054783          	lbu	a5,0(a0)
    138a:	16078a63          	beqz	a5,14fe <printf+0x1b6>
    138e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1390:	19278d63          	beq	a5,s2,152a <printf+0x1e2>
    1394:	00164783          	lbu	a5,1(a2)
    1398:	0605                	add	a2,a2,1
    139a:	fbfd                	bnez	a5,1390 <printf+0x48>
    139c:	84b2                	mv	s1,a2
        l = z - a;
    139e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a2:	85aa                	mv	a1,a0
    13a4:	8622                	mv	a2,s0
    13a6:	4505                	li	a0,1
    13a8:	0d7000ef          	jal	1c7e <write>
        if (l)
    13ac:	1a041463          	bnez	s0,1554 <printf+0x20c>
        if (s[1] == 0)
    13b0:	0014c783          	lbu	a5,1(s1)
    13b4:	14078563          	beqz	a5,14fe <printf+0x1b6>
        switch (s[1])
    13b8:	1b478063          	beq	a5,s4,1558 <printf+0x210>
    13bc:	14fa6b63          	bltu	s4,a5,1512 <printf+0x1ca>
    13c0:	06400713          	li	a4,100
    13c4:	1ee78063          	beq	a5,a4,15a4 <printf+0x25c>
    13c8:	07000713          	li	a4,112
    13cc:	1ae79963          	bne	a5,a4,157e <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13d0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d8:	631c                	ld	a5,0(a4)
    13da:	0721                	add	a4,a4,8
    13dc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13de:	00479293          	sll	t0,a5,0x4
    13e2:	00879f93          	sll	t6,a5,0x8
    13e6:	00c79f13          	sll	t5,a5,0xc
    13ea:	01079e93          	sll	t4,a5,0x10
    13ee:	01479e13          	sll	t3,a5,0x14
    13f2:	01879313          	sll	t1,a5,0x18
    13f6:	01c79893          	sll	a7,a5,0x1c
    13fa:	02479813          	sll	a6,a5,0x24
    13fe:	02879513          	sll	a0,a5,0x28
    1402:	02c79593          	sll	a1,a5,0x2c
    1406:	03079693          	sll	a3,a5,0x30
    140a:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140e:	03c7d413          	srl	s0,a5,0x3c
    1412:	01c7d39b          	srlw	t2,a5,0x1c
    1416:	03c2d293          	srl	t0,t0,0x3c
    141a:	03cfdf93          	srl	t6,t6,0x3c
    141e:	03cf5f13          	srl	t5,t5,0x3c
    1422:	03cede93          	srl	t4,t4,0x3c
    1426:	03ce5e13          	srl	t3,t3,0x3c
    142a:	03c35313          	srl	t1,t1,0x3c
    142e:	03c8d893          	srl	a7,a7,0x3c
    1432:	03c85813          	srl	a6,a6,0x3c
    1436:	9171                	srl	a0,a0,0x3c
    1438:	91f1                	srl	a1,a1,0x3c
    143a:	92f1                	srl	a3,a3,0x3c
    143c:	9371                	srl	a4,a4,0x3c
    143e:	96ce                	add	a3,a3,s3
    1440:	974e                	add	a4,a4,s3
    1442:	944e                	add	s0,s0,s3
    1444:	92ce                	add	t0,t0,s3
    1446:	9fce                	add	t6,t6,s3
    1448:	9f4e                	add	t5,t5,s3
    144a:	9ece                	add	t4,t4,s3
    144c:	9e4e                	add	t3,t3,s3
    144e:	934e                	add	t1,t1,s3
    1450:	98ce                	add	a7,a7,s3
    1452:	93ce                	add	t2,t2,s3
    1454:	984e                	add	a6,a6,s3
    1456:	954e                	add	a0,a0,s3
    1458:	95ce                	add	a1,a1,s3
    145a:	0006c083          	lbu	ra,0(a3)
    145e:	0002c283          	lbu	t0,0(t0)
    1462:	00074683          	lbu	a3,0(a4)
    1466:	000fcf83          	lbu	t6,0(t6)
    146a:	000f4f03          	lbu	t5,0(t5)
    146e:	000ece83          	lbu	t4,0(t4)
    1472:	000e4e03          	lbu	t3,0(t3)
    1476:	00034303          	lbu	t1,0(t1)
    147a:	0008c883          	lbu	a7,0(a7)
    147e:	0003c383          	lbu	t2,0(t2)
    1482:	00084803          	lbu	a6,0(a6)
    1486:	00054503          	lbu	a0,0(a0)
    148a:	0005c583          	lbu	a1,0(a1)
    148e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1492:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1496:	9371                	srl	a4,a4,0x3c
    1498:	8bbd                	and	a5,a5,15
    149a:	974e                	add	a4,a4,s3
    149c:	97ce                	add	a5,a5,s3
    149e:	005105a3          	sb	t0,11(sp)
    14a2:	01f10623          	sb	t6,12(sp)
    14a6:	01e106a3          	sb	t5,13(sp)
    14aa:	01d10723          	sb	t4,14(sp)
    14ae:	01c107a3          	sb	t3,15(sp)
    14b2:	00610823          	sb	t1,16(sp)
    14b6:	011108a3          	sb	a7,17(sp)
    14ba:	00710923          	sb	t2,18(sp)
    14be:	010109a3          	sb	a6,19(sp)
    14c2:	00a10a23          	sb	a0,20(sp)
    14c6:	00b10aa3          	sb	a1,21(sp)
    14ca:	00110b23          	sb	ra,22(sp)
    14ce:	00d10ba3          	sb	a3,23(sp)
    14d2:	00810523          	sb	s0,10(sp)
    14d6:	00074703          	lbu	a4,0(a4)
    14da:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14de:	002c                	add	a1,sp,8
    14e0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e2:	00e10c23          	sb	a4,24(sp)
    14e6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ea:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ee:	790000ef          	jal	1c7e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f2:	00248513          	add	a0,s1,2
        if (!*s)
    14f6:	00054783          	lbu	a5,0(a0)
    14fa:	e8079ae3          	bnez	a5,138e <printf+0x46>
    }
    va_end(ap);
}
    14fe:	70a6                	ld	ra,104(sp)
    1500:	7406                	ld	s0,96(sp)
    1502:	64e6                	ld	s1,88(sp)
    1504:	6946                	ld	s2,80(sp)
    1506:	69a6                	ld	s3,72(sp)
    1508:	6a06                	ld	s4,64(sp)
    150a:	7ae2                	ld	s5,56(sp)
    150c:	7b42                	ld	s6,48(sp)
    150e:	614d                	add	sp,sp,176
    1510:	8082                	ret
        switch (s[1])
    1512:	07579663          	bne	a5,s5,157e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1516:	6782                	ld	a5,0(sp)
    1518:	45c1                	li	a1,16
    151a:	4388                	lw	a0,0(a5)
    151c:	07a1                	add	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	bc9ff0ef          	jal	10e8 <printint.constprop.0>
        s += 2;
    1524:	00248513          	add	a0,s1,2
    1528:	b7f9                	j	14f6 <printf+0x1ae>
    152a:	84b2                	mv	s1,a2
    152c:	a039                	j	153a <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152e:	0024c783          	lbu	a5,2(s1)
    1532:	0605                	add	a2,a2,1
    1534:	0489                	add	s1,s1,2
    1536:	e72794e3          	bne	a5,s2,139e <printf+0x56>
    153a:	0014c783          	lbu	a5,1(s1)
    153e:	ff2788e3          	beq	a5,s2,152e <printf+0x1e6>
        l = z - a;
    1542:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1546:	85aa                	mv	a1,a0
    1548:	8622                	mv	a2,s0
    154a:	4505                	li	a0,1
    154c:	732000ef          	jal	1c7e <write>
        if (l)
    1550:	e60400e3          	beqz	s0,13b0 <printf+0x68>
    1554:	8526                	mv	a0,s1
    1556:	bd05                	j	1386 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1558:	6782                	ld	a5,0(sp)
    155a:	6380                	ld	s0,0(a5)
    155c:	07a1                	add	a5,a5,8
    155e:	e03e                	sd	a5,0(sp)
    1560:	cc21                	beqz	s0,15b8 <printf+0x270>
            l = strnlen(a, 200);
    1562:	0c800593          	li	a1,200
    1566:	8522                	mv	a0,s0
    1568:	424000ef          	jal	198c <strnlen>
    write(f, s, l);
    156c:	0005061b          	sext.w	a2,a0
    1570:	85a2                	mv	a1,s0
    1572:	4505                	li	a0,1
    1574:	70a000ef          	jal	1c7e <write>
        s += 2;
    1578:	00248513          	add	a0,s1,2
    157c:	bfad                	j	14f6 <printf+0x1ae>
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	add	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1588:	6f6000ef          	jal	1c7e <write>
    char byte = c;
    158c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1590:	4605                	li	a2,1
    1592:	002c                	add	a1,sp,8
    1594:	4505                	li	a0,1
    char byte = c;
    1596:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159a:	6e4000ef          	jal	1c7e <write>
        s += 2;
    159e:	00248513          	add	a0,s1,2
    15a2:	bf91                	j	14f6 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15a4:	6782                	ld	a5,0(sp)
    15a6:	45a9                	li	a1,10
    15a8:	4388                	lw	a0,0(a5)
    15aa:	07a1                	add	a5,a5,8
    15ac:	e03e                	sd	a5,0(sp)
    15ae:	b3bff0ef          	jal	10e8 <printint.constprop.0>
        s += 2;
    15b2:	00248513          	add	a0,s1,2
    15b6:	b781                	j	14f6 <printf+0x1ae>
                a = "(null)";
    15b8:	00001417          	auipc	s0,0x1
    15bc:	a2840413          	add	s0,s0,-1496 # 1fe0 <__clone+0x104>
    15c0:	b74d                	j	1562 <printf+0x21a>

00000000000015c2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c2:	1141                	add	sp,sp,-16
    15c4:	e406                	sd	ra,8(sp)
    puts(m);
    15c6:	d61ff0ef          	jal	1326 <puts>
    exit(-100);
}
    15ca:	60a2                	ld	ra,8(sp)
    exit(-100);
    15cc:	f9c00513          	li	a0,-100
}
    15d0:	0141                	add	sp,sp,16
    exit(-100);
    15d2:	a719                	j	1cd8 <exit>

00000000000015d4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d4:	02000793          	li	a5,32
    15d8:	00f50663          	beq	a0,a5,15e4 <isspace+0x10>
    15dc:	355d                	addw	a0,a0,-9
    15de:	00553513          	sltiu	a0,a0,5
    15e2:	8082                	ret
    15e4:	4505                	li	a0,1
}
    15e6:	8082                	ret

00000000000015e8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e8:	fd05051b          	addw	a0,a0,-48
}
    15ec:	00a53513          	sltiu	a0,a0,10
    15f0:	8082                	ret

00000000000015f2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f2:	02000693          	li	a3,32
    15f6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f8:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fc:	ff77871b          	addw	a4,a5,-9
    1600:	04d78c63          	beq	a5,a3,1658 <atoi+0x66>
    1604:	0007861b          	sext.w	a2,a5
    1608:	04e5f863          	bgeu	a1,a4,1658 <atoi+0x66>
        s++;
    switch (*s)
    160c:	02b00713          	li	a4,43
    1610:	04e78963          	beq	a5,a4,1662 <atoi+0x70>
    1614:	02d00713          	li	a4,45
    1618:	06e78263          	beq	a5,a4,167c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    161c:	fd06069b          	addw	a3,a2,-48
    1620:	47a5                	li	a5,9
    1622:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1624:	4301                	li	t1,0
    while (isdigit(*s))
    1626:	04d7e963          	bltu	a5,a3,1678 <atoi+0x86>
    int n = 0, neg = 0;
    162a:	4501                	li	a0,0
    while (isdigit(*s))
    162c:	48a5                	li	a7,9
    162e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1632:	0025179b          	sllw	a5,a0,0x2
    1636:	9fa9                	addw	a5,a5,a0
    1638:	fd06059b          	addw	a1,a2,-48
    163c:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1640:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1644:	0705                	add	a4,a4,1
    1646:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    164a:	0006861b          	sext.w	a2,a3
    164e:	ff08f0e3          	bgeu	a7,a6,162e <atoi+0x3c>
    return neg ? n : -n;
    1652:	00030563          	beqz	t1,165c <atoi+0x6a>
}
    1656:	8082                	ret
        s++;
    1658:	0505                	add	a0,a0,1
    165a:	bf79                	j	15f8 <atoi+0x6>
    return neg ? n : -n;
    165c:	40f5853b          	subw	a0,a1,a5
    1660:	8082                	ret
    while (isdigit(*s))
    1662:	00154603          	lbu	a2,1(a0)
    1666:	47a5                	li	a5,9
        s++;
    1668:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    166c:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1670:	4301                	li	t1,0
    while (isdigit(*s))
    1672:	2601                	sext.w	a2,a2
    1674:	fad7fbe3          	bgeu	a5,a3,162a <atoi+0x38>
    1678:	4501                	li	a0,0
}
    167a:	8082                	ret
    while (isdigit(*s))
    167c:	00154603          	lbu	a2,1(a0)
    1680:	47a5                	li	a5,9
        s++;
    1682:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1686:	fd06069b          	addw	a3,a2,-48
    168a:	2601                	sext.w	a2,a2
    168c:	fed7e6e3          	bltu	a5,a3,1678 <atoi+0x86>
        neg = 1;
    1690:	4305                	li	t1,1
    1692:	bf61                	j	162a <atoi+0x38>

0000000000001694 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1694:	18060163          	beqz	a2,1816 <memset+0x182>
    1698:	40a006b3          	neg	a3,a0
    169c:	0076f793          	and	a5,a3,7
    16a0:	00778813          	add	a6,a5,7
    16a4:	48ad                	li	a7,11
    16a6:	0ff5f713          	zext.b	a4,a1
    16aa:	fff60593          	add	a1,a2,-1
    16ae:	17186563          	bltu	a6,a7,1818 <memset+0x184>
    16b2:	1705ed63          	bltu	a1,a6,182c <memset+0x198>
    16b6:	16078363          	beqz	a5,181c <memset+0x188>
    16ba:	00e50023          	sb	a4,0(a0)
    16be:	0066f593          	and	a1,a3,6
    16c2:	16058063          	beqz	a1,1822 <memset+0x18e>
    16c6:	00e500a3          	sb	a4,1(a0)
    16ca:	4589                	li	a1,2
    16cc:	16f5f363          	bgeu	a1,a5,1832 <memset+0x19e>
    16d0:	00e50123          	sb	a4,2(a0)
    16d4:	8a91                	and	a3,a3,4
    16d6:	00350593          	add	a1,a0,3
    16da:	4e0d                	li	t3,3
    16dc:	ce9d                	beqz	a3,171a <memset+0x86>
    16de:	00e501a3          	sb	a4,3(a0)
    16e2:	4691                	li	a3,4
    16e4:	00450593          	add	a1,a0,4
    16e8:	4e11                	li	t3,4
    16ea:	02f6f863          	bgeu	a3,a5,171a <memset+0x86>
    16ee:	00e50223          	sb	a4,4(a0)
    16f2:	4695                	li	a3,5
    16f4:	00550593          	add	a1,a0,5
    16f8:	4e15                	li	t3,5
    16fa:	02d78063          	beq	a5,a3,171a <memset+0x86>
    16fe:	fff50693          	add	a3,a0,-1
    1702:	00e502a3          	sb	a4,5(a0)
    1706:	8a9d                	and	a3,a3,7
    1708:	00650593          	add	a1,a0,6
    170c:	4e19                	li	t3,6
    170e:	e691                	bnez	a3,171a <memset+0x86>
    1710:	00750593          	add	a1,a0,7
    1714:	00e50323          	sb	a4,6(a0)
    1718:	4e1d                	li	t3,7
    171a:	00871693          	sll	a3,a4,0x8
    171e:	01071813          	sll	a6,a4,0x10
    1722:	8ed9                	or	a3,a3,a4
    1724:	01871893          	sll	a7,a4,0x18
    1728:	0106e6b3          	or	a3,a3,a6
    172c:	0116e6b3          	or	a3,a3,a7
    1730:	02071813          	sll	a6,a4,0x20
    1734:	02871313          	sll	t1,a4,0x28
    1738:	0106e6b3          	or	a3,a3,a6
    173c:	40f608b3          	sub	a7,a2,a5
    1740:	03071813          	sll	a6,a4,0x30
    1744:	0066e6b3          	or	a3,a3,t1
    1748:	0106e6b3          	or	a3,a3,a6
    174c:	03871313          	sll	t1,a4,0x38
    1750:	97aa                	add	a5,a5,a0
    1752:	ff88f813          	and	a6,a7,-8
    1756:	0066e6b3          	or	a3,a3,t1
    175a:	983e                	add	a6,a6,a5
    175c:	e394                	sd	a3,0(a5)
    175e:	07a1                	add	a5,a5,8
    1760:	ff079ee3          	bne	a5,a6,175c <memset+0xc8>
    1764:	ff88f793          	and	a5,a7,-8
    1768:	0078f893          	and	a7,a7,7
    176c:	00f586b3          	add	a3,a1,a5
    1770:	01c787bb          	addw	a5,a5,t3
    1774:	0a088b63          	beqz	a7,182a <memset+0x196>
    1778:	00e68023          	sb	a4,0(a3)
    177c:	0017859b          	addw	a1,a5,1
    1780:	08c5fb63          	bgeu	a1,a2,1816 <memset+0x182>
    1784:	00e680a3          	sb	a4,1(a3)
    1788:	0027859b          	addw	a1,a5,2
    178c:	08c5f563          	bgeu	a1,a2,1816 <memset+0x182>
    1790:	00e68123          	sb	a4,2(a3)
    1794:	0037859b          	addw	a1,a5,3
    1798:	06c5ff63          	bgeu	a1,a2,1816 <memset+0x182>
    179c:	00e681a3          	sb	a4,3(a3)
    17a0:	0047859b          	addw	a1,a5,4
    17a4:	06c5f963          	bgeu	a1,a2,1816 <memset+0x182>
    17a8:	00e68223          	sb	a4,4(a3)
    17ac:	0057859b          	addw	a1,a5,5
    17b0:	06c5f363          	bgeu	a1,a2,1816 <memset+0x182>
    17b4:	00e682a3          	sb	a4,5(a3)
    17b8:	0067859b          	addw	a1,a5,6
    17bc:	04c5fd63          	bgeu	a1,a2,1816 <memset+0x182>
    17c0:	00e68323          	sb	a4,6(a3)
    17c4:	0077859b          	addw	a1,a5,7
    17c8:	04c5f763          	bgeu	a1,a2,1816 <memset+0x182>
    17cc:	00e683a3          	sb	a4,7(a3)
    17d0:	0087859b          	addw	a1,a5,8
    17d4:	04c5f163          	bgeu	a1,a2,1816 <memset+0x182>
    17d8:	00e68423          	sb	a4,8(a3)
    17dc:	0097859b          	addw	a1,a5,9
    17e0:	02c5fb63          	bgeu	a1,a2,1816 <memset+0x182>
    17e4:	00e684a3          	sb	a4,9(a3)
    17e8:	00a7859b          	addw	a1,a5,10
    17ec:	02c5f563          	bgeu	a1,a2,1816 <memset+0x182>
    17f0:	00e68523          	sb	a4,10(a3)
    17f4:	00b7859b          	addw	a1,a5,11
    17f8:	00c5ff63          	bgeu	a1,a2,1816 <memset+0x182>
    17fc:	00e685a3          	sb	a4,11(a3)
    1800:	00c7859b          	addw	a1,a5,12
    1804:	00c5f963          	bgeu	a1,a2,1816 <memset+0x182>
    1808:	00e68623          	sb	a4,12(a3)
    180c:	27b5                	addw	a5,a5,13
    180e:	00c7f463          	bgeu	a5,a2,1816 <memset+0x182>
    1812:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1816:	8082                	ret
    1818:	482d                	li	a6,11
    181a:	bd61                	j	16b2 <memset+0x1e>
    char *p = dest;
    181c:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181e:	4e01                	li	t3,0
    1820:	bded                	j	171a <memset+0x86>
    1822:	00150593          	add	a1,a0,1
    1826:	4e05                	li	t3,1
    1828:	bdcd                	j	171a <memset+0x86>
    182a:	8082                	ret
    char *p = dest;
    182c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    182e:	4781                	li	a5,0
    1830:	b7a1                	j	1778 <memset+0xe4>
    1832:	00250593          	add	a1,a0,2
    1836:	4e09                	li	t3,2
    1838:	b5cd                	j	171a <memset+0x86>

000000000000183a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    183a:	00054783          	lbu	a5,0(a0)
    183e:	0005c703          	lbu	a4,0(a1)
    1842:	00e79863          	bne	a5,a4,1852 <strcmp+0x18>
    1846:	0505                	add	a0,a0,1
    1848:	0585                	add	a1,a1,1
    184a:	fbe5                	bnez	a5,183a <strcmp>
    184c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    184e:	9d19                	subw	a0,a0,a4
    1850:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1852:	0007851b          	sext.w	a0,a5
    1856:	bfe5                	j	184e <strcmp+0x14>

0000000000001858 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1858:	ca15                	beqz	a2,188c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    185e:	167d                	add	a2,a2,-1
    1860:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1864:	eb99                	bnez	a5,187a <strncmp+0x22>
    1866:	a815                	j	189a <strncmp+0x42>
    1868:	00a68e63          	beq	a3,a0,1884 <strncmp+0x2c>
    186c:	0505                	add	a0,a0,1
    186e:	00f71b63          	bne	a4,a5,1884 <strncmp+0x2c>
    1872:	00054783          	lbu	a5,0(a0)
    1876:	cf89                	beqz	a5,1890 <strncmp+0x38>
    1878:	85b2                	mv	a1,a2
    187a:	0005c703          	lbu	a4,0(a1)
    187e:	00158613          	add	a2,a1,1
    1882:	f37d                	bnez	a4,1868 <strncmp+0x10>
        ;
    return *l - *r;
    1884:	0007851b          	sext.w	a0,a5
    1888:	9d19                	subw	a0,a0,a4
    188a:	8082                	ret
        return 0;
    188c:	4501                	li	a0,0
}
    188e:	8082                	ret
    return *l - *r;
    1890:	0015c703          	lbu	a4,1(a1)
    1894:	4501                	li	a0,0
    1896:	9d19                	subw	a0,a0,a4
    1898:	8082                	ret
    189a:	0005c703          	lbu	a4,0(a1)
    189e:	4501                	li	a0,0
    18a0:	b7e5                	j	1888 <strncmp+0x30>

00000000000018a2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a2:	00757793          	and	a5,a0,7
    18a6:	cf89                	beqz	a5,18c0 <strlen+0x1e>
    18a8:	87aa                	mv	a5,a0
    18aa:	a029                	j	18b4 <strlen+0x12>
    18ac:	0785                	add	a5,a5,1
    18ae:	0077f713          	and	a4,a5,7
    18b2:	cb01                	beqz	a4,18c2 <strlen+0x20>
        if (!*s)
    18b4:	0007c703          	lbu	a4,0(a5)
    18b8:	fb75                	bnez	a4,18ac <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18ba:	40a78533          	sub	a0,a5,a0
}
    18be:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c2:	6394                	ld	a3,0(a5)
    18c4:	00000597          	auipc	a1,0x0
    18c8:	7245b583          	ld	a1,1828(a1) # 1fe8 <__clone+0x10c>
    18cc:	00000617          	auipc	a2,0x0
    18d0:	72463603          	ld	a2,1828(a2) # 1ff0 <__clone+0x114>
    18d4:	a019                	j	18da <strlen+0x38>
    18d6:	6794                	ld	a3,8(a5)
    18d8:	07a1                	add	a5,a5,8
    18da:	00b68733          	add	a4,a3,a1
    18de:	fff6c693          	not	a3,a3
    18e2:	8f75                	and	a4,a4,a3
    18e4:	8f71                	and	a4,a4,a2
    18e6:	db65                	beqz	a4,18d6 <strlen+0x34>
    for (; *s; s++)
    18e8:	0007c703          	lbu	a4,0(a5)
    18ec:	d779                	beqz	a4,18ba <strlen+0x18>
    18ee:	0017c703          	lbu	a4,1(a5)
    18f2:	0785                	add	a5,a5,1
    18f4:	d379                	beqz	a4,18ba <strlen+0x18>
    18f6:	0017c703          	lbu	a4,1(a5)
    18fa:	0785                	add	a5,a5,1
    18fc:	fb6d                	bnez	a4,18ee <strlen+0x4c>
    18fe:	bf75                	j	18ba <strlen+0x18>

0000000000001900 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1900:	00757713          	and	a4,a0,7
{
    1904:	87aa                	mv	a5,a0
    1906:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190a:	cb19                	beqz	a4,1920 <memchr+0x20>
    190c:	ce25                	beqz	a2,1984 <memchr+0x84>
    190e:	0007c703          	lbu	a4,0(a5)
    1912:	00b70763          	beq	a4,a1,1920 <memchr+0x20>
    1916:	0785                	add	a5,a5,1
    1918:	0077f713          	and	a4,a5,7
    191c:	167d                	add	a2,a2,-1
    191e:	f77d                	bnez	a4,190c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1920:	4501                	li	a0,0
    if (n && *s != c)
    1922:	c235                	beqz	a2,1986 <memchr+0x86>
    1924:	0007c703          	lbu	a4,0(a5)
    1928:	06b70063          	beq	a4,a1,1988 <memchr+0x88>
        size_t k = ONES * c;
    192c:	00000517          	auipc	a0,0x0
    1930:	6cc53503          	ld	a0,1740(a0) # 1ff8 <__clone+0x11c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1934:	471d                	li	a4,7
        size_t k = ONES * c;
    1936:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193a:	04c77763          	bgeu	a4,a2,1988 <memchr+0x88>
    193e:	00000897          	auipc	a7,0x0
    1942:	6aa8b883          	ld	a7,1706(a7) # 1fe8 <__clone+0x10c>
    1946:	00000817          	auipc	a6,0x0
    194a:	6aa83803          	ld	a6,1706(a6) # 1ff0 <__clone+0x114>
    194e:	431d                	li	t1,7
    1950:	a029                	j	195a <memchr+0x5a>
    1952:	1661                	add	a2,a2,-8
    1954:	07a1                	add	a5,a5,8
    1956:	00c37c63          	bgeu	t1,a2,196e <memchr+0x6e>
    195a:	6398                	ld	a4,0(a5)
    195c:	8f29                	xor	a4,a4,a0
    195e:	011706b3          	add	a3,a4,a7
    1962:	fff74713          	not	a4,a4
    1966:	8f75                	and	a4,a4,a3
    1968:	01077733          	and	a4,a4,a6
    196c:	d37d                	beqz	a4,1952 <memchr+0x52>
    196e:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1970:	e601                	bnez	a2,1978 <memchr+0x78>
    1972:	a809                	j	1984 <memchr+0x84>
    1974:	0505                	add	a0,a0,1
    1976:	c619                	beqz	a2,1984 <memchr+0x84>
    1978:	00054783          	lbu	a5,0(a0)
    197c:	167d                	add	a2,a2,-1
    197e:	feb79be3          	bne	a5,a1,1974 <memchr+0x74>
    1982:	8082                	ret
    return n ? (void *)s : 0;
    1984:	4501                	li	a0,0
}
    1986:	8082                	ret
    if (n && *s != c)
    1988:	853e                	mv	a0,a5
    198a:	b7fd                	j	1978 <memchr+0x78>

000000000000198c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198c:	1101                	add	sp,sp,-32
    198e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1990:	862e                	mv	a2,a1
{
    1992:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1994:	4581                	li	a1,0
{
    1996:	e426                	sd	s1,8(sp)
    1998:	ec06                	sd	ra,24(sp)
    199a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199c:	f65ff0ef          	jal	1900 <memchr>
    return p ? p - s : n;
    19a0:	c519                	beqz	a0,19ae <strnlen+0x22>
}
    19a2:	60e2                	ld	ra,24(sp)
    19a4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a6:	8d05                	sub	a0,a0,s1
}
    19a8:	64a2                	ld	s1,8(sp)
    19aa:	6105                	add	sp,sp,32
    19ac:	8082                	ret
    19ae:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b0:	8522                	mv	a0,s0
}
    19b2:	6442                	ld	s0,16(sp)
    19b4:	64a2                	ld	s1,8(sp)
    19b6:	6105                	add	sp,sp,32
    19b8:	8082                	ret

00000000000019ba <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ba:	00a5c7b3          	xor	a5,a1,a0
    19be:	8b9d                	and	a5,a5,7
    19c0:	eb95                	bnez	a5,19f4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c2:	0075f793          	and	a5,a1,7
    19c6:	e7b1                	bnez	a5,1a12 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c8:	6198                	ld	a4,0(a1)
    19ca:	00000617          	auipc	a2,0x0
    19ce:	61e63603          	ld	a2,1566(a2) # 1fe8 <__clone+0x10c>
    19d2:	00000817          	auipc	a6,0x0
    19d6:	61e83803          	ld	a6,1566(a6) # 1ff0 <__clone+0x114>
    19da:	a029                	j	19e4 <strcpy+0x2a>
    19dc:	05a1                	add	a1,a1,8
    19de:	e118                	sd	a4,0(a0)
    19e0:	6198                	ld	a4,0(a1)
    19e2:	0521                	add	a0,a0,8
    19e4:	00c707b3          	add	a5,a4,a2
    19e8:	fff74693          	not	a3,a4
    19ec:	8ff5                	and	a5,a5,a3
    19ee:	0107f7b3          	and	a5,a5,a6
    19f2:	d7ed                	beqz	a5,19dc <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f4:	0005c783          	lbu	a5,0(a1)
    19f8:	00f50023          	sb	a5,0(a0)
    19fc:	c785                	beqz	a5,1a24 <strcpy+0x6a>
    19fe:	0015c783          	lbu	a5,1(a1)
    1a02:	0505                	add	a0,a0,1
    1a04:	0585                	add	a1,a1,1
    1a06:	00f50023          	sb	a5,0(a0)
    1a0a:	fbf5                	bnez	a5,19fe <strcpy+0x44>
        ;
    return d;
}
    1a0c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a0e:	0505                	add	a0,a0,1
    1a10:	df45                	beqz	a4,19c8 <strcpy+0xe>
            if (!(*d = *s))
    1a12:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a16:	0585                	add	a1,a1,1
    1a18:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	f7fd                	bnez	a5,1a0e <strcpy+0x54>
}
    1a22:	8082                	ret
    1a24:	8082                	ret

0000000000001a26 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a26:	00a5c7b3          	xor	a5,a1,a0
    1a2a:	8b9d                	and	a5,a5,7
    1a2c:	e3b5                	bnez	a5,1a90 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a2e:	0075f793          	and	a5,a1,7
    1a32:	cf99                	beqz	a5,1a50 <strncpy+0x2a>
    1a34:	ea09                	bnez	a2,1a46 <strncpy+0x20>
    1a36:	a421                	j	1c3e <strncpy+0x218>
    1a38:	0585                	add	a1,a1,1
    1a3a:	0075f793          	and	a5,a1,7
    1a3e:	167d                	add	a2,a2,-1
    1a40:	0505                	add	a0,a0,1
    1a42:	c799                	beqz	a5,1a50 <strncpy+0x2a>
    1a44:	c225                	beqz	a2,1aa4 <strncpy+0x7e>
    1a46:	0005c783          	lbu	a5,0(a1)
    1a4a:	00f50023          	sb	a5,0(a0)
    1a4e:	f7ed                	bnez	a5,1a38 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a50:	ca31                	beqz	a2,1aa4 <strncpy+0x7e>
    1a52:	0005c783          	lbu	a5,0(a1)
    1a56:	cba1                	beqz	a5,1aa6 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a58:	479d                	li	a5,7
    1a5a:	02c7fc63          	bgeu	a5,a2,1a92 <strncpy+0x6c>
    1a5e:	00000897          	auipc	a7,0x0
    1a62:	58a8b883          	ld	a7,1418(a7) # 1fe8 <__clone+0x10c>
    1a66:	00000817          	auipc	a6,0x0
    1a6a:	58a83803          	ld	a6,1418(a6) # 1ff0 <__clone+0x114>
    1a6e:	431d                	li	t1,7
    1a70:	a039                	j	1a7e <strncpy+0x58>
            *wd = *ws;
    1a72:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a74:	1661                	add	a2,a2,-8
    1a76:	05a1                	add	a1,a1,8
    1a78:	0521                	add	a0,a0,8
    1a7a:	00c37b63          	bgeu	t1,a2,1a90 <strncpy+0x6a>
    1a7e:	6198                	ld	a4,0(a1)
    1a80:	011707b3          	add	a5,a4,a7
    1a84:	fff74693          	not	a3,a4
    1a88:	8ff5                	and	a5,a5,a3
    1a8a:	0107f7b3          	and	a5,a5,a6
    1a8e:	d3f5                	beqz	a5,1a72 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a90:	ca11                	beqz	a2,1aa4 <strncpy+0x7e>
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	0585                	add	a1,a1,1
    1a98:	00f50023          	sb	a5,0(a0)
    1a9c:	c789                	beqz	a5,1aa6 <strncpy+0x80>
    1a9e:	167d                	add	a2,a2,-1
    1aa0:	0505                	add	a0,a0,1
    1aa2:	fa65                	bnez	a2,1a92 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aa4:	8082                	ret
    1aa6:	4805                	li	a6,1
    1aa8:	14061b63          	bnez	a2,1bfe <strncpy+0x1d8>
    1aac:	40a00733          	neg	a4,a0
    1ab0:	00777793          	and	a5,a4,7
    1ab4:	4581                	li	a1,0
    1ab6:	12061c63          	bnez	a2,1bee <strncpy+0x1c8>
    1aba:	00778693          	add	a3,a5,7
    1abe:	48ad                	li	a7,11
    1ac0:	1316e563          	bltu	a3,a7,1bea <strncpy+0x1c4>
    1ac4:	16d5e263          	bltu	a1,a3,1c28 <strncpy+0x202>
    1ac8:	14078c63          	beqz	a5,1c20 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1acc:	00050023          	sb	zero,0(a0)
    1ad0:	00677693          	and	a3,a4,6
    1ad4:	14068263          	beqz	a3,1c18 <strncpy+0x1f2>
    1ad8:	000500a3          	sb	zero,1(a0)
    1adc:	4689                	li	a3,2
    1ade:	14f6f863          	bgeu	a3,a5,1c2e <strncpy+0x208>
    1ae2:	00050123          	sb	zero,2(a0)
    1ae6:	8b11                	and	a4,a4,4
    1ae8:	12070463          	beqz	a4,1c10 <strncpy+0x1ea>
    1aec:	000501a3          	sb	zero,3(a0)
    1af0:	4711                	li	a4,4
    1af2:	00450693          	add	a3,a0,4
    1af6:	02f77563          	bgeu	a4,a5,1b20 <strncpy+0xfa>
    1afa:	00050223          	sb	zero,4(a0)
    1afe:	4715                	li	a4,5
    1b00:	00550693          	add	a3,a0,5
    1b04:	00e78e63          	beq	a5,a4,1b20 <strncpy+0xfa>
    1b08:	fff50713          	add	a4,a0,-1
    1b0c:	000502a3          	sb	zero,5(a0)
    1b10:	8b1d                	and	a4,a4,7
    1b12:	12071263          	bnez	a4,1c36 <strncpy+0x210>
    1b16:	00750693          	add	a3,a0,7
    1b1a:	00050323          	sb	zero,6(a0)
    1b1e:	471d                	li	a4,7
    1b20:	40f80833          	sub	a6,a6,a5
    1b24:	ff887593          	and	a1,a6,-8
    1b28:	97aa                	add	a5,a5,a0
    1b2a:	95be                	add	a1,a1,a5
    1b2c:	0007b023          	sd	zero,0(a5)
    1b30:	07a1                	add	a5,a5,8
    1b32:	feb79de3          	bne	a5,a1,1b2c <strncpy+0x106>
    1b36:	ff887593          	and	a1,a6,-8
    1b3a:	00787813          	and	a6,a6,7
    1b3e:	00e587bb          	addw	a5,a1,a4
    1b42:	00b68733          	add	a4,a3,a1
    1b46:	0e080063          	beqz	a6,1c26 <strncpy+0x200>
    1b4a:	00070023          	sb	zero,0(a4)
    1b4e:	0017869b          	addw	a3,a5,1
    1b52:	f4c6f9e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b56:	000700a3          	sb	zero,1(a4)
    1b5a:	0027869b          	addw	a3,a5,2
    1b5e:	f4c6f3e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b62:	00070123          	sb	zero,2(a4)
    1b66:	0037869b          	addw	a3,a5,3
    1b6a:	f2c6fde3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b6e:	000701a3          	sb	zero,3(a4)
    1b72:	0047869b          	addw	a3,a5,4
    1b76:	f2c6f7e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b7a:	00070223          	sb	zero,4(a4)
    1b7e:	0057869b          	addw	a3,a5,5
    1b82:	f2c6f1e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b86:	000702a3          	sb	zero,5(a4)
    1b8a:	0067869b          	addw	a3,a5,6
    1b8e:	f0c6fbe3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b92:	00070323          	sb	zero,6(a4)
    1b96:	0077869b          	addw	a3,a5,7
    1b9a:	f0c6f5e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1b9e:	000703a3          	sb	zero,7(a4)
    1ba2:	0087869b          	addw	a3,a5,8
    1ba6:	eec6ffe3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1baa:	00070423          	sb	zero,8(a4)
    1bae:	0097869b          	addw	a3,a5,9
    1bb2:	eec6f9e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1bb6:	000704a3          	sb	zero,9(a4)
    1bba:	00a7869b          	addw	a3,a5,10
    1bbe:	eec6f3e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1bc2:	00070523          	sb	zero,10(a4)
    1bc6:	00b7869b          	addw	a3,a5,11
    1bca:	ecc6fde3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1bce:	000705a3          	sb	zero,11(a4)
    1bd2:	00c7869b          	addw	a3,a5,12
    1bd6:	ecc6f7e3          	bgeu	a3,a2,1aa4 <strncpy+0x7e>
    1bda:	00070623          	sb	zero,12(a4)
    1bde:	27b5                	addw	a5,a5,13
    1be0:	ecc7f2e3          	bgeu	a5,a2,1aa4 <strncpy+0x7e>
    1be4:	000706a3          	sb	zero,13(a4)
}
    1be8:	8082                	ret
    1bea:	46ad                	li	a3,11
    1bec:	bde1                	j	1ac4 <strncpy+0x9e>
    1bee:	00778693          	add	a3,a5,7
    1bf2:	48ad                	li	a7,11
    1bf4:	fff60593          	add	a1,a2,-1
    1bf8:	ed16f6e3          	bgeu	a3,a7,1ac4 <strncpy+0x9e>
    1bfc:	b7fd                	j	1bea <strncpy+0x1c4>
    1bfe:	40a00733          	neg	a4,a0
    1c02:	8832                	mv	a6,a2
    1c04:	00777793          	and	a5,a4,7
    1c08:	4581                	li	a1,0
    1c0a:	ea0608e3          	beqz	a2,1aba <strncpy+0x94>
    1c0e:	b7c5                	j	1bee <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c10:	00350693          	add	a3,a0,3
    1c14:	470d                	li	a4,3
    1c16:	b729                	j	1b20 <strncpy+0xfa>
    1c18:	00150693          	add	a3,a0,1
    1c1c:	4705                	li	a4,1
    1c1e:	b709                	j	1b20 <strncpy+0xfa>
tail:
    1c20:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c22:	4701                	li	a4,0
    1c24:	bdf5                	j	1b20 <strncpy+0xfa>
    1c26:	8082                	ret
tail:
    1c28:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2a:	4781                	li	a5,0
    1c2c:	bf39                	j	1b4a <strncpy+0x124>
    1c2e:	00250693          	add	a3,a0,2
    1c32:	4709                	li	a4,2
    1c34:	b5f5                	j	1b20 <strncpy+0xfa>
    1c36:	00650693          	add	a3,a0,6
    1c3a:	4719                	li	a4,6
    1c3c:	b5d5                	j	1b20 <strncpy+0xfa>
    1c3e:	8082                	ret

0000000000001c40 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c40:	87aa                	mv	a5,a0
    1c42:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c44:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c48:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c4c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c4e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c50:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c54:	2501                	sext.w	a0,a0
    1c56:	8082                	ret

0000000000001c58 <openat>:
    register long a7 __asm__("a7") = n;
    1c58:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c5c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c60:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <close>:
    register long a7 __asm__("a7") = n;
    1c68:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c6c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <read>:
    register long a7 __asm__("a7") = n;
    1c74:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c78:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c7c:	8082                	ret

0000000000001c7e <write>:
    register long a7 __asm__("a7") = n;
    1c7e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c82:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c86:	8082                	ret

0000000000001c88 <getpid>:
    register long a7 __asm__("a7") = n;
    1c88:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c8c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <getppid>:
    register long a7 __asm__("a7") = n;
    1c94:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c98:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <fork>:
    register long a7 __asm__("a7") = n;
    1cac:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cbc:	85b2                	mv	a1,a2
    1cbe:	863a                	mv	a2,a4
    if (stack)
    1cc0:	c191                	beqz	a1,1cc4 <clone+0x8>
	stack += stack_size;
    1cc2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc4:	4781                	li	a5,0
    1cc6:	4701                	li	a4,0
    1cc8:	4681                	li	a3,0
    1cca:	2601                	sext.w	a2,a2
    1ccc:	ac01                	j	1edc <__clone>

0000000000001cce <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cce:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cd2:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cd6:	8082                	ret

0000000000001cd8 <exit>:
    register long a7 __asm__("a7") = n;
    1cd8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce0:	8082                	ret

0000000000001ce2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <exec>:
    register long a7 __asm__("a7") = n;
    1cf0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <execve>:
    register long a7 __asm__("a7") = n;
    1cfc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d00:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <times>:
    register long a7 __asm__("a7") = n;
    1d08:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d0c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <get_time>:

int64 get_time()
{
    1d14:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d16:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d1a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d1c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d22:	2501                	sext.w	a0,a0
    1d24:	ed09                	bnez	a0,1d3e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d26:	67a2                	ld	a5,8(sp)
    1d28:	3e800713          	li	a4,1000
    1d2c:	00015503          	lhu	a0,0(sp)
    1d30:	02e7d7b3          	divu	a5,a5,a4
    1d34:	02e50533          	mul	a0,a0,a4
    1d38:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d3a:	0141                	add	sp,sp,16
    1d3c:	8082                	ret
        return -1;
    1d3e:	557d                	li	a0,-1
    1d40:	bfed                	j	1d3a <get_time+0x26>

0000000000001d42 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d42:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <time>:
    register long a7 __asm__("a7") = n;
    1d4e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <sleep>:

int sleep(unsigned long long time)
{
    1d5a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d5c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d5e:	850a                	mv	a0,sp
    1d60:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d62:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d66:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6c:	e501                	bnez	a0,1d74 <sleep+0x1a>
    return 0;
    1d6e:	4501                	li	a0,0
}
    1d70:	0141                	add	sp,sp,16
    1d72:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d74:	4502                	lw	a0,0(sp)
}
    1d76:	0141                	add	sp,sp,16
    1d78:	8082                	ret

0000000000001d7a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d7a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d7e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d86:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d8a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d8e:	8082                	ret

0000000000001d90 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d90:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d94:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <munmap>:
    register long a7 __asm__("a7") = n;
    1d9c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <wait>:

int wait(int *code)
{
    1da8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1daa:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dae:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <spawn>:
    register long a7 __asm__("a7") = n;
    1dbc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <fstat>:
    register long a7 __asm__("a7") = n;
    1de0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dec:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dee:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1df2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dfc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dfe:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e02:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e04:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e0c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e12:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <link>:

int link(char *old_path, char *new_path)
{
    1e1c:	87aa                	mv	a5,a0
    1e1e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e20:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e2a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e2e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e30:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <unlink>:

int unlink(char *path)
{
    1e38:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e3a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e3e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e42:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <uname>:
    register long a7 __asm__("a7") = n;
    1e4c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <brk>:
    register long a7 __asm__("a7") = n;
    1e58:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e64:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e66:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e6a:	8082                	ret

0000000000001e6c <chdir>:
    register long a7 __asm__("a7") = n;
    1e6c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e78:	862e                	mv	a2,a1
    1e7a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e7c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e82:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e86:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e88:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <getdents>:
    register long a7 __asm__("a7") = n;
    1e92:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <pipe>:
    register long a7 __asm__("a7") = n;
    1e9e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <dup>:
    register long a7 __asm__("a7") = n;
    1eac:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eae:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eba:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <mount>:
    register long a7 __asm__("a7") = n;
    1ec2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <umount>:
    register long a7 __asm__("a7") = n;
    1ece:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1edc:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ede:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ee0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee2:	8532                	mv	a0,a2
	mv a2, a4
    1ee4:	863a                	mv	a2,a4
	mv a3, a5
    1ee6:	86be                	mv	a3,a5
	mv a4, a6
    1ee8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eea:	0dc00893          	li	a7,220
	ecall
    1eee:	00000073          	ecall

	beqz a0, 1f
    1ef2:	c111                	beqz	a0,1ef6 <__clone+0x1a>
	# Parent
	ret
    1ef4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef8:	6522                	ld	a0,8(sp)
	jalr a1
    1efa:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1efc:	05d00893          	li	a7,93
	ecall
    1f00:	00000073          	ecall
