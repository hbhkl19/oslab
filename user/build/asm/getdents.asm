
/home/hbh/oslab/oslab/user/build/riscv64/getdents:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0cd                	j	10e4 <__start_main>

0000000000001004 <test_getdents>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

char buf[512];
void test_getdents(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1a50513          	add	a0,a0,-230 # 1f20 <__clone+0x2e>
void test_getdents(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	328000ef          	jal	133c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	1c050513          	add	a0,a0,448 # 21d8 <__func__.0>
    1020:	31c000ef          	jal	133c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f1450513          	add	a0,a0,-236 # 1f38 <__clone+0x46>
    102c:	310000ef          	jal	133c <puts>
    int fd, nread;
    struct linux_dirent64 *dirp64;
    dirp64 = buf;
    //fd = open(".", O_DIRECTORY);
    fd = open(".", O_RDONLY);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	f1650513          	add	a0,a0,-234 # 1f48 <__clone+0x56>
    103a:	41d000ef          	jal	1c56 <open>
    printf("open fd:%d\n", fd);
    103e:	85aa                	mv	a1,a0
    fd = open(".", O_RDONLY);
    1040:	842a                	mv	s0,a0
    printf("open fd:%d\n", fd);
    1042:	00001517          	auipc	a0,0x1
    1046:	f0e50513          	add	a0,a0,-242 # 1f50 <__clone+0x5e>
    104a:	314000ef          	jal	135e <printf>

	nread = getdents(fd, dirp64, 512);
    104e:	20000613          	li	a2,512
    1052:	00001597          	auipc	a1,0x1
    1056:	f8658593          	add	a1,a1,-122 # 1fd8 <buf>
    105a:	8522                	mv	a0,s0
    105c:	64d000ef          	jal	1ea8 <getdents>
	printf("getdents fd:%d\n", nread);
    1060:	85aa                	mv	a1,a0
	nread = getdents(fd, dirp64, 512);
    1062:	84aa                	mv	s1,a0
	printf("getdents fd:%d\n", nread);
    1064:	00001517          	auipc	a0,0x1
    1068:	efc50513          	add	a0,a0,-260 # 1f60 <__clone+0x6e>
    106c:	2f2000ef          	jal	135e <printf>
	assert(nread != -1);
    1070:	57fd                	li	a5,-1
    1072:	04f48a63          	beq	s1,a5,10c6 <test_getdents+0xc2>
	printf("getdents success.\n%s\n", dirp64->d_name);
    1076:	00001597          	auipc	a1,0x1
    107a:	f7558593          	add	a1,a1,-139 # 1feb <buf+0x13>
    107e:	00001517          	auipc	a0,0x1
    1082:	f1250513          	add	a0,a0,-238 # 1f90 <__clone+0x9e>
    1086:	2d8000ef          	jal	135e <printf>
	    printf(  "%s\t", d->d_name);
	    bpos += d->d_reclen;
	}
	*/

    printf("\n");
    108a:	00001517          	auipc	a0,0x1
    108e:	efe50513          	add	a0,a0,-258 # 1f88 <__clone+0x96>
    1092:	2cc000ef          	jal	135e <printf>
    close(fd);
    1096:	8522                	mv	a0,s0
    1098:	3e7000ef          	jal	1c7e <close>
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f0c50513          	add	a0,a0,-244 # 1fa8 <__clone+0xb6>
    10a4:	298000ef          	jal	133c <puts>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	13050513          	add	a0,a0,304 # 21d8 <__func__.0>
    10b0:	28c000ef          	jal	133c <puts>
}
    10b4:	6442                	ld	s0,16(sp)
    10b6:	60e2                	ld	ra,24(sp)
    10b8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	e7e50513          	add	a0,a0,-386 # 1f38 <__clone+0x46>
}
    10c2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10c4:	aca5                	j	133c <puts>
	assert(nread != -1);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	eaa50513          	add	a0,a0,-342 # 1f70 <__clone+0x7e>
    10ce:	50a000ef          	jal	15d8 <panic>
    10d2:	b755                	j	1076 <test_getdents+0x72>

00000000000010d4 <main>:

