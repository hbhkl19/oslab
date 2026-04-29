
/home/hbh/oslab/oslab/user/build/riscv64/openat_dirfd_relative:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a2bd                	j	1170 <__start_main>

0000000000001004 <test_openat_dirfd_relative>:
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_openat_dirfd_relative(void)
{
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	fa250513          	add	a0,a0,-94 # 1fa8 <__clone+0x2a>
{
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	3b4000ef          	jal	13c8 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	09050513          	add	a0,a0,144 # 20a8 <__func__.0>
    1020:	3a8000ef          	jal	13c8 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f9c50513          	add	a0,a0,-100 # 1fc0 <__clone+0x42>
    102c:	39c000ef          	jal	13c8 <puts>

    int ret = mkdir("dirfd_dir", 0666);
    1030:	1b600593          	li	a1,438
    1034:	00001517          	auipc	a0,0x1
    1038:	f9c50513          	add	a0,a0,-100 # 1fd0 <__clone+0x52>
    103c:	6df000ef          	jal	1f1a <mkdir>
    1040:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", ret);
    1042:	85aa                	mv	a1,a0
    1044:	00001517          	auipc	a0,0x1
    1048:	f9c50513          	add	a0,a0,-100 # 1fe0 <__clone+0x62>
    104c:	39e000ef          	jal	13ea <printf>
    assert(ret == 0 || ret == -1);
    1050:	2405                	addw	s0,s0,1
    1052:	4785                	li	a5,1
    1054:	0087f863          	bgeu	a5,s0,1064 <test_openat_dirfd_relative+0x60>
    1058:	00001517          	auipc	a0,0x1
    105c:	f9850513          	add	a0,a0,-104 # 1ff0 <__clone+0x72>
    1060:	604000ef          	jal	1664 <panic>

    int dfd = open("dirfd_dir", O_RDONLY | O_DIRECTORY);
    1064:	002005b7          	lui	a1,0x200
    1068:	00001517          	auipc	a0,0x1
    106c:	f6850513          	add	a0,a0,-152 # 1fd0 <__clone+0x52>
    1070:	473000ef          	jal	1ce2 <open>
    1074:	842a                	mv	s0,a0
    printf("dir fd: %d\n", dfd);
    1076:	85aa                	mv	a1,a0
    1078:	00001517          	auipc	a0,0x1
    107c:	f9850513          	add	a0,a0,-104 # 2010 <__clone+0x92>
    1080:	36a000ef          	jal	13ea <printf>
    assert(dfd > 0);
    1084:	0c805763          	blez	s0,1152 <test_openat_dirfd_relative+0x14e>

    int fd = openat(dfd, "inside", O_CREATE | O_RDWR);
    1088:	00001597          	auipc	a1,0x1
    108c:	f9858593          	add	a1,a1,-104 # 2020 <__clone+0xa2>
    1090:	04200613          	li	a2,66
    1094:	8522                	mv	a0,s0
    1096:	465000ef          	jal	1cfa <openat>
    109a:	84aa                	mv	s1,a0
    printf("openat fd: %d\n", fd);
    109c:	85aa                	mv	a1,a0
    109e:	00001517          	auipc	a0,0x1
    10a2:	f8a50513          	add	a0,a0,-118 # 2028 <__clone+0xaa>
    10a6:	344000ef          	jal	13ea <printf>
    assert(fd > 0);
    10aa:	08905d63          	blez	s1,1144 <test_openat_dirfd_relative+0x140>
    close(fd);
    10ae:	8526                	mv	a0,s1
    10b0:	45b000ef          	jal	1d0a <close>
    close(dfd);
    10b4:	8522                	mv	a0,s0
    10b6:	455000ef          	jal	1d0a <close>

    ret = chdir("dirfd_dir");
    10ba:	00001517          	auipc	a0,0x1
    10be:	f1650513          	add	a0,a0,-234 # 1fd0 <__clone+0x52>
    10c2:	64d000ef          	jal	1f0e <chdir>
    10c6:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    10c8:	85aa                	mv	a1,a0
    10ca:	00001517          	auipc	a0,0x1
    10ce:	f6e50513          	add	a0,a0,-146 # 2038 <__clone+0xba>
    10d2:	318000ef          	jal	13ea <printf>
    assert(ret == 0);
    10d6:	e025                	bnez	s0,1136 <test_openat_dirfd_relative+0x132>

    fd = open("inside", O_RDONLY);
    10d8:	4581                	li	a1,0
    10da:	00001517          	auipc	a0,0x1
    10de:	f4650513          	add	a0,a0,-186 # 2020 <__clone+0xa2>
    10e2:	401000ef          	jal	1ce2 <open>
    10e6:	842a                	mv	s0,a0
    if(fd > 0) {
    10e8:	04a05063          	blez	a0,1128 <test_openat_dirfd_relative+0x124>
        printf("dirfd openat success.\n");
    10ec:	00001517          	auipc	a0,0x1
    10f0:	f5c50513          	add	a0,a0,-164 # 2048 <__clone+0xca>
    10f4:	2f6000ef          	jal	13ea <printf>
        close(fd);
    10f8:	8522                	mv	a0,s0
    10fa:	411000ef          	jal	1d0a <close>
    } else {
        printf("dirfd openat failed.\n");
    }

    TEST_END(__func__);
    10fe:	00001517          	auipc	a0,0x1
    1102:	f7a50513          	add	a0,a0,-134 # 2078 <__clone+0xfa>
    1106:	2c2000ef          	jal	13c8 <puts>
    110a:	00001517          	auipc	a0,0x1
    110e:	f9e50513          	add	a0,a0,-98 # 20a8 <__func__.0>
    1112:	2b6000ef          	jal	13c8 <puts>
}
    1116:	6442                	ld	s0,16(sp)
    1118:	60e2                	ld	ra,24(sp)
    111a:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    111c:	00001517          	auipc	a0,0x1
    1120:	ea450513          	add	a0,a0,-348 # 1fc0 <__clone+0x42>
}
    1124:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1126:	a44d                	j	13c8 <puts>
        printf("dirfd openat failed.\n");
    1128:	00001517          	auipc	a0,0x1
    112c:	f3850513          	add	a0,a0,-200 # 2060 <__clone+0xe2>
    1130:	2ba000ef          	jal	13ea <printf>
    1134:	b7e9                	j	10fe <test_openat_dirfd_relative+0xfa>
    assert(ret == 0);
    1136:	00001517          	auipc	a0,0x1
    113a:	eba50513          	add	a0,a0,-326 # 1ff0 <__clone+0x72>
    113e:	526000ef          	jal	1664 <panic>
    1142:	bf59                	j	10d8 <test_openat_dirfd_relative+0xd4>
    assert(fd > 0);
    1144:	00001517          	auipc	a0,0x1
    1148:	eac50513          	add	a0,a0,-340 # 1ff0 <__clone+0x72>
    114c:	518000ef          	jal	1664 <panic>
    1150:	bfb9                	j	10ae <test_openat_dirfd_relative+0xaa>
    assert(dfd > 0);
    1152:	00001517          	auipc	a0,0x1
    1156:	e9e50513          	add	a0,a0,-354 # 1ff0 <__clone+0x72>
    115a:	50a000ef          	jal	1664 <panic>
    115e:	b72d                	j	1088 <test_openat_dirfd_relative+0x84>

0000000000001160 <main>:

int main(void)
{
    1160:	1141                	add	sp,sp,-16
    1162:	e406                	sd	ra,8(sp)
    test_openat_dirfd_relative();
    1164:	ea1ff0ef          	jal	1004 <test_openat_dirfd_relative>
    return 0;
}
    1168:	60a2                	ld	ra,8(sp)
    116a:	4501                	li	a0,0
    116c:	0141                	add	sp,sp,16
    116e:	8082                	ret

