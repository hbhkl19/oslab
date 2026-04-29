
/home/hbh/oslab/oslab/user/build/riscv64/waitpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a219                	j	1108 <__start_main>

0000000000001004 <test_waitpid>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

int i = 1000;
void test_waitpid(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f3a50513          	add	a0,a0,-198 # 1f40 <__clone+0x2a>
void test_waitpid(void){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1014:	34c000ef          	jal	1360 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	ff050513          	add	a0,a0,-16 # 2008 <__func__.0>
    1020:	340000ef          	jal	1360 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f3450513          	add	a0,a0,-204 # 1f58 <__clone+0x42>
    102c:	334000ef          	jal	1360 <puts>
    int cpid, wstatus;
    cpid = fork();
    1030:	4b7000ef          	jal	1ce6 <fork>
    assert(cpid != -1);
    1034:	547d                	li	s0,-1
    cpid = fork();
    1036:	84aa                	mv	s1,a0
    assert(cpid != -1);
    1038:	04850963          	beq	a0,s0,108a <test_waitpid+0x86>
    if(cpid == 0){
    103c:	e93d                	bnez	a0,10b2 <test_waitpid+0xae>
	while(i--);
    103e:	00001797          	auipc	a5,0x1
    1042:	fe87a723          	sw	s0,-18(a5) # 202c <i>
	sched_yield();
    1046:	495000ef          	jal	1cda <sched_yield>
	printf("This is child process\n");
    104a:	00001517          	auipc	a0,0x1
    104e:	f3e50513          	add	a0,a0,-194 # 1f88 <__clone+0x72>
    1052:	330000ef          	jal	1382 <printf>
        exit(3);
    1056:	450d                	li	a0,3
    1058:	4bb000ef          	jal	1d12 <exit>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
	else
	    printf("waitpid error.\n");

    }
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	f7c50513          	add	a0,a0,-132 # 1fd8 <__clone+0xc2>
    1064:	2fc000ef          	jal	1360 <puts>
    1068:	00001517          	auipc	a0,0x1
    106c:	fa050513          	add	a0,a0,-96 # 2008 <__func__.0>
    1070:	2f0000ef          	jal	1360 <puts>
    1074:	00001517          	auipc	a0,0x1
    1078:	ee450513          	add	a0,a0,-284 # 1f58 <__clone+0x42>
    107c:	2e4000ef          	jal	1360 <puts>
}
    1080:	70a2                	ld	ra,40(sp)
    1082:	7402                	ld	s0,32(sp)
    1084:	64e2                	ld	s1,24(sp)
    1086:	6145                	add	sp,sp,48
    1088:	8082                	ret
    assert(cpid != -1);
    108a:	00001517          	auipc	a0,0x1
    108e:	ede50513          	add	a0,a0,-290 # 1f68 <__clone+0x52>
    1092:	56a000ef          	jal	15fc <panic>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    1096:	4601                	li	a2,0
    1098:	006c                	add	a1,sp,12
    109a:	557d                	li	a0,-1
    109c:	481000ef          	jal	1d1c <waitpid>
	assert(ret != -1);
    10a0:	02950e63          	beq	a0,s1,10dc <test_waitpid+0xd8>
	    printf("waitpid error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f2450513          	add	a0,a0,-220 # 1fc8 <__clone+0xb2>
    10ac:	2d6000ef          	jal	1382 <printf>
    10b0:	b775                	j	105c <test_waitpid+0x58>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    10b2:	4601                	li	a2,0
    10b4:	006c                	add	a1,sp,12
    10b6:	467000ef          	jal	1d1c <waitpid>
	assert(ret != -1);
    10ba:	02850863          	beq	a0,s0,10ea <test_waitpid+0xe6>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10be:	fea493e3          	bne	s1,a0,10a4 <test_waitpid+0xa0>
    10c2:	00d14703          	lbu	a4,13(sp)
    10c6:	478d                	li	a5,3
    10c8:	fcf71ee3          	bne	a4,a5,10a4 <test_waitpid+0xa0>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
    10cc:	458d                	li	a1,3
    10ce:	00001517          	auipc	a0,0x1
    10d2:	ed250513          	add	a0,a0,-302 # 1fa0 <__clone+0x8a>
    10d6:	2ac000ef          	jal	1382 <printf>
    10da:	b749                	j	105c <test_waitpid+0x58>
	assert(ret != -1);
    10dc:	00001517          	auipc	a0,0x1
    10e0:	e8c50513          	add	a0,a0,-372 # 1f68 <__clone+0x52>
    10e4:	518000ef          	jal	15fc <panic>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10e8:	bfe9                	j	10c2 <test_waitpid+0xbe>
	assert(ret != -1);
    10ea:	00001517          	auipc	a0,0x1
    10ee:	e7e50513          	add	a0,a0,-386 # 1f68 <__clone+0x52>
    10f2:	50a000ef          	jal	15fc <panic>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10f6:	b77d                	j	10a4 <test_waitpid+0xa0>

00000000000010f8 <main>:

int main(void){
    10f8:	1141                	add	sp,sp,-16
    10fa:	e406                	sd	ra,8(sp)
    test_waitpid();
    10fc:	f09ff0ef          	jal	1004 <test_waitpid>
    return 0;
}
    1100:	60a2                	ld	ra,8(sp)
    1102:	4501                	li	a0,0
    1104:	0141                	add	sp,sp,16
    1106:	8082                	ret

0000000000001108 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1108:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    110a:	4108                	lw	a0,0(a0)
{
    110c:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    110e:	05a1                	add	a1,a1,8
{
    1110:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1112:	fe7ff0ef          	jal	10f8 <main>
    1116:	3fd000ef          	jal	1d12 <exit>
	return 0;
}
    111a:	60a2                	ld	ra,8(sp)
    111c:	4501                	li	a0,0
    111e:	0141                	add	sp,sp,16
    1120:	8082                	ret

0000000000001122 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1122:	7179                	add	sp,sp,-48
    1124:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1126:	12054863          	bltz	a0,1256 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    112a:	02b577bb          	remuw	a5,a0,a1
    112e:	00001697          	auipc	a3,0x1
    1132:	eea68693          	add	a3,a3,-278 # 2018 <digits>
    buf[16] = 0;
    1136:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    113a:	0005871b          	sext.w	a4,a1
    113e:	1782                	sll	a5,a5,0x20
    1140:	9381                	srl	a5,a5,0x20
    1142:	97b6                	add	a5,a5,a3
    1144:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1148:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    114c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1150:	1ab56663          	bltu	a0,a1,12fc <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1154:	02e8763b          	remuw	a2,a6,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1166:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    116a:	12e86c63          	bltu	a6,a4,12a2 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    116e:	02e5f63b          	remuw	a2,a1,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1180:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1184:	12e5e863          	bltu	a1,a4,12b4 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1188:	02e8763b          	remuw	a2,a6,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    119a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    119e:	12e86463          	bltu	a6,a4,12c6 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11a2:	02e5f63b          	remuw	a2,a1,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b4:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11b8:	12e5e063          	bltu	a1,a4,12d8 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11bc:	02e8763b          	remuw	a2,a6,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ce:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11d2:	0ae86f63          	bltu	a6,a4,1290 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11d6:	02e5f63b          	remuw	a2,a1,a4
    11da:	1602                	sll	a2,a2,0x20
    11dc:	9201                	srl	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ec:	0ee5ef63          	bltu	a1,a4,12ea <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11f0:	02e8763b          	remuw	a2,a6,a4
    11f4:	1602                	sll	a2,a2,0x20
    11f6:	9201                	srl	a2,a2,0x20
    11f8:	9636                	add	a2,a2,a3
    11fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fe:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1202:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1206:	0ee86d63          	bltu	a6,a4,1300 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    120a:	02e5f63b          	remuw	a2,a1,a4
    120e:	1602                	sll	a2,a2,0x20
    1210:	9201                	srl	a2,a2,0x20
    1212:	9636                	add	a2,a2,a3
    1214:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1218:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    121c:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1220:	0ee5e963          	bltu	a1,a4,1312 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1224:	1782                	sll	a5,a5,0x20
    1226:	9381                	srl	a5,a5,0x20
    1228:	96be                	add	a3,a3,a5
    122a:	0006c783          	lbu	a5,0(a3)
    122e:	4599                	li	a1,6
    1230:	00f10723          	sb	a5,14(sp)

    if (sign)
    1234:	00055763          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1238:	02d00793          	li	a5,45
    123c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1240:	4595                	li	a1,5
    write(f, s, l);
    1242:	003c                	add	a5,sp,8
    1244:	4641                	li	a2,16
    1246:	9e0d                	subw	a2,a2,a1
    1248:	4505                	li	a0,1
    124a:	95be                	add	a1,a1,a5
    124c:	26d000ef          	jal	1cb8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1250:	70a2                	ld	ra,40(sp)
    1252:	6145                	add	sp,sp,48
    1254:	8082                	ret
        x = -xx;
    1256:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    125a:	02b677bb          	remuw	a5,a2,a1
    125e:	00001697          	auipc	a3,0x1
    1262:	dba68693          	add	a3,a3,-582 # 2018 <digits>
    buf[16] = 0;
    1266:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    126a:	0005871b          	sext.w	a4,a1
    126e:	1782                	sll	a5,a5,0x20
    1270:	9381                	srl	a5,a5,0x20
    1272:	97b6                	add	a5,a5,a3
    1274:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1278:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    127c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1280:	ecb67ae3          	bgeu	a2,a1,1154 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128c:	45b9                	li	a1,14
    128e:	bf55                	j	1242 <printint.constprop.0+0x120>
    1290:	45a9                	li	a1,10
    if (sign)
    1292:	fa0558e3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    129e:	45a5                	li	a1,9
    12a0:	b74d                	j	1242 <printint.constprop.0+0x120>
    12a2:	45b9                	li	a1,14
    if (sign)
    12a4:	f8055fe3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12b0:	45b5                	li	a1,13
    12b2:	bf41                	j	1242 <printint.constprop.0+0x120>
    12b4:	45b5                	li	a1,13
    if (sign)
    12b6:	f80556e3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12c2:	45b1                	li	a1,12
    12c4:	bfbd                	j	1242 <printint.constprop.0+0x120>
    12c6:	45b1                	li	a1,12
    if (sign)
    12c8:	f6055de3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12d4:	45ad                	li	a1,11
    12d6:	b7b5                	j	1242 <printint.constprop.0+0x120>
    12d8:	45ad                	li	a1,11
    if (sign)
    12da:	f60554e3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12e6:	45a9                	li	a1,10
    12e8:	bfa9                	j	1242 <printint.constprop.0+0x120>
    12ea:	45a5                	li	a1,9
    if (sign)
    12ec:	f4055be3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12f8:	45a1                	li	a1,8
    12fa:	b7a1                	j	1242 <printint.constprop.0+0x120>
    i = 15;
    12fc:	45bd                	li	a1,15
    12fe:	b791                	j	1242 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1300:	45a1                	li	a1,8
    if (sign)
    1302:	f40550e3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    130e:	459d                	li	a1,7
    1310:	bf0d                	j	1242 <printint.constprop.0+0x120>
    1312:	459d                	li	a1,7
    if (sign)
    1314:	f20557e3          	bgez	a0,1242 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1320:	4599                	li	a1,6
    1322:	b705                	j	1242 <printint.constprop.0+0x120>

0000000000001324 <getchar>:
{
    1324:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1326:	00f10593          	add	a1,sp,15
    132a:	4605                	li	a2,1
    132c:	4501                	li	a0,0
{
    132e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1330:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1334:	17b000ef          	jal	1cae <read>
}
    1338:	60e2                	ld	ra,24(sp)
    133a:	00f14503          	lbu	a0,15(sp)
    133e:	6105                	add	sp,sp,32
    1340:	8082                	ret

0000000000001342 <putchar>:
{
    1342:	1101                	add	sp,sp,-32
    1344:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1346:	00f10593          	add	a1,sp,15
    134a:	4605                	li	a2,1
    134c:	4505                	li	a0,1
{
    134e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1350:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1354:	165000ef          	jal	1cb8 <write>
}
    1358:	60e2                	ld	ra,24(sp)
    135a:	2501                	sext.w	a0,a0
    135c:	6105                	add	sp,sp,32
    135e:	8082                	ret

0000000000001360 <puts>:
{
    1360:	1141                	add	sp,sp,-16
    1362:	e406                	sd	ra,8(sp)
    1364:	e022                	sd	s0,0(sp)
    1366:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1368:	574000ef          	jal	18dc <strlen>
    136c:	862a                	mv	a2,a0
    136e:	85a2                	mv	a1,s0
    1370:	4505                	li	a0,1
    1372:	147000ef          	jal	1cb8 <write>
}
    1376:	60a2                	ld	ra,8(sp)
    1378:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    137a:	957d                	sra	a0,a0,0x3f
    return r;
    137c:	2501                	sext.w	a0,a0
}
    137e:	0141                	add	sp,sp,16
    1380:	8082                	ret

0000000000001382 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1382:	7171                	add	sp,sp,-176
    1384:	f85a                	sd	s6,48(sp)
    1386:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1388:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    138a:	18bc                	add	a5,sp,120
{
    138c:	e8ca                	sd	s2,80(sp)
    138e:	e4ce                	sd	s3,72(sp)
    1390:	e0d2                	sd	s4,64(sp)
    1392:	fc56                	sd	s5,56(sp)
    1394:	f486                	sd	ra,104(sp)
    1396:	f0a2                	sd	s0,96(sp)
    1398:	eca6                	sd	s1,88(sp)
    139a:	fcae                	sd	a1,120(sp)
    139c:	e132                	sd	a2,128(sp)
    139e:	e536                	sd	a3,136(sp)
    13a0:	e93a                	sd	a4,144(sp)
    13a2:	f142                	sd	a6,160(sp)
    13a4:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13a6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13a8:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13ac:	07300a13          	li	s4,115
    13b0:	07800a93          	li	s5,120
    buf[i++] = '0';
    13b4:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b8:	00001997          	auipc	s3,0x1
    13bc:	c6098993          	add	s3,s3,-928 # 2018 <digits>
        if (!*s)
    13c0:	00054783          	lbu	a5,0(a0)
    13c4:	16078a63          	beqz	a5,1538 <printf+0x1b6>
    13c8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13ca:	19278d63          	beq	a5,s2,1564 <printf+0x1e2>
    13ce:	00164783          	lbu	a5,1(a2)
    13d2:	0605                	add	a2,a2,1
    13d4:	fbfd                	bnez	a5,13ca <printf+0x48>
    13d6:	84b2                	mv	s1,a2
        l = z - a;
    13d8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13dc:	85aa                	mv	a1,a0
    13de:	8622                	mv	a2,s0
    13e0:	4505                	li	a0,1
    13e2:	0d7000ef          	jal	1cb8 <write>
        if (l)
    13e6:	1a041463          	bnez	s0,158e <printf+0x20c>
        if (s[1] == 0)
    13ea:	0014c783          	lbu	a5,1(s1)
    13ee:	14078563          	beqz	a5,1538 <printf+0x1b6>
        switch (s[1])
    13f2:	1b478063          	beq	a5,s4,1592 <printf+0x210>
    13f6:	14fa6b63          	bltu	s4,a5,154c <printf+0x1ca>
    13fa:	06400713          	li	a4,100
    13fe:	1ee78063          	beq	a5,a4,15de <printf+0x25c>
    1402:	07000713          	li	a4,112
    1406:	1ae79963          	bne	a5,a4,15b8 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    140a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    140c:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1410:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1412:	631c                	ld	a5,0(a4)
    1414:	0721                	add	a4,a4,8
    1416:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1418:	00479293          	sll	t0,a5,0x4
    141c:	00879f93          	sll	t6,a5,0x8
    1420:	00c79f13          	sll	t5,a5,0xc
    1424:	01079e93          	sll	t4,a5,0x10
    1428:	01479e13          	sll	t3,a5,0x14
    142c:	01879313          	sll	t1,a5,0x18
    1430:	01c79893          	sll	a7,a5,0x1c
    1434:	02479813          	sll	a6,a5,0x24
    1438:	02879513          	sll	a0,a5,0x28
    143c:	02c79593          	sll	a1,a5,0x2c
    1440:	03079693          	sll	a3,a5,0x30
    1444:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1448:	03c7d413          	srl	s0,a5,0x3c
    144c:	01c7d39b          	srlw	t2,a5,0x1c
    1450:	03c2d293          	srl	t0,t0,0x3c
    1454:	03cfdf93          	srl	t6,t6,0x3c
    1458:	03cf5f13          	srl	t5,t5,0x3c
    145c:	03cede93          	srl	t4,t4,0x3c
    1460:	03ce5e13          	srl	t3,t3,0x3c
    1464:	03c35313          	srl	t1,t1,0x3c
    1468:	03c8d893          	srl	a7,a7,0x3c
    146c:	03c85813          	srl	a6,a6,0x3c
    1470:	9171                	srl	a0,a0,0x3c
    1472:	91f1                	srl	a1,a1,0x3c
    1474:	92f1                	srl	a3,a3,0x3c
    1476:	9371                	srl	a4,a4,0x3c
    1478:	96ce                	add	a3,a3,s3
    147a:	974e                	add	a4,a4,s3
    147c:	944e                	add	s0,s0,s3
    147e:	92ce                	add	t0,t0,s3
    1480:	9fce                	add	t6,t6,s3
    1482:	9f4e                	add	t5,t5,s3
    1484:	9ece                	add	t4,t4,s3
    1486:	9e4e                	add	t3,t3,s3
    1488:	934e                	add	t1,t1,s3
    148a:	98ce                	add	a7,a7,s3
    148c:	93ce                	add	t2,t2,s3
    148e:	984e                	add	a6,a6,s3
    1490:	954e                	add	a0,a0,s3
    1492:	95ce                	add	a1,a1,s3
    1494:	0006c083          	lbu	ra,0(a3)
    1498:	0002c283          	lbu	t0,0(t0)
    149c:	00074683          	lbu	a3,0(a4)
    14a0:	000fcf83          	lbu	t6,0(t6)
    14a4:	000f4f03          	lbu	t5,0(t5)
    14a8:	000ece83          	lbu	t4,0(t4)
    14ac:	000e4e03          	lbu	t3,0(t3)
    14b0:	00034303          	lbu	t1,0(t1)
    14b4:	0008c883          	lbu	a7,0(a7)
    14b8:	0003c383          	lbu	t2,0(t2)
    14bc:	00084803          	lbu	a6,0(a6)
    14c0:	00054503          	lbu	a0,0(a0)
    14c4:	0005c583          	lbu	a1,0(a1)
    14c8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14cc:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d0:	9371                	srl	a4,a4,0x3c
    14d2:	8bbd                	and	a5,a5,15
    14d4:	974e                	add	a4,a4,s3
    14d6:	97ce                	add	a5,a5,s3
    14d8:	005105a3          	sb	t0,11(sp)
    14dc:	01f10623          	sb	t6,12(sp)
    14e0:	01e106a3          	sb	t5,13(sp)
    14e4:	01d10723          	sb	t4,14(sp)
    14e8:	01c107a3          	sb	t3,15(sp)
    14ec:	00610823          	sb	t1,16(sp)
    14f0:	011108a3          	sb	a7,17(sp)
    14f4:	00710923          	sb	t2,18(sp)
    14f8:	010109a3          	sb	a6,19(sp)
    14fc:	00a10a23          	sb	a0,20(sp)
    1500:	00b10aa3          	sb	a1,21(sp)
    1504:	00110b23          	sb	ra,22(sp)
    1508:	00d10ba3          	sb	a3,23(sp)
    150c:	00810523          	sb	s0,10(sp)
    1510:	00074703          	lbu	a4,0(a4)
    1514:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1518:	002c                	add	a1,sp,8
    151a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    151c:	00e10c23          	sb	a4,24(sp)
    1520:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1524:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1528:	790000ef          	jal	1cb8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    152c:	00248513          	add	a0,s1,2
        if (!*s)
    1530:	00054783          	lbu	a5,0(a0)
    1534:	e8079ae3          	bnez	a5,13c8 <printf+0x46>
    }
    va_end(ap);
}
    1538:	70a6                	ld	ra,104(sp)
    153a:	7406                	ld	s0,96(sp)
    153c:	64e6                	ld	s1,88(sp)
    153e:	6946                	ld	s2,80(sp)
    1540:	69a6                	ld	s3,72(sp)
    1542:	6a06                	ld	s4,64(sp)
    1544:	7ae2                	ld	s5,56(sp)
    1546:	7b42                	ld	s6,48(sp)
    1548:	614d                	add	sp,sp,176
    154a:	8082                	ret
        switch (s[1])
    154c:	07579663          	bne	a5,s5,15b8 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1550:	6782                	ld	a5,0(sp)
    1552:	45c1                	li	a1,16
    1554:	4388                	lw	a0,0(a5)
    1556:	07a1                	add	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	bc9ff0ef          	jal	1122 <printint.constprop.0>
        s += 2;
    155e:	00248513          	add	a0,s1,2
    1562:	b7f9                	j	1530 <printf+0x1ae>
    1564:	84b2                	mv	s1,a2
    1566:	a039                	j	1574 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1568:	0024c783          	lbu	a5,2(s1)
    156c:	0605                	add	a2,a2,1
    156e:	0489                	add	s1,s1,2
    1570:	e72794e3          	bne	a5,s2,13d8 <printf+0x56>
    1574:	0014c783          	lbu	a5,1(s1)
    1578:	ff2788e3          	beq	a5,s2,1568 <printf+0x1e6>
        l = z - a;
    157c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1580:	85aa                	mv	a1,a0
    1582:	8622                	mv	a2,s0
    1584:	4505                	li	a0,1
    1586:	732000ef          	jal	1cb8 <write>
        if (l)
    158a:	e60400e3          	beqz	s0,13ea <printf+0x68>
    158e:	8526                	mv	a0,s1
    1590:	bd05                	j	13c0 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1592:	6782                	ld	a5,0(sp)
    1594:	6380                	ld	s0,0(a5)
    1596:	07a1                	add	a5,a5,8
    1598:	e03e                	sd	a5,0(sp)
    159a:	cc21                	beqz	s0,15f2 <printf+0x270>
            l = strnlen(a, 200);
    159c:	0c800593          	li	a1,200
    15a0:	8522                	mv	a0,s0
    15a2:	424000ef          	jal	19c6 <strnlen>
    write(f, s, l);
    15a6:	0005061b          	sext.w	a2,a0
    15aa:	85a2                	mv	a1,s0
    15ac:	4505                	li	a0,1
    15ae:	70a000ef          	jal	1cb8 <write>
        s += 2;
    15b2:	00248513          	add	a0,s1,2
    15b6:	bfad                	j	1530 <printf+0x1ae>
    return write(stdout, &byte, 1);
    15b8:	4605                	li	a2,1
    15ba:	002c                	add	a1,sp,8
    15bc:	4505                	li	a0,1
    char byte = c;
    15be:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c2:	6f6000ef          	jal	1cb8 <write>
    char byte = c;
    15c6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ca:	4605                	li	a2,1
    15cc:	002c                	add	a1,sp,8
    15ce:	4505                	li	a0,1
    char byte = c;
    15d0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d4:	6e4000ef          	jal	1cb8 <write>
        s += 2;
    15d8:	00248513          	add	a0,s1,2
    15dc:	bf91                	j	1530 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15de:	6782                	ld	a5,0(sp)
    15e0:	45a9                	li	a1,10
    15e2:	4388                	lw	a0,0(a5)
    15e4:	07a1                	add	a5,a5,8
    15e6:	e03e                	sd	a5,0(sp)
    15e8:	b3bff0ef          	jal	1122 <printint.constprop.0>
        s += 2;
    15ec:	00248513          	add	a0,s1,2
    15f0:	b781                	j	1530 <printf+0x1ae>
                a = "(null)";
    15f2:	00001417          	auipc	s0,0x1
    15f6:	9f640413          	add	s0,s0,-1546 # 1fe8 <__clone+0xd2>
    15fa:	b74d                	j	159c <printf+0x21a>

00000000000015fc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15fc:	1141                	add	sp,sp,-16
    15fe:	e406                	sd	ra,8(sp)
    puts(m);
    1600:	d61ff0ef          	jal	1360 <puts>
    exit(-100);
}
    1604:	60a2                	ld	ra,8(sp)
    exit(-100);
    1606:	f9c00513          	li	a0,-100
}
    160a:	0141                	add	sp,sp,16
    exit(-100);
    160c:	a719                	j	1d12 <exit>

000000000000160e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	02000793          	li	a5,32
    1612:	00f50663          	beq	a0,a5,161e <isspace+0x10>
    1616:	355d                	addw	a0,a0,-9
    1618:	00553513          	sltiu	a0,a0,5
    161c:	8082                	ret
    161e:	4505                	li	a0,1
}
    1620:	8082                	ret