int main(void){
    10d4:	1141                	add	sp,sp,-16
    10d6:	e406                	sd	ra,8(sp)
    test_getdents();
    10d8:	f2dff0ef          	jal	1004 <test_getdents>
    return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	add	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e6:	4108                	lw	a0,0(a0)
{
    10e8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ea:	05a1                	add	a1,a1,8
{
    10ec:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ee:	fe7ff0ef          	jal	10d4 <main>
    10f2:	3fd000ef          	jal	1cee <exit>
	return 0;
}
    10f6:	60a2                	ld	ra,8(sp)
    10f8:	4501                	li	a0,0
    10fa:	0141                	add	sp,sp,16
    10fc:	8082                	ret

00000000000010fe <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fe:	7179                	add	sp,sp,-48
    1100:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1102:	12054863          	bltz	a0,1232 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1106:	02b577bb          	remuw	a5,a0,a1
    110a:	00001697          	auipc	a3,0x1
    110e:	0de68693          	add	a3,a3,222 # 21e8 <digits>
    buf[16] = 0;
    1112:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1116:	0005871b          	sext.w	a4,a1
    111a:	1782                	sll	a5,a5,0x20
    111c:	9381                	srl	a5,a5,0x20
    111e:	97b6                	add	a5,a5,a3
    1120:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1124:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1128:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    112c:	1ab56663          	bltu	a0,a1,12d8 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1130:	02e8763b          	remuw	a2,a6,a4
    1134:	1602                	sll	a2,a2,0x20
    1136:	9201                	srl	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1142:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1146:	12e86c63          	bltu	a6,a4,127e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    114a:	02e5f63b          	remuw	a2,a1,a4
    114e:	1602                	sll	a2,a2,0x20
    1150:	9201                	srl	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    115c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1160:	12e5e863          	bltu	a1,a4,1290 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1164:	02e8763b          	remuw	a2,a6,a4
    1168:	1602                	sll	a2,a2,0x20
    116a:	9201                	srl	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1176:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    117a:	12e86463          	bltu	a6,a4,12a2 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    117e:	02e5f63b          	remuw	a2,a1,a4
    1182:	1602                	sll	a2,a2,0x20
    1184:	9201                	srl	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1190:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1194:	12e5e063          	bltu	a1,a4,12b4 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1198:	02e8763b          	remuw	a2,a6,a4
    119c:	1602                	sll	a2,a2,0x20
    119e:	9201                	srl	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11aa:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11ae:	0ae86f63          	bltu	a6,a4,126c <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11b2:	02e5f63b          	remuw	a2,a1,a4
    11b6:	1602                	sll	a2,a2,0x20
    11b8:	9201                	srl	a2,a2,0x20
    11ba:	9636                	add	a2,a2,a3
    11bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11c4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11c8:	0ee5ef63          	bltu	a1,a4,12c6 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11cc:	02e8763b          	remuw	a2,a6,a4
    11d0:	1602                	sll	a2,a2,0x20
    11d2:	9201                	srl	a2,a2,0x20
    11d4:	9636                	add	a2,a2,a3
    11d6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11da:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11de:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11e2:	0ee86d63          	bltu	a6,a4,12dc <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11e6:	02e5f63b          	remuw	a2,a1,a4
    11ea:	1602                	sll	a2,a2,0x20
    11ec:	9201                	srl	a2,a2,0x20
    11ee:	9636                	add	a2,a2,a3
    11f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11f8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11fc:	0ee5e963          	bltu	a1,a4,12ee <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1200:	1782                	sll	a5,a5,0x20
    1202:	9381                	srl	a5,a5,0x20
    1204:	96be                	add	a3,a3,a5
    1206:	0006c783          	lbu	a5,0(a3)
    120a:	4599                	li	a1,6
    120c:	00f10723          	sb	a5,14(sp)

    if (sign)
    1210:	00055763          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1214:	02d00793          	li	a5,45
    1218:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    121c:	4595                	li	a1,5
    write(f, s, l);
    121e:	003c                	add	a5,sp,8
    1220:	4641                	li	a2,16
    1222:	9e0d                	subw	a2,a2,a1
    1224:	4505                	li	a0,1
    1226:	95be                	add	a1,a1,a5
    1228:	26d000ef          	jal	1c94 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    122c:	70a2                	ld	ra,40(sp)
    122e:	6145                	add	sp,sp,48
    1230:	8082                	ret
        x = -xx;
    1232:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1236:	02b677bb          	remuw	a5,a2,a1
    123a:	00001697          	auipc	a3,0x1
    123e:	fae68693          	add	a3,a3,-82 # 21e8 <digits>
    buf[16] = 0;
    1242:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1246:	0005871b          	sext.w	a4,a1
    124a:	1782                	sll	a5,a5,0x20
    124c:	9381                	srl	a5,a5,0x20
    124e:	97b6                	add	a5,a5,a3
    1250:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1254:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1258:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    125c:	ecb67ae3          	bgeu	a2,a1,1130 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1268:	45b9                	li	a1,14
    126a:	bf55                	j	121e <printint.constprop.0+0x120>
    126c:	45a9                	li	a1,10
    if (sign)
    126e:	fa0558e3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    127a:	45a5                	li	a1,9
    127c:	b74d                	j	121e <printint.constprop.0+0x120>
    127e:	45b9                	li	a1,14
    if (sign)
    1280:	f8055fe3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    128c:	45b5                	li	a1,13
    128e:	bf41                	j	121e <printint.constprop.0+0x120>
    1290:	45b5                	li	a1,13
    if (sign)
    1292:	f80556e3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    129e:	45b1                	li	a1,12
    12a0:	bfbd                	j	121e <printint.constprop.0+0x120>
    12a2:	45b1                	li	a1,12
    if (sign)
    12a4:	f6055de3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12b0:	45ad                	li	a1,11
    12b2:	b7b5                	j	121e <printint.constprop.0+0x120>
    12b4:	45ad                	li	a1,11
    if (sign)
    12b6:	f60554e3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12c2:	45a9                	li	a1,10
    12c4:	bfa9                	j	121e <printint.constprop.0+0x120>
    12c6:	45a5                	li	a1,9
    if (sign)
    12c8:	f4055be3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12d4:	45a1                	li	a1,8
    12d6:	b7a1                	j	121e <printint.constprop.0+0x120>
    i = 15;
    12d8:	45bd                	li	a1,15
    12da:	b791                	j	121e <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12dc:	45a1                	li	a1,8
    if (sign)
    12de:	f40550e3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ea:	459d                	li	a1,7
    12ec:	bf0d                	j	121e <printint.constprop.0+0x120>
    12ee:	459d                	li	a1,7
    if (sign)
    12f0:	f20557e3          	bgez	a0,121e <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f4:	02d00793          	li	a5,45
    12f8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12fc:	4599                	li	a1,6
    12fe:	b705                	j	121e <printint.constprop.0+0x120>

0000000000001300 <getchar>:
{
    1300:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1302:	00f10593          	add	a1,sp,15
    1306:	4605                	li	a2,1
    1308:	4501                	li	a0,0
{
    130a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    130c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1310:	17b000ef          	jal	1c8a <read>
}
    1314:	60e2                	ld	ra,24(sp)
    1316:	00f14503          	lbu	a0,15(sp)
    131a:	6105                	add	sp,sp,32
    131c:	8082                	ret

000000000000131e <putchar>:
{
    131e:	1101                	add	sp,sp,-32
    1320:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1322:	00f10593          	add	a1,sp,15
    1326:	4605                	li	a2,1
    1328:	4505                	li	a0,1
{
    132a:	ec06                	sd	ra,24(sp)
    char byte = c;
    132c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1330:	165000ef          	jal	1c94 <write>
}
    1334:	60e2                	ld	ra,24(sp)
    1336:	2501                	sext.w	a0,a0
    1338:	6105                	add	sp,sp,32
    133a:	8082                	ret

000000000000133c <puts>:
{
    133c:	1141                	add	sp,sp,-16
    133e:	e406                	sd	ra,8(sp)
    1340:	e022                	sd	s0,0(sp)
    1342:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1344:	574000ef          	jal	18b8 <strlen>
    1348:	862a                	mv	a2,a0
    134a:	85a2                	mv	a1,s0
    134c:	4505                	li	a0,1
    134e:	147000ef          	jal	1c94 <write>
}
    1352:	60a2                	ld	ra,8(sp)
    1354:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1356:	957d                	sra	a0,a0,0x3f
    return r;
    1358:	2501                	sext.w	a0,a0
}
    135a:	0141                	add	sp,sp,16
    135c:	8082                	ret

000000000000135e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    135e:	7171                	add	sp,sp,-176
    1360:	f85a                	sd	s6,48(sp)
    1362:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1364:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1366:	18bc                	add	a5,sp,120
{
    1368:	e8ca                	sd	s2,80(sp)
    136a:	e4ce                	sd	s3,72(sp)
    136c:	e0d2                	sd	s4,64(sp)
    136e:	fc56                	sd	s5,56(sp)
    1370:	f486                	sd	ra,104(sp)
    1372:	f0a2                	sd	s0,96(sp)
    1374:	eca6                	sd	s1,88(sp)
    1376:	fcae                	sd	a1,120(sp)
    1378:	e132                	sd	a2,128(sp)
    137a:	e536                	sd	a3,136(sp)
    137c:	e93a                	sd	a4,144(sp)
    137e:	f142                	sd	a6,160(sp)
    1380:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1382:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1384:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1388:	07300a13          	li	s4,115
    138c:	07800a93          	li	s5,120
    buf[i++] = '0';
    1390:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1394:	00001997          	auipc	s3,0x1
    1398:	e5498993          	add	s3,s3,-428 # 21e8 <digits>
        if (!*s)
    139c:	00054783          	lbu	a5,0(a0)
    13a0:	16078a63          	beqz	a5,1514 <printf+0x1b6>
    13a4:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13a6:	19278d63          	beq	a5,s2,1540 <printf+0x1e2>
    13aa:	00164783          	lbu	a5,1(a2)
    13ae:	0605                	add	a2,a2,1
    13b0:	fbfd                	bnez	a5,13a6 <printf+0x48>
    13b2:	84b2                	mv	s1,a2
        l = z - a;
    13b4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13b8:	85aa                	mv	a1,a0
    13ba:	8622                	mv	a2,s0
    13bc:	4505                	li	a0,1
    13be:	0d7000ef          	jal	1c94 <write>
        if (l)
    13c2:	1a041463          	bnez	s0,156a <printf+0x20c>
        if (s[1] == 0)
    13c6:	0014c783          	lbu	a5,1(s1)
    13ca:	14078563          	beqz	a5,1514 <printf+0x1b6>
        switch (s[1])
    13ce:	1b478063          	beq	a5,s4,156e <printf+0x210>
    13d2:	14fa6b63          	bltu	s4,a5,1528 <printf+0x1ca>
    13d6:	06400713          	li	a4,100
    13da:	1ee78063          	beq	a5,a4,15ba <printf+0x25c>
    13de:	07000713          	li	a4,112
    13e2:	1ae79963          	bne	a5,a4,1594 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13e6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e8:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13ec:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ee:	631c                	ld	a5,0(a4)
    13f0:	0721                	add	a4,a4,8
    13f2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f4:	00479293          	sll	t0,a5,0x4
    13f8:	00879f93          	sll	t6,a5,0x8
    13fc:	00c79f13          	sll	t5,a5,0xc
    1400:	01079e93          	sll	t4,a5,0x10
    1404:	01479e13          	sll	t3,a5,0x14
    1408:	01879313          	sll	t1,a5,0x18
    140c:	01c79893          	sll	a7,a5,0x1c
    1410:	02479813          	sll	a6,a5,0x24
    1414:	02879513          	sll	a0,a5,0x28
    1418:	02c79593          	sll	a1,a5,0x2c
    141c:	03079693          	sll	a3,a5,0x30
    1420:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1424:	03c7d413          	srl	s0,a5,0x3c
    1428:	01c7d39b          	srlw	t2,a5,0x1c
    142c:	03c2d293          	srl	t0,t0,0x3c
    1430:	03cfdf93          	srl	t6,t6,0x3c
    1434:	03cf5f13          	srl	t5,t5,0x3c
    1438:	03cede93          	srl	t4,t4,0x3c
    143c:	03ce5e13          	srl	t3,t3,0x3c
    1440:	03c35313          	srl	t1,t1,0x3c
    1444:	03c8d893          	srl	a7,a7,0x3c
    1448:	03c85813          	srl	a6,a6,0x3c
    144c:	9171                	srl	a0,a0,0x3c
    144e:	91f1                	srl	a1,a1,0x3c
    1450:	92f1                	srl	a3,a3,0x3c
    1452:	9371                	srl	a4,a4,0x3c
    1454:	96ce                	add	a3,a3,s3
    1456:	974e                	add	a4,a4,s3
    1458:	944e                	add	s0,s0,s3
    145a:	92ce                	add	t0,t0,s3
    145c:	9fce                	add	t6,t6,s3
    145e:	9f4e                	add	t5,t5,s3
    1460:	9ece                	add	t4,t4,s3
    1462:	9e4e                	add	t3,t3,s3
    1464:	934e                	add	t1,t1,s3
    1466:	98ce                	add	a7,a7,s3
    1468:	93ce                	add	t2,t2,s3
    146a:	984e                	add	a6,a6,s3
    146c:	954e                	add	a0,a0,s3
    146e:	95ce                	add	a1,a1,s3
    1470:	0006c083          	lbu	ra,0(a3)
    1474:	0002c283          	lbu	t0,0(t0)
    1478:	00074683          	lbu	a3,0(a4)
    147c:	000fcf83          	lbu	t6,0(t6)
    1480:	000f4f03          	lbu	t5,0(t5)
    1484:	000ece83          	lbu	t4,0(t4)
    1488:	000e4e03          	lbu	t3,0(t3)
    148c:	00034303          	lbu	t1,0(t1)
    1490:	0008c883          	lbu	a7,0(a7)
    1494:	0003c383          	lbu	t2,0(t2)
    1498:	00084803          	lbu	a6,0(a6)
    149c:	00054503          	lbu	a0,0(a0)
    14a0:	0005c583          	lbu	a1,0(a1)
    14a4:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a8:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ac:	9371                	srl	a4,a4,0x3c
    14ae:	8bbd                	and	a5,a5,15
    14b0:	974e                	add	a4,a4,s3
    14b2:	97ce                	add	a5,a5,s3
    14b4:	005105a3          	sb	t0,11(sp)
    14b8:	01f10623          	sb	t6,12(sp)
    14bc:	01e106a3          	sb	t5,13(sp)
    14c0:	01d10723          	sb	t4,14(sp)
    14c4:	01c107a3          	sb	t3,15(sp)
    14c8:	00610823          	sb	t1,16(sp)
    14cc:	011108a3          	sb	a7,17(sp)
    14d0:	00710923          	sb	t2,18(sp)
    14d4:	010109a3          	sb	a6,19(sp)
    14d8:	00a10a23          	sb	a0,20(sp)
    14dc:	00b10aa3          	sb	a1,21(sp)
    14e0:	00110b23          	sb	ra,22(sp)
    14e4:	00d10ba3          	sb	a3,23(sp)
    14e8:	00810523          	sb	s0,10(sp)
    14ec:	00074703          	lbu	a4,0(a4)
    14f0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f4:	002c                	add	a1,sp,8
    14f6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f8:	00e10c23          	sb	a4,24(sp)
    14fc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1500:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1504:	790000ef          	jal	1c94 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1508:	00248513          	add	a0,s1,2
        if (!*s)
    150c:	00054783          	lbu	a5,0(a0)
    1510:	e8079ae3          	bnez	a5,13a4 <printf+0x46>
    }
    va_end(ap);
}
    1514:	70a6                	ld	ra,104(sp)
    1516:	7406                	ld	s0,96(sp)
    1518:	64e6                	ld	s1,88(sp)
    151a:	6946                	ld	s2,80(sp)
    151c:	69a6                	ld	s3,72(sp)
    151e:	6a06                	ld	s4,64(sp)
    1520:	7ae2                	ld	s5,56(sp)
    1522:	7b42                	ld	s6,48(sp)
    1524:	614d                	add	sp,sp,176
    1526:	8082                	ret
        switch (s[1])
    1528:	07579663          	bne	a5,s5,1594 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    152c:	6782                	ld	a5,0(sp)
    152e:	45c1                	li	a1,16
    1530:	4388                	lw	a0,0(a5)
    1532:	07a1                	add	a5,a5,8
    1534:	e03e                	sd	a5,0(sp)
    1536:	bc9ff0ef          	jal	10fe <printint.constprop.0>
        s += 2;
    153a:	00248513          	add	a0,s1,2
    153e:	b7f9                	j	150c <printf+0x1ae>
    1540:	84b2                	mv	s1,a2
    1542:	a039                	j	1550 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1544:	0024c783          	lbu	a5,2(s1)
    1548:	0605                	add	a2,a2,1
    154a:	0489                	add	s1,s1,2
    154c:	e72794e3          	bne	a5,s2,13b4 <printf+0x56>
    1550:	0014c783          	lbu	a5,1(s1)
    1554:	ff2788e3          	beq	a5,s2,1544 <printf+0x1e6>
        l = z - a;
    1558:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    155c:	85aa                	mv	a1,a0
    155e:	8622                	mv	a2,s0
    1560:	4505                	li	a0,1
    1562:	732000ef          	jal	1c94 <write>
        if (l)
    1566:	e60400e3          	beqz	s0,13c6 <printf+0x68>
    156a:	8526                	mv	a0,s1
    156c:	bd05                	j	139c <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    156e:	6782                	ld	a5,0(sp)
    1570:	6380                	ld	s0,0(a5)
    1572:	07a1                	add	a5,a5,8
    1574:	e03e                	sd	a5,0(sp)
    1576:	cc21                	beqz	s0,15ce <printf+0x270>
            l = strnlen(a, 200);
    1578:	0c800593          	li	a1,200
    157c:	8522                	mv	a0,s0
    157e:	424000ef          	jal	19a2 <strnlen>
    write(f, s, l);
    1582:	0005061b          	sext.w	a2,a0
    1586:	85a2                	mv	a1,s0
    1588:	4505                	li	a0,1
    158a:	70a000ef          	jal	1c94 <write>
        s += 2;
    158e:	00248513          	add	a0,s1,2
    1592:	bfad                	j	150c <printf+0x1ae>
    return write(stdout, &byte, 1);
    1594:	4605                	li	a2,1
    1596:	002c                	add	a1,sp,8
    1598:	4505                	li	a0,1
    char byte = c;
    159a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    159e:	6f6000ef          	jal	1c94 <write>
    char byte = c;
    15a2:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15a6:	4605                	li	a2,1
    15a8:	002c                	add	a1,sp,8
    15aa:	4505                	li	a0,1
    char byte = c;
    15ac:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b0:	6e4000ef          	jal	1c94 <write>
        s += 2;
    15b4:	00248513          	add	a0,s1,2
    15b8:	bf91                	j	150c <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15ba:	6782                	ld	a5,0(sp)
    15bc:	45a9                	li	a1,10
    15be:	4388                	lw	a0,0(a5)
    15c0:	07a1                	add	a5,a5,8
    15c2:	e03e                	sd	a5,0(sp)
    15c4:	b3bff0ef          	jal	10fe <printint.constprop.0>
        s += 2;
    15c8:	00248513          	add	a0,s1,2
    15cc:	b781                	j	150c <printf+0x1ae>
                a = "(null)";
    15ce:	00001417          	auipc	s0,0x1
    15d2:	9ea40413          	add	s0,s0,-1558 # 1fb8 <__clone+0xc6>
    15d6:	b74d                	j	1578 <printf+0x21a>

00000000000015d8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15d8:	1141                	add	sp,sp,-16
    15da:	e406                	sd	ra,8(sp)
    puts(m);
    15dc:	d61ff0ef          	jal	133c <puts>
    exit(-100);
}
    15e0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15e2:	f9c00513          	li	a0,-100
}
    15e6:	0141                	add	sp,sp,16
    exit(-100);
    15e8:	a719                	j	1cee <exit>