0000000000001170 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1170:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1172:	4108                	lw	a0,0(a0)
{
    1174:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1176:	05a1                	add	a1,a1,8
{
    1178:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    117a:	fe7ff0ef          	jal	1160 <main>
    117e:	3fd000ef          	jal	1d7a <exit>
	return 0;
}
    1182:	60a2                	ld	ra,8(sp)
    1184:	4501                	li	a0,0
    1186:	0141                	add	sp,sp,16
    1188:	8082                	ret

000000000000118a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    118a:	7179                	add	sp,sp,-48
    118c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    118e:	12054863          	bltz	a0,12be <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1192:	02b577bb          	remuw	a5,a0,a1
    1196:	00001697          	auipc	a3,0x1
    119a:	f3268693          	add	a3,a3,-206 # 20c8 <digits>
    buf[16] = 0;
    119e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11a2:	0005871b          	sext.w	a4,a1
    11a6:	1782                	sll	a5,a5,0x20
    11a8:	9381                	srl	a5,a5,0x20
    11aa:	97b6                	add	a5,a5,a3
    11ac:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11b0:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11b4:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11b8:	1ab56663          	bltu	a0,a1,1364 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11bc:	02e8763b          	remuw	a2,a6,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ce:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11d2:	12e86c63          	bltu	a6,a4,130a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11d6:	02e5f63b          	remuw	a2,a1,a4
    11da:	1602                	sll	a2,a2,0x20
    11dc:	9201                	srl	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e8:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11ec:	12e5e863          	bltu	a1,a4,131c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11f0:	02e8763b          	remuw	a2,a6,a4
    11f4:	1602                	sll	a2,a2,0x20
    11f6:	9201                	srl	a2,a2,0x20
    11f8:	9636                	add	a2,a2,a3
    11fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fe:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1202:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1206:	12e86463          	bltu	a6,a4,132e <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    120a:	02e5f63b          	remuw	a2,a1,a4
    120e:	1602                	sll	a2,a2,0x20
    1210:	9201                	srl	a2,a2,0x20
    1212:	9636                	add	a2,a2,a3
    1214:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1218:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    121c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1220:	12e5e063          	bltu	a1,a4,1340 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1224:	02e8763b          	remuw	a2,a6,a4
    1228:	1602                	sll	a2,a2,0x20
    122a:	9201                	srl	a2,a2,0x20
    122c:	9636                	add	a2,a2,a3
    122e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1232:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1236:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    123a:	0ae86f63          	bltu	a6,a4,12f8 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    123e:	02e5f63b          	remuw	a2,a1,a4
    1242:	1602                	sll	a2,a2,0x20
    1244:	9201                	srl	a2,a2,0x20
    1246:	9636                	add	a2,a2,a3
    1248:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    124c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1250:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1254:	0ee5ef63          	bltu	a1,a4,1352 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1258:	02e8763b          	remuw	a2,a6,a4
    125c:	1602                	sll	a2,a2,0x20
    125e:	9201                	srl	a2,a2,0x20
    1260:	9636                	add	a2,a2,a3
    1262:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1266:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    126a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    126e:	0ee86d63          	bltu	a6,a4,1368 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1272:	02e5f63b          	remuw	a2,a1,a4
    1276:	1602                	sll	a2,a2,0x20
    1278:	9201                	srl	a2,a2,0x20
    127a:	9636                	add	a2,a2,a3
    127c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1280:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1284:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1288:	0ee5e963          	bltu	a1,a4,137a <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    128c:	1782                	sll	a5,a5,0x20
    128e:	9381                	srl	a5,a5,0x20
    1290:	96be                	add	a3,a3,a5
    1292:	0006c783          	lbu	a5,0(a3)
    1296:	4599                	li	a1,6
    1298:	00f10723          	sb	a5,14(sp)

    if (sign)
    129c:	00055763          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12a8:	4595                	li	a1,5
    write(f, s, l);
    12aa:	003c                	add	a5,sp,8
    12ac:	4641                	li	a2,16
    12ae:	9e0d                	subw	a2,a2,a1
    12b0:	4505                	li	a0,1
    12b2:	95be                	add	a1,a1,a5
    12b4:	26d000ef          	jal	1d20 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12b8:	70a2                	ld	ra,40(sp)
    12ba:	6145                	add	sp,sp,48
    12bc:	8082                	ret
        x = -xx;
    12be:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12c2:	02b677bb          	remuw	a5,a2,a1
    12c6:	00001697          	auipc	a3,0x1
    12ca:	e0268693          	add	a3,a3,-510 # 20c8 <digits>
    buf[16] = 0;
    12ce:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12d2:	0005871b          	sext.w	a4,a1
    12d6:	1782                	sll	a5,a5,0x20
    12d8:	9381                	srl	a5,a5,0x20
    12da:	97b6                	add	a5,a5,a3
    12dc:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12e0:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12e4:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12e8:	ecb67ae3          	bgeu	a2,a1,11bc <printint.constprop.0+0x32>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12f4:	45b9                	li	a1,14
    12f6:	bf55                	j	12aa <printint.constprop.0+0x120>
    12f8:	45a9                	li	a1,10
    if (sign)
    12fa:	fa0558e3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1306:	45a5                	li	a1,9
    1308:	b74d                	j	12aa <printint.constprop.0+0x120>
    130a:	45b9                	li	a1,14
    if (sign)
    130c:	f8055fe3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1310:	02d00793          	li	a5,45
    1314:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1318:	45b5                	li	a1,13
    131a:	bf41                	j	12aa <printint.constprop.0+0x120>
    131c:	45b5                	li	a1,13
    if (sign)
    131e:	f80556e3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1322:	02d00793          	li	a5,45
    1326:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    132a:	45b1                	li	a1,12
    132c:	bfbd                	j	12aa <printint.constprop.0+0x120>
    132e:	45b1                	li	a1,12
    if (sign)
    1330:	f6055de3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1334:	02d00793          	li	a5,45
    1338:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    133c:	45ad                	li	a1,11
    133e:	b7b5                	j	12aa <printint.constprop.0+0x120>
    1340:	45ad                	li	a1,11
    if (sign)
    1342:	f60554e3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1346:	02d00793          	li	a5,45
    134a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    134e:	45a9                	li	a1,10
    1350:	bfa9                	j	12aa <printint.constprop.0+0x120>
    1352:	45a5                	li	a1,9
    if (sign)
    1354:	f4055be3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1358:	02d00793          	li	a5,45
    135c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1360:	45a1                	li	a1,8
    1362:	b7a1                	j	12aa <printint.constprop.0+0x120>
    i = 15;
    1364:	45bd                	li	a1,15
    1366:	b791                	j	12aa <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1368:	45a1                	li	a1,8
    if (sign)
    136a:	f40550e3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    136e:	02d00793          	li	a5,45
    1372:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1376:	459d                	li	a1,7
    1378:	bf0d                	j	12aa <printint.constprop.0+0x120>
    137a:	459d                	li	a1,7
    if (sign)
    137c:	f20557e3          	bgez	a0,12aa <printint.constprop.0+0x120>
        buf[i--] = '-';
    1380:	02d00793          	li	a5,45
    1384:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1388:	4599                	li	a1,6
    138a:	b705                	j	12aa <printint.constprop.0+0x120>

000000000000138c <getchar>:
{
    138c:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    138e:	00f10593          	add	a1,sp,15
    1392:	4605                	li	a2,1
    1394:	4501                	li	a0,0
{
    1396:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1398:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    139c:	17b000ef          	jal	1d16 <read>
}
    13a0:	60e2                	ld	ra,24(sp)
    13a2:	00f14503          	lbu	a0,15(sp)
    13a6:	6105                	add	sp,sp,32
    13a8:	8082                	ret

00000000000013aa <putchar>:
{
    13aa:	1101                	add	sp,sp,-32
    13ac:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13ae:	00f10593          	add	a1,sp,15
    13b2:	4605                	li	a2,1
    13b4:	4505                	li	a0,1
{
    13b6:	ec06                	sd	ra,24(sp)
    char byte = c;
    13b8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13bc:	165000ef          	jal	1d20 <write>
}
    13c0:	60e2                	ld	ra,24(sp)
    13c2:	2501                	sext.w	a0,a0
    13c4:	6105                	add	sp,sp,32
    13c6:	8082                	ret

00000000000013c8 <puts>:
{
    13c8:	1141                	add	sp,sp,-16
    13ca:	e406                	sd	ra,8(sp)
    13cc:	e022                	sd	s0,0(sp)
    13ce:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13d0:	574000ef          	jal	1944 <strlen>
    13d4:	862a                	mv	a2,a0
    13d6:	85a2                	mv	a1,s0
    13d8:	4505                	li	a0,1
    13da:	147000ef          	jal	1d20 <write>
}
    13de:	60a2                	ld	ra,8(sp)
    13e0:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13e2:	957d                	sra	a0,a0,0x3f
    return r;
    13e4:	2501                	sext.w	a0,a0
}
    13e6:	0141                	add	sp,sp,16
    13e8:	8082                	ret

00000000000013ea <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13ea:	7171                	add	sp,sp,-176
    13ec:	f85a                	sd	s6,48(sp)
    13ee:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13f0:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13f2:	18bc                	add	a5,sp,120
{
    13f4:	e8ca                	sd	s2,80(sp)
    13f6:	e4ce                	sd	s3,72(sp)
    13f8:	e0d2                	sd	s4,64(sp)
    13fa:	fc56                	sd	s5,56(sp)
    13fc:	f486                	sd	ra,104(sp)
    13fe:	f0a2                	sd	s0,96(sp)
    1400:	eca6                	sd	s1,88(sp)
    1402:	fcae                	sd	a1,120(sp)
    1404:	e132                	sd	a2,128(sp)
    1406:	e536                	sd	a3,136(sp)
    1408:	e93a                	sd	a4,144(sp)
    140a:	f142                	sd	a6,160(sp)
    140c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    140e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1410:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1414:	07300a13          	li	s4,115
    1418:	07800a93          	li	s5,120
    buf[i++] = '0';
    141c:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1420:	00001997          	auipc	s3,0x1
    1424:	ca898993          	add	s3,s3,-856 # 20c8 <digits>
        if (!*s)
    1428:	00054783          	lbu	a5,0(a0)
    142c:	16078a63          	beqz	a5,15a0 <printf+0x1b6>
    1430:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1432:	19278d63          	beq	a5,s2,15cc <printf+0x1e2>
    1436:	00164783          	lbu	a5,1(a2)
    143a:	0605                	add	a2,a2,1
    143c:	fbfd                	bnez	a5,1432 <printf+0x48>
    143e:	84b2                	mv	s1,a2
        l = z - a;
    1440:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1444:	85aa                	mv	a1,a0
    1446:	8622                	mv	a2,s0
    1448:	4505                	li	a0,1
    144a:	0d7000ef          	jal	1d20 <write>
        if (l)
    144e:	1a041463          	bnez	s0,15f6 <printf+0x20c>
        if (s[1] == 0)
    1452:	0014c783          	lbu	a5,1(s1)
    1456:	14078563          	beqz	a5,15a0 <printf+0x1b6>
        switch (s[1])
    145a:	1b478063          	beq	a5,s4,15fa <printf+0x210>
    145e:	14fa6b63          	bltu	s4,a5,15b4 <printf+0x1ca>
    1462:	06400713          	li	a4,100
    1466:	1ee78063          	beq	a5,a4,1646 <printf+0x25c>
    146a:	07000713          	li	a4,112
    146e:	1ae79963          	bne	a5,a4,1620 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1472:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1474:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1478:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    147a:	631c                	ld	a5,0(a4)
    147c:	0721                	add	a4,a4,8
    147e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1480:	00479293          	sll	t0,a5,0x4
    1484:	00879f93          	sll	t6,a5,0x8
    1488:	00c79f13          	sll	t5,a5,0xc
    148c:	01079e93          	sll	t4,a5,0x10
    1490:	01479e13          	sll	t3,a5,0x14
    1494:	01879313          	sll	t1,a5,0x18
    1498:	01c79893          	sll	a7,a5,0x1c
    149c:	02479813          	sll	a6,a5,0x24
    14a0:	02879513          	sll	a0,a5,0x28
    14a4:	02c79593          	sll	a1,a5,0x2c
    14a8:	03079693          	sll	a3,a5,0x30
    14ac:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	03c7d413          	srl	s0,a5,0x3c
    14b4:	01c7d39b          	srlw	t2,a5,0x1c
    14b8:	03c2d293          	srl	t0,t0,0x3c
    14bc:	03cfdf93          	srl	t6,t6,0x3c
    14c0:	03cf5f13          	srl	t5,t5,0x3c
    14c4:	03cede93          	srl	t4,t4,0x3c
    14c8:	03ce5e13          	srl	t3,t3,0x3c
    14cc:	03c35313          	srl	t1,t1,0x3c
    14d0:	03c8d893          	srl	a7,a7,0x3c
    14d4:	03c85813          	srl	a6,a6,0x3c
    14d8:	9171                	srl	a0,a0,0x3c
    14da:	91f1                	srl	a1,a1,0x3c
    14dc:	92f1                	srl	a3,a3,0x3c
    14de:	9371                	srl	a4,a4,0x3c
    14e0:	96ce                	add	a3,a3,s3
    14e2:	974e                	add	a4,a4,s3
    14e4:	944e                	add	s0,s0,s3
    14e6:	92ce                	add	t0,t0,s3
    14e8:	9fce                	add	t6,t6,s3
    14ea:	9f4e                	add	t5,t5,s3
    14ec:	9ece                	add	t4,t4,s3
    14ee:	9e4e                	add	t3,t3,s3
    14f0:	934e                	add	t1,t1,s3
    14f2:	98ce                	add	a7,a7,s3
    14f4:	93ce                	add	t2,t2,s3
    14f6:	984e                	add	a6,a6,s3
    14f8:	954e                	add	a0,a0,s3
    14fa:	95ce                	add	a1,a1,s3
    14fc:	0006c083          	lbu	ra,0(a3)
    1500:	0002c283          	lbu	t0,0(t0)
    1504:	00074683          	lbu	a3,0(a4)
    1508:	000fcf83          	lbu	t6,0(t6)
    150c:	000f4f03          	lbu	t5,0(t5)
    1510:	000ece83          	lbu	t4,0(t4)
    1514:	000e4e03          	lbu	t3,0(t3)
    1518:	00034303          	lbu	t1,0(t1)
    151c:	0008c883          	lbu	a7,0(a7)
    1520:	0003c383          	lbu	t2,0(t2)
    1524:	00084803          	lbu	a6,0(a6)
    1528:	00054503          	lbu	a0,0(a0)
    152c:	0005c583          	lbu	a1,0(a1)
    1530:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1534:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1538:	9371                	srl	a4,a4,0x3c
    153a:	8bbd                	and	a5,a5,15
    153c:	974e                	add	a4,a4,s3
    153e:	97ce                	add	a5,a5,s3
    1540:	005105a3          	sb	t0,11(sp)
    1544:	01f10623          	sb	t6,12(sp)
    1548:	01e106a3          	sb	t5,13(sp)
    154c:	01d10723          	sb	t4,14(sp)
    1550:	01c107a3          	sb	t3,15(sp)
    1554:	00610823          	sb	t1,16(sp)
    1558:	011108a3          	sb	a7,17(sp)
    155c:	00710923          	sb	t2,18(sp)
    1560:	010109a3          	sb	a6,19(sp)
    1564:	00a10a23          	sb	a0,20(sp)
    1568:	00b10aa3          	sb	a1,21(sp)
    156c:	00110b23          	sb	ra,22(sp)
    1570:	00d10ba3          	sb	a3,23(sp)
    1574:	00810523          	sb	s0,10(sp)
    1578:	00074703          	lbu	a4,0(a4)
    157c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1580:	002c                	add	a1,sp,8
    1582:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1584:	00e10c23          	sb	a4,24(sp)
    1588:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    158c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1590:	790000ef          	jal	1d20 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1594:	00248513          	add	a0,s1,2
        if (!*s)
    1598:	00054783          	lbu	a5,0(a0)
    159c:	e8079ae3          	bnez	a5,1430 <printf+0x46>
    }
    va_end(ap);
}
    15a0:	70a6                	ld	ra,104(sp)
    15a2:	7406                	ld	s0,96(sp)
    15a4:	64e6                	ld	s1,88(sp)
    15a6:	6946                	ld	s2,80(sp)
    15a8:	69a6                	ld	s3,72(sp)
    15aa:	6a06                	ld	s4,64(sp)
    15ac:	7ae2                	ld	s5,56(sp)
    15ae:	7b42                	ld	s6,48(sp)
    15b0:	614d                	add	sp,sp,176
    15b2:	8082                	ret
        switch (s[1])
    15b4:	07579663          	bne	a5,s5,1620 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15b8:	6782                	ld	a5,0(sp)
    15ba:	45c1                	li	a1,16
    15bc:	4388                	lw	a0,0(a5)
    15be:	07a1                	add	a5,a5,8
    15c0:	e03e                	sd	a5,0(sp)
    15c2:	bc9ff0ef          	jal	118a <printint.constprop.0>
        s += 2;
    15c6:	00248513          	add	a0,s1,2
    15ca:	b7f9                	j	1598 <printf+0x1ae>
    15cc:	84b2                	mv	s1,a2
    15ce:	a039                	j	15dc <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15d0:	0024c783          	lbu	a5,2(s1)
    15d4:	0605                	add	a2,a2,1
    15d6:	0489                	add	s1,s1,2
    15d8:	e72794e3          	bne	a5,s2,1440 <printf+0x56>
    15dc:	0014c783          	lbu	a5,1(s1)
    15e0:	ff2788e3          	beq	a5,s2,15d0 <printf+0x1e6>
        l = z - a;
    15e4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15e8:	85aa                	mv	a1,a0
    15ea:	8622                	mv	a2,s0
    15ec:	4505                	li	a0,1
    15ee:	732000ef          	jal	1d20 <write>
        if (l)
    15f2:	e60400e3          	beqz	s0,1452 <printf+0x68>
    15f6:	8526                	mv	a0,s1
    15f8:	bd05                	j	1428 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15fa:	6782                	ld	a5,0(sp)
    15fc:	6380                	ld	s0,0(a5)
    15fe:	07a1                	add	a5,a5,8
    1600:	e03e                	sd	a5,0(sp)
    1602:	cc21                	beqz	s0,165a <printf+0x270>
            l = strnlen(a, 200);
    1604:	0c800593          	li	a1,200
    1608:	8522                	mv	a0,s0
    160a:	424000ef          	jal	1a2e <strnlen>
    write(f, s, l);
    160e:	0005061b          	sext.w	a2,a0
    1612:	85a2                	mv	a1,s0
    1614:	4505                	li	a0,1
    1616:	70a000ef          	jal	1d20 <write>
        s += 2;
    161a:	00248513          	add	a0,s1,2
    161e:	bfad                	j	1598 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1620:	4605                	li	a2,1
    1622:	002c                	add	a1,sp,8
    1624:	4505                	li	a0,1
    char byte = c;
    1626:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    162a:	6f6000ef          	jal	1d20 <write>
    char byte = c;
    162e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1632:	4605                	li	a2,1
    1634:	002c                	add	a1,sp,8
    1636:	4505                	li	a0,1
    char byte = c;
    1638:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    163c:	6e4000ef          	jal	1d20 <write>
        s += 2;
    1640:	00248513          	add	a0,s1,2
    1644:	bf91                	j	1598 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1646:	6782                	ld	a5,0(sp)
    1648:	45a9                	li	a1,10
    164a:	4388                	lw	a0,0(a5)
    164c:	07a1                	add	a5,a5,8
    164e:	e03e                	sd	a5,0(sp)
    1650:	b3bff0ef          	jal	118a <printint.constprop.0>
        s += 2;
    1654:	00248513          	add	a0,s1,2
    1658:	b781                	j	1598 <printf+0x1ae>
                a = "(null)";
    165a:	00001417          	auipc	s0,0x1
    165e:	a2e40413          	add	s0,s0,-1490 # 2088 <__clone+0x10a>
    1662:	b74d                	j	1604 <printf+0x21a>

0000000000001664 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1664:	1141                	add	sp,sp,-16
    1666:	e406                	sd	ra,8(sp)
    puts(m);
    1668:	d61ff0ef          	jal	13c8 <puts>
    exit(-100);
}
    166c:	60a2                	ld	ra,8(sp)
    exit(-100);
    166e:	f9c00513          	li	a0,-100
}
    1672:	0141                	add	sp,sp,16
    exit(-100);
    1674:	a719                	j	1d7a <exit>

