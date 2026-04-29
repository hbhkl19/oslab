
/home/hbh/oslab/oslab/user/build/riscv64/yield:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_yield>:

/*
理想结果：三个子进程交替输出
*/

int test_yield(){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eda50513          	add	a0,a0,-294 # 1ee0 <__clone+0x28>
int test_yield(){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	e44e                	sd	s3,8(sp)
    1014:	ec26                	sd	s1,24(sp)
    1016:	e84a                	sd	s2,16(sp)
    TEST_START(__func__);
    1018:	2fc000ef          	jal	1314 <puts>
    101c:	00001517          	auipc	a0,0x1
    1020:	f4c50513          	add	a0,a0,-180 # 1f68 <__func__.0>
    1024:	2f0000ef          	jal	1314 <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	ed050513          	add	a0,a0,-304 # 1ef8 <__clone+0x40>
    1030:	2e4000ef          	jal	1314 <puts>

    for (int i = 0; i < 3; ++i){
    1034:	4401                	li	s0,0
    1036:	498d                	li	s3,3
        if(fork() == 0){
    1038:	451000ef          	jal	1c88 <fork>
    103c:	c521                	beqz	a0,1084 <test_yield+0x80>
    for (int i = 0; i < 3; ++i){
    103e:	2405                	addw	s0,s0,1
    1040:	ff341ce3          	bne	s0,s3,1038 <test_yield+0x34>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
	    }
	    exit(0);
        }
    }
    wait(NULL);
    1044:	4501                	li	a0,0
    1046:	53f000ef          	jal	1d84 <wait>
    wait(NULL);
    104a:	4501                	li	a0,0
    104c:	539000ef          	jal	1d84 <wait>
    wait(NULL);
    1050:	4501                	li	a0,0
    1052:	533000ef          	jal	1d84 <wait>
    TEST_END(__func__);
    1056:	00001517          	auipc	a0,0x1
    105a:	ee250513          	add	a0,a0,-286 # 1f38 <__clone+0x80>
    105e:	2b6000ef          	jal	1314 <puts>
    1062:	00001517          	auipc	a0,0x1
    1066:	f0650513          	add	a0,a0,-250 # 1f68 <__func__.0>
    106a:	2aa000ef          	jal	1314 <puts>
}
    106e:	7402                	ld	s0,32(sp)
    1070:	70a2                	ld	ra,40(sp)
    1072:	64e2                	ld	s1,24(sp)
    1074:	6942                	ld	s2,16(sp)
    1076:	69a2                	ld	s3,8(sp)
    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	e8050513          	add	a0,a0,-384 # 1ef8 <__clone+0x40>
}
    1080:	6145                	add	sp,sp,48
    TEST_END(__func__);
    1082:	ac49                	j	1314 <puts>
    1084:	4495                	li	s1,5
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1086:	00001917          	auipc	s2,0x1
    108a:	e8290913          	add	s2,s2,-382 # 1f08 <__clone+0x50>
                sched_yield();
    108e:	3ef000ef          	jal	1c7c <sched_yield>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1092:	3d3000ef          	jal	1c64 <getpid>
    1096:	85aa                	mv	a1,a0
	    for (int j = 0; j< 5; ++j){
    1098:	34fd                	addw	s1,s1,-1
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    109a:	8622                	mv	a2,s0
    109c:	854a                	mv	a0,s2
    109e:	298000ef          	jal	1336 <printf>
	    for (int j = 0; j< 5; ++j){
    10a2:	f4f5                	bnez	s1,108e <test_yield+0x8a>
	    exit(0);
    10a4:	4501                	li	a0,0
    10a6:	40f000ef          	jal	1cb4 <exit>
    10aa:	bf51                	j	103e <test_yield+0x3a>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	add	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
    test_yield();
    10b0:	f55ff0ef          	jal	1004 <test_yield>
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
    10ca:	3eb000ef          	jal	1cb4 <exit>
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
    10e6:	e9668693          	add	a3,a3,-362 # 1f78 <digits>
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
    1200:	25b000ef          	jal	1c5a <write>
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
    1216:	d6668693          	add	a3,a3,-666 # 1f78 <digits>
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
    12e8:	169000ef          	jal	1c50 <read>
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
    1308:	153000ef          	jal	1c5a <write>
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
    131c:	562000ef          	jal	187e <strlen>
    1320:	862a                	mv	a2,a0
    1322:	85a2                	mv	a1,s0
    1324:	4505                	li	a0,1
    1326:	135000ef          	jal	1c5a <write>
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
    1370:	c0c98993          	add	s3,s3,-1012 # 1f78 <digits>
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
    1396:	0c5000ef          	jal	1c5a <write>
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
    14dc:	77e000ef          	jal	1c5a <write>
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
    153a:	720000ef          	jal	1c5a <write>
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
    1556:	412000ef          	jal	1968 <strnlen>
    write(f, s, l);
    155a:	0005061b          	sext.w	a2,a0
    155e:	85a2                	mv	a1,s0
    1560:	4505                	li	a0,1
    1562:	6f8000ef          	jal	1c5a <write>
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
    1576:	6e4000ef          	jal	1c5a <write>
    char byte = c;
    157a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	add	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1588:	6d2000ef          	jal	1c5a <write>
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
    15aa:	9a240413          	add	s0,s0,-1630 # 1f48 <__clone+0x90>
    15ae:	b74d                	j	1550 <printf+0x21a>

00000000000015b0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	02000793          	li	a5,32
    15b4:	00f50663          	beq	a0,a5,15c0 <isspace+0x10>
    15b8:	355d                	addw	a0,a0,-9
    15ba:	00553513          	sltiu	a0,a0,5
    15be:	8082                	ret
    15c0:	4505                	li	a0,1
}
    15c2:	8082                	ret

00000000000015c4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c4:	fd05051b          	addw	a0,a0,-48
}
    15c8:	00a53513          	sltiu	a0,a0,10
    15cc:	8082                	ret