00000000000015ea <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ea:	02000793          	li	a5,32
    15ee:	00f50663          	beq	a0,a5,15fa <isspace+0x10>
    15f2:	355d                	addw	a0,a0,-9
    15f4:	00553513          	sltiu	a0,a0,5
    15f8:	8082                	ret
    15fa:	4505                	li	a0,1
}
    15fc:	8082                	ret

00000000000015fe <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15fe:	fd05051b          	addw	a0,a0,-48
}
    1602:	00a53513          	sltiu	a0,a0,10
    1606:	8082                	ret

0000000000001608 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1608:	02000693          	li	a3,32
    160c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    160e:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1612:	ff77871b          	addw	a4,a5,-9
    1616:	04d78c63          	beq	a5,a3,166e <atoi+0x66>
    161a:	0007861b          	sext.w	a2,a5
    161e:	04e5f863          	bgeu	a1,a4,166e <atoi+0x66>
        s++;
    switch (*s)
    1622:	02b00713          	li	a4,43
    1626:	04e78963          	beq	a5,a4,1678 <atoi+0x70>
    162a:	02d00713          	li	a4,45
    162e:	06e78263          	beq	a5,a4,1692 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1632:	fd06069b          	addw	a3,a2,-48
    1636:	47a5                	li	a5,9
    1638:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    163a:	4301                	li	t1,0
    while (isdigit(*s))
    163c:	04d7e963          	bltu	a5,a3,168e <atoi+0x86>
    int n = 0, neg = 0;
    1640:	4501                	li	a0,0
    while (isdigit(*s))
    1642:	48a5                	li	a7,9
    1644:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1648:	0025179b          	sllw	a5,a0,0x2
    164c:	9fa9                	addw	a5,a5,a0
    164e:	fd06059b          	addw	a1,a2,-48
    1652:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1656:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    165a:	0705                	add	a4,a4,1
    165c:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1660:	0006861b          	sext.w	a2,a3
    1664:	ff08f0e3          	bgeu	a7,a6,1644 <atoi+0x3c>
    return neg ? n : -n;
    1668:	00030563          	beqz	t1,1672 <atoi+0x6a>
}
    166c:	8082                	ret
        s++;
    166e:	0505                	add	a0,a0,1
    1670:	bf79                	j	160e <atoi+0x6>
    return neg ? n : -n;
    1672:	40f5853b          	subw	a0,a1,a5
    1676:	8082                	ret
    while (isdigit(*s))
    1678:	00154603          	lbu	a2,1(a0)
    167c:	47a5                	li	a5,9
        s++;
    167e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1682:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1686:	4301                	li	t1,0
    while (isdigit(*s))
    1688:	2601                	sext.w	a2,a2
    168a:	fad7fbe3          	bgeu	a5,a3,1640 <atoi+0x38>
    168e:	4501                	li	a0,0
}
    1690:	8082                	ret
    while (isdigit(*s))
    1692:	00154603          	lbu	a2,1(a0)
    1696:	47a5                	li	a5,9
        s++;
    1698:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    169c:	fd06069b          	addw	a3,a2,-48
    16a0:	2601                	sext.w	a2,a2
    16a2:	fed7e6e3          	bltu	a5,a3,168e <atoi+0x86>
        neg = 1;
    16a6:	4305                	li	t1,1
    16a8:	bf61                	j	1640 <atoi+0x38>

