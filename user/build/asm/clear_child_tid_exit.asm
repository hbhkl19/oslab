
/home/hbh/oslab/oslab/user/build/riscv64/clear_child_tid_exit:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a239                	j	1110 <__start_main>

0000000000001004 <test_clear_child_tid_exit>:

static int clear_tid = -1;
size_t stack_clear[1024] = {0};

void test_clear_child_tid_exit(void)
{
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f5250513          	add	a0,a0,-174 # 1f58 <__clone+0x2e>
{
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    1014:	e84a                	sd	s2,16(sp)
    TEST_START(__func__);
    1016:	352000ef          	jal	1368 <puts>
    101a:	00003517          	auipc	a0,0x3
    101e:	00650513          	add	a0,a0,6 # 4020 <__func__.0>
    1022:	346000ef          	jal	1368 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	f4a50513          	add	a0,a0,-182 # 1f70 <__clone+0x46>
    102e:	33a000ef          	jal	1368 <puts>

    sys_set_tid_address(&clear_tid);
    1032:	00003517          	auipc	a0,0x3
    1036:	02250513          	add	a0,a0,34 # 4054 <clear_tid>
    103a:	4a9000ef          	jal	1ce2 <sys_set_tid_address>
    clear_tid = 1234;
    103e:	00003497          	auipc	s1,0x3
    1042:	01648493          	add	s1,s1,22 # 4054 <clear_tid>
    1046:	4d200793          	li	a5,1234

    long pid = sys_clone_raw(SIGCHLD, stack_clear + 1024, 0, 0, &clear_tid);
    104a:	8726                	mv	a4,s1
    104c:	4681                	li	a3,0
    104e:	4601                	li	a2,0
    1050:	00003597          	auipc	a1,0x3
    1054:	fd058593          	add	a1,a1,-48 # 4020 <__func__.0>
    1058:	4545                	li	a0,17
    clear_tid = 1234;
    105a:	c09c                	sw	a5,0(s1)
    long pid = sys_clone_raw(SIGCHLD, stack_clear + 1024, 0, 0, &clear_tid);
    105c:	4c1000ef          	jal	1d1c <sys_clone_raw>
    printf("clone ret: %d\n", (int)pid);
    1060:	0005091b          	sext.w	s2,a0
    long pid = sys_clone_raw(SIGCHLD, stack_clear + 1024, 0, 0, &clear_tid);
    1064:	842a                	mv	s0,a0
    printf("clone ret: %d\n", (int)pid);
    1066:	85ca                	mv	a1,s2
    1068:	00001517          	auipc	a0,0x1
    106c:	f1850513          	add	a0,a0,-232 # 1f80 <__clone+0x56>
    1070:	31a000ef          	jal	138a <printf>
    assert(pid != -1);
    1074:	57fd                	li	a5,-1
    1076:	02f40c63          	beq	s0,a5,10ae <test_clear_child_tid_exit+0xaa>

    if(pid == 0) {
    107a:	e021                	bnez	s0,10ba <test_clear_child_tid_exit+0xb6>
        exit(0);
    107c:	4501                	li	a0,0
    107e:	4a9000ef          	jal	1d26 <exit>
        printf("clear_tid after wait: %d\n", clear_tid);
        assert(clear_tid == 0);
        printf("clear_child_tid success.\n");
    }

    TEST_END(__func__);
    1082:	00001517          	auipc	a0,0x1
    1086:	f6e50513          	add	a0,a0,-146 # 1ff0 <__clone+0xc6>
    108a:	2de000ef          	jal	1368 <puts>
    108e:	00003517          	auipc	a0,0x3
    1092:	f9250513          	add	a0,a0,-110 # 4020 <__func__.0>
    1096:	2d2000ef          	jal	1368 <puts>
}
    109a:	7402                	ld	s0,32(sp)
    109c:	70a2                	ld	ra,40(sp)
    109e:	64e2                	ld	s1,24(sp)
    10a0:	6942                	ld	s2,16(sp)
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	ece50513          	add	a0,a0,-306 # 1f70 <__clone+0x46>
}
    10aa:	6145                	add	sp,sp,48
    TEST_END(__func__);
    10ac:	ac75                	j	1368 <puts>
    assert(pid != -1);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	ee250513          	add	a0,a0,-286 # 1f90 <__clone+0x66>
    10b6:	54e000ef          	jal	1604 <panic>
        waitpid((int)pid, &status, 0);
    10ba:	4601                	li	a2,0
    10bc:	006c                	add	a1,sp,12
    10be:	854a                	mv	a0,s2
        int status = 0;
    10c0:	c602                	sw	zero,12(sp)
        waitpid((int)pid, &status, 0);
    10c2:	46f000ef          	jal	1d30 <waitpid>
        printf("clear_tid after wait: %d\n", clear_tid);
    10c6:	408c                	lw	a1,0(s1)
    10c8:	00001517          	auipc	a0,0x1
    10cc:	ee850513          	add	a0,a0,-280 # 1fb0 <__clone+0x86>
    10d0:	2ba000ef          	jal	138a <printf>
        assert(clear_tid == 0);
    10d4:	409c                	lw	a5,0(s1)
    10d6:	eb81                	bnez	a5,10e6 <test_clear_child_tid_exit+0xe2>
        printf("clear_child_tid success.\n");
    10d8:	00001517          	auipc	a0,0x1
    10dc:	ef850513          	add	a0,a0,-264 # 1fd0 <__clone+0xa6>
    10e0:	2aa000ef          	jal	138a <printf>
    10e4:	bf79                	j	1082 <test_clear_child_tid_exit+0x7e>
        assert(clear_tid == 0);
    10e6:	00001517          	auipc	a0,0x1
    10ea:	eaa50513          	add	a0,a0,-342 # 1f90 <__clone+0x66>
    10ee:	516000ef          	jal	1604 <panic>
        printf("clear_child_tid success.\n");
    10f2:	00001517          	auipc	a0,0x1
    10f6:	ede50513          	add	a0,a0,-290 # 1fd0 <__clone+0xa6>
    10fa:	290000ef          	jal	138a <printf>
    10fe:	b751                	j	1082 <test_clear_child_tid_exit+0x7e>

0000000000001100 <main>:

int main(void)
{
    1100:	1141                	add	sp,sp,-16
    1102:	e406                	sd	ra,8(sp)
    test_clear_child_tid_exit();
    1104:	f01ff0ef          	jal	1004 <test_clear_child_tid_exit>
    return 0;
}
    1108:	60a2                	ld	ra,8(sp)
    110a:	4501                	li	a0,0
    110c:	0141                	add	sp,sp,16
    110e:	8082                	ret