00000000000015ce <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ce:	02000693          	li	a3,32
    15d2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d8:	ff77871b          	addw	a4,a5,-9
    15dc:	04d78c63          	beq	a5,a3,1634 <atoi+0x66>
    15e0:	0007861b          	sext.w	a2,a5
    15e4:	04e5f863          	bgeu	a1,a4,1634 <atoi+0x66>
        s++;
    switch (*s)
    15e8:	02b00713          	li	a4,43
    15ec:	04e78963          	beq	a5,a4,163e <atoi+0x70>
    15f0:	02d00713          	li	a4,45
    15f4:	06e78263          	beq	a5,a4,1658 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f8:	fd06069b          	addw	a3,a2,-48
    15fc:	47a5                	li	a5,9
    15fe:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1600:	4301                	li	t1,0
    while (isdigit(*s))
    1602:	04d7e963          	bltu	a5,a3,1654 <atoi+0x86>
    int n = 0, neg = 0;
    1606:	4501                	li	a0,0
    while (isdigit(*s))
    1608:	48a5                	li	a7,9
    160a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    160e:	0025179b          	sllw	a5,a0,0x2
    1612:	9fa9                	addw	a5,a5,a0
    1614:	fd06059b          	addw	a1,a2,-48
    1618:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    161c:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1620:	0705                	add	a4,a4,1
    1622:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1626:	0006861b          	sext.w	a2,a3
    162a:	ff08f0e3          	bgeu	a7,a6,160a <atoi+0x3c>
    return neg ? n : -n;
    162e:	00030563          	beqz	t1,1638 <atoi+0x6a>
}
    1632:	8082                	ret
        s++;
    1634:	0505                	add	a0,a0,1
    1636:	bf79                	j	15d4 <atoi+0x6>
    return neg ? n : -n;
    1638:	40f5853b          	subw	a0,a1,a5
    163c:	8082                	ret
    while (isdigit(*s))
    163e:	00154603          	lbu	a2,1(a0)
    1642:	47a5                	li	a5,9
        s++;
    1644:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1648:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    164c:	4301                	li	t1,0
    while (isdigit(*s))
    164e:	2601                	sext.w	a2,a2
    1650:	fad7fbe3          	bgeu	a5,a3,1606 <atoi+0x38>
    1654:	4501                	li	a0,0
}
    1656:	8082                	ret
    while (isdigit(*s))
    1658:	00154603          	lbu	a2,1(a0)
    165c:	47a5                	li	a5,9
        s++;
    165e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1662:	fd06069b          	addw	a3,a2,-48
    1666:	2601                	sext.w	a2,a2
    1668:	fed7e6e3          	bltu	a5,a3,1654 <atoi+0x86>
        neg = 1;
    166c:	4305                	li	t1,1
    166e:	bf61                	j	1606 <atoi+0x38>

