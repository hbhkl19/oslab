
/home/hbh/oslab/oslab/user/build/riscv64/wait:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0e1                	j	10ca <__start_main>

0000000000001004 <test_wait>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_wait(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	efa50513          	add	a0,a0,-262 # 1f00 <__clone+0x28>
void test_wait(void){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1014:	30e000ef          	jal	1322 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fb850513          	add	a0,a0,-72 # 1fd0 <__func__.0>
    1020:	302000ef          	jal	1322 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	ef450513          	add	a0,a0,-268 # 1f18 <__clone+0x40>
    102c:	2f6000ef          	jal	1322 <puts>
    int cpid, wstatus;
    cpid = fork();
    1030:	479000ef          	jal	1ca8 <fork>
    if(cpid == 0){
    1034:	e129                	bnez	a0,1076 <test_wait+0x72>
	printf("This is child process\n");
    1036:	00001517          	auipc	a0,0x1
    103a:	ef250513          	add	a0,a0,-270 # 1f28 <__clone+0x50>
    103e:	306000ef          	jal	1344 <printf>
        exit(0);
    1042:	4501                	li	a0,0
    1044:	491000ef          	jal	1cd4 <exit>
	if(ret == cpid)
	    printf("wait child success.\nwstatus: %d\n", wstatus);
	else
	    printf("wait child error.\n");
    }
    TEST_END(__func__);
    1048:	00001517          	auipc	a0,0x1
    104c:	f5850513          	add	a0,a0,-168 # 1fa0 <__clone+0xc8>
    1050:	2d2000ef          	jal	1322 <puts>
    1054:	00001517          	auipc	a0,0x1
    1058:	f7c50513          	add	a0,a0,-132 # 1fd0 <__func__.0>
    105c:	2c6000ef          	jal	1322 <puts>
    1060:	00001517          	auipc	a0,0x1
    1064:	eb850513          	add	a0,a0,-328 # 1f18 <__clone+0x40>
    1068:	2ba000ef          	jal	1322 <puts>
}
    106c:	70a2                	ld	ra,40(sp)
    106e:	7402                	ld	s0,32(sp)
    1070:	64e2                	ld	s1,24(sp)
    1072:	6145                	add	sp,sp,48
    1074:	8082                	ret
	pid_t ret = wait(&wstatus);
    1076:	842a                	mv	s0,a0
    1078:	0068                	add	a0,sp,12
    107a:	52b000ef          	jal	1da4 <wait>
	assert(ret != -1);
    107e:	57fd                	li	a5,-1
	pid_t ret = wait(&wstatus);
    1080:	84aa                	mv	s1,a0
	assert(ret != -1);
    1082:	02f50363          	beq	a0,a5,10a8 <test_wait+0xa4>
	if(ret == cpid)
    1086:	00940963          	beq	s0,s1,1098 <test_wait+0x94>
	    printf("wait child error.\n");
    108a:	00001517          	auipc	a0,0x1
    108e:	efe50513          	add	a0,a0,-258 # 1f88 <__clone+0xb0>
    1092:	2b2000ef          	jal	1344 <printf>
    1096:	bf4d                	j	1048 <test_wait+0x44>
	    printf("wait child success.\nwstatus: %d\n", wstatus);
    1098:	45b2                	lw	a1,12(sp)
    109a:	00001517          	auipc	a0,0x1
    109e:	ec650513          	add	a0,a0,-314 # 1f60 <__clone+0x88>
    10a2:	2a2000ef          	jal	1344 <printf>
    10a6:	b74d                	j	1048 <test_wait+0x44>
	assert(ret != -1);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	e9850513          	add	a0,a0,-360 # 1f40 <__clone+0x68>
    10b0:	50e000ef          	jal	15be <panic>
	if(ret == cpid)
    10b4:	fc941be3          	bne	s0,s1,108a <test_wait+0x86>
    10b8:	b7c5                	j	1098 <test_wait+0x94>

00000000000010ba <main>:

int main(void){
    10ba:	1141                	add	sp,sp,-16
    10bc:	e406                	sd	ra,8(sp)
    test_wait();
    10be:	f47ff0ef          	jal	1004 <test_wait>
    return 0;
}
    10c2:	60a2                	ld	ra,8(sp)
    10c4:	4501                	li	a0,0
    10c6:	0141                	add	sp,sp,16
    10c8:	8082                	ret

00000000000010ca <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ca:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10cc:	4108                	lw	a0,0(a0)
{
    10ce:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d0:	05a1                	add	a1,a1,8
{
    10d2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d4:	fe7ff0ef          	jal	10ba <main>
    10d8:	3fd000ef          	jal	1cd4 <exit>
	return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	add	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e4:	7179                	add	sp,sp,-48
    10e6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e8:	12054863          	bltz	a0,1218 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ec:	02b577bb          	remuw	a5,a0,a1
    10f0:	00001697          	auipc	a3,0x1
    10f4:	ef068693          	add	a3,a3,-272 # 1fe0 <digits>
    buf[16] = 0;
    10f8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fc:	0005871b          	sext.w	a4,a1
    1100:	1782                	sll	a5,a5,0x20
    1102:	9381                	srl	a5,a5,0x20
    1104:	97b6                	add	a5,a5,a3
    1106:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    110e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1112:	1ab56663          	bltu	a0,a1,12be <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1116:	02e8763b          	remuw	a2,a6,a4
    111a:	1602                	sll	a2,a2,0x20
    111c:	9201                	srl	a2,a2,0x20
    111e:	9636                	add	a2,a2,a3
    1120:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1124:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1128:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112c:	12e86c63          	bltu	a6,a4,1264 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1130:	02e5f63b          	remuw	a2,a1,a4
    1134:	1602                	sll	a2,a2,0x20
    1136:	9201                	srl	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1142:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1146:	12e5e863          	bltu	a1,a4,1276 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    114a:	02e8763b          	remuw	a2,a6,a4
    114e:	1602                	sll	a2,a2,0x20
    1150:	9201                	srl	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1160:	12e86463          	bltu	a6,a4,1288 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1164:	02e5f63b          	remuw	a2,a1,a4
    1168:	1602                	sll	a2,a2,0x20
    116a:	9201                	srl	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1176:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    117a:	12e5e063          	bltu	a1,a4,129a <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    117e:	02e8763b          	remuw	a2,a6,a4
    1182:	1602                	sll	a2,a2,0x20
    1184:	9201                	srl	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1190:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1194:	0ae86f63          	bltu	a6,a4,1252 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1198:	02e5f63b          	remuw	a2,a1,a4
    119c:	1602                	sll	a2,a2,0x20
    119e:	9201                	srl	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11aa:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ae:	0ee5ef63          	bltu	a1,a4,12ac <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11b2:	02e8763b          	remuw	a2,a6,a4
    11b6:	1602                	sll	a2,a2,0x20
    11b8:	9201                	srl	a2,a2,0x20
    11ba:	9636                	add	a2,a2,a3
    11bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c8:	0ee86d63          	bltu	a6,a4,12c2 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11cc:	02e5f63b          	remuw	a2,a1,a4
    11d0:	1602                	sll	a2,a2,0x20
    11d2:	9201                	srl	a2,a2,0x20
    11d4:	9636                	add	a2,a2,a3
    11d6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11da:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11de:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e2:	0ee5e963          	bltu	a1,a4,12d4 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11e6:	1782                	sll	a5,a5,0x20
    11e8:	9381                	srl	a5,a5,0x20
    11ea:	96be                	add	a3,a3,a5
    11ec:	0006c783          	lbu	a5,0(a3)
    11f0:	4599                	li	a1,6
    11f2:	00f10723          	sb	a5,14(sp)

    if (sign)
    11f6:	00055763          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11fa:	02d00793          	li	a5,45
    11fe:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1202:	4595                	li	a1,5
    write(f, s, l);
    1204:	003c                	add	a5,sp,8
    1206:	4641                	li	a2,16
    1208:	9e0d                	subw	a2,a2,a1
    120a:	4505                	li	a0,1
    120c:	95be                	add	a1,a1,a5
    120e:	26d000ef          	jal	1c7a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1212:	70a2                	ld	ra,40(sp)
    1214:	6145                	add	sp,sp,48
    1216:	8082                	ret
        x = -xx;
    1218:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    121c:	02b677bb          	remuw	a5,a2,a1
    1220:	00001697          	auipc	a3,0x1
    1224:	dc068693          	add	a3,a3,-576 # 1fe0 <digits>
    buf[16] = 0;
    1228:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    122c:	0005871b          	sext.w	a4,a1
    1230:	1782                	sll	a5,a5,0x20
    1232:	9381                	srl	a5,a5,0x20
    1234:	97b6                	add	a5,a5,a3
    1236:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    123e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1242:	ecb67ae3          	bgeu	a2,a1,1116 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124e:	45b9                	li	a1,14
    1250:	bf55                	j	1204 <printint.constprop.0+0x120>
    1252:	45a9                	li	a1,10
    if (sign)
    1254:	fa0558e3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1260:	45a5                	li	a1,9
    1262:	b74d                	j	1204 <printint.constprop.0+0x120>
    1264:	45b9                	li	a1,14
    if (sign)
    1266:	f8055fe3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1272:	45b5                	li	a1,13
    1274:	bf41                	j	1204 <printint.constprop.0+0x120>
    1276:	45b5                	li	a1,13
    if (sign)
    1278:	f80556e3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1284:	45b1                	li	a1,12
    1286:	bfbd                	j	1204 <printint.constprop.0+0x120>
    1288:	45b1                	li	a1,12
    if (sign)
    128a:	f6055de3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1296:	45ad                	li	a1,11
    1298:	b7b5                	j	1204 <printint.constprop.0+0x120>
    129a:	45ad                	li	a1,11
    if (sign)
    129c:	f60554e3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a8:	45a9                	li	a1,10
    12aa:	bfa9                	j	1204 <printint.constprop.0+0x120>
    12ac:	45a5                	li	a1,9
    if (sign)
    12ae:	f4055be3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b2:	02d00793          	li	a5,45
    12b6:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12ba:	45a1                	li	a1,8
    12bc:	b7a1                	j	1204 <printint.constprop.0+0x120>
    i = 15;
    12be:	45bd                	li	a1,15
    12c0:	b791                	j	1204 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12c2:	45a1                	li	a1,8
    if (sign)
    12c4:	f40550e3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d0:	459d                	li	a1,7
    12d2:	bf0d                	j	1204 <printint.constprop.0+0x120>
    12d4:	459d                	li	a1,7
    if (sign)
    12d6:	f20557e3          	bgez	a0,1204 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e2:	4599                	li	a1,6
    12e4:	b705                	j	1204 <printint.constprop.0+0x120>

00000000000012e6 <getchar>:
{
    12e6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12e8:	00f10593          	add	a1,sp,15
    12ec:	4605                	li	a2,1
    12ee:	4501                	li	a0,0
{
    12f0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f6:	17b000ef          	jal	1c70 <read>
}
    12fa:	60e2                	ld	ra,24(sp)
    12fc:	00f14503          	lbu	a0,15(sp)
    1300:	6105                	add	sp,sp,32
    1302:	8082                	ret

0000000000001304 <putchar>:
{
    1304:	1101                	add	sp,sp,-32
    1306:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1308:	00f10593          	add	a1,sp,15
    130c:	4605                	li	a2,1
    130e:	4505                	li	a0,1
{
    1310:	ec06                	sd	ra,24(sp)
    char byte = c;
    1312:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1316:	165000ef          	jal	1c7a <write>
}
    131a:	60e2                	ld	ra,24(sp)
    131c:	2501                	sext.w	a0,a0
    131e:	6105                	add	sp,sp,32
    1320:	8082                	ret

0000000000001322 <puts>:
{
    1322:	1141                	add	sp,sp,-16
    1324:	e406                	sd	ra,8(sp)
    1326:	e022                	sd	s0,0(sp)
    1328:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    132a:	574000ef          	jal	189e <strlen>
    132e:	862a                	mv	a2,a0
    1330:	85a2                	mv	a1,s0
    1332:	4505                	li	a0,1
    1334:	147000ef          	jal	1c7a <write>
}
    1338:	60a2                	ld	ra,8(sp)
    133a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    133c:	957d                	sra	a0,a0,0x3f
    return r;
    133e:	2501                	sext.w	a0,a0
}
    1340:	0141                	add	sp,sp,16
    1342:	8082                	ret

0000000000001344 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1344:	7171                	add	sp,sp,-176
    1346:	f85a                	sd	s6,48(sp)
    1348:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    134a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    134c:	18bc                	add	a5,sp,120
{
    134e:	e8ca                	sd	s2,80(sp)
    1350:	e4ce                	sd	s3,72(sp)
    1352:	e0d2                	sd	s4,64(sp)
    1354:	fc56                	sd	s5,56(sp)
    1356:	f486                	sd	ra,104(sp)
    1358:	f0a2                	sd	s0,96(sp)
    135a:	eca6                	sd	s1,88(sp)
    135c:	fcae                	sd	a1,120(sp)
    135e:	e132                	sd	a2,128(sp)
    1360:	e536                	sd	a3,136(sp)
    1362:	e93a                	sd	a4,144(sp)
    1364:	f142                	sd	a6,160(sp)
    1366:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1368:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    136a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    136e:	07300a13          	li	s4,115
    1372:	07800a93          	li	s5,120
    buf[i++] = '0';
    1376:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137a:	00001997          	auipc	s3,0x1
    137e:	c6698993          	add	s3,s3,-922 # 1fe0 <digits>
        if (!*s)
    1382:	00054783          	lbu	a5,0(a0)
    1386:	16078a63          	beqz	a5,14fa <printf+0x1b6>
    138a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    138c:	19278d63          	beq	a5,s2,1526 <printf+0x1e2>
    1390:	00164783          	lbu	a5,1(a2)
    1394:	0605                	add	a2,a2,1
    1396:	fbfd                	bnez	a5,138c <printf+0x48>
    1398:	84b2                	mv	s1,a2
        l = z - a;
    139a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    139e:	85aa                	mv	a1,a0
    13a0:	8622                	mv	a2,s0
    13a2:	4505                	li	a0,1
    13a4:	0d7000ef          	jal	1c7a <write>
        if (l)
    13a8:	1a041463          	bnez	s0,1550 <printf+0x20c>
        if (s[1] == 0)
    13ac:	0014c783          	lbu	a5,1(s1)
    13b0:	14078563          	beqz	a5,14fa <printf+0x1b6>
        switch (s[1])
    13b4:	1b478063          	beq	a5,s4,1554 <printf+0x210>
    13b8:	14fa6b63          	bltu	s4,a5,150e <printf+0x1ca>
    13bc:	06400713          	li	a4,100
    13c0:	1ee78063          	beq	a5,a4,15a0 <printf+0x25c>
    13c4:	07000713          	li	a4,112
    13c8:	1ae79963          	bne	a5,a4,157a <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13cc:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ce:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d4:	631c                	ld	a5,0(a4)
    13d6:	0721                	add	a4,a4,8
    13d8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13da:	00479293          	sll	t0,a5,0x4
    13de:	00879f93          	sll	t6,a5,0x8
    13e2:	00c79f13          	sll	t5,a5,0xc
    13e6:	01079e93          	sll	t4,a5,0x10
    13ea:	01479e13          	sll	t3,a5,0x14
    13ee:	01879313          	sll	t1,a5,0x18
    13f2:	01c79893          	sll	a7,a5,0x1c
    13f6:	02479813          	sll	a6,a5,0x24
    13fa:	02879513          	sll	a0,a5,0x28
    13fe:	02c79593          	sll	a1,a5,0x2c
    1402:	03079693          	sll	a3,a5,0x30
    1406:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140a:	03c7d413          	srl	s0,a5,0x3c
    140e:	01c7d39b          	srlw	t2,a5,0x1c
    1412:	03c2d293          	srl	t0,t0,0x3c
    1416:	03cfdf93          	srl	t6,t6,0x3c
    141a:	03cf5f13          	srl	t5,t5,0x3c
    141e:	03cede93          	srl	t4,t4,0x3c
    1422:	03ce5e13          	srl	t3,t3,0x3c
    1426:	03c35313          	srl	t1,t1,0x3c
    142a:	03c8d893          	srl	a7,a7,0x3c
    142e:	03c85813          	srl	a6,a6,0x3c
    1432:	9171                	srl	a0,a0,0x3c
    1434:	91f1                	srl	a1,a1,0x3c
    1436:	92f1                	srl	a3,a3,0x3c
    1438:	9371                	srl	a4,a4,0x3c
    143a:	96ce                	add	a3,a3,s3
    143c:	974e                	add	a4,a4,s3
    143e:	944e                	add	s0,s0,s3
    1440:	92ce                	add	t0,t0,s3
    1442:	9fce                	add	t6,t6,s3
    1444:	9f4e                	add	t5,t5,s3
    1446:	9ece                	add	t4,t4,s3
    1448:	9e4e                	add	t3,t3,s3
    144a:	934e                	add	t1,t1,s3
    144c:	98ce                	add	a7,a7,s3
    144e:	93ce                	add	t2,t2,s3
    1450:	984e                	add	a6,a6,s3
    1452:	954e                	add	a0,a0,s3
    1454:	95ce                	add	a1,a1,s3
    1456:	0006c083          	lbu	ra,0(a3)
    145a:	0002c283          	lbu	t0,0(t0)
    145e:	00074683          	lbu	a3,0(a4)
    1462:	000fcf83          	lbu	t6,0(t6)
    1466:	000f4f03          	lbu	t5,0(t5)
    146a:	000ece83          	lbu	t4,0(t4)
    146e:	000e4e03          	lbu	t3,0(t3)
    1472:	00034303          	lbu	t1,0(t1)
    1476:	0008c883          	lbu	a7,0(a7)
    147a:	0003c383          	lbu	t2,0(t2)
    147e:	00084803          	lbu	a6,0(a6)
    1482:	00054503          	lbu	a0,0(a0)
    1486:	0005c583          	lbu	a1,0(a1)
    148a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1492:	9371                	srl	a4,a4,0x3c
    1494:	8bbd                	and	a5,a5,15
    1496:	974e                	add	a4,a4,s3
    1498:	97ce                	add	a5,a5,s3
    149a:	005105a3          	sb	t0,11(sp)
    149e:	01f10623          	sb	t6,12(sp)
    14a2:	01e106a3          	sb	t5,13(sp)
    14a6:	01d10723          	sb	t4,14(sp)
    14aa:	01c107a3          	sb	t3,15(sp)
    14ae:	00610823          	sb	t1,16(sp)
    14b2:	011108a3          	sb	a7,17(sp)
    14b6:	00710923          	sb	t2,18(sp)
    14ba:	010109a3          	sb	a6,19(sp)
    14be:	00a10a23          	sb	a0,20(sp)
    14c2:	00b10aa3          	sb	a1,21(sp)
    14c6:	00110b23          	sb	ra,22(sp)
    14ca:	00d10ba3          	sb	a3,23(sp)
    14ce:	00810523          	sb	s0,10(sp)
    14d2:	00074703          	lbu	a4,0(a4)
    14d6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14da:	002c                	add	a1,sp,8
    14dc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14de:	00e10c23          	sb	a4,24(sp)
    14e2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ea:	790000ef          	jal	1c7a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ee:	00248513          	add	a0,s1,2
        if (!*s)
    14f2:	00054783          	lbu	a5,0(a0)
    14f6:	e8079ae3          	bnez	a5,138a <printf+0x46>
    }
    va_end(ap);
}
    14fa:	70a6                	ld	ra,104(sp)
    14fc:	7406                	ld	s0,96(sp)
    14fe:	64e6                	ld	s1,88(sp)
    1500:	6946                	ld	s2,80(sp)
    1502:	69a6                	ld	s3,72(sp)
    1504:	6a06                	ld	s4,64(sp)
    1506:	7ae2                	ld	s5,56(sp)
    1508:	7b42                	ld	s6,48(sp)
    150a:	614d                	add	sp,sp,176
    150c:	8082                	ret
        switch (s[1])
    150e:	07579663          	bne	a5,s5,157a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1512:	6782                	ld	a5,0(sp)
    1514:	45c1                	li	a1,16
    1516:	4388                	lw	a0,0(a5)
    1518:	07a1                	add	a5,a5,8
    151a:	e03e                	sd	a5,0(sp)
    151c:	bc9ff0ef          	jal	10e4 <printint.constprop.0>
        s += 2;
    1520:	00248513          	add	a0,s1,2
    1524:	b7f9                	j	14f2 <printf+0x1ae>
    1526:	84b2                	mv	s1,a2
    1528:	a039                	j	1536 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152a:	0024c783          	lbu	a5,2(s1)
    152e:	0605                	add	a2,a2,1
    1530:	0489                	add	s1,s1,2
    1532:	e72794e3          	bne	a5,s2,139a <printf+0x56>
    1536:	0014c783          	lbu	a5,1(s1)
    153a:	ff2788e3          	beq	a5,s2,152a <printf+0x1e6>
        l = z - a;
    153e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1542:	85aa                	mv	a1,a0
    1544:	8622                	mv	a2,s0
    1546:	4505                	li	a0,1
    1548:	732000ef          	jal	1c7a <write>
        if (l)
    154c:	e60400e3          	beqz	s0,13ac <printf+0x68>
    1550:	8526                	mv	a0,s1
    1552:	bd05                	j	1382 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1554:	6782                	ld	a5,0(sp)
    1556:	6380                	ld	s0,0(a5)
    1558:	07a1                	add	a5,a5,8
    155a:	e03e                	sd	a5,0(sp)
    155c:	cc21                	beqz	s0,15b4 <printf+0x270>
            l = strnlen(a, 200);
    155e:	0c800593          	li	a1,200
    1562:	8522                	mv	a0,s0
    1564:	424000ef          	jal	1988 <strnlen>
    write(f, s, l);
    1568:	0005061b          	sext.w	a2,a0
    156c:	85a2                	mv	a1,s0
    156e:	4505                	li	a0,1
    1570:	70a000ef          	jal	1c7a <write>
        s += 2;
    1574:	00248513          	add	a0,s1,2
    1578:	bfad                	j	14f2 <printf+0x1ae>
    return write(stdout, &byte, 1);
    157a:	4605                	li	a2,1
    157c:	002c                	add	a1,sp,8
    157e:	4505                	li	a0,1
    char byte = c;
    1580:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1584:	6f6000ef          	jal	1c7a <write>
    char byte = c;
    1588:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158c:	4605                	li	a2,1
    158e:	002c                	add	a1,sp,8
    1590:	4505                	li	a0,1
    char byte = c;
    1592:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1596:	6e4000ef          	jal	1c7a <write>
        s += 2;
    159a:	00248513          	add	a0,s1,2
    159e:	bf91                	j	14f2 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15a0:	6782                	ld	a5,0(sp)
    15a2:	45a9                	li	a1,10
    15a4:	4388                	lw	a0,0(a5)
    15a6:	07a1                	add	a5,a5,8
    15a8:	e03e                	sd	a5,0(sp)
    15aa:	b3bff0ef          	jal	10e4 <printint.constprop.0>
        s += 2;
    15ae:	00248513          	add	a0,s1,2
    15b2:	b781                	j	14f2 <printf+0x1ae>
                a = "(null)";
    15b4:	00001417          	auipc	s0,0x1
    15b8:	9fc40413          	add	s0,s0,-1540 # 1fb0 <__clone+0xd8>
    15bc:	b74d                	j	155e <printf+0x21a>

00000000000015be <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15be:	1141                	add	sp,sp,-16
    15c0:	e406                	sd	ra,8(sp)
    puts(m);
    15c2:	d61ff0ef          	jal	1322 <puts>
    exit(-100);
}
    15c6:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c8:	f9c00513          	li	a0,-100
}
    15cc:	0141                	add	sp,sp,16
    exit(-100);
    15ce:	a719                	j	1cd4 <exit>

00000000000015d0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d0:	02000793          	li	a5,32
    15d4:	00f50663          	beq	a0,a5,15e0 <isspace+0x10>
    15d8:	355d                	addw	a0,a0,-9
    15da:	00553513          	sltiu	a0,a0,5
    15de:	8082                	ret
    15e0:	4505                	li	a0,1
}
    15e2:	8082                	ret