0000000000001110 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1110:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1112:	4108                	lw	a0,0(a0)
{
    1114:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1116:	05a1                	add	a1,a1,8
{
    1118:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    111a:	fe7ff0ef          	jal	1100 <main>
    111e:	409000ef          	jal	1d26 <exit>
	return 0;
}
    1122:	60a2                	ld	ra,8(sp)
    1124:	4501                	li	a0,0
    1126:	0141                	add	sp,sp,16
    1128:	8082                	ret

000000000000112a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    112a:	7179                	add	sp,sp,-48
    112c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    112e:	12054863          	bltz	a0,125e <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1132:	02b577bb          	remuw	a5,a0,a1
    1136:	00003697          	auipc	a3,0x3
    113a:	f0a68693          	add	a3,a3,-246 # 4040 <digits>
    buf[16] = 0;
    113e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1142:	0005871b          	sext.w	a4,a1
    1146:	1782                	sll	a5,a5,0x20
    1148:	9381                	srl	a5,a5,0x20
    114a:	97b6                	add	a5,a5,a3
    114c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1150:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1154:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1158:	1ab56663          	bltu	a0,a1,1304 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    115c:	02e8763b          	remuw	a2,a6,a4
    1160:	1602                	sll	a2,a2,0x20
    1162:	9201                	srl	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1172:	12e86c63          	bltu	a6,a4,12aa <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1176:	02e5f63b          	remuw	a2,a1,a4
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1188:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    118c:	12e5e863          	bltu	a1,a4,12bc <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1190:	02e8763b          	remuw	a2,a6,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a2:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11a6:	12e86463          	bltu	a6,a4,12ce <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11aa:	02e5f63b          	remuw	a2,a1,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11c0:	12e5e063          	bltu	a1,a4,12e0 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11c4:	02e8763b          	remuw	a2,a6,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d6:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11da:	0ae86f63          	bltu	a6,a4,1298 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11de:	02e5f63b          	remuw	a2,a1,a4
    11e2:	1602                	sll	a2,a2,0x20
    11e4:	9201                	srl	a2,a2,0x20
    11e6:	9636                	add	a2,a2,a3
    11e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ec:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11f0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11f4:	0ee5ef63          	bltu	a1,a4,12f2 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11f8:	02e8763b          	remuw	a2,a6,a4
    11fc:	1602                	sll	a2,a2,0x20
    11fe:	9201                	srl	a2,a2,0x20
    1200:	9636                	add	a2,a2,a3
    1202:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1206:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    120a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    120e:	0ee86d63          	bltu	a6,a4,1308 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1212:	02e5f63b          	remuw	a2,a1,a4
    1216:	1602                	sll	a2,a2,0x20
    1218:	9201                	srl	a2,a2,0x20
    121a:	9636                	add	a2,a2,a3
    121c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1220:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1224:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1228:	0ee5e963          	bltu	a1,a4,131a <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    122c:	1782                	sll	a5,a5,0x20
    122e:	9381                	srl	a5,a5,0x20
    1230:	96be                	add	a3,a3,a5
    1232:	0006c783          	lbu	a5,0(a3)
    1236:	4599                	li	a1,6
    1238:	00f10723          	sb	a5,14(sp)

    if (sign)
    123c:	00055763          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1248:	4595                	li	a1,5
    write(f, s, l);
    124a:	003c                	add	a5,sp,8
    124c:	4641                	li	a2,16
    124e:	9e0d                	subw	a2,a2,a1
    1250:	4505                	li	a0,1
    1252:	95be                	add	a1,a1,a5
    1254:	26d000ef          	jal	1cc0 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1258:	70a2                	ld	ra,40(sp)
    125a:	6145                	add	sp,sp,48
    125c:	8082                	ret
        x = -xx;
    125e:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1262:	02b677bb          	remuw	a5,a2,a1
    1266:	00003697          	auipc	a3,0x3
    126a:	dda68693          	add	a3,a3,-550 # 4040 <digits>
    buf[16] = 0;
    126e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1272:	0005871b          	sext.w	a4,a1
    1276:	1782                	sll	a5,a5,0x20
    1278:	9381                	srl	a5,a5,0x20
    127a:	97b6                	add	a5,a5,a3
    127c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1280:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1284:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1288:	ecb67ae3          	bgeu	a2,a1,115c <printint.constprop.0+0x32>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1294:	45b9                	li	a1,14
    1296:	bf55                	j	124a <printint.constprop.0+0x120>
    1298:	45a9                	li	a1,10
    if (sign)
    129a:	fa0558e3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12a6:	45a5                	li	a1,9
    12a8:	b74d                	j	124a <printint.constprop.0+0x120>
    12aa:	45b9                	li	a1,14
    if (sign)
    12ac:	f8055fe3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12b8:	45b5                	li	a1,13
    12ba:	bf41                	j	124a <printint.constprop.0+0x120>
    12bc:	45b5                	li	a1,13
    if (sign)
    12be:	f80556e3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c2:	02d00793          	li	a5,45
    12c6:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12ca:	45b1                	li	a1,12
    12cc:	bfbd                	j	124a <printint.constprop.0+0x120>
    12ce:	45b1                	li	a1,12
    if (sign)
    12d0:	f6055de3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d4:	02d00793          	li	a5,45
    12d8:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12dc:	45ad                	li	a1,11
    12de:	b7b5                	j	124a <printint.constprop.0+0x120>
    12e0:	45ad                	li	a1,11
    if (sign)
    12e2:	f60554e3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e6:	02d00793          	li	a5,45
    12ea:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12ee:	45a9                	li	a1,10
    12f0:	bfa9                	j	124a <printint.constprop.0+0x120>
    12f2:	45a5                	li	a1,9
    if (sign)
    12f4:	f4055be3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f8:	02d00793          	li	a5,45
    12fc:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1300:	45a1                	li	a1,8
    1302:	b7a1                	j	124a <printint.constprop.0+0x120>
    i = 15;
    1304:	45bd                	li	a1,15
    1306:	b791                	j	124a <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1308:	45a1                	li	a1,8
    if (sign)
    130a:	f40550e3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    130e:	02d00793          	li	a5,45
    1312:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1316:	459d                	li	a1,7
    1318:	bf0d                	j	124a <printint.constprop.0+0x120>
    131a:	459d                	li	a1,7
    if (sign)
    131c:	f20557e3          	bgez	a0,124a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1320:	02d00793          	li	a5,45
    1324:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1328:	4599                	li	a1,6
    132a:	b705                	j	124a <printint.constprop.0+0x120>

000000000000132c <getchar>:
{
    132c:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    132e:	00f10593          	add	a1,sp,15
    1332:	4605                	li	a2,1
    1334:	4501                	li	a0,0
{
    1336:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1338:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    133c:	17b000ef          	jal	1cb6 <read>
}
    1340:	60e2                	ld	ra,24(sp)
    1342:	00f14503          	lbu	a0,15(sp)
    1346:	6105                	add	sp,sp,32
    1348:	8082                	ret

000000000000134a <putchar>:
{
    134a:	1101                	add	sp,sp,-32
    134c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    134e:	00f10593          	add	a1,sp,15
    1352:	4605                	li	a2,1
    1354:	4505                	li	a0,1
{
    1356:	ec06                	sd	ra,24(sp)
    char byte = c;
    1358:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    135c:	165000ef          	jal	1cc0 <write>
}
    1360:	60e2                	ld	ra,24(sp)
    1362:	2501                	sext.w	a0,a0
    1364:	6105                	add	sp,sp,32
    1366:	8082                	ret

0000000000001368 <puts>:
{
    1368:	1141                	add	sp,sp,-16
    136a:	e406                	sd	ra,8(sp)
    136c:	e022                	sd	s0,0(sp)
    136e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1370:	574000ef          	jal	18e4 <strlen>
    1374:	862a                	mv	a2,a0
    1376:	85a2                	mv	a1,s0
    1378:	4505                	li	a0,1
    137a:	147000ef          	jal	1cc0 <write>
}
    137e:	60a2                	ld	ra,8(sp)
    1380:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1382:	957d                	sra	a0,a0,0x3f
    return r;
    1384:	2501                	sext.w	a0,a0
}
    1386:	0141                	add	sp,sp,16
    1388:	8082                	ret

000000000000138a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    138a:	7171                	add	sp,sp,-176
    138c:	f85a                	sd	s6,48(sp)
    138e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1390:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1392:	18bc                	add	a5,sp,120
{
    1394:	e8ca                	sd	s2,80(sp)
    1396:	e4ce                	sd	s3,72(sp)
    1398:	e0d2                	sd	s4,64(sp)
    139a:	fc56                	sd	s5,56(sp)
    139c:	f486                	sd	ra,104(sp)
    139e:	f0a2                	sd	s0,96(sp)
    13a0:	eca6                	sd	s1,88(sp)
    13a2:	fcae                	sd	a1,120(sp)
    13a4:	e132                	sd	a2,128(sp)
    13a6:	e536                	sd	a3,136(sp)
    13a8:	e93a                	sd	a4,144(sp)
    13aa:	f142                	sd	a6,160(sp)
    13ac:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13ae:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13b0:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13b4:	07300a13          	li	s4,115
    13b8:	07800a93          	li	s5,120
    buf[i++] = '0';
    13bc:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c0:	00003997          	auipc	s3,0x3
    13c4:	c8098993          	add	s3,s3,-896 # 4040 <digits>
        if (!*s)
    13c8:	00054783          	lbu	a5,0(a0)
    13cc:	16078a63          	beqz	a5,1540 <printf+0x1b6>
    13d0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13d2:	19278d63          	beq	a5,s2,156c <printf+0x1e2>
    13d6:	00164783          	lbu	a5,1(a2)
    13da:	0605                	add	a2,a2,1
    13dc:	fbfd                	bnez	a5,13d2 <printf+0x48>
    13de:	84b2                	mv	s1,a2
        l = z - a;
    13e0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13e4:	85aa                	mv	a1,a0
    13e6:	8622                	mv	a2,s0
    13e8:	4505                	li	a0,1
    13ea:	0d7000ef          	jal	1cc0 <write>
        if (l)
    13ee:	1a041463          	bnez	s0,1596 <printf+0x20c>
        if (s[1] == 0)
    13f2:	0014c783          	lbu	a5,1(s1)
    13f6:	14078563          	beqz	a5,1540 <printf+0x1b6>
        switch (s[1])
    13fa:	1b478063          	beq	a5,s4,159a <printf+0x210>
    13fe:	14fa6b63          	bltu	s4,a5,1554 <printf+0x1ca>
    1402:	06400713          	li	a4,100
    1406:	1ee78063          	beq	a5,a4,15e6 <printf+0x25c>
    140a:	07000713          	li	a4,112
    140e:	1ae79963          	bne	a5,a4,15c0 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1412:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1414:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1418:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    141a:	631c                	ld	a5,0(a4)
    141c:	0721                	add	a4,a4,8
    141e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1420:	00479293          	sll	t0,a5,0x4
    1424:	00879f93          	sll	t6,a5,0x8
    1428:	00c79f13          	sll	t5,a5,0xc
    142c:	01079e93          	sll	t4,a5,0x10
    1430:	01479e13          	sll	t3,a5,0x14
    1434:	01879313          	sll	t1,a5,0x18
    1438:	01c79893          	sll	a7,a5,0x1c
    143c:	02479813          	sll	a6,a5,0x24
    1440:	02879513          	sll	a0,a5,0x28
    1444:	02c79593          	sll	a1,a5,0x2c
    1448:	03079693          	sll	a3,a5,0x30
    144c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1450:	03c7d413          	srl	s0,a5,0x3c
    1454:	01c7d39b          	srlw	t2,a5,0x1c
    1458:	03c2d293          	srl	t0,t0,0x3c
    145c:	03cfdf93          	srl	t6,t6,0x3c
    1460:	03cf5f13          	srl	t5,t5,0x3c
    1464:	03cede93          	srl	t4,t4,0x3c
    1468:	03ce5e13          	srl	t3,t3,0x3c
    146c:	03c35313          	srl	t1,t1,0x3c
    1470:	03c8d893          	srl	a7,a7,0x3c
    1474:	03c85813          	srl	a6,a6,0x3c
    1478:	9171                	srl	a0,a0,0x3c
    147a:	91f1                	srl	a1,a1,0x3c
    147c:	92f1                	srl	a3,a3,0x3c
    147e:	9371                	srl	a4,a4,0x3c
    1480:	96ce                	add	a3,a3,s3
    1482:	974e                	add	a4,a4,s3
    1484:	944e                	add	s0,s0,s3
    1486:	92ce                	add	t0,t0,s3
    1488:	9fce                	add	t6,t6,s3
    148a:	9f4e                	add	t5,t5,s3
    148c:	9ece                	add	t4,t4,s3
    148e:	9e4e                	add	t3,t3,s3
    1490:	934e                	add	t1,t1,s3
    1492:	98ce                	add	a7,a7,s3
    1494:	93ce                	add	t2,t2,s3
    1496:	984e                	add	a6,a6,s3
    1498:	954e                	add	a0,a0,s3
    149a:	95ce                	add	a1,a1,s3
    149c:	0006c083          	lbu	ra,0(a3)
    14a0:	0002c283          	lbu	t0,0(t0)
    14a4:	00074683          	lbu	a3,0(a4)
    14a8:	000fcf83          	lbu	t6,0(t6)
    14ac:	000f4f03          	lbu	t5,0(t5)
    14b0:	000ece83          	lbu	t4,0(t4)
    14b4:	000e4e03          	lbu	t3,0(t3)
    14b8:	00034303          	lbu	t1,0(t1)
    14bc:	0008c883          	lbu	a7,0(a7)
    14c0:	0003c383          	lbu	t2,0(t2)
    14c4:	00084803          	lbu	a6,0(a6)
    14c8:	00054503          	lbu	a0,0(a0)
    14cc:	0005c583          	lbu	a1,0(a1)
    14d0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d4:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d8:	9371                	srl	a4,a4,0x3c
    14da:	8bbd                	and	a5,a5,15
    14dc:	974e                	add	a4,a4,s3
    14de:	97ce                	add	a5,a5,s3
    14e0:	005105a3          	sb	t0,11(sp)
    14e4:	01f10623          	sb	t6,12(sp)
    14e8:	01e106a3          	sb	t5,13(sp)
    14ec:	01d10723          	sb	t4,14(sp)
    14f0:	01c107a3          	sb	t3,15(sp)
    14f4:	00610823          	sb	t1,16(sp)
    14f8:	011108a3          	sb	a7,17(sp)
    14fc:	00710923          	sb	t2,18(sp)
    1500:	010109a3          	sb	a6,19(sp)
    1504:	00a10a23          	sb	a0,20(sp)
    1508:	00b10aa3          	sb	a1,21(sp)
    150c:	00110b23          	sb	ra,22(sp)
    1510:	00d10ba3          	sb	a3,23(sp)
    1514:	00810523          	sb	s0,10(sp)
    1518:	00074703          	lbu	a4,0(a4)
    151c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1520:	002c                	add	a1,sp,8
    1522:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1524:	00e10c23          	sb	a4,24(sp)
    1528:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1530:	790000ef          	jal	1cc0 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1534:	00248513          	add	a0,s1,2
        if (!*s)
    1538:	00054783          	lbu	a5,0(a0)
    153c:	e8079ae3          	bnez	a5,13d0 <printf+0x46>
    }
    va_end(ap);
}
    1540:	70a6                	ld	ra,104(sp)
    1542:	7406                	ld	s0,96(sp)
    1544:	64e6                	ld	s1,88(sp)
    1546:	6946                	ld	s2,80(sp)
    1548:	69a6                	ld	s3,72(sp)
    154a:	6a06                	ld	s4,64(sp)
    154c:	7ae2                	ld	s5,56(sp)
    154e:	7b42                	ld	s6,48(sp)
    1550:	614d                	add	sp,sp,176
    1552:	8082                	ret
        switch (s[1])
    1554:	07579663          	bne	a5,s5,15c0 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1558:	6782                	ld	a5,0(sp)
    155a:	45c1                	li	a1,16
    155c:	4388                	lw	a0,0(a5)
    155e:	07a1                	add	a5,a5,8
    1560:	e03e                	sd	a5,0(sp)
    1562:	bc9ff0ef          	jal	112a <printint.constprop.0>
        s += 2;
    1566:	00248513          	add	a0,s1,2
    156a:	b7f9                	j	1538 <printf+0x1ae>
    156c:	84b2                	mv	s1,a2
    156e:	a039                	j	157c <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1570:	0024c783          	lbu	a5,2(s1)
    1574:	0605                	add	a2,a2,1
    1576:	0489                	add	s1,s1,2
    1578:	e72794e3          	bne	a5,s2,13e0 <printf+0x56>
    157c:	0014c783          	lbu	a5,1(s1)
    1580:	ff2788e3          	beq	a5,s2,1570 <printf+0x1e6>
        l = z - a;
    1584:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1588:	85aa                	mv	a1,a0
    158a:	8622                	mv	a2,s0
    158c:	4505                	li	a0,1
    158e:	732000ef          	jal	1cc0 <write>
        if (l)
    1592:	e60400e3          	beqz	s0,13f2 <printf+0x68>
    1596:	8526                	mv	a0,s1
    1598:	bd05                	j	13c8 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    159a:	6782                	ld	a5,0(sp)
    159c:	6380                	ld	s0,0(a5)
    159e:	07a1                	add	a5,a5,8
    15a0:	e03e                	sd	a5,0(sp)
    15a2:	cc21                	beqz	s0,15fa <printf+0x270>
            l = strnlen(a, 200);
    15a4:	0c800593          	li	a1,200
    15a8:	8522                	mv	a0,s0
    15aa:	424000ef          	jal	19ce <strnlen>
    write(f, s, l);
    15ae:	0005061b          	sext.w	a2,a0
    15b2:	85a2                	mv	a1,s0
    15b4:	4505                	li	a0,1
    15b6:	70a000ef          	jal	1cc0 <write>
        s += 2;
    15ba:	00248513          	add	a0,s1,2
    15be:	bfad                	j	1538 <printf+0x1ae>
    return write(stdout, &byte, 1);
    15c0:	4605                	li	a2,1
    15c2:	002c                	add	a1,sp,8
    15c4:	4505                	li	a0,1
    char byte = c;
    15c6:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15ca:	6f6000ef          	jal	1cc0 <write>
    char byte = c;
    15ce:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d2:	4605                	li	a2,1
    15d4:	002c                	add	a1,sp,8
    15d6:	4505                	li	a0,1
    char byte = c;
    15d8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15dc:	6e4000ef          	jal	1cc0 <write>
        s += 2;
    15e0:	00248513          	add	a0,s1,2
    15e4:	bf91                	j	1538 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15e6:	6782                	ld	a5,0(sp)
    15e8:	45a9                	li	a1,10
    15ea:	4388                	lw	a0,0(a5)
    15ec:	07a1                	add	a5,a5,8
    15ee:	e03e                	sd	a5,0(sp)
    15f0:	b3bff0ef          	jal	112a <printint.constprop.0>
        s += 2;
    15f4:	00248513          	add	a0,s1,2
    15f8:	b781                	j	1538 <printf+0x1ae>
                a = "(null)";
    15fa:	00001417          	auipc	s0,0x1
    15fe:	a0640413          	add	s0,s0,-1530 # 2000 <__clone+0xd6>
    1602:	b74d                	j	15a4 <printf+0x21a>

0000000000001604 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1604:	1141                	add	sp,sp,-16
    1606:	e406                	sd	ra,8(sp)
    puts(m);
    1608:	d61ff0ef          	jal	1368 <puts>
    exit(-100);
}
    160c:	60a2                	ld	ra,8(sp)
    exit(-100);
    160e:	f9c00513          	li	a0,-100
}
    1612:	0141                	add	sp,sp,16
    exit(-100);
    1614:	af09                	j	1d26 <exit>