0000000000001622 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1622:	fd05051b          	addw	a0,a0,-48
}
    1626:	00a53513          	sltiu	a0,a0,10
    162a:	8082                	ret

000000000000162c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    162c:	02000693          	li	a3,32
    1630:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1632:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	ff77871b          	addw	a4,a5,-9
    163a:	04d78c63          	beq	a5,a3,1692 <atoi+0x66>
    163e:	0007861b          	sext.w	a2,a5
    1642:	04e5f863          	bgeu	a1,a4,1692 <atoi+0x66>
        s++;
    switch (*s)
    1646:	02b00713          	li	a4,43
    164a:	04e78963          	beq	a5,a4,169c <atoi+0x70>
    164e:	02d00713          	li	a4,45
    1652:	06e78263          	beq	a5,a4,16b6 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1656:	fd06069b          	addw	a3,a2,-48
    165a:	47a5                	li	a5,9
    165c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    165e:	4301                	li	t1,0
    while (isdigit(*s))
    1660:	04d7e963          	bltu	a5,a3,16b2 <atoi+0x86>
    int n = 0, neg = 0;
    1664:	4501                	li	a0,0
    while (isdigit(*s))
    1666:	48a5                	li	a7,9
    1668:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    166c:	0025179b          	sllw	a5,a0,0x2
    1670:	9fa9                	addw	a5,a5,a0
    1672:	fd06059b          	addw	a1,a2,-48
    1676:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    167a:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    167e:	0705                	add	a4,a4,1
    1680:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1684:	0006861b          	sext.w	a2,a3
    1688:	ff08f0e3          	bgeu	a7,a6,1668 <atoi+0x3c>
    return neg ? n : -n;
    168c:	00030563          	beqz	t1,1696 <atoi+0x6a>
}
    1690:	8082                	ret
        s++;
    1692:	0505                	add	a0,a0,1
    1694:	bf79                	j	1632 <atoi+0x6>
    return neg ? n : -n;
    1696:	40f5853b          	subw	a0,a1,a5
    169a:	8082                	ret
    while (isdigit(*s))
    169c:	00154603          	lbu	a2,1(a0)
    16a0:	47a5                	li	a5,9
        s++;
    16a2:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16a6:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16aa:	4301                	li	t1,0
    while (isdigit(*s))
    16ac:	2601                	sext.w	a2,a2
    16ae:	fad7fbe3          	bgeu	a5,a3,1664 <atoi+0x38>
    16b2:	4501                	li	a0,0
}
    16b4:	8082                	ret
    while (isdigit(*s))
    16b6:	00154603          	lbu	a2,1(a0)
    16ba:	47a5                	li	a5,9
        s++;
    16bc:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16c0:	fd06069b          	addw	a3,a2,-48
    16c4:	2601                	sext.w	a2,a2
    16c6:	fed7e6e3          	bltu	a5,a3,16b2 <atoi+0x86>
        neg = 1;
    16ca:	4305                	li	t1,1
    16cc:	bf61                	j	1664 <atoi+0x38>

