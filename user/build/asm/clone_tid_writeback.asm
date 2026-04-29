
/home/hbh/oslab/oslab/user/build/riscv64/clone_tid_writeback:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a29d                	j	1168 <__start_main>

0000000000001004 <test_clone_tid_writeback>:
    printf("child_tid seen in child: %d\n", child_tid);
    return 0;
}

void test_clone_tid_writeback(void)
{
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	faa50513          	add	a0,a0,-86 # 1fb0 <__clone+0x2e>
{
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    1014:	e84a                	sd	s2,16(sp)
    TEST_START(__func__);
    1016:	3aa000ef          	jal	13c0 <puts>
    101a:	00003517          	auipc	a0,0x3
    101e:	07e50513          	add	a0,a0,126 # 4098 <__func__.0>
    1022:	39e000ef          	jal	13c0 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	fa250513          	add	a0,a0,-94 # 1fc8 <__clone+0x46>
    102e:	392000ef          	jal	13c0 <puts>

    int pid = (int)sys_clone_raw(SIGCHLD, stack_tid + 1024, &parent_tid, 0, &child_tid);
    1032:	00003717          	auipc	a4,0x3
    1036:	09e70713          	add	a4,a4,158 # 40d0 <child_tid>
    103a:	4681                	li	a3,0
    103c:	00003617          	auipc	a2,0x3
    1040:	09060613          	add	a2,a2,144 # 40cc <parent_tid>
    1044:	00003597          	auipc	a1,0x3
    1048:	05458593          	add	a1,a1,84 # 4098 <__func__.0>
    104c:	4545                	li	a0,17
    104e:	527000ef          	jal	1d74 <sys_clone_raw>
    1052:	0005041b          	sext.w	s0,a0
    printf("clone ret: %d\n", pid);
    1056:	85a2                	mv	a1,s0
    1058:	00001517          	auipc	a0,0x1
    105c:	f8050513          	add	a0,a0,-128 # 1fd8 <__clone+0x56>
    1060:	382000ef          	jal	13e2 <printf>
    assert(pid != -1);
    1064:	57fd                	li	a5,-1
    1066:	04f40a63          	beq	s0,a5,10ba <test_clone_tid_writeback+0xb6>

    if(pid == 0) {
    106a:	ec31                	bnez	s0,10c6 <test_clone_tid_writeback+0xc2>
    printf("child_tid seen in child: %d\n", child_tid);
    106c:	00003417          	auipc	s0,0x3
    1070:	06440413          	add	s0,s0,100 # 40d0 <child_tid>
    1074:	400c                	lw	a1,0(s0)
    1076:	00001517          	auipc	a0,0x1
    107a:	f9250513          	add	a0,a0,-110 # 2008 <__clone+0x86>
    107e:	364000ef          	jal	13e2 <printf>
        child_func_tid();
        assert(child_tid > 0);
    1082:	401c                	lw	a5,0(s0)
    1084:	0cf05363          	blez	a5,114a <test_clone_tid_writeback+0x146>
        exit(0);
    1088:	4501                	li	a0,0
    108a:	4f5000ef          	jal	1d7e <exit>
        assert(parent_tid == pid);
        assert(child_tid == pid);
        printf("clone tid writeback success.\n");
    }

    TEST_END(__func__);
    108e:	00001517          	auipc	a0,0x1
    1092:	fda50513          	add	a0,a0,-38 # 2068 <__clone+0xe6>
    1096:	32a000ef          	jal	13c0 <puts>
    109a:	00003517          	auipc	a0,0x3
    109e:	ffe50513          	add	a0,a0,-2 # 4098 <__func__.0>
    10a2:	31e000ef          	jal	13c0 <puts>
}
    10a6:	7402                	ld	s0,32(sp)
    10a8:	70a2                	ld	ra,40(sp)
    10aa:	64e2                	ld	s1,24(sp)
    10ac:	6942                	ld	s2,16(sp)
    TEST_END(__func__);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	f1a50513          	add	a0,a0,-230 # 1fc8 <__clone+0x46>
}
    10b6:	6145                	add	sp,sp,48
    TEST_END(__func__);
    10b8:	a621                	j	13c0 <puts>
    assert(pid != -1);
    10ba:	00001517          	auipc	a0,0x1
    10be:	f2e50513          	add	a0,a0,-210 # 1fe8 <__clone+0x66>
    10c2:	59a000ef          	jal	165c <panic>
        waitpid((int)pid, &status, 0);
    10c6:	4601                	li	a2,0
    10c8:	006c                	add	a1,sp,12
    10ca:	8522                	mv	a0,s0
        printf("parent_tid: %d\n", parent_tid);
    10cc:	00003917          	auipc	s2,0x3
    10d0:	00090913          	mv	s2,s2
        int status = 0;
    10d4:	c602                	sw	zero,12(sp)
        waitpid((int)pid, &status, 0);
    10d6:	4b3000ef          	jal	1d88 <waitpid>
        printf("parent_tid: %d\n", parent_tid);
    10da:	00092583          	lw	a1,0(s2) # 40cc <parent_tid>
    10de:	00001517          	auipc	a0,0x1
    10e2:	f4a50513          	add	a0,a0,-182 # 2028 <__clone+0xa6>
        printf("child_tid: %d\n", child_tid);
    10e6:	00003497          	auipc	s1,0x3
    10ea:	fea48493          	add	s1,s1,-22 # 40d0 <child_tid>
        printf("parent_tid: %d\n", parent_tid);
    10ee:	2f4000ef          	jal	13e2 <printf>
        printf("child_tid: %d\n", child_tid);
    10f2:	408c                	lw	a1,0(s1)
    10f4:	00001517          	auipc	a0,0x1
    10f8:	f4450513          	add	a0,a0,-188 # 2038 <__clone+0xb6>
    10fc:	2e6000ef          	jal	13e2 <printf>
        assert(parent_tid == pid);
    1100:	00092783          	lw	a5,0(s2)
    1104:	02879963          	bne	a5,s0,1136 <test_clone_tid_writeback+0x132>
        assert(child_tid == pid);
    1108:	409c                	lw	a5,0(s1)
    110a:	00879963          	bne	a5,s0,111c <test_clone_tid_writeback+0x118>
        printf("clone tid writeback success.\n");
    110e:	00001517          	auipc	a0,0x1
    1112:	f3a50513          	add	a0,a0,-198 # 2048 <__clone+0xc6>
    1116:	2cc000ef          	jal	13e2 <printf>
    111a:	bf95                	j	108e <test_clone_tid_writeback+0x8a>
        assert(child_tid == pid);
    111c:	00001517          	auipc	a0,0x1
    1120:	ecc50513          	add	a0,a0,-308 # 1fe8 <__clone+0x66>
    1124:	538000ef          	jal	165c <panic>
        printf("clone tid writeback success.\n");
    1128:	00001517          	auipc	a0,0x1
    112c:	f2050513          	add	a0,a0,-224 # 2048 <__clone+0xc6>
    1130:	2b2000ef          	jal	13e2 <printf>
    1134:	bfa9                	j	108e <test_clone_tid_writeback+0x8a>
        assert(parent_tid == pid);
    1136:	00001517          	auipc	a0,0x1
    113a:	eb250513          	add	a0,a0,-334 # 1fe8 <__clone+0x66>
    113e:	51e000ef          	jal	165c <panic>
        assert(child_tid == pid);
    1142:	409c                	lw	a5,0(s1)
    1144:	fc8785e3          	beq	a5,s0,110e <test_clone_tid_writeback+0x10a>
    1148:	bfd1                	j	111c <test_clone_tid_writeback+0x118>
        assert(child_tid > 0);
    114a:	00001517          	auipc	a0,0x1
    114e:	e9e50513          	add	a0,a0,-354 # 1fe8 <__clone+0x66>
    1152:	50a000ef          	jal	165c <panic>
    1156:	bf0d                	j	1088 <test_clone_tid_writeback+0x84>

0000000000001158 <main>:

int main(void)
{
    1158:	1141                	add	sp,sp,-16
    115a:	e406                	sd	ra,8(sp)
    test_clone_tid_writeback();
    115c:	ea9ff0ef          	jal	1004 <test_clone_tid_writeback>
    return 0;
}
    1160:	60a2                	ld	ra,8(sp)
    1162:	4501                	li	a0,0
    1164:	0141                	add	sp,sp,16
    1166:	8082                	ret