0000000000001616 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1616:	02000793          	li	a5,32
    161a:	00f50663          	beq	a0,a5,1626 <isspace+0x10>
    161e:	355d                	addw	a0,a0,-9
    1620:	00553513          	sltiu	a0,a0,5
    1624:	8082                	ret
    1626:	4505                	li	a0,1
}
    1628:	8082                	ret

000000000000162a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    162a:	fd05051b          	addw	a0,a0,-48
}
    162e:	00a53513          	sltiu	a0,a0,10
    1632:	8082                	ret

0000000000001634 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1634:	02000693          	li	a3,32
    1638:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    163a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    163e:	ff77871b          	addw	a4,a5,-9
    1642:	04d78c63          	beq	a5,a3,169a <atoi+0x66>
    1646:	0007861b          	sext.w	a2,a5
    164a:	04e5f863          	bgeu	a1,a4,169a <atoi+0x66>
        s++;
    switch (*s)
    164e:	02b00713          	li	a4,43
    1652:	04e78963          	beq	a5,a4,16a4 <atoi+0x70>
    1656:	02d00713          	li	a4,45
    165a:	06e78263          	beq	a5,a4,16be <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    165e:	fd06069b          	addw	a3,a2,-48
    1662:	47a5                	li	a5,9
    1664:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1666:	4301                	li	t1,0
    while (isdigit(*s))
    1668:	04d7e963          	bltu	a5,a3,16ba <atoi+0x86>
    int n = 0, neg = 0;
    166c:	4501                	li	a0,0
    while (isdigit(*s))
    166e:	48a5                	li	a7,9
    1670:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1674:	0025179b          	sllw	a5,a0,0x2
    1678:	9fa9                	addw	a5,a5,a0
    167a:	fd06059b          	addw	a1,a2,-48
    167e:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1682:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1686:	0705                	add	a4,a4,1
    1688:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    168c:	0006861b          	sext.w	a2,a3
    1690:	ff08f0e3          	bgeu	a7,a6,1670 <atoi+0x3c>
    return neg ? n : -n;
    1694:	00030563          	beqz	t1,169e <atoi+0x6a>
}
    1698:	8082                	ret
        s++;
    169a:	0505                	add	a0,a0,1
    169c:	bf79                	j	163a <atoi+0x6>
    return neg ? n : -n;
    169e:	40f5853b          	subw	a0,a1,a5
    16a2:	8082                	ret
    while (isdigit(*s))
    16a4:	00154603          	lbu	a2,1(a0)
    16a8:	47a5                	li	a5,9
        s++;
    16aa:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16ae:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16b2:	4301                	li	t1,0
    while (isdigit(*s))
    16b4:	2601                	sext.w	a2,a2
    16b6:	fad7fbe3          	bgeu	a5,a3,166c <atoi+0x38>
    16ba:	4501                	li	a0,0
}
    16bc:	8082                	ret
    while (isdigit(*s))
    16be:	00154603          	lbu	a2,1(a0)
    16c2:	47a5                	li	a5,9
        s++;
    16c4:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16c8:	fd06069b          	addw	a3,a2,-48
    16cc:	2601                	sext.w	a2,a2
    16ce:	fed7e6e3          	bltu	a5,a3,16ba <atoi+0x86>
        neg = 1;
    16d2:	4305                	li	t1,1
    16d4:	bf61                	j	166c <atoi+0x38>