0000000000001670 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1670:	18060163          	beqz	a2,17f2 <memset+0x182>
    1674:	40a006b3          	neg	a3,a0
    1678:	0076f793          	and	a5,a3,7
    167c:	00778813          	add	a6,a5,7
    1680:	48ad                	li	a7,11
    1682:	0ff5f713          	zext.b	a4,a1
    1686:	fff60593          	add	a1,a2,-1
    168a:	17186563          	bltu	a6,a7,17f4 <memset+0x184>
    168e:	1705ed63          	bltu	a1,a6,1808 <memset+0x198>
    1692:	16078363          	beqz	a5,17f8 <memset+0x188>
    1696:	00e50023          	sb	a4,0(a0)
    169a:	0066f593          	and	a1,a3,6
    169e:	16058063          	beqz	a1,17fe <memset+0x18e>
    16a2:	00e500a3          	sb	a4,1(a0)
    16a6:	4589                	li	a1,2
    16a8:	16f5f363          	bgeu	a1,a5,180e <memset+0x19e>
    16ac:	00e50123          	sb	a4,2(a0)
    16b0:	8a91                	and	a3,a3,4
    16b2:	00350593          	add	a1,a0,3
    16b6:	4e0d                	li	t3,3
    16b8:	ce9d                	beqz	a3,16f6 <memset+0x86>
    16ba:	00e501a3          	sb	a4,3(a0)
    16be:	4691                	li	a3,4
    16c0:	00450593          	add	a1,a0,4
    16c4:	4e11                	li	t3,4
    16c6:	02f6f863          	bgeu	a3,a5,16f6 <memset+0x86>
    16ca:	00e50223          	sb	a4,4(a0)
    16ce:	4695                	li	a3,5
    16d0:	00550593          	add	a1,a0,5
    16d4:	4e15                	li	t3,5
    16d6:	02d78063          	beq	a5,a3,16f6 <memset+0x86>
    16da:	fff50693          	add	a3,a0,-1
    16de:	00e502a3          	sb	a4,5(a0)
    16e2:	8a9d                	and	a3,a3,7
    16e4:	00650593          	add	a1,a0,6
    16e8:	4e19                	li	t3,6
    16ea:	e691                	bnez	a3,16f6 <memset+0x86>
    16ec:	00750593          	add	a1,a0,7
    16f0:	00e50323          	sb	a4,6(a0)
    16f4:	4e1d                	li	t3,7
    16f6:	00871693          	sll	a3,a4,0x8
    16fa:	01071813          	sll	a6,a4,0x10
    16fe:	8ed9                	or	a3,a3,a4
    1700:	01871893          	sll	a7,a4,0x18
    1704:	0106e6b3          	or	a3,a3,a6
    1708:	0116e6b3          	or	a3,a3,a7
    170c:	02071813          	sll	a6,a4,0x20
    1710:	02871313          	sll	t1,a4,0x28
    1714:	0106e6b3          	or	a3,a3,a6
    1718:	40f608b3          	sub	a7,a2,a5
    171c:	03071813          	sll	a6,a4,0x30
    1720:	0066e6b3          	or	a3,a3,t1
    1724:	0106e6b3          	or	a3,a3,a6
    1728:	03871313          	sll	t1,a4,0x38
    172c:	97aa                	add	a5,a5,a0
    172e:	ff88f813          	and	a6,a7,-8
    1732:	0066e6b3          	or	a3,a3,t1
    1736:	983e                	add	a6,a6,a5
    1738:	e394                	sd	a3,0(a5)
    173a:	07a1                	add	a5,a5,8
    173c:	ff079ee3          	bne	a5,a6,1738 <memset+0xc8>
    1740:	ff88f793          	and	a5,a7,-8
    1744:	0078f893          	and	a7,a7,7
    1748:	00f586b3          	add	a3,a1,a5
    174c:	01c787bb          	addw	a5,a5,t3
    1750:	0a088b63          	beqz	a7,1806 <memset+0x196>
    1754:	00e68023          	sb	a4,0(a3)
    1758:	0017859b          	addw	a1,a5,1
    175c:	08c5fb63          	bgeu	a1,a2,17f2 <memset+0x182>
    1760:	00e680a3          	sb	a4,1(a3)
    1764:	0027859b          	addw	a1,a5,2
    1768:	08c5f563          	bgeu	a1,a2,17f2 <memset+0x182>
    176c:	00e68123          	sb	a4,2(a3)
    1770:	0037859b          	addw	a1,a5,3
    1774:	06c5ff63          	bgeu	a1,a2,17f2 <memset+0x182>
    1778:	00e681a3          	sb	a4,3(a3)
    177c:	0047859b          	addw	a1,a5,4
    1780:	06c5f963          	bgeu	a1,a2,17f2 <memset+0x182>
    1784:	00e68223          	sb	a4,4(a3)
    1788:	0057859b          	addw	a1,a5,5
    178c:	06c5f363          	bgeu	a1,a2,17f2 <memset+0x182>
    1790:	00e682a3          	sb	a4,5(a3)
    1794:	0067859b          	addw	a1,a5,6
    1798:	04c5fd63          	bgeu	a1,a2,17f2 <memset+0x182>
    179c:	00e68323          	sb	a4,6(a3)
    17a0:	0077859b          	addw	a1,a5,7
    17a4:	04c5f763          	bgeu	a1,a2,17f2 <memset+0x182>
    17a8:	00e683a3          	sb	a4,7(a3)
    17ac:	0087859b          	addw	a1,a5,8
    17b0:	04c5f163          	bgeu	a1,a2,17f2 <memset+0x182>
    17b4:	00e68423          	sb	a4,8(a3)
    17b8:	0097859b          	addw	a1,a5,9
    17bc:	02c5fb63          	bgeu	a1,a2,17f2 <memset+0x182>
    17c0:	00e684a3          	sb	a4,9(a3)
    17c4:	00a7859b          	addw	a1,a5,10
    17c8:	02c5f563          	bgeu	a1,a2,17f2 <memset+0x182>
    17cc:	00e68523          	sb	a4,10(a3)
    17d0:	00b7859b          	addw	a1,a5,11
    17d4:	00c5ff63          	bgeu	a1,a2,17f2 <memset+0x182>
    17d8:	00e685a3          	sb	a4,11(a3)
    17dc:	00c7859b          	addw	a1,a5,12
    17e0:	00c5f963          	bgeu	a1,a2,17f2 <memset+0x182>
    17e4:	00e68623          	sb	a4,12(a3)
    17e8:	27b5                	addw	a5,a5,13
    17ea:	00c7f463          	bgeu	a5,a2,17f2 <memset+0x182>
    17ee:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f2:	8082                	ret
    17f4:	482d                	li	a6,11
    17f6:	bd61                	j	168e <memset+0x1e>
    char *p = dest;
    17f8:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fa:	4e01                	li	t3,0
    17fc:	bded                	j	16f6 <memset+0x86>
    17fe:	00150593          	add	a1,a0,1
    1802:	4e05                	li	t3,1
    1804:	bdcd                	j	16f6 <memset+0x86>
    1806:	8082                	ret
    char *p = dest;
    1808:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180a:	4781                	li	a5,0
    180c:	b7a1                	j	1754 <memset+0xe4>
    180e:	00250593          	add	a1,a0,2
    1812:	4e09                	li	t3,2
    1814:	b5cd                	j	16f6 <memset+0x86>