00000000000016ce <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16ce:	18060163          	beqz	a2,1850 <memset+0x182>
    16d2:	40a006b3          	neg	a3,a0
    16d6:	0076f793          	and	a5,a3,7
    16da:	00778813          	add	a6,a5,7
    16de:	48ad                	li	a7,11
    16e0:	0ff5f713          	zext.b	a4,a1
    16e4:	fff60593          	add	a1,a2,-1
    16e8:	17186563          	bltu	a6,a7,1852 <memset+0x184>
    16ec:	1705ed63          	bltu	a1,a6,1866 <memset+0x198>
    16f0:	16078363          	beqz	a5,1856 <memset+0x188>
    16f4:	00e50023          	sb	a4,0(a0)
    16f8:	0066f593          	and	a1,a3,6
    16fc:	16058063          	beqz	a1,185c <memset+0x18e>
    1700:	00e500a3          	sb	a4,1(a0)
    1704:	4589                	li	a1,2
    1706:	16f5f363          	bgeu	a1,a5,186c <memset+0x19e>
    170a:	00e50123          	sb	a4,2(a0)
    170e:	8a91                	and	a3,a3,4
    1710:	00350593          	add	a1,a0,3
    1714:	4e0d                	li	t3,3
    1716:	ce9d                	beqz	a3,1754 <memset+0x86>
    1718:	00e501a3          	sb	a4,3(a0)
    171c:	4691                	li	a3,4
    171e:	00450593          	add	a1,a0,4
    1722:	4e11                	li	t3,4
    1724:	02f6f863          	bgeu	a3,a5,1754 <memset+0x86>
    1728:	00e50223          	sb	a4,4(a0)
    172c:	4695                	li	a3,5
    172e:	00550593          	add	a1,a0,5
    1732:	4e15                	li	t3,5
    1734:	02d78063          	beq	a5,a3,1754 <memset+0x86>
    1738:	fff50693          	add	a3,a0,-1
    173c:	00e502a3          	sb	a4,5(a0)
    1740:	8a9d                	and	a3,a3,7
    1742:	00650593          	add	a1,a0,6
    1746:	4e19                	li	t3,6
    1748:	e691                	bnez	a3,1754 <memset+0x86>
    174a:	00750593          	add	a1,a0,7
    174e:	00e50323          	sb	a4,6(a0)
    1752:	4e1d                	li	t3,7
    1754:	00871693          	sll	a3,a4,0x8
    1758:	01071813          	sll	a6,a4,0x10
    175c:	8ed9                	or	a3,a3,a4
    175e:	01871893          	sll	a7,a4,0x18
    1762:	0106e6b3          	or	a3,a3,a6
    1766:	0116e6b3          	or	a3,a3,a7
    176a:	02071813          	sll	a6,a4,0x20
    176e:	02871313          	sll	t1,a4,0x28
    1772:	0106e6b3          	or	a3,a3,a6
    1776:	40f608b3          	sub	a7,a2,a5
    177a:	03071813          	sll	a6,a4,0x30
    177e:	0066e6b3          	or	a3,a3,t1
    1782:	0106e6b3          	or	a3,a3,a6
    1786:	03871313          	sll	t1,a4,0x38
    178a:	97aa                	add	a5,a5,a0
    178c:	ff88f813          	and	a6,a7,-8
    1790:	0066e6b3          	or	a3,a3,t1
    1794:	983e                	add	a6,a6,a5
    1796:	e394                	sd	a3,0(a5)
    1798:	07a1                	add	a5,a5,8
    179a:	ff079ee3          	bne	a5,a6,1796 <memset+0xc8>
    179e:	ff88f793          	and	a5,a7,-8
    17a2:	0078f893          	and	a7,a7,7
    17a6:	00f586b3          	add	a3,a1,a5
    17aa:	01c787bb          	addw	a5,a5,t3
    17ae:	0a088b63          	beqz	a7,1864 <memset+0x196>
    17b2:	00e68023          	sb	a4,0(a3)
    17b6:	0017859b          	addw	a1,a5,1
    17ba:	08c5fb63          	bgeu	a1,a2,1850 <memset+0x182>
    17be:	00e680a3          	sb	a4,1(a3)
    17c2:	0027859b          	addw	a1,a5,2
    17c6:	08c5f563          	bgeu	a1,a2,1850 <memset+0x182>
    17ca:	00e68123          	sb	a4,2(a3)
    17ce:	0037859b          	addw	a1,a5,3
    17d2:	06c5ff63          	bgeu	a1,a2,1850 <memset+0x182>
    17d6:	00e681a3          	sb	a4,3(a3)
    17da:	0047859b          	addw	a1,a5,4
    17de:	06c5f963          	bgeu	a1,a2,1850 <memset+0x182>
    17e2:	00e68223          	sb	a4,4(a3)
    17e6:	0057859b          	addw	a1,a5,5
    17ea:	06c5f363          	bgeu	a1,a2,1850 <memset+0x182>
    17ee:	00e682a3          	sb	a4,5(a3)
    17f2:	0067859b          	addw	a1,a5,6
    17f6:	04c5fd63          	bgeu	a1,a2,1850 <memset+0x182>
    17fa:	00e68323          	sb	a4,6(a3)
    17fe:	0077859b          	addw	a1,a5,7
    1802:	04c5f763          	bgeu	a1,a2,1850 <memset+0x182>
    1806:	00e683a3          	sb	a4,7(a3)
    180a:	0087859b          	addw	a1,a5,8
    180e:	04c5f163          	bgeu	a1,a2,1850 <memset+0x182>
    1812:	00e68423          	sb	a4,8(a3)
    1816:	0097859b          	addw	a1,a5,9
    181a:	02c5fb63          	bgeu	a1,a2,1850 <memset+0x182>
    181e:	00e684a3          	sb	a4,9(a3)
    1822:	00a7859b          	addw	a1,a5,10
    1826:	02c5f563          	bgeu	a1,a2,1850 <memset+0x182>
    182a:	00e68523          	sb	a4,10(a3)
    182e:	00b7859b          	addw	a1,a5,11
    1832:	00c5ff63          	bgeu	a1,a2,1850 <memset+0x182>
    1836:	00e685a3          	sb	a4,11(a3)
    183a:	00c7859b          	addw	a1,a5,12
    183e:	00c5f963          	bgeu	a1,a2,1850 <memset+0x182>
    1842:	00e68623          	sb	a4,12(a3)
    1846:	27b5                	addw	a5,a5,13
    1848:	00c7f463          	bgeu	a5,a2,1850 <memset+0x182>
    184c:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1850:	8082                	ret
    1852:	482d                	li	a6,11
    1854:	bd61                	j	16ec <memset+0x1e>
    char *p = dest;
    1856:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1858:	4e01                	li	t3,0
    185a:	bded                	j	1754 <memset+0x86>
    185c:	00150593          	add	a1,a0,1
    1860:	4e05                	li	t3,1
    1862:	bdcd                	j	1754 <memset+0x86>
    1864:	8082                	ret
    char *p = dest;
    1866:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1868:	4781                	li	a5,0
    186a:	b7a1                	j	17b2 <memset+0xe4>
    186c:	00250593          	add	a1,a0,2
    1870:	4e09                	li	t3,2
    1872:	b5cd                	j	1754 <memset+0x86>