00000000000015e4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e4:	fd05051b          	addw	a0,a0,-48
}
    15e8:	00a53513          	sltiu	a0,a0,10
    15ec:	8082                	ret

00000000000015ee <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ee:	02000693          	li	a3,32
    15f2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	ff77871b          	addw	a4,a5,-9
    15fc:	04d78c63          	beq	a5,a3,1654 <atoi+0x66>
    1600:	0007861b          	sext.w	a2,a5
    1604:	04e5f863          	bgeu	a1,a4,1654 <atoi+0x66>
        s++;
    switch (*s)
    1608:	02b00713          	li	a4,43
    160c:	04e78963          	beq	a5,a4,165e <atoi+0x70>
    1610:	02d00713          	li	a4,45
    1614:	06e78263          	beq	a5,a4,1678 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1618:	fd06069b          	addw	a3,a2,-48
    161c:	47a5                	li	a5,9
    161e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1620:	4301                	li	t1,0
    while (isdigit(*s))
    1622:	04d7e963          	bltu	a5,a3,1674 <atoi+0x86>
    int n = 0, neg = 0;
    1626:	4501                	li	a0,0
    while (isdigit(*s))
    1628:	48a5                	li	a7,9
    162a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    162e:	0025179b          	sllw	a5,a0,0x2
    1632:	9fa9                	addw	a5,a5,a0
    1634:	fd06059b          	addw	a1,a2,-48
    1638:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    163c:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1640:	0705                	add	a4,a4,1
    1642:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1646:	0006861b          	sext.w	a2,a3
    164a:	ff08f0e3          	bgeu	a7,a6,162a <atoi+0x3c>
    return neg ? n : -n;
    164e:	00030563          	beqz	t1,1658 <atoi+0x6a>
}
    1652:	8082                	ret
        s++;
    1654:	0505                	add	a0,a0,1
    1656:	bf79                	j	15f4 <atoi+0x6>
    return neg ? n : -n;
    1658:	40f5853b          	subw	a0,a1,a5
    165c:	8082                	ret
    while (isdigit(*s))
    165e:	00154603          	lbu	a2,1(a0)
    1662:	47a5                	li	a5,9
        s++;
    1664:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1668:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    166c:	4301                	li	t1,0
    while (isdigit(*s))
    166e:	2601                	sext.w	a2,a2
    1670:	fad7fbe3          	bgeu	a5,a3,1626 <atoi+0x38>
    1674:	4501                	li	a0,0
}
    1676:	8082                	ret
    while (isdigit(*s))
    1678:	00154603          	lbu	a2,1(a0)
    167c:	47a5                	li	a5,9
        s++;
    167e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1682:	fd06069b          	addw	a3,a2,-48
    1686:	2601                	sext.w	a2,a2
    1688:	fed7e6e3          	bltu	a5,a3,1674 <atoi+0x86>
        neg = 1;
    168c:	4305                	li	t1,1
    168e:	bf61                	j	1626 <atoi+0x38>