0000000000001168 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1168:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    116a:	4108                	lw	a0,0(a0)
{
    116c:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    116e:	05a1                	add	a1,a1,8
{
    1170:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1172:	fe7ff0ef          	jal	1158 <main>
    1176:	409000ef          	jal	1d7e <exit>
	return 0;
}
    117a:	60a2                	ld	ra,8(sp)
    117c:	4501                	li	a0,0
    117e:	0141                	add	sp,sp,16
    1180:	8082                	ret

0000000000001182 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1182:	7179                	add	sp,sp,-48
    1184:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1186:	12054863          	bltz	a0,12b6 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    118a:	02b577bb          	remuw	a5,a0,a1
    118e:	00003697          	auipc	a3,0x3
    1192:	f2a68693          	add	a3,a3,-214 # 40b8 <digits>
    buf[16] = 0;
    1196:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    119a:	0005871b          	sext.w	a4,a1
    119e:	1782                	sll	a5,a5,0x20
    11a0:	9381                	srl	a5,a5,0x20
    11a2:	97b6                	add	a5,a5,a3
    11a4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11a8:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11ac:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11b0:	1ab56663          	bltu	a0,a1,135c <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11b4:	02e8763b          	remuw	a2,a6,a4
    11b8:	1602                	sll	a2,a2,0x20
    11ba:	9201                	srl	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c6:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11ca:	12e86c63          	bltu	a6,a4,1302 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11ce:	02e5f63b          	remuw	a2,a1,a4
    11d2:	1602                	sll	a2,a2,0x20
    11d4:	9201                	srl	a2,a2,0x20
    11d6:	9636                	add	a2,a2,a3
    11d8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11dc:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e0:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11e4:	12e5e863          	bltu	a1,a4,1314 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11e8:	02e8763b          	remuw	a2,a6,a4
    11ec:	1602                	sll	a2,a2,0x20
    11ee:	9201                	srl	a2,a2,0x20
    11f0:	9636                	add	a2,a2,a3
    11f2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fa:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11fe:	12e86463          	bltu	a6,a4,1326 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1202:	02e5f63b          	remuw	a2,a1,a4
    1206:	1602                	sll	a2,a2,0x20
    1208:	9201                	srl	a2,a2,0x20
    120a:	9636                	add	a2,a2,a3
    120c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1210:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1214:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1218:	12e5e063          	bltu	a1,a4,1338 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    121c:	02e8763b          	remuw	a2,a6,a4
    1220:	1602                	sll	a2,a2,0x20
    1222:	9201                	srl	a2,a2,0x20
    1224:	9636                	add	a2,a2,a3
    1226:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    122e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1232:	0ae86f63          	bltu	a6,a4,12f0 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1236:	02e5f63b          	remuw	a2,a1,a4
    123a:	1602                	sll	a2,a2,0x20
    123c:	9201                	srl	a2,a2,0x20
    123e:	9636                	add	a2,a2,a3
    1240:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1244:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1248:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    124c:	0ee5ef63          	bltu	a1,a4,134a <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1250:	02e8763b          	remuw	a2,a6,a4
    1254:	1602                	sll	a2,a2,0x20
    1256:	9201                	srl	a2,a2,0x20
    1258:	9636                	add	a2,a2,a3
    125a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    125e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1262:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1266:	0ee86d63          	bltu	a6,a4,1360 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    126a:	02e5f63b          	remuw	a2,a1,a4
    126e:	1602                	sll	a2,a2,0x20
    1270:	9201                	srl	a2,a2,0x20
    1272:	9636                	add	a2,a2,a3
    1274:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1278:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    127c:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1280:	0ee5e963          	bltu	a1,a4,1372 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1284:	1782                	sll	a5,a5,0x20
    1286:	9381                	srl	a5,a5,0x20
    1288:	96be                	add	a3,a3,a5
    128a:	0006c783          	lbu	a5,0(a3)
    128e:	4599                	li	a1,6
    1290:	00f10723          	sb	a5,14(sp)

    if (sign)
    1294:	00055763          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12a0:	4595                	li	a1,5
    write(f, s, l);
    12a2:	003c                	add	a5,sp,8
    12a4:	4641                	li	a2,16
    12a6:	9e0d                	subw	a2,a2,a1
    12a8:	4505                	li	a0,1
    12aa:	95be                	add	a1,a1,a5
    12ac:	26d000ef          	jal	1d18 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12b0:	70a2                	ld	ra,40(sp)
    12b2:	6145                	add	sp,sp,48
    12b4:	8082                	ret
        x = -xx;
    12b6:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12ba:	02b677bb          	remuw	a5,a2,a1
    12be:	00003697          	auipc	a3,0x3
    12c2:	dfa68693          	add	a3,a3,-518 # 40b8 <digits>
    buf[16] = 0;
    12c6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12ca:	0005871b          	sext.w	a4,a1
    12ce:	1782                	sll	a5,a5,0x20
    12d0:	9381                	srl	a5,a5,0x20
    12d2:	97b6                	add	a5,a5,a3
    12d4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12d8:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12dc:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12e0:	ecb67ae3          	bgeu	a2,a1,11b4 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12e4:	02d00793          	li	a5,45
    12e8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12ec:	45b9                	li	a1,14
    12ee:	bf55                	j	12a2 <printint.constprop.0+0x120>
    12f0:	45a9                	li	a1,10
    if (sign)
    12f2:	fa0558e3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f6:	02d00793          	li	a5,45
    12fa:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12fe:	45a5                	li	a1,9
    1300:	b74d                	j	12a2 <printint.constprop.0+0x120>
    1302:	45b9                	li	a1,14
    if (sign)
    1304:	f8055fe3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1308:	02d00793          	li	a5,45
    130c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1310:	45b5                	li	a1,13
    1312:	bf41                	j	12a2 <printint.constprop.0+0x120>
    1314:	45b5                	li	a1,13
    if (sign)
    1316:	f80556e3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    131a:	02d00793          	li	a5,45
    131e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1322:	45b1                	li	a1,12
    1324:	bfbd                	j	12a2 <printint.constprop.0+0x120>
    1326:	45b1                	li	a1,12
    if (sign)
    1328:	f6055de3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    132c:	02d00793          	li	a5,45
    1330:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1334:	45ad                	li	a1,11
    1336:	b7b5                	j	12a2 <printint.constprop.0+0x120>
    1338:	45ad                	li	a1,11
    if (sign)
    133a:	f60554e3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    133e:	02d00793          	li	a5,45
    1342:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1346:	45a9                	li	a1,10
    1348:	bfa9                	j	12a2 <printint.constprop.0+0x120>
    134a:	45a5                	li	a1,9
    if (sign)
    134c:	f4055be3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1350:	02d00793          	li	a5,45
    1354:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1358:	45a1                	li	a1,8
    135a:	b7a1                	j	12a2 <printint.constprop.0+0x120>
    i = 15;
    135c:	45bd                	li	a1,15
    135e:	b791                	j	12a2 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1360:	45a1                	li	a1,8
    if (sign)
    1362:	f40550e3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1366:	02d00793          	li	a5,45
    136a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    136e:	459d                	li	a1,7
    1370:	bf0d                	j	12a2 <printint.constprop.0+0x120>
    1372:	459d                	li	a1,7
    if (sign)
    1374:	f20557e3          	bgez	a0,12a2 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1378:	02d00793          	li	a5,45
    137c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1380:	4599                	li	a1,6
    1382:	b705                	j	12a2 <printint.constprop.0+0x120>

0000000000001384 <getchar>:
{
    1384:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1386:	00f10593          	add	a1,sp,15
    138a:	4605                	li	a2,1
    138c:	4501                	li	a0,0
{
    138e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1390:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1394:	17b000ef          	jal	1d0e <read>
}
    1398:	60e2                	ld	ra,24(sp)
    139a:	00f14503          	lbu	a0,15(sp)
    139e:	6105                	add	sp,sp,32
    13a0:	8082                	ret

00000000000013a2 <putchar>:
{
    13a2:	1101                	add	sp,sp,-32
    13a4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13a6:	00f10593          	add	a1,sp,15
    13aa:	4605                	li	a2,1
    13ac:	4505                	li	a0,1
{
    13ae:	ec06                	sd	ra,24(sp)
    char byte = c;
    13b0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13b4:	165000ef          	jal	1d18 <write>
}
    13b8:	60e2                	ld	ra,24(sp)
    13ba:	2501                	sext.w	a0,a0
    13bc:	6105                	add	sp,sp,32
    13be:	8082                	ret

00000000000013c0 <puts>:
{
    13c0:	1141                	add	sp,sp,-16
    13c2:	e406                	sd	ra,8(sp)
    13c4:	e022                	sd	s0,0(sp)
    13c6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13c8:	574000ef          	jal	193c <strlen>
    13cc:	862a                	mv	a2,a0
    13ce:	85a2                	mv	a1,s0
    13d0:	4505                	li	a0,1
    13d2:	147000ef          	jal	1d18 <write>
}
    13d6:	60a2                	ld	ra,8(sp)
    13d8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13da:	957d                	sra	a0,a0,0x3f
    return r;
    13dc:	2501                	sext.w	a0,a0
}
    13de:	0141                	add	sp,sp,16
    13e0:	8082                	ret

00000000000013e2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13e2:	7171                	add	sp,sp,-176
    13e4:	f85a                	sd	s6,48(sp)
    13e6:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13e8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13ea:	18bc                	add	a5,sp,120
{
    13ec:	e8ca                	sd	s2,80(sp)
    13ee:	e4ce                	sd	s3,72(sp)
    13f0:	e0d2                	sd	s4,64(sp)
    13f2:	fc56                	sd	s5,56(sp)
    13f4:	f486                	sd	ra,104(sp)
    13f6:	f0a2                	sd	s0,96(sp)
    13f8:	eca6                	sd	s1,88(sp)
    13fa:	fcae                	sd	a1,120(sp)
    13fc:	e132                	sd	a2,128(sp)
    13fe:	e536                	sd	a3,136(sp)
    1400:	e93a                	sd	a4,144(sp)
    1402:	f142                	sd	a6,160(sp)
    1404:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1406:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1408:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    140c:	07300a13          	li	s4,115
    1410:	07800a93          	li	s5,120
    buf[i++] = '0';
    1414:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1418:	00003997          	auipc	s3,0x3
    141c:	ca098993          	add	s3,s3,-864 # 40b8 <digits>
        if (!*s)
    1420:	00054783          	lbu	a5,0(a0)
    1424:	16078a63          	beqz	a5,1598 <printf+0x1b6>
    1428:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    142a:	19278d63          	beq	a5,s2,15c4 <printf+0x1e2>
    142e:	00164783          	lbu	a5,1(a2)
    1432:	0605                	add	a2,a2,1
    1434:	fbfd                	bnez	a5,142a <printf+0x48>
    1436:	84b2                	mv	s1,a2
        l = z - a;
    1438:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    143c:	85aa                	mv	a1,a0
    143e:	8622                	mv	a2,s0
    1440:	4505                	li	a0,1
    1442:	0d7000ef          	jal	1d18 <write>
        if (l)
    1446:	1a041463          	bnez	s0,15ee <printf+0x20c>
        if (s[1] == 0)
    144a:	0014c783          	lbu	a5,1(s1)
    144e:	14078563          	beqz	a5,1598 <printf+0x1b6>
        switch (s[1])
    1452:	1b478063          	beq	a5,s4,15f2 <printf+0x210>
    1456:	14fa6b63          	bltu	s4,a5,15ac <printf+0x1ca>
    145a:	06400713          	li	a4,100
    145e:	1ee78063          	beq	a5,a4,163e <printf+0x25c>
    1462:	07000713          	li	a4,112
    1466:	1ae79963          	bne	a5,a4,1618 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    146a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    146c:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1470:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1472:	631c                	ld	a5,0(a4)
    1474:	0721                	add	a4,a4,8
    1476:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1478:	00479293          	sll	t0,a5,0x4
    147c:	00879f93          	sll	t6,a5,0x8
    1480:	00c79f13          	sll	t5,a5,0xc
    1484:	01079e93          	sll	t4,a5,0x10
    1488:	01479e13          	sll	t3,a5,0x14
    148c:	01879313          	sll	t1,a5,0x18
    1490:	01c79893          	sll	a7,a5,0x1c
    1494:	02479813          	sll	a6,a5,0x24
    1498:	02879513          	sll	a0,a5,0x28
    149c:	02c79593          	sll	a1,a5,0x2c
    14a0:	03079693          	sll	a3,a5,0x30
    14a4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a8:	03c7d413          	srl	s0,a5,0x3c
    14ac:	01c7d39b          	srlw	t2,a5,0x1c
    14b0:	03c2d293          	srl	t0,t0,0x3c
    14b4:	03cfdf93          	srl	t6,t6,0x3c
    14b8:	03cf5f13          	srl	t5,t5,0x3c
    14bc:	03cede93          	srl	t4,t4,0x3c
    14c0:	03ce5e13          	srl	t3,t3,0x3c
    14c4:	03c35313          	srl	t1,t1,0x3c
    14c8:	03c8d893          	srl	a7,a7,0x3c
    14cc:	03c85813          	srl	a6,a6,0x3c
    14d0:	9171                	srl	a0,a0,0x3c
    14d2:	91f1                	srl	a1,a1,0x3c
    14d4:	92f1                	srl	a3,a3,0x3c
    14d6:	9371                	srl	a4,a4,0x3c
    14d8:	96ce                	add	a3,a3,s3
    14da:	974e                	add	a4,a4,s3
    14dc:	944e                	add	s0,s0,s3
    14de:	92ce                	add	t0,t0,s3
    14e0:	9fce                	add	t6,t6,s3
    14e2:	9f4e                	add	t5,t5,s3
    14e4:	9ece                	add	t4,t4,s3
    14e6:	9e4e                	add	t3,t3,s3
    14e8:	934e                	add	t1,t1,s3
    14ea:	98ce                	add	a7,a7,s3
    14ec:	93ce                	add	t2,t2,s3
    14ee:	984e                	add	a6,a6,s3
    14f0:	954e                	add	a0,a0,s3
    14f2:	95ce                	add	a1,a1,s3
    14f4:	0006c083          	lbu	ra,0(a3)
    14f8:	0002c283          	lbu	t0,0(t0)
    14fc:	00074683          	lbu	a3,0(a4)
    1500:	000fcf83          	lbu	t6,0(t6)
    1504:	000f4f03          	lbu	t5,0(t5)
    1508:	000ece83          	lbu	t4,0(t4)
    150c:	000e4e03          	lbu	t3,0(t3)
    1510:	00034303          	lbu	t1,0(t1)
    1514:	0008c883          	lbu	a7,0(a7)
    1518:	0003c383          	lbu	t2,0(t2)
    151c:	00084803          	lbu	a6,0(a6)
    1520:	00054503          	lbu	a0,0(a0)
    1524:	0005c583          	lbu	a1,0(a1)
    1528:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    152c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1530:	9371                	srl	a4,a4,0x3c
    1532:	8bbd                	and	a5,a5,15
    1534:	974e                	add	a4,a4,s3
    1536:	97ce                	add	a5,a5,s3
    1538:	005105a3          	sb	t0,11(sp)
    153c:	01f10623          	sb	t6,12(sp)
    1540:	01e106a3          	sb	t5,13(sp)
    1544:	01d10723          	sb	t4,14(sp)
    1548:	01c107a3          	sb	t3,15(sp)
    154c:	00610823          	sb	t1,16(sp)
    1550:	011108a3          	sb	a7,17(sp)
    1554:	00710923          	sb	t2,18(sp)
    1558:	010109a3          	sb	a6,19(sp)
    155c:	00a10a23          	sb	a0,20(sp)
    1560:	00b10aa3          	sb	a1,21(sp)
    1564:	00110b23          	sb	ra,22(sp)
    1568:	00d10ba3          	sb	a3,23(sp)
    156c:	00810523          	sb	s0,10(sp)
    1570:	00074703          	lbu	a4,0(a4)
    1574:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1578:	002c                	add	a1,sp,8
    157a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    157c:	00e10c23          	sb	a4,24(sp)
    1580:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1584:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1588:	790000ef          	jal	1d18 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    158c:	00248513          	add	a0,s1,2
        if (!*s)
    1590:	00054783          	lbu	a5,0(a0)
    1594:	e8079ae3          	bnez	a5,1428 <printf+0x46>
    }
    va_end(ap);
}
    1598:	70a6                	ld	ra,104(sp)
    159a:	7406                	ld	s0,96(sp)
    159c:	64e6                	ld	s1,88(sp)
    159e:	6946                	ld	s2,80(sp)
    15a0:	69a6                	ld	s3,72(sp)
    15a2:	6a06                	ld	s4,64(sp)
    15a4:	7ae2                	ld	s5,56(sp)
    15a6:	7b42                	ld	s6,48(sp)
    15a8:	614d                	add	sp,sp,176
    15aa:	8082                	ret
        switch (s[1])
    15ac:	07579663          	bne	a5,s5,1618 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15b0:	6782                	ld	a5,0(sp)
    15b2:	45c1                	li	a1,16
    15b4:	4388                	lw	a0,0(a5)
    15b6:	07a1                	add	a5,a5,8
    15b8:	e03e                	sd	a5,0(sp)
    15ba:	bc9ff0ef          	jal	1182 <printint.constprop.0>
        s += 2;
    15be:	00248513          	add	a0,s1,2
    15c2:	b7f9                	j	1590 <printf+0x1ae>
    15c4:	84b2                	mv	s1,a2
    15c6:	a039                	j	15d4 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15c8:	0024c783          	lbu	a5,2(s1)
    15cc:	0605                	add	a2,a2,1
    15ce:	0489                	add	s1,s1,2
    15d0:	e72794e3          	bne	a5,s2,1438 <printf+0x56>
    15d4:	0014c783          	lbu	a5,1(s1)
    15d8:	ff2788e3          	beq	a5,s2,15c8 <printf+0x1e6>
        l = z - a;
    15dc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15e0:	85aa                	mv	a1,a0
    15e2:	8622                	mv	a2,s0
    15e4:	4505                	li	a0,1
    15e6:	732000ef          	jal	1d18 <write>
        if (l)
    15ea:	e60400e3          	beqz	s0,144a <printf+0x68>
    15ee:	8526                	mv	a0,s1
    15f0:	bd05                	j	1420 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15f2:	6782                	ld	a5,0(sp)
    15f4:	6380                	ld	s0,0(a5)
    15f6:	07a1                	add	a5,a5,8
    15f8:	e03e                	sd	a5,0(sp)
    15fa:	cc21                	beqz	s0,1652 <printf+0x270>
            l = strnlen(a, 200);
    15fc:	0c800593          	li	a1,200
    1600:	8522                	mv	a0,s0
    1602:	424000ef          	jal	1a26 <strnlen>
    write(f, s, l);
    1606:	0005061b          	sext.w	a2,a0
    160a:	85a2                	mv	a1,s0
    160c:	4505                	li	a0,1
    160e:	70a000ef          	jal	1d18 <write>
        s += 2;
    1612:	00248513          	add	a0,s1,2
    1616:	bfad                	j	1590 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1618:	4605                	li	a2,1
    161a:	002c                	add	a1,sp,8
    161c:	4505                	li	a0,1
    char byte = c;
    161e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1622:	6f6000ef          	jal	1d18 <write>
    char byte = c;
    1626:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    162a:	4605                	li	a2,1
    162c:	002c                	add	a1,sp,8
    162e:	4505                	li	a0,1
    char byte = c;
    1630:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1634:	6e4000ef          	jal	1d18 <write>
        s += 2;
    1638:	00248513          	add	a0,s1,2
    163c:	bf91                	j	1590 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    163e:	6782                	ld	a5,0(sp)
    1640:	45a9                	li	a1,10
    1642:	4388                	lw	a0,0(a5)
    1644:	07a1                	add	a5,a5,8
    1646:	e03e                	sd	a5,0(sp)
    1648:	b3bff0ef          	jal	1182 <printint.constprop.0>
        s += 2;
    164c:	00248513          	add	a0,s1,2
    1650:	b781                	j	1590 <printf+0x1ae>
                a = "(null)";
    1652:	00001417          	auipc	s0,0x1
    1656:	a2640413          	add	s0,s0,-1498 # 2078 <__clone+0xf6>
    165a:	b74d                	j	15fc <printf+0x21a>

000000000000165c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    165c:	1141                	add	sp,sp,-16
    165e:	e406                	sd	ra,8(sp)
    puts(m);
    1660:	d61ff0ef          	jal	13c0 <puts>
    exit(-100);
}
    1664:	60a2                	ld	ra,8(sp)
    exit(-100);
    1666:	f9c00513          	li	a0,-100
}
    166a:	0141                	add	sp,sp,16
    exit(-100);
    166c:	af09                	j	1d7e <exit>