0000000000001874 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1874:	00054783          	lbu	a5,0(a0)
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	00e79863          	bne	a5,a4,188c <strcmp+0x18>
    1880:	0505                	add	a0,a0,1
    1882:	0585                	add	a1,a1,1
    1884:	fbe5                	bnez	a5,1874 <strcmp>
    1886:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1888:	9d19                	subw	a0,a0,a4
    188a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    188c:	0007851b          	sext.w	a0,a5
    1890:	bfe5                	j	1888 <strcmp+0x14>

0000000000001892 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1892:	ca15                	beqz	a2,18c6 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1894:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1898:	167d                	add	a2,a2,-1
    189a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189e:	eb99                	bnez	a5,18b4 <strncmp+0x22>
    18a0:	a815                	j	18d4 <strncmp+0x42>
    18a2:	00a68e63          	beq	a3,a0,18be <strncmp+0x2c>
    18a6:	0505                	add	a0,a0,1
    18a8:	00f71b63          	bne	a4,a5,18be <strncmp+0x2c>
    18ac:	00054783          	lbu	a5,0(a0)
    18b0:	cf89                	beqz	a5,18ca <strncmp+0x38>
    18b2:	85b2                	mv	a1,a2
    18b4:	0005c703          	lbu	a4,0(a1)
    18b8:	00158613          	add	a2,a1,1
    18bc:	f37d                	bnez	a4,18a2 <strncmp+0x10>
        ;
    return *l - *r;
    18be:	0007851b          	sext.w	a0,a5
    18c2:	9d19                	subw	a0,a0,a4
    18c4:	8082                	ret
        return 0;
    18c6:	4501                	li	a0,0
}
    18c8:	8082                	ret
    return *l - *r;
    18ca:	0015c703          	lbu	a4,1(a1)
    18ce:	4501                	li	a0,0
    18d0:	9d19                	subw	a0,a0,a4
    18d2:	8082                	ret
    18d4:	0005c703          	lbu	a4,0(a1)
    18d8:	4501                	li	a0,0
    18da:	b7e5                	j	18c2 <strncmp+0x30>