0000000000001690 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1690:	18060163          	beqz	a2,1812 <memset+0x182>
    1694:	40a006b3          	neg	a3,a0
    1698:	0076f793          	and	a5,a3,7
    169c:	00778813          	add	a6,a5,7
    16a0:	48ad                	li	a7,11
    16a2:	0ff5f713          	zext.b	a4,a1
    16a6:	fff60593          	add	a1,a2,-1
    16aa:	17186563          	bltu	a6,a7,1814 <memset+0x184>
    16ae:	1705ed63          	bltu	a1,a6,1828 <memset+0x198>
    16b2:	16078363          	beqz	a5,1818 <memset+0x188>
    16b6:	00e50023          	sb	a4,0(a0)
    16ba:	0066f593          	and	a1,a3,6
    16be:	16058063          	beqz	a1,181e <memset+0x18e>
    16c2:	00e500a3          	sb	a4,1(a0)
    16c6:	4589                	li	a1,2
    16c8:	16f5f363          	bgeu	a1,a5,182e <memset+0x19e>
    16cc:	00e50123          	sb	a4,2(a0)
    16d0:	8a91                	and	a3,a3,4
    16d2:	00350593          	add	a1,a0,3
    16d6:	4e0d                	li	t3,3
    16d8:	ce9d                	beqz	a3,1716 <memset+0x86>
    16da:	00e501a3          	sb	a4,3(a0)
    16de:	4691                	li	a3,4
    16e0:	00450593          	add	a1,a0,4
    16e4:	4e11                	li	t3,4
    16e6:	02f6f863          	bgeu	a3,a5,1716 <memset+0x86>
    16ea:	00e50223          	sb	a4,4(a0)
    16ee:	4695                	li	a3,5
    16f0:	00550593          	add	a1,a0,5
    16f4:	4e15                	li	t3,5
    16f6:	02d78063          	beq	a5,a3,1716 <memset+0x86>
    16fa:	fff50693          	add	a3,a0,-1
    16fe:	00e502a3          	sb	a4,5(a0)
    1702:	8a9d                	and	a3,a3,7
    1704:	00650593          	add	a1,a0,6
    1708:	4e19                	li	t3,6
    170a:	e691                	bnez	a3,1716 <memset+0x86>
    170c:	00750593          	add	a1,a0,7
    1710:	00e50323          	sb	a4,6(a0)
    1714:	4e1d                	li	t3,7
    1716:	00871693          	sll	a3,a4,0x8
    171a:	01071813          	sll	a6,a4,0x10
    171e:	8ed9                	or	a3,a3,a4
    1720:	01871893          	sll	a7,a4,0x18
    1724:	0106e6b3          	or	a3,a3,a6
    1728:	0116e6b3          	or	a3,a3,a7
    172c:	02071813          	sll	a6,a4,0x20
    1730:	02871313          	sll	t1,a4,0x28
    1734:	0106e6b3          	or	a3,a3,a6
    1738:	40f608b3          	sub	a7,a2,a5
    173c:	03071813          	sll	a6,a4,0x30
    1740:	0066e6b3          	or	a3,a3,t1
    1744:	0106e6b3          	or	a3,a3,a6
    1748:	03871313          	sll	t1,a4,0x38
    174c:	97aa                	add	a5,a5,a0
    174e:	ff88f813          	and	a6,a7,-8
    1752:	0066e6b3          	or	a3,a3,t1
    1756:	983e                	add	a6,a6,a5
    1758:	e394                	sd	a3,0(a5)
    175a:	07a1                	add	a5,a5,8
    175c:	ff079ee3          	bne	a5,a6,1758 <memset+0xc8>
    1760:	ff88f793          	and	a5,a7,-8
    1764:	0078f893          	and	a7,a7,7
    1768:	00f586b3          	add	a3,a1,a5
    176c:	01c787bb          	addw	a5,a5,t3
    1770:	0a088b63          	beqz	a7,1826 <memset+0x196>
    1774:	00e68023          	sb	a4,0(a3)
    1778:	0017859b          	addw	a1,a5,1
    177c:	08c5fb63          	bgeu	a1,a2,1812 <memset+0x182>
    1780:	00e680a3          	sb	a4,1(a3)
    1784:	0027859b          	addw	a1,a5,2
    1788:	08c5f563          	bgeu	a1,a2,1812 <memset+0x182>
    178c:	00e68123          	sb	a4,2(a3)
    1790:	0037859b          	addw	a1,a5,3
    1794:	06c5ff63          	bgeu	a1,a2,1812 <memset+0x182>
    1798:	00e681a3          	sb	a4,3(a3)
    179c:	0047859b          	addw	a1,a5,4
    17a0:	06c5f963          	bgeu	a1,a2,1812 <memset+0x182>
    17a4:	00e68223          	sb	a4,4(a3)
    17a8:	0057859b          	addw	a1,a5,5
    17ac:	06c5f363          	bgeu	a1,a2,1812 <memset+0x182>
    17b0:	00e682a3          	sb	a4,5(a3)
    17b4:	0067859b          	addw	a1,a5,6
    17b8:	04c5fd63          	bgeu	a1,a2,1812 <memset+0x182>
    17bc:	00e68323          	sb	a4,6(a3)
    17c0:	0077859b          	addw	a1,a5,7
    17c4:	04c5f763          	bgeu	a1,a2,1812 <memset+0x182>
    17c8:	00e683a3          	sb	a4,7(a3)
    17cc:	0087859b          	addw	a1,a5,8
    17d0:	04c5f163          	bgeu	a1,a2,1812 <memset+0x182>
    17d4:	00e68423          	sb	a4,8(a3)
    17d8:	0097859b          	addw	a1,a5,9
    17dc:	02c5fb63          	bgeu	a1,a2,1812 <memset+0x182>
    17e0:	00e684a3          	sb	a4,9(a3)
    17e4:	00a7859b          	addw	a1,a5,10
    17e8:	02c5f563          	bgeu	a1,a2,1812 <memset+0x182>
    17ec:	00e68523          	sb	a4,10(a3)
    17f0:	00b7859b          	addw	a1,a5,11
    17f4:	00c5ff63          	bgeu	a1,a2,1812 <memset+0x182>
    17f8:	00e685a3          	sb	a4,11(a3)
    17fc:	00c7859b          	addw	a1,a5,12
    1800:	00c5f963          	bgeu	a1,a2,1812 <memset+0x182>
    1804:	00e68623          	sb	a4,12(a3)
    1808:	27b5                	addw	a5,a5,13
    180a:	00c7f463          	bgeu	a5,a2,1812 <memset+0x182>
    180e:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1812:	8082                	ret
    1814:	482d                	li	a6,11
    1816:	bd61                	j	16ae <memset+0x1e>
    char *p = dest;
    1818:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181a:	4e01                	li	t3,0
    181c:	bded                	j	1716 <memset+0x86>
    181e:	00150593          	add	a1,a0,1
    1822:	4e05                	li	t3,1
    1824:	bdcd                	j	1716 <memset+0x86>
    1826:	8082                	ret
    char *p = dest;
    1828:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    182a:	4781                	li	a5,0
    182c:	b7a1                	j	1774 <memset+0xe4>
    182e:	00250593          	add	a1,a0,2
    1832:	4e09                	li	t3,2
    1834:	b5cd                	j	1716 <memset+0x86>