00000000000016d6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16d6:	18060163          	beqz	a2,1858 <memset+0x182>
    16da:	40a006b3          	neg	a3,a0
    16de:	0076f793          	and	a5,a3,7
    16e2:	00778813          	add	a6,a5,7
    16e6:	48ad                	li	a7,11
    16e8:	0ff5f713          	zext.b	a4,a1
    16ec:	fff60593          	add	a1,a2,-1
    16f0:	17186563          	bltu	a6,a7,185a <memset+0x184>
    16f4:	1705ed63          	bltu	a1,a6,186e <memset+0x198>
    16f8:	16078363          	beqz	a5,185e <memset+0x188>
    16fc:	00e50023          	sb	a4,0(a0)
    1700:	0066f593          	and	a1,a3,6
    1704:	16058063          	beqz	a1,1864 <memset+0x18e>
    1708:	00e500a3          	sb	a4,1(a0)
    170c:	4589                	li	a1,2
    170e:	16f5f363          	bgeu	a1,a5,1874 <memset+0x19e>
    1712:	00e50123          	sb	a4,2(a0)
    1716:	8a91                	and	a3,a3,4
    1718:	00350593          	add	a1,a0,3
    171c:	4e0d                	li	t3,3
    171e:	ce9d                	beqz	a3,175c <memset+0x86>
    1720:	00e501a3          	sb	a4,3(a0)
    1724:	4691                	li	a3,4
    1726:	00450593          	add	a1,a0,4
    172a:	4e11                	li	t3,4
    172c:	02f6f863          	bgeu	a3,a5,175c <memset+0x86>
    1730:	00e50223          	sb	a4,4(a0)
    1734:	4695                	li	a3,5
    1736:	00550593          	add	a1,a0,5
    173a:	4e15                	li	t3,5
    173c:	02d78063          	beq	a5,a3,175c <memset+0x86>
    1740:	fff50693          	add	a3,a0,-1
    1744:	00e502a3          	sb	a4,5(a0)
    1748:	8a9d                	and	a3,a3,7
    174a:	00650593          	add	a1,a0,6
    174e:	4e19                	li	t3,6
    1750:	e691                	bnez	a3,175c <memset+0x86>
    1752:	00750593          	add	a1,a0,7
    1756:	00e50323          	sb	a4,6(a0)
    175a:	4e1d                	li	t3,7
    175c:	00871693          	sll	a3,a4,0x8
    1760:	01071813          	sll	a6,a4,0x10
    1764:	8ed9                	or	a3,a3,a4
    1766:	01871893          	sll	a7,a4,0x18
    176a:	0106e6b3          	or	a3,a3,a6
    176e:	0116e6b3          	or	a3,a3,a7
    1772:	02071813          	sll	a6,a4,0x20
    1776:	02871313          	sll	t1,a4,0x28
    177a:	0106e6b3          	or	a3,a3,a6
    177e:	40f608b3          	sub	a7,a2,a5
    1782:	03071813          	sll	a6,a4,0x30
    1786:	0066e6b3          	or	a3,a3,t1
    178a:	0106e6b3          	or	a3,a3,a6
    178e:	03871313          	sll	t1,a4,0x38
    1792:	97aa                	add	a5,a5,a0
    1794:	ff88f813          	and	a6,a7,-8
    1798:	0066e6b3          	or	a3,a3,t1
    179c:	983e                	add	a6,a6,a5
    179e:	e394                	sd	a3,0(a5)
    17a0:	07a1                	add	a5,a5,8
    17a2:	ff079ee3          	bne	a5,a6,179e <memset+0xc8>
    17a6:	ff88f793          	and	a5,a7,-8
    17aa:	0078f893          	and	a7,a7,7
    17ae:	00f586b3          	add	a3,a1,a5
    17b2:	01c787bb          	addw	a5,a5,t3
    17b6:	0a088b63          	beqz	a7,186c <memset+0x196>
    17ba:	00e68023          	sb	a4,0(a3)
    17be:	0017859b          	addw	a1,a5,1
    17c2:	08c5fb63          	bgeu	a1,a2,1858 <memset+0x182>
    17c6:	00e680a3          	sb	a4,1(a3)
    17ca:	0027859b          	addw	a1,a5,2
    17ce:	08c5f563          	bgeu	a1,a2,1858 <memset+0x182>
    17d2:	00e68123          	sb	a4,2(a3)
    17d6:	0037859b          	addw	a1,a5,3
    17da:	06c5ff63          	bgeu	a1,a2,1858 <memset+0x182>
    17de:	00e681a3          	sb	a4,3(a3)
    17e2:	0047859b          	addw	a1,a5,4
    17e6:	06c5f963          	bgeu	a1,a2,1858 <memset+0x182>
    17ea:	00e68223          	sb	a4,4(a3)
    17ee:	0057859b          	addw	a1,a5,5
    17f2:	06c5f363          	bgeu	a1,a2,1858 <memset+0x182>
    17f6:	00e682a3          	sb	a4,5(a3)
    17fa:	0067859b          	addw	a1,a5,6
    17fe:	04c5fd63          	bgeu	a1,a2,1858 <memset+0x182>
    1802:	00e68323          	sb	a4,6(a3)
    1806:	0077859b          	addw	a1,a5,7
    180a:	04c5f763          	bgeu	a1,a2,1858 <memset+0x182>
    180e:	00e683a3          	sb	a4,7(a3)
    1812:	0087859b          	addw	a1,a5,8
    1816:	04c5f163          	bgeu	a1,a2,1858 <memset+0x182>
    181a:	00e68423          	sb	a4,8(a3)
    181e:	0097859b          	addw	a1,a5,9
    1822:	02c5fb63          	bgeu	a1,a2,1858 <memset+0x182>
    1826:	00e684a3          	sb	a4,9(a3)
    182a:	00a7859b          	addw	a1,a5,10
    182e:	02c5f563          	bgeu	a1,a2,1858 <memset+0x182>
    1832:	00e68523          	sb	a4,10(a3)
    1836:	00b7859b          	addw	a1,a5,11
    183a:	00c5ff63          	bgeu	a1,a2,1858 <memset+0x182>
    183e:	00e685a3          	sb	a4,11(a3)
    1842:	00c7859b          	addw	a1,a5,12
    1846:	00c5f963          	bgeu	a1,a2,1858 <memset+0x182>
    184a:	00e68623          	sb	a4,12(a3)
    184e:	27b5                	addw	a5,a5,13
    1850:	00c7f463          	bgeu	a5,a2,1858 <memset+0x182>
    1854:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1858:	8082                	ret
    185a:	482d                	li	a6,11
    185c:	bd61                	j	16f4 <memset+0x1e>
    char *p = dest;
    185e:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1860:	4e01                	li	t3,0
    1862:	bded                	j	175c <memset+0x86>
    1864:	00150593          	add	a1,a0,1
    1868:	4e05                	li	t3,1
    186a:	bdcd                	j	175c <memset+0x86>
    186c:	8082                	ret
    char *p = dest;
    186e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1870:	4781                	li	a5,0
    1872:	b7a1                	j	17ba <memset+0xe4>
    1874:	00250593          	add	a1,a0,2
    1878:	4e09                	li	t3,2
    187a:	b5cd                	j	175c <memset+0x86>

