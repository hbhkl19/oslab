
/home/hbh/oslab/oslab/user/build/riscv64/path_unlink_relative:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aab1                	j	115e <__start_main>

0000000000001004 <test_path_unlink_relative>:
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_path_unlink_relative(void)
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f9250513          	add	a0,a0,-110 # 1f98 <__clone+0x2c>
{
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	3a4000ef          	jal	13b6 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	09250513          	add	a0,a0,146 # 20a8 <__func__.0>
    101e:	398000ef          	jal	13b6 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f8e50513          	add	a0,a0,-114 # 1fb0 <__clone+0x44>
    102a:	38c000ef          	jal	13b6 <puts>

    int ret = mkdir("rel_unlink_dir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f8e50513          	add	a0,a0,-114 # 1fc0 <__clone+0x54>
    103a:	6cf000ef          	jal	1f08 <mkdir>
    103e:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", ret);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	f8e50513          	add	a0,a0,-114 # 1fd0 <__clone+0x64>
    104a:	38e000ef          	jal	13d8 <printf>
    assert(ret == 0 || ret == -1);
    104e:	2405                	addw	s0,s0,1
    1050:	4785                	li	a5,1
    1052:	0087f863          	bgeu	a5,s0,1062 <test_path_unlink_relative+0x5e>
    1056:	00001517          	auipc	a0,0x1
    105a:	f8a50513          	add	a0,a0,-118 # 1fe0 <__clone+0x74>
    105e:	5f4000ef          	jal	1652 <panic>

    ret = chdir("rel_unlink_dir");
    1062:	00001517          	auipc	a0,0x1
    1066:	f5e50513          	add	a0,a0,-162 # 1fc0 <__clone+0x54>
    106a:	693000ef          	jal	1efc <chdir>
    106e:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    1070:	85aa                	mv	a1,a0
    1072:	00001517          	auipc	a0,0x1
    1076:	f8e50513          	add	a0,a0,-114 # 2000 <__clone+0x94>
    107a:	35e000ef          	jal	13d8 <printf>
    assert(ret == 0);
    107e:	e855                	bnez	s0,1132 <test_path_unlink_relative+0x12e>

    int fd = open("afile", O_CREATE | O_RDWR);
    1080:	04200593          	li	a1,66
    1084:	00001517          	auipc	a0,0x1
    1088:	f8c50513          	add	a0,a0,-116 # 2010 <__clone+0xa4>
    108c:	445000ef          	jal	1cd0 <open>
    1090:	842a                	mv	s0,a0
    printf("open fd: %d\n", fd);
    1092:	85aa                	mv	a1,a0
    1094:	00001517          	auipc	a0,0x1
    1098:	f8450513          	add	a0,a0,-124 # 2018 <__clone+0xac>
    109c:	33c000ef          	jal	13d8 <printf>
    assert(fd > 0);
    10a0:	0a805063          	blez	s0,1140 <test_path_unlink_relative+0x13c>
    close(fd);
    10a4:	8522                	mv	a0,s0
    10a6:	453000ef          	jal	1cf8 <close>

    ret = unlink("afile");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	f6650513          	add	a0,a0,-154 # 2010 <__clone+0xa4>
    10b2:	617000ef          	jal	1ec8 <unlink>
    10b6:	842a                	mv	s0,a0
    printf("unlink ret: %d\n", ret);
    10b8:	85aa                	mv	a1,a0
    10ba:	00001517          	auipc	a0,0x1
    10be:	f6e50513          	add	a0,a0,-146 # 2028 <__clone+0xbc>
    10c2:	316000ef          	jal	13d8 <printf>
    assert(ret == 0);
    10c6:	ec39                	bnez	s0,1124 <test_path_unlink_relative+0x120>

    fd = open("afile", O_RDONLY);
    10c8:	4581                	li	a1,0
    10ca:	00001517          	auipc	a0,0x1
    10ce:	f4650513          	add	a0,a0,-186 # 2010 <__clone+0xa4>
    10d2:	3ff000ef          	jal	1cd0 <open>
    10d6:	842a                	mv	s0,a0
    if(fd < 0) {
    10d8:	02054f63          	bltz	a0,1116 <test_path_unlink_relative+0x112>
        printf("relative unlink success.\n");
    } else {
        printf("relative unlink failed.\n");
    10dc:	00001517          	auipc	a0,0x1
    10e0:	f7c50513          	add	a0,a0,-132 # 2058 <__clone+0xec>
    10e4:	2f4000ef          	jal	13d8 <printf>
        close(fd);
    10e8:	8522                	mv	a0,s0
    10ea:	40f000ef          	jal	1cf8 <close>
    }

    TEST_END(__func__);
    10ee:	00001517          	auipc	a0,0x1
    10f2:	f8a50513          	add	a0,a0,-118 # 2078 <__clone+0x10c>
    10f6:	2c0000ef          	jal	13b6 <puts>
    10fa:	00001517          	auipc	a0,0x1
    10fe:	fae50513          	add	a0,a0,-82 # 20a8 <__func__.0>
    1102:	2b4000ef          	jal	13b6 <puts>
}
    1106:	6402                	ld	s0,0(sp)
    1108:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    110a:	00001517          	auipc	a0,0x1
    110e:	ea650513          	add	a0,a0,-346 # 1fb0 <__clone+0x44>
}
    1112:	0141                	add	sp,sp,16
    TEST_END(__func__);
    1114:	a44d                	j	13b6 <puts>
        printf("relative unlink success.\n");
    1116:	00001517          	auipc	a0,0x1
    111a:	f2250513          	add	a0,a0,-222 # 2038 <__clone+0xcc>
    111e:	2ba000ef          	jal	13d8 <printf>
    1122:	b7f1                	j	10ee <test_path_unlink_relative+0xea>
    assert(ret == 0);
    1124:	00001517          	auipc	a0,0x1
    1128:	ebc50513          	add	a0,a0,-324 # 1fe0 <__clone+0x74>
    112c:	526000ef          	jal	1652 <panic>
    1130:	bf61                	j	10c8 <test_path_unlink_relative+0xc4>
    assert(ret == 0);
    1132:	00001517          	auipc	a0,0x1
    1136:	eae50513          	add	a0,a0,-338 # 1fe0 <__clone+0x74>
    113a:	518000ef          	jal	1652 <panic>
    113e:	b789                	j	1080 <test_path_unlink_relative+0x7c>
    assert(fd > 0);
    1140:	00001517          	auipc	a0,0x1
    1144:	ea050513          	add	a0,a0,-352 # 1fe0 <__clone+0x74>
    1148:	50a000ef          	jal	1652 <panic>
    114c:	bfa1                	j	10a4 <test_path_unlink_relative+0xa0>

000000000000114e <main>:

int main(void)
{
    114e:	1141                	add	sp,sp,-16
    1150:	e406                	sd	ra,8(sp)
    test_path_unlink_relative();
    1152:	eb3ff0ef          	jal	1004 <test_path_unlink_relative>
    return 0;
}
    1156:	60a2                	ld	ra,8(sp)
    1158:	4501                	li	a0,0
    115a:	0141                	add	sp,sp,16
    115c:	8082                	ret