0000000000001836 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1836:	00054783          	lbu	a5,0(a0)
    183a:	0005c703          	lbu	a4,0(a1)
    183e:	00e79863          	bne	a5,a4,184e <strcmp+0x18>
    1842:	0505                	add	a0,a0,1
    1844:	0585                	add	a1,a1,1
    1846:	fbe5                	bnez	a5,1836 <strcmp>
    1848:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    184a:	9d19                	subw	a0,a0,a4
    184c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    184e:	0007851b          	sext.w	a0,a5
    1852:	bfe5                	j	184a <strcmp+0x14>

0000000000001854 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1854:	ca15                	beqz	a2,1888 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1856:	00054783          	lbu	a5,0(a0)
    if (!n--)
    185a:	167d                	add	a2,a2,-1
    185c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1860:	eb99                	bnez	a5,1876 <strncmp+0x22>
    1862:	a815                	j	1896 <strncmp+0x42>
    1864:	00a68e63          	beq	a3,a0,1880 <strncmp+0x2c>
    1868:	0505                	add	a0,a0,1
    186a:	00f71b63          	bne	a4,a5,1880 <strncmp+0x2c>
    186e:	00054783          	lbu	a5,0(a0)
    1872:	cf89                	beqz	a5,188c <strncmp+0x38>
    1874:	85b2                	mv	a1,a2
    1876:	0005c703          	lbu	a4,0(a1)
    187a:	00158613          	add	a2,a1,1
    187e:	f37d                	bnez	a4,1864 <strncmp+0x10>
        ;
    return *l - *r;
    1880:	0007851b          	sext.w	a0,a5
    1884:	9d19                	subw	a0,a0,a4
    1886:	8082                	ret
        return 0;
    1888:	4501                	li	a0,0
}
    188a:	8082                	ret
    return *l - *r;
    188c:	0015c703          	lbu	a4,1(a1)
    1890:	4501                	li	a0,0
    1892:	9d19                	subw	a0,a0,a4
    1894:	8082                	ret
    1896:	0005c703          	lbu	a4,0(a1)
    189a:	4501                	li	a0,0
    189c:	b7e5                	j	1884 <strncmp+0x30>

