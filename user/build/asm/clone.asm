
/home/hbh/oslab/oslab/user/build/riscv64/clone:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f5                	j	10ee <__start_main>

0000000000001004 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1004:	1141                	add	sp,sp,-16
    printf("  Child says successfully!\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	f2250513          	add	a0,a0,-222 # 1f28 <__clone+0x2c>
static int child_func(void){
    100e:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1010:	358000ef          	jal	1368 <printf>
    return 0;
}
    1014:	60a2                	ld	ra,8(sp)
    1016:	4501                	li	a0,0
    1018:	0141                	add	sp,sp,16
    101a:	8082                	ret

000000000000101c <test_clone>:

void test_clone(void){
    101c:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    101e:	00001517          	auipc	a0,0x1
    1022:	f2a50513          	add	a0,a0,-214 # 1f48 <__clone+0x4c>
void test_clone(void){
    1026:	ec06                	sd	ra,24(sp)
    1028:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102a:	31c000ef          	jal	1346 <puts>
    102e:	00003517          	auipc	a0,0x3
    1032:	fda50513          	add	a0,a0,-38 # 4008 <__func__.0>
    1036:	310000ef          	jal	1346 <puts>
    103a:	00001517          	auipc	a0,0x1
    103e:	f2650513          	add	a0,a0,-218 # 1f60 <__clone+0x64>
    1042:	304000ef          	jal	1346 <puts>
    int wstatus;
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    1046:	4745                	li	a4,17
    1048:	40000693          	li	a3,1024
    104c:	00001617          	auipc	a2,0x1
    1050:	fb460613          	add	a2,a2,-76 # 2000 <stack>
    1054:	4581                	li	a1,0
    1056:	00000517          	auipc	a0,0x0
    105a:	fae50513          	add	a0,a0,-82 # 1004 <child_func>
    105e:	47f000ef          	jal	1cdc <clone>
    1062:	00003417          	auipc	s0,0x3
    1066:	f9e40413          	add	s0,s0,-98 # 4000 <child_pid>
    106a:	c008                	sw	a0,0(s0)
    assert(child_pid != -1);
    106c:	57fd                	li	a5,-1
    106e:	04f50863          	beq	a0,a5,10be <test_clone+0xa2>
    if (child_pid == 0){
    1072:	e90d                	bnez	a0,10a4 <test_clone+0x88>
	exit(0);
    1074:	485000ef          	jal	1cf8 <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	f5850513          	add	a0,a0,-168 # 1fd0 <__clone+0xd4>
    1080:	2c6000ef          	jal	1346 <puts>
    1084:	00003517          	auipc	a0,0x3
    1088:	f8450513          	add	a0,a0,-124 # 4008 <__func__.0>
    108c:	2ba000ef          	jal	1346 <puts>
    1090:	00001517          	auipc	a0,0x1
    1094:	ed050513          	add	a0,a0,-304 # 1f60 <__clone+0x64>
    1098:	2ae000ef          	jal	1346 <puts>
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	6442                	ld	s0,16(sp)
    10a0:	6105                	add	sp,sp,32
    10a2:	8082                	ret
	if(wait(&wstatus) == child_pid)
    10a4:	0068                	add	a0,sp,12
    10a6:	523000ef          	jal	1dc8 <wait>
    10aa:	401c                	lw	a5,0(s0)
    10ac:	02f50163          	beq	a0,a5,10ce <test_clone+0xb2>
	    printf("clone process error.\n");
    10b0:	00001517          	auipc	a0,0x1
    10b4:	f0850513          	add	a0,a0,-248 # 1fb8 <__clone+0xbc>
    10b8:	2b0000ef          	jal	1368 <printf>
    10bc:	bf75                	j	1078 <test_clone+0x5c>
    assert(child_pid != -1);
    10be:	00001517          	auipc	a0,0x1
    10c2:	eb250513          	add	a0,a0,-334 # 1f70 <__clone+0x74>
    10c6:	51c000ef          	jal	15e2 <panic>
    if (child_pid == 0){
    10ca:	4008                	lw	a0,0(s0)
    10cc:	b75d                	j	1072 <test_clone+0x56>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10ce:	85aa                	mv	a1,a0
    10d0:	00001517          	auipc	a0,0x1
    10d4:	ec050513          	add	a0,a0,-320 # 1f90 <__clone+0x94>
    10d8:	290000ef          	jal	1368 <printf>
    10dc:	bf71                	j	1078 <test_clone+0x5c>

00000000000010de <main>:

int main(void){
    10de:	1141                	add	sp,sp,-16
    10e0:	e406                	sd	ra,8(sp)
    test_clone();
    10e2:	f3bff0ef          	jal	101c <test_clone>
    return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	add	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ee:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f0:	4108                	lw	a0,0(a0)
{
    10f2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10f4:	05a1                	add	a1,a1,8
{
    10f6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f8:	fe7ff0ef          	jal	10de <main>
    10fc:	3fd000ef          	jal	1cf8 <exit>
	return 0;
}
    1100:	60a2                	ld	ra,8(sp)
    1102:	4501                	li	a0,0
    1104:	0141                	add	sp,sp,16
    1106:	8082                	ret

0000000000001108 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1108:	7179                	add	sp,sp,-48
    110a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    110c:	12054863          	bltz	a0,123c <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1110:	02b577bb          	remuw	a5,a0,a1
    1114:	00003697          	auipc	a3,0x3
    1118:	f0468693          	add	a3,a3,-252 # 4018 <digits>
    buf[16] = 0;
    111c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1120:	0005871b          	sext.w	a4,a1
    1124:	1782                	sll	a5,a5,0x20
    1126:	9381                	srl	a5,a5,0x20
    1128:	97b6                	add	a5,a5,a3
    112a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    112e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1132:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1136:	1ab56663          	bltu	a0,a1,12e2 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    113a:	02e8763b          	remuw	a2,a6,a4
    113e:	1602                	sll	a2,a2,0x20
    1140:	9201                	srl	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1150:	12e86c63          	bltu	a6,a4,1288 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116a:	12e5e863          	bltu	a1,a4,129a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    116e:	02e8763b          	remuw	a2,a6,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1180:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1184:	12e86463          	bltu	a6,a4,12ac <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    119e:	12e5e063          	bltu	a1,a4,12be <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11a2:	02e8763b          	remuw	a2,a6,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b4:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11b8:	0ae86f63          	bltu	a6,a4,1276 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11bc:	02e5f63b          	remuw	a2,a1,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ce:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d2:	0ee5ef63          	bltu	a1,a4,12d0 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11d6:	02e8763b          	remuw	a2,a6,a4
    11da:	1602                	sll	a2,a2,0x20
    11dc:	9201                	srl	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11e8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ec:	0ee86d63          	bltu	a6,a4,12e6 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11f0:	02e5f63b          	remuw	a2,a1,a4
    11f4:	1602                	sll	a2,a2,0x20
    11f6:	9201                	srl	a2,a2,0x20
    11f8:	9636                	add	a2,a2,a3
    11fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fe:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1202:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1206:	0ee5e963          	bltu	a1,a4,12f8 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    120a:	1782                	sll	a5,a5,0x20
    120c:	9381                	srl	a5,a5,0x20
    120e:	96be                	add	a3,a3,a5
    1210:	0006c783          	lbu	a5,0(a3)
    1214:	4599                	li	a1,6
    1216:	00f10723          	sb	a5,14(sp)

    if (sign)
    121a:	00055763          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    121e:	02d00793          	li	a5,45
    1222:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1226:	4595                	li	a1,5
    write(f, s, l);
    1228:	003c                	add	a5,sp,8
    122a:	4641                	li	a2,16
    122c:	9e0d                	subw	a2,a2,a1
    122e:	4505                	li	a0,1
    1230:	95be                	add	a1,a1,a5
    1232:	26d000ef          	jal	1c9e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1236:	70a2                	ld	ra,40(sp)
    1238:	6145                	add	sp,sp,48
    123a:	8082                	ret
        x = -xx;
    123c:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1240:	02b677bb          	remuw	a5,a2,a1
    1244:	00003697          	auipc	a3,0x3
    1248:	dd468693          	add	a3,a3,-556 # 4018 <digits>
    buf[16] = 0;
    124c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1250:	0005871b          	sext.w	a4,a1
    1254:	1782                	sll	a5,a5,0x20
    1256:	9381                	srl	a5,a5,0x20
    1258:	97b6                	add	a5,a5,a3
    125a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1262:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1266:	ecb67ae3          	bgeu	a2,a1,113a <printint.constprop.0+0x32>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1272:	45b9                	li	a1,14
    1274:	bf55                	j	1228 <printint.constprop.0+0x120>
    1276:	45a9                	li	a1,10
    if (sign)
    1278:	fa0558e3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1284:	45a5                	li	a1,9
    1286:	b74d                	j	1228 <printint.constprop.0+0x120>
    1288:	45b9                	li	a1,14
    if (sign)
    128a:	f8055fe3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1296:	45b5                	li	a1,13
    1298:	bf41                	j	1228 <printint.constprop.0+0x120>
    129a:	45b5                	li	a1,13
    if (sign)
    129c:	f80556e3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12a8:	45b1                	li	a1,12
    12aa:	bfbd                	j	1228 <printint.constprop.0+0x120>
    12ac:	45b1                	li	a1,12
    if (sign)
    12ae:	f6055de3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b2:	02d00793          	li	a5,45
    12b6:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12ba:	45ad                	li	a1,11
    12bc:	b7b5                	j	1228 <printint.constprop.0+0x120>
    12be:	45ad                	li	a1,11
    if (sign)
    12c0:	f60554e3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c4:	02d00793          	li	a5,45
    12c8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12cc:	45a9                	li	a1,10
    12ce:	bfa9                	j	1228 <printint.constprop.0+0x120>
    12d0:	45a5                	li	a1,9
    if (sign)
    12d2:	f4055be3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d6:	02d00793          	li	a5,45
    12da:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12de:	45a1                	li	a1,8
    12e0:	b7a1                	j	1228 <printint.constprop.0+0x120>
    i = 15;
    12e2:	45bd                	li	a1,15
    12e4:	b791                	j	1228 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12e6:	45a1                	li	a1,8
    if (sign)
    12e8:	f40550e3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f4:	459d                	li	a1,7
    12f6:	bf0d                	j	1228 <printint.constprop.0+0x120>
    12f8:	459d                	li	a1,7
    if (sign)
    12fa:	f20557e3          	bgez	a0,1228 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1306:	4599                	li	a1,6
    1308:	b705                	j	1228 <printint.constprop.0+0x120>

000000000000130a <getchar>:
{
    130a:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    130c:	00f10593          	add	a1,sp,15
    1310:	4605                	li	a2,1
    1312:	4501                	li	a0,0
{
    1314:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1316:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    131a:	17b000ef          	jal	1c94 <read>
}
    131e:	60e2                	ld	ra,24(sp)
    1320:	00f14503          	lbu	a0,15(sp)
    1324:	6105                	add	sp,sp,32
    1326:	8082                	ret

0000000000001328 <putchar>:
{
    1328:	1101                	add	sp,sp,-32
    132a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    132c:	00f10593          	add	a1,sp,15
    1330:	4605                	li	a2,1
    1332:	4505                	li	a0,1
{
    1334:	ec06                	sd	ra,24(sp)
    char byte = c;
    1336:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    133a:	165000ef          	jal	1c9e <write>
}
    133e:	60e2                	ld	ra,24(sp)
    1340:	2501                	sext.w	a0,a0
    1342:	6105                	add	sp,sp,32
    1344:	8082                	ret

0000000000001346 <puts>:
{
    1346:	1141                	add	sp,sp,-16
    1348:	e406                	sd	ra,8(sp)
    134a:	e022                	sd	s0,0(sp)
    134c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    134e:	574000ef          	jal	18c2 <strlen>
    1352:	862a                	mv	a2,a0
    1354:	85a2                	mv	a1,s0
    1356:	4505                	li	a0,1
    1358:	147000ef          	jal	1c9e <write>
}
    135c:	60a2                	ld	ra,8(sp)
    135e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1360:	957d                	sra	a0,a0,0x3f
    return r;
    1362:	2501                	sext.w	a0,a0
}
    1364:	0141                	add	sp,sp,16
    1366:	8082                	ret

0000000000001368 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1368:	7171                	add	sp,sp,-176
    136a:	f85a                	sd	s6,48(sp)
    136c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    136e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1370:	18bc                	add	a5,sp,120
{
    1372:	e8ca                	sd	s2,80(sp)
    1374:	e4ce                	sd	s3,72(sp)
    1376:	e0d2                	sd	s4,64(sp)
    1378:	fc56                	sd	s5,56(sp)
    137a:	f486                	sd	ra,104(sp)
    137c:	f0a2                	sd	s0,96(sp)
    137e:	eca6                	sd	s1,88(sp)
    1380:	fcae                	sd	a1,120(sp)
    1382:	e132                	sd	a2,128(sp)
    1384:	e536                	sd	a3,136(sp)
    1386:	e93a                	sd	a4,144(sp)
    1388:	f142                	sd	a6,160(sp)
    138a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    138c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    138e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1392:	07300a13          	li	s4,115
    1396:	07800a93          	li	s5,120
    buf[i++] = '0';
    139a:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139e:	00003997          	auipc	s3,0x3
    13a2:	c7a98993          	add	s3,s3,-902 # 4018 <digits>
        if (!*s)
    13a6:	00054783          	lbu	a5,0(a0)
    13aa:	16078a63          	beqz	a5,151e <printf+0x1b6>
    13ae:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13b0:	19278d63          	beq	a5,s2,154a <printf+0x1e2>
    13b4:	00164783          	lbu	a5,1(a2)
    13b8:	0605                	add	a2,a2,1
    13ba:	fbfd                	bnez	a5,13b0 <printf+0x48>
    13bc:	84b2                	mv	s1,a2
        l = z - a;
    13be:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13c2:	85aa                	mv	a1,a0
    13c4:	8622                	mv	a2,s0
    13c6:	4505                	li	a0,1
    13c8:	0d7000ef          	jal	1c9e <write>
        if (l)
    13cc:	1a041463          	bnez	s0,1574 <printf+0x20c>
        if (s[1] == 0)
    13d0:	0014c783          	lbu	a5,1(s1)
    13d4:	14078563          	beqz	a5,151e <printf+0x1b6>
        switch (s[1])
    13d8:	1b478063          	beq	a5,s4,1578 <printf+0x210>
    13dc:	14fa6b63          	bltu	s4,a5,1532 <printf+0x1ca>
    13e0:	06400713          	li	a4,100
    13e4:	1ee78063          	beq	a5,a4,15c4 <printf+0x25c>
    13e8:	07000713          	li	a4,112
    13ec:	1ae79963          	bne	a5,a4,159e <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13f0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13f6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f8:	631c                	ld	a5,0(a4)
    13fa:	0721                	add	a4,a4,8
    13fc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fe:	00479293          	sll	t0,a5,0x4
    1402:	00879f93          	sll	t6,a5,0x8
    1406:	00c79f13          	sll	t5,a5,0xc
    140a:	01079e93          	sll	t4,a5,0x10
    140e:	01479e13          	sll	t3,a5,0x14
    1412:	01879313          	sll	t1,a5,0x18
    1416:	01c79893          	sll	a7,a5,0x1c
    141a:	02479813          	sll	a6,a5,0x24
    141e:	02879513          	sll	a0,a5,0x28
    1422:	02c79593          	sll	a1,a5,0x2c
    1426:	03079693          	sll	a3,a5,0x30
    142a:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	03c7d413          	srl	s0,a5,0x3c
    1432:	01c7d39b          	srlw	t2,a5,0x1c
    1436:	03c2d293          	srl	t0,t0,0x3c
    143a:	03cfdf93          	srl	t6,t6,0x3c
    143e:	03cf5f13          	srl	t5,t5,0x3c
    1442:	03cede93          	srl	t4,t4,0x3c
    1446:	03ce5e13          	srl	t3,t3,0x3c
    144a:	03c35313          	srl	t1,t1,0x3c
    144e:	03c8d893          	srl	a7,a7,0x3c
    1452:	03c85813          	srl	a6,a6,0x3c
    1456:	9171                	srl	a0,a0,0x3c
    1458:	91f1                	srl	a1,a1,0x3c
    145a:	92f1                	srl	a3,a3,0x3c
    145c:	9371                	srl	a4,a4,0x3c
    145e:	96ce                	add	a3,a3,s3
    1460:	974e                	add	a4,a4,s3
    1462:	944e                	add	s0,s0,s3
    1464:	92ce                	add	t0,t0,s3
    1466:	9fce                	add	t6,t6,s3
    1468:	9f4e                	add	t5,t5,s3
    146a:	9ece                	add	t4,t4,s3
    146c:	9e4e                	add	t3,t3,s3
    146e:	934e                	add	t1,t1,s3
    1470:	98ce                	add	a7,a7,s3
    1472:	93ce                	add	t2,t2,s3
    1474:	984e                	add	a6,a6,s3
    1476:	954e                	add	a0,a0,s3
    1478:	95ce                	add	a1,a1,s3
    147a:	0006c083          	lbu	ra,0(a3)
    147e:	0002c283          	lbu	t0,0(t0)
    1482:	00074683          	lbu	a3,0(a4)
    1486:	000fcf83          	lbu	t6,0(t6)
    148a:	000f4f03          	lbu	t5,0(t5)
    148e:	000ece83          	lbu	t4,0(t4)
    1492:	000e4e03          	lbu	t3,0(t3)
    1496:	00034303          	lbu	t1,0(t1)
    149a:	0008c883          	lbu	a7,0(a7)
    149e:	0003c383          	lbu	t2,0(t2)
    14a2:	00084803          	lbu	a6,0(a6)
    14a6:	00054503          	lbu	a0,0(a0)
    14aa:	0005c583          	lbu	a1,0(a1)
    14ae:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b2:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b6:	9371                	srl	a4,a4,0x3c
    14b8:	8bbd                	and	a5,a5,15
    14ba:	974e                	add	a4,a4,s3
    14bc:	97ce                	add	a5,a5,s3
    14be:	005105a3          	sb	t0,11(sp)
    14c2:	01f10623          	sb	t6,12(sp)
    14c6:	01e106a3          	sb	t5,13(sp)
    14ca:	01d10723          	sb	t4,14(sp)
    14ce:	01c107a3          	sb	t3,15(sp)
    14d2:	00610823          	sb	t1,16(sp)
    14d6:	011108a3          	sb	a7,17(sp)
    14da:	00710923          	sb	t2,18(sp)
    14de:	010109a3          	sb	a6,19(sp)
    14e2:	00a10a23          	sb	a0,20(sp)
    14e6:	00b10aa3          	sb	a1,21(sp)
    14ea:	00110b23          	sb	ra,22(sp)
    14ee:	00d10ba3          	sb	a3,23(sp)
    14f2:	00810523          	sb	s0,10(sp)
    14f6:	00074703          	lbu	a4,0(a4)
    14fa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fe:	002c                	add	a1,sp,8
    1500:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1502:	00e10c23          	sb	a4,24(sp)
    1506:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    150e:	790000ef          	jal	1c9e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1512:	00248513          	add	a0,s1,2
        if (!*s)
    1516:	00054783          	lbu	a5,0(a0)
    151a:	e8079ae3          	bnez	a5,13ae <printf+0x46>
    }
    va_end(ap);
}
    151e:	70a6                	ld	ra,104(sp)
    1520:	7406                	ld	s0,96(sp)
    1522:	64e6                	ld	s1,88(sp)
    1524:	6946                	ld	s2,80(sp)
    1526:	69a6                	ld	s3,72(sp)
    1528:	6a06                	ld	s4,64(sp)
    152a:	7ae2                	ld	s5,56(sp)
    152c:	7b42                	ld	s6,48(sp)
    152e:	614d                	add	sp,sp,176
    1530:	8082                	ret
        switch (s[1])
    1532:	07579663          	bne	a5,s5,159e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1536:	6782                	ld	a5,0(sp)
    1538:	45c1                	li	a1,16
    153a:	4388                	lw	a0,0(a5)
    153c:	07a1                	add	a5,a5,8
    153e:	e03e                	sd	a5,0(sp)
    1540:	bc9ff0ef          	jal	1108 <printint.constprop.0>
        s += 2;
    1544:	00248513          	add	a0,s1,2
    1548:	b7f9                	j	1516 <printf+0x1ae>
    154a:	84b2                	mv	s1,a2
    154c:	a039                	j	155a <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    154e:	0024c783          	lbu	a5,2(s1)
    1552:	0605                	add	a2,a2,1
    1554:	0489                	add	s1,s1,2
    1556:	e72794e3          	bne	a5,s2,13be <printf+0x56>
    155a:	0014c783          	lbu	a5,1(s1)
    155e:	ff2788e3          	beq	a5,s2,154e <printf+0x1e6>
        l = z - a;
    1562:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1566:	85aa                	mv	a1,a0
    1568:	8622                	mv	a2,s0
    156a:	4505                	li	a0,1
    156c:	732000ef          	jal	1c9e <write>
        if (l)
    1570:	e60400e3          	beqz	s0,13d0 <printf+0x68>
    1574:	8526                	mv	a0,s1
    1576:	bd05                	j	13a6 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1578:	6782                	ld	a5,0(sp)
    157a:	6380                	ld	s0,0(a5)
    157c:	07a1                	add	a5,a5,8
    157e:	e03e                	sd	a5,0(sp)
    1580:	cc21                	beqz	s0,15d8 <printf+0x270>
            l = strnlen(a, 200);
    1582:	0c800593          	li	a1,200
    1586:	8522                	mv	a0,s0
    1588:	424000ef          	jal	19ac <strnlen>
    write(f, s, l);
    158c:	0005061b          	sext.w	a2,a0
    1590:	85a2                	mv	a1,s0
    1592:	4505                	li	a0,1
    1594:	70a000ef          	jal	1c9e <write>
        s += 2;
    1598:	00248513          	add	a0,s1,2
    159c:	bfad                	j	1516 <printf+0x1ae>
    return write(stdout, &byte, 1);
    159e:	4605                	li	a2,1
    15a0:	002c                	add	a1,sp,8
    15a2:	4505                	li	a0,1
    char byte = c;
    15a4:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15a8:	6f6000ef          	jal	1c9e <write>
    char byte = c;
    15ac:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15b0:	4605                	li	a2,1
    15b2:	002c                	add	a1,sp,8
    15b4:	4505                	li	a0,1
    char byte = c;
    15b6:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15ba:	6e4000ef          	jal	1c9e <write>
        s += 2;
    15be:	00248513          	add	a0,s1,2
    15c2:	bf91                	j	1516 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15c4:	6782                	ld	a5,0(sp)
    15c6:	45a9                	li	a1,10
    15c8:	4388                	lw	a0,0(a5)
    15ca:	07a1                	add	a5,a5,8
    15cc:	e03e                	sd	a5,0(sp)
    15ce:	b3bff0ef          	jal	1108 <printint.constprop.0>
        s += 2;
    15d2:	00248513          	add	a0,s1,2
    15d6:	b781                	j	1516 <printf+0x1ae>
                a = "(null)";
    15d8:	00001417          	auipc	s0,0x1
    15dc:	a0840413          	add	s0,s0,-1528 # 1fe0 <__clone+0xe4>
    15e0:	b74d                	j	1582 <printf+0x21a>

00000000000015e2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e2:	1141                	add	sp,sp,-16
    15e4:	e406                	sd	ra,8(sp)
    puts(m);
    15e6:	d61ff0ef          	jal	1346 <puts>
    exit(-100);
}
    15ea:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ec:	f9c00513          	li	a0,-100
}
    15f0:	0141                	add	sp,sp,16
    exit(-100);
    15f2:	a719                	j	1cf8 <exit>

00000000000015f4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f4:	02000793          	li	a5,32
    15f8:	00f50663          	beq	a0,a5,1604 <isspace+0x10>
    15fc:	355d                	addw	a0,a0,-9
    15fe:	00553513          	sltiu	a0,a0,5
    1602:	8082                	ret
    1604:	4505                	li	a0,1
}
    1606:	8082                	ret

0000000000001608 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1608:	fd05051b          	addw	a0,a0,-48
}
    160c:	00a53513          	sltiu	a0,a0,10
    1610:	8082                	ret

0000000000001612 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1612:	02000693          	li	a3,32
    1616:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1618:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    161c:	ff77871b          	addw	a4,a5,-9
    1620:	04d78c63          	beq	a5,a3,1678 <atoi+0x66>
    1624:	0007861b          	sext.w	a2,a5
    1628:	04e5f863          	bgeu	a1,a4,1678 <atoi+0x66>
        s++;
    switch (*s)
    162c:	02b00713          	li	a4,43
    1630:	04e78963          	beq	a5,a4,1682 <atoi+0x70>
    1634:	02d00713          	li	a4,45
    1638:	06e78263          	beq	a5,a4,169c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    163c:	fd06069b          	addw	a3,a2,-48
    1640:	47a5                	li	a5,9
    1642:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1644:	4301                	li	t1,0
    while (isdigit(*s))
    1646:	04d7e963          	bltu	a5,a3,1698 <atoi+0x86>
    int n = 0, neg = 0;
    164a:	4501                	li	a0,0
    while (isdigit(*s))
    164c:	48a5                	li	a7,9
    164e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1652:	0025179b          	sllw	a5,a0,0x2
    1656:	9fa9                	addw	a5,a5,a0
    1658:	fd06059b          	addw	a1,a2,-48
    165c:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1660:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1664:	0705                	add	a4,a4,1
    1666:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    166a:	0006861b          	sext.w	a2,a3
    166e:	ff08f0e3          	bgeu	a7,a6,164e <atoi+0x3c>
    return neg ? n : -n;
    1672:	00030563          	beqz	t1,167c <atoi+0x6a>
}
    1676:	8082                	ret
        s++;
    1678:	0505                	add	a0,a0,1
    167a:	bf79                	j	1618 <atoi+0x6>
    return neg ? n : -n;
    167c:	40f5853b          	subw	a0,a1,a5
    1680:	8082                	ret
    while (isdigit(*s))
    1682:	00154603          	lbu	a2,1(a0)
    1686:	47a5                	li	a5,9
        s++;
    1688:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    168c:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1690:	4301                	li	t1,0
    while (isdigit(*s))
    1692:	2601                	sext.w	a2,a2
    1694:	fad7fbe3          	bgeu	a5,a3,164a <atoi+0x38>
    1698:	4501                	li	a0,0
}
    169a:	8082                	ret
    while (isdigit(*s))
    169c:	00154603          	lbu	a2,1(a0)
    16a0:	47a5                	li	a5,9
        s++;
    16a2:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16a6:	fd06069b          	addw	a3,a2,-48
    16aa:	2601                	sext.w	a2,a2
    16ac:	fed7e6e3          	bltu	a5,a3,1698 <atoi+0x86>
        neg = 1;
    16b0:	4305                	li	t1,1
    16b2:	bf61                	j	164a <atoi+0x38>

00000000000016b4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b4:	18060163          	beqz	a2,1836 <memset+0x182>
    16b8:	40a006b3          	neg	a3,a0
    16bc:	0076f793          	and	a5,a3,7
    16c0:	00778813          	add	a6,a5,7
    16c4:	48ad                	li	a7,11
    16c6:	0ff5f713          	zext.b	a4,a1
    16ca:	fff60593          	add	a1,a2,-1
    16ce:	17186563          	bltu	a6,a7,1838 <memset+0x184>
    16d2:	1705ed63          	bltu	a1,a6,184c <memset+0x198>
    16d6:	16078363          	beqz	a5,183c <memset+0x188>
    16da:	00e50023          	sb	a4,0(a0)
    16de:	0066f593          	and	a1,a3,6
    16e2:	16058063          	beqz	a1,1842 <memset+0x18e>
    16e6:	00e500a3          	sb	a4,1(a0)
    16ea:	4589                	li	a1,2
    16ec:	16f5f363          	bgeu	a1,a5,1852 <memset+0x19e>
    16f0:	00e50123          	sb	a4,2(a0)
    16f4:	8a91                	and	a3,a3,4
    16f6:	00350593          	add	a1,a0,3
    16fa:	4e0d                	li	t3,3
    16fc:	ce9d                	beqz	a3,173a <memset+0x86>
    16fe:	00e501a3          	sb	a4,3(a0)
    1702:	4691                	li	a3,4
    1704:	00450593          	add	a1,a0,4
    1708:	4e11                	li	t3,4
    170a:	02f6f863          	bgeu	a3,a5,173a <memset+0x86>
    170e:	00e50223          	sb	a4,4(a0)
    1712:	4695                	li	a3,5
    1714:	00550593          	add	a1,a0,5
    1718:	4e15                	li	t3,5
    171a:	02d78063          	beq	a5,a3,173a <memset+0x86>
    171e:	fff50693          	add	a3,a0,-1
    1722:	00e502a3          	sb	a4,5(a0)
    1726:	8a9d                	and	a3,a3,7
    1728:	00650593          	add	a1,a0,6
    172c:	4e19                	li	t3,6
    172e:	e691                	bnez	a3,173a <memset+0x86>
    1730:	00750593          	add	a1,a0,7
    1734:	00e50323          	sb	a4,6(a0)
    1738:	4e1d                	li	t3,7
    173a:	00871693          	sll	a3,a4,0x8
    173e:	01071813          	sll	a6,a4,0x10
    1742:	8ed9                	or	a3,a3,a4
    1744:	01871893          	sll	a7,a4,0x18
    1748:	0106e6b3          	or	a3,a3,a6
    174c:	0116e6b3          	or	a3,a3,a7
    1750:	02071813          	sll	a6,a4,0x20
    1754:	02871313          	sll	t1,a4,0x28
    1758:	0106e6b3          	or	a3,a3,a6
    175c:	40f608b3          	sub	a7,a2,a5
    1760:	03071813          	sll	a6,a4,0x30
    1764:	0066e6b3          	or	a3,a3,t1
    1768:	0106e6b3          	or	a3,a3,a6
    176c:	03871313          	sll	t1,a4,0x38
    1770:	97aa                	add	a5,a5,a0
    1772:	ff88f813          	and	a6,a7,-8
    1776:	0066e6b3          	or	a3,a3,t1
    177a:	983e                	add	a6,a6,a5
    177c:	e394                	sd	a3,0(a5)
    177e:	07a1                	add	a5,a5,8
    1780:	ff079ee3          	bne	a5,a6,177c <memset+0xc8>
    1784:	ff88f793          	and	a5,a7,-8
    1788:	0078f893          	and	a7,a7,7
    178c:	00f586b3          	add	a3,a1,a5
    1790:	01c787bb          	addw	a5,a5,t3
    1794:	0a088b63          	beqz	a7,184a <memset+0x196>
    1798:	00e68023          	sb	a4,0(a3)
    179c:	0017859b          	addw	a1,a5,1
    17a0:	08c5fb63          	bgeu	a1,a2,1836 <memset+0x182>
    17a4:	00e680a3          	sb	a4,1(a3)
    17a8:	0027859b          	addw	a1,a5,2
    17ac:	08c5f563          	bgeu	a1,a2,1836 <memset+0x182>
    17b0:	00e68123          	sb	a4,2(a3)
    17b4:	0037859b          	addw	a1,a5,3
    17b8:	06c5ff63          	bgeu	a1,a2,1836 <memset+0x182>
    17bc:	00e681a3          	sb	a4,3(a3)
    17c0:	0047859b          	addw	a1,a5,4
    17c4:	06c5f963          	bgeu	a1,a2,1836 <memset+0x182>
    17c8:	00e68223          	sb	a4,4(a3)
    17cc:	0057859b          	addw	a1,a5,5
    17d0:	06c5f363          	bgeu	a1,a2,1836 <memset+0x182>
    17d4:	00e682a3          	sb	a4,5(a3)
    17d8:	0067859b          	addw	a1,a5,6
    17dc:	04c5fd63          	bgeu	a1,a2,1836 <memset+0x182>
    17e0:	00e68323          	sb	a4,6(a3)
    17e4:	0077859b          	addw	a1,a5,7
    17e8:	04c5f763          	bgeu	a1,a2,1836 <memset+0x182>
    17ec:	00e683a3          	sb	a4,7(a3)
    17f0:	0087859b          	addw	a1,a5,8
    17f4:	04c5f163          	bgeu	a1,a2,1836 <memset+0x182>
    17f8:	00e68423          	sb	a4,8(a3)
    17fc:	0097859b          	addw	a1,a5,9
    1800:	02c5fb63          	bgeu	a1,a2,1836 <memset+0x182>
    1804:	00e684a3          	sb	a4,9(a3)
    1808:	00a7859b          	addw	a1,a5,10
    180c:	02c5f563          	bgeu	a1,a2,1836 <memset+0x182>
    1810:	00e68523          	sb	a4,10(a3)
    1814:	00b7859b          	addw	a1,a5,11
    1818:	00c5ff63          	bgeu	a1,a2,1836 <memset+0x182>
    181c:	00e685a3          	sb	a4,11(a3)
    1820:	00c7859b          	addw	a1,a5,12
    1824:	00c5f963          	bgeu	a1,a2,1836 <memset+0x182>
    1828:	00e68623          	sb	a4,12(a3)
    182c:	27b5                	addw	a5,a5,13
    182e:	00c7f463          	bgeu	a5,a2,1836 <memset+0x182>
    1832:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1836:	8082                	ret
    1838:	482d                	li	a6,11
    183a:	bd61                	j	16d2 <memset+0x1e>
    char *p = dest;
    183c:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    183e:	4e01                	li	t3,0
    1840:	bded                	j	173a <memset+0x86>
    1842:	00150593          	add	a1,a0,1
    1846:	4e05                	li	t3,1
    1848:	bdcd                	j	173a <memset+0x86>
    184a:	8082                	ret
    char *p = dest;
    184c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    184e:	4781                	li	a5,0
    1850:	b7a1                	j	1798 <memset+0xe4>
    1852:	00250593          	add	a1,a0,2
    1856:	4e09                	li	t3,2
    1858:	b5cd                	j	173a <memset+0x86>

000000000000185a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185a:	00054783          	lbu	a5,0(a0)
    185e:	0005c703          	lbu	a4,0(a1)
    1862:	00e79863          	bne	a5,a4,1872 <strcmp+0x18>
    1866:	0505                	add	a0,a0,1
    1868:	0585                	add	a1,a1,1
    186a:	fbe5                	bnez	a5,185a <strcmp>
    186c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    186e:	9d19                	subw	a0,a0,a4
    1870:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1872:	0007851b          	sext.w	a0,a5
    1876:	bfe5                	j	186e <strcmp+0x14>

0000000000001878 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1878:	ca15                	beqz	a2,18ac <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    187e:	167d                	add	a2,a2,-1
    1880:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1884:	eb99                	bnez	a5,189a <strncmp+0x22>
    1886:	a815                	j	18ba <strncmp+0x42>
    1888:	00a68e63          	beq	a3,a0,18a4 <strncmp+0x2c>
    188c:	0505                	add	a0,a0,1
    188e:	00f71b63          	bne	a4,a5,18a4 <strncmp+0x2c>
    1892:	00054783          	lbu	a5,0(a0)
    1896:	cf89                	beqz	a5,18b0 <strncmp+0x38>
    1898:	85b2                	mv	a1,a2
    189a:	0005c703          	lbu	a4,0(a1)
    189e:	00158613          	add	a2,a1,1
    18a2:	f37d                	bnez	a4,1888 <strncmp+0x10>
        ;
    return *l - *r;
    18a4:	0007851b          	sext.w	a0,a5
    18a8:	9d19                	subw	a0,a0,a4
    18aa:	8082                	ret
        return 0;
    18ac:	4501                	li	a0,0
}
    18ae:	8082                	ret
    return *l - *r;
    18b0:	0015c703          	lbu	a4,1(a1)
    18b4:	4501                	li	a0,0
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	8082                	ret
    18ba:	0005c703          	lbu	a4,0(a1)
    18be:	4501                	li	a0,0
    18c0:	b7e5                	j	18a8 <strncmp+0x30>