00000000000018dc <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18dc:	00757793          	and	a5,a0,7
    18e0:	cf89                	beqz	a5,18fa <strlen+0x1e>
    18e2:	87aa                	mv	a5,a0
    18e4:	a029                	j	18ee <strlen+0x12>
    18e6:	0785                	add	a5,a5,1
    18e8:	0077f713          	and	a4,a5,7
    18ec:	cb01                	beqz	a4,18fc <strlen+0x20>
        if (!*s)
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	fb75                	bnez	a4,18e6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18f4:	40a78533          	sub	a0,a5,a0
}
    18f8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18fa:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18fc:	6394                	ld	a3,0(a5)
    18fe:	00000597          	auipc	a1,0x0
    1902:	6f25b583          	ld	a1,1778(a1) # 1ff0 <__clone+0xda>
    1906:	00000617          	auipc	a2,0x0
    190a:	6f263603          	ld	a2,1778(a2) # 1ff8 <__clone+0xe2>
    190e:	a019                	j	1914 <strlen+0x38>
    1910:	6794                	ld	a3,8(a5)
    1912:	07a1                	add	a5,a5,8
    1914:	00b68733          	add	a4,a3,a1
    1918:	fff6c693          	not	a3,a3
    191c:	8f75                	and	a4,a4,a3
    191e:	8f71                	and	a4,a4,a2
    1920:	db65                	beqz	a4,1910 <strlen+0x34>
    for (; *s; s++)
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	d779                	beqz	a4,18f4 <strlen+0x18>
    1928:	0017c703          	lbu	a4,1(a5)
    192c:	0785                	add	a5,a5,1
    192e:	d379                	beqz	a4,18f4 <strlen+0x18>
    1930:	0017c703          	lbu	a4,1(a5)
    1934:	0785                	add	a5,a5,1
    1936:	fb6d                	bnez	a4,1928 <strlen+0x4c>
    1938:	bf75                	j	18f4 <strlen+0x18>