0000000000001676 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1676:	02000793          	li	a5,32
    167a:	00f50663          	beq	a0,a5,1686 <isspace+0x10>
    167e:	355d                	addw	a0,a0,-9
    1680:	00553513          	sltiu	a0,a0,5
    1684:	8082                	ret
    1686:	4505                	li	a0,1
}
    1688:	8082                	ret

000000000000168a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    168a:	fd05051b          	addw	a0,a0,-48
}
    168e:	00a53513          	sltiu	a0,a0,10
    1692:	8082                	ret

0000000000001694 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1694:	02000693          	li	a3,32
    1698:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    169a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    169e:	ff77871b          	addw	a4,a5,-9
    16a2:	04d78c63          	beq	a5,a3,16fa <atoi+0x66>
    16a6:	0007861b          	sext.w	a2,a5
    16aa:	04e5f863          	bgeu	a1,a4,16fa <atoi+0x66>
        s++;
    switch (*s)
    16ae:	02b00713          	li	a4,43
    16b2:	04e78963          	beq	a5,a4,1704 <atoi+0x70>
    16b6:	02d00713          	li	a4,45
    16ba:	06e78263          	beq	a5,a4,171e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16be:	fd06069b          	addw	a3,a2,-48
    16c2:	47a5                	li	a5,9
    16c4:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16c6:	4301                	li	t1,0
    while (isdigit(*s))
    16c8:	04d7e963          	bltu	a5,a3,171a <atoi+0x86>
    int n = 0, neg = 0;
    16cc:	4501                	li	a0,0
    while (isdigit(*s))
    16ce:	48a5                	li	a7,9
    16d0:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16d4:	0025179b          	sllw	a5,a0,0x2
    16d8:	9fa9                	addw	a5,a5,a0
    16da:	fd06059b          	addw	a1,a2,-48
    16de:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16e2:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16e6:	0705                	add	a4,a4,1
    16e8:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16ec:	0006861b          	sext.w	a2,a3
    16f0:	ff08f0e3          	bgeu	a7,a6,16d0 <atoi+0x3c>
    return neg ? n : -n;
    16f4:	00030563          	beqz	t1,16fe <atoi+0x6a>
}
    16f8:	8082                	ret
        s++;
    16fa:	0505                	add	a0,a0,1
    16fc:	bf79                	j	169a <atoi+0x6>
    return neg ? n : -n;
    16fe:	40f5853b          	subw	a0,a1,a5
    1702:	8082                	ret
    while (isdigit(*s))
    1704:	00154603          	lbu	a2,1(a0)
    1708:	47a5                	li	a5,9
        s++;
    170a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    170e:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1712:	4301                	li	t1,0
    while (isdigit(*s))
    1714:	2601                	sext.w	a2,a2
    1716:	fad7fbe3          	bgeu	a5,a3,16cc <atoi+0x38>
    171a:	4501                	li	a0,0
}
    171c:	8082                	ret
    while (isdigit(*s))
    171e:	00154603          	lbu	a2,1(a0)
    1722:	47a5                	li	a5,9
        s++;
    1724:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1728:	fd06069b          	addw	a3,a2,-48
    172c:	2601                	sext.w	a2,a2
    172e:	fed7e6e3          	bltu	a5,a3,171a <atoi+0x86>
        neg = 1;
    1732:	4305                	li	t1,1
    1734:	bf61                	j	16cc <atoi+0x38>