000000000000166e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    166e:	02000793          	li	a5,32
    1672:	00f50663          	beq	a0,a5,167e <isspace+0x10>
    1676:	355d                	addw	a0,a0,-9
    1678:	00553513          	sltiu	a0,a0,5
    167c:	8082                	ret
    167e:	4505                	li	a0,1
}
    1680:	8082                	ret

0000000000001682 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1682:	fd05051b          	addw	a0,a0,-48
}
    1686:	00a53513          	sltiu	a0,a0,10
    168a:	8082                	ret

000000000000168c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    168c:	02000693          	li	a3,32
    1690:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1692:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1696:	ff77871b          	addw	a4,a5,-9
    169a:	04d78c63          	beq	a5,a3,16f2 <atoi+0x66>
    169e:	0007861b          	sext.w	a2,a5
    16a2:	04e5f863          	bgeu	a1,a4,16f2 <atoi+0x66>
        s++;
    switch (*s)
    16a6:	02b00713          	li	a4,43
    16aa:	04e78963          	beq	a5,a4,16fc <atoi+0x70>
    16ae:	02d00713          	li	a4,45
    16b2:	06e78263          	beq	a5,a4,1716 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16b6:	fd06069b          	addw	a3,a2,-48
    16ba:	47a5                	li	a5,9
    16bc:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16be:	4301                	li	t1,0
    while (isdigit(*s))
    16c0:	04d7e963          	bltu	a5,a3,1712 <atoi+0x86>
    int n = 0, neg = 0;
    16c4:	4501                	li	a0,0
    while (isdigit(*s))
    16c6:	48a5                	li	a7,9
    16c8:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16cc:	0025179b          	sllw	a5,a0,0x2
    16d0:	9fa9                	addw	a5,a5,a0
    16d2:	fd06059b          	addw	a1,a2,-48
    16d6:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16da:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16de:	0705                	add	a4,a4,1
    16e0:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16e4:	0006861b          	sext.w	a2,a3
    16e8:	ff08f0e3          	bgeu	a7,a6,16c8 <atoi+0x3c>
    return neg ? n : -n;
    16ec:	00030563          	beqz	t1,16f6 <atoi+0x6a>
}
    16f0:	8082                	ret
        s++;
    16f2:	0505                	add	a0,a0,1
    16f4:	bf79                	j	1692 <atoi+0x6>
    return neg ? n : -n;
    16f6:	40f5853b          	subw	a0,a1,a5
    16fa:	8082                	ret
    while (isdigit(*s))
    16fc:	00154603          	lbu	a2,1(a0)
    1700:	47a5                	li	a5,9
        s++;
    1702:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1706:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    170a:	4301                	li	t1,0
    while (isdigit(*s))
    170c:	2601                	sext.w	a2,a2
    170e:	fad7fbe3          	bgeu	a5,a3,16c4 <atoi+0x38>
    1712:	4501                	li	a0,0
}
    1714:	8082                	ret
    while (isdigit(*s))
    1716:	00154603          	lbu	a2,1(a0)
    171a:	47a5                	li	a5,9
        s++;
    171c:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1720:	fd06069b          	addw	a3,a2,-48
    1724:	2601                	sext.w	a2,a2
    1726:	fed7e6e3          	bltu	a5,a3,1712 <atoi+0x86>
        neg = 1;
    172a:	4305                	li	t1,1
    172c:	bf61                	j	16c4 <atoi+0x38>