000000000000187c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    187c:	00054783          	lbu	a5,0(a0)
    1880:	0005c703          	lbu	a4,0(a1)
    1884:	00e79863          	bne	a5,a4,1894 <strcmp+0x18>
    1888:	0505                	add	a0,a0,1
    188a:	0585                	add	a1,a1,1
    188c:	fbe5                	bnez	a5,187c <strcmp>
    188e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1890:	9d19                	subw	a0,a0,a4
    1892:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1894:	0007851b          	sext.w	a0,a5
    1898:	bfe5                	j	1890 <strcmp+0x14>

000000000000189a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    189a:	ca15                	beqz	a2,18ce <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18a0:	167d                	add	a2,a2,-1
    18a2:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a6:	eb99                	bnez	a5,18bc <strncmp+0x22>
    18a8:	a815                	j	18dc <strncmp+0x42>
    18aa:	00a68e63          	beq	a3,a0,18c6 <strncmp+0x2c>
    18ae:	0505                	add	a0,a0,1
    18b0:	00f71b63          	bne	a4,a5,18c6 <strncmp+0x2c>
    18b4:	00054783          	lbu	a5,0(a0)
    18b8:	cf89                	beqz	a5,18d2 <strncmp+0x38>
    18ba:	85b2                	mv	a1,a2
    18bc:	0005c703          	lbu	a4,0(a1)
    18c0:	00158613          	add	a2,a1,1
    18c4:	f37d                	bnez	a4,18aa <strncmp+0x10>
        ;
    return *l - *r;
    18c6:	0007851b          	sext.w	a0,a5
    18ca:	9d19                	subw	a0,a0,a4
    18cc:	8082                	ret
        return 0;
    18ce:	4501                	li	a0,0
}
    18d0:	8082                	ret
    return *l - *r;
    18d2:	0015c703          	lbu	a4,1(a1)
    18d6:	4501                	li	a0,0
    18d8:	9d19                	subw	a0,a0,a4
    18da:	8082                	ret
    18dc:	0005c703          	lbu	a4,0(a1)
    18e0:	4501                	li	a0,0
    18e2:	b7e5                	j	18ca <strncmp+0x30>