00000000000016aa <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16aa:	18060163          	beqz	a2,182c <memset+0x182>
    16ae:	40a006b3          	neg	a3,a0
    16b2:	0076f793          	and	a5,a3,7
    16b6:	00778813          	add	a6,a5,7
    16ba:	48ad                	li	a7,11
    16bc:	0ff5f713          	zext.b	a4,a1
    16c0:	fff60593          	add	a1,a2,-1
    16c4:	17186563          	bltu	a6,a7,182e <memset+0x184>
    16c8:	1705ed63          	bltu	a1,a6,1842 <memset+0x198>
    16cc:	16078363          	beqz	a5,1832 <memset+0x188>
    16d0:	00e50023          	sb	a4,0(a0)
    16d4:	0066f593          	and	a1,a3,6
    16d8:	16058063          	beqz	a1,1838 <memset+0x18e>
    16dc:	00e500a3          	sb	a4,1(a0)
    16e0:	4589                	li	a1,2
    16e2:	16f5f363          	bgeu	a1,a5,1848 <memset+0x19e>
    16e6:	00e50123          	sb	a4,2(a0)
    16ea:	8a91                	and	a3,a3,4
    16ec:	00350593          	add	a1,a0,3
    16f0:	4e0d                	li	t3,3
    16f2:	ce9d                	beqz	a3,1730 <memset+0x86>
    16f4:	00e501a3          	sb	a4,3(a0)
    16f8:	4691                	li	a3,4
    16fa:	00450593          	add	a1,a0,4
    16fe:	4e11                	li	t3,4
    1700:	02f6f863          	bgeu	a3,a5,1730 <memset+0x86>
    1704:	00e50223          	sb	a4,4(a0)
    1708:	4695                	li	a3,5
    170a:	00550593          	add	a1,a0,5
    170e:	4e15                	li	t3,5
    1710:	02d78063          	beq	a5,a3,1730 <memset+0x86>
    1714:	fff50693          	add	a3,a0,-1
    1718:	00e502a3          	sb	a4,5(a0)
    171c:	8a9d                	and	a3,a3,7
    171e:	00650593          	add	a1,a0,6
    1722:	4e19                	li	t3,6
    1724:	e691                	bnez	a3,1730 <memset+0x86>
    1726:	00750593          	add	a1,a0,7
    172a:	00e50323          	sb	a4,6(a0)
    172e:	4e1d                	li	t3,7
    1730:	00871693          	sll	a3,a4,0x8
    1734:	01071813          	sll	a6,a4,0x10
    1738:	8ed9                	or	a3,a3,a4
    173a:	01871893          	sll	a7,a4,0x18
    173e:	0106e6b3          	or	a3,a3,a6
    1742:	0116e6b3          	or	a3,a3,a7
    1746:	02071813          	sll	a6,a4,0x20
    174a:	02871313          	sll	t1,a4,0x28
    174e:	0106e6b3          	or	a3,a3,a6
    1752:	40f608b3          	sub	a7,a2,a5
    1756:	03071813          	sll	a6,a4,0x30
    175a:	0066e6b3          	or	a3,a3,t1
    175e:	0106e6b3          	or	a3,a3,a6
    1762:	03871313          	sll	t1,a4,0x38
    1766:	97aa                	add	a5,a5,a0
    1768:	ff88f813          	and	a6,a7,-8
    176c:	0066e6b3          	or	a3,a3,t1
    1770:	983e                	add	a6,a6,a5
    1772:	e394                	sd	a3,0(a5)
    1774:	07a1                	add	a5,a5,8
    1776:	ff079ee3          	bne	a5,a6,1772 <memset+0xc8>
    177a:	ff88f793          	and	a5,a7,-8
    177e:	0078f893          	and	a7,a7,7
    1782:	00f586b3          	add	a3,a1,a5
    1786:	01c787bb          	addw	a5,a5,t3
    178a:	0a088b63          	beqz	a7,1840 <memset+0x196>
    178e:	00e68023          	sb	a4,0(a3)
    1792:	0017859b          	addw	a1,a5,1
    1796:	08c5fb63          	bgeu	a1,a2,182c <memset+0x182>
    179a:	00e680a3          	sb	a4,1(a3)
    179e:	0027859b          	addw	a1,a5,2
    17a2:	08c5f563          	bgeu	a1,a2,182c <memset+0x182>
    17a6:	00e68123          	sb	a4,2(a3)
    17aa:	0037859b          	addw	a1,a5,3
    17ae:	06c5ff63          	bgeu	a1,a2,182c <memset+0x182>
    17b2:	00e681a3          	sb	a4,3(a3)
    17b6:	0047859b          	addw	a1,a5,4
    17ba:	06c5f963          	bgeu	a1,a2,182c <memset+0x182>
    17be:	00e68223          	sb	a4,4(a3)
    17c2:	0057859b          	addw	a1,a5,5
    17c6:	06c5f363          	bgeu	a1,a2,182c <memset+0x182>
    17ca:	00e682a3          	sb	a4,5(a3)
    17ce:	0067859b          	addw	a1,a5,6
    17d2:	04c5fd63          	bgeu	a1,a2,182c <memset+0x182>
    17d6:	00e68323          	sb	a4,6(a3)
    17da:	0077859b          	addw	a1,a5,7
    17de:	04c5f763          	bgeu	a1,a2,182c <memset+0x182>
    17e2:	00e683a3          	sb	a4,7(a3)
    17e6:	0087859b          	addw	a1,a5,8
    17ea:	04c5f163          	bgeu	a1,a2,182c <memset+0x182>
    17ee:	00e68423          	sb	a4,8(a3)
    17f2:	0097859b          	addw	a1,a5,9
    17f6:	02c5fb63          	bgeu	a1,a2,182c <memset+0x182>
    17fa:	00e684a3          	sb	a4,9(a3)
    17fe:	00a7859b          	addw	a1,a5,10
    1802:	02c5f563          	bgeu	a1,a2,182c <memset+0x182>
    1806:	00e68523          	sb	a4,10(a3)
    180a:	00b7859b          	addw	a1,a5,11
    180e:	00c5ff63          	bgeu	a1,a2,182c <memset+0x182>
    1812:	00e685a3          	sb	a4,11(a3)
    1816:	00c7859b          	addw	a1,a5,12
    181a:	00c5f963          	bgeu	a1,a2,182c <memset+0x182>
    181e:	00e68623          	sb	a4,12(a3)
    1822:	27b5                	addw	a5,a5,13
    1824:	00c7f463          	bgeu	a5,a2,182c <memset+0x182>
    1828:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    182c:	8082                	ret
    182e:	482d                	li	a6,11
    1830:	bd61                	j	16c8 <memset+0x1e>
    char *p = dest;
    1832:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1834:	4e01                	li	t3,0
    1836:	bded                	j	1730 <memset+0x86>
    1838:	00150593          	add	a1,a0,1
    183c:	4e05                	li	t3,1
    183e:	bdcd                	j	1730 <memset+0x86>
    1840:	8082                	ret
    char *p = dest;
    1842:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1844:	4781                	li	a5,0
    1846:	b7a1                	j	178e <memset+0xe4>
    1848:	00250593          	add	a1,a0,2
    184c:	4e09                	li	t3,2
    184e:	b5cd                	j	1730 <memset+0x86>