000000000000172e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    172e:	18060163          	beqz	a2,18b0 <memset+0x182>
    1732:	40a006b3          	neg	a3,a0
    1736:	0076f793          	and	a5,a3,7
    173a:	00778813          	add	a6,a5,7
    173e:	48ad                	li	a7,11
    1740:	0ff5f713          	zext.b	a4,a1
    1744:	fff60593          	add	a1,a2,-1
    1748:	17186563          	bltu	a6,a7,18b2 <memset+0x184>
    174c:	1705ed63          	bltu	a1,a6,18c6 <memset+0x198>
    1750:	16078363          	beqz	a5,18b6 <memset+0x188>
    1754:	00e50023          	sb	a4,0(a0)
    1758:	0066f593          	and	a1,a3,6
    175c:	16058063          	beqz	a1,18bc <memset+0x18e>
    1760:	00e500a3          	sb	a4,1(a0)
    1764:	4589                	li	a1,2
    1766:	16f5f363          	bgeu	a1,a5,18cc <memset+0x19e>
    176a:	00e50123          	sb	a4,2(a0)
    176e:	8a91                	and	a3,a3,4
    1770:	00350593          	add	a1,a0,3
    1774:	4e0d                	li	t3,3
    1776:	ce9d                	beqz	a3,17b4 <memset+0x86>
    1778:	00e501a3          	sb	a4,3(a0)
    177c:	4691                	li	a3,4
    177e:	00450593          	add	a1,a0,4
    1782:	4e11                	li	t3,4
    1784:	02f6f863          	bgeu	a3,a5,17b4 <memset+0x86>
    1788:	00e50223          	sb	a4,4(a0)
    178c:	4695                	li	a3,5
    178e:	00550593          	add	a1,a0,5
    1792:	4e15                	li	t3,5
    1794:	02d78063          	beq	a5,a3,17b4 <memset+0x86>
    1798:	fff50693          	add	a3,a0,-1
    179c:	00e502a3          	sb	a4,5(a0)
    17a0:	8a9d                	and	a3,a3,7
    17a2:	00650593          	add	a1,a0,6
    17a6:	4e19                	li	t3,6
    17a8:	e691                	bnez	a3,17b4 <memset+0x86>
    17aa:	00750593          	add	a1,a0,7
    17ae:	00e50323          	sb	a4,6(a0)
    17b2:	4e1d                	li	t3,7
    17b4:	00871693          	sll	a3,a4,0x8
    17b8:	01071813          	sll	a6,a4,0x10
    17bc:	8ed9                	or	a3,a3,a4
    17be:	01871893          	sll	a7,a4,0x18
    17c2:	0106e6b3          	or	a3,a3,a6
    17c6:	0116e6b3          	or	a3,a3,a7
    17ca:	02071813          	sll	a6,a4,0x20
    17ce:	02871313          	sll	t1,a4,0x28
    17d2:	0106e6b3          	or	a3,a3,a6
    17d6:	40f608b3          	sub	a7,a2,a5
    17da:	03071813          	sll	a6,a4,0x30
    17de:	0066e6b3          	or	a3,a3,t1
    17e2:	0106e6b3          	or	a3,a3,a6
    17e6:	03871313          	sll	t1,a4,0x38
    17ea:	97aa                	add	a5,a5,a0
    17ec:	ff88f813          	and	a6,a7,-8
    17f0:	0066e6b3          	or	a3,a3,t1
    17f4:	983e                	add	a6,a6,a5
    17f6:	e394                	sd	a3,0(a5)
    17f8:	07a1                	add	a5,a5,8
    17fa:	ff079ee3          	bne	a5,a6,17f6 <memset+0xc8>
    17fe:	ff88f793          	and	a5,a7,-8
    1802:	0078f893          	and	a7,a7,7
    1806:	00f586b3          	add	a3,a1,a5
    180a:	01c787bb          	addw	a5,a5,t3
    180e:	0a088b63          	beqz	a7,18c4 <memset+0x196>
    1812:	00e68023          	sb	a4,0(a3)
    1816:	0017859b          	addw	a1,a5,1
    181a:	08c5fb63          	bgeu	a1,a2,18b0 <memset+0x182>
    181e:	00e680a3          	sb	a4,1(a3)
    1822:	0027859b          	addw	a1,a5,2
    1826:	08c5f563          	bgeu	a1,a2,18b0 <memset+0x182>
    182a:	00e68123          	sb	a4,2(a3)
    182e:	0037859b          	addw	a1,a5,3
    1832:	06c5ff63          	bgeu	a1,a2,18b0 <memset+0x182>
    1836:	00e681a3          	sb	a4,3(a3)
    183a:	0047859b          	addw	a1,a5,4
    183e:	06c5f963          	bgeu	a1,a2,18b0 <memset+0x182>
    1842:	00e68223          	sb	a4,4(a3)
    1846:	0057859b          	addw	a1,a5,5
    184a:	06c5f363          	bgeu	a1,a2,18b0 <memset+0x182>
    184e:	00e682a3          	sb	a4,5(a3)
    1852:	0067859b          	addw	a1,a5,6
    1856:	04c5fd63          	bgeu	a1,a2,18b0 <memset+0x182>
    185a:	00e68323          	sb	a4,6(a3)
    185e:	0077859b          	addw	a1,a5,7
    1862:	04c5f763          	bgeu	a1,a2,18b0 <memset+0x182>
    1866:	00e683a3          	sb	a4,7(a3)
    186a:	0087859b          	addw	a1,a5,8
    186e:	04c5f163          	bgeu	a1,a2,18b0 <memset+0x182>
    1872:	00e68423          	sb	a4,8(a3)
    1876:	0097859b          	addw	a1,a5,9
    187a:	02c5fb63          	bgeu	a1,a2,18b0 <memset+0x182>
    187e:	00e684a3          	sb	a4,9(a3)
    1882:	00a7859b          	addw	a1,a5,10
    1886:	02c5f563          	bgeu	a1,a2,18b0 <memset+0x182>
    188a:	00e68523          	sb	a4,10(a3)
    188e:	00b7859b          	addw	a1,a5,11
    1892:	00c5ff63          	bgeu	a1,a2,18b0 <memset+0x182>
    1896:	00e685a3          	sb	a4,11(a3)
    189a:	00c7859b          	addw	a1,a5,12
    189e:	00c5f963          	bgeu	a1,a2,18b0 <memset+0x182>
    18a2:	00e68623          	sb	a4,12(a3)
    18a6:	27b5                	addw	a5,a5,13
    18a8:	00c7f463          	bgeu	a5,a2,18b0 <memset+0x182>
    18ac:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18b0:	8082                	ret
    18b2:	482d                	li	a6,11
    18b4:	bd61                	j	174c <memset+0x1e>
    char *p = dest;
    18b6:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18b8:	4e01                	li	t3,0
    18ba:	bded                	j	17b4 <memset+0x86>
    18bc:	00150593          	add	a1,a0,1
    18c0:	4e05                	li	t3,1
    18c2:	bdcd                	j	17b4 <memset+0x86>
    18c4:	8082                	ret
    char *p = dest;
    18c6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18c8:	4781                	li	a5,0
    18ca:	b7a1                	j	1812 <memset+0xe4>
    18cc:	00250593          	add	a1,a0,2
    18d0:	4e09                	li	t3,2
    18d2:	b5cd                	j	17b4 <memset+0x86>