0000000000001736 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1736:	18060163          	beqz	a2,18b8 <memset+0x182>
    173a:	40a006b3          	neg	a3,a0
    173e:	0076f793          	and	a5,a3,7
    1742:	00778813          	add	a6,a5,7
    1746:	48ad                	li	a7,11
    1748:	0ff5f713          	zext.b	a4,a1
    174c:	fff60593          	add	a1,a2,-1
    1750:	17186563          	bltu	a6,a7,18ba <memset+0x184>
    1754:	1705ed63          	bltu	a1,a6,18ce <memset+0x198>
    1758:	16078363          	beqz	a5,18be <memset+0x188>
    175c:	00e50023          	sb	a4,0(a0)
    1760:	0066f593          	and	a1,a3,6
    1764:	16058063          	beqz	a1,18c4 <memset+0x18e>
    1768:	00e500a3          	sb	a4,1(a0)
    176c:	4589                	li	a1,2
    176e:	16f5f363          	bgeu	a1,a5,18d4 <memset+0x19e>
    1772:	00e50123          	sb	a4,2(a0)
    1776:	8a91                	and	a3,a3,4
    1778:	00350593          	add	a1,a0,3
    177c:	4e0d                	li	t3,3
    177e:	ce9d                	beqz	a3,17bc <memset+0x86>
    1780:	00e501a3          	sb	a4,3(a0)
    1784:	4691                	li	a3,4
    1786:	00450593          	add	a1,a0,4
    178a:	4e11                	li	t3,4
    178c:	02f6f863          	bgeu	a3,a5,17bc <memset+0x86>
    1790:	00e50223          	sb	a4,4(a0)
    1794:	4695                	li	a3,5
    1796:	00550593          	add	a1,a0,5
    179a:	4e15                	li	t3,5
    179c:	02d78063          	beq	a5,a3,17bc <memset+0x86>
    17a0:	fff50693          	add	a3,a0,-1
    17a4:	00e502a3          	sb	a4,5(a0)
    17a8:	8a9d                	and	a3,a3,7
    17aa:	00650593          	add	a1,a0,6
    17ae:	4e19                	li	t3,6
    17b0:	e691                	bnez	a3,17bc <memset+0x86>
    17b2:	00750593          	add	a1,a0,7
    17b6:	00e50323          	sb	a4,6(a0)
    17ba:	4e1d                	li	t3,7
    17bc:	00871693          	sll	a3,a4,0x8
    17c0:	01071813          	sll	a6,a4,0x10
    17c4:	8ed9                	or	a3,a3,a4
    17c6:	01871893          	sll	a7,a4,0x18
    17ca:	0106e6b3          	or	a3,a3,a6
    17ce:	0116e6b3          	or	a3,a3,a7
    17d2:	02071813          	sll	a6,a4,0x20
    17d6:	02871313          	sll	t1,a4,0x28
    17da:	0106e6b3          	or	a3,a3,a6
    17de:	40f608b3          	sub	a7,a2,a5
    17e2:	03071813          	sll	a6,a4,0x30
    17e6:	0066e6b3          	or	a3,a3,t1
    17ea:	0106e6b3          	or	a3,a3,a6
    17ee:	03871313          	sll	t1,a4,0x38
    17f2:	97aa                	add	a5,a5,a0
    17f4:	ff88f813          	and	a6,a7,-8
    17f8:	0066e6b3          	or	a3,a3,t1
    17fc:	983e                	add	a6,a6,a5
    17fe:	e394                	sd	a3,0(a5)
    1800:	07a1                	add	a5,a5,8
    1802:	ff079ee3          	bne	a5,a6,17fe <memset+0xc8>
    1806:	ff88f793          	and	a5,a7,-8
    180a:	0078f893          	and	a7,a7,7
    180e:	00f586b3          	add	a3,a1,a5
    1812:	01c787bb          	addw	a5,a5,t3
    1816:	0a088b63          	beqz	a7,18cc <memset+0x196>
    181a:	00e68023          	sb	a4,0(a3)
    181e:	0017859b          	addw	a1,a5,1
    1822:	08c5fb63          	bgeu	a1,a2,18b8 <memset+0x182>
    1826:	00e680a3          	sb	a4,1(a3)
    182a:	0027859b          	addw	a1,a5,2
    182e:	08c5f563          	bgeu	a1,a2,18b8 <memset+0x182>
    1832:	00e68123          	sb	a4,2(a3)
    1836:	0037859b          	addw	a1,a5,3
    183a:	06c5ff63          	bgeu	a1,a2,18b8 <memset+0x182>
    183e:	00e681a3          	sb	a4,3(a3)
    1842:	0047859b          	addw	a1,a5,4
    1846:	06c5f963          	bgeu	a1,a2,18b8 <memset+0x182>
    184a:	00e68223          	sb	a4,4(a3)
    184e:	0057859b          	addw	a1,a5,5
    1852:	06c5f363          	bgeu	a1,a2,18b8 <memset+0x182>
    1856:	00e682a3          	sb	a4,5(a3)
    185a:	0067859b          	addw	a1,a5,6
    185e:	04c5fd63          	bgeu	a1,a2,18b8 <memset+0x182>
    1862:	00e68323          	sb	a4,6(a3)
    1866:	0077859b          	addw	a1,a5,7
    186a:	04c5f763          	bgeu	a1,a2,18b8 <memset+0x182>
    186e:	00e683a3          	sb	a4,7(a3)
    1872:	0087859b          	addw	a1,a5,8
    1876:	04c5f163          	bgeu	a1,a2,18b8 <memset+0x182>
    187a:	00e68423          	sb	a4,8(a3)
    187e:	0097859b          	addw	a1,a5,9
    1882:	02c5fb63          	bgeu	a1,a2,18b8 <memset+0x182>
    1886:	00e684a3          	sb	a4,9(a3)
    188a:	00a7859b          	addw	a1,a5,10
    188e:	02c5f563          	bgeu	a1,a2,18b8 <memset+0x182>
    1892:	00e68523          	sb	a4,10(a3)
    1896:	00b7859b          	addw	a1,a5,11
    189a:	00c5ff63          	bgeu	a1,a2,18b8 <memset+0x182>
    189e:	00e685a3          	sb	a4,11(a3)
    18a2:	00c7859b          	addw	a1,a5,12
    18a6:	00c5f963          	bgeu	a1,a2,18b8 <memset+0x182>
    18aa:	00e68623          	sb	a4,12(a3)
    18ae:	27b5                	addw	a5,a5,13
    18b0:	00c7f463          	bgeu	a5,a2,18b8 <memset+0x182>
    18b4:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18b8:	8082                	ret
    18ba:	482d                	li	a6,11
    18bc:	bd61                	j	1754 <memset+0x1e>
    char *p = dest;
    18be:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18c0:	4e01                	li	t3,0
    18c2:	bded                	j	17bc <memset+0x86>
    18c4:	00150593          	add	a1,a0,1
    18c8:	4e05                	li	t3,1
    18ca:	bdcd                	j	17bc <memset+0x86>
    18cc:	8082                	ret
    char *p = dest;
    18ce:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18d0:	4781                	li	a5,0
    18d2:	b7a1                	j	181a <memset+0xe4>
    18d4:	00250593          	add	a1,a0,2
    18d8:	4e09                	li	t3,2
    18da:	b5cd                	j	17bc <memset+0x86>