000000000000115e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    115e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1160:	4108                	lw	a0,0(a0)
{
    1162:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1164:	05a1                	add	a1,a1,8
{
    1166:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1168:	fe7ff0ef          	jal	114e <main>
    116c:	3fd000ef          	jal	1d68 <exit>
	return 0;
}
    1170:	60a2                	ld	ra,8(sp)
    1172:	4501                	li	a0,0
    1174:	0141                	add	sp,sp,16
    1176:	8082                	ret

0000000000001178 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1178:	7179                	add	sp,sp,-48
    117a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    117c:	12054863          	bltz	a0,12ac <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1180:	02b577bb          	remuw	a5,a0,a1
    1184:	00001697          	auipc	a3,0x1
    1188:	f4468693          	add	a3,a3,-188 # 20c8 <digits>
    buf[16] = 0;
    118c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1190:	0005871b          	sext.w	a4,a1
    1194:	1782                	sll	a5,a5,0x20
    1196:	9381                	srl	a5,a5,0x20
    1198:	97b6                	add	a5,a5,a3
    119a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    119e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11a2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11a6:	1ab56663          	bltu	a0,a1,1352 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11aa:	02e8763b          	remuw	a2,a6,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11bc:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11c0:	12e86c63          	bltu	a6,a4,12f8 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11c4:	02e5f63b          	remuw	a2,a1,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d6:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11da:	12e5e863          	bltu	a1,a4,130a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11de:	02e8763b          	remuw	a2,a6,a4
    11e2:	1602                	sll	a2,a2,0x20
    11e4:	9201                	srl	a2,a2,0x20
    11e6:	9636                	add	a2,a2,a3
    11e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ec:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11f0:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11f4:	12e86463          	bltu	a6,a4,131c <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11f8:	02e5f63b          	remuw	a2,a1,a4
    11fc:	1602                	sll	a2,a2,0x20
    11fe:	9201                	srl	a2,a2,0x20
    1200:	9636                	add	a2,a2,a3
    1202:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1206:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    120a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    120e:	12e5e063          	bltu	a1,a4,132e <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1212:	02e8763b          	remuw	a2,a6,a4
    1216:	1602                	sll	a2,a2,0x20
    1218:	9201                	srl	a2,a2,0x20
    121a:	9636                	add	a2,a2,a3
    121c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1220:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1224:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1228:	0ae86f63          	bltu	a6,a4,12e6 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    122c:	02e5f63b          	remuw	a2,a1,a4
    1230:	1602                	sll	a2,a2,0x20
    1232:	9201                	srl	a2,a2,0x20
    1234:	9636                	add	a2,a2,a3
    1236:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    123a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    123e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1242:	0ee5ef63          	bltu	a1,a4,1340 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1246:	02e8763b          	remuw	a2,a6,a4
    124a:	1602                	sll	a2,a2,0x20
    124c:	9201                	srl	a2,a2,0x20
    124e:	9636                	add	a2,a2,a3
    1250:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1254:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1258:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    125c:	0ee86d63          	bltu	a6,a4,1356 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1260:	02e5f63b          	remuw	a2,a1,a4
    1264:	1602                	sll	a2,a2,0x20
    1266:	9201                	srl	a2,a2,0x20
    1268:	9636                	add	a2,a2,a3
    126a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    126e:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1272:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1276:	0ee5e963          	bltu	a1,a4,1368 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    127a:	1782                	sll	a5,a5,0x20
    127c:	9381                	srl	a5,a5,0x20
    127e:	96be                	add	a3,a3,a5
    1280:	0006c783          	lbu	a5,0(a3)
    1284:	4599                	li	a1,6
    1286:	00f10723          	sb	a5,14(sp)

    if (sign)
    128a:	00055763          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1296:	4595                	li	a1,5
    write(f, s, l);
    1298:	003c                	add	a5,sp,8
    129a:	4641                	li	a2,16
    129c:	9e0d                	subw	a2,a2,a1
    129e:	4505                	li	a0,1
    12a0:	95be                	add	a1,a1,a5
    12a2:	26d000ef          	jal	1d0e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12a6:	70a2                	ld	ra,40(sp)
    12a8:	6145                	add	sp,sp,48
    12aa:	8082                	ret
        x = -xx;
    12ac:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12b0:	02b677bb          	remuw	a5,a2,a1
    12b4:	00001697          	auipc	a3,0x1
    12b8:	e1468693          	add	a3,a3,-492 # 20c8 <digits>
    buf[16] = 0;
    12bc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12c0:	0005871b          	sext.w	a4,a1
    12c4:	1782                	sll	a5,a5,0x20
    12c6:	9381                	srl	a5,a5,0x20
    12c8:	97b6                	add	a5,a5,a3
    12ca:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12ce:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12d2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12d6:	ecb67ae3          	bgeu	a2,a1,11aa <printint.constprop.0+0x32>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12e2:	45b9                	li	a1,14
    12e4:	bf55                	j	1298 <printint.constprop.0+0x120>
    12e6:	45a9                	li	a1,10
    if (sign)
    12e8:	fa0558e3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12f4:	45a5                	li	a1,9
    12f6:	b74d                	j	1298 <printint.constprop.0+0x120>
    12f8:	45b9                	li	a1,14
    if (sign)
    12fa:	f8055fe3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1306:	45b5                	li	a1,13
    1308:	bf41                	j	1298 <printint.constprop.0+0x120>
    130a:	45b5                	li	a1,13
    if (sign)
    130c:	f80556e3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1310:	02d00793          	li	a5,45
    1314:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1318:	45b1                	li	a1,12
    131a:	bfbd                	j	1298 <printint.constprop.0+0x120>
    131c:	45b1                	li	a1,12
    if (sign)
    131e:	f6055de3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1322:	02d00793          	li	a5,45
    1326:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    132a:	45ad                	li	a1,11
    132c:	b7b5                	j	1298 <printint.constprop.0+0x120>
    132e:	45ad                	li	a1,11
    if (sign)
    1330:	f60554e3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1334:	02d00793          	li	a5,45
    1338:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    133c:	45a9                	li	a1,10
    133e:	bfa9                	j	1298 <printint.constprop.0+0x120>
    1340:	45a5                	li	a1,9
    if (sign)
    1342:	f4055be3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1346:	02d00793          	li	a5,45
    134a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    134e:	45a1                	li	a1,8
    1350:	b7a1                	j	1298 <printint.constprop.0+0x120>
    i = 15;
    1352:	45bd                	li	a1,15
    1354:	b791                	j	1298 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1356:	45a1                	li	a1,8
    if (sign)
    1358:	f40550e3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    135c:	02d00793          	li	a5,45
    1360:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1364:	459d                	li	a1,7
    1366:	bf0d                	j	1298 <printint.constprop.0+0x120>
    1368:	459d                	li	a1,7
    if (sign)
    136a:	f20557e3          	bgez	a0,1298 <printint.constprop.0+0x120>
        buf[i--] = '-';
    136e:	02d00793          	li	a5,45
    1372:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1376:	4599                	li	a1,6
    1378:	b705                	j	1298 <printint.constprop.0+0x120>

000000000000137a <getchar>:
{
    137a:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    137c:	00f10593          	add	a1,sp,15
    1380:	4605                	li	a2,1
    1382:	4501                	li	a0,0
{
    1384:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1386:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    138a:	17b000ef          	jal	1d04 <read>
}
    138e:	60e2                	ld	ra,24(sp)
    1390:	00f14503          	lbu	a0,15(sp)
    1394:	6105                	add	sp,sp,32
    1396:	8082                	ret

0000000000001398 <putchar>:
{
    1398:	1101                	add	sp,sp,-32
    139a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    139c:	00f10593          	add	a1,sp,15
    13a0:	4605                	li	a2,1
    13a2:	4505                	li	a0,1
{
    13a4:	ec06                	sd	ra,24(sp)
    char byte = c;
    13a6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13aa:	165000ef          	jal	1d0e <write>
}
    13ae:	60e2                	ld	ra,24(sp)
    13b0:	2501                	sext.w	a0,a0
    13b2:	6105                	add	sp,sp,32
    13b4:	8082                	ret

00000000000013b6 <puts>:
{
    13b6:	1141                	add	sp,sp,-16
    13b8:	e406                	sd	ra,8(sp)
    13ba:	e022                	sd	s0,0(sp)
    13bc:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13be:	574000ef          	jal	1932 <strlen>
    13c2:	862a                	mv	a2,a0
    13c4:	85a2                	mv	a1,s0
    13c6:	4505                	li	a0,1
    13c8:	147000ef          	jal	1d0e <write>
}
    13cc:	60a2                	ld	ra,8(sp)
    13ce:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13d0:	957d                	sra	a0,a0,0x3f
    return r;
    13d2:	2501                	sext.w	a0,a0
}
    13d4:	0141                	add	sp,sp,16
    13d6:	8082                	ret

00000000000013d8 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13d8:	7171                	add	sp,sp,-176
    13da:	f85a                	sd	s6,48(sp)
    13dc:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13de:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13e0:	18bc                	add	a5,sp,120
{
    13e2:	e8ca                	sd	s2,80(sp)
    13e4:	e4ce                	sd	s3,72(sp)
    13e6:	e0d2                	sd	s4,64(sp)
    13e8:	fc56                	sd	s5,56(sp)
    13ea:	f486                	sd	ra,104(sp)
    13ec:	f0a2                	sd	s0,96(sp)
    13ee:	eca6                	sd	s1,88(sp)
    13f0:	fcae                	sd	a1,120(sp)
    13f2:	e132                	sd	a2,128(sp)
    13f4:	e536                	sd	a3,136(sp)
    13f6:	e93a                	sd	a4,144(sp)
    13f8:	f142                	sd	a6,160(sp)
    13fa:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13fc:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13fe:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1402:	07300a13          	li	s4,115
    1406:	07800a93          	li	s5,120
    buf[i++] = '0';
    140a:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140e:	00001997          	auipc	s3,0x1
    1412:	cba98993          	add	s3,s3,-838 # 20c8 <digits>
        if (!*s)
    1416:	00054783          	lbu	a5,0(a0)
    141a:	16078a63          	beqz	a5,158e <printf+0x1b6>
    141e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1420:	19278d63          	beq	a5,s2,15ba <printf+0x1e2>
    1424:	00164783          	lbu	a5,1(a2)
    1428:	0605                	add	a2,a2,1
    142a:	fbfd                	bnez	a5,1420 <printf+0x48>
    142c:	84b2                	mv	s1,a2
        l = z - a;
    142e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1432:	85aa                	mv	a1,a0
    1434:	8622                	mv	a2,s0
    1436:	4505                	li	a0,1
    1438:	0d7000ef          	jal	1d0e <write>
        if (l)
    143c:	1a041463          	bnez	s0,15e4 <printf+0x20c>
        if (s[1] == 0)
    1440:	0014c783          	lbu	a5,1(s1)
    1444:	14078563          	beqz	a5,158e <printf+0x1b6>
        switch (s[1])
    1448:	1b478063          	beq	a5,s4,15e8 <printf+0x210>
    144c:	14fa6b63          	bltu	s4,a5,15a2 <printf+0x1ca>
    1450:	06400713          	li	a4,100
    1454:	1ee78063          	beq	a5,a4,1634 <printf+0x25c>
    1458:	07000713          	li	a4,112
    145c:	1ae79963          	bne	a5,a4,160e <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1460:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1462:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1466:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1468:	631c                	ld	a5,0(a4)
    146a:	0721                	add	a4,a4,8
    146c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146e:	00479293          	sll	t0,a5,0x4
    1472:	00879f93          	sll	t6,a5,0x8
    1476:	00c79f13          	sll	t5,a5,0xc
    147a:	01079e93          	sll	t4,a5,0x10
    147e:	01479e13          	sll	t3,a5,0x14
    1482:	01879313          	sll	t1,a5,0x18
    1486:	01c79893          	sll	a7,a5,0x1c
    148a:	02479813          	sll	a6,a5,0x24
    148e:	02879513          	sll	a0,a5,0x28
    1492:	02c79593          	sll	a1,a5,0x2c
    1496:	03079693          	sll	a3,a5,0x30
    149a:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149e:	03c7d413          	srl	s0,a5,0x3c
    14a2:	01c7d39b          	srlw	t2,a5,0x1c
    14a6:	03c2d293          	srl	t0,t0,0x3c
    14aa:	03cfdf93          	srl	t6,t6,0x3c
    14ae:	03cf5f13          	srl	t5,t5,0x3c
    14b2:	03cede93          	srl	t4,t4,0x3c
    14b6:	03ce5e13          	srl	t3,t3,0x3c
    14ba:	03c35313          	srl	t1,t1,0x3c
    14be:	03c8d893          	srl	a7,a7,0x3c
    14c2:	03c85813          	srl	a6,a6,0x3c
    14c6:	9171                	srl	a0,a0,0x3c
    14c8:	91f1                	srl	a1,a1,0x3c
    14ca:	92f1                	srl	a3,a3,0x3c
    14cc:	9371                	srl	a4,a4,0x3c
    14ce:	96ce                	add	a3,a3,s3
    14d0:	974e                	add	a4,a4,s3
    14d2:	944e                	add	s0,s0,s3
    14d4:	92ce                	add	t0,t0,s3
    14d6:	9fce                	add	t6,t6,s3
    14d8:	9f4e                	add	t5,t5,s3
    14da:	9ece                	add	t4,t4,s3
    14dc:	9e4e                	add	t3,t3,s3
    14de:	934e                	add	t1,t1,s3
    14e0:	98ce                	add	a7,a7,s3
    14e2:	93ce                	add	t2,t2,s3
    14e4:	984e                	add	a6,a6,s3
    14e6:	954e                	add	a0,a0,s3
    14e8:	95ce                	add	a1,a1,s3
    14ea:	0006c083          	lbu	ra,0(a3)
    14ee:	0002c283          	lbu	t0,0(t0)
    14f2:	00074683          	lbu	a3,0(a4)
    14f6:	000fcf83          	lbu	t6,0(t6)
    14fa:	000f4f03          	lbu	t5,0(t5)
    14fe:	000ece83          	lbu	t4,0(t4)
    1502:	000e4e03          	lbu	t3,0(t3)
    1506:	00034303          	lbu	t1,0(t1)
    150a:	0008c883          	lbu	a7,0(a7)
    150e:	0003c383          	lbu	t2,0(t2)
    1512:	00084803          	lbu	a6,0(a6)
    1516:	00054503          	lbu	a0,0(a0)
    151a:	0005c583          	lbu	a1,0(a1)
    151e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1522:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1526:	9371                	srl	a4,a4,0x3c
    1528:	8bbd                	and	a5,a5,15
    152a:	974e                	add	a4,a4,s3
    152c:	97ce                	add	a5,a5,s3
    152e:	005105a3          	sb	t0,11(sp)
    1532:	01f10623          	sb	t6,12(sp)
    1536:	01e106a3          	sb	t5,13(sp)
    153a:	01d10723          	sb	t4,14(sp)
    153e:	01c107a3          	sb	t3,15(sp)
    1542:	00610823          	sb	t1,16(sp)
    1546:	011108a3          	sb	a7,17(sp)
    154a:	00710923          	sb	t2,18(sp)
    154e:	010109a3          	sb	a6,19(sp)
    1552:	00a10a23          	sb	a0,20(sp)
    1556:	00b10aa3          	sb	a1,21(sp)
    155a:	00110b23          	sb	ra,22(sp)
    155e:	00d10ba3          	sb	a3,23(sp)
    1562:	00810523          	sb	s0,10(sp)
    1566:	00074703          	lbu	a4,0(a4)
    156a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    156e:	002c                	add	a1,sp,8
    1570:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1572:	00e10c23          	sb	a4,24(sp)
    1576:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    157a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    157e:	790000ef          	jal	1d0e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1582:	00248513          	add	a0,s1,2
        if (!*s)
    1586:	00054783          	lbu	a5,0(a0)
    158a:	e8079ae3          	bnez	a5,141e <printf+0x46>
    }
    va_end(ap);
}
    158e:	70a6                	ld	ra,104(sp)
    1590:	7406                	ld	s0,96(sp)
    1592:	64e6                	ld	s1,88(sp)
    1594:	6946                	ld	s2,80(sp)
    1596:	69a6                	ld	s3,72(sp)
    1598:	6a06                	ld	s4,64(sp)
    159a:	7ae2                	ld	s5,56(sp)
    159c:	7b42                	ld	s6,48(sp)
    159e:	614d                	add	sp,sp,176
    15a0:	8082                	ret
        switch (s[1])
    15a2:	07579663          	bne	a5,s5,160e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15a6:	6782                	ld	a5,0(sp)
    15a8:	45c1                	li	a1,16
    15aa:	4388                	lw	a0,0(a5)
    15ac:	07a1                	add	a5,a5,8
    15ae:	e03e                	sd	a5,0(sp)
    15b0:	bc9ff0ef          	jal	1178 <printint.constprop.0>
        s += 2;
    15b4:	00248513          	add	a0,s1,2
    15b8:	b7f9                	j	1586 <printf+0x1ae>
    15ba:	84b2                	mv	s1,a2
    15bc:	a039                	j	15ca <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15be:	0024c783          	lbu	a5,2(s1)
    15c2:	0605                	add	a2,a2,1
    15c4:	0489                	add	s1,s1,2
    15c6:	e72794e3          	bne	a5,s2,142e <printf+0x56>
    15ca:	0014c783          	lbu	a5,1(s1)
    15ce:	ff2788e3          	beq	a5,s2,15be <printf+0x1e6>
        l = z - a;
    15d2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15d6:	85aa                	mv	a1,a0
    15d8:	8622                	mv	a2,s0
    15da:	4505                	li	a0,1
    15dc:	732000ef          	jal	1d0e <write>
        if (l)
    15e0:	e60400e3          	beqz	s0,1440 <printf+0x68>
    15e4:	8526                	mv	a0,s1
    15e6:	bd05                	j	1416 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15e8:	6782                	ld	a5,0(sp)
    15ea:	6380                	ld	s0,0(a5)
    15ec:	07a1                	add	a5,a5,8
    15ee:	e03e                	sd	a5,0(sp)
    15f0:	cc21                	beqz	s0,1648 <printf+0x270>
            l = strnlen(a, 200);
    15f2:	0c800593          	li	a1,200
    15f6:	8522                	mv	a0,s0
    15f8:	424000ef          	jal	1a1c <strnlen>
    write(f, s, l);
    15fc:	0005061b          	sext.w	a2,a0
    1600:	85a2                	mv	a1,s0
    1602:	4505                	li	a0,1
    1604:	70a000ef          	jal	1d0e <write>
        s += 2;
    1608:	00248513          	add	a0,s1,2
    160c:	bfad                	j	1586 <printf+0x1ae>
    return write(stdout, &byte, 1);
    160e:	4605                	li	a2,1
    1610:	002c                	add	a1,sp,8
    1612:	4505                	li	a0,1
    char byte = c;
    1614:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1618:	6f6000ef          	jal	1d0e <write>
    char byte = c;
    161c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1620:	4605                	li	a2,1
    1622:	002c                	add	a1,sp,8
    1624:	4505                	li	a0,1
    char byte = c;
    1626:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    162a:	6e4000ef          	jal	1d0e <write>
        s += 2;
    162e:	00248513          	add	a0,s1,2
    1632:	bf91                	j	1586 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1634:	6782                	ld	a5,0(sp)
    1636:	45a9                	li	a1,10
    1638:	4388                	lw	a0,0(a5)
    163a:	07a1                	add	a5,a5,8
    163c:	e03e                	sd	a5,0(sp)
    163e:	b3bff0ef          	jal	1178 <printint.constprop.0>
        s += 2;
    1642:	00248513          	add	a0,s1,2
    1646:	b781                	j	1586 <printf+0x1ae>
                a = "(null)";
    1648:	00001417          	auipc	s0,0x1
    164c:	a4040413          	add	s0,s0,-1472 # 2088 <__clone+0x11c>
    1650:	b74d                	j	15f2 <printf+0x21a>

0000000000001652 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1652:	1141                	add	sp,sp,-16
    1654:	e406                	sd	ra,8(sp)
    puts(m);
    1656:	d61ff0ef          	jal	13b6 <puts>
    exit(-100);
}
    165a:	60a2                	ld	ra,8(sp)
    exit(-100);
    165c:	f9c00513          	li	a0,-100
}
    1660:	0141                	add	sp,sp,16
    exit(-100);
    1662:	a719                	j	1d68 <exit>