00000000000018d4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18d4:	00054783          	lbu	a5,0(a0)
    18d8:	0005c703          	lbu	a4,0(a1)
    18dc:	00e79863          	bne	a5,a4,18ec <strcmp+0x18>
    18e0:	0505                	add	a0,a0,1
    18e2:	0585                	add	a1,a1,1
    18e4:	fbe5                	bnez	a5,18d4 <strcmp>
    18e6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18e8:	9d19                	subw	a0,a0,a4
    18ea:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18ec:	0007851b          	sext.w	a0,a5
    18f0:	bfe5                	j	18e8 <strcmp+0x14>

00000000000018f2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18f2:	ca15                	beqz	a2,1926 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18f4:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18f8:	167d                	add	a2,a2,-1
    18fa:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18fe:	eb99                	bnez	a5,1914 <strncmp+0x22>
    1900:	a815                	j	1934 <strncmp+0x42>
    1902:	00a68e63          	beq	a3,a0,191e <strncmp+0x2c>
    1906:	0505                	add	a0,a0,1
    1908:	00f71b63          	bne	a4,a5,191e <strncmp+0x2c>
    190c:	00054783          	lbu	a5,0(a0)
    1910:	cf89                	beqz	a5,192a <strncmp+0x38>
    1912:	85b2                	mv	a1,a2
    1914:	0005c703          	lbu	a4,0(a1)
    1918:	00158613          	add	a2,a1,1
    191c:	f37d                	bnez	a4,1902 <strncmp+0x10>
        ;
    return *l - *r;
    191e:	0007851b          	sext.w	a0,a5
    1922:	9d19                	subw	a0,a0,a4
    1924:	8082                	ret
        return 0;
    1926:	4501                	li	a0,0
}
    1928:	8082                	ret
    return *l - *r;
    192a:	0015c703          	lbu	a4,1(a1)
    192e:	4501                	li	a0,0
    1930:	9d19                	subw	a0,a0,a4
    1932:	8082                	ret
    1934:	0005c703          	lbu	a4,0(a1)
    1938:	4501                	li	a0,0
    193a:	b7e5                	j	1922 <strncmp+0x30>