00000000000018dc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18dc:	00054783          	lbu	a5,0(a0)
    18e0:	0005c703          	lbu	a4,0(a1)
    18e4:	00e79863          	bne	a5,a4,18f4 <strcmp+0x18>
    18e8:	0505                	add	a0,a0,1
    18ea:	0585                	add	a1,a1,1
    18ec:	fbe5                	bnez	a5,18dc <strcmp>
    18ee:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18f0:	9d19                	subw	a0,a0,a4
    18f2:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18f4:	0007851b          	sext.w	a0,a5
    18f8:	bfe5                	j	18f0 <strcmp+0x14>

00000000000018fa <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18fa:	ca15                	beqz	a2,192e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18fc:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1900:	167d                	add	a2,a2,-1
    1902:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1906:	eb99                	bnez	a5,191c <strncmp+0x22>
    1908:	a815                	j	193c <strncmp+0x42>
    190a:	00a68e63          	beq	a3,a0,1926 <strncmp+0x2c>
    190e:	0505                	add	a0,a0,1
    1910:	00f71b63          	bne	a4,a5,1926 <strncmp+0x2c>
    1914:	00054783          	lbu	a5,0(a0)
    1918:	cf89                	beqz	a5,1932 <strncmp+0x38>
    191a:	85b2                	mv	a1,a2
    191c:	0005c703          	lbu	a4,0(a1)
    1920:	00158613          	add	a2,a1,1
    1924:	f37d                	bnez	a4,190a <strncmp+0x10>
        ;
    return *l - *r;
    1926:	0007851b          	sext.w	a0,a5
    192a:	9d19                	subw	a0,a0,a4
    192c:	8082                	ret
        return 0;
    192e:	4501                	li	a0,0
}
    1930:	8082                	ret
    return *l - *r;
    1932:	0015c703          	lbu	a4,1(a1)
    1936:	4501                	li	a0,0
    1938:	9d19                	subw	a0,a0,a4
    193a:	8082                	ret
    193c:	0005c703          	lbu	a4,0(a1)
    1940:	4501                	li	a0,0
    1942:	b7e5                	j	192a <strncmp+0x30>