0000000000001664 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1664:	02000793          	li	a5,32
    1668:	00f50663          	beq	a0,a5,1674 <isspace+0x10>
    166c:	355d                	addw	a0,a0,-9
    166e:	00553513          	sltiu	a0,a0,5
    1672:	8082                	ret
    1674:	4505                	li	a0,1
}
    1676:	8082                	ret

0000000000001678 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1678:	fd05051b          	addw	a0,a0,-48
}
    167c:	00a53513          	sltiu	a0,a0,10
    1680:	8082                	ret

0000000000001682 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1682:	02000693          	li	a3,32
    1686:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1688:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    168c:	ff77871b          	addw	a4,a5,-9
    1690:	04d78c63          	beq	a5,a3,16e8 <atoi+0x66>
    1694:	0007861b          	sext.w	a2,a5
    1698:	04e5f863          	bgeu	a1,a4,16e8 <atoi+0x66>
        s++;
    switch (*s)
    169c:	02b00713          	li	a4,43
    16a0:	04e78963          	beq	a5,a4,16f2 <atoi+0x70>
    16a4:	02d00713          	li	a4,45
    16a8:	06e78263          	beq	a5,a4,170c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16ac:	fd06069b          	addw	a3,a2,-48
    16b0:	47a5                	li	a5,9
    16b2:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16b4:	4301                	li	t1,0
    while (isdigit(*s))
    16b6:	04d7e963          	bltu	a5,a3,1708 <atoi+0x86>
    int n = 0, neg = 0;
    16ba:	4501                	li	a0,0
    while (isdigit(*s))
    16bc:	48a5                	li	a7,9
    16be:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16c2:	0025179b          	sllw	a5,a0,0x2
    16c6:	9fa9                	addw	a5,a5,a0
    16c8:	fd06059b          	addw	a1,a2,-48
    16cc:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16d0:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16d4:	0705                	add	a4,a4,1
    16d6:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16da:	0006861b          	sext.w	a2,a3
    16de:	ff08f0e3          	bgeu	a7,a6,16be <atoi+0x3c>
    return neg ? n : -n;
    16e2:	00030563          	beqz	t1,16ec <atoi+0x6a>
}
    16e6:	8082                	ret
        s++;
    16e8:	0505                	add	a0,a0,1
    16ea:	bf79                	j	1688 <atoi+0x6>
    return neg ? n : -n;
    16ec:	40f5853b          	subw	a0,a1,a5
    16f0:	8082                	ret
    while (isdigit(*s))
    16f2:	00154603          	lbu	a2,1(a0)
    16f6:	47a5                	li	a5,9
        s++;
    16f8:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16fc:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1700:	4301                	li	t1,0
    while (isdigit(*s))
    1702:	2601                	sext.w	a2,a2
    1704:	fad7fbe3          	bgeu	a5,a3,16ba <atoi+0x38>
    1708:	4501                	li	a0,0
}
    170a:	8082                	ret
    while (isdigit(*s))
    170c:	00154603          	lbu	a2,1(a0)
    1710:	47a5                	li	a5,9
        s++;
    1712:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1716:	fd06069b          	addw	a3,a2,-48
    171a:	2601                	sext.w	a2,a2
    171c:	fed7e6e3          	bltu	a5,a3,1708 <atoi+0x86>
        neg = 1;
    1720:	4305                	li	t1,1
    1722:	bf61                	j	16ba <atoi+0x38>