0000000000001850 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1850:	00054783          	lbu	a5,0(a0)
    1854:	0005c703          	lbu	a4,0(a1)
    1858:	00e79863          	bne	a5,a4,1868 <strcmp+0x18>
    185c:	0505                	add	a0,a0,1
    185e:	0585                	add	a1,a1,1
    1860:	fbe5                	bnez	a5,1850 <strcmp>
    1862:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1864:	9d19                	subw	a0,a0,a4
    1866:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1868:	0007851b          	sext.w	a0,a5
    186c:	bfe5                	j	1864 <strcmp+0x14>

000000000000186e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    186e:	ca15                	beqz	a2,18a2 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1870:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1874:	167d                	add	a2,a2,-1
    1876:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187a:	eb99                	bnez	a5,1890 <strncmp+0x22>
    187c:	a815                	j	18b0 <strncmp+0x42>
    187e:	00a68e63          	beq	a3,a0,189a <strncmp+0x2c>
    1882:	0505                	add	a0,a0,1
    1884:	00f71b63          	bne	a4,a5,189a <strncmp+0x2c>
    1888:	00054783          	lbu	a5,0(a0)
    188c:	cf89                	beqz	a5,18a6 <strncmp+0x38>
    188e:	85b2                	mv	a1,a2
    1890:	0005c703          	lbu	a4,0(a1)
    1894:	00158613          	add	a2,a1,1
    1898:	f37d                	bnez	a4,187e <strncmp+0x10>
        ;
    return *l - *r;
    189a:	0007851b          	sext.w	a0,a5
    189e:	9d19                	subw	a0,a0,a4
    18a0:	8082                	ret
        return 0;
    18a2:	4501                	li	a0,0
}
    18a4:	8082                	ret
    return *l - *r;
    18a6:	0015c703          	lbu	a4,1(a1)
    18aa:	4501                	li	a0,0
    18ac:	9d19                	subw	a0,a0,a4
    18ae:	8082                	ret
    18b0:	0005c703          	lbu	a4,0(a1)
    18b4:	4501                	li	a0,0
    18b6:	b7e5                	j	189e <strncmp+0x30>