000000000000193c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    193c:	00757793          	and	a5,a0,7
    1940:	cf89                	beqz	a5,195a <strlen+0x1e>
    1942:	87aa                	mv	a5,a0
    1944:	a029                	j	194e <strlen+0x12>
    1946:	0785                	add	a5,a5,1
    1948:	0077f713          	and	a4,a5,7
    194c:	cb01                	beqz	a4,195c <strlen+0x20>
        if (!*s)
    194e:	0007c703          	lbu	a4,0(a5)
    1952:	fb75                	bnez	a4,1946 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1954:	40a78533          	sub	a0,a5,a0
}
    1958:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    195a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    195c:	6394                	ld	a3,0(a5)
    195e:	00000597          	auipc	a1,0x0
    1962:	7225b583          	ld	a1,1826(a1) # 2080 <__clone+0xfe>
    1966:	00000617          	auipc	a2,0x0
    196a:	72263603          	ld	a2,1826(a2) # 2088 <__clone+0x106>
    196e:	a019                	j	1974 <strlen+0x38>
    1970:	6794                	ld	a3,8(a5)
    1972:	07a1                	add	a5,a5,8
    1974:	00b68733          	add	a4,a3,a1
    1978:	fff6c693          	not	a3,a3
    197c:	8f75                	and	a4,a4,a3
    197e:	8f71                	and	a4,a4,a2
    1980:	db65                	beqz	a4,1970 <strlen+0x34>
    for (; *s; s++)
    1982:	0007c703          	lbu	a4,0(a5)
    1986:	d779                	beqz	a4,1954 <strlen+0x18>
    1988:	0017c703          	lbu	a4,1(a5)
    198c:	0785                	add	a5,a5,1
    198e:	d379                	beqz	a4,1954 <strlen+0x18>
    1990:	0017c703          	lbu	a4,1(a5)
    1994:	0785                	add	a5,a5,1
    1996:	fb6d                	bnez	a4,1988 <strlen+0x4c>
    1998:	bf75                	j	1954 <strlen+0x18>

000000000000199a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    199a:	00757713          	and	a4,a0,7
{
    199e:	87aa                	mv	a5,a0
    19a0:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a4:	cb19                	beqz	a4,19ba <memchr+0x20>
    19a6:	ce25                	beqz	a2,1a1e <memchr+0x84>
    19a8:	0007c703          	lbu	a4,0(a5)
    19ac:	00b70763          	beq	a4,a1,19ba <memchr+0x20>
    19b0:	0785                	add	a5,a5,1
    19b2:	0077f713          	and	a4,a5,7
    19b6:	167d                	add	a2,a2,-1
    19b8:	f77d                	bnez	a4,19a6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19ba:	4501                	li	a0,0
    if (n && *s != c)
    19bc:	c235                	beqz	a2,1a20 <memchr+0x86>
    19be:	0007c703          	lbu	a4,0(a5)
    19c2:	06b70063          	beq	a4,a1,1a22 <memchr+0x88>
        size_t k = ONES * c;
    19c6:	00000517          	auipc	a0,0x0
    19ca:	6ca53503          	ld	a0,1738(a0) # 2090 <__clone+0x10e>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ce:	471d                	li	a4,7
        size_t k = ONES * c;
    19d0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d4:	04c77763          	bgeu	a4,a2,1a22 <memchr+0x88>
    19d8:	00000897          	auipc	a7,0x0
    19dc:	6a88b883          	ld	a7,1704(a7) # 2080 <__clone+0xfe>
    19e0:	00000817          	auipc	a6,0x0
    19e4:	6a883803          	ld	a6,1704(a6) # 2088 <__clone+0x106>
    19e8:	431d                	li	t1,7
    19ea:	a029                	j	19f4 <memchr+0x5a>
    19ec:	1661                	add	a2,a2,-8
    19ee:	07a1                	add	a5,a5,8
    19f0:	00c37c63          	bgeu	t1,a2,1a08 <memchr+0x6e>
    19f4:	6398                	ld	a4,0(a5)
    19f6:	8f29                	xor	a4,a4,a0
    19f8:	011706b3          	add	a3,a4,a7
    19fc:	fff74713          	not	a4,a4
    1a00:	8f75                	and	a4,a4,a3
    1a02:	01077733          	and	a4,a4,a6
    1a06:	d37d                	beqz	a4,19ec <memchr+0x52>
    1a08:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a0a:	e601                	bnez	a2,1a12 <memchr+0x78>
    1a0c:	a809                	j	1a1e <memchr+0x84>
    1a0e:	0505                	add	a0,a0,1
    1a10:	c619                	beqz	a2,1a1e <memchr+0x84>
    1a12:	00054783          	lbu	a5,0(a0)
    1a16:	167d                	add	a2,a2,-1
    1a18:	feb79be3          	bne	a5,a1,1a0e <memchr+0x74>
    1a1c:	8082                	ret
    return n ? (void *)s : 0;
    1a1e:	4501                	li	a0,0
}
    1a20:	8082                	ret
    if (n && *s != c)
    1a22:	853e                	mv	a0,a5
    1a24:	b7fd                	j	1a12 <memchr+0x78>

0000000000001a26 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a26:	1101                	add	sp,sp,-32
    1a28:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a2a:	862e                	mv	a2,a1
{
    1a2c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a2e:	4581                	li	a1,0
{
    1a30:	e426                	sd	s1,8(sp)
    1a32:	ec06                	sd	ra,24(sp)
    1a34:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a36:	f65ff0ef          	jal	199a <memchr>
    return p ? p - s : n;
    1a3a:	c519                	beqz	a0,1a48 <strnlen+0x22>
}
    1a3c:	60e2                	ld	ra,24(sp)
    1a3e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a40:	8d05                	sub	a0,a0,s1
}
    1a42:	64a2                	ld	s1,8(sp)
    1a44:	6105                	add	sp,sp,32
    1a46:	8082                	ret
    1a48:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a4a:	8522                	mv	a0,s0
}
    1a4c:	6442                	ld	s0,16(sp)
    1a4e:	64a2                	ld	s1,8(sp)
    1a50:	6105                	add	sp,sp,32
    1a52:	8082                	ret

0000000000001a54 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a54:	00a5c7b3          	xor	a5,a1,a0
    1a58:	8b9d                	and	a5,a5,7
    1a5a:	eb95                	bnez	a5,1a8e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a5c:	0075f793          	and	a5,a1,7
    1a60:	e7b1                	bnez	a5,1aac <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a62:	6198                	ld	a4,0(a1)
    1a64:	00000617          	auipc	a2,0x0
    1a68:	61c63603          	ld	a2,1564(a2) # 2080 <__clone+0xfe>
    1a6c:	00000817          	auipc	a6,0x0
    1a70:	61c83803          	ld	a6,1564(a6) # 2088 <__clone+0x106>
    1a74:	a029                	j	1a7e <strcpy+0x2a>
    1a76:	05a1                	add	a1,a1,8
    1a78:	e118                	sd	a4,0(a0)
    1a7a:	6198                	ld	a4,0(a1)
    1a7c:	0521                	add	a0,a0,8
    1a7e:	00c707b3          	add	a5,a4,a2
    1a82:	fff74693          	not	a3,a4
    1a86:	8ff5                	and	a5,a5,a3
    1a88:	0107f7b3          	and	a5,a5,a6
    1a8c:	d7ed                	beqz	a5,1a76 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	c785                	beqz	a5,1abe <strcpy+0x6a>
    1a98:	0015c783          	lbu	a5,1(a1)
    1a9c:	0505                	add	a0,a0,1
    1a9e:	0585                	add	a1,a1,1
    1aa0:	00f50023          	sb	a5,0(a0)
    1aa4:	fbf5                	bnez	a5,1a98 <strcpy+0x44>
        ;
    return d;
}
    1aa6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aa8:	0505                	add	a0,a0,1
    1aaa:	df45                	beqz	a4,1a62 <strcpy+0xe>
            if (!(*d = *s))
    1aac:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ab0:	0585                	add	a1,a1,1
    1ab2:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	f7fd                	bnez	a5,1aa8 <strcpy+0x54>
}
    1abc:	8082                	ret
    1abe:	8082                	ret