000000000000189e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189e:	00757793          	and	a5,a0,7
    18a2:	cf89                	beqz	a5,18bc <strlen+0x1e>
    18a4:	87aa                	mv	a5,a0
    18a6:	a029                	j	18b0 <strlen+0x12>
    18a8:	0785                	add	a5,a5,1
    18aa:	0077f713          	and	a4,a5,7
    18ae:	cb01                	beqz	a4,18be <strlen+0x20>
        if (!*s)
    18b0:	0007c703          	lbu	a4,0(a5)
    18b4:	fb75                	bnez	a4,18a8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b6:	40a78533          	sub	a0,a5,a0
}
    18ba:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18bc:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18be:	6394                	ld	a3,0(a5)
    18c0:	00000597          	auipc	a1,0x0
    18c4:	6f85b583          	ld	a1,1784(a1) # 1fb8 <__clone+0xe0>
    18c8:	00000617          	auipc	a2,0x0
    18cc:	6f863603          	ld	a2,1784(a2) # 1fc0 <__clone+0xe8>
    18d0:	a019                	j	18d6 <strlen+0x38>
    18d2:	6794                	ld	a3,8(a5)
    18d4:	07a1                	add	a5,a5,8
    18d6:	00b68733          	add	a4,a3,a1
    18da:	fff6c693          	not	a3,a3
    18de:	8f75                	and	a4,a4,a3
    18e0:	8f71                	and	a4,a4,a2
    18e2:	db65                	beqz	a4,18d2 <strlen+0x34>
    for (; *s; s++)
    18e4:	0007c703          	lbu	a4,0(a5)
    18e8:	d779                	beqz	a4,18b6 <strlen+0x18>
    18ea:	0017c703          	lbu	a4,1(a5)
    18ee:	0785                	add	a5,a5,1
    18f0:	d379                	beqz	a4,18b6 <strlen+0x18>
    18f2:	0017c703          	lbu	a4,1(a5)
    18f6:	0785                	add	a5,a5,1
    18f8:	fb6d                	bnez	a4,18ea <strlen+0x4c>
    18fa:	bf75                	j	18b6 <strlen+0x18>