0000000000001724 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1724:	18060163          	beqz	a2,18a6 <memset+0x182>
    1728:	40a006b3          	neg	a3,a0
    172c:	0076f793          	and	a5,a3,7
    1730:	00778813          	add	a6,a5,7
    1734:	48ad                	li	a7,11
    1736:	0ff5f713          	zext.b	a4,a1
    173a:	fff60593          	add	a1,a2,-1
    173e:	17186563          	bltu	a6,a7,18a8 <memset+0x184>
    1742:	1705ed63          	bltu	a1,a6,18bc <memset+0x198>
    1746:	16078363          	beqz	a5,18ac <memset+0x188>
    174a:	00e50023          	sb	a4,0(a0)
    174e:	0066f593          	and	a1,a3,6
    1752:	16058063          	beqz	a1,18b2 <memset+0x18e>
    1756:	00e500a3          	sb	a4,1(a0)
    175a:	4589                	li	a1,2
    175c:	16f5f363          	bgeu	a1,a5,18c2 <memset+0x19e>
    1760:	00e50123          	sb	a4,2(a0)
    1764:	8a91                	and	a3,a3,4
    1766:	00350593          	add	a1,a0,3
    176a:	4e0d                	li	t3,3
    176c:	ce9d                	beqz	a3,17aa <memset+0x86>
    176e:	00e501a3          	sb	a4,3(a0)
    1772:	4691                	li	a3,4
    1774:	00450593          	add	a1,a0,4
    1778:	4e11                	li	t3,4
    177a:	02f6f863          	bgeu	a3,a5,17aa <memset+0x86>
    177e:	00e50223          	sb	a4,4(a0)
    1782:	4695                	li	a3,5
    1784:	00550593          	add	a1,a0,5
    1788:	4e15                	li	t3,5
    178a:	02d78063          	beq	a5,a3,17aa <memset+0x86>
    178e:	fff50693          	add	a3,a0,-1
    1792:	00e502a3          	sb	a4,5(a0)
    1796:	8a9d                	and	a3,a3,7
    1798:	00650593          	add	a1,a0,6
    179c:	4e19                	li	t3,6
    179e:	e691                	bnez	a3,17aa <memset+0x86>
    17a0:	00750593          	add	a1,a0,7
    17a4:	00e50323          	sb	a4,6(a0)
    17a8:	4e1d                	li	t3,7
    17aa:	00871693          	sll	a3,a4,0x8
    17ae:	01071813          	sll	a6,a4,0x10
    17b2:	8ed9                	or	a3,a3,a4
    17b4:	01871893          	sll	a7,a4,0x18
    17b8:	0106e6b3          	or	a3,a3,a6
    17bc:	0116e6b3          	or	a3,a3,a7
    17c0:	02071813          	sll	a6,a4,0x20
    17c4:	02871313          	sll	t1,a4,0x28
    17c8:	0106e6b3          	or	a3,a3,a6
    17cc:	40f608b3          	sub	a7,a2,a5
    17d0:	03071813          	sll	a6,a4,0x30
    17d4:	0066e6b3          	or	a3,a3,t1
    17d8:	0106e6b3          	or	a3,a3,a6
    17dc:	03871313          	sll	t1,a4,0x38
    17e0:	97aa                	add	a5,a5,a0
    17e2:	ff88f813          	and	a6,a7,-8
    17e6:	0066e6b3          	or	a3,a3,t1
    17ea:	983e                	add	a6,a6,a5
    17ec:	e394                	sd	a3,0(a5)
    17ee:	07a1                	add	a5,a5,8
    17f0:	ff079ee3          	bne	a5,a6,17ec <memset+0xc8>
    17f4:	ff88f793          	and	a5,a7,-8
    17f8:	0078f893          	and	a7,a7,7
    17fc:	00f586b3          	add	a3,a1,a5
    1800:	01c787bb          	addw	a5,a5,t3
    1804:	0a088b63          	beqz	a7,18ba <memset+0x196>
    1808:	00e68023          	sb	a4,0(a3)
    180c:	0017859b          	addw	a1,a5,1
    1810:	08c5fb63          	bgeu	a1,a2,18a6 <memset+0x182>
    1814:	00e680a3          	sb	a4,1(a3)
    1818:	0027859b          	addw	a1,a5,2
    181c:	08c5f563          	bgeu	a1,a2,18a6 <memset+0x182>
    1820:	00e68123          	sb	a4,2(a3)
    1824:	0037859b          	addw	a1,a5,3
    1828:	06c5ff63          	bgeu	a1,a2,18a6 <memset+0x182>
    182c:	00e681a3          	sb	a4,3(a3)
    1830:	0047859b          	addw	a1,a5,4
    1834:	06c5f963          	bgeu	a1,a2,18a6 <memset+0x182>
    1838:	00e68223          	sb	a4,4(a3)
    183c:	0057859b          	addw	a1,a5,5
    1840:	06c5f363          	bgeu	a1,a2,18a6 <memset+0x182>
    1844:	00e682a3          	sb	a4,5(a3)
    1848:	0067859b          	addw	a1,a5,6
    184c:	04c5fd63          	bgeu	a1,a2,18a6 <memset+0x182>
    1850:	00e68323          	sb	a4,6(a3)
    1854:	0077859b          	addw	a1,a5,7
    1858:	04c5f763          	bgeu	a1,a2,18a6 <memset+0x182>
    185c:	00e683a3          	sb	a4,7(a3)
    1860:	0087859b          	addw	a1,a5,8
    1864:	04c5f163          	bgeu	a1,a2,18a6 <memset+0x182>
    1868:	00e68423          	sb	a4,8(a3)
    186c:	0097859b          	addw	a1,a5,9
    1870:	02c5fb63          	bgeu	a1,a2,18a6 <memset+0x182>
    1874:	00e684a3          	sb	a4,9(a3)
    1878:	00a7859b          	addw	a1,a5,10
    187c:	02c5f563          	bgeu	a1,a2,18a6 <memset+0x182>
    1880:	00e68523          	sb	a4,10(a3)
    1884:	00b7859b          	addw	a1,a5,11
    1888:	00c5ff63          	bgeu	a1,a2,18a6 <memset+0x182>
    188c:	00e685a3          	sb	a4,11(a3)
    1890:	00c7859b          	addw	a1,a5,12
    1894:	00c5f963          	bgeu	a1,a2,18a6 <memset+0x182>
    1898:	00e68623          	sb	a4,12(a3)
    189c:	27b5                	addw	a5,a5,13
    189e:	00c7f463          	bgeu	a5,a2,18a6 <memset+0x182>
    18a2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18a6:	8082                	ret
    18a8:	482d                	li	a6,11
    18aa:	bd61                	j	1742 <memset+0x1e>
    char *p = dest;
    18ac:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18ae:	4e01                	li	t3,0
    18b0:	bded                	j	17aa <memset+0x86>
    18b2:	00150593          	add	a1,a0,1
    18b6:	4e05                	li	t3,1
    18b8:	bdcd                	j	17aa <memset+0x86>
    18ba:	8082                	ret
    char *p = dest;
    18bc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18be:	4781                	li	a5,0
    18c0:	b7a1                	j	1808 <memset+0xe4>
    18c2:	00250593          	add	a1,a0,2
    18c6:	4e09                	li	t3,2
    18c8:	b5cd                	j	17aa <memset+0x86>