0000000000001ac0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac0:	00a5c7b3          	xor	a5,a1,a0
    1ac4:	8b9d                	and	a5,a5,7
    1ac6:	e3b5                	bnez	a5,1b2a <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ac8:	0075f793          	and	a5,a1,7
    1acc:	cf99                	beqz	a5,1aea <strncpy+0x2a>
    1ace:	ea09                	bnez	a2,1ae0 <strncpy+0x20>
    1ad0:	a421                	j	1cd8 <strncpy+0x218>
    1ad2:	0585                	add	a1,a1,1
    1ad4:	0075f793          	and	a5,a1,7
    1ad8:	167d                	add	a2,a2,-1
    1ada:	0505                	add	a0,a0,1
    1adc:	c799                	beqz	a5,1aea <strncpy+0x2a>
    1ade:	c225                	beqz	a2,1b3e <strncpy+0x7e>
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	00f50023          	sb	a5,0(a0)
    1ae8:	f7ed                	bnez	a5,1ad2 <strncpy+0x12>
            ;
        if (!n || !*s)
    1aea:	ca31                	beqz	a2,1b3e <strncpy+0x7e>
    1aec:	0005c783          	lbu	a5,0(a1)
    1af0:	cba1                	beqz	a5,1b40 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af2:	479d                	li	a5,7
    1af4:	02c7fc63          	bgeu	a5,a2,1b2c <strncpy+0x6c>
    1af8:	00000897          	auipc	a7,0x0
    1afc:	5888b883          	ld	a7,1416(a7) # 2080 <__clone+0xfe>
    1b00:	00000817          	auipc	a6,0x0
    1b04:	58883803          	ld	a6,1416(a6) # 2088 <__clone+0x106>
    1b08:	431d                	li	t1,7
    1b0a:	a039                	j	1b18 <strncpy+0x58>
            *wd = *ws;
    1b0c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0e:	1661                	add	a2,a2,-8
    1b10:	05a1                	add	a1,a1,8
    1b12:	0521                	add	a0,a0,8
    1b14:	00c37b63          	bgeu	t1,a2,1b2a <strncpy+0x6a>
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	011707b3          	add	a5,a4,a7
    1b1e:	fff74693          	not	a3,a4
    1b22:	8ff5                	and	a5,a5,a3
    1b24:	0107f7b3          	and	a5,a5,a6
    1b28:	d3f5                	beqz	a5,1b0c <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b2a:	ca11                	beqz	a2,1b3e <strncpy+0x7e>
    1b2c:	0005c783          	lbu	a5,0(a1)
    1b30:	0585                	add	a1,a1,1
    1b32:	00f50023          	sb	a5,0(a0)
    1b36:	c789                	beqz	a5,1b40 <strncpy+0x80>
    1b38:	167d                	add	a2,a2,-1
    1b3a:	0505                	add	a0,a0,1
    1b3c:	fa65                	bnez	a2,1b2c <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b3e:	8082                	ret
    1b40:	4805                	li	a6,1
    1b42:	14061b63          	bnez	a2,1c98 <strncpy+0x1d8>
    1b46:	40a00733          	neg	a4,a0
    1b4a:	00777793          	and	a5,a4,7
    1b4e:	4581                	li	a1,0
    1b50:	12061c63          	bnez	a2,1c88 <strncpy+0x1c8>
    1b54:	00778693          	add	a3,a5,7
    1b58:	48ad                	li	a7,11
    1b5a:	1316e563          	bltu	a3,a7,1c84 <strncpy+0x1c4>
    1b5e:	16d5e263          	bltu	a1,a3,1cc2 <strncpy+0x202>
    1b62:	14078c63          	beqz	a5,1cba <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b66:	00050023          	sb	zero,0(a0)
    1b6a:	00677693          	and	a3,a4,6
    1b6e:	14068263          	beqz	a3,1cb2 <strncpy+0x1f2>
    1b72:	000500a3          	sb	zero,1(a0)
    1b76:	4689                	li	a3,2
    1b78:	14f6f863          	bgeu	a3,a5,1cc8 <strncpy+0x208>
    1b7c:	00050123          	sb	zero,2(a0)
    1b80:	8b11                	and	a4,a4,4
    1b82:	12070463          	beqz	a4,1caa <strncpy+0x1ea>
    1b86:	000501a3          	sb	zero,3(a0)
    1b8a:	4711                	li	a4,4
    1b8c:	00450693          	add	a3,a0,4
    1b90:	02f77563          	bgeu	a4,a5,1bba <strncpy+0xfa>
    1b94:	00050223          	sb	zero,4(a0)
    1b98:	4715                	li	a4,5
    1b9a:	00550693          	add	a3,a0,5
    1b9e:	00e78e63          	beq	a5,a4,1bba <strncpy+0xfa>
    1ba2:	fff50713          	add	a4,a0,-1
    1ba6:	000502a3          	sb	zero,5(a0)
    1baa:	8b1d                	and	a4,a4,7
    1bac:	12071263          	bnez	a4,1cd0 <strncpy+0x210>
    1bb0:	00750693          	add	a3,a0,7
    1bb4:	00050323          	sb	zero,6(a0)
    1bb8:	471d                	li	a4,7
    1bba:	40f80833          	sub	a6,a6,a5
    1bbe:	ff887593          	and	a1,a6,-8
    1bc2:	97aa                	add	a5,a5,a0
    1bc4:	95be                	add	a1,a1,a5
    1bc6:	0007b023          	sd	zero,0(a5)
    1bca:	07a1                	add	a5,a5,8
    1bcc:	feb79de3          	bne	a5,a1,1bc6 <strncpy+0x106>
    1bd0:	ff887593          	and	a1,a6,-8
    1bd4:	00787813          	and	a6,a6,7
    1bd8:	00e587bb          	addw	a5,a1,a4
    1bdc:	00b68733          	add	a4,a3,a1
    1be0:	0e080063          	beqz	a6,1cc0 <strncpy+0x200>
    1be4:	00070023          	sb	zero,0(a4)
    1be8:	0017869b          	addw	a3,a5,1
    1bec:	f4c6f9e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1bf0:	000700a3          	sb	zero,1(a4)
    1bf4:	0027869b          	addw	a3,a5,2
    1bf8:	f4c6f3e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1bfc:	00070123          	sb	zero,2(a4)
    1c00:	0037869b          	addw	a3,a5,3
    1c04:	f2c6fde3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c08:	000701a3          	sb	zero,3(a4)
    1c0c:	0047869b          	addw	a3,a5,4
    1c10:	f2c6f7e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c14:	00070223          	sb	zero,4(a4)
    1c18:	0057869b          	addw	a3,a5,5
    1c1c:	f2c6f1e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c20:	000702a3          	sb	zero,5(a4)
    1c24:	0067869b          	addw	a3,a5,6
    1c28:	f0c6fbe3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c2c:	00070323          	sb	zero,6(a4)
    1c30:	0077869b          	addw	a3,a5,7
    1c34:	f0c6f5e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c38:	000703a3          	sb	zero,7(a4)
    1c3c:	0087869b          	addw	a3,a5,8
    1c40:	eec6ffe3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c44:	00070423          	sb	zero,8(a4)
    1c48:	0097869b          	addw	a3,a5,9
    1c4c:	eec6f9e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c50:	000704a3          	sb	zero,9(a4)
    1c54:	00a7869b          	addw	a3,a5,10
    1c58:	eec6f3e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c5c:	00070523          	sb	zero,10(a4)
    1c60:	00b7869b          	addw	a3,a5,11
    1c64:	ecc6fde3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c68:	000705a3          	sb	zero,11(a4)
    1c6c:	00c7869b          	addw	a3,a5,12
    1c70:	ecc6f7e3          	bgeu	a3,a2,1b3e <strncpy+0x7e>
    1c74:	00070623          	sb	zero,12(a4)
    1c78:	27b5                	addw	a5,a5,13
    1c7a:	ecc7f2e3          	bgeu	a5,a2,1b3e <strncpy+0x7e>
    1c7e:	000706a3          	sb	zero,13(a4)
}
    1c82:	8082                	ret
    1c84:	46ad                	li	a3,11
    1c86:	bde1                	j	1b5e <strncpy+0x9e>
    1c88:	00778693          	add	a3,a5,7
    1c8c:	48ad                	li	a7,11
    1c8e:	fff60593          	add	a1,a2,-1
    1c92:	ed16f6e3          	bgeu	a3,a7,1b5e <strncpy+0x9e>
    1c96:	b7fd                	j	1c84 <strncpy+0x1c4>
    1c98:	40a00733          	neg	a4,a0
    1c9c:	8832                	mv	a6,a2
    1c9e:	00777793          	and	a5,a4,7
    1ca2:	4581                	li	a1,0
    1ca4:	ea0608e3          	beqz	a2,1b54 <strncpy+0x94>
    1ca8:	b7c5                	j	1c88 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1caa:	00350693          	add	a3,a0,3
    1cae:	470d                	li	a4,3
    1cb0:	b729                	j	1bba <strncpy+0xfa>
    1cb2:	00150693          	add	a3,a0,1
    1cb6:	4705                	li	a4,1
    1cb8:	b709                	j	1bba <strncpy+0xfa>