00000000000018fc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fc:	00757713          	and	a4,a0,7
{
    1900:	87aa                	mv	a5,a0
    1902:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1906:	cb19                	beqz	a4,191c <memchr+0x20>
    1908:	ce25                	beqz	a2,1980 <memchr+0x84>
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	00b70763          	beq	a4,a1,191c <memchr+0x20>
    1912:	0785                	add	a5,a5,1
    1914:	0077f713          	and	a4,a5,7
    1918:	167d                	add	a2,a2,-1
    191a:	f77d                	bnez	a4,1908 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191c:	4501                	li	a0,0
    if (n && *s != c)
    191e:	c235                	beqz	a2,1982 <memchr+0x86>
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	06b70063          	beq	a4,a1,1984 <memchr+0x88>
        size_t k = ONES * c;
    1928:	00000517          	auipc	a0,0x0
    192c:	6a053503          	ld	a0,1696(a0) # 1fc8 <__clone+0xf0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1930:	471d                	li	a4,7
        size_t k = ONES * c;
    1932:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1936:	04c77763          	bgeu	a4,a2,1984 <memchr+0x88>
    193a:	00000897          	auipc	a7,0x0
    193e:	67e8b883          	ld	a7,1662(a7) # 1fb8 <__clone+0xe0>
    1942:	00000817          	auipc	a6,0x0
    1946:	67e83803          	ld	a6,1662(a6) # 1fc0 <__clone+0xe8>
    194a:	431d                	li	t1,7
    194c:	a029                	j	1956 <memchr+0x5a>
    194e:	1661                	add	a2,a2,-8
    1950:	07a1                	add	a5,a5,8
    1952:	00c37c63          	bgeu	t1,a2,196a <memchr+0x6e>
    1956:	6398                	ld	a4,0(a5)
    1958:	8f29                	xor	a4,a4,a0
    195a:	011706b3          	add	a3,a4,a7
    195e:	fff74713          	not	a4,a4
    1962:	8f75                	and	a4,a4,a3
    1964:	01077733          	and	a4,a4,a6
    1968:	d37d                	beqz	a4,194e <memchr+0x52>
    196a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    196c:	e601                	bnez	a2,1974 <memchr+0x78>
    196e:	a809                	j	1980 <memchr+0x84>
    1970:	0505                	add	a0,a0,1
    1972:	c619                	beqz	a2,1980 <memchr+0x84>
    1974:	00054783          	lbu	a5,0(a0)
    1978:	167d                	add	a2,a2,-1
    197a:	feb79be3          	bne	a5,a1,1970 <memchr+0x74>
    197e:	8082                	ret
    return n ? (void *)s : 0;
    1980:	4501                	li	a0,0
}
    1982:	8082                	ret
    if (n && *s != c)
    1984:	853e                	mv	a0,a5
    1986:	b7fd                	j	1974 <memchr+0x78>

0000000000001988 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1988:	1101                	add	sp,sp,-32
    198a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198c:	862e                	mv	a2,a1
{
    198e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1990:	4581                	li	a1,0
{
    1992:	e426                	sd	s1,8(sp)
    1994:	ec06                	sd	ra,24(sp)
    1996:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1998:	f65ff0ef          	jal	18fc <memchr>
    return p ? p - s : n;
    199c:	c519                	beqz	a0,19aa <strnlen+0x22>
}
    199e:	60e2                	ld	ra,24(sp)
    19a0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a2:	8d05                	sub	a0,a0,s1
}
    19a4:	64a2                	ld	s1,8(sp)
    19a6:	6105                	add	sp,sp,32
    19a8:	8082                	ret
    19aa:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ac:	8522                	mv	a0,s0
}
    19ae:	6442                	ld	s0,16(sp)
    19b0:	64a2                	ld	s1,8(sp)
    19b2:	6105                	add	sp,sp,32
    19b4:	8082                	ret

00000000000019b6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b6:	00a5c7b3          	xor	a5,a1,a0
    19ba:	8b9d                	and	a5,a5,7
    19bc:	eb95                	bnez	a5,19f0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19be:	0075f793          	and	a5,a1,7
    19c2:	e7b1                	bnez	a5,1a0e <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c4:	6198                	ld	a4,0(a1)
    19c6:	00000617          	auipc	a2,0x0
    19ca:	5f263603          	ld	a2,1522(a2) # 1fb8 <__clone+0xe0>
    19ce:	00000817          	auipc	a6,0x0
    19d2:	5f283803          	ld	a6,1522(a6) # 1fc0 <__clone+0xe8>
    19d6:	a029                	j	19e0 <strcpy+0x2a>
    19d8:	05a1                	add	a1,a1,8
    19da:	e118                	sd	a4,0(a0)
    19dc:	6198                	ld	a4,0(a1)
    19de:	0521                	add	a0,a0,8
    19e0:	00c707b3          	add	a5,a4,a2
    19e4:	fff74693          	not	a3,a4
    19e8:	8ff5                	and	a5,a5,a3
    19ea:	0107f7b3          	and	a5,a5,a6
    19ee:	d7ed                	beqz	a5,19d8 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f0:	0005c783          	lbu	a5,0(a1)
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	c785                	beqz	a5,1a20 <strcpy+0x6a>
    19fa:	0015c783          	lbu	a5,1(a1)
    19fe:	0505                	add	a0,a0,1
    1a00:	0585                	add	a1,a1,1
    1a02:	00f50023          	sb	a5,0(a0)
    1a06:	fbf5                	bnez	a5,19fa <strcpy+0x44>
        ;
    return d;
}
    1a08:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a0a:	0505                	add	a0,a0,1
    1a0c:	df45                	beqz	a4,19c4 <strcpy+0xe>
            if (!(*d = *s))
    1a0e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a12:	0585                	add	a1,a1,1
    1a14:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a18:	00f50023          	sb	a5,0(a0)
    1a1c:	f7fd                	bnez	a5,1a0a <strcpy+0x54>
}
    1a1e:	8082                	ret
    1a20:	8082                	ret