00000000000018ca <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18ca:	00054783          	lbu	a5,0(a0)
    18ce:	0005c703          	lbu	a4,0(a1)
    18d2:	00e79863          	bne	a5,a4,18e2 <strcmp+0x18>
    18d6:	0505                	add	a0,a0,1
    18d8:	0585                	add	a1,a1,1
    18da:	fbe5                	bnez	a5,18ca <strcmp>
    18dc:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18de:	9d19                	subw	a0,a0,a4
    18e0:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18e2:	0007851b          	sext.w	a0,a5
    18e6:	bfe5                	j	18de <strcmp+0x14>

00000000000018e8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18e8:	ca15                	beqz	a2,191c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18ea:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18ee:	167d                	add	a2,a2,-1
    18f0:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18f4:	eb99                	bnez	a5,190a <strncmp+0x22>
    18f6:	a815                	j	192a <strncmp+0x42>
    18f8:	00a68e63          	beq	a3,a0,1914 <strncmp+0x2c>
    18fc:	0505                	add	a0,a0,1
    18fe:	00f71b63          	bne	a4,a5,1914 <strncmp+0x2c>
    1902:	00054783          	lbu	a5,0(a0)
    1906:	cf89                	beqz	a5,1920 <strncmp+0x38>
    1908:	85b2                	mv	a1,a2
    190a:	0005c703          	lbu	a4,0(a1)
    190e:	00158613          	add	a2,a1,1
    1912:	f37d                	bnez	a4,18f8 <strncmp+0x10>
        ;
    return *l - *r;
    1914:	0007851b          	sext.w	a0,a5
    1918:	9d19                	subw	a0,a0,a4
    191a:	8082                	ret
        return 0;
    191c:	4501                	li	a0,0
}
    191e:	8082                	ret
    return *l - *r;
    1920:	0015c703          	lbu	a4,1(a1)
    1924:	4501                	li	a0,0
    1926:	9d19                	subw	a0,a0,a4
    1928:	8082                	ret
    192a:	0005c703          	lbu	a4,0(a1)
    192e:	4501                	li	a0,0
    1930:	b7e5                	j	1918 <strncmp+0x30>