00000000000018e4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18e4:	00757793          	and	a5,a0,7
    18e8:	cf89                	beqz	a5,1902 <strlen+0x1e>
    18ea:	87aa                	mv	a5,a0
    18ec:	a029                	j	18f6 <strlen+0x12>
    18ee:	0785                	add	a5,a5,1
    18f0:	0077f713          	and	a4,a5,7
    18f4:	cb01                	beqz	a4,1904 <strlen+0x20>
        if (!*s)
    18f6:	0007c703          	lbu	a4,0(a5)
    18fa:	fb75                	bnez	a4,18ee <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18fc:	40a78533          	sub	a0,a5,a0
}
    1900:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1902:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1904:	6394                	ld	a3,0(a5)
    1906:	00000597          	auipc	a1,0x0
    190a:	7025b583          	ld	a1,1794(a1) # 2008 <__clone+0xde>
    190e:	00000617          	auipc	a2,0x0
    1912:	70263603          	ld	a2,1794(a2) # 2010 <__clone+0xe6>
    1916:	a019                	j	191c <strlen+0x38>
    1918:	6794                	ld	a3,8(a5)
    191a:	07a1                	add	a5,a5,8
    191c:	00b68733          	add	a4,a3,a1
    1920:	fff6c693          	not	a3,a3
    1924:	8f75                	and	a4,a4,a3
    1926:	8f71                	and	a4,a4,a2
    1928:	db65                	beqz	a4,1918 <strlen+0x34>
    for (; *s; s++)
    192a:	0007c703          	lbu	a4,0(a5)
    192e:	d779                	beqz	a4,18fc <strlen+0x18>
    1930:	0017c703          	lbu	a4,1(a5)
    1934:	0785                	add	a5,a5,1
    1936:	d379                	beqz	a4,18fc <strlen+0x18>
    1938:	0017c703          	lbu	a4,1(a5)
    193c:	0785                	add	a5,a5,1
    193e:	fb6d                	bnez	a4,1930 <strlen+0x4c>
    1940:	bf75                	j	18fc <strlen+0x18>

0000000000001942 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1942:	00757713          	and	a4,a0,7
{
    1946:	87aa                	mv	a5,a0
    1948:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194c:	cb19                	beqz	a4,1962 <memchr+0x20>
    194e:	ce25                	beqz	a2,19c6 <memchr+0x84>
    1950:	0007c703          	lbu	a4,0(a5)
    1954:	00b70763          	beq	a4,a1,1962 <memchr+0x20>
    1958:	0785                	add	a5,a5,1
    195a:	0077f713          	and	a4,a5,7
    195e:	167d                	add	a2,a2,-1
    1960:	f77d                	bnez	a4,194e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1962:	4501                	li	a0,0
    if (n && *s != c)
    1964:	c235                	beqz	a2,19c8 <memchr+0x86>
    1966:	0007c703          	lbu	a4,0(a5)
    196a:	06b70063          	beq	a4,a1,19ca <memchr+0x88>
        size_t k = ONES * c;
    196e:	00000517          	auipc	a0,0x0
    1972:	6aa53503          	ld	a0,1706(a0) # 2018 <__clone+0xee>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1976:	471d                	li	a4,7
        size_t k = ONES * c;
    1978:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    197c:	04c77763          	bgeu	a4,a2,19ca <memchr+0x88>
    1980:	00000897          	auipc	a7,0x0
    1984:	6888b883          	ld	a7,1672(a7) # 2008 <__clone+0xde>
    1988:	00000817          	auipc	a6,0x0
    198c:	68883803          	ld	a6,1672(a6) # 2010 <__clone+0xe6>
    1990:	431d                	li	t1,7
    1992:	a029                	j	199c <memchr+0x5a>
    1994:	1661                	add	a2,a2,-8
    1996:	07a1                	add	a5,a5,8
    1998:	00c37c63          	bgeu	t1,a2,19b0 <memchr+0x6e>
    199c:	6398                	ld	a4,0(a5)
    199e:	8f29                	xor	a4,a4,a0
    19a0:	011706b3          	add	a3,a4,a7
    19a4:	fff74713          	not	a4,a4
    19a8:	8f75                	and	a4,a4,a3
    19aa:	01077733          	and	a4,a4,a6
    19ae:	d37d                	beqz	a4,1994 <memchr+0x52>
    19b0:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19b2:	e601                	bnez	a2,19ba <memchr+0x78>
    19b4:	a809                	j	19c6 <memchr+0x84>
    19b6:	0505                	add	a0,a0,1
    19b8:	c619                	beqz	a2,19c6 <memchr+0x84>
    19ba:	00054783          	lbu	a5,0(a0)
    19be:	167d                	add	a2,a2,-1
    19c0:	feb79be3          	bne	a5,a1,19b6 <memchr+0x74>
    19c4:	8082                	ret
    return n ? (void *)s : 0;
    19c6:	4501                	li	a0,0
}
    19c8:	8082                	ret
    if (n && *s != c)
    19ca:	853e                	mv	a0,a5
    19cc:	b7fd                	j	19ba <memchr+0x78>

00000000000019ce <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ce:	1101                	add	sp,sp,-32
    19d0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19d2:	862e                	mv	a2,a1
{
    19d4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19d6:	4581                	li	a1,0
{
    19d8:	e426                	sd	s1,8(sp)
    19da:	ec06                	sd	ra,24(sp)
    19dc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19de:	f65ff0ef          	jal	1942 <memchr>
    return p ? p - s : n;
    19e2:	c519                	beqz	a0,19f0 <strnlen+0x22>
}
    19e4:	60e2                	ld	ra,24(sp)
    19e6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19e8:	8d05                	sub	a0,a0,s1
}
    19ea:	64a2                	ld	s1,8(sp)
    19ec:	6105                	add	sp,sp,32
    19ee:	8082                	ret
    19f0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19f2:	8522                	mv	a0,s0
}
    19f4:	6442                	ld	s0,16(sp)
    19f6:	64a2                	ld	s1,8(sp)
    19f8:	6105                	add	sp,sp,32
    19fa:	8082                	ret

00000000000019fc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19fc:	00a5c7b3          	xor	a5,a1,a0
    1a00:	8b9d                	and	a5,a5,7
    1a02:	eb95                	bnez	a5,1a36 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a04:	0075f793          	and	a5,a1,7
    1a08:	e7b1                	bnez	a5,1a54 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a0a:	6198                	ld	a4,0(a1)
    1a0c:	00000617          	auipc	a2,0x0
    1a10:	5fc63603          	ld	a2,1532(a2) # 2008 <__clone+0xde>
    1a14:	00000817          	auipc	a6,0x0
    1a18:	5fc83803          	ld	a6,1532(a6) # 2010 <__clone+0xe6>
    1a1c:	a029                	j	1a26 <strcpy+0x2a>
    1a1e:	05a1                	add	a1,a1,8
    1a20:	e118                	sd	a4,0(a0)
    1a22:	6198                	ld	a4,0(a1)
    1a24:	0521                	add	a0,a0,8
    1a26:	00c707b3          	add	a5,a4,a2
    1a2a:	fff74693          	not	a3,a4
    1a2e:	8ff5                	and	a5,a5,a3
    1a30:	0107f7b3          	and	a5,a5,a6
    1a34:	d7ed                	beqz	a5,1a1e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a36:	0005c783          	lbu	a5,0(a1)
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	c785                	beqz	a5,1a66 <strcpy+0x6a>
    1a40:	0015c783          	lbu	a5,1(a1)
    1a44:	0505                	add	a0,a0,1
    1a46:	0585                	add	a1,a1,1
    1a48:	00f50023          	sb	a5,0(a0)
    1a4c:	fbf5                	bnez	a5,1a40 <strcpy+0x44>
        ;
    return d;
}
    1a4e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a50:	0505                	add	a0,a0,1
    1a52:	df45                	beqz	a4,1a0a <strcpy+0xe>
            if (!(*d = *s))
    1a54:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a58:	0585                	add	a1,a1,1
    1a5a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a5e:	00f50023          	sb	a5,0(a0)
    1a62:	f7fd                	bnez	a5,1a50 <strcpy+0x54>
}
    1a64:	8082                	ret
    1a66:	8082                	ret