000000000000193a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    193a:	00757713          	and	a4,a0,7
{
    193e:	87aa                	mv	a5,a0
    1940:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1944:	cb19                	beqz	a4,195a <memchr+0x20>
    1946:	ce25                	beqz	a2,19be <memchr+0x84>
    1948:	0007c703          	lbu	a4,0(a5)
    194c:	00b70763          	beq	a4,a1,195a <memchr+0x20>
    1950:	0785                	add	a5,a5,1
    1952:	0077f713          	and	a4,a5,7
    1956:	167d                	add	a2,a2,-1
    1958:	f77d                	bnez	a4,1946 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    195a:	4501                	li	a0,0
    if (n && *s != c)
    195c:	c235                	beqz	a2,19c0 <memchr+0x86>
    195e:	0007c703          	lbu	a4,0(a5)
    1962:	06b70063          	beq	a4,a1,19c2 <memchr+0x88>
        size_t k = ONES * c;
    1966:	00000517          	auipc	a0,0x0
    196a:	69a53503          	ld	a0,1690(a0) # 2000 <__clone+0xea>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    196e:	471d                	li	a4,7
        size_t k = ONES * c;
    1970:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1974:	04c77763          	bgeu	a4,a2,19c2 <memchr+0x88>
    1978:	00000897          	auipc	a7,0x0
    197c:	6788b883          	ld	a7,1656(a7) # 1ff0 <__clone+0xda>
    1980:	00000817          	auipc	a6,0x0
    1984:	67883803          	ld	a6,1656(a6) # 1ff8 <__clone+0xe2>
    1988:	431d                	li	t1,7
    198a:	a029                	j	1994 <memchr+0x5a>
    198c:	1661                	add	a2,a2,-8
    198e:	07a1                	add	a5,a5,8
    1990:	00c37c63          	bgeu	t1,a2,19a8 <memchr+0x6e>
    1994:	6398                	ld	a4,0(a5)
    1996:	8f29                	xor	a4,a4,a0
    1998:	011706b3          	add	a3,a4,a7
    199c:	fff74713          	not	a4,a4
    19a0:	8f75                	and	a4,a4,a3
    19a2:	01077733          	and	a4,a4,a6
    19a6:	d37d                	beqz	a4,198c <memchr+0x52>
    19a8:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19aa:	e601                	bnez	a2,19b2 <memchr+0x78>
    19ac:	a809                	j	19be <memchr+0x84>
    19ae:	0505                	add	a0,a0,1
    19b0:	c619                	beqz	a2,19be <memchr+0x84>
    19b2:	00054783          	lbu	a5,0(a0)
    19b6:	167d                	add	a2,a2,-1
    19b8:	feb79be3          	bne	a5,a1,19ae <memchr+0x74>
    19bc:	8082                	ret
    return n ? (void *)s : 0;
    19be:	4501                	li	a0,0
}
    19c0:	8082                	ret
    if (n && *s != c)
    19c2:	853e                	mv	a0,a5
    19c4:	b7fd                	j	19b2 <memchr+0x78>

00000000000019c6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19c6:	1101                	add	sp,sp,-32
    19c8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19ca:	862e                	mv	a2,a1
{
    19cc:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19ce:	4581                	li	a1,0
{
    19d0:	e426                	sd	s1,8(sp)
    19d2:	ec06                	sd	ra,24(sp)
    19d4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19d6:	f65ff0ef          	jal	193a <memchr>
    return p ? p - s : n;
    19da:	c519                	beqz	a0,19e8 <strnlen+0x22>
}
    19dc:	60e2                	ld	ra,24(sp)
    19de:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19e0:	8d05                	sub	a0,a0,s1
}
    19e2:	64a2                	ld	s1,8(sp)
    19e4:	6105                	add	sp,sp,32
    19e6:	8082                	ret
    19e8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ea:	8522                	mv	a0,s0
}
    19ec:	6442                	ld	s0,16(sp)
    19ee:	64a2                	ld	s1,8(sp)
    19f0:	6105                	add	sp,sp,32
    19f2:	8082                	ret

00000000000019f4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19f4:	00a5c7b3          	xor	a5,a1,a0
    19f8:	8b9d                	and	a5,a5,7
    19fa:	eb95                	bnez	a5,1a2e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19fc:	0075f793          	and	a5,a1,7
    1a00:	e7b1                	bnez	a5,1a4c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a02:	6198                	ld	a4,0(a1)
    1a04:	00000617          	auipc	a2,0x0
    1a08:	5ec63603          	ld	a2,1516(a2) # 1ff0 <__clone+0xda>
    1a0c:	00000817          	auipc	a6,0x0
    1a10:	5ec83803          	ld	a6,1516(a6) # 1ff8 <__clone+0xe2>
    1a14:	a029                	j	1a1e <strcpy+0x2a>
    1a16:	05a1                	add	a1,a1,8
    1a18:	e118                	sd	a4,0(a0)
    1a1a:	6198                	ld	a4,0(a1)
    1a1c:	0521                	add	a0,a0,8
    1a1e:	00c707b3          	add	a5,a4,a2
    1a22:	fff74693          	not	a3,a4
    1a26:	8ff5                	and	a5,a5,a3
    1a28:	0107f7b3          	and	a5,a5,a6
    1a2c:	d7ed                	beqz	a5,1a16 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a2e:	0005c783          	lbu	a5,0(a1)
    1a32:	00f50023          	sb	a5,0(a0)
    1a36:	c785                	beqz	a5,1a5e <strcpy+0x6a>
    1a38:	0015c783          	lbu	a5,1(a1)
    1a3c:	0505                	add	a0,a0,1
    1a3e:	0585                	add	a1,a1,1
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	fbf5                	bnez	a5,1a38 <strcpy+0x44>
        ;
    return d;
}
    1a46:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a48:	0505                	add	a0,a0,1
    1a4a:	df45                	beqz	a4,1a02 <strcpy+0xe>
            if (!(*d = *s))
    1a4c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a50:	0585                	add	a1,a1,1
    1a52:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a56:	00f50023          	sb	a5,0(a0)
    1a5a:	f7fd                	bnez	a5,1a48 <strcpy+0x54>
}
    1a5c:	8082                	ret
    1a5e:	8082                	ret