0000000000001816 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1816:	00054783          	lbu	a5,0(a0)
    181a:	0005c703          	lbu	a4,0(a1)
    181e:	00e79863          	bne	a5,a4,182e <strcmp+0x18>
    1822:	0505                	add	a0,a0,1
    1824:	0585                	add	a1,a1,1
    1826:	fbe5                	bnez	a5,1816 <strcmp>
    1828:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182a:	9d19                	subw	a0,a0,a4
    182c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    182e:	0007851b          	sext.w	a0,a5
    1832:	bfe5                	j	182a <strcmp+0x14>

0000000000001834 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1834:	ca15                	beqz	a2,1868 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1836:	00054783          	lbu	a5,0(a0)
    if (!n--)
    183a:	167d                	add	a2,a2,-1
    183c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1840:	eb99                	bnez	a5,1856 <strncmp+0x22>
    1842:	a815                	j	1876 <strncmp+0x42>
    1844:	00a68e63          	beq	a3,a0,1860 <strncmp+0x2c>
    1848:	0505                	add	a0,a0,1
    184a:	00f71b63          	bne	a4,a5,1860 <strncmp+0x2c>
    184e:	00054783          	lbu	a5,0(a0)
    1852:	cf89                	beqz	a5,186c <strncmp+0x38>
    1854:	85b2                	mv	a1,a2
    1856:	0005c703          	lbu	a4,0(a1)
    185a:	00158613          	add	a2,a1,1
    185e:	f37d                	bnez	a4,1844 <strncmp+0x10>
        ;
    return *l - *r;
    1860:	0007851b          	sext.w	a0,a5
    1864:	9d19                	subw	a0,a0,a4
    1866:	8082                	ret
        return 0;
    1868:	4501                	li	a0,0
}
    186a:	8082                	ret
    return *l - *r;
    186c:	0015c703          	lbu	a4,1(a1)
    1870:	4501                	li	a0,0
    1872:	9d19                	subw	a0,a0,a4
    1874:	8082                	ret
    1876:	0005c703          	lbu	a4,0(a1)
    187a:	4501                	li	a0,0
    187c:	b7e5                	j	1864 <strncmp+0x30>

000000000000187e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    187e:	00757793          	and	a5,a0,7
    1882:	cf89                	beqz	a5,189c <strlen+0x1e>
    1884:	87aa                	mv	a5,a0
    1886:	a029                	j	1890 <strlen+0x12>
    1888:	0785                	add	a5,a5,1
    188a:	0077f713          	and	a4,a5,7
    188e:	cb01                	beqz	a4,189e <strlen+0x20>
        if (!*s)
    1890:	0007c703          	lbu	a4,0(a5)
    1894:	fb75                	bnez	a4,1888 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1896:	40a78533          	sub	a0,a5,a0
}
    189a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    189c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    189e:	6394                	ld	a3,0(a5)
    18a0:	00000597          	auipc	a1,0x0
    18a4:	6b05b583          	ld	a1,1712(a1) # 1f50 <__clone+0x98>
    18a8:	00000617          	auipc	a2,0x0
    18ac:	6b063603          	ld	a2,1712(a2) # 1f58 <__clone+0xa0>
    18b0:	a019                	j	18b6 <strlen+0x38>
    18b2:	6794                	ld	a3,8(a5)
    18b4:	07a1                	add	a5,a5,8
    18b6:	00b68733          	add	a4,a3,a1
    18ba:	fff6c693          	not	a3,a3
    18be:	8f75                	and	a4,a4,a3
    18c0:	8f71                	and	a4,a4,a2
    18c2:	db65                	beqz	a4,18b2 <strlen+0x34>
    for (; *s; s++)
    18c4:	0007c703          	lbu	a4,0(a5)
    18c8:	d779                	beqz	a4,1896 <strlen+0x18>
    18ca:	0017c703          	lbu	a4,1(a5)
    18ce:	0785                	add	a5,a5,1
    18d0:	d379                	beqz	a4,1896 <strlen+0x18>
    18d2:	0017c703          	lbu	a4,1(a5)
    18d6:	0785                	add	a5,a5,1
    18d8:	fb6d                	bnez	a4,18ca <strlen+0x4c>
    18da:	bf75                	j	1896 <strlen+0x18>