00000000000018b8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18b8:	00757793          	and	a5,a0,7
    18bc:	cf89                	beqz	a5,18d6 <strlen+0x1e>
    18be:	87aa                	mv	a5,a0
    18c0:	a029                	j	18ca <strlen+0x12>
    18c2:	0785                	add	a5,a5,1
    18c4:	0077f713          	and	a4,a5,7
    18c8:	cb01                	beqz	a4,18d8 <strlen+0x20>
        if (!*s)
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	fb75                	bnez	a4,18c2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18d0:	40a78533          	sub	a0,a5,a0
}
    18d4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18d6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18d8:	6394                	ld	a3,0(a5)
    18da:	00000597          	auipc	a1,0x0
    18de:	6e65b583          	ld	a1,1766(a1) # 1fc0 <__clone+0xce>
    18e2:	00000617          	auipc	a2,0x0
    18e6:	6e663603          	ld	a2,1766(a2) # 1fc8 <__clone+0xd6>
    18ea:	a019                	j	18f0 <strlen+0x38>
    18ec:	6794                	ld	a3,8(a5)
    18ee:	07a1                	add	a5,a5,8
    18f0:	00b68733          	add	a4,a3,a1
    18f4:	fff6c693          	not	a3,a3
    18f8:	8f75                	and	a4,a4,a3
    18fa:	8f71                	and	a4,a4,a2
    18fc:	db65                	beqz	a4,18ec <strlen+0x34>
    for (; *s; s++)
    18fe:	0007c703          	lbu	a4,0(a5)
    1902:	d779                	beqz	a4,18d0 <strlen+0x18>
    1904:	0017c703          	lbu	a4,1(a5)
    1908:	0785                	add	a5,a5,1
    190a:	d379                	beqz	a4,18d0 <strlen+0x18>
    190c:	0017c703          	lbu	a4,1(a5)
    1910:	0785                	add	a5,a5,1
    1912:	fb6d                	bnez	a4,1904 <strlen+0x4c>
    1914:	bf75                	j	18d0 <strlen+0x18>

0000000000001916 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1916:	00757713          	and	a4,a0,7
{
    191a:	87aa                	mv	a5,a0
    191c:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1920:	cb19                	beqz	a4,1936 <memchr+0x20>
    1922:	ce25                	beqz	a2,199a <memchr+0x84>
    1924:	0007c703          	lbu	a4,0(a5)
    1928:	00b70763          	beq	a4,a1,1936 <memchr+0x20>
    192c:	0785                	add	a5,a5,1
    192e:	0077f713          	and	a4,a5,7
    1932:	167d                	add	a2,a2,-1
    1934:	f77d                	bnez	a4,1922 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1936:	4501                	li	a0,0
    if (n && *s != c)
    1938:	c235                	beqz	a2,199c <memchr+0x86>
    193a:	0007c703          	lbu	a4,0(a5)
    193e:	06b70063          	beq	a4,a1,199e <memchr+0x88>
        size_t k = ONES * c;
    1942:	00000517          	auipc	a0,0x0
    1946:	68e53503          	ld	a0,1678(a0) # 1fd0 <__clone+0xde>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194a:	471d                	li	a4,7
        size_t k = ONES * c;
    194c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1950:	04c77763          	bgeu	a4,a2,199e <memchr+0x88>
    1954:	00000897          	auipc	a7,0x0
    1958:	66c8b883          	ld	a7,1644(a7) # 1fc0 <__clone+0xce>
    195c:	00000817          	auipc	a6,0x0
    1960:	66c83803          	ld	a6,1644(a6) # 1fc8 <__clone+0xd6>
    1964:	431d                	li	t1,7
    1966:	a029                	j	1970 <memchr+0x5a>
    1968:	1661                	add	a2,a2,-8
    196a:	07a1                	add	a5,a5,8
    196c:	00c37c63          	bgeu	t1,a2,1984 <memchr+0x6e>
    1970:	6398                	ld	a4,0(a5)
    1972:	8f29                	xor	a4,a4,a0
    1974:	011706b3          	add	a3,a4,a7
    1978:	fff74713          	not	a4,a4
    197c:	8f75                	and	a4,a4,a3
    197e:	01077733          	and	a4,a4,a6
    1982:	d37d                	beqz	a4,1968 <memchr+0x52>
    1984:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1986:	e601                	bnez	a2,198e <memchr+0x78>
    1988:	a809                	j	199a <memchr+0x84>
    198a:	0505                	add	a0,a0,1
    198c:	c619                	beqz	a2,199a <memchr+0x84>
    198e:	00054783          	lbu	a5,0(a0)
    1992:	167d                	add	a2,a2,-1
    1994:	feb79be3          	bne	a5,a1,198a <memchr+0x74>
    1998:	8082                	ret
    return n ? (void *)s : 0;
    199a:	4501                	li	a0,0
}
    199c:	8082                	ret
    if (n && *s != c)
    199e:	853e                	mv	a0,a5
    19a0:	b7fd                	j	198e <memchr+0x78>

00000000000019a2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19a2:	1101                	add	sp,sp,-32
    19a4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19a6:	862e                	mv	a2,a1
{
    19a8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19aa:	4581                	li	a1,0
{
    19ac:	e426                	sd	s1,8(sp)
    19ae:	ec06                	sd	ra,24(sp)
    19b0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19b2:	f65ff0ef          	jal	1916 <memchr>
    return p ? p - s : n;
    19b6:	c519                	beqz	a0,19c4 <strnlen+0x22>
}
    19b8:	60e2                	ld	ra,24(sp)
    19ba:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19bc:	8d05                	sub	a0,a0,s1
}
    19be:	64a2                	ld	s1,8(sp)
    19c0:	6105                	add	sp,sp,32
    19c2:	8082                	ret
    19c4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19c6:	8522                	mv	a0,s0
}
    19c8:	6442                	ld	s0,16(sp)
    19ca:	64a2                	ld	s1,8(sp)
    19cc:	6105                	add	sp,sp,32
    19ce:	8082                	ret

00000000000019d0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19d0:	00a5c7b3          	xor	a5,a1,a0
    19d4:	8b9d                	and	a5,a5,7
    19d6:	eb95                	bnez	a5,1a0a <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d8:	0075f793          	and	a5,a1,7
    19dc:	e7b1                	bnez	a5,1a28 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19de:	6198                	ld	a4,0(a1)
    19e0:	00000617          	auipc	a2,0x0
    19e4:	5e063603          	ld	a2,1504(a2) # 1fc0 <__clone+0xce>
    19e8:	00000817          	auipc	a6,0x0
    19ec:	5e083803          	ld	a6,1504(a6) # 1fc8 <__clone+0xd6>
    19f0:	a029                	j	19fa <strcpy+0x2a>
    19f2:	05a1                	add	a1,a1,8
    19f4:	e118                	sd	a4,0(a0)
    19f6:	6198                	ld	a4,0(a1)
    19f8:	0521                	add	a0,a0,8
    19fa:	00c707b3          	add	a5,a4,a2
    19fe:	fff74693          	not	a3,a4
    1a02:	8ff5                	and	a5,a5,a3
    1a04:	0107f7b3          	and	a5,a5,a6
    1a08:	d7ed                	beqz	a5,19f2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a0a:	0005c783          	lbu	a5,0(a1)
    1a0e:	00f50023          	sb	a5,0(a0)
    1a12:	c785                	beqz	a5,1a3a <strcpy+0x6a>
    1a14:	0015c783          	lbu	a5,1(a1)
    1a18:	0505                	add	a0,a0,1
    1a1a:	0585                	add	a1,a1,1
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	fbf5                	bnez	a5,1a14 <strcpy+0x44>
        ;
    return d;
}
    1a22:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a24:	0505                	add	a0,a0,1
    1a26:	df45                	beqz	a4,19de <strcpy+0xe>
            if (!(*d = *s))
    1a28:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0585                	add	a1,a1,1
    1a2e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a32:	00f50023          	sb	a5,0(a0)
    1a36:	f7fd                	bnez	a5,1a24 <strcpy+0x54>
}
    1a38:	8082                	ret
    1a3a:	8082                	ret