0000000000001932 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1932:	00757793          	and	a5,a0,7
    1936:	cf89                	beqz	a5,1950 <strlen+0x1e>
    1938:	87aa                	mv	a5,a0
    193a:	a029                	j	1944 <strlen+0x12>
    193c:	0785                	add	a5,a5,1
    193e:	0077f713          	and	a4,a5,7
    1942:	cb01                	beqz	a4,1952 <strlen+0x20>
        if (!*s)
    1944:	0007c703          	lbu	a4,0(a5)
    1948:	fb75                	bnez	a4,193c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    194a:	40a78533          	sub	a0,a5,a0
}
    194e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1950:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1952:	6394                	ld	a3,0(a5)
    1954:	00000597          	auipc	a1,0x0
    1958:	73c5b583          	ld	a1,1852(a1) # 2090 <__clone+0x124>
    195c:	00000617          	auipc	a2,0x0
    1960:	73c63603          	ld	a2,1852(a2) # 2098 <__clone+0x12c>
    1964:	a019                	j	196a <strlen+0x38>
    1966:	6794                	ld	a3,8(a5)
    1968:	07a1                	add	a5,a5,8
    196a:	00b68733          	add	a4,a3,a1
    196e:	fff6c693          	not	a3,a3
    1972:	8f75                	and	a4,a4,a3
    1974:	8f71                	and	a4,a4,a2
    1976:	db65                	beqz	a4,1966 <strlen+0x34>
    for (; *s; s++)
    1978:	0007c703          	lbu	a4,0(a5)
    197c:	d779                	beqz	a4,194a <strlen+0x18>
    197e:	0017c703          	lbu	a4,1(a5)
    1982:	0785                	add	a5,a5,1
    1984:	d379                	beqz	a4,194a <strlen+0x18>
    1986:	0017c703          	lbu	a4,1(a5)
    198a:	0785                	add	a5,a5,1
    198c:	fb6d                	bnez	a4,197e <strlen+0x4c>
    198e:	bf75                	j	194a <strlen+0x18>

0000000000001990 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1990:	00757713          	and	a4,a0,7
{
    1994:	87aa                	mv	a5,a0
    1996:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    199a:	cb19                	beqz	a4,19b0 <memchr+0x20>
    199c:	ce25                	beqz	a2,1a14 <memchr+0x84>
    199e:	0007c703          	lbu	a4,0(a5)
    19a2:	00b70763          	beq	a4,a1,19b0 <memchr+0x20>
    19a6:	0785                	add	a5,a5,1
    19a8:	0077f713          	and	a4,a5,7
    19ac:	167d                	add	a2,a2,-1
    19ae:	f77d                	bnez	a4,199c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19b0:	4501                	li	a0,0
    if (n && *s != c)
    19b2:	c235                	beqz	a2,1a16 <memchr+0x86>
    19b4:	0007c703          	lbu	a4,0(a5)
    19b8:	06b70063          	beq	a4,a1,1a18 <memchr+0x88>
        size_t k = ONES * c;
    19bc:	00000517          	auipc	a0,0x0
    19c0:	6e453503          	ld	a0,1764(a0) # 20a0 <__clone+0x134>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c4:	471d                	li	a4,7
        size_t k = ONES * c;
    19c6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ca:	04c77763          	bgeu	a4,a2,1a18 <memchr+0x88>
    19ce:	00000897          	auipc	a7,0x0
    19d2:	6c28b883          	ld	a7,1730(a7) # 2090 <__clone+0x124>
    19d6:	00000817          	auipc	a6,0x0
    19da:	6c283803          	ld	a6,1730(a6) # 2098 <__clone+0x12c>
    19de:	431d                	li	t1,7
    19e0:	a029                	j	19ea <memchr+0x5a>
    19e2:	1661                	add	a2,a2,-8
    19e4:	07a1                	add	a5,a5,8
    19e6:	00c37c63          	bgeu	t1,a2,19fe <memchr+0x6e>
    19ea:	6398                	ld	a4,0(a5)
    19ec:	8f29                	xor	a4,a4,a0
    19ee:	011706b3          	add	a3,a4,a7
    19f2:	fff74713          	not	a4,a4
    19f6:	8f75                	and	a4,a4,a3
    19f8:	01077733          	and	a4,a4,a6
    19fc:	d37d                	beqz	a4,19e2 <memchr+0x52>
    19fe:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a00:	e601                	bnez	a2,1a08 <memchr+0x78>
    1a02:	a809                	j	1a14 <memchr+0x84>
    1a04:	0505                	add	a0,a0,1
    1a06:	c619                	beqz	a2,1a14 <memchr+0x84>
    1a08:	00054783          	lbu	a5,0(a0)
    1a0c:	167d                	add	a2,a2,-1
    1a0e:	feb79be3          	bne	a5,a1,1a04 <memchr+0x74>
    1a12:	8082                	ret
    return n ? (void *)s : 0;
    1a14:	4501                	li	a0,0
}
    1a16:	8082                	ret
    if (n && *s != c)
    1a18:	853e                	mv	a0,a5
    1a1a:	b7fd                	j	1a08 <memchr+0x78>

0000000000001a1c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a1c:	1101                	add	sp,sp,-32
    1a1e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a20:	862e                	mv	a2,a1
{
    1a22:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a24:	4581                	li	a1,0
{
    1a26:	e426                	sd	s1,8(sp)
    1a28:	ec06                	sd	ra,24(sp)
    1a2a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a2c:	f65ff0ef          	jal	1990 <memchr>
    return p ? p - s : n;
    1a30:	c519                	beqz	a0,1a3e <strnlen+0x22>
}
    1a32:	60e2                	ld	ra,24(sp)
    1a34:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a36:	8d05                	sub	a0,a0,s1
}
    1a38:	64a2                	ld	s1,8(sp)
    1a3a:	6105                	add	sp,sp,32
    1a3c:	8082                	ret
    1a3e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a40:	8522                	mv	a0,s0
}
    1a42:	6442                	ld	s0,16(sp)
    1a44:	64a2                	ld	s1,8(sp)
    1a46:	6105                	add	sp,sp,32
    1a48:	8082                	ret

0000000000001a4a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a4a:	00a5c7b3          	xor	a5,a1,a0
    1a4e:	8b9d                	and	a5,a5,7
    1a50:	eb95                	bnez	a5,1a84 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a52:	0075f793          	and	a5,a1,7
    1a56:	e7b1                	bnez	a5,1aa2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a58:	6198                	ld	a4,0(a1)
    1a5a:	00000617          	auipc	a2,0x0
    1a5e:	63663603          	ld	a2,1590(a2) # 2090 <__clone+0x124>
    1a62:	00000817          	auipc	a6,0x0
    1a66:	63683803          	ld	a6,1590(a6) # 2098 <__clone+0x12c>
    1a6a:	a029                	j	1a74 <strcpy+0x2a>
    1a6c:	05a1                	add	a1,a1,8
    1a6e:	e118                	sd	a4,0(a0)
    1a70:	6198                	ld	a4,0(a1)
    1a72:	0521                	add	a0,a0,8
    1a74:	00c707b3          	add	a5,a4,a2
    1a78:	fff74693          	not	a3,a4
    1a7c:	8ff5                	and	a5,a5,a3
    1a7e:	0107f7b3          	and	a5,a5,a6
    1a82:	d7ed                	beqz	a5,1a6c <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a84:	0005c783          	lbu	a5,0(a1)
    1a88:	00f50023          	sb	a5,0(a0)
    1a8c:	c785                	beqz	a5,1ab4 <strcpy+0x6a>
    1a8e:	0015c783          	lbu	a5,1(a1)
    1a92:	0505                	add	a0,a0,1
    1a94:	0585                	add	a1,a1,1
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	fbf5                	bnez	a5,1a8e <strcpy+0x44>
        ;
    return d;
}
    1a9c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a9e:	0505                	add	a0,a0,1
    1aa0:	df45                	beqz	a4,1a58 <strcpy+0xe>
            if (!(*d = *s))
    1aa2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aa6:	0585                	add	a1,a1,1
    1aa8:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aac:	00f50023          	sb	a5,0(a0)
    1ab0:	f7fd                	bnez	a5,1a9e <strcpy+0x54>
}
    1ab2:	8082                	ret
    1ab4:	8082                	ret