00000000000018dc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18dc:	00757713          	and	a4,a0,7
{
    18e0:	87aa                	mv	a5,a0
    18e2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e6:	cb19                	beqz	a4,18fc <memchr+0x20>
    18e8:	ce25                	beqz	a2,1960 <memchr+0x84>
    18ea:	0007c703          	lbu	a4,0(a5)
    18ee:	00b70763          	beq	a4,a1,18fc <memchr+0x20>
    18f2:	0785                	add	a5,a5,1
    18f4:	0077f713          	and	a4,a5,7
    18f8:	167d                	add	a2,a2,-1
    18fa:	f77d                	bnez	a4,18e8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fc:	4501                	li	a0,0
    if (n && *s != c)
    18fe:	c235                	beqz	a2,1962 <memchr+0x86>
    1900:	0007c703          	lbu	a4,0(a5)
    1904:	06b70063          	beq	a4,a1,1964 <memchr+0x88>
        size_t k = ONES * c;
    1908:	00000517          	auipc	a0,0x0
    190c:	65853503          	ld	a0,1624(a0) # 1f60 <__clone+0xa8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1910:	471d                	li	a4,7
        size_t k = ONES * c;
    1912:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1916:	04c77763          	bgeu	a4,a2,1964 <memchr+0x88>
    191a:	00000897          	auipc	a7,0x0
    191e:	6368b883          	ld	a7,1590(a7) # 1f50 <__clone+0x98>
    1922:	00000817          	auipc	a6,0x0
    1926:	63683803          	ld	a6,1590(a6) # 1f58 <__clone+0xa0>
    192a:	431d                	li	t1,7
    192c:	a029                	j	1936 <memchr+0x5a>
    192e:	1661                	add	a2,a2,-8
    1930:	07a1                	add	a5,a5,8
    1932:	00c37c63          	bgeu	t1,a2,194a <memchr+0x6e>
    1936:	6398                	ld	a4,0(a5)
    1938:	8f29                	xor	a4,a4,a0
    193a:	011706b3          	add	a3,a4,a7
    193e:	fff74713          	not	a4,a4
    1942:	8f75                	and	a4,a4,a3
    1944:	01077733          	and	a4,a4,a6
    1948:	d37d                	beqz	a4,192e <memchr+0x52>
    194a:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    194c:	e601                	bnez	a2,1954 <memchr+0x78>
    194e:	a809                	j	1960 <memchr+0x84>
    1950:	0505                	add	a0,a0,1
    1952:	c619                	beqz	a2,1960 <memchr+0x84>
    1954:	00054783          	lbu	a5,0(a0)
    1958:	167d                	add	a2,a2,-1
    195a:	feb79be3          	bne	a5,a1,1950 <memchr+0x74>
    195e:	8082                	ret
    return n ? (void *)s : 0;
    1960:	4501                	li	a0,0
}
    1962:	8082                	ret
    if (n && *s != c)
    1964:	853e                	mv	a0,a5
    1966:	b7fd                	j	1954 <memchr+0x78>

0000000000001968 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1968:	1101                	add	sp,sp,-32
    196a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    196c:	862e                	mv	a2,a1
{
    196e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1970:	4581                	li	a1,0
{
    1972:	e426                	sd	s1,8(sp)
    1974:	ec06                	sd	ra,24(sp)
    1976:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1978:	f65ff0ef          	jal	18dc <memchr>
    return p ? p - s : n;
    197c:	c519                	beqz	a0,198a <strnlen+0x22>
}
    197e:	60e2                	ld	ra,24(sp)
    1980:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1982:	8d05                	sub	a0,a0,s1
}
    1984:	64a2                	ld	s1,8(sp)
    1986:	6105                	add	sp,sp,32
    1988:	8082                	ret
    198a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    198c:	8522                	mv	a0,s0
}
    198e:	6442                	ld	s0,16(sp)
    1990:	64a2                	ld	s1,8(sp)
    1992:	6105                	add	sp,sp,32
    1994:	8082                	ret

0000000000001996 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1996:	00a5c7b3          	xor	a5,a1,a0
    199a:	8b9d                	and	a5,a5,7
    199c:	eb95                	bnez	a5,19d0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    199e:	0075f793          	and	a5,a1,7
    19a2:	e7b1                	bnez	a5,19ee <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a4:	6198                	ld	a4,0(a1)
    19a6:	00000617          	auipc	a2,0x0
    19aa:	5aa63603          	ld	a2,1450(a2) # 1f50 <__clone+0x98>
    19ae:	00000817          	auipc	a6,0x0
    19b2:	5aa83803          	ld	a6,1450(a6) # 1f58 <__clone+0xa0>
    19b6:	a029                	j	19c0 <strcpy+0x2a>
    19b8:	05a1                	add	a1,a1,8
    19ba:	e118                	sd	a4,0(a0)
    19bc:	6198                	ld	a4,0(a1)
    19be:	0521                	add	a0,a0,8
    19c0:	00c707b3          	add	a5,a4,a2
    19c4:	fff74693          	not	a3,a4
    19c8:	8ff5                	and	a5,a5,a3
    19ca:	0107f7b3          	and	a5,a5,a6
    19ce:	d7ed                	beqz	a5,19b8 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19d0:	0005c783          	lbu	a5,0(a1)
    19d4:	00f50023          	sb	a5,0(a0)
    19d8:	c785                	beqz	a5,1a00 <strcpy+0x6a>
    19da:	0015c783          	lbu	a5,1(a1)
    19de:	0505                	add	a0,a0,1
    19e0:	0585                	add	a1,a1,1
    19e2:	00f50023          	sb	a5,0(a0)
    19e6:	fbf5                	bnez	a5,19da <strcpy+0x44>
        ;
    return d;
}
    19e8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19ea:	0505                	add	a0,a0,1
    19ec:	df45                	beqz	a4,19a4 <strcpy+0xe>
            if (!(*d = *s))
    19ee:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19f2:	0585                	add	a1,a1,1
    19f4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19f8:	00f50023          	sb	a5,0(a0)
    19fc:	f7fd                	bnez	a5,19ea <strcpy+0x54>
}
    19fe:	8082                	ret
    1a00:	8082                	ret