0000000000001a22 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a22:	00a5c7b3          	xor	a5,a1,a0
    1a26:	8b9d                	and	a5,a5,7
    1a28:	e3b5                	bnez	a5,1a8c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a2a:	0075f793          	and	a5,a1,7
    1a2e:	cf99                	beqz	a5,1a4c <strncpy+0x2a>
    1a30:	ea09                	bnez	a2,1a42 <strncpy+0x20>
    1a32:	a421                	j	1c3a <strncpy+0x218>
    1a34:	0585                	add	a1,a1,1
    1a36:	0075f793          	and	a5,a1,7
    1a3a:	167d                	add	a2,a2,-1
    1a3c:	0505                	add	a0,a0,1
    1a3e:	c799                	beqz	a5,1a4c <strncpy+0x2a>
    1a40:	c225                	beqz	a2,1aa0 <strncpy+0x7e>
    1a42:	0005c783          	lbu	a5,0(a1)
    1a46:	00f50023          	sb	a5,0(a0)
    1a4a:	f7ed                	bnez	a5,1a34 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a4c:	ca31                	beqz	a2,1aa0 <strncpy+0x7e>
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	cba1                	beqz	a5,1aa2 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a54:	479d                	li	a5,7
    1a56:	02c7fc63          	bgeu	a5,a2,1a8e <strncpy+0x6c>
    1a5a:	00000897          	auipc	a7,0x0
    1a5e:	55e8b883          	ld	a7,1374(a7) # 1fb8 <__clone+0xe0>
    1a62:	00000817          	auipc	a6,0x0
    1a66:	55e83803          	ld	a6,1374(a6) # 1fc0 <__clone+0xe8>
    1a6a:	431d                	li	t1,7
    1a6c:	a039                	j	1a7a <strncpy+0x58>
            *wd = *ws;
    1a6e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a70:	1661                	add	a2,a2,-8
    1a72:	05a1                	add	a1,a1,8
    1a74:	0521                	add	a0,a0,8
    1a76:	00c37b63          	bgeu	t1,a2,1a8c <strncpy+0x6a>
    1a7a:	6198                	ld	a4,0(a1)
    1a7c:	011707b3          	add	a5,a4,a7
    1a80:	fff74693          	not	a3,a4
    1a84:	8ff5                	and	a5,a5,a3
    1a86:	0107f7b3          	and	a5,a5,a6
    1a8a:	d3f5                	beqz	a5,1a6e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a8c:	ca11                	beqz	a2,1aa0 <strncpy+0x7e>
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	0585                	add	a1,a1,1
    1a94:	00f50023          	sb	a5,0(a0)
    1a98:	c789                	beqz	a5,1aa2 <strncpy+0x80>
    1a9a:	167d                	add	a2,a2,-1
    1a9c:	0505                	add	a0,a0,1
    1a9e:	fa65                	bnez	a2,1a8e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aa0:	8082                	ret
    1aa2:	4805                	li	a6,1
    1aa4:	14061b63          	bnez	a2,1bfa <strncpy+0x1d8>
    1aa8:	40a00733          	neg	a4,a0
    1aac:	00777793          	and	a5,a4,7
    1ab0:	4581                	li	a1,0
    1ab2:	12061c63          	bnez	a2,1bea <strncpy+0x1c8>
    1ab6:	00778693          	add	a3,a5,7
    1aba:	48ad                	li	a7,11
    1abc:	1316e563          	bltu	a3,a7,1be6 <strncpy+0x1c4>
    1ac0:	16d5e263          	bltu	a1,a3,1c24 <strncpy+0x202>
    1ac4:	14078c63          	beqz	a5,1c1c <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ac8:	00050023          	sb	zero,0(a0)
    1acc:	00677693          	and	a3,a4,6
    1ad0:	14068263          	beqz	a3,1c14 <strncpy+0x1f2>
    1ad4:	000500a3          	sb	zero,1(a0)
    1ad8:	4689                	li	a3,2
    1ada:	14f6f863          	bgeu	a3,a5,1c2a <strncpy+0x208>
    1ade:	00050123          	sb	zero,2(a0)
    1ae2:	8b11                	and	a4,a4,4
    1ae4:	12070463          	beqz	a4,1c0c <strncpy+0x1ea>
    1ae8:	000501a3          	sb	zero,3(a0)
    1aec:	4711                	li	a4,4
    1aee:	00450693          	add	a3,a0,4
    1af2:	02f77563          	bgeu	a4,a5,1b1c <strncpy+0xfa>
    1af6:	00050223          	sb	zero,4(a0)
    1afa:	4715                	li	a4,5
    1afc:	00550693          	add	a3,a0,5
    1b00:	00e78e63          	beq	a5,a4,1b1c <strncpy+0xfa>
    1b04:	fff50713          	add	a4,a0,-1
    1b08:	000502a3          	sb	zero,5(a0)
    1b0c:	8b1d                	and	a4,a4,7
    1b0e:	12071263          	bnez	a4,1c32 <strncpy+0x210>
    1b12:	00750693          	add	a3,a0,7
    1b16:	00050323          	sb	zero,6(a0)
    1b1a:	471d                	li	a4,7
    1b1c:	40f80833          	sub	a6,a6,a5
    1b20:	ff887593          	and	a1,a6,-8
    1b24:	97aa                	add	a5,a5,a0
    1b26:	95be                	add	a1,a1,a5
    1b28:	0007b023          	sd	zero,0(a5)
    1b2c:	07a1                	add	a5,a5,8
    1b2e:	feb79de3          	bne	a5,a1,1b28 <strncpy+0x106>
    1b32:	ff887593          	and	a1,a6,-8
    1b36:	00787813          	and	a6,a6,7
    1b3a:	00e587bb          	addw	a5,a1,a4
    1b3e:	00b68733          	add	a4,a3,a1
    1b42:	0e080063          	beqz	a6,1c22 <strncpy+0x200>
    1b46:	00070023          	sb	zero,0(a4)
    1b4a:	0017869b          	addw	a3,a5,1
    1b4e:	f4c6f9e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b52:	000700a3          	sb	zero,1(a4)
    1b56:	0027869b          	addw	a3,a5,2
    1b5a:	f4c6f3e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b5e:	00070123          	sb	zero,2(a4)
    1b62:	0037869b          	addw	a3,a5,3
    1b66:	f2c6fde3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b6a:	000701a3          	sb	zero,3(a4)
    1b6e:	0047869b          	addw	a3,a5,4
    1b72:	f2c6f7e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b76:	00070223          	sb	zero,4(a4)
    1b7a:	0057869b          	addw	a3,a5,5
    1b7e:	f2c6f1e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b82:	000702a3          	sb	zero,5(a4)
    1b86:	0067869b          	addw	a3,a5,6
    1b8a:	f0c6fbe3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b8e:	00070323          	sb	zero,6(a4)
    1b92:	0077869b          	addw	a3,a5,7
    1b96:	f0c6f5e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1b9a:	000703a3          	sb	zero,7(a4)
    1b9e:	0087869b          	addw	a3,a5,8
    1ba2:	eec6ffe3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1ba6:	00070423          	sb	zero,8(a4)
    1baa:	0097869b          	addw	a3,a5,9
    1bae:	eec6f9e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1bb2:	000704a3          	sb	zero,9(a4)
    1bb6:	00a7869b          	addw	a3,a5,10
    1bba:	eec6f3e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1bbe:	00070523          	sb	zero,10(a4)
    1bc2:	00b7869b          	addw	a3,a5,11
    1bc6:	ecc6fde3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1bca:	000705a3          	sb	zero,11(a4)
    1bce:	00c7869b          	addw	a3,a5,12
    1bd2:	ecc6f7e3          	bgeu	a3,a2,1aa0 <strncpy+0x7e>
    1bd6:	00070623          	sb	zero,12(a4)
    1bda:	27b5                	addw	a5,a5,13
    1bdc:	ecc7f2e3          	bgeu	a5,a2,1aa0 <strncpy+0x7e>
    1be0:	000706a3          	sb	zero,13(a4)
}
    1be4:	8082                	ret
    1be6:	46ad                	li	a3,11
    1be8:	bde1                	j	1ac0 <strncpy+0x9e>
    1bea:	00778693          	add	a3,a5,7
    1bee:	48ad                	li	a7,11
    1bf0:	fff60593          	add	a1,a2,-1
    1bf4:	ed16f6e3          	bgeu	a3,a7,1ac0 <strncpy+0x9e>
    1bf8:	b7fd                	j	1be6 <strncpy+0x1c4>
    1bfa:	40a00733          	neg	a4,a0
    1bfe:	8832                	mv	a6,a2
    1c00:	00777793          	and	a5,a4,7
    1c04:	4581                	li	a1,0
    1c06:	ea0608e3          	beqz	a2,1ab6 <strncpy+0x94>
    1c0a:	b7c5                	j	1bea <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0c:	00350693          	add	a3,a0,3
    1c10:	470d                	li	a4,3
    1c12:	b729                	j	1b1c <strncpy+0xfa>
    1c14:	00150693          	add	a3,a0,1
    1c18:	4705                	li	a4,1
    1c1a:	b709                	j	1b1c <strncpy+0xfa>