0000000000001ab6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ab6:	00a5c7b3          	xor	a5,a1,a0
    1aba:	8b9d                	and	a5,a5,7
    1abc:	e3b5                	bnez	a5,1b20 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1abe:	0075f793          	and	a5,a1,7
    1ac2:	cf99                	beqz	a5,1ae0 <strncpy+0x2a>
    1ac4:	ea09                	bnez	a2,1ad6 <strncpy+0x20>
    1ac6:	a421                	j	1cce <strncpy+0x218>
    1ac8:	0585                	add	a1,a1,1
    1aca:	0075f793          	and	a5,a1,7
    1ace:	167d                	add	a2,a2,-1
    1ad0:	0505                	add	a0,a0,1
    1ad2:	c799                	beqz	a5,1ae0 <strncpy+0x2a>
    1ad4:	c225                	beqz	a2,1b34 <strncpy+0x7e>
    1ad6:	0005c783          	lbu	a5,0(a1)
    1ada:	00f50023          	sb	a5,0(a0)
    1ade:	f7ed                	bnez	a5,1ac8 <strncpy+0x12>
            ;
        if (!n || !*s)
    1ae0:	ca31                	beqz	a2,1b34 <strncpy+0x7e>
    1ae2:	0005c783          	lbu	a5,0(a1)
    1ae6:	cba1                	beqz	a5,1b36 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae8:	479d                	li	a5,7
    1aea:	02c7fc63          	bgeu	a5,a2,1b22 <strncpy+0x6c>
    1aee:	00000897          	auipc	a7,0x0
    1af2:	5a28b883          	ld	a7,1442(a7) # 2090 <__clone+0x124>
    1af6:	00000817          	auipc	a6,0x0
    1afa:	5a283803          	ld	a6,1442(a6) # 2098 <__clone+0x12c>
    1afe:	431d                	li	t1,7
    1b00:	a039                	j	1b0e <strncpy+0x58>
            *wd = *ws;
    1b02:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b04:	1661                	add	a2,a2,-8
    1b06:	05a1                	add	a1,a1,8
    1b08:	0521                	add	a0,a0,8
    1b0a:	00c37b63          	bgeu	t1,a2,1b20 <strncpy+0x6a>
    1b0e:	6198                	ld	a4,0(a1)
    1b10:	011707b3          	add	a5,a4,a7
    1b14:	fff74693          	not	a3,a4
    1b18:	8ff5                	and	a5,a5,a3
    1b1a:	0107f7b3          	and	a5,a5,a6
    1b1e:	d3f5                	beqz	a5,1b02 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b20:	ca11                	beqz	a2,1b34 <strncpy+0x7e>
    1b22:	0005c783          	lbu	a5,0(a1)
    1b26:	0585                	add	a1,a1,1
    1b28:	00f50023          	sb	a5,0(a0)
    1b2c:	c789                	beqz	a5,1b36 <strncpy+0x80>
    1b2e:	167d                	add	a2,a2,-1
    1b30:	0505                	add	a0,a0,1
    1b32:	fa65                	bnez	a2,1b22 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b34:	8082                	ret
    1b36:	4805                	li	a6,1
    1b38:	14061b63          	bnez	a2,1c8e <strncpy+0x1d8>
    1b3c:	40a00733          	neg	a4,a0
    1b40:	00777793          	and	a5,a4,7
    1b44:	4581                	li	a1,0
    1b46:	12061c63          	bnez	a2,1c7e <strncpy+0x1c8>
    1b4a:	00778693          	add	a3,a5,7
    1b4e:	48ad                	li	a7,11
    1b50:	1316e563          	bltu	a3,a7,1c7a <strncpy+0x1c4>
    1b54:	16d5e263          	bltu	a1,a3,1cb8 <strncpy+0x202>
    1b58:	14078c63          	beqz	a5,1cb0 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b5c:	00050023          	sb	zero,0(a0)
    1b60:	00677693          	and	a3,a4,6
    1b64:	14068263          	beqz	a3,1ca8 <strncpy+0x1f2>
    1b68:	000500a3          	sb	zero,1(a0)
    1b6c:	4689                	li	a3,2
    1b6e:	14f6f863          	bgeu	a3,a5,1cbe <strncpy+0x208>
    1b72:	00050123          	sb	zero,2(a0)
    1b76:	8b11                	and	a4,a4,4
    1b78:	12070463          	beqz	a4,1ca0 <strncpy+0x1ea>
    1b7c:	000501a3          	sb	zero,3(a0)
    1b80:	4711                	li	a4,4
    1b82:	00450693          	add	a3,a0,4
    1b86:	02f77563          	bgeu	a4,a5,1bb0 <strncpy+0xfa>
    1b8a:	00050223          	sb	zero,4(a0)
    1b8e:	4715                	li	a4,5
    1b90:	00550693          	add	a3,a0,5
    1b94:	00e78e63          	beq	a5,a4,1bb0 <strncpy+0xfa>
    1b98:	fff50713          	add	a4,a0,-1
    1b9c:	000502a3          	sb	zero,5(a0)
    1ba0:	8b1d                	and	a4,a4,7
    1ba2:	12071263          	bnez	a4,1cc6 <strncpy+0x210>
    1ba6:	00750693          	add	a3,a0,7
    1baa:	00050323          	sb	zero,6(a0)
    1bae:	471d                	li	a4,7
    1bb0:	40f80833          	sub	a6,a6,a5
    1bb4:	ff887593          	and	a1,a6,-8
    1bb8:	97aa                	add	a5,a5,a0
    1bba:	95be                	add	a1,a1,a5
    1bbc:	0007b023          	sd	zero,0(a5)
    1bc0:	07a1                	add	a5,a5,8
    1bc2:	feb79de3          	bne	a5,a1,1bbc <strncpy+0x106>
    1bc6:	ff887593          	and	a1,a6,-8
    1bca:	00787813          	and	a6,a6,7
    1bce:	00e587bb          	addw	a5,a1,a4
    1bd2:	00b68733          	add	a4,a3,a1
    1bd6:	0e080063          	beqz	a6,1cb6 <strncpy+0x200>
    1bda:	00070023          	sb	zero,0(a4)
    1bde:	0017869b          	addw	a3,a5,1
    1be2:	f4c6f9e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1be6:	000700a3          	sb	zero,1(a4)
    1bea:	0027869b          	addw	a3,a5,2
    1bee:	f4c6f3e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1bf2:	00070123          	sb	zero,2(a4)
    1bf6:	0037869b          	addw	a3,a5,3
    1bfa:	f2c6fde3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1bfe:	000701a3          	sb	zero,3(a4)
    1c02:	0047869b          	addw	a3,a5,4
    1c06:	f2c6f7e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c0a:	00070223          	sb	zero,4(a4)
    1c0e:	0057869b          	addw	a3,a5,5
    1c12:	f2c6f1e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c16:	000702a3          	sb	zero,5(a4)
    1c1a:	0067869b          	addw	a3,a5,6
    1c1e:	f0c6fbe3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c22:	00070323          	sb	zero,6(a4)
    1c26:	0077869b          	addw	a3,a5,7
    1c2a:	f0c6f5e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c2e:	000703a3          	sb	zero,7(a4)
    1c32:	0087869b          	addw	a3,a5,8
    1c36:	eec6ffe3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c3a:	00070423          	sb	zero,8(a4)
    1c3e:	0097869b          	addw	a3,a5,9
    1c42:	eec6f9e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c46:	000704a3          	sb	zero,9(a4)
    1c4a:	00a7869b          	addw	a3,a5,10
    1c4e:	eec6f3e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c52:	00070523          	sb	zero,10(a4)
    1c56:	00b7869b          	addw	a3,a5,11
    1c5a:	ecc6fde3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c5e:	000705a3          	sb	zero,11(a4)
    1c62:	00c7869b          	addw	a3,a5,12
    1c66:	ecc6f7e3          	bgeu	a3,a2,1b34 <strncpy+0x7e>
    1c6a:	00070623          	sb	zero,12(a4)
    1c6e:	27b5                	addw	a5,a5,13
    1c70:	ecc7f2e3          	bgeu	a5,a2,1b34 <strncpy+0x7e>
    1c74:	000706a3          	sb	zero,13(a4)
}
    1c78:	8082                	ret
    1c7a:	46ad                	li	a3,11
    1c7c:	bde1                	j	1b54 <strncpy+0x9e>
    1c7e:	00778693          	add	a3,a5,7
    1c82:	48ad                	li	a7,11
    1c84:	fff60593          	add	a1,a2,-1
    1c88:	ed16f6e3          	bgeu	a3,a7,1b54 <strncpy+0x9e>
    1c8c:	b7fd                	j	1c7a <strncpy+0x1c4>
    1c8e:	40a00733          	neg	a4,a0
    1c92:	8832                	mv	a6,a2
    1c94:	00777793          	and	a5,a4,7
    1c98:	4581                	li	a1,0
    1c9a:	ea0608e3          	beqz	a2,1b4a <strncpy+0x94>
    1c9e:	b7c5                	j	1c7e <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca0:	00350693          	add	a3,a0,3
    1ca4:	470d                	li	a4,3
    1ca6:	b729                	j	1bb0 <strncpy+0xfa>
    1ca8:	00150693          	add	a3,a0,1
    1cac:	4705                	li	a4,1
    1cae:	b709                	j	1bb0 <strncpy+0xfa>