0000000000001a02 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a02:	00a5c7b3          	xor	a5,a1,a0
    1a06:	8b9d                	and	a5,a5,7
    1a08:	e3b5                	bnez	a5,1a6c <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a0a:	0075f793          	and	a5,a1,7
    1a0e:	cf99                	beqz	a5,1a2c <strncpy+0x2a>
    1a10:	ea09                	bnez	a2,1a22 <strncpy+0x20>
    1a12:	a421                	j	1c1a <strncpy+0x218>
    1a14:	0585                	add	a1,a1,1
    1a16:	0075f793          	and	a5,a1,7
    1a1a:	167d                	add	a2,a2,-1
    1a1c:	0505                	add	a0,a0,1
    1a1e:	c799                	beqz	a5,1a2c <strncpy+0x2a>
    1a20:	c225                	beqz	a2,1a80 <strncpy+0x7e>
    1a22:	0005c783          	lbu	a5,0(a1)
    1a26:	00f50023          	sb	a5,0(a0)
    1a2a:	f7ed                	bnez	a5,1a14 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a2c:	ca31                	beqz	a2,1a80 <strncpy+0x7e>
    1a2e:	0005c783          	lbu	a5,0(a1)
    1a32:	cba1                	beqz	a5,1a82 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a34:	479d                	li	a5,7
    1a36:	02c7fc63          	bgeu	a5,a2,1a6e <strncpy+0x6c>
    1a3a:	00000897          	auipc	a7,0x0
    1a3e:	5168b883          	ld	a7,1302(a7) # 1f50 <__clone+0x98>
    1a42:	00000817          	auipc	a6,0x0
    1a46:	51683803          	ld	a6,1302(a6) # 1f58 <__clone+0xa0>
    1a4a:	431d                	li	t1,7
    1a4c:	a039                	j	1a5a <strncpy+0x58>
            *wd = *ws;
    1a4e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a50:	1661                	add	a2,a2,-8
    1a52:	05a1                	add	a1,a1,8
    1a54:	0521                	add	a0,a0,8
    1a56:	00c37b63          	bgeu	t1,a2,1a6c <strncpy+0x6a>
    1a5a:	6198                	ld	a4,0(a1)
    1a5c:	011707b3          	add	a5,a4,a7
    1a60:	fff74693          	not	a3,a4
    1a64:	8ff5                	and	a5,a5,a3
    1a66:	0107f7b3          	and	a5,a5,a6
    1a6a:	d3f5                	beqz	a5,1a4e <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a6c:	ca11                	beqz	a2,1a80 <strncpy+0x7e>
    1a6e:	0005c783          	lbu	a5,0(a1)
    1a72:	0585                	add	a1,a1,1
    1a74:	00f50023          	sb	a5,0(a0)
    1a78:	c789                	beqz	a5,1a82 <strncpy+0x80>
    1a7a:	167d                	add	a2,a2,-1
    1a7c:	0505                	add	a0,a0,1
    1a7e:	fa65                	bnez	a2,1a6e <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a80:	8082                	ret
    1a82:	4805                	li	a6,1
    1a84:	14061b63          	bnez	a2,1bda <strncpy+0x1d8>
    1a88:	40a00733          	neg	a4,a0
    1a8c:	00777793          	and	a5,a4,7
    1a90:	4581                	li	a1,0
    1a92:	12061c63          	bnez	a2,1bca <strncpy+0x1c8>
    1a96:	00778693          	add	a3,a5,7
    1a9a:	48ad                	li	a7,11
    1a9c:	1316e563          	bltu	a3,a7,1bc6 <strncpy+0x1c4>
    1aa0:	16d5e263          	bltu	a1,a3,1c04 <strncpy+0x202>
    1aa4:	14078c63          	beqz	a5,1bfc <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aa8:	00050023          	sb	zero,0(a0)
    1aac:	00677693          	and	a3,a4,6
    1ab0:	14068263          	beqz	a3,1bf4 <strncpy+0x1f2>
    1ab4:	000500a3          	sb	zero,1(a0)
    1ab8:	4689                	li	a3,2
    1aba:	14f6f863          	bgeu	a3,a5,1c0a <strncpy+0x208>
    1abe:	00050123          	sb	zero,2(a0)
    1ac2:	8b11                	and	a4,a4,4
    1ac4:	12070463          	beqz	a4,1bec <strncpy+0x1ea>
    1ac8:	000501a3          	sb	zero,3(a0)
    1acc:	4711                	li	a4,4
    1ace:	00450693          	add	a3,a0,4
    1ad2:	02f77563          	bgeu	a4,a5,1afc <strncpy+0xfa>
    1ad6:	00050223          	sb	zero,4(a0)
    1ada:	4715                	li	a4,5
    1adc:	00550693          	add	a3,a0,5
    1ae0:	00e78e63          	beq	a5,a4,1afc <strncpy+0xfa>
    1ae4:	fff50713          	add	a4,a0,-1
    1ae8:	000502a3          	sb	zero,5(a0)
    1aec:	8b1d                	and	a4,a4,7
    1aee:	12071263          	bnez	a4,1c12 <strncpy+0x210>
    1af2:	00750693          	add	a3,a0,7
    1af6:	00050323          	sb	zero,6(a0)
    1afa:	471d                	li	a4,7
    1afc:	40f80833          	sub	a6,a6,a5
    1b00:	ff887593          	and	a1,a6,-8
    1b04:	97aa                	add	a5,a5,a0
    1b06:	95be                	add	a1,a1,a5
    1b08:	0007b023          	sd	zero,0(a5)
    1b0c:	07a1                	add	a5,a5,8
    1b0e:	feb79de3          	bne	a5,a1,1b08 <strncpy+0x106>
    1b12:	ff887593          	and	a1,a6,-8
    1b16:	00787813          	and	a6,a6,7
    1b1a:	00e587bb          	addw	a5,a1,a4
    1b1e:	00b68733          	add	a4,a3,a1
    1b22:	0e080063          	beqz	a6,1c02 <strncpy+0x200>
    1b26:	00070023          	sb	zero,0(a4)
    1b2a:	0017869b          	addw	a3,a5,1
    1b2e:	f4c6f9e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b32:	000700a3          	sb	zero,1(a4)
    1b36:	0027869b          	addw	a3,a5,2
    1b3a:	f4c6f3e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b3e:	00070123          	sb	zero,2(a4)
    1b42:	0037869b          	addw	a3,a5,3
    1b46:	f2c6fde3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b4a:	000701a3          	sb	zero,3(a4)
    1b4e:	0047869b          	addw	a3,a5,4
    1b52:	f2c6f7e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b56:	00070223          	sb	zero,4(a4)
    1b5a:	0057869b          	addw	a3,a5,5
    1b5e:	f2c6f1e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b62:	000702a3          	sb	zero,5(a4)
    1b66:	0067869b          	addw	a3,a5,6
    1b6a:	f0c6fbe3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b6e:	00070323          	sb	zero,6(a4)
    1b72:	0077869b          	addw	a3,a5,7
    1b76:	f0c6f5e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b7a:	000703a3          	sb	zero,7(a4)
    1b7e:	0087869b          	addw	a3,a5,8
    1b82:	eec6ffe3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b86:	00070423          	sb	zero,8(a4)
    1b8a:	0097869b          	addw	a3,a5,9
    1b8e:	eec6f9e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b92:	000704a3          	sb	zero,9(a4)
    1b96:	00a7869b          	addw	a3,a5,10
    1b9a:	eec6f3e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1b9e:	00070523          	sb	zero,10(a4)
    1ba2:	00b7869b          	addw	a3,a5,11
    1ba6:	ecc6fde3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1baa:	000705a3          	sb	zero,11(a4)
    1bae:	00c7869b          	addw	a3,a5,12
    1bb2:	ecc6f7e3          	bgeu	a3,a2,1a80 <strncpy+0x7e>
    1bb6:	00070623          	sb	zero,12(a4)
    1bba:	27b5                	addw	a5,a5,13
    1bbc:	ecc7f2e3          	bgeu	a5,a2,1a80 <strncpy+0x7e>
    1bc0:	000706a3          	sb	zero,13(a4)
}
    1bc4:	8082                	ret
    1bc6:	46ad                	li	a3,11
    1bc8:	bde1                	j	1aa0 <strncpy+0x9e>
    1bca:	00778693          	add	a3,a5,7
    1bce:	48ad                	li	a7,11
    1bd0:	fff60593          	add	a1,a2,-1
    1bd4:	ed16f6e3          	bgeu	a3,a7,1aa0 <strncpy+0x9e>
    1bd8:	b7fd                	j	1bc6 <strncpy+0x1c4>
    1bda:	40a00733          	neg	a4,a0
    1bde:	8832                	mv	a6,a2
    1be0:	00777793          	and	a5,a4,7
    1be4:	4581                	li	a1,0
    1be6:	ea0608e3          	beqz	a2,1a96 <strncpy+0x94>
    1bea:	b7c5                	j	1bca <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bec:	00350693          	add	a3,a0,3
    1bf0:	470d                	li	a4,3
    1bf2:	b729                	j	1afc <strncpy+0xfa>
    1bf4:	00150693          	add	a3,a0,1
    1bf8:	4705                	li	a4,1
    1bfa:	b709                	j	1afc <strncpy+0xfa>