0000000000001a60 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a60:	00a5c7b3          	xor	a5,a1,a0
    1a64:	8b9d                	and	a5,a5,7
    1a66:	e3b5                	bnez	a5,1aca <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a68:	0075f793          	and	a5,a1,7
    1a6c:	cf99                	beqz	a5,1a8a <strncpy+0x2a>
    1a6e:	ea09                	bnez	a2,1a80 <strncpy+0x20>
    1a70:	a421                	j	1c78 <strncpy+0x218>
    1a72:	0585                	add	a1,a1,1
    1a74:	0075f793          	and	a5,a1,7
    1a78:	167d                	add	a2,a2,-1
    1a7a:	0505                	add	a0,a0,1
    1a7c:	c799                	beqz	a5,1a8a <strncpy+0x2a>
    1a7e:	c225                	beqz	a2,1ade <strncpy+0x7e>
    1a80:	0005c783          	lbu	a5,0(a1)
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	f7ed                	bnez	a5,1a72 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a8a:	ca31                	beqz	a2,1ade <strncpy+0x7e>
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	cba1                	beqz	a5,1ae0 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a92:	479d                	li	a5,7
    1a94:	02c7fc63          	bgeu	a5,a2,1acc <strncpy+0x6c>
    1a98:	00000897          	auipc	a7,0x0
    1a9c:	5588b883          	ld	a7,1368(a7) # 1ff0 <__clone+0xda>
    1aa0:	00000817          	auipc	a6,0x0
    1aa4:	55883803          	ld	a6,1368(a6) # 1ff8 <__clone+0xe2>
    1aa8:	431d                	li	t1,7
    1aaa:	a039                	j	1ab8 <strncpy+0x58>
            *wd = *ws;
    1aac:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aae:	1661                	add	a2,a2,-8
    1ab0:	05a1                	add	a1,a1,8
    1ab2:	0521                	add	a0,a0,8
    1ab4:	00c37b63          	bgeu	t1,a2,1aca <strncpy+0x6a>
    1ab8:	6198                	ld	a4,0(a1)
    1aba:	011707b3          	add	a5,a4,a7
    1abe:	fff74693          	not	a3,a4
    1ac2:	8ff5                	and	a5,a5,a3
    1ac4:	0107f7b3          	and	a5,a5,a6
    1ac8:	d3f5                	beqz	a5,1aac <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aca:	ca11                	beqz	a2,1ade <strncpy+0x7e>
    1acc:	0005c783          	lbu	a5,0(a1)
    1ad0:	0585                	add	a1,a1,1
    1ad2:	00f50023          	sb	a5,0(a0)
    1ad6:	c789                	beqz	a5,1ae0 <strncpy+0x80>
    1ad8:	167d                	add	a2,a2,-1
    1ada:	0505                	add	a0,a0,1
    1adc:	fa65                	bnez	a2,1acc <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ade:	8082                	ret
    1ae0:	4805                	li	a6,1
    1ae2:	14061b63          	bnez	a2,1c38 <strncpy+0x1d8>
    1ae6:	40a00733          	neg	a4,a0
    1aea:	00777793          	and	a5,a4,7
    1aee:	4581                	li	a1,0
    1af0:	12061c63          	bnez	a2,1c28 <strncpy+0x1c8>
    1af4:	00778693          	add	a3,a5,7
    1af8:	48ad                	li	a7,11
    1afa:	1316e563          	bltu	a3,a7,1c24 <strncpy+0x1c4>
    1afe:	16d5e263          	bltu	a1,a3,1c62 <strncpy+0x202>
    1b02:	14078c63          	beqz	a5,1c5a <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b06:	00050023          	sb	zero,0(a0)
    1b0a:	00677693          	and	a3,a4,6
    1b0e:	14068263          	beqz	a3,1c52 <strncpy+0x1f2>
    1b12:	000500a3          	sb	zero,1(a0)
    1b16:	4689                	li	a3,2
    1b18:	14f6f863          	bgeu	a3,a5,1c68 <strncpy+0x208>
    1b1c:	00050123          	sb	zero,2(a0)
    1b20:	8b11                	and	a4,a4,4
    1b22:	12070463          	beqz	a4,1c4a <strncpy+0x1ea>
    1b26:	000501a3          	sb	zero,3(a0)
    1b2a:	4711                	li	a4,4
    1b2c:	00450693          	add	a3,a0,4
    1b30:	02f77563          	bgeu	a4,a5,1b5a <strncpy+0xfa>
    1b34:	00050223          	sb	zero,4(a0)
    1b38:	4715                	li	a4,5
    1b3a:	00550693          	add	a3,a0,5
    1b3e:	00e78e63          	beq	a5,a4,1b5a <strncpy+0xfa>
    1b42:	fff50713          	add	a4,a0,-1
    1b46:	000502a3          	sb	zero,5(a0)
    1b4a:	8b1d                	and	a4,a4,7
    1b4c:	12071263          	bnez	a4,1c70 <strncpy+0x210>
    1b50:	00750693          	add	a3,a0,7
    1b54:	00050323          	sb	zero,6(a0)
    1b58:	471d                	li	a4,7
    1b5a:	40f80833          	sub	a6,a6,a5
    1b5e:	ff887593          	and	a1,a6,-8
    1b62:	97aa                	add	a5,a5,a0
    1b64:	95be                	add	a1,a1,a5
    1b66:	0007b023          	sd	zero,0(a5)
    1b6a:	07a1                	add	a5,a5,8
    1b6c:	feb79de3          	bne	a5,a1,1b66 <strncpy+0x106>
    1b70:	ff887593          	and	a1,a6,-8
    1b74:	00787813          	and	a6,a6,7
    1b78:	00e587bb          	addw	a5,a1,a4
    1b7c:	00b68733          	add	a4,a3,a1
    1b80:	0e080063          	beqz	a6,1c60 <strncpy+0x200>
    1b84:	00070023          	sb	zero,0(a4)
    1b88:	0017869b          	addw	a3,a5,1
    1b8c:	f4c6f9e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1b90:	000700a3          	sb	zero,1(a4)
    1b94:	0027869b          	addw	a3,a5,2
    1b98:	f4c6f3e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1b9c:	00070123          	sb	zero,2(a4)
    1ba0:	0037869b          	addw	a3,a5,3
    1ba4:	f2c6fde3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1ba8:	000701a3          	sb	zero,3(a4)
    1bac:	0047869b          	addw	a3,a5,4
    1bb0:	f2c6f7e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bb4:	00070223          	sb	zero,4(a4)
    1bb8:	0057869b          	addw	a3,a5,5
    1bbc:	f2c6f1e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bc0:	000702a3          	sb	zero,5(a4)
    1bc4:	0067869b          	addw	a3,a5,6
    1bc8:	f0c6fbe3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bcc:	00070323          	sb	zero,6(a4)
    1bd0:	0077869b          	addw	a3,a5,7
    1bd4:	f0c6f5e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bd8:	000703a3          	sb	zero,7(a4)
    1bdc:	0087869b          	addw	a3,a5,8
    1be0:	eec6ffe3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1be4:	00070423          	sb	zero,8(a4)
    1be8:	0097869b          	addw	a3,a5,9
    1bec:	eec6f9e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bf0:	000704a3          	sb	zero,9(a4)
    1bf4:	00a7869b          	addw	a3,a5,10
    1bf8:	eec6f3e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1bfc:	00070523          	sb	zero,10(a4)
    1c00:	00b7869b          	addw	a3,a5,11
    1c04:	ecc6fde3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1c08:	000705a3          	sb	zero,11(a4)
    1c0c:	00c7869b          	addw	a3,a5,12
    1c10:	ecc6f7e3          	bgeu	a3,a2,1ade <strncpy+0x7e>
    1c14:	00070623          	sb	zero,12(a4)
    1c18:	27b5                	addw	a5,a5,13
    1c1a:	ecc7f2e3          	bgeu	a5,a2,1ade <strncpy+0x7e>
    1c1e:	000706a3          	sb	zero,13(a4)
}
    1c22:	8082                	ret
    1c24:	46ad                	li	a3,11
    1c26:	bde1                	j	1afe <strncpy+0x9e>
    1c28:	00778693          	add	a3,a5,7
    1c2c:	48ad                	li	a7,11
    1c2e:	fff60593          	add	a1,a2,-1
    1c32:	ed16f6e3          	bgeu	a3,a7,1afe <strncpy+0x9e>
    1c36:	b7fd                	j	1c24 <strncpy+0x1c4>
    1c38:	40a00733          	neg	a4,a0
    1c3c:	8832                	mv	a6,a2
    1c3e:	00777793          	and	a5,a4,7
    1c42:	4581                	li	a1,0
    1c44:	ea0608e3          	beqz	a2,1af4 <strncpy+0x94>
    1c48:	b7c5                	j	1c28 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4a:	00350693          	add	a3,a0,3
    1c4e:	470d                	li	a4,3
    1c50:	b729                	j	1b5a <strncpy+0xfa>
    1c52:	00150693          	add	a3,a0,1
    1c56:	4705                	li	a4,1
    1c58:	b709                	j	1b5a <strncpy+0xfa>