00000000000018c2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c2:	00757793          	and	a5,a0,7
    18c6:	cf89                	beqz	a5,18e0 <strlen+0x1e>
    18c8:	87aa                	mv	a5,a0
    18ca:	a029                	j	18d4 <strlen+0x12>
    18cc:	0785                	add	a5,a5,1
    18ce:	0077f713          	and	a4,a5,7
    18d2:	cb01                	beqz	a4,18e2 <strlen+0x20>
        if (!*s)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	fb75                	bnez	a4,18cc <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18da:	40a78533          	sub	a0,a5,a0
}
    18de:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e2:	6394                	ld	a3,0(a5)
    18e4:	00000597          	auipc	a1,0x0
    18e8:	7045b583          	ld	a1,1796(a1) # 1fe8 <__clone+0xec>
    18ec:	00000617          	auipc	a2,0x0
    18f0:	70463603          	ld	a2,1796(a2) # 1ff0 <__clone+0xf4>
    18f4:	a019                	j	18fa <strlen+0x38>
    18f6:	6794                	ld	a3,8(a5)
    18f8:	07a1                	add	a5,a5,8
    18fa:	00b68733          	add	a4,a3,a1
    18fe:	fff6c693          	not	a3,a3
    1902:	8f75                	and	a4,a4,a3
    1904:	8f71                	and	a4,a4,a2
    1906:	db65                	beqz	a4,18f6 <strlen+0x34>
    for (; *s; s++)
    1908:	0007c703          	lbu	a4,0(a5)
    190c:	d779                	beqz	a4,18da <strlen+0x18>
    190e:	0017c703          	lbu	a4,1(a5)
    1912:	0785                	add	a5,a5,1
    1914:	d379                	beqz	a4,18da <strlen+0x18>
    1916:	0017c703          	lbu	a4,1(a5)
    191a:	0785                	add	a5,a5,1
    191c:	fb6d                	bnez	a4,190e <strlen+0x4c>
    191e:	bf75                	j	18da <strlen+0x18>