tail:
    1bfc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfe:	4701                	li	a4,0
    1c00:	bdf5                	j	1afc <strncpy+0xfa>
    1c02:	8082                	ret
tail:
    1c04:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c06:	4781                	li	a5,0
    1c08:	bf39                	j	1b26 <strncpy+0x124>
    1c0a:	00250693          	add	a3,a0,2
    1c0e:	4709                	li	a4,2
    1c10:	b5f5                	j	1afc <strncpy+0xfa>
    1c12:	00650693          	add	a3,a0,6
    1c16:	4719                	li	a4,6
    1c18:	b5d5                	j	1afc <strncpy+0xfa>
    1c1a:	8082                	ret

0000000000001c1c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c1c:	87aa                	mv	a5,a0
    1c1e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c20:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c2a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <openat>:
    register long a7 __asm__("a7") = n;
    1c34:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c38:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <close>:
    register long a7 __asm__("a7") = n;
    1c44:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c48:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <read>:
    register long a7 __asm__("a7") = n;
    1c50:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c54:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c58:	8082                	ret

0000000000001c5a <write>:
    register long a7 __asm__("a7") = n;
    1c5a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c5e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c62:	8082                	ret

0000000000001c64 <getpid>:
    register long a7 __asm__("a7") = n;
    1c64:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c68:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <getppid>:
    register long a7 __asm__("a7") = n;
    1c70:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c74:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <fork>:
    register long a7 __asm__("a7") = n;
    1c88:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c90:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c98:	85b2                	mv	a1,a2
    1c9a:	863a                	mv	a2,a4
    if (stack)
    1c9c:	c191                	beqz	a1,1ca0 <clone+0x8>
	stack += stack_size;
    1c9e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca0:	4781                	li	a5,0
    1ca2:	4701                	li	a4,0
    1ca4:	4681                	li	a3,0
    1ca6:	2601                	sext.w	a2,a2
    1ca8:	ac01                	j	1eb8 <__clone>