tail:
    1cba:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cbc:	4701                	li	a4,0
    1cbe:	bdf5                	j	1bba <strncpy+0xfa>
    1cc0:	8082                	ret
tail:
    1cc2:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cc4:	4781                	li	a5,0
    1cc6:	bf39                	j	1be4 <strncpy+0x124>
    1cc8:	00250693          	add	a3,a0,2
    1ccc:	4709                	li	a4,2
    1cce:	b5f5                	j	1bba <strncpy+0xfa>
    1cd0:	00650693          	add	a3,a0,6
    1cd4:	4719                	li	a4,6
    1cd6:	b5d5                	j	1bba <strncpy+0xfa>
    1cd8:	8082                	ret

0000000000001cda <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cda:	87aa                	mv	a5,a0
    1cdc:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cde:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ce2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ce6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1ce8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cea:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <openat>:
    register long a7 __asm__("a7") = n;
    1cf2:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cf6:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfa:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <close>:
    register long a7 __asm__("a7") = n;
    1d02:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d06:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <read>:
    register long a7 __asm__("a7") = n;
    1d0e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d12:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d16:	8082                	ret

0000000000001d18 <write>:
    register long a7 __asm__("a7") = n;
    1d18:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d20:	8082                	ret

0000000000001d22 <getpid>:
    register long a7 __asm__("a7") = n;
    1d22:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d26:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <getppid>:
    register long a7 __asm__("a7") = n;
    1d2e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d32:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <sys_set_tid_address>:
    register long a7 __asm__("a7") = n;
    1d3a:	06000893          	li	a7,96
    __asm_syscall("r"(a7), "0"(a0))
    1d3e:	00000073          	ecall

int sys_set_tid_address(int *tidptr)
{
    return syscall(SYS_set_tid_address, tidptr);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d46:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d4a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <fork>:
    register long a7 __asm__("a7") = n;
    1d52:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d56:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d62:	85b2                	mv	a1,a2
    1d64:	863a                	mv	a2,a4
    if (stack)
    1d66:	c191                	beqz	a1,1d6a <clone+0x8>
	stack += stack_size;
    1d68:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d6a:	4781                	li	a5,0
    1d6c:	4701                	li	a4,0
    1d6e:	4681                	li	a3,0
    1d70:	2601                	sext.w	a2,a2
    1d72:	ac01                	j	1f82 <__clone>

0000000000001d74 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d74:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d78:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d7c:	8082                	ret

0000000000001d7e <exit>:
    register long a7 __asm__("a7") = n;
    1d7e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d82:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d86:	8082                	ret

0000000000001d88 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d88:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d8c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <exec>:
    register long a7 __asm__("a7") = n;
    1d96:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d9a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <execve>:
    register long a7 __asm__("a7") = n;
    1da2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <times>:
    register long a7 __asm__("a7") = n;
    1dae:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1db2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <get_time>:

int64 get_time()
{
    1dba:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dbc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dc0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dc8:	2501                	sext.w	a0,a0
    1dca:	ed09                	bnez	a0,1de4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dcc:	67a2                	ld	a5,8(sp)
    1dce:	3e800713          	li	a4,1000
    1dd2:	00015503          	lhu	a0,0(sp)
    1dd6:	02e7d7b3          	divu	a5,a5,a4
    1dda:	02e50533          	mul	a0,a0,a4
    1dde:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1de0:	0141                	add	sp,sp,16
    1de2:	8082                	ret
        return -1;
    1de4:	557d                	li	a0,-1
    1de6:	bfed                	j	1de0 <get_time+0x26>

0000000000001de8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1de8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <time>:
    register long a7 __asm__("a7") = n;
    1df4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1df8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <sleep>:

int sleep(unsigned long long time)
{
    1e00:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e02:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e04:	850a                	mv	a0,sp
    1e06:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e08:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e0c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e12:	e501                	bnez	a0,1e1a <sleep+0x1a>
    return 0;
    1e14:	4501                	li	a0,0
}
    1e16:	0141                	add	sp,sp,16
    1e18:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e1a:	4502                	lw	a0,0(sp)
}
    1e1c:	0141                	add	sp,sp,16
    1e1e:	8082                	ret

0000000000001e20 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e20:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e2c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e30:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e34:	8082                	ret

0000000000001e36 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e36:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <munmap>:
    register long a7 __asm__("a7") = n;
    1e42:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <wait>:

int wait(int *code)
{
    1e4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e50:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e54:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e56:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e58:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e5a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <spawn>:
    register long a7 __asm__("a7") = n;
    1e62:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <mailread>:
    register long a7 __asm__("a7") = n;
    1e6e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e7a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <fstat>:
    register long a7 __asm__("a7") = n;
    1e86:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e92:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e94:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e98:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9a:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ea2:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ea4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ea8:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eaa:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eb2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eb4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eb8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eba:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <link>:

int link(char *old_path, char *new_path)
{
    1ec2:	87aa                	mv	a5,a0
    1ec4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ec6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1eca:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ece:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ed0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ed4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <unlink>:

int unlink(char *path)
{
    1ede:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ee0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ee4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ee8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <uname>:
    register long a7 __asm__("a7") = n;
    1ef2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ef6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <brk>:
    register long a7 __asm__("a7") = n;
    1efe:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f02:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <getcwd>:
    register long a7 __asm__("a7") = n;
    1f0a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f10:	8082                	ret

0000000000001f12 <chdir>:
    register long a7 __asm__("a7") = n;
    1f12:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f16:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f1e:	862e                	mv	a2,a1
    1f20:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f22:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f24:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f2e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f30:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <getdents>:
    register long a7 __asm__("a7") = n;
    1f38:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <pipe>:
    register long a7 __asm__("a7") = n;
    1f44:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f48:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <dup>:
    register long a7 __asm__("a7") = n;
    1f52:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f54:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <dup2>:
    register long a7 __asm__("a7") = n;
    1f5c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f5e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f60:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <mount>:
    register long a7 __asm__("a7") = n;
    1f68:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f6c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <umount>:
    register long a7 __asm__("a7") = n;
    1f74:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f78:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f82:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f84:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f86:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f88:	8532                	mv	a0,a2
	mv a2, a4
    1f8a:	863a                	mv	a2,a4
	mv a3, a5
    1f8c:	86be                	mv	a3,a5
	mv a4, a6
    1f8e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f90:	0dc00893          	li	a7,220
	ecall
    1f94:	00000073          	ecall

	beqz a0, 1f
    1f98:	c111                	beqz	a0,1f9c <__clone+0x1a>
	# Parent
	ret
    1f9a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f9c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f9e:	6522                	ld	a0,8(sp)
	jalr a1
    1fa0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fa2:	05d00893          	li	a7,93
	ecall
    1fa6:	00000073          	ecall