0000000000001920 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1920:	00757713          	and	a4,a0,7
{
    1924:	87aa                	mv	a5,a0
    1926:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192a:	cb19                	beqz	a4,1940 <memchr+0x20>
    192c:	ce25                	beqz	a2,19a4 <memchr+0x84>
    192e:	0007c703          	lbu	a4,0(a5)
    1932:	00b70763          	beq	a4,a1,1940 <memchr+0x20>
    1936:	0785                	add	a5,a5,1
    1938:	0077f713          	and	a4,a5,7
    193c:	167d                	add	a2,a2,-1
    193e:	f77d                	bnez	a4,192c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1940:	4501                	li	a0,0
    if (n && *s != c)
    1942:	c235                	beqz	a2,19a6 <memchr+0x86>
    1944:	0007c703          	lbu	a4,0(a5)
    1948:	06b70063          	beq	a4,a1,19a8 <memchr+0x88>
        size_t k = ONES * c;
    194c:	00000517          	auipc	a0,0x0
    1950:	6ac53503          	ld	a0,1708(a0) # 1ff8 <__clone+0xfc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1954:	471d                	li	a4,7
        size_t k = ONES * c;
    1956:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195a:	04c77763          	bgeu	a4,a2,19a8 <memchr+0x88>
    195e:	00000897          	auipc	a7,0x0
    1962:	68a8b883          	ld	a7,1674(a7) # 1fe8 <__clone+0xec>
    1966:	00000817          	auipc	a6,0x0
    196a:	68a83803          	ld	a6,1674(a6) # 1ff0 <__clone+0xf4>
    196e:	431d                	li	t1,7
    1970:	a029                	j	197a <memchr+0x5a>
    1972:	1661                	add	a2,a2,-8
    1974:	07a1                	add	a5,a5,8
    1976:	00c37c63          	bgeu	t1,a2,198e <memchr+0x6e>
    197a:	6398                	ld	a4,0(a5)
    197c:	8f29                	xor	a4,a4,a0
    197e:	011706b3          	add	a3,a4,a7
    1982:	fff74713          	not	a4,a4
    1986:	8f75                	and	a4,a4,a3
    1988:	01077733          	and	a4,a4,a6
    198c:	d37d                	beqz	a4,1972 <memchr+0x52>
    198e:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1990:	e601                	bnez	a2,1998 <memchr+0x78>
    1992:	a809                	j	19a4 <memchr+0x84>
    1994:	0505                	add	a0,a0,1
    1996:	c619                	beqz	a2,19a4 <memchr+0x84>
    1998:	00054783          	lbu	a5,0(a0)
    199c:	167d                	add	a2,a2,-1
    199e:	feb79be3          	bne	a5,a1,1994 <memchr+0x74>
    19a2:	8082                	ret
    return n ? (void *)s : 0;
    19a4:	4501                	li	a0,0
}
    19a6:	8082                	ret
    if (n && *s != c)
    19a8:	853e                	mv	a0,a5
    19aa:	b7fd                	j	1998 <memchr+0x78>