0000000000001944 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1944:	00757793          	and	a5,a0,7
    1948:	cf89                	beqz	a5,1962 <strlen+0x1e>
    194a:	87aa                	mv	a5,a0
    194c:	a029                	j	1956 <strlen+0x12>
    194e:	0785                	add	a5,a5,1
    1950:	0077f713          	and	a4,a5,7
    1954:	cb01                	beqz	a4,1964 <strlen+0x20>
        if (!*s)
    1956:	0007c703          	lbu	a4,0(a5)
    195a:	fb75                	bnez	a4,194e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    195c:	40a78533          	sub	a0,a5,a0
}
    1960:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1962:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1964:	6394                	ld	a3,0(a5)
    1966:	00000597          	auipc	a1,0x0
    196a:	72a5b583          	ld	a1,1834(a1) # 2090 <__clone+0x112>
    196e:	00000617          	auipc	a2,0x0
    1972:	72a63603          	ld	a2,1834(a2) # 2098 <__clone+0x11a>
    1976:	a019                	j	197c <strlen+0x38>
    1978:	6794                	ld	a3,8(a5)
    197a:	07a1                	add	a5,a5,8
    197c:	00b68733          	add	a4,a3,a1
    1980:	fff6c693          	not	a3,a3
    1984:	8f75                	and	a4,a4,a3
    1986:	8f71                	and	a4,a4,a2
    1988:	db65                	beqz	a4,1978 <strlen+0x34>
    for (; *s; s++)
    198a:	0007c703          	lbu	a4,0(a5)
    198e:	d779                	beqz	a4,195c <strlen+0x18>
    1990:	0017c703          	lbu	a4,1(a5)
    1994:	0785                	add	a5,a5,1
    1996:	d379                	beqz	a4,195c <strlen+0x18>
    1998:	0017c703          	lbu	a4,1(a5)
    199c:	0785                	add	a5,a5,1
    199e:	fb6d                	bnez	a4,1990 <strlen+0x4c>
    19a0:	bf75                	j	195c <strlen+0x18>

00000000000019a2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a2:	00757713          	and	a4,a0,7
{
    19a6:	87aa                	mv	a5,a0
    19a8:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19ac:	cb19                	beqz	a4,19c2 <memchr+0x20>
    19ae:	ce25                	beqz	a2,1a26 <memchr+0x84>
    19b0:	0007c703          	lbu	a4,0(a5)
    19b4:	00b70763          	beq	a4,a1,19c2 <memchr+0x20>
    19b8:	0785                	add	a5,a5,1
    19ba:	0077f713          	and	a4,a5,7
    19be:	167d                	add	a2,a2,-1
    19c0:	f77d                	bnez	a4,19ae <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19c2:	4501                	li	a0,0
    if (n && *s != c)
    19c4:	c235                	beqz	a2,1a28 <memchr+0x86>
    19c6:	0007c703          	lbu	a4,0(a5)
    19ca:	06b70063          	beq	a4,a1,1a2a <memchr+0x88>
        size_t k = ONES * c;
    19ce:	00000517          	auipc	a0,0x0
    19d2:	6d253503          	ld	a0,1746(a0) # 20a0 <__clone+0x122>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d6:	471d                	li	a4,7
        size_t k = ONES * c;
    19d8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19dc:	04c77763          	bgeu	a4,a2,1a2a <memchr+0x88>
    19e0:	00000897          	auipc	a7,0x0
    19e4:	6b08b883          	ld	a7,1712(a7) # 2090 <__clone+0x112>
    19e8:	00000817          	auipc	a6,0x0
    19ec:	6b083803          	ld	a6,1712(a6) # 2098 <__clone+0x11a>
    19f0:	431d                	li	t1,7
    19f2:	a029                	j	19fc <memchr+0x5a>
    19f4:	1661                	add	a2,a2,-8
    19f6:	07a1                	add	a5,a5,8
    19f8:	00c37c63          	bgeu	t1,a2,1a10 <memchr+0x6e>
    19fc:	6398                	ld	a4,0(a5)
    19fe:	8f29                	xor	a4,a4,a0
    1a00:	011706b3          	add	a3,a4,a7
    1a04:	fff74713          	not	a4,a4
    1a08:	8f75                	and	a4,a4,a3
    1a0a:	01077733          	and	a4,a4,a6
    1a0e:	d37d                	beqz	a4,19f4 <memchr+0x52>
    1a10:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a12:	e601                	bnez	a2,1a1a <memchr+0x78>
    1a14:	a809                	j	1a26 <memchr+0x84>
    1a16:	0505                	add	a0,a0,1
    1a18:	c619                	beqz	a2,1a26 <memchr+0x84>
    1a1a:	00054783          	lbu	a5,0(a0)
    1a1e:	167d                	add	a2,a2,-1
    1a20:	feb79be3          	bne	a5,a1,1a16 <memchr+0x74>
    1a24:	8082                	ret
    return n ? (void *)s : 0;
    1a26:	4501                	li	a0,0
}
    1a28:	8082                	ret
    if (n && *s != c)
    1a2a:	853e                	mv	a0,a5
    1a2c:	b7fd                	j	1a1a <memchr+0x78>

0000000000001a2e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a2e:	1101                	add	sp,sp,-32
    1a30:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a32:	862e                	mv	a2,a1
{
    1a34:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a36:	4581                	li	a1,0
{
    1a38:	e426                	sd	s1,8(sp)
    1a3a:	ec06                	sd	ra,24(sp)
    1a3c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a3e:	f65ff0ef          	jal	19a2 <memchr>
    return p ? p - s : n;
    1a42:	c519                	beqz	a0,1a50 <strnlen+0x22>
}
    1a44:	60e2                	ld	ra,24(sp)
    1a46:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a48:	8d05                	sub	a0,a0,s1
}
    1a4a:	64a2                	ld	s1,8(sp)
    1a4c:	6105                	add	sp,sp,32
    1a4e:	8082                	ret
    1a50:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a52:	8522                	mv	a0,s0
}
    1a54:	6442                	ld	s0,16(sp)
    1a56:	64a2                	ld	s1,8(sp)
    1a58:	6105                	add	sp,sp,32
    1a5a:	8082                	ret

0000000000001a5c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a5c:	00a5c7b3          	xor	a5,a1,a0
    1a60:	8b9d                	and	a5,a5,7
    1a62:	eb95                	bnez	a5,1a96 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a64:	0075f793          	and	a5,a1,7
    1a68:	e7b1                	bnez	a5,1ab4 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a6a:	6198                	ld	a4,0(a1)
    1a6c:	00000617          	auipc	a2,0x0
    1a70:	62463603          	ld	a2,1572(a2) # 2090 <__clone+0x112>
    1a74:	00000817          	auipc	a6,0x0
    1a78:	62483803          	ld	a6,1572(a6) # 2098 <__clone+0x11a>
    1a7c:	a029                	j	1a86 <strcpy+0x2a>
    1a7e:	05a1                	add	a1,a1,8
    1a80:	e118                	sd	a4,0(a0)
    1a82:	6198                	ld	a4,0(a1)
    1a84:	0521                	add	a0,a0,8
    1a86:	00c707b3          	add	a5,a4,a2
    1a8a:	fff74693          	not	a3,a4
    1a8e:	8ff5                	and	a5,a5,a3
    1a90:	0107f7b3          	and	a5,a5,a6
    1a94:	d7ed                	beqz	a5,1a7e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	00f50023          	sb	a5,0(a0)
    1a9e:	c785                	beqz	a5,1ac6 <strcpy+0x6a>
    1aa0:	0015c783          	lbu	a5,1(a1)
    1aa4:	0505                	add	a0,a0,1
    1aa6:	0585                	add	a1,a1,1
    1aa8:	00f50023          	sb	a5,0(a0)
    1aac:	fbf5                	bnez	a5,1aa0 <strcpy+0x44>
        ;
    return d;
}
    1aae:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ab0:	0505                	add	a0,a0,1
    1ab2:	df45                	beqz	a4,1a6a <strcpy+0xe>
            if (!(*d = *s))
    1ab4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ab8:	0585                	add	a1,a1,1
    1aba:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1abe:	00f50023          	sb	a5,0(a0)
    1ac2:	f7fd                	bnez	a5,1ab0 <strcpy+0x54>
}
    1ac4:	8082                	ret
    1ac6:	8082                	ret