tail:
    1cb0:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb2:	4701                	li	a4,0
    1cb4:	bdf5                	j	1bb0 <strncpy+0xfa>
    1cb6:	8082                	ret
tail:
    1cb8:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cba:	4781                	li	a5,0
    1cbc:	bf39                	j	1bda <strncpy+0x124>
    1cbe:	00250693          	add	a3,a0,2
    1cc2:	4709                	li	a4,2
    1cc4:	b5f5                	j	1bb0 <strncpy+0xfa>
    1cc6:	00650693          	add	a3,a0,6
    1cca:	4719                	li	a4,6
    1ccc:	b5d5                	j	1bb0 <strncpy+0xfa>
    1cce:	8082                	ret

0000000000001cd0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cd0:	87aa                	mv	a5,a0
    1cd2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cd4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cd8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cdc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cde:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <openat>:
    register long a7 __asm__("a7") = n;
    1ce8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cec:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <close>:
    register long a7 __asm__("a7") = n;
    1cf8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cfc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <read>:
    register long a7 __asm__("a7") = n;
    1d04:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d08:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d0c:	8082                	ret

0000000000001d0e <write>:
    register long a7 __asm__("a7") = n;
    1d0e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d12:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d16:	8082                	ret

0000000000001d18 <getpid>:
    register long a7 __asm__("a7") = n;
    1d18:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d1c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <getppid>:
    register long a7 __asm__("a7") = n;
    1d24:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d28:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d30:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d34:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <fork>:
    register long a7 __asm__("a7") = n;
    1d3c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d40:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d4c:	85b2                	mv	a1,a2
    1d4e:	863a                	mv	a2,a4
    if (stack)
    1d50:	c191                	beqz	a1,1d54 <clone+0x8>
	stack += stack_size;
    1d52:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d54:	4781                	li	a5,0
    1d56:	4701                	li	a4,0
    1d58:	4681                	li	a3,0
    1d5a:	2601                	sext.w	a2,a2
    1d5c:	ac01                	j	1f6c <__clone>

0000000000001d5e <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d5e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d62:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d66:	8082                	ret

0000000000001d68 <exit>:
    register long a7 __asm__("a7") = n;
    1d68:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d70:	8082                	ret

0000000000001d72 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d72:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d76:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d78:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <exec>:
    register long a7 __asm__("a7") = n;
    1d80:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <execve>:
    register long a7 __asm__("a7") = n;
    1d8c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d90:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <times>:
    register long a7 __asm__("a7") = n;
    1d98:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d9c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <get_time>:

int64 get_time()
{
    1da4:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1da6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1daa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1db2:	2501                	sext.w	a0,a0
    1db4:	ed09                	bnez	a0,1dce <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1db6:	67a2                	ld	a5,8(sp)
    1db8:	3e800713          	li	a4,1000
    1dbc:	00015503          	lhu	a0,0(sp)
    1dc0:	02e7d7b3          	divu	a5,a5,a4
    1dc4:	02e50533          	mul	a0,a0,a4
    1dc8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dca:	0141                	add	sp,sp,16
    1dcc:	8082                	ret
        return -1;
    1dce:	557d                	li	a0,-1
    1dd0:	bfed                	j	1dca <get_time+0x26>

0000000000001dd2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dd2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <time>:
    register long a7 __asm__("a7") = n;
    1dde:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <sleep>:

int sleep(unsigned long long time)
{
    1dea:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dec:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dee:	850a                	mv	a0,sp
    1df0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1df2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1df6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dfc:	e501                	bnez	a0,1e04 <sleep+0x1a>
    return 0;
    1dfe:	4501                	li	a0,0
}
    1e00:	0141                	add	sp,sp,16
    1e02:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e04:	4502                	lw	a0,0(sp)
}
    1e06:	0141                	add	sp,sp,16
    1e08:	8082                	ret

0000000000001e0a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e0a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e16:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e1a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e1e:	8082                	ret

0000000000001e20 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e20:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <munmap>:
    register long a7 __asm__("a7") = n;
    1e2c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <wait>:

int wait(int *code)
{
    1e38:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e3a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e3e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e40:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e42:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e44:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <spawn>:
    register long a7 __asm__("a7") = n;
    1e4c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <mailread>:
    register long a7 __asm__("a7") = n;
    1e58:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e64:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <fstat>:
    register long a7 __asm__("a7") = n;
    1e70:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e7c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7e:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e82:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e84:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e8c:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e8e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e92:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e94:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e9c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e9e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ea2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <link>:

int link(char *old_path, char *new_path)
{
    1eac:	87aa                	mv	a5,a0
    1eae:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eb0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1eb4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eba:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ebe:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <unlink>:

int unlink(char *path)
{
    1ec8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eca:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ece:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ed2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <uname>:
    register long a7 __asm__("a7") = n;
    1edc:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ee0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <brk>:
    register long a7 __asm__("a7") = n;
    1ee8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eec:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ef4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1efa:	8082                	ret

0000000000001efc <chdir>:
    register long a7 __asm__("a7") = n;
    1efc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f00:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f08:	862e                	mv	a2,a1
    1f0a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f0c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f12:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f16:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f18:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <getdents>:
    register long a7 __asm__("a7") = n;
    1f22:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f26:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <pipe>:
    register long a7 __asm__("a7") = n;
    1f2e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f34:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <dup>:
    register long a7 __asm__("a7") = n;
    1f3c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f3e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <dup2>:
    register long a7 __asm__("a7") = n;
    1f46:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f48:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <mount>:
    register long a7 __asm__("a7") = n;
    1f52:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f56:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <umount>:
    register long a7 __asm__("a7") = n;
    1f5e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f64:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f6c:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f6e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f70:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f72:	8532                	mv	a0,a2
	mv a2, a4
    1f74:	863a                	mv	a2,a4
	mv a3, a5
    1f76:	86be                	mv	a3,a5
	mv a4, a6
    1f78:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f7a:	0dc00893          	li	a7,220
	ecall
    1f7e:	00000073          	ecall

	beqz a0, 1f
    1f82:	c111                	beqz	a0,1f86 <__clone+0x1a>
	# Parent
	ret
    1f84:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f86:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f88:	6522                	ld	a0,8(sp)
	jalr a1
    1f8a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f8c:	05d00893          	li	a7,93
	ecall
    1f90:	00000073          	ecall