00000000000019ac <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ac:	1101                	add	sp,sp,-32
    19ae:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b0:	862e                	mv	a2,a1
{
    19b2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b4:	4581                	li	a1,0
{
    19b6:	e426                	sd	s1,8(sp)
    19b8:	ec06                	sd	ra,24(sp)
    19ba:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19bc:	f65ff0ef          	jal	1920 <memchr>
    return p ? p - s : n;
    19c0:	c519                	beqz	a0,19ce <strnlen+0x22>
}
    19c2:	60e2                	ld	ra,24(sp)
    19c4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c6:	8d05                	sub	a0,a0,s1
}
    19c8:	64a2                	ld	s1,8(sp)
    19ca:	6105                	add	sp,sp,32
    19cc:	8082                	ret
    19ce:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d0:	8522                	mv	a0,s0
}
    19d2:	6442                	ld	s0,16(sp)
    19d4:	64a2                	ld	s1,8(sp)
    19d6:	6105                	add	sp,sp,32
    19d8:	8082                	ret

00000000000019da <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19da:	00a5c7b3          	xor	a5,a1,a0
    19de:	8b9d                	and	a5,a5,7
    19e0:	eb95                	bnez	a5,1a14 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e2:	0075f793          	and	a5,a1,7
    19e6:	e7b1                	bnez	a5,1a32 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19e8:	6198                	ld	a4,0(a1)
    19ea:	00000617          	auipc	a2,0x0
    19ee:	5fe63603          	ld	a2,1534(a2) # 1fe8 <__clone+0xec>
    19f2:	00000817          	auipc	a6,0x0
    19f6:	5fe83803          	ld	a6,1534(a6) # 1ff0 <__clone+0xf4>
    19fa:	a029                	j	1a04 <strcpy+0x2a>
    19fc:	05a1                	add	a1,a1,8
    19fe:	e118                	sd	a4,0(a0)
    1a00:	6198                	ld	a4,0(a1)
    1a02:	0521                	add	a0,a0,8
    1a04:	00c707b3          	add	a5,a4,a2
    1a08:	fff74693          	not	a3,a4
    1a0c:	8ff5                	and	a5,a5,a3
    1a0e:	0107f7b3          	and	a5,a5,a6
    1a12:	d7ed                	beqz	a5,19fc <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a14:	0005c783          	lbu	a5,0(a1)
    1a18:	00f50023          	sb	a5,0(a0)
    1a1c:	c785                	beqz	a5,1a44 <strcpy+0x6a>
    1a1e:	0015c783          	lbu	a5,1(a1)
    1a22:	0505                	add	a0,a0,1
    1a24:	0585                	add	a1,a1,1
    1a26:	00f50023          	sb	a5,0(a0)
    1a2a:	fbf5                	bnez	a5,1a1e <strcpy+0x44>
        ;
    return d;
}
    1a2c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a2e:	0505                	add	a0,a0,1
    1a30:	df45                	beqz	a4,19e8 <strcpy+0xe>
            if (!(*d = *s))
    1a32:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a36:	0585                	add	a1,a1,1
    1a38:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a3c:	00f50023          	sb	a5,0(a0)
    1a40:	f7fd                	bnez	a5,1a2e <strcpy+0x54>
}
    1a42:	8082                	ret
    1a44:	8082                	ret