0000000000001a3c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a3c:	00a5c7b3          	xor	a5,a1,a0
    1a40:	8b9d                	and	a5,a5,7
    1a42:	e3b5                	bnez	a5,1aa6 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a44:	0075f793          	and	a5,a1,7
    1a48:	cf99                	beqz	a5,1a66 <strncpy+0x2a>
    1a4a:	ea09                	bnez	a2,1a5c <strncpy+0x20>
    1a4c:	a421                	j	1c54 <strncpy+0x218>
    1a4e:	0585                	add	a1,a1,1
    1a50:	0075f793          	and	a5,a1,7
    1a54:	167d                	add	a2,a2,-1
    1a56:	0505                	add	a0,a0,1
    1a58:	c799                	beqz	a5,1a66 <strncpy+0x2a>
    1a5a:	c225                	beqz	a2,1aba <strncpy+0x7e>
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	f7ed                	bnez	a5,1a4e <strncpy+0x12>
            ;
        if (!n || !*s)
    1a66:	ca31                	beqz	a2,1aba <strncpy+0x7e>
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	cba1                	beqz	a5,1abc <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6e:	479d                	li	a5,7
    1a70:	02c7fc63          	bgeu	a5,a2,1aa8 <strncpy+0x6c>
    1a74:	00000897          	auipc	a7,0x0
    1a78:	54c8b883          	ld	a7,1356(a7) # 1fc0 <__clone+0xce>
    1a7c:	00000817          	auipc	a6,0x0
    1a80:	54c83803          	ld	a6,1356(a6) # 1fc8 <__clone+0xd6>
    1a84:	431d                	li	t1,7
    1a86:	a039                	j	1a94 <strncpy+0x58>
            *wd = *ws;
    1a88:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a8a:	1661                	add	a2,a2,-8
    1a8c:	05a1                	add	a1,a1,8
    1a8e:	0521                	add	a0,a0,8
    1a90:	00c37b63          	bgeu	t1,a2,1aa6 <strncpy+0x6a>
    1a94:	6198                	ld	a4,0(a1)
    1a96:	011707b3          	add	a5,a4,a7
    1a9a:	fff74693          	not	a3,a4
    1a9e:	8ff5                	and	a5,a5,a3
    1aa0:	0107f7b3          	and	a5,a5,a6
    1aa4:	d3f5                	beqz	a5,1a88 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aa6:	ca11                	beqz	a2,1aba <strncpy+0x7e>
    1aa8:	0005c783          	lbu	a5,0(a1)
    1aac:	0585                	add	a1,a1,1
    1aae:	00f50023          	sb	a5,0(a0)
    1ab2:	c789                	beqz	a5,1abc <strncpy+0x80>
    1ab4:	167d                	add	a2,a2,-1
    1ab6:	0505                	add	a0,a0,1
    1ab8:	fa65                	bnez	a2,1aa8 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aba:	8082                	ret
    1abc:	4805                	li	a6,1
    1abe:	14061b63          	bnez	a2,1c14 <strncpy+0x1d8>
    1ac2:	40a00733          	neg	a4,a0
    1ac6:	00777793          	and	a5,a4,7
    1aca:	4581                	li	a1,0
    1acc:	12061c63          	bnez	a2,1c04 <strncpy+0x1c8>
    1ad0:	00778693          	add	a3,a5,7
    1ad4:	48ad                	li	a7,11
    1ad6:	1316e563          	bltu	a3,a7,1c00 <strncpy+0x1c4>
    1ada:	16d5e263          	bltu	a1,a3,1c3e <strncpy+0x202>
    1ade:	14078c63          	beqz	a5,1c36 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ae2:	00050023          	sb	zero,0(a0)
    1ae6:	00677693          	and	a3,a4,6
    1aea:	14068263          	beqz	a3,1c2e <strncpy+0x1f2>
    1aee:	000500a3          	sb	zero,1(a0)
    1af2:	4689                	li	a3,2
    1af4:	14f6f863          	bgeu	a3,a5,1c44 <strncpy+0x208>
    1af8:	00050123          	sb	zero,2(a0)
    1afc:	8b11                	and	a4,a4,4
    1afe:	12070463          	beqz	a4,1c26 <strncpy+0x1ea>
    1b02:	000501a3          	sb	zero,3(a0)
    1b06:	4711                	li	a4,4
    1b08:	00450693          	add	a3,a0,4
    1b0c:	02f77563          	bgeu	a4,a5,1b36 <strncpy+0xfa>
    1b10:	00050223          	sb	zero,4(a0)
    1b14:	4715                	li	a4,5
    1b16:	00550693          	add	a3,a0,5
    1b1a:	00e78e63          	beq	a5,a4,1b36 <strncpy+0xfa>
    1b1e:	fff50713          	add	a4,a0,-1
    1b22:	000502a3          	sb	zero,5(a0)
    1b26:	8b1d                	and	a4,a4,7
    1b28:	12071263          	bnez	a4,1c4c <strncpy+0x210>
    1b2c:	00750693          	add	a3,a0,7
    1b30:	00050323          	sb	zero,6(a0)
    1b34:	471d                	li	a4,7
    1b36:	40f80833          	sub	a6,a6,a5
    1b3a:	ff887593          	and	a1,a6,-8
    1b3e:	97aa                	add	a5,a5,a0
    1b40:	95be                	add	a1,a1,a5
    1b42:	0007b023          	sd	zero,0(a5)
    1b46:	07a1                	add	a5,a5,8
    1b48:	feb79de3          	bne	a5,a1,1b42 <strncpy+0x106>
    1b4c:	ff887593          	and	a1,a6,-8
    1b50:	00787813          	and	a6,a6,7
    1b54:	00e587bb          	addw	a5,a1,a4
    1b58:	00b68733          	add	a4,a3,a1
    1b5c:	0e080063          	beqz	a6,1c3c <strncpy+0x200>
    1b60:	00070023          	sb	zero,0(a4)
    1b64:	0017869b          	addw	a3,a5,1
    1b68:	f4c6f9e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1b6c:	000700a3          	sb	zero,1(a4)
    1b70:	0027869b          	addw	a3,a5,2
    1b74:	f4c6f3e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1b78:	00070123          	sb	zero,2(a4)
    1b7c:	0037869b          	addw	a3,a5,3
    1b80:	f2c6fde3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1b84:	000701a3          	sb	zero,3(a4)
    1b88:	0047869b          	addw	a3,a5,4
    1b8c:	f2c6f7e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1b90:	00070223          	sb	zero,4(a4)
    1b94:	0057869b          	addw	a3,a5,5
    1b98:	f2c6f1e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1b9c:	000702a3          	sb	zero,5(a4)
    1ba0:	0067869b          	addw	a3,a5,6
    1ba4:	f0c6fbe3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1ba8:	00070323          	sb	zero,6(a4)
    1bac:	0077869b          	addw	a3,a5,7
    1bb0:	f0c6f5e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1bb4:	000703a3          	sb	zero,7(a4)
    1bb8:	0087869b          	addw	a3,a5,8
    1bbc:	eec6ffe3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1bc0:	00070423          	sb	zero,8(a4)
    1bc4:	0097869b          	addw	a3,a5,9
    1bc8:	eec6f9e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1bcc:	000704a3          	sb	zero,9(a4)
    1bd0:	00a7869b          	addw	a3,a5,10
    1bd4:	eec6f3e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1bd8:	00070523          	sb	zero,10(a4)
    1bdc:	00b7869b          	addw	a3,a5,11
    1be0:	ecc6fde3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1be4:	000705a3          	sb	zero,11(a4)
    1be8:	00c7869b          	addw	a3,a5,12
    1bec:	ecc6f7e3          	bgeu	a3,a2,1aba <strncpy+0x7e>
    1bf0:	00070623          	sb	zero,12(a4)
    1bf4:	27b5                	addw	a5,a5,13
    1bf6:	ecc7f2e3          	bgeu	a5,a2,1aba <strncpy+0x7e>
    1bfa:	000706a3          	sb	zero,13(a4)
}
    1bfe:	8082                	ret
    1c00:	46ad                	li	a3,11
    1c02:	bde1                	j	1ada <strncpy+0x9e>
    1c04:	00778693          	add	a3,a5,7
    1c08:	48ad                	li	a7,11
    1c0a:	fff60593          	add	a1,a2,-1
    1c0e:	ed16f6e3          	bgeu	a3,a7,1ada <strncpy+0x9e>
    1c12:	b7fd                	j	1c00 <strncpy+0x1c4>
    1c14:	40a00733          	neg	a4,a0
    1c18:	8832                	mv	a6,a2
    1c1a:	00777793          	and	a5,a4,7
    1c1e:	4581                	li	a1,0
    1c20:	ea0608e3          	beqz	a2,1ad0 <strncpy+0x94>
    1c24:	b7c5                	j	1c04 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c26:	00350693          	add	a3,a0,3
    1c2a:	470d                	li	a4,3
    1c2c:	b729                	j	1b36 <strncpy+0xfa>
    1c2e:	00150693          	add	a3,a0,1
    1c32:	4705                	li	a4,1
    1c34:	b709                	j	1b36 <strncpy+0xfa>