0000000000001ac8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac8:	00a5c7b3          	xor	a5,a1,a0
    1acc:	8b9d                	and	a5,a5,7
    1ace:	e3b5                	bnez	a5,1b32 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ad0:	0075f793          	and	a5,a1,7
    1ad4:	cf99                	beqz	a5,1af2 <strncpy+0x2a>
    1ad6:	ea09                	bnez	a2,1ae8 <strncpy+0x20>
    1ad8:	a421                	j	1ce0 <strncpy+0x218>
    1ada:	0585                	add	a1,a1,1
    1adc:	0075f793          	and	a5,a1,7
    1ae0:	167d                	add	a2,a2,-1
    1ae2:	0505                	add	a0,a0,1
    1ae4:	c799                	beqz	a5,1af2 <strncpy+0x2a>
    1ae6:	c225                	beqz	a2,1b46 <strncpy+0x7e>
    1ae8:	0005c783          	lbu	a5,0(a1)
    1aec:	00f50023          	sb	a5,0(a0)
    1af0:	f7ed                	bnez	a5,1ada <strncpy+0x12>
            ;
        if (!n || !*s)
    1af2:	ca31                	beqz	a2,1b46 <strncpy+0x7e>
    1af4:	0005c783          	lbu	a5,0(a1)
    1af8:	cba1                	beqz	a5,1b48 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1afa:	479d                	li	a5,7
    1afc:	02c7fc63          	bgeu	a5,a2,1b34 <strncpy+0x6c>
    1b00:	00000897          	auipc	a7,0x0
    1b04:	5908b883          	ld	a7,1424(a7) # 2090 <__clone+0x112>
    1b08:	00000817          	auipc	a6,0x0
    1b0c:	59083803          	ld	a6,1424(a6) # 2098 <__clone+0x11a>
    1b10:	431d                	li	t1,7
    1b12:	a039                	j	1b20 <strncpy+0x58>
            *wd = *ws;
    1b14:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b16:	1661                	add	a2,a2,-8
    1b18:	05a1                	add	a1,a1,8
    1b1a:	0521                	add	a0,a0,8
    1b1c:	00c37b63          	bgeu	t1,a2,1b32 <strncpy+0x6a>
    1b20:	6198                	ld	a4,0(a1)
    1b22:	011707b3          	add	a5,a4,a7
    1b26:	fff74693          	not	a3,a4
    1b2a:	8ff5                	and	a5,a5,a3
    1b2c:	0107f7b3          	and	a5,a5,a6
    1b30:	d3f5                	beqz	a5,1b14 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b32:	ca11                	beqz	a2,1b46 <strncpy+0x7e>
    1b34:	0005c783          	lbu	a5,0(a1)
    1b38:	0585                	add	a1,a1,1
    1b3a:	00f50023          	sb	a5,0(a0)
    1b3e:	c789                	beqz	a5,1b48 <strncpy+0x80>
    1b40:	167d                	add	a2,a2,-1
    1b42:	0505                	add	a0,a0,1
    1b44:	fa65                	bnez	a2,1b34 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b46:	8082                	ret
    1b48:	4805                	li	a6,1
    1b4a:	14061b63          	bnez	a2,1ca0 <strncpy+0x1d8>
    1b4e:	40a00733          	neg	a4,a0
    1b52:	00777793          	and	a5,a4,7
    1b56:	4581                	li	a1,0
    1b58:	12061c63          	bnez	a2,1c90 <strncpy+0x1c8>
    1b5c:	00778693          	add	a3,a5,7
    1b60:	48ad                	li	a7,11
    1b62:	1316e563          	bltu	a3,a7,1c8c <strncpy+0x1c4>
    1b66:	16d5e263          	bltu	a1,a3,1cca <strncpy+0x202>
    1b6a:	14078c63          	beqz	a5,1cc2 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b6e:	00050023          	sb	zero,0(a0)
    1b72:	00677693          	and	a3,a4,6
    1b76:	14068263          	beqz	a3,1cba <strncpy+0x1f2>
    1b7a:	000500a3          	sb	zero,1(a0)
    1b7e:	4689                	li	a3,2
    1b80:	14f6f863          	bgeu	a3,a5,1cd0 <strncpy+0x208>
    1b84:	00050123          	sb	zero,2(a0)
    1b88:	8b11                	and	a4,a4,4
    1b8a:	12070463          	beqz	a4,1cb2 <strncpy+0x1ea>
    1b8e:	000501a3          	sb	zero,3(a0)
    1b92:	4711                	li	a4,4
    1b94:	00450693          	add	a3,a0,4
    1b98:	02f77563          	bgeu	a4,a5,1bc2 <strncpy+0xfa>
    1b9c:	00050223          	sb	zero,4(a0)
    1ba0:	4715                	li	a4,5
    1ba2:	00550693          	add	a3,a0,5
    1ba6:	00e78e63          	beq	a5,a4,1bc2 <strncpy+0xfa>
    1baa:	fff50713          	add	a4,a0,-1
    1bae:	000502a3          	sb	zero,5(a0)
    1bb2:	8b1d                	and	a4,a4,7
    1bb4:	12071263          	bnez	a4,1cd8 <strncpy+0x210>
    1bb8:	00750693          	add	a3,a0,7
    1bbc:	00050323          	sb	zero,6(a0)
    1bc0:	471d                	li	a4,7
    1bc2:	40f80833          	sub	a6,a6,a5
    1bc6:	ff887593          	and	a1,a6,-8
    1bca:	97aa                	add	a5,a5,a0
    1bcc:	95be                	add	a1,a1,a5
    1bce:	0007b023          	sd	zero,0(a5)
    1bd2:	07a1                	add	a5,a5,8
    1bd4:	feb79de3          	bne	a5,a1,1bce <strncpy+0x106>
    1bd8:	ff887593          	and	a1,a6,-8
    1bdc:	00787813          	and	a6,a6,7
    1be0:	00e587bb          	addw	a5,a1,a4
    1be4:	00b68733          	add	a4,a3,a1
    1be8:	0e080063          	beqz	a6,1cc8 <strncpy+0x200>
    1bec:	00070023          	sb	zero,0(a4)
    1bf0:	0017869b          	addw	a3,a5,1
    1bf4:	f4c6f9e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1bf8:	000700a3          	sb	zero,1(a4)
    1bfc:	0027869b          	addw	a3,a5,2
    1c00:	f4c6f3e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c04:	00070123          	sb	zero,2(a4)
    1c08:	0037869b          	addw	a3,a5,3
    1c0c:	f2c6fde3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c10:	000701a3          	sb	zero,3(a4)
    1c14:	0047869b          	addw	a3,a5,4
    1c18:	f2c6f7e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c1c:	00070223          	sb	zero,4(a4)
    1c20:	0057869b          	addw	a3,a5,5
    1c24:	f2c6f1e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c28:	000702a3          	sb	zero,5(a4)
    1c2c:	0067869b          	addw	a3,a5,6
    1c30:	f0c6fbe3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c34:	00070323          	sb	zero,6(a4)
    1c38:	0077869b          	addw	a3,a5,7
    1c3c:	f0c6f5e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c40:	000703a3          	sb	zero,7(a4)
    1c44:	0087869b          	addw	a3,a5,8
    1c48:	eec6ffe3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c4c:	00070423          	sb	zero,8(a4)
    1c50:	0097869b          	addw	a3,a5,9
    1c54:	eec6f9e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c58:	000704a3          	sb	zero,9(a4)
    1c5c:	00a7869b          	addw	a3,a5,10
    1c60:	eec6f3e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c64:	00070523          	sb	zero,10(a4)
    1c68:	00b7869b          	addw	a3,a5,11
    1c6c:	ecc6fde3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c70:	000705a3          	sb	zero,11(a4)
    1c74:	00c7869b          	addw	a3,a5,12
    1c78:	ecc6f7e3          	bgeu	a3,a2,1b46 <strncpy+0x7e>
    1c7c:	00070623          	sb	zero,12(a4)
    1c80:	27b5                	addw	a5,a5,13
    1c82:	ecc7f2e3          	bgeu	a5,a2,1b46 <strncpy+0x7e>
    1c86:	000706a3          	sb	zero,13(a4)
}
    1c8a:	8082                	ret
    1c8c:	46ad                	li	a3,11
    1c8e:	bde1                	j	1b66 <strncpy+0x9e>
    1c90:	00778693          	add	a3,a5,7
    1c94:	48ad                	li	a7,11
    1c96:	fff60593          	add	a1,a2,-1
    1c9a:	ed16f6e3          	bgeu	a3,a7,1b66 <strncpy+0x9e>
    1c9e:	b7fd                	j	1c8c <strncpy+0x1c4>
    1ca0:	40a00733          	neg	a4,a0
    1ca4:	8832                	mv	a6,a2
    1ca6:	00777793          	and	a5,a4,7
    1caa:	4581                	li	a1,0
    1cac:	ea0608e3          	beqz	a2,1b5c <strncpy+0x94>
    1cb0:	b7c5                	j	1c90 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb2:	00350693          	add	a3,a0,3
    1cb6:	470d                	li	a4,3
    1cb8:	b729                	j	1bc2 <strncpy+0xfa>
    1cba:	00150693          	add	a3,a0,1
    1cbe:	4705                	li	a4,1
    1cc0:	b709                	j	1bc2 <strncpy+0xfa>