0000000000001a46 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a46:	00a5c7b3          	xor	a5,a1,a0
    1a4a:	8b9d                	and	a5,a5,7
    1a4c:	e3b5                	bnez	a5,1ab0 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a4e:	0075f793          	and	a5,a1,7
    1a52:	cf99                	beqz	a5,1a70 <strncpy+0x2a>
    1a54:	ea09                	bnez	a2,1a66 <strncpy+0x20>
    1a56:	a421                	j	1c5e <strncpy+0x218>
    1a58:	0585                	add	a1,a1,1
    1a5a:	0075f793          	and	a5,a1,7
    1a5e:	167d                	add	a2,a2,-1
    1a60:	0505                	add	a0,a0,1
    1a62:	c799                	beqz	a5,1a70 <strncpy+0x2a>
    1a64:	c225                	beqz	a2,1ac4 <strncpy+0x7e>
    1a66:	0005c783          	lbu	a5,0(a1)
    1a6a:	00f50023          	sb	a5,0(a0)
    1a6e:	f7ed                	bnez	a5,1a58 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a70:	ca31                	beqz	a2,1ac4 <strncpy+0x7e>
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	cba1                	beqz	a5,1ac6 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a78:	479d                	li	a5,7
    1a7a:	02c7fc63          	bgeu	a5,a2,1ab2 <strncpy+0x6c>
    1a7e:	00000897          	auipc	a7,0x0
    1a82:	56a8b883          	ld	a7,1386(a7) # 1fe8 <__clone+0xec>
    1a86:	00000817          	auipc	a6,0x0
    1a8a:	56a83803          	ld	a6,1386(a6) # 1ff0 <__clone+0xf4>
    1a8e:	431d                	li	t1,7
    1a90:	a039                	j	1a9e <strncpy+0x58>
            *wd = *ws;
    1a92:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a94:	1661                	add	a2,a2,-8
    1a96:	05a1                	add	a1,a1,8
    1a98:	0521                	add	a0,a0,8
    1a9a:	00c37b63          	bgeu	t1,a2,1ab0 <strncpy+0x6a>
    1a9e:	6198                	ld	a4,0(a1)
    1aa0:	011707b3          	add	a5,a4,a7
    1aa4:	fff74693          	not	a3,a4
    1aa8:	8ff5                	and	a5,a5,a3
    1aaa:	0107f7b3          	and	a5,a5,a6
    1aae:	d3f5                	beqz	a5,1a92 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ab0:	ca11                	beqz	a2,1ac4 <strncpy+0x7e>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	0585                	add	a1,a1,1
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	c789                	beqz	a5,1ac6 <strncpy+0x80>
    1abe:	167d                	add	a2,a2,-1
    1ac0:	0505                	add	a0,a0,1
    1ac2:	fa65                	bnez	a2,1ab2 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac4:	8082                	ret
    1ac6:	4805                	li	a6,1
    1ac8:	14061b63          	bnez	a2,1c1e <strncpy+0x1d8>
    1acc:	40a00733          	neg	a4,a0
    1ad0:	00777793          	and	a5,a4,7
    1ad4:	4581                	li	a1,0
    1ad6:	12061c63          	bnez	a2,1c0e <strncpy+0x1c8>
    1ada:	00778693          	add	a3,a5,7
    1ade:	48ad                	li	a7,11
    1ae0:	1316e563          	bltu	a3,a7,1c0a <strncpy+0x1c4>
    1ae4:	16d5e263          	bltu	a1,a3,1c48 <strncpy+0x202>
    1ae8:	14078c63          	beqz	a5,1c40 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aec:	00050023          	sb	zero,0(a0)
    1af0:	00677693          	and	a3,a4,6
    1af4:	14068263          	beqz	a3,1c38 <strncpy+0x1f2>
    1af8:	000500a3          	sb	zero,1(a0)
    1afc:	4689                	li	a3,2
    1afe:	14f6f863          	bgeu	a3,a5,1c4e <strncpy+0x208>
    1b02:	00050123          	sb	zero,2(a0)
    1b06:	8b11                	and	a4,a4,4
    1b08:	12070463          	beqz	a4,1c30 <strncpy+0x1ea>
    1b0c:	000501a3          	sb	zero,3(a0)
    1b10:	4711                	li	a4,4
    1b12:	00450693          	add	a3,a0,4
    1b16:	02f77563          	bgeu	a4,a5,1b40 <strncpy+0xfa>
    1b1a:	00050223          	sb	zero,4(a0)
    1b1e:	4715                	li	a4,5
    1b20:	00550693          	add	a3,a0,5
    1b24:	00e78e63          	beq	a5,a4,1b40 <strncpy+0xfa>
    1b28:	fff50713          	add	a4,a0,-1
    1b2c:	000502a3          	sb	zero,5(a0)
    1b30:	8b1d                	and	a4,a4,7
    1b32:	12071263          	bnez	a4,1c56 <strncpy+0x210>
    1b36:	00750693          	add	a3,a0,7
    1b3a:	00050323          	sb	zero,6(a0)
    1b3e:	471d                	li	a4,7
    1b40:	40f80833          	sub	a6,a6,a5
    1b44:	ff887593          	and	a1,a6,-8
    1b48:	97aa                	add	a5,a5,a0
    1b4a:	95be                	add	a1,a1,a5
    1b4c:	0007b023          	sd	zero,0(a5)
    1b50:	07a1                	add	a5,a5,8
    1b52:	feb79de3          	bne	a5,a1,1b4c <strncpy+0x106>
    1b56:	ff887593          	and	a1,a6,-8
    1b5a:	00787813          	and	a6,a6,7
    1b5e:	00e587bb          	addw	a5,a1,a4
    1b62:	00b68733          	add	a4,a3,a1
    1b66:	0e080063          	beqz	a6,1c46 <strncpy+0x200>
    1b6a:	00070023          	sb	zero,0(a4)
    1b6e:	0017869b          	addw	a3,a5,1
    1b72:	f4c6f9e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1b76:	000700a3          	sb	zero,1(a4)
    1b7a:	0027869b          	addw	a3,a5,2
    1b7e:	f4c6f3e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1b82:	00070123          	sb	zero,2(a4)
    1b86:	0037869b          	addw	a3,a5,3
    1b8a:	f2c6fde3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1b8e:	000701a3          	sb	zero,3(a4)
    1b92:	0047869b          	addw	a3,a5,4
    1b96:	f2c6f7e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1b9a:	00070223          	sb	zero,4(a4)
    1b9e:	0057869b          	addw	a3,a5,5
    1ba2:	f2c6f1e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1ba6:	000702a3          	sb	zero,5(a4)
    1baa:	0067869b          	addw	a3,a5,6
    1bae:	f0c6fbe3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bb2:	00070323          	sb	zero,6(a4)
    1bb6:	0077869b          	addw	a3,a5,7
    1bba:	f0c6f5e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bbe:	000703a3          	sb	zero,7(a4)
    1bc2:	0087869b          	addw	a3,a5,8
    1bc6:	eec6ffe3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bca:	00070423          	sb	zero,8(a4)
    1bce:	0097869b          	addw	a3,a5,9
    1bd2:	eec6f9e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bd6:	000704a3          	sb	zero,9(a4)
    1bda:	00a7869b          	addw	a3,a5,10
    1bde:	eec6f3e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1be2:	00070523          	sb	zero,10(a4)
    1be6:	00b7869b          	addw	a3,a5,11
    1bea:	ecc6fde3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bee:	000705a3          	sb	zero,11(a4)
    1bf2:	00c7869b          	addw	a3,a5,12
    1bf6:	ecc6f7e3          	bgeu	a3,a2,1ac4 <strncpy+0x7e>
    1bfa:	00070623          	sb	zero,12(a4)
    1bfe:	27b5                	addw	a5,a5,13
    1c00:	ecc7f2e3          	bgeu	a5,a2,1ac4 <strncpy+0x7e>
    1c04:	000706a3          	sb	zero,13(a4)
}
    1c08:	8082                	ret
    1c0a:	46ad                	li	a3,11
    1c0c:	bde1                	j	1ae4 <strncpy+0x9e>
    1c0e:	00778693          	add	a3,a5,7
    1c12:	48ad                	li	a7,11
    1c14:	fff60593          	add	a1,a2,-1
    1c18:	ed16f6e3          	bgeu	a3,a7,1ae4 <strncpy+0x9e>
    1c1c:	b7fd                	j	1c0a <strncpy+0x1c4>
    1c1e:	40a00733          	neg	a4,a0
    1c22:	8832                	mv	a6,a2
    1c24:	00777793          	and	a5,a4,7
    1c28:	4581                	li	a1,0
    1c2a:	ea0608e3          	beqz	a2,1ada <strncpy+0x94>
    1c2e:	b7c5                	j	1c0e <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c30:	00350693          	add	a3,a0,3
    1c34:	470d                	li	a4,3
    1c36:	b729                	j	1b40 <strncpy+0xfa>
    1c38:	00150693          	add	a3,a0,1
    1c3c:	4705                	li	a4,1
    1c3e:	b709                	j	1b40 <strncpy+0xfa>