tail:
    1c5a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5c:	4701                	li	a4,0
    1c5e:	bdf5                	j	1b5a <strncpy+0xfa>
    1c60:	8082                	ret
tail:
    1c62:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c64:	4781                	li	a5,0
    1c66:	bf39                	j	1b84 <strncpy+0x124>
    1c68:	00250693          	add	a3,a0,2
    1c6c:	4709                	li	a4,2
    1c6e:	b5f5                	j	1b5a <strncpy+0xfa>
    1c70:	00650693          	add	a3,a0,6
    1c74:	4719                	li	a4,6
    1c76:	b5d5                	j	1b5a <strncpy+0xfa>
    1c78:	8082                	ret

0000000000001c7a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c7a:	87aa                	mv	a5,a0
    1c7c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c7e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c82:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c86:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c88:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c8a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <openat>:
    register long a7 __asm__("a7") = n;
    1c92:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c96:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c9a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <close>:
    register long a7 __asm__("a7") = n;
    1ca2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ca6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <read>:
    register long a7 __asm__("a7") = n;
    1cae:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cb6:	8082                	ret

0000000000001cb8 <write>:
    register long a7 __asm__("a7") = n;
    1cb8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cc0:	8082                	ret

0000000000001cc2 <getpid>:
    register long a7 __asm__("a7") = n;
    1cc2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cc6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <getppid>:
    register long a7 __asm__("a7") = n;
    1cce:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cd2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cda:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cde:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <fork>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cea:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cee:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cf6:	85b2                	mv	a1,a2
    1cf8:	863a                	mv	a2,a4
    if (stack)
    1cfa:	c191                	beqz	a1,1cfe <clone+0x8>
	stack += stack_size;
    1cfc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cfe:	4781                	li	a5,0
    1d00:	4701                	li	a4,0
    1d02:	4681                	li	a3,0
    1d04:	2601                	sext.w	a2,a2
    1d06:	ac01                	j	1f16 <__clone>

0000000000001d08 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d08:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d0c:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d10:	8082                	ret

0000000000001d12 <exit>:
    register long a7 __asm__("a7") = n;
    1d12:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d16:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d1a:	8082                	ret

0000000000001d1c <waitpid>:
    register long a7 __asm__("a7") = n;
    1d1c:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d20:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d22:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <exec>:
    register long a7 __asm__("a7") = n;
    1d2a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d2e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <execve>:
    register long a7 __asm__("a7") = n;
    1d36:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d3a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <times>:
    register long a7 __asm__("a7") = n;
    1d42:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <get_time>:

int64 get_time()
{
    1d4e:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d50:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d54:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d56:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d58:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	ed09                	bnez	a0,1d78 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d60:	67a2                	ld	a5,8(sp)
    1d62:	3e800713          	li	a4,1000
    1d66:	00015503          	lhu	a0,0(sp)
    1d6a:	02e7d7b3          	divu	a5,a5,a4
    1d6e:	02e50533          	mul	a0,a0,a4
    1d72:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d74:	0141                	add	sp,sp,16
    1d76:	8082                	ret
        return -1;
    1d78:	557d                	li	a0,-1
    1d7a:	bfed                	j	1d74 <get_time+0x26>

0000000000001d7c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d7c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d80:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <time>:
    register long a7 __asm__("a7") = n;
    1d88:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d8c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <sleep>:

int sleep(unsigned long long time)
{
    1d94:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d96:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d98:	850a                	mv	a0,sp
    1d9a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d9c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1da0:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da2:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da6:	e501                	bnez	a0,1dae <sleep+0x1a>
    return 0;
    1da8:	4501                	li	a0,0
}
    1daa:	0141                	add	sp,sp,16
    1dac:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dae:	4502                	lw	a0,0(sp)
}
    1db0:	0141                	add	sp,sp,16
    1db2:	8082                	ret

0000000000001db4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1db4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1db8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dc0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dc4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dc8:	8082                	ret

0000000000001dca <mprotect>:
    register long a7 __asm__("a7") = n;
    1dca:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dce:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <munmap>:
    register long a7 __asm__("a7") = n;
    1dd6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <wait>:

int wait(int *code)
{
    1de2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1de8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dea:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dee:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <spawn>:
    register long a7 __asm__("a7") = n;
    1df6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dfa:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <mailread>:
    register long a7 __asm__("a7") = n;
    1e02:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e0e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <fstat>:
    register long a7 __asm__("a7") = n;
    1e1a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e26:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e28:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e2c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2e:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e36:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e38:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e3c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e46:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e48:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e4c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <link>:

int link(char *old_path, char *new_path)
{
    1e56:	87aa                	mv	a5,a0
    1e58:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e5a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e64:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e68:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <unlink>:

int unlink(char *path)
{
    1e72:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e74:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e78:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e7c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <uname>:
    register long a7 __asm__("a7") = n;
    1e86:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e8a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <brk>:
    register long a7 __asm__("a7") = n;
    1e92:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e96:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e9e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ea4:	8082                	ret

0000000000001ea6 <chdir>:
    register long a7 __asm__("a7") = n;
    1ea6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eaa:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eb2:	862e                	mv	a2,a1
    1eb4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1eb6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eb8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ebc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ec0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ec2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <getdents>:
    register long a7 __asm__("a7") = n;
    1ecc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <pipe>:
    register long a7 __asm__("a7") = n;
    1ed8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1edc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ede:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <dup>:
    register long a7 __asm__("a7") = n;
    1ee6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ee8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ef0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ef2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <mount>:
    register long a7 __asm__("a7") = n;
    1efc:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f00:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <umount>:
    register long a7 __asm__("a7") = n;
    1f08:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f16:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f18:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f1a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f1c:	8532                	mv	a0,a2
	mv a2, a4
    1f1e:	863a                	mv	a2,a4
	mv a3, a5
    1f20:	86be                	mv	a3,a5
	mv a4, a6
    1f22:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f24:	0dc00893          	li	a7,220
	ecall
    1f28:	00000073          	ecall

	beqz a0, 1f
    1f2c:	c111                	beqz	a0,1f30 <__clone+0x1a>
	# Parent
	ret
    1f2e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f30:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f32:	6522                	ld	a0,8(sp)
	jalr a1
    1f34:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f36:	05d00893          	li	a7,93
	ecall
    1f3a:	00000073          	ecall