0000000000001a68 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a68:	00a5c7b3          	xor	a5,a1,a0
    1a6c:	8b9d                	and	a5,a5,7
    1a6e:	e3b5                	bnez	a5,1ad2 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a70:	0075f793          	and	a5,a1,7
    1a74:	cf99                	beqz	a5,1a92 <strncpy+0x2a>
    1a76:	ea09                	bnez	a2,1a88 <strncpy+0x20>
    1a78:	a421                	j	1c80 <strncpy+0x218>
    1a7a:	0585                	add	a1,a1,1
    1a7c:	0075f793          	and	a5,a1,7
    1a80:	167d                	add	a2,a2,-1
    1a82:	0505                	add	a0,a0,1
    1a84:	c799                	beqz	a5,1a92 <strncpy+0x2a>
    1a86:	c225                	beqz	a2,1ae6 <strncpy+0x7e>
    1a88:	0005c783          	lbu	a5,0(a1)
    1a8c:	00f50023          	sb	a5,0(a0)
    1a90:	f7ed                	bnez	a5,1a7a <strncpy+0x12>
            ;
        if (!n || !*s)
    1a92:	ca31                	beqz	a2,1ae6 <strncpy+0x7e>
    1a94:	0005c783          	lbu	a5,0(a1)
    1a98:	cba1                	beqz	a5,1ae8 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a9a:	479d                	li	a5,7
    1a9c:	02c7fc63          	bgeu	a5,a2,1ad4 <strncpy+0x6c>
    1aa0:	00000897          	auipc	a7,0x0
    1aa4:	5688b883          	ld	a7,1384(a7) # 2008 <__clone+0xde>
    1aa8:	00000817          	auipc	a6,0x0
    1aac:	56883803          	ld	a6,1384(a6) # 2010 <__clone+0xe6>
    1ab0:	431d                	li	t1,7
    1ab2:	a039                	j	1ac0 <strncpy+0x58>
            *wd = *ws;
    1ab4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab6:	1661                	add	a2,a2,-8
    1ab8:	05a1                	add	a1,a1,8
    1aba:	0521                	add	a0,a0,8
    1abc:	00c37b63          	bgeu	t1,a2,1ad2 <strncpy+0x6a>
    1ac0:	6198                	ld	a4,0(a1)
    1ac2:	011707b3          	add	a5,a4,a7
    1ac6:	fff74693          	not	a3,a4
    1aca:	8ff5                	and	a5,a5,a3
    1acc:	0107f7b3          	and	a5,a5,a6
    1ad0:	d3f5                	beqz	a5,1ab4 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ad2:	ca11                	beqz	a2,1ae6 <strncpy+0x7e>
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	0585                	add	a1,a1,1
    1ada:	00f50023          	sb	a5,0(a0)
    1ade:	c789                	beqz	a5,1ae8 <strncpy+0x80>
    1ae0:	167d                	add	a2,a2,-1
    1ae2:	0505                	add	a0,a0,1
    1ae4:	fa65                	bnez	a2,1ad4 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae6:	8082                	ret
    1ae8:	4805                	li	a6,1
    1aea:	14061b63          	bnez	a2,1c40 <strncpy+0x1d8>
    1aee:	40a00733          	neg	a4,a0
    1af2:	00777793          	and	a5,a4,7
    1af6:	4581                	li	a1,0
    1af8:	12061c63          	bnez	a2,1c30 <strncpy+0x1c8>
    1afc:	00778693          	add	a3,a5,7
    1b00:	48ad                	li	a7,11
    1b02:	1316e563          	bltu	a3,a7,1c2c <strncpy+0x1c4>
    1b06:	16d5e263          	bltu	a1,a3,1c6a <strncpy+0x202>
    1b0a:	14078c63          	beqz	a5,1c62 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b0e:	00050023          	sb	zero,0(a0)
    1b12:	00677693          	and	a3,a4,6
    1b16:	14068263          	beqz	a3,1c5a <strncpy+0x1f2>
    1b1a:	000500a3          	sb	zero,1(a0)
    1b1e:	4689                	li	a3,2
    1b20:	14f6f863          	bgeu	a3,a5,1c70 <strncpy+0x208>
    1b24:	00050123          	sb	zero,2(a0)
    1b28:	8b11                	and	a4,a4,4
    1b2a:	12070463          	beqz	a4,1c52 <strncpy+0x1ea>
    1b2e:	000501a3          	sb	zero,3(a0)
    1b32:	4711                	li	a4,4
    1b34:	00450693          	add	a3,a0,4
    1b38:	02f77563          	bgeu	a4,a5,1b62 <strncpy+0xfa>
    1b3c:	00050223          	sb	zero,4(a0)
    1b40:	4715                	li	a4,5
    1b42:	00550693          	add	a3,a0,5
    1b46:	00e78e63          	beq	a5,a4,1b62 <strncpy+0xfa>
    1b4a:	fff50713          	add	a4,a0,-1
    1b4e:	000502a3          	sb	zero,5(a0)
    1b52:	8b1d                	and	a4,a4,7
    1b54:	12071263          	bnez	a4,1c78 <strncpy+0x210>
    1b58:	00750693          	add	a3,a0,7
    1b5c:	00050323          	sb	zero,6(a0)
    1b60:	471d                	li	a4,7
    1b62:	40f80833          	sub	a6,a6,a5
    1b66:	ff887593          	and	a1,a6,-8
    1b6a:	97aa                	add	a5,a5,a0
    1b6c:	95be                	add	a1,a1,a5
    1b6e:	0007b023          	sd	zero,0(a5)
    1b72:	07a1                	add	a5,a5,8
    1b74:	feb79de3          	bne	a5,a1,1b6e <strncpy+0x106>
    1b78:	ff887593          	and	a1,a6,-8
    1b7c:	00787813          	and	a6,a6,7
    1b80:	00e587bb          	addw	a5,a1,a4
    1b84:	00b68733          	add	a4,a3,a1
    1b88:	0e080063          	beqz	a6,1c68 <strncpy+0x200>
    1b8c:	00070023          	sb	zero,0(a4)
    1b90:	0017869b          	addw	a3,a5,1
    1b94:	f4c6f9e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1b98:	000700a3          	sb	zero,1(a4)
    1b9c:	0027869b          	addw	a3,a5,2
    1ba0:	f4c6f3e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1ba4:	00070123          	sb	zero,2(a4)
    1ba8:	0037869b          	addw	a3,a5,3
    1bac:	f2c6fde3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bb0:	000701a3          	sb	zero,3(a4)
    1bb4:	0047869b          	addw	a3,a5,4
    1bb8:	f2c6f7e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bbc:	00070223          	sb	zero,4(a4)
    1bc0:	0057869b          	addw	a3,a5,5
    1bc4:	f2c6f1e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bc8:	000702a3          	sb	zero,5(a4)
    1bcc:	0067869b          	addw	a3,a5,6
    1bd0:	f0c6fbe3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bd4:	00070323          	sb	zero,6(a4)
    1bd8:	0077869b          	addw	a3,a5,7
    1bdc:	f0c6f5e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1be0:	000703a3          	sb	zero,7(a4)
    1be4:	0087869b          	addw	a3,a5,8
    1be8:	eec6ffe3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bec:	00070423          	sb	zero,8(a4)
    1bf0:	0097869b          	addw	a3,a5,9
    1bf4:	eec6f9e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1bf8:	000704a3          	sb	zero,9(a4)
    1bfc:	00a7869b          	addw	a3,a5,10
    1c00:	eec6f3e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1c04:	00070523          	sb	zero,10(a4)
    1c08:	00b7869b          	addw	a3,a5,11
    1c0c:	ecc6fde3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1c10:	000705a3          	sb	zero,11(a4)
    1c14:	00c7869b          	addw	a3,a5,12
    1c18:	ecc6f7e3          	bgeu	a3,a2,1ae6 <strncpy+0x7e>
    1c1c:	00070623          	sb	zero,12(a4)
    1c20:	27b5                	addw	a5,a5,13
    1c22:	ecc7f2e3          	bgeu	a5,a2,1ae6 <strncpy+0x7e>
    1c26:	000706a3          	sb	zero,13(a4)
}
    1c2a:	8082                	ret
    1c2c:	46ad                	li	a3,11
    1c2e:	bde1                	j	1b06 <strncpy+0x9e>
    1c30:	00778693          	add	a3,a5,7
    1c34:	48ad                	li	a7,11
    1c36:	fff60593          	add	a1,a2,-1
    1c3a:	ed16f6e3          	bgeu	a3,a7,1b06 <strncpy+0x9e>
    1c3e:	b7fd                	j	1c2c <strncpy+0x1c4>
    1c40:	40a00733          	neg	a4,a0
    1c44:	8832                	mv	a6,a2
    1c46:	00777793          	and	a5,a4,7
    1c4a:	4581                	li	a1,0
    1c4c:	ea0608e3          	beqz	a2,1afc <strncpy+0x94>
    1c50:	b7c5                	j	1c30 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c52:	00350693          	add	a3,a0,3
    1c56:	470d                	li	a4,3
    1c58:	b729                	j	1b62 <strncpy+0xfa>
    1c5a:	00150693          	add	a3,a0,1
    1c5e:	4705                	li	a4,1
    1c60:	b709                	j	1b62 <strncpy+0xfa>