tail:
    1c40:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c42:	4701                	li	a4,0
    1c44:	bdf5                	j	1b40 <strncpy+0xfa>
    1c46:	8082                	ret
tail:
    1c48:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4a:	4781                	li	a5,0
    1c4c:	bf39                	j	1b6a <strncpy+0x124>
    1c4e:	00250693          	add	a3,a0,2
    1c52:	4709                	li	a4,2
    1c54:	b5f5                	j	1b40 <strncpy+0xfa>
    1c56:	00650693          	add	a3,a0,6
    1c5a:	4719                	li	a4,6
    1c5c:	b5d5                	j	1b40 <strncpy+0xfa>
    1c5e:	8082                	ret

0000000000001c60 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c60:	87aa                	mv	a5,a0
    1c62:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c64:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c6c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c6e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c70:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <openat>:
    register long a7 __asm__("a7") = n;
    1c78:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c7c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c80:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <close>:
    register long a7 __asm__("a7") = n;
    1c88:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c8c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <read>:
    register long a7 __asm__("a7") = n;
    1c94:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c98:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c9c:	8082                	ret

0000000000001c9e <write>:
    register long a7 __asm__("a7") = n;
    1c9e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ca6:	8082                	ret

0000000000001ca8 <getpid>:
    register long a7 __asm__("a7") = n;
    1ca8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cac:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <getppid>:
    register long a7 __asm__("a7") = n;
    1cb4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cb8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cc0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cc4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <fork>:
    register long a7 __asm__("a7") = n;
    1ccc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cd0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cdc:	85b2                	mv	a1,a2
    1cde:	863a                	mv	a2,a4
    if (stack)
    1ce0:	c191                	beqz	a1,1ce4 <clone+0x8>
	stack += stack_size;
    1ce2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ce4:	4781                	li	a5,0
    1ce6:	4701                	li	a4,0
    1ce8:	4681                	li	a3,0
    1cea:	2601                	sext.w	a2,a2
    1cec:	ac01                	j	1efc <__clone>