tail:
    1c1c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1e:	4701                	li	a4,0
    1c20:	bdf5                	j	1b1c <strncpy+0xfa>
    1c22:	8082                	ret
tail:
    1c24:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c26:	4781                	li	a5,0
    1c28:	bf39                	j	1b46 <strncpy+0x124>
    1c2a:	00250693          	add	a3,a0,2
    1c2e:	4709                	li	a4,2
    1c30:	b5f5                	j	1b1c <strncpy+0xfa>
    1c32:	00650693          	add	a3,a0,6
    1c36:	4719                	li	a4,6
    1c38:	b5d5                	j	1b1c <strncpy+0xfa>
    1c3a:	8082                	ret

0000000000001c3c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c3c:	87aa                	mv	a5,a0
    1c3e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c40:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c44:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c48:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c4a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <openat>:
    register long a7 __asm__("a7") = n;
    1c54:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c58:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c60:	2501                	sext.w	a0,a0
    1c62:	8082                	ret

0000000000001c64 <close>:
    register long a7 __asm__("a7") = n;
    1c64:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c68:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <read>:
    register long a7 __asm__("a7") = n;
    1c70:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c74:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c78:	8082                	ret

0000000000001c7a <write>:
    register long a7 __asm__("a7") = n;
    1c7a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c82:	8082                	ret

0000000000001c84 <getpid>:
    register long a7 __asm__("a7") = n;
    1c84:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c88:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c8c:	2501                	sext.w	a0,a0
    1c8e:	8082                	ret

0000000000001c90 <getppid>:
    register long a7 __asm__("a7") = n;
    1c90:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c94:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c9c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <fork>:
    register long a7 __asm__("a7") = n;
    1ca8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cac:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb8:	85b2                	mv	a1,a2
    1cba:	863a                	mv	a2,a4
    if (stack)
    1cbc:	c191                	beqz	a1,1cc0 <clone+0x8>
	stack += stack_size;
    1cbe:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc0:	4781                	li	a5,0
    1cc2:	4701                	li	a4,0
    1cc4:	4681                	li	a3,0
    1cc6:	2601                	sext.w	a2,a2
    1cc8:	ac01                	j	1ed8 <__clone>

0000000000001cca <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cca:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cce:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cd2:	8082                	ret

0000000000001cd4 <exit>:
    register long a7 __asm__("a7") = n;
    1cd4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd8:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cdc:	8082                	ret

0000000000001cde <waitpid>:
    register long a7 __asm__("a7") = n;
    1cde:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <exec>:
    register long a7 __asm__("a7") = n;
    1cec:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <execve>:
    register long a7 __asm__("a7") = n;
    1cf8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <times>:
    register long a7 __asm__("a7") = n;
    1d04:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d08:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <get_time>:

int64 get_time()
{
    1d10:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d12:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d16:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d1e:	2501                	sext.w	a0,a0
    1d20:	ed09                	bnez	a0,1d3a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d22:	67a2                	ld	a5,8(sp)
    1d24:	3e800713          	li	a4,1000
    1d28:	00015503          	lhu	a0,0(sp)
    1d2c:	02e7d7b3          	divu	a5,a5,a4
    1d30:	02e50533          	mul	a0,a0,a4
    1d34:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d36:	0141                	add	sp,sp,16
    1d38:	8082                	ret
        return -1;
    1d3a:	557d                	li	a0,-1
    1d3c:	bfed                	j	1d36 <get_time+0x26>

0000000000001d3e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d3e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d42:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <time>:
    register long a7 __asm__("a7") = n;
    1d4a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d4e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <sleep>:

int sleep(unsigned long long time)
{
    1d56:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d58:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d5a:	850a                	mv	a0,sp
    1d5c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d5e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d62:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d64:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d68:	e501                	bnez	a0,1d70 <sleep+0x1a>
    return 0;
    1d6a:	4501                	li	a0,0
}
    1d6c:	0141                	add	sp,sp,16
    1d6e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d70:	4502                	lw	a0,0(sp)
}
    1d72:	0141                	add	sp,sp,16
    1d74:	8082                	ret

0000000000001d76 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d76:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d82:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d86:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d8a:	8082                	ret

0000000000001d8c <mprotect>:
    register long a7 __asm__("a7") = n;
    1d8c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d90:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <munmap>:
    register long a7 __asm__("a7") = n;
    1d98:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <wait>:

int wait(int *code)
{
    1da4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1daa:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dac:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dae:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <spawn>:
    register long a7 __asm__("a7") = n;
    1db8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <fstat>:
    register long a7 __asm__("a7") = n;
    1ddc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1de8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dea:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dee:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df0:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1df8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dfa:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dfe:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e00:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e08:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e0e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e10:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <link>:

int link(char *old_path, char *new_path)
{
    1e18:	87aa                	mv	a5,a0
    1e1a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e1c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e20:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e24:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e26:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e2a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <unlink>:

int unlink(char *path)
{
    1e34:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e36:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e3a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e3e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <uname>:
    register long a7 __asm__("a7") = n;
    1e48:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e4c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <brk>:
    register long a7 __asm__("a7") = n;
    1e54:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e60:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e62:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e66:	8082                	ret

0000000000001e68 <chdir>:
    register long a7 __asm__("a7") = n;
    1e68:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e6c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e74:	862e                	mv	a2,a1
    1e76:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e78:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e7e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e82:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e84:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e86:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <getdents>:
    register long a7 __asm__("a7") = n;
    1e8e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <pipe>:
    register long a7 __asm__("a7") = n;
    1e9a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <dup>:
    register long a7 __asm__("a7") = n;
    1ea8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eaa:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <mount>:
    register long a7 __asm__("a7") = n;
    1ebe:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <umount>:
    register long a7 __asm__("a7") = n;
    1eca:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ece:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ed8:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eda:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1edc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ede:	8532                	mv	a0,a2
	mv a2, a4
    1ee0:	863a                	mv	a2,a4
	mv a3, a5
    1ee2:	86be                	mv	a3,a5
	mv a4, a6
    1ee4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee6:	0dc00893          	li	a7,220
	ecall
    1eea:	00000073          	ecall

	beqz a0, 1f
    1eee:	c111                	beqz	a0,1ef2 <__clone+0x1a>
	# Parent
	ret
    1ef0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef4:	6522                	ld	a0,8(sp)
	jalr a1
    1ef6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ef8:	05d00893          	li	a7,93
	ecall
    1efc:	00000073          	ecall