tail:
    1cc2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cc4:	4701                	li	a4,0
    1cc6:	bdf5                	j	1bc2 <strncpy+0xfa>
    1cc8:	8082                	ret
tail:
    1cca:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ccc:	4781                	li	a5,0
    1cce:	bf39                	j	1bec <strncpy+0x124>
    1cd0:	00250693          	add	a3,a0,2
    1cd4:	4709                	li	a4,2
    1cd6:	b5f5                	j	1bc2 <strncpy+0xfa>
    1cd8:	00650693          	add	a3,a0,6
    1cdc:	4719                	li	a4,6
    1cde:	b5d5                	j	1bc2 <strncpy+0xfa>
    1ce0:	8082                	ret

0000000000001ce2 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1ce2:	87aa                	mv	a5,a0
    1ce4:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1ce6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cea:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cee:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cf0:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf2:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <openat>:
    register long a7 __asm__("a7") = n;
    1cfa:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cfe:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d02:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <close>:
    register long a7 __asm__("a7") = n;
    1d0a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <read>:
    register long a7 __asm__("a7") = n;
    1d16:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d1e:	8082                	ret

0000000000001d20 <write>:
    register long a7 __asm__("a7") = n;
    1d20:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d24:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d28:	8082                	ret

0000000000001d2a <getpid>:
    register long a7 __asm__("a7") = n;
    1d2a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d2e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <getppid>:
    register long a7 __asm__("a7") = n;
    1d36:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d3a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d42:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d46:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <fork>:
    register long a7 __asm__("a7") = n;
    1d4e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d52:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d54:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d5e:	85b2                	mv	a1,a2
    1d60:	863a                	mv	a2,a4
    if (stack)
    1d62:	c191                	beqz	a1,1d66 <clone+0x8>
	stack += stack_size;
    1d64:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d66:	4781                	li	a5,0
    1d68:	4701                	li	a4,0
    1d6a:	4681                	li	a3,0
    1d6c:	2601                	sext.w	a2,a2
    1d6e:	ac01                	j	1f7e <__clone>

0000000000001d70 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d70:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d74:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d78:	8082                	ret

0000000000001d7a <exit>:
    register long a7 __asm__("a7") = n;
    1d7a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d7e:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d82:	8082                	ret

0000000000001d84 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d84:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d88:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <exec>:
    register long a7 __asm__("a7") = n;
    1d92:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d96:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <execve>:
    register long a7 __asm__("a7") = n;
    1d9e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <times>:
    register long a7 __asm__("a7") = n;
    1daa:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <get_time>:

int64 get_time()
{
    1db6:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1db8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dbc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	ed09                	bnez	a0,1de0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dc8:	67a2                	ld	a5,8(sp)
    1dca:	3e800713          	li	a4,1000
    1dce:	00015503          	lhu	a0,0(sp)
    1dd2:	02e7d7b3          	divu	a5,a5,a4
    1dd6:	02e50533          	mul	a0,a0,a4
    1dda:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ddc:	0141                	add	sp,sp,16
    1dde:	8082                	ret
        return -1;
    1de0:	557d                	li	a0,-1
    1de2:	bfed                	j	1ddc <get_time+0x26>

0000000000001de4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1de4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <time>:
    register long a7 __asm__("a7") = n;
    1df0:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <sleep>:

int sleep(unsigned long long time)
{
    1dfc:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dfe:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e00:	850a                	mv	a0,sp
    1e02:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e04:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e08:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e0e:	e501                	bnez	a0,1e16 <sleep+0x1a>
    return 0;
    1e10:	4501                	li	a0,0
}
    1e12:	0141                	add	sp,sp,16
    1e14:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e16:	4502                	lw	a0,0(sp)
}
    1e18:	0141                	add	sp,sp,16
    1e1a:	8082                	ret

0000000000001e1c <set_priority>:
    register long a7 __asm__("a7") = n;
    1e1c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e28:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e2c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e30:	8082                	ret

0000000000001e32 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e32:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e36:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <munmap>:
    register long a7 __asm__("a7") = n;
    1e3e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e42:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <wait>:

int wait(int *code)
{
    1e4a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e4c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e50:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e52:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e54:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e56:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <spawn>:
    register long a7 __asm__("a7") = n;
    1e5e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <mailread>:
    register long a7 __asm__("a7") = n;
    1e6a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e76:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <fstat>:
    register long a7 __asm__("a7") = n;
    1e82:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e86:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e8e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e90:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e94:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e9e:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ea0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ea4:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eae:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eb0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eb4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <link>:

int link(char *old_path, char *new_path)
{
    1ebe:	87aa                	mv	a5,a0
    1ec0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ec2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ec6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eca:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ecc:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ed0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <unlink>:

int unlink(char *path)
{
    1eda:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1edc:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ee0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ee4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <uname>:
    register long a7 __asm__("a7") = n;
    1eee:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ef2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <brk>:
    register long a7 __asm__("a7") = n;
    1efa:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1efe:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f06:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f08:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f0c:	8082                	ret

0000000000001f0e <chdir>:
    register long a7 __asm__("a7") = n;
    1f0e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f12:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f1a:	862e                	mv	a2,a1
    1f1c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f1e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f20:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f2a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <getdents>:
    register long a7 __asm__("a7") = n;
    1f34:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f38:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <pipe>:
    register long a7 __asm__("a7") = n;
    1f40:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f44:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f46:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <dup>:
    register long a7 __asm__("a7") = n;
    1f4e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f50:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <dup2>:
    register long a7 __asm__("a7") = n;
    1f58:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f5a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <mount>:
    register long a7 __asm__("a7") = n;
    1f64:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f68:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <umount>:
    register long a7 __asm__("a7") = n;
    1f70:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f74:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f76:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f7e:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f80:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f82:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f84:	8532                	mv	a0,a2
	mv a2, a4
    1f86:	863a                	mv	a2,a4
	mv a3, a5
    1f88:	86be                	mv	a3,a5
	mv a4, a6
    1f8a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f8c:	0dc00893          	li	a7,220
	ecall
    1f90:	00000073          	ecall

	beqz a0, 1f
    1f94:	c111                	beqz	a0,1f98 <__clone+0x1a>
	# Parent
	ret
    1f96:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f98:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f9a:	6522                	ld	a0,8(sp)
	jalr a1
    1f9c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f9e:	05d00893          	li	a7,93
	ecall
    1fa2:	00000073          	ecall