0000000000001cee <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cee:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cf2:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cf6:	8082                	ret

0000000000001cf8 <exit>:
    register long a7 __asm__("a7") = n;
    1cf8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cfc:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d00:	8082                	ret

0000000000001d02 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d02:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d06:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d08:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <exec>:
    register long a7 __asm__("a7") = n;
    1d10:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d14:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <execve>:
    register long a7 __asm__("a7") = n;
    1d1c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d20:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <times>:
    register long a7 __asm__("a7") = n;
    1d28:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d2c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <get_time>:

int64 get_time()
{
    1d34:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d36:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d3a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d42:	2501                	sext.w	a0,a0
    1d44:	ed09                	bnez	a0,1d5e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d46:	67a2                	ld	a5,8(sp)
    1d48:	3e800713          	li	a4,1000
    1d4c:	00015503          	lhu	a0,0(sp)
    1d50:	02e7d7b3          	divu	a5,a5,a4
    1d54:	02e50533          	mul	a0,a0,a4
    1d58:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d5a:	0141                	add	sp,sp,16
    1d5c:	8082                	ret
        return -1;
    1d5e:	557d                	li	a0,-1
    1d60:	bfed                	j	1d5a <get_time+0x26>

0000000000001d62 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d62:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d66:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <time>:
    register long a7 __asm__("a7") = n;
    1d6e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <sleep>:

int sleep(unsigned long long time)
{
    1d7a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d7c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d7e:	850a                	mv	a0,sp
    1d80:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d82:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d86:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d8c:	e501                	bnez	a0,1d94 <sleep+0x1a>
    return 0;
    1d8e:	4501                	li	a0,0
}
    1d90:	0141                	add	sp,sp,16
    1d92:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d94:	4502                	lw	a0,0(sp)
}
    1d96:	0141                	add	sp,sp,16
    1d98:	8082                	ret