tail:
    1c36:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c38:	4701                	li	a4,0
    1c3a:	bdf5                	j	1b36 <strncpy+0xfa>
    1c3c:	8082                	ret
tail:
    1c3e:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c40:	4781                	li	a5,0
    1c42:	bf39                	j	1b60 <strncpy+0x124>
    1c44:	00250693          	add	a3,a0,2
    1c48:	4709                	li	a4,2
    1c4a:	b5f5                	j	1b36 <strncpy+0xfa>
    1c4c:	00650693          	add	a3,a0,6
    1c50:	4719                	li	a4,6
    1c52:	b5d5                	j	1b36 <strncpy+0xfa>
    1c54:	8082                	ret

0000000000001c56 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c56:	87aa                	mv	a5,a0
    1c58:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c5a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c64:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c66:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <openat>:
    register long a7 __asm__("a7") = n;
    1c6e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c72:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c76:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <close>:
    register long a7 __asm__("a7") = n;
    1c7e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c82:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <read>:
    register long a7 __asm__("a7") = n;
    1c8a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c92:	8082                	ret

0000000000001c94 <write>:
    register long a7 __asm__("a7") = n;
    1c94:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c98:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c9c:	8082                	ret

0000000000001c9e <getpid>:
    register long a7 __asm__("a7") = n;
    1c9e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ca2:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <getppid>:
    register long a7 __asm__("a7") = n;
    1caa:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cae:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cba:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <fork>:
    register long a7 __asm__("a7") = n;
    1cc2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cca:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cd2:	85b2                	mv	a1,a2
    1cd4:	863a                	mv	a2,a4
    if (stack)
    1cd6:	c191                	beqz	a1,1cda <clone+0x8>
	stack += stack_size;
    1cd8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cda:	4781                	li	a5,0
    1cdc:	4701                	li	a4,0
    1cde:	4681                	li	a3,0
    1ce0:	2601                	sext.w	a2,a2
    1ce2:	ac01                	j	1ef2 <__clone>

0000000000001ce4 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1ce4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ce8:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cec:	8082                	ret

0000000000001cee <exit>:
    register long a7 __asm__("a7") = n;
    1cee:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cf2:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cf6:	8082                	ret

0000000000001cf8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cf8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cfc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfe:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d02:	2501                	sext.w	a0,a0
    1d04:	8082                	ret

0000000000001d06 <exec>:
    register long a7 __asm__("a7") = n;
    1d06:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d0a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <execve>:
    register long a7 __asm__("a7") = n;
    1d12:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d16:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <times>:
    register long a7 __asm__("a7") = n;
    1d1e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <get_time>:

int64 get_time()
{
    1d2a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d2c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d30:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d34:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d38:	2501                	sext.w	a0,a0
    1d3a:	ed09                	bnez	a0,1d54 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d3c:	67a2                	ld	a5,8(sp)
    1d3e:	3e800713          	li	a4,1000
    1d42:	00015503          	lhu	a0,0(sp)
    1d46:	02e7d7b3          	divu	a5,a5,a4
    1d4a:	02e50533          	mul	a0,a0,a4
    1d4e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d50:	0141                	add	sp,sp,16
    1d52:	8082                	ret
        return -1;
    1d54:	557d                	li	a0,-1
    1d56:	bfed                	j	1d50 <get_time+0x26>

0000000000001d58 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d58:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <time>:
    register long a7 __asm__("a7") = n;
    1d64:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <sleep>:

int sleep(unsigned long long time)
{
    1d70:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d72:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d74:	850a                	mv	a0,sp
    1d76:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d78:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d7c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d82:	e501                	bnez	a0,1d8a <sleep+0x1a>
    return 0;
    1d84:	4501                	li	a0,0
}
    1d86:	0141                	add	sp,sp,16
    1d88:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d8a:	4502                	lw	a0,0(sp)
}
    1d8c:	0141                	add	sp,sp,16
    1d8e:	8082                	ret

0000000000001d90 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d90:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d94:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d9c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1da0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1da4:	8082                	ret

0000000000001da6 <mprotect>:
    register long a7 __asm__("a7") = n;
    1da6:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1daa:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <munmap>:
    register long a7 __asm__("a7") = n;
    1db2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <wait>:

int wait(int *code)
{
    1dbe:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dc4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dc6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dc8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dca:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <spawn>:
    register long a7 __asm__("a7") = n;
    1dd2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <mailread>:
    register long a7 __asm__("a7") = n;
    1dde:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dea:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dee:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <fstat>:
    register long a7 __asm__("a7") = n;
    1df6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfa:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e02:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e04:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e08:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0a:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e12:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e14:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e18:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e22:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e28:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <link>:

int link(char *old_path, char *new_path)
{
    1e32:	87aa                	mv	a5,a0
    1e34:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e36:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e3a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e40:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e44:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e46:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <unlink>:

int unlink(char *path)
{
    1e4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e50:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e54:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e58:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <uname>:
    register long a7 __asm__("a7") = n;
    1e62:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <brk>:
    register long a7 __asm__("a7") = n;
    1e6e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e7a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e80:	8082                	ret

0000000000001e82 <chdir>:
    register long a7 __asm__("a7") = n;
    1e82:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e8e:	862e                	mv	a2,a1
    1e90:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e92:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e94:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e98:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e9c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <dup>:
    register long a7 __asm__("a7") = n;
    1ec2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <dup2>:
    register long a7 __asm__("a7") = n;
    1ecc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ece:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <mount>:
    register long a7 __asm__("a7") = n;
    1ed8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1edc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <umount>:
    register long a7 __asm__("a7") = n;
    1ee4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eea:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ef2:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ef4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ef6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef8:	8532                	mv	a0,a2
	mv a2, a4
    1efa:	863a                	mv	a2,a4
	mv a3, a5
    1efc:	86be                	mv	a3,a5
	mv a4, a6
    1efe:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f00:	0dc00893          	li	a7,220
	ecall
    1f04:	00000073          	ecall

	beqz a0, 1f
    1f08:	c111                	beqz	a0,1f0c <__clone+0x1a>
	# Parent
	ret
    1f0a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f0c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f0e:	6522                	ld	a0,8(sp)
	jalr a1
    1f10:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f12:	05d00893          	li	a7,93
	ecall
    1f16:	00000073          	ecall