tail:
    1c62:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c64:	4701                	li	a4,0
    1c66:	bdf5                	j	1b62 <strncpy+0xfa>
    1c68:	8082                	ret
tail:
    1c6a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6c:	4781                	li	a5,0
    1c6e:	bf39                	j	1b8c <strncpy+0x124>
    1c70:	00250693          	add	a3,a0,2
    1c74:	4709                	li	a4,2
    1c76:	b5f5                	j	1b62 <strncpy+0xfa>
    1c78:	00650693          	add	a3,a0,6
    1c7c:	4719                	li	a4,6
    1c7e:	b5d5                	j	1b62 <strncpy+0xfa>
    1c80:	8082                	ret

0000000000001c82 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c82:	87aa                	mv	a5,a0
    1c84:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c86:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c8e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c90:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c92:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <openat>:
    register long a7 __asm__("a7") = n;
    1c9a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c9e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca2:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <close>:
    register long a7 __asm__("a7") = n;
    1caa:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cae:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <read>:
    register long a7 __asm__("a7") = n;
    1cb6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cba:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cbe:	8082                	ret

0000000000001cc0 <write>:
    register long a7 __asm__("a7") = n;
    1cc0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cc8:	8082                	ret

0000000000001cca <getpid>:
    register long a7 __asm__("a7") = n;
    1cca:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cce:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	8082                	ret

0000000000001cd6 <getppid>:
    register long a7 __asm__("a7") = n;
    1cd6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cda:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cde:	2501                	sext.w	a0,a0
    1ce0:	8082                	ret

0000000000001ce2 <sys_set_tid_address>:
    register long a7 __asm__("a7") = n;
    1ce2:	06000893          	li	a7,96
    __asm_syscall("r"(a7), "0"(a0))
    1ce6:	00000073          	ecall

int sys_set_tid_address(int *tidptr)
{
    return syscall(SYS_set_tid_address, tidptr);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cee:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cf2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <fork>:
    register long a7 __asm__("a7") = n;
    1cfa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cfe:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d00:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d02:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d0a:	85b2                	mv	a1,a2
    1d0c:	863a                	mv	a2,a4
    if (stack)
    1d0e:	c191                	beqz	a1,1d12 <clone+0x8>
	stack += stack_size;
    1d10:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d12:	4781                	li	a5,0
    1d14:	4701                	li	a4,0
    1d16:	4681                	li	a3,0
    1d18:	2601                	sext.w	a2,a2
    1d1a:	ac01                	j	1f2a <__clone>

0000000000001d1c <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d1c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d20:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d24:	8082                	ret

0000000000001d26 <exit>:
    register long a7 __asm__("a7") = n;
    1d26:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d2a:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d2e:	8082                	ret

0000000000001d30 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d30:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d34:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d36:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <exec>:
    register long a7 __asm__("a7") = n;
    1d3e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d42:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <execve>:
    register long a7 __asm__("a7") = n;
    1d4a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <times>:
    register long a7 __asm__("a7") = n;
    1d56:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d5a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <get_time>:

int64 get_time()
{
    1d62:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d64:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d68:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d70:	2501                	sext.w	a0,a0
    1d72:	ed09                	bnez	a0,1d8c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d74:	67a2                	ld	a5,8(sp)
    1d76:	3e800713          	li	a4,1000
    1d7a:	00015503          	lhu	a0,0(sp)
    1d7e:	02e7d7b3          	divu	a5,a5,a4
    1d82:	02e50533          	mul	a0,a0,a4
    1d86:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d88:	0141                	add	sp,sp,16
    1d8a:	8082                	ret
        return -1;
    1d8c:	557d                	li	a0,-1
    1d8e:	bfed                	j	1d88 <get_time+0x26>

0000000000001d90 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d90:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d94:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <time>:
    register long a7 __asm__("a7") = n;
    1d9c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1da0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <sleep>:

int sleep(unsigned long long time)
{
    1da8:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1daa:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dac:	850a                	mv	a0,sp
    1dae:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1db0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1db4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dba:	e501                	bnez	a0,1dc2 <sleep+0x1a>
    return 0;
    1dbc:	4501                	li	a0,0
}
    1dbe:	0141                	add	sp,sp,16
    1dc0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dc2:	4502                	lw	a0,0(sp)
}
    1dc4:	0141                	add	sp,sp,16
    1dc6:	8082                	ret

0000000000001dc8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dc8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dd4:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dd8:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ddc:	8082                	ret

0000000000001dde <mprotect>:
    register long a7 __asm__("a7") = n;
    1dde:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <munmap>:
    register long a7 __asm__("a7") = n;
    1dea:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dee:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <wait>:

int wait(int *code)
{
    1df6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df8:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dfc:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dfe:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e00:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e02:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <spawn>:
    register long a7 __asm__("a7") = n;
    1e0a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <mailread>:
    register long a7 __asm__("a7") = n;
    1e16:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e22:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e26:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <fstat>:
    register long a7 __asm__("a7") = n;
    1e2e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e32:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e3a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3c:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e40:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e4a:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e4c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e50:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e52:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e5a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e60:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e62:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <link>:

int link(char *old_path, char *new_path)
{
    1e6a:	87aa                	mv	a5,a0
    1e6c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e6e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e72:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e76:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e78:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e7c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <unlink>:

int unlink(char *path)
{
    1e86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e88:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e8c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e90:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <uname>:
    register long a7 __asm__("a7") = n;
    1e9a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e9e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <brk>:
    register long a7 __asm__("a7") = n;
    1ea6:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eaa:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <getcwd>:
    register long a7 __asm__("a7") = n;
    1eb2:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1eb8:	8082                	ret

0000000000001eba <chdir>:
    register long a7 __asm__("a7") = n;
    1eba:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ebe:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ec6:	862e                	mv	a2,a1
    1ec8:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1eca:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ecc:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ed0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ed4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ed6:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed8:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <getdents>:
    register long a7 __asm__("a7") = n;
    1ee0:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee4:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <pipe>:
    register long a7 __asm__("a7") = n;
    1eec:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ef0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef2:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <dup>:
    register long a7 __asm__("a7") = n;
    1efa:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1efc:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <dup2>:
    register long a7 __asm__("a7") = n;
    1f04:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f06:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f08:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <mount>:
    register long a7 __asm__("a7") = n;
    1f10:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f14:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <umount>:
    register long a7 __asm__("a7") = n;
    1f1c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f2a:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f2c:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f2e:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f30:	8532                	mv	a0,a2
	mv a2, a4
    1f32:	863a                	mv	a2,a4
	mv a3, a5
    1f34:	86be                	mv	a3,a5
	mv a4, a6
    1f36:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f38:	0dc00893          	li	a7,220
	ecall
    1f3c:	00000073          	ecall

	beqz a0, 1f
    1f40:	c111                	beqz	a0,1f44 <__clone+0x1a>
	# Parent
	ret
    1f42:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f44:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f46:	6522                	ld	a0,8(sp)
	jalr a1
    1f48:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f4a:	05d00893          	li	a7,93
	ecall
    1f4e:	00000073          	ecall