0000000000001caa <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1caa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cae:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cb2:	8082                	ret

0000000000001cb4 <exit>:
    register long a7 __asm__("a7") = n;
    1cb4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cb8:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cbc:	8082                	ret

0000000000001cbe <waitpid>:
    register long a7 __asm__("a7") = n;
    1cbe:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cc2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <exec>:
    register long a7 __asm__("a7") = n;
    1ccc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cd0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <execve>:
    register long a7 __asm__("a7") = n;
    1cd8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cdc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <times>:
    register long a7 __asm__("a7") = n;
    1ce4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <get_time>:

int64 get_time()
{
    1cf0:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cf2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cf6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cf8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfa:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cfe:	2501                	sext.w	a0,a0
    1d00:	ed09                	bnez	a0,1d1a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d02:	67a2                	ld	a5,8(sp)
    1d04:	3e800713          	li	a4,1000
    1d08:	00015503          	lhu	a0,0(sp)
    1d0c:	02e7d7b3          	divu	a5,a5,a4
    1d10:	02e50533          	mul	a0,a0,a4
    1d14:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d16:	0141                	add	sp,sp,16
    1d18:	8082                	ret
        return -1;
    1d1a:	557d                	li	a0,-1
    1d1c:	bfed                	j	1d16 <get_time+0x26>

0000000000001d1e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d1e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d22:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <time>:
    register long a7 __asm__("a7") = n;
    1d2a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d2e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <sleep>:

int sleep(unsigned long long time)
{
    1d36:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d38:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d3a:	850a                	mv	a0,sp
    1d3c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d3e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d42:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d48:	e501                	bnez	a0,1d50 <sleep+0x1a>
    return 0;
    1d4a:	4501                	li	a0,0
}
    1d4c:	0141                	add	sp,sp,16
    1d4e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d50:	4502                	lw	a0,0(sp)
}
    1d52:	0141                	add	sp,sp,16
    1d54:	8082                	ret

0000000000001d56 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d56:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d5a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d62:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d66:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d6a:	8082                	ret

0000000000001d6c <mprotect>:
    register long a7 __asm__("a7") = n;
    1d6c:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d70:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <munmap>:
    register long a7 __asm__("a7") = n;
    1d78:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <wait>:

int wait(int *code)
{
    1d84:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d86:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d8c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d8e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d90:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <spawn>:
    register long a7 __asm__("a7") = n;
    1d98:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d9c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <mailread>:
    register long a7 __asm__("a7") = n;
    1da4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <fstat>:
    register long a7 __asm__("a7") = n;
    1dbc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dc8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dca:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dce:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dda:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dde:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dea:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dee:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <link>:

int link(char *old_path, char *new_path)
{
    1df8:	87aa                	mv	a5,a0
    1dfa:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dfc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e00:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e04:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e06:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e0a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <unlink>:

int unlink(char *path)
{
    1e14:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e16:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e1a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e1e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <uname>:
    register long a7 __asm__("a7") = n;
    1e28:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <brk>:
    register long a7 __asm__("a7") = n;
    1e34:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e40:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e42:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e46:	8082                	ret

0000000000001e48 <chdir>:
    register long a7 __asm__("a7") = n;
    1e48:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e4c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e54:	862e                	mv	a2,a1
    1e56:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e58:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e64:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <getdents>:
    register long a7 __asm__("a7") = n;
    1e6e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e72:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <pipe>:
    register long a7 __asm__("a7") = n;
    1e7a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e7e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <dup>:
    register long a7 __asm__("a7") = n;
    1e88:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e8a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <dup2>:
    register long a7 __asm__("a7") = n;
    1e92:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e94:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <mount>:
    register long a7 __asm__("a7") = n;
    1e9e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <umount>:
    register long a7 __asm__("a7") = n;
    1eaa:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb8:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eba:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ebc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ebe:	8532                	mv	a0,a2
	mv a2, a4
    1ec0:	863a                	mv	a2,a4
	mv a3, a5
    1ec2:	86be                	mv	a3,a5
	mv a4, a6
    1ec4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec6:	0dc00893          	li	a7,220
	ecall
    1eca:	00000073          	ecall

	beqz a0, 1f
    1ece:	c111                	beqz	a0,1ed2 <__clone+0x1a>
	# Parent
	ret
    1ed0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed4:	6522                	ld	a0,8(sp)
	jalr a1
    1ed6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed8:	05d00893          	li	a7,93
	ecall
    1edc:	00000073          	ecall