0000000000001d9a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d9a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1da6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1daa:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dae:	8082                	ret

0000000000001db0 <mprotect>:
    register long a7 __asm__("a7") = n;
    1db0:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <munmap>:
    register long a7 __asm__("a7") = n;
    1dbc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <wait>:

int wait(int *code)
{
    1dc8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dca:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dce:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dd0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <spawn>:
    register long a7 __asm__("a7") = n;
    1ddc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <mailread>:
    register long a7 __asm__("a7") = n;
    1de8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <fstat>:
    register long a7 __asm__("a7") = n;
    1e00:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e04:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e0c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0e:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e12:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e1c:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e1e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e22:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e24:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e2c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e2e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e32:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e34:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <link>:

int link(char *old_path, char *new_path)
{
    1e3c:	87aa                	mv	a5,a0
    1e3e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e40:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e44:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e48:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e4a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e4e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e50:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <unlink>:

int unlink(char *path)
{
    1e58:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e5a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e5e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e62:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e64:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <uname>:
    register long a7 __asm__("a7") = n;
    1e6c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <brk>:
    register long a7 __asm__("a7") = n;
    1e78:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e84:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e86:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e8a:	8082                	ret

0000000000001e8c <chdir>:
    register long a7 __asm__("a7") = n;
    1e8c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e90:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e98:	862e                	mv	a2,a1
    1e9a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e9c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e9e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ea2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ea6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ea8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <getdents>:
    register long a7 __asm__("a7") = n;
    1eb2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <pipe>:
    register long a7 __asm__("a7") = n;
    1ebe:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ec2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <dup>:
    register long a7 __asm__("a7") = n;
    1ecc:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ece:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <dup2>:
    register long a7 __asm__("a7") = n;
    1ed6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ed8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eda:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <mount>:
    register long a7 __asm__("a7") = n;
    1ee2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <umount>:
    register long a7 __asm__("a7") = n;
    1eee:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ef2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1efc:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1efe:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f00:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f02:	8532                	mv	a0,a2
	mv a2, a4
    1f04:	863a                	mv	a2,a4
	mv a3, a5
    1f06:	86be                	mv	a3,a5
	mv a4, a6
    1f08:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f0a:	0dc00893          	li	a7,220
	ecall
    1f0e:	00000073          	ecall

	beqz a0, 1f
    1f12:	c111                	beqz	a0,1f16 <__clone+0x1a>
	# Parent
	ret
    1f14:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f16:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f18:	6522                	ld	a0,8(sp)
	jalr a1
    1f1a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f1c:	05d00893          	li	a7,93
	ecall
    1f20:	00000073          	ecall
