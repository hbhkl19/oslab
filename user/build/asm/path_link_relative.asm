
/home/hbh/oslab/oslab/user/build/riscv64/path_link_relative:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a295                	j	1166 <__start_main>

0000000000001004 <test_path_link_relative>:
#include <string.h>
#include <unistd.h>
#include <stdio.h>

void test_path_link_relative(void)
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f9a50513          	add	a0,a0,-102 # 1fa0 <__clone+0x2c>
{
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	3ac000ef          	jal	13be <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	09250513          	add	a0,a0,146 # 20a8 <__func__.0>
    101e:	3a0000ef          	jal	13be <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f9650513          	add	a0,a0,-106 # 1fb8 <__clone+0x44>
    102a:	394000ef          	jal	13be <puts>

    int ret = mkdir("rel_link_dir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f9650513          	add	a0,a0,-106 # 1fc8 <__clone+0x54>
    103a:	6d7000ef          	jal	1f10 <mkdir>
    103e:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", ret);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	f9650513          	add	a0,a0,-106 # 1fd8 <__clone+0x64>
    104a:	396000ef          	jal	13e0 <printf>
    assert(ret == 0 || ret == -1);
    104e:	2405                	addw	s0,s0,1
    1050:	4785                	li	a5,1
    1052:	0087f863          	bgeu	a5,s0,1062 <test_path_link_relative+0x5e>
    1056:	00001517          	auipc	a0,0x1
    105a:	f9250513          	add	a0,a0,-110 # 1fe8 <__clone+0x74>
    105e:	5fc000ef          	jal	165a <panic>

    ret = chdir("rel_link_dir");
    1062:	00001517          	auipc	a0,0x1
    1066:	f6650513          	add	a0,a0,-154 # 1fc8 <__clone+0x54>
    106a:	69b000ef          	jal	1f04 <chdir>
    106e:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    1070:	85aa                	mv	a1,a0
    1072:	00001517          	auipc	a0,0x1
    1076:	f9650513          	add	a0,a0,-106 # 2008 <__clone+0x94>
    107a:	366000ef          	jal	13e0 <printf>
    assert(ret == 0);
    107e:	ec55                	bnez	s0,113a <test_path_link_relative+0x136>

    int fd = open("src", O_CREATE | O_RDWR);
    1080:	04200593          	li	a1,66
    1084:	00001517          	auipc	a0,0x1
    1088:	f9450513          	add	a0,a0,-108 # 2018 <__clone+0xa4>
    108c:	44d000ef          	jal	1cd8 <open>
    1090:	842a                	mv	s0,a0
    printf("open fd: %d\n", fd);
    1092:	85aa                	mv	a1,a0
    1094:	00001517          	auipc	a0,0x1
    1098:	f8c50513          	add	a0,a0,-116 # 2020 <__clone+0xac>
    109c:	344000ef          	jal	13e0 <printf>
    assert(fd > 0);
    10a0:	0a805463          	blez	s0,1148 <test_path_link_relative+0x144>
    close(fd);
    10a4:	8522                	mv	a0,s0
    10a6:	45b000ef          	jal	1d00 <close>

    ret = link("src", "dst");
    10aa:	00001597          	auipc	a1,0x1
    10ae:	f8658593          	add	a1,a1,-122 # 2030 <__clone+0xbc>
    10b2:	00001517          	auipc	a0,0x1
    10b6:	f6650513          	add	a0,a0,-154 # 2018 <__clone+0xa4>
    10ba:	5fb000ef          	jal	1eb4 <link>
    10be:	842a                	mv	s0,a0
    printf("link ret: %d\n", ret);
    10c0:	85aa                	mv	a1,a0
    10c2:	00001517          	auipc	a0,0x1
    10c6:	f7650513          	add	a0,a0,-138 # 2038 <__clone+0xc4>
    10ca:	316000ef          	jal	13e0 <printf>
    assert(ret == 0);
    10ce:	ec39                	bnez	s0,112c <test_path_link_relative+0x128>

    fd = open("dst", O_RDONLY);
    10d0:	4581                	li	a1,0
    10d2:	00001517          	auipc	a0,0x1
    10d6:	f5e50513          	add	a0,a0,-162 # 2030 <__clone+0xbc>
    10da:	3ff000ef          	jal	1cd8 <open>
    10de:	842a                	mv	s0,a0
    if(fd > 0) {
    10e0:	02a05f63          	blez	a0,111e <test_path_link_relative+0x11a>
        printf("relative link success.\n");
    10e4:	00001517          	auipc	a0,0x1
    10e8:	f6450513          	add	a0,a0,-156 # 2048 <__clone+0xd4>
    10ec:	2f4000ef          	jal	13e0 <printf>
        close(fd);
    10f0:	8522                	mv	a0,s0
    10f2:	40f000ef          	jal	1d00 <close>
    } else {
        printf("relative link failed.\n");
    }

    TEST_END(__func__);
    10f6:	00001517          	auipc	a0,0x1
    10fa:	f8250513          	add	a0,a0,-126 # 2078 <__clone+0x104>
    10fe:	2c0000ef          	jal	13be <puts>
    1102:	00001517          	auipc	a0,0x1
    1106:	fa650513          	add	a0,a0,-90 # 20a8 <__func__.0>
    110a:	2b4000ef          	jal	13be <puts>
}
    110e:	6402                	ld	s0,0(sp)
    1110:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1112:	00001517          	auipc	a0,0x1
    1116:	ea650513          	add	a0,a0,-346 # 1fb8 <__clone+0x44>
}
    111a:	0141                	add	sp,sp,16
    TEST_END(__func__);
    111c:	a44d                	j	13be <puts>
        printf("relative link failed.\n");
    111e:	00001517          	auipc	a0,0x1
    1122:	f4250513          	add	a0,a0,-190 # 2060 <__clone+0xec>
    1126:	2ba000ef          	jal	13e0 <printf>
    112a:	b7f1                	j	10f6 <test_path_link_relative+0xf2>
    assert(ret == 0);
    112c:	00001517          	auipc	a0,0x1
    1130:	ebc50513          	add	a0,a0,-324 # 1fe8 <__clone+0x74>
    1134:	526000ef          	jal	165a <panic>
    1138:	bf61                	j	10d0 <test_path_link_relative+0xcc>
    assert(ret == 0);
    113a:	00001517          	auipc	a0,0x1
    113e:	eae50513          	add	a0,a0,-338 # 1fe8 <__clone+0x74>
    1142:	518000ef          	jal	165a <panic>
    1146:	bf2d                	j	1080 <test_path_link_relative+0x7c>
    assert(fd > 0);
    1148:	00001517          	auipc	a0,0x1
    114c:	ea050513          	add	a0,a0,-352 # 1fe8 <__clone+0x74>
    1150:	50a000ef          	jal	165a <panic>
    1154:	bf81                	j	10a4 <test_path_link_relative+0xa0>

0000000000001156 <main>:

int main(void)
{
    1156:	1141                	add	sp,sp,-16
    1158:	e406                	sd	ra,8(sp)
    test_path_link_relative();
    115a:	eabff0ef          	jal	1004 <test_path_link_relative>
    return 0;
}
    115e:	60a2                	ld	ra,8(sp)
    1160:	4501                	li	a0,0
    1162:	0141                	add	sp,sp,16
    1164:	8082                	ret

0000000000001166 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1166:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1168:	4108                	lw	a0,0(a0)
{
    116a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    116c:	05a1                	add	a1,a1,8
{
    116e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1170:	fe7ff0ef          	jal	1156 <main>
    1174:	3fd000ef          	jal	1d70 <exit>
	return 0;
}
    1178:	60a2                	ld	ra,8(sp)
    117a:	4501                	li	a0,0
    117c:	0141                	add	sp,sp,16
    117e:	8082                	ret

0000000000001180 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1180:	7179                	add	sp,sp,-48
    1182:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1184:	12054863          	bltz	a0,12b4 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1188:	02b577bb          	remuw	a5,a0,a1
    118c:	00001697          	auipc	a3,0x1
    1190:	f3468693          	add	a3,a3,-204 # 20c0 <digits>
    buf[16] = 0;
    1194:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1198:	0005871b          	sext.w	a4,a1
    119c:	1782                	sll	a5,a5,0x20
    119e:	9381                	srl	a5,a5,0x20
    11a0:	97b6                	add	a5,a5,a3
    11a2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11a6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11aa:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11ae:	1ab56663          	bltu	a0,a1,135a <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    11b2:	02e8763b          	remuw	a2,a6,a4
    11b6:	1602                	sll	a2,a2,0x20
    11b8:	9201                	srl	a2,a2,0x20
    11ba:	9636                	add	a2,a2,a3
    11bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11c8:	12e86c63          	bltu	a6,a4,1300 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11cc:	02e5f63b          	remuw	a2,a1,a4
    11d0:	1602                	sll	a2,a2,0x20
    11d2:	9201                	srl	a2,a2,0x20
    11d4:	9636                	add	a2,a2,a3
    11d6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11da:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11de:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11e2:	12e5e863          	bltu	a1,a4,1312 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11e6:	02e8763b          	remuw	a2,a6,a4
    11ea:	1602                	sll	a2,a2,0x20
    11ec:	9201                	srl	a2,a2,0x20
    11ee:	9636                	add	a2,a2,a3
    11f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11f8:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11fc:	12e86463          	bltu	a6,a4,1324 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1200:	02e5f63b          	remuw	a2,a1,a4
    1204:	1602                	sll	a2,a2,0x20
    1206:	9201                	srl	a2,a2,0x20
    1208:	9636                	add	a2,a2,a3
    120a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    120e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1212:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1216:	12e5e063          	bltu	a1,a4,1336 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    121a:	02e8763b          	remuw	a2,a6,a4
    121e:	1602                	sll	a2,a2,0x20
    1220:	9201                	srl	a2,a2,0x20
    1222:	9636                	add	a2,a2,a3
    1224:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1228:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    122c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1230:	0ae86f63          	bltu	a6,a4,12ee <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1234:	02e5f63b          	remuw	a2,a1,a4
    1238:	1602                	sll	a2,a2,0x20
    123a:	9201                	srl	a2,a2,0x20
    123c:	9636                	add	a2,a2,a3
    123e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1242:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1246:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    124a:	0ee5ef63          	bltu	a1,a4,1348 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    124e:	02e8763b          	remuw	a2,a6,a4
    1252:	1602                	sll	a2,a2,0x20
    1254:	9201                	srl	a2,a2,0x20
    1256:	9636                	add	a2,a2,a3
    1258:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    125c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1260:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1264:	0ee86d63          	bltu	a6,a4,135e <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1268:	02e5f63b          	remuw	a2,a1,a4
    126c:	1602                	sll	a2,a2,0x20
    126e:	9201                	srl	a2,a2,0x20
    1270:	9636                	add	a2,a2,a3
    1272:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1276:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    127a:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    127e:	0ee5e963          	bltu	a1,a4,1370 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1282:	1782                	sll	a5,a5,0x20
    1284:	9381                	srl	a5,a5,0x20
    1286:	96be                	add	a3,a3,a5
    1288:	0006c783          	lbu	a5,0(a3)
    128c:	4599                	li	a1,6
    128e:	00f10723          	sb	a5,14(sp)

    if (sign)
    1292:	00055763          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    129e:	4595                	li	a1,5
    write(f, s, l);
    12a0:	003c                	add	a5,sp,8
    12a2:	4641                	li	a2,16
    12a4:	9e0d                	subw	a2,a2,a1
    12a6:	4505                	li	a0,1
    12a8:	95be                	add	a1,a1,a5
    12aa:	26d000ef          	jal	1d16 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12ae:	70a2                	ld	ra,40(sp)
    12b0:	6145                	add	sp,sp,48
    12b2:	8082                	ret
        x = -xx;
    12b4:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    12b8:	02b677bb          	remuw	a5,a2,a1
    12bc:	00001697          	auipc	a3,0x1
    12c0:	e0468693          	add	a3,a3,-508 # 20c0 <digits>
    buf[16] = 0;
    12c4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12c8:	0005871b          	sext.w	a4,a1
    12cc:	1782                	sll	a5,a5,0x20
    12ce:	9381                	srl	a5,a5,0x20
    12d0:	97b6                	add	a5,a5,a3
    12d2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12d6:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12da:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12de:	ecb67ae3          	bgeu	a2,a1,11b2 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12ea:	45b9                	li	a1,14
    12ec:	bf55                	j	12a0 <printint.constprop.0+0x120>
    12ee:	45a9                	li	a1,10
    if (sign)
    12f0:	fa0558e3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f4:	02d00793          	li	a5,45
    12f8:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12fc:	45a5                	li	a1,9
    12fe:	b74d                	j	12a0 <printint.constprop.0+0x120>
    1300:	45b9                	li	a1,14
    if (sign)
    1302:	f8055fe3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    130e:	45b5                	li	a1,13
    1310:	bf41                	j	12a0 <printint.constprop.0+0x120>
    1312:	45b5                	li	a1,13
    if (sign)
    1314:	f80556e3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1320:	45b1                	li	a1,12
    1322:	bfbd                	j	12a0 <printint.constprop.0+0x120>
    1324:	45b1                	li	a1,12
    if (sign)
    1326:	f6055de3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    132a:	02d00793          	li	a5,45
    132e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1332:	45ad                	li	a1,11
    1334:	b7b5                	j	12a0 <printint.constprop.0+0x120>
    1336:	45ad                	li	a1,11
    if (sign)
    1338:	f60554e3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    133c:	02d00793          	li	a5,45
    1340:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1344:	45a9                	li	a1,10
    1346:	bfa9                	j	12a0 <printint.constprop.0+0x120>
    1348:	45a5                	li	a1,9
    if (sign)
    134a:	f4055be3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    134e:	02d00793          	li	a5,45
    1352:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1356:	45a1                	li	a1,8
    1358:	b7a1                	j	12a0 <printint.constprop.0+0x120>
    i = 15;
    135a:	45bd                	li	a1,15
    135c:	b791                	j	12a0 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    135e:	45a1                	li	a1,8
    if (sign)
    1360:	f40550e3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1364:	02d00793          	li	a5,45
    1368:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    136c:	459d                	li	a1,7
    136e:	bf0d                	j	12a0 <printint.constprop.0+0x120>
    1370:	459d                	li	a1,7
    if (sign)
    1372:	f20557e3          	bgez	a0,12a0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1376:	02d00793          	li	a5,45
    137a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    137e:	4599                	li	a1,6
    1380:	b705                	j	12a0 <printint.constprop.0+0x120>

0000000000001382 <getchar>:
{
    1382:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1384:	00f10593          	add	a1,sp,15
    1388:	4605                	li	a2,1
    138a:	4501                	li	a0,0
{
    138c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    138e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1392:	17b000ef          	jal	1d0c <read>
}
    1396:	60e2                	ld	ra,24(sp)
    1398:	00f14503          	lbu	a0,15(sp)
    139c:	6105                	add	sp,sp,32
    139e:	8082                	ret

00000000000013a0 <putchar>:
{
    13a0:	1101                	add	sp,sp,-32
    13a2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13a4:	00f10593          	add	a1,sp,15
    13a8:	4605                	li	a2,1
    13aa:	4505                	li	a0,1
{
    13ac:	ec06                	sd	ra,24(sp)
    char byte = c;
    13ae:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13b2:	165000ef          	jal	1d16 <write>
}
    13b6:	60e2                	ld	ra,24(sp)
    13b8:	2501                	sext.w	a0,a0
    13ba:	6105                	add	sp,sp,32
    13bc:	8082                	ret

00000000000013be <puts>:
{
    13be:	1141                	add	sp,sp,-16
    13c0:	e406                	sd	ra,8(sp)
    13c2:	e022                	sd	s0,0(sp)
    13c4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13c6:	574000ef          	jal	193a <strlen>
    13ca:	862a                	mv	a2,a0
    13cc:	85a2                	mv	a1,s0
    13ce:	4505                	li	a0,1
    13d0:	147000ef          	jal	1d16 <write>
}
    13d4:	60a2                	ld	ra,8(sp)
    13d6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13d8:	957d                	sra	a0,a0,0x3f
    return r;
    13da:	2501                	sext.w	a0,a0
}
    13dc:	0141                	add	sp,sp,16
    13de:	8082                	ret

00000000000013e0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13e0:	7171                	add	sp,sp,-176
    13e2:	f85a                	sd	s6,48(sp)
    13e4:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13e6:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13e8:	18bc                	add	a5,sp,120
{
    13ea:	e8ca                	sd	s2,80(sp)
    13ec:	e4ce                	sd	s3,72(sp)
    13ee:	e0d2                	sd	s4,64(sp)
    13f0:	fc56                	sd	s5,56(sp)
    13f2:	f486                	sd	ra,104(sp)
    13f4:	f0a2                	sd	s0,96(sp)
    13f6:	eca6                	sd	s1,88(sp)
    13f8:	fcae                	sd	a1,120(sp)
    13fa:	e132                	sd	a2,128(sp)
    13fc:	e536                	sd	a3,136(sp)
    13fe:	e93a                	sd	a4,144(sp)
    1400:	f142                	sd	a6,160(sp)
    1402:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1404:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1406:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    140a:	07300a13          	li	s4,115
    140e:	07800a93          	li	s5,120
    buf[i++] = '0';
    1412:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1416:	00001997          	auipc	s3,0x1
    141a:	caa98993          	add	s3,s3,-854 # 20c0 <digits>
        if (!*s)
    141e:	00054783          	lbu	a5,0(a0)
    1422:	16078a63          	beqz	a5,1596 <printf+0x1b6>
    1426:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1428:	19278d63          	beq	a5,s2,15c2 <printf+0x1e2>
    142c:	00164783          	lbu	a5,1(a2)
    1430:	0605                	add	a2,a2,1
    1432:	fbfd                	bnez	a5,1428 <printf+0x48>
    1434:	84b2                	mv	s1,a2
        l = z - a;
    1436:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    143a:	85aa                	mv	a1,a0
    143c:	8622                	mv	a2,s0
    143e:	4505                	li	a0,1
    1440:	0d7000ef          	jal	1d16 <write>
        if (l)
    1444:	1a041463          	bnez	s0,15ec <printf+0x20c>
        if (s[1] == 0)
    1448:	0014c783          	lbu	a5,1(s1)
    144c:	14078563          	beqz	a5,1596 <printf+0x1b6>
        switch (s[1])
    1450:	1b478063          	beq	a5,s4,15f0 <printf+0x210>
    1454:	14fa6b63          	bltu	s4,a5,15aa <printf+0x1ca>
    1458:	06400713          	li	a4,100
    145c:	1ee78063          	beq	a5,a4,163c <printf+0x25c>
    1460:	07000713          	li	a4,112
    1464:	1ae79963          	bne	a5,a4,1616 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1468:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    146a:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    146e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1470:	631c                	ld	a5,0(a4)
    1472:	0721                	add	a4,a4,8
    1474:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1476:	00479293          	sll	t0,a5,0x4
    147a:	00879f93          	sll	t6,a5,0x8
    147e:	00c79f13          	sll	t5,a5,0xc
    1482:	01079e93          	sll	t4,a5,0x10
    1486:	01479e13          	sll	t3,a5,0x14
    148a:	01879313          	sll	t1,a5,0x18
    148e:	01c79893          	sll	a7,a5,0x1c
    1492:	02479813          	sll	a6,a5,0x24
    1496:	02879513          	sll	a0,a5,0x28
    149a:	02c79593          	sll	a1,a5,0x2c
    149e:	03079693          	sll	a3,a5,0x30
    14a2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a6:	03c7d413          	srl	s0,a5,0x3c
    14aa:	01c7d39b          	srlw	t2,a5,0x1c
    14ae:	03c2d293          	srl	t0,t0,0x3c
    14b2:	03cfdf93          	srl	t6,t6,0x3c
    14b6:	03cf5f13          	srl	t5,t5,0x3c
    14ba:	03cede93          	srl	t4,t4,0x3c
    14be:	03ce5e13          	srl	t3,t3,0x3c
    14c2:	03c35313          	srl	t1,t1,0x3c
    14c6:	03c8d893          	srl	a7,a7,0x3c
    14ca:	03c85813          	srl	a6,a6,0x3c
    14ce:	9171                	srl	a0,a0,0x3c
    14d0:	91f1                	srl	a1,a1,0x3c
    14d2:	92f1                	srl	a3,a3,0x3c
    14d4:	9371                	srl	a4,a4,0x3c
    14d6:	96ce                	add	a3,a3,s3
    14d8:	974e                	add	a4,a4,s3
    14da:	944e                	add	s0,s0,s3
    14dc:	92ce                	add	t0,t0,s3
    14de:	9fce                	add	t6,t6,s3
    14e0:	9f4e                	add	t5,t5,s3
    14e2:	9ece                	add	t4,t4,s3
    14e4:	9e4e                	add	t3,t3,s3
    14e6:	934e                	add	t1,t1,s3
    14e8:	98ce                	add	a7,a7,s3
    14ea:	93ce                	add	t2,t2,s3
    14ec:	984e                	add	a6,a6,s3
    14ee:	954e                	add	a0,a0,s3
    14f0:	95ce                	add	a1,a1,s3
    14f2:	0006c083          	lbu	ra,0(a3)
    14f6:	0002c283          	lbu	t0,0(t0)
    14fa:	00074683          	lbu	a3,0(a4)
    14fe:	000fcf83          	lbu	t6,0(t6)
    1502:	000f4f03          	lbu	t5,0(t5)
    1506:	000ece83          	lbu	t4,0(t4)
    150a:	000e4e03          	lbu	t3,0(t3)
    150e:	00034303          	lbu	t1,0(t1)
    1512:	0008c883          	lbu	a7,0(a7)
    1516:	0003c383          	lbu	t2,0(t2)
    151a:	00084803          	lbu	a6,0(a6)
    151e:	00054503          	lbu	a0,0(a0)
    1522:	0005c583          	lbu	a1,0(a1)
    1526:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    152a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    152e:	9371                	srl	a4,a4,0x3c
    1530:	8bbd                	and	a5,a5,15
    1532:	974e                	add	a4,a4,s3
    1534:	97ce                	add	a5,a5,s3
    1536:	005105a3          	sb	t0,11(sp)
    153a:	01f10623          	sb	t6,12(sp)
    153e:	01e106a3          	sb	t5,13(sp)
    1542:	01d10723          	sb	t4,14(sp)
    1546:	01c107a3          	sb	t3,15(sp)
    154a:	00610823          	sb	t1,16(sp)
    154e:	011108a3          	sb	a7,17(sp)
    1552:	00710923          	sb	t2,18(sp)
    1556:	010109a3          	sb	a6,19(sp)
    155a:	00a10a23          	sb	a0,20(sp)
    155e:	00b10aa3          	sb	a1,21(sp)
    1562:	00110b23          	sb	ra,22(sp)
    1566:	00d10ba3          	sb	a3,23(sp)
    156a:	00810523          	sb	s0,10(sp)
    156e:	00074703          	lbu	a4,0(a4)
    1572:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1576:	002c                	add	a1,sp,8
    1578:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    157a:	00e10c23          	sb	a4,24(sp)
    157e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1582:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1586:	790000ef          	jal	1d16 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    158a:	00248513          	add	a0,s1,2
        if (!*s)
    158e:	00054783          	lbu	a5,0(a0)
    1592:	e8079ae3          	bnez	a5,1426 <printf+0x46>
    }
    va_end(ap);
}
    1596:	70a6                	ld	ra,104(sp)
    1598:	7406                	ld	s0,96(sp)
    159a:	64e6                	ld	s1,88(sp)
    159c:	6946                	ld	s2,80(sp)
    159e:	69a6                	ld	s3,72(sp)
    15a0:	6a06                	ld	s4,64(sp)
    15a2:	7ae2                	ld	s5,56(sp)
    15a4:	7b42                	ld	s6,48(sp)
    15a6:	614d                	add	sp,sp,176
    15a8:	8082                	ret
        switch (s[1])
    15aa:	07579663          	bne	a5,s5,1616 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    15ae:	6782                	ld	a5,0(sp)
    15b0:	45c1                	li	a1,16
    15b2:	4388                	lw	a0,0(a5)
    15b4:	07a1                	add	a5,a5,8
    15b6:	e03e                	sd	a5,0(sp)
    15b8:	bc9ff0ef          	jal	1180 <printint.constprop.0>
        s += 2;
    15bc:	00248513          	add	a0,s1,2
    15c0:	b7f9                	j	158e <printf+0x1ae>
    15c2:	84b2                	mv	s1,a2
    15c4:	a039                	j	15d2 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15c6:	0024c783          	lbu	a5,2(s1)
    15ca:	0605                	add	a2,a2,1
    15cc:	0489                	add	s1,s1,2
    15ce:	e72794e3          	bne	a5,s2,1436 <printf+0x56>
    15d2:	0014c783          	lbu	a5,1(s1)
    15d6:	ff2788e3          	beq	a5,s2,15c6 <printf+0x1e6>
        l = z - a;
    15da:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15de:	85aa                	mv	a1,a0
    15e0:	8622                	mv	a2,s0
    15e2:	4505                	li	a0,1
    15e4:	732000ef          	jal	1d16 <write>
        if (l)
    15e8:	e60400e3          	beqz	s0,1448 <printf+0x68>
    15ec:	8526                	mv	a0,s1
    15ee:	bd05                	j	141e <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15f0:	6782                	ld	a5,0(sp)
    15f2:	6380                	ld	s0,0(a5)
    15f4:	07a1                	add	a5,a5,8
    15f6:	e03e                	sd	a5,0(sp)
    15f8:	cc21                	beqz	s0,1650 <printf+0x270>
            l = strnlen(a, 200);
    15fa:	0c800593          	li	a1,200
    15fe:	8522                	mv	a0,s0
    1600:	424000ef          	jal	1a24 <strnlen>
    write(f, s, l);
    1604:	0005061b          	sext.w	a2,a0
    1608:	85a2                	mv	a1,s0
    160a:	4505                	li	a0,1
    160c:	70a000ef          	jal	1d16 <write>
        s += 2;
    1610:	00248513          	add	a0,s1,2
    1614:	bfad                	j	158e <printf+0x1ae>
    return write(stdout, &byte, 1);
    1616:	4605                	li	a2,1
    1618:	002c                	add	a1,sp,8
    161a:	4505                	li	a0,1
    char byte = c;
    161c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1620:	6f6000ef          	jal	1d16 <write>
    char byte = c;
    1624:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1628:	4605                	li	a2,1
    162a:	002c                	add	a1,sp,8
    162c:	4505                	li	a0,1
    char byte = c;
    162e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1632:	6e4000ef          	jal	1d16 <write>
        s += 2;
    1636:	00248513          	add	a0,s1,2
    163a:	bf91                	j	158e <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    163c:	6782                	ld	a5,0(sp)
    163e:	45a9                	li	a1,10
    1640:	4388                	lw	a0,0(a5)
    1642:	07a1                	add	a5,a5,8
    1644:	e03e                	sd	a5,0(sp)
    1646:	b3bff0ef          	jal	1180 <printint.constprop.0>
        s += 2;
    164a:	00248513          	add	a0,s1,2
    164e:	b781                	j	158e <printf+0x1ae>
                a = "(null)";
    1650:	00001417          	auipc	s0,0x1
    1654:	a3840413          	add	s0,s0,-1480 # 2088 <__clone+0x114>
    1658:	b74d                	j	15fa <printf+0x21a>

000000000000165a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    165a:	1141                	add	sp,sp,-16
    165c:	e406                	sd	ra,8(sp)
    puts(m);
    165e:	d61ff0ef          	jal	13be <puts>
    exit(-100);
}
    1662:	60a2                	ld	ra,8(sp)
    exit(-100);
    1664:	f9c00513          	li	a0,-100
}
    1668:	0141                	add	sp,sp,16
    exit(-100);
    166a:	a719                	j	1d70 <exit>

000000000000166c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    166c:	02000793          	li	a5,32
    1670:	00f50663          	beq	a0,a5,167c <isspace+0x10>
    1674:	355d                	addw	a0,a0,-9
    1676:	00553513          	sltiu	a0,a0,5
    167a:	8082                	ret
    167c:	4505                	li	a0,1
}
    167e:	8082                	ret

0000000000001680 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1680:	fd05051b          	addw	a0,a0,-48
}
    1684:	00a53513          	sltiu	a0,a0,10
    1688:	8082                	ret

000000000000168a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    168a:	02000693          	li	a3,32
    168e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1690:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1694:	ff77871b          	addw	a4,a5,-9
    1698:	04d78c63          	beq	a5,a3,16f0 <atoi+0x66>
    169c:	0007861b          	sext.w	a2,a5
    16a0:	04e5f863          	bgeu	a1,a4,16f0 <atoi+0x66>
        s++;
    switch (*s)
    16a4:	02b00713          	li	a4,43
    16a8:	04e78963          	beq	a5,a4,16fa <atoi+0x70>
    16ac:	02d00713          	li	a4,45
    16b0:	06e78263          	beq	a5,a4,1714 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16b4:	fd06069b          	addw	a3,a2,-48
    16b8:	47a5                	li	a5,9
    16ba:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16bc:	4301                	li	t1,0
    while (isdigit(*s))
    16be:	04d7e963          	bltu	a5,a3,1710 <atoi+0x86>
    int n = 0, neg = 0;
    16c2:	4501                	li	a0,0
    while (isdigit(*s))
    16c4:	48a5                	li	a7,9
    16c6:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16ca:	0025179b          	sllw	a5,a0,0x2
    16ce:	9fa9                	addw	a5,a5,a0
    16d0:	fd06059b          	addw	a1,a2,-48
    16d4:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16d8:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16dc:	0705                	add	a4,a4,1
    16de:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16e2:	0006861b          	sext.w	a2,a3
    16e6:	ff08f0e3          	bgeu	a7,a6,16c6 <atoi+0x3c>
    return neg ? n : -n;
    16ea:	00030563          	beqz	t1,16f4 <atoi+0x6a>
}
    16ee:	8082                	ret
        s++;
    16f0:	0505                	add	a0,a0,1
    16f2:	bf79                	j	1690 <atoi+0x6>
    return neg ? n : -n;
    16f4:	40f5853b          	subw	a0,a1,a5
    16f8:	8082                	ret
    while (isdigit(*s))
    16fa:	00154603          	lbu	a2,1(a0)
    16fe:	47a5                	li	a5,9
        s++;
    1700:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1704:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1708:	4301                	li	t1,0
    while (isdigit(*s))
    170a:	2601                	sext.w	a2,a2
    170c:	fad7fbe3          	bgeu	a5,a3,16c2 <atoi+0x38>
    1710:	4501                	li	a0,0
}
    1712:	8082                	ret
    while (isdigit(*s))
    1714:	00154603          	lbu	a2,1(a0)
    1718:	47a5                	li	a5,9
        s++;
    171a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    171e:	fd06069b          	addw	a3,a2,-48
    1722:	2601                	sext.w	a2,a2
    1724:	fed7e6e3          	bltu	a5,a3,1710 <atoi+0x86>
        neg = 1;
    1728:	4305                	li	t1,1
    172a:	bf61                	j	16c2 <atoi+0x38>

000000000000172c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    172c:	18060163          	beqz	a2,18ae <memset+0x182>
    1730:	40a006b3          	neg	a3,a0
    1734:	0076f793          	and	a5,a3,7
    1738:	00778813          	add	a6,a5,7
    173c:	48ad                	li	a7,11
    173e:	0ff5f713          	zext.b	a4,a1
    1742:	fff60593          	add	a1,a2,-1
    1746:	17186563          	bltu	a6,a7,18b0 <memset+0x184>
    174a:	1705ed63          	bltu	a1,a6,18c4 <memset+0x198>
    174e:	16078363          	beqz	a5,18b4 <memset+0x188>
    1752:	00e50023          	sb	a4,0(a0)
    1756:	0066f593          	and	a1,a3,6
    175a:	16058063          	beqz	a1,18ba <memset+0x18e>
    175e:	00e500a3          	sb	a4,1(a0)
    1762:	4589                	li	a1,2
    1764:	16f5f363          	bgeu	a1,a5,18ca <memset+0x19e>
    1768:	00e50123          	sb	a4,2(a0)
    176c:	8a91                	and	a3,a3,4
    176e:	00350593          	add	a1,a0,3
    1772:	4e0d                	li	t3,3
    1774:	ce9d                	beqz	a3,17b2 <memset+0x86>
    1776:	00e501a3          	sb	a4,3(a0)
    177a:	4691                	li	a3,4
    177c:	00450593          	add	a1,a0,4
    1780:	4e11                	li	t3,4
    1782:	02f6f863          	bgeu	a3,a5,17b2 <memset+0x86>
    1786:	00e50223          	sb	a4,4(a0)
    178a:	4695                	li	a3,5
    178c:	00550593          	add	a1,a0,5
    1790:	4e15                	li	t3,5
    1792:	02d78063          	beq	a5,a3,17b2 <memset+0x86>
    1796:	fff50693          	add	a3,a0,-1
    179a:	00e502a3          	sb	a4,5(a0)
    179e:	8a9d                	and	a3,a3,7
    17a0:	00650593          	add	a1,a0,6
    17a4:	4e19                	li	t3,6
    17a6:	e691                	bnez	a3,17b2 <memset+0x86>
    17a8:	00750593          	add	a1,a0,7
    17ac:	00e50323          	sb	a4,6(a0)
    17b0:	4e1d                	li	t3,7
    17b2:	00871693          	sll	a3,a4,0x8
    17b6:	01071813          	sll	a6,a4,0x10
    17ba:	8ed9                	or	a3,a3,a4
    17bc:	01871893          	sll	a7,a4,0x18
    17c0:	0106e6b3          	or	a3,a3,a6
    17c4:	0116e6b3          	or	a3,a3,a7
    17c8:	02071813          	sll	a6,a4,0x20
    17cc:	02871313          	sll	t1,a4,0x28
    17d0:	0106e6b3          	or	a3,a3,a6
    17d4:	40f608b3          	sub	a7,a2,a5
    17d8:	03071813          	sll	a6,a4,0x30
    17dc:	0066e6b3          	or	a3,a3,t1
    17e0:	0106e6b3          	or	a3,a3,a6
    17e4:	03871313          	sll	t1,a4,0x38
    17e8:	97aa                	add	a5,a5,a0
    17ea:	ff88f813          	and	a6,a7,-8
    17ee:	0066e6b3          	or	a3,a3,t1
    17f2:	983e                	add	a6,a6,a5
    17f4:	e394                	sd	a3,0(a5)
    17f6:	07a1                	add	a5,a5,8
    17f8:	ff079ee3          	bne	a5,a6,17f4 <memset+0xc8>
    17fc:	ff88f793          	and	a5,a7,-8
    1800:	0078f893          	and	a7,a7,7
    1804:	00f586b3          	add	a3,a1,a5
    1808:	01c787bb          	addw	a5,a5,t3
    180c:	0a088b63          	beqz	a7,18c2 <memset+0x196>
    1810:	00e68023          	sb	a4,0(a3)
    1814:	0017859b          	addw	a1,a5,1
    1818:	08c5fb63          	bgeu	a1,a2,18ae <memset+0x182>
    181c:	00e680a3          	sb	a4,1(a3)
    1820:	0027859b          	addw	a1,a5,2
    1824:	08c5f563          	bgeu	a1,a2,18ae <memset+0x182>
    1828:	00e68123          	sb	a4,2(a3)
    182c:	0037859b          	addw	a1,a5,3
    1830:	06c5ff63          	bgeu	a1,a2,18ae <memset+0x182>
    1834:	00e681a3          	sb	a4,3(a3)
    1838:	0047859b          	addw	a1,a5,4
    183c:	06c5f963          	bgeu	a1,a2,18ae <memset+0x182>
    1840:	00e68223          	sb	a4,4(a3)
    1844:	0057859b          	addw	a1,a5,5
    1848:	06c5f363          	bgeu	a1,a2,18ae <memset+0x182>
    184c:	00e682a3          	sb	a4,5(a3)
    1850:	0067859b          	addw	a1,a5,6
    1854:	04c5fd63          	bgeu	a1,a2,18ae <memset+0x182>
    1858:	00e68323          	sb	a4,6(a3)
    185c:	0077859b          	addw	a1,a5,7
    1860:	04c5f763          	bgeu	a1,a2,18ae <memset+0x182>
    1864:	00e683a3          	sb	a4,7(a3)
    1868:	0087859b          	addw	a1,a5,8
    186c:	04c5f163          	bgeu	a1,a2,18ae <memset+0x182>
    1870:	00e68423          	sb	a4,8(a3)
    1874:	0097859b          	addw	a1,a5,9
    1878:	02c5fb63          	bgeu	a1,a2,18ae <memset+0x182>
    187c:	00e684a3          	sb	a4,9(a3)
    1880:	00a7859b          	addw	a1,a5,10
    1884:	02c5f563          	bgeu	a1,a2,18ae <memset+0x182>
    1888:	00e68523          	sb	a4,10(a3)
    188c:	00b7859b          	addw	a1,a5,11
    1890:	00c5ff63          	bgeu	a1,a2,18ae <memset+0x182>
    1894:	00e685a3          	sb	a4,11(a3)
    1898:	00c7859b          	addw	a1,a5,12
    189c:	00c5f963          	bgeu	a1,a2,18ae <memset+0x182>
    18a0:	00e68623          	sb	a4,12(a3)
    18a4:	27b5                	addw	a5,a5,13
    18a6:	00c7f463          	bgeu	a5,a2,18ae <memset+0x182>
    18aa:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18ae:	8082                	ret
    18b0:	482d                	li	a6,11
    18b2:	bd61                	j	174a <memset+0x1e>
    char *p = dest;
    18b4:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18b6:	4e01                	li	t3,0
    18b8:	bded                	j	17b2 <memset+0x86>
    18ba:	00150593          	add	a1,a0,1
    18be:	4e05                	li	t3,1
    18c0:	bdcd                	j	17b2 <memset+0x86>
    18c2:	8082                	ret
    char *p = dest;
    18c4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18c6:	4781                	li	a5,0
    18c8:	b7a1                	j	1810 <memset+0xe4>
    18ca:	00250593          	add	a1,a0,2
    18ce:	4e09                	li	t3,2
    18d0:	b5cd                	j	17b2 <memset+0x86>

00000000000018d2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18d2:	00054783          	lbu	a5,0(a0)
    18d6:	0005c703          	lbu	a4,0(a1)
    18da:	00e79863          	bne	a5,a4,18ea <strcmp+0x18>
    18de:	0505                	add	a0,a0,1
    18e0:	0585                	add	a1,a1,1
    18e2:	fbe5                	bnez	a5,18d2 <strcmp>
    18e4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18e6:	9d19                	subw	a0,a0,a4
    18e8:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18ea:	0007851b          	sext.w	a0,a5
    18ee:	bfe5                	j	18e6 <strcmp+0x14>

00000000000018f0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18f0:	ca15                	beqz	a2,1924 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18f2:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18f6:	167d                	add	a2,a2,-1
    18f8:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18fc:	eb99                	bnez	a5,1912 <strncmp+0x22>
    18fe:	a815                	j	1932 <strncmp+0x42>
    1900:	00a68e63          	beq	a3,a0,191c <strncmp+0x2c>
    1904:	0505                	add	a0,a0,1
    1906:	00f71b63          	bne	a4,a5,191c <strncmp+0x2c>
    190a:	00054783          	lbu	a5,0(a0)
    190e:	cf89                	beqz	a5,1928 <strncmp+0x38>
    1910:	85b2                	mv	a1,a2
    1912:	0005c703          	lbu	a4,0(a1)
    1916:	00158613          	add	a2,a1,1
    191a:	f37d                	bnez	a4,1900 <strncmp+0x10>
        ;
    return *l - *r;
    191c:	0007851b          	sext.w	a0,a5
    1920:	9d19                	subw	a0,a0,a4
    1922:	8082                	ret
        return 0;
    1924:	4501                	li	a0,0
}
    1926:	8082                	ret
    return *l - *r;
    1928:	0015c703          	lbu	a4,1(a1)
    192c:	4501                	li	a0,0
    192e:	9d19                	subw	a0,a0,a4
    1930:	8082                	ret
    1932:	0005c703          	lbu	a4,0(a1)
    1936:	4501                	li	a0,0
    1938:	b7e5                	j	1920 <strncmp+0x30>

000000000000193a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    193a:	00757793          	and	a5,a0,7
    193e:	cf89                	beqz	a5,1958 <strlen+0x1e>
    1940:	87aa                	mv	a5,a0
    1942:	a029                	j	194c <strlen+0x12>
    1944:	0785                	add	a5,a5,1
    1946:	0077f713          	and	a4,a5,7
    194a:	cb01                	beqz	a4,195a <strlen+0x20>
        if (!*s)
    194c:	0007c703          	lbu	a4,0(a5)
    1950:	fb75                	bnez	a4,1944 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1952:	40a78533          	sub	a0,a5,a0
}
    1956:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1958:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    195a:	6394                	ld	a3,0(a5)
    195c:	00000597          	auipc	a1,0x0
    1960:	7345b583          	ld	a1,1844(a1) # 2090 <__clone+0x11c>
    1964:	00000617          	auipc	a2,0x0
    1968:	73463603          	ld	a2,1844(a2) # 2098 <__clone+0x124>
    196c:	a019                	j	1972 <strlen+0x38>
    196e:	6794                	ld	a3,8(a5)
    1970:	07a1                	add	a5,a5,8
    1972:	00b68733          	add	a4,a3,a1
    1976:	fff6c693          	not	a3,a3
    197a:	8f75                	and	a4,a4,a3
    197c:	8f71                	and	a4,a4,a2
    197e:	db65                	beqz	a4,196e <strlen+0x34>
    for (; *s; s++)
    1980:	0007c703          	lbu	a4,0(a5)
    1984:	d779                	beqz	a4,1952 <strlen+0x18>
    1986:	0017c703          	lbu	a4,1(a5)
    198a:	0785                	add	a5,a5,1
    198c:	d379                	beqz	a4,1952 <strlen+0x18>
    198e:	0017c703          	lbu	a4,1(a5)
    1992:	0785                	add	a5,a5,1
    1994:	fb6d                	bnez	a4,1986 <strlen+0x4c>
    1996:	bf75                	j	1952 <strlen+0x18>

0000000000001998 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1998:	00757713          	and	a4,a0,7
{
    199c:	87aa                	mv	a5,a0
    199e:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a2:	cb19                	beqz	a4,19b8 <memchr+0x20>
    19a4:	ce25                	beqz	a2,1a1c <memchr+0x84>
    19a6:	0007c703          	lbu	a4,0(a5)
    19aa:	00b70763          	beq	a4,a1,19b8 <memchr+0x20>
    19ae:	0785                	add	a5,a5,1
    19b0:	0077f713          	and	a4,a5,7
    19b4:	167d                	add	a2,a2,-1
    19b6:	f77d                	bnez	a4,19a4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19b8:	4501                	li	a0,0
    if (n && *s != c)
    19ba:	c235                	beqz	a2,1a1e <memchr+0x86>
    19bc:	0007c703          	lbu	a4,0(a5)
    19c0:	06b70063          	beq	a4,a1,1a20 <memchr+0x88>
        size_t k = ONES * c;
    19c4:	00000517          	auipc	a0,0x0
    19c8:	6dc53503          	ld	a0,1756(a0) # 20a0 <__clone+0x12c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19cc:	471d                	li	a4,7
        size_t k = ONES * c;
    19ce:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d2:	04c77763          	bgeu	a4,a2,1a20 <memchr+0x88>
    19d6:	00000897          	auipc	a7,0x0
    19da:	6ba8b883          	ld	a7,1722(a7) # 2090 <__clone+0x11c>
    19de:	00000817          	auipc	a6,0x0
    19e2:	6ba83803          	ld	a6,1722(a6) # 2098 <__clone+0x124>
    19e6:	431d                	li	t1,7
    19e8:	a029                	j	19f2 <memchr+0x5a>
    19ea:	1661                	add	a2,a2,-8
    19ec:	07a1                	add	a5,a5,8
    19ee:	00c37c63          	bgeu	t1,a2,1a06 <memchr+0x6e>
    19f2:	6398                	ld	a4,0(a5)
    19f4:	8f29                	xor	a4,a4,a0
    19f6:	011706b3          	add	a3,a4,a7
    19fa:	fff74713          	not	a4,a4
    19fe:	8f75                	and	a4,a4,a3
    1a00:	01077733          	and	a4,a4,a6
    1a04:	d37d                	beqz	a4,19ea <memchr+0x52>
    1a06:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1a08:	e601                	bnez	a2,1a10 <memchr+0x78>
    1a0a:	a809                	j	1a1c <memchr+0x84>
    1a0c:	0505                	add	a0,a0,1
    1a0e:	c619                	beqz	a2,1a1c <memchr+0x84>
    1a10:	00054783          	lbu	a5,0(a0)
    1a14:	167d                	add	a2,a2,-1
    1a16:	feb79be3          	bne	a5,a1,1a0c <memchr+0x74>
    1a1a:	8082                	ret
    return n ? (void *)s : 0;
    1a1c:	4501                	li	a0,0
}
    1a1e:	8082                	ret
    if (n && *s != c)
    1a20:	853e                	mv	a0,a5
    1a22:	b7fd                	j	1a10 <memchr+0x78>

0000000000001a24 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a24:	1101                	add	sp,sp,-32
    1a26:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a28:	862e                	mv	a2,a1
{
    1a2a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a2c:	4581                	li	a1,0
{
    1a2e:	e426                	sd	s1,8(sp)
    1a30:	ec06                	sd	ra,24(sp)
    1a32:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a34:	f65ff0ef          	jal	1998 <memchr>
    return p ? p - s : n;
    1a38:	c519                	beqz	a0,1a46 <strnlen+0x22>
}
    1a3a:	60e2                	ld	ra,24(sp)
    1a3c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a3e:	8d05                	sub	a0,a0,s1
}
    1a40:	64a2                	ld	s1,8(sp)
    1a42:	6105                	add	sp,sp,32
    1a44:	8082                	ret
    1a46:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a48:	8522                	mv	a0,s0
}
    1a4a:	6442                	ld	s0,16(sp)
    1a4c:	64a2                	ld	s1,8(sp)
    1a4e:	6105                	add	sp,sp,32
    1a50:	8082                	ret

0000000000001a52 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a52:	00a5c7b3          	xor	a5,a1,a0
    1a56:	8b9d                	and	a5,a5,7
    1a58:	eb95                	bnez	a5,1a8c <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a5a:	0075f793          	and	a5,a1,7
    1a5e:	e7b1                	bnez	a5,1aaa <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a60:	6198                	ld	a4,0(a1)
    1a62:	00000617          	auipc	a2,0x0
    1a66:	62e63603          	ld	a2,1582(a2) # 2090 <__clone+0x11c>
    1a6a:	00000817          	auipc	a6,0x0
    1a6e:	62e83803          	ld	a6,1582(a6) # 2098 <__clone+0x124>
    1a72:	a029                	j	1a7c <strcpy+0x2a>
    1a74:	05a1                	add	a1,a1,8
    1a76:	e118                	sd	a4,0(a0)
    1a78:	6198                	ld	a4,0(a1)
    1a7a:	0521                	add	a0,a0,8
    1a7c:	00c707b3          	add	a5,a4,a2
    1a80:	fff74693          	not	a3,a4
    1a84:	8ff5                	and	a5,a5,a3
    1a86:	0107f7b3          	and	a5,a5,a6
    1a8a:	d7ed                	beqz	a5,1a74 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	c785                	beqz	a5,1abc <strcpy+0x6a>
    1a96:	0015c783          	lbu	a5,1(a1)
    1a9a:	0505                	add	a0,a0,1
    1a9c:	0585                	add	a1,a1,1
    1a9e:	00f50023          	sb	a5,0(a0)
    1aa2:	fbf5                	bnez	a5,1a96 <strcpy+0x44>
        ;
    return d;
}
    1aa4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aa6:	0505                	add	a0,a0,1
    1aa8:	df45                	beqz	a4,1a60 <strcpy+0xe>
            if (!(*d = *s))
    1aaa:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aae:	0585                	add	a1,a1,1
    1ab0:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ab4:	00f50023          	sb	a5,0(a0)
    1ab8:	f7fd                	bnez	a5,1aa6 <strcpy+0x54>
}
    1aba:	8082                	ret
    1abc:	8082                	ret

0000000000001abe <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1abe:	00a5c7b3          	xor	a5,a1,a0
    1ac2:	8b9d                	and	a5,a5,7
    1ac4:	e3b5                	bnez	a5,1b28 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ac6:	0075f793          	and	a5,a1,7
    1aca:	cf99                	beqz	a5,1ae8 <strncpy+0x2a>
    1acc:	ea09                	bnez	a2,1ade <strncpy+0x20>
    1ace:	a421                	j	1cd6 <strncpy+0x218>
    1ad0:	0585                	add	a1,a1,1
    1ad2:	0075f793          	and	a5,a1,7
    1ad6:	167d                	add	a2,a2,-1
    1ad8:	0505                	add	a0,a0,1
    1ada:	c799                	beqz	a5,1ae8 <strncpy+0x2a>
    1adc:	c225                	beqz	a2,1b3c <strncpy+0x7e>
    1ade:	0005c783          	lbu	a5,0(a1)
    1ae2:	00f50023          	sb	a5,0(a0)
    1ae6:	f7ed                	bnez	a5,1ad0 <strncpy+0x12>
            ;
        if (!n || !*s)
    1ae8:	ca31                	beqz	a2,1b3c <strncpy+0x7e>
    1aea:	0005c783          	lbu	a5,0(a1)
    1aee:	cba1                	beqz	a5,1b3e <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af0:	479d                	li	a5,7
    1af2:	02c7fc63          	bgeu	a5,a2,1b2a <strncpy+0x6c>
    1af6:	00000897          	auipc	a7,0x0
    1afa:	59a8b883          	ld	a7,1434(a7) # 2090 <__clone+0x11c>
    1afe:	00000817          	auipc	a6,0x0
    1b02:	59a83803          	ld	a6,1434(a6) # 2098 <__clone+0x124>
    1b06:	431d                	li	t1,7
    1b08:	a039                	j	1b16 <strncpy+0x58>
            *wd = *ws;
    1b0a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0c:	1661                	add	a2,a2,-8
    1b0e:	05a1                	add	a1,a1,8
    1b10:	0521                	add	a0,a0,8
    1b12:	00c37b63          	bgeu	t1,a2,1b28 <strncpy+0x6a>
    1b16:	6198                	ld	a4,0(a1)
    1b18:	011707b3          	add	a5,a4,a7
    1b1c:	fff74693          	not	a3,a4
    1b20:	8ff5                	and	a5,a5,a3
    1b22:	0107f7b3          	and	a5,a5,a6
    1b26:	d3f5                	beqz	a5,1b0a <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b28:	ca11                	beqz	a2,1b3c <strncpy+0x7e>
    1b2a:	0005c783          	lbu	a5,0(a1)
    1b2e:	0585                	add	a1,a1,1
    1b30:	00f50023          	sb	a5,0(a0)
    1b34:	c789                	beqz	a5,1b3e <strncpy+0x80>
    1b36:	167d                	add	a2,a2,-1
    1b38:	0505                	add	a0,a0,1
    1b3a:	fa65                	bnez	a2,1b2a <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b3c:	8082                	ret
    1b3e:	4805                	li	a6,1
    1b40:	14061b63          	bnez	a2,1c96 <strncpy+0x1d8>
    1b44:	40a00733          	neg	a4,a0
    1b48:	00777793          	and	a5,a4,7
    1b4c:	4581                	li	a1,0
    1b4e:	12061c63          	bnez	a2,1c86 <strncpy+0x1c8>
    1b52:	00778693          	add	a3,a5,7
    1b56:	48ad                	li	a7,11
    1b58:	1316e563          	bltu	a3,a7,1c82 <strncpy+0x1c4>
    1b5c:	16d5e263          	bltu	a1,a3,1cc0 <strncpy+0x202>
    1b60:	14078c63          	beqz	a5,1cb8 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b64:	00050023          	sb	zero,0(a0)
    1b68:	00677693          	and	a3,a4,6
    1b6c:	14068263          	beqz	a3,1cb0 <strncpy+0x1f2>
    1b70:	000500a3          	sb	zero,1(a0)
    1b74:	4689                	li	a3,2
    1b76:	14f6f863          	bgeu	a3,a5,1cc6 <strncpy+0x208>
    1b7a:	00050123          	sb	zero,2(a0)
    1b7e:	8b11                	and	a4,a4,4
    1b80:	12070463          	beqz	a4,1ca8 <strncpy+0x1ea>
    1b84:	000501a3          	sb	zero,3(a0)
    1b88:	4711                	li	a4,4
    1b8a:	00450693          	add	a3,a0,4
    1b8e:	02f77563          	bgeu	a4,a5,1bb8 <strncpy+0xfa>
    1b92:	00050223          	sb	zero,4(a0)
    1b96:	4715                	li	a4,5
    1b98:	00550693          	add	a3,a0,5
    1b9c:	00e78e63          	beq	a5,a4,1bb8 <strncpy+0xfa>
    1ba0:	fff50713          	add	a4,a0,-1
    1ba4:	000502a3          	sb	zero,5(a0)
    1ba8:	8b1d                	and	a4,a4,7
    1baa:	12071263          	bnez	a4,1cce <strncpy+0x210>
    1bae:	00750693          	add	a3,a0,7
    1bb2:	00050323          	sb	zero,6(a0)
    1bb6:	471d                	li	a4,7
    1bb8:	40f80833          	sub	a6,a6,a5
    1bbc:	ff887593          	and	a1,a6,-8
    1bc0:	97aa                	add	a5,a5,a0
    1bc2:	95be                	add	a1,a1,a5
    1bc4:	0007b023          	sd	zero,0(a5)
    1bc8:	07a1                	add	a5,a5,8
    1bca:	feb79de3          	bne	a5,a1,1bc4 <strncpy+0x106>
    1bce:	ff887593          	and	a1,a6,-8
    1bd2:	00787813          	and	a6,a6,7
    1bd6:	00e587bb          	addw	a5,a1,a4
    1bda:	00b68733          	add	a4,a3,a1
    1bde:	0e080063          	beqz	a6,1cbe <strncpy+0x200>
    1be2:	00070023          	sb	zero,0(a4)
    1be6:	0017869b          	addw	a3,a5,1
    1bea:	f4c6f9e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1bee:	000700a3          	sb	zero,1(a4)
    1bf2:	0027869b          	addw	a3,a5,2
    1bf6:	f4c6f3e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1bfa:	00070123          	sb	zero,2(a4)
    1bfe:	0037869b          	addw	a3,a5,3
    1c02:	f2c6fde3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c06:	000701a3          	sb	zero,3(a4)
    1c0a:	0047869b          	addw	a3,a5,4
    1c0e:	f2c6f7e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c12:	00070223          	sb	zero,4(a4)
    1c16:	0057869b          	addw	a3,a5,5
    1c1a:	f2c6f1e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c1e:	000702a3          	sb	zero,5(a4)
    1c22:	0067869b          	addw	a3,a5,6
    1c26:	f0c6fbe3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c2a:	00070323          	sb	zero,6(a4)
    1c2e:	0077869b          	addw	a3,a5,7
    1c32:	f0c6f5e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c36:	000703a3          	sb	zero,7(a4)
    1c3a:	0087869b          	addw	a3,a5,8
    1c3e:	eec6ffe3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c42:	00070423          	sb	zero,8(a4)
    1c46:	0097869b          	addw	a3,a5,9
    1c4a:	eec6f9e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c4e:	000704a3          	sb	zero,9(a4)
    1c52:	00a7869b          	addw	a3,a5,10
    1c56:	eec6f3e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c5a:	00070523          	sb	zero,10(a4)
    1c5e:	00b7869b          	addw	a3,a5,11
    1c62:	ecc6fde3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c66:	000705a3          	sb	zero,11(a4)
    1c6a:	00c7869b          	addw	a3,a5,12
    1c6e:	ecc6f7e3          	bgeu	a3,a2,1b3c <strncpy+0x7e>
    1c72:	00070623          	sb	zero,12(a4)
    1c76:	27b5                	addw	a5,a5,13
    1c78:	ecc7f2e3          	bgeu	a5,a2,1b3c <strncpy+0x7e>
    1c7c:	000706a3          	sb	zero,13(a4)
}
    1c80:	8082                	ret
    1c82:	46ad                	li	a3,11
    1c84:	bde1                	j	1b5c <strncpy+0x9e>
    1c86:	00778693          	add	a3,a5,7
    1c8a:	48ad                	li	a7,11
    1c8c:	fff60593          	add	a1,a2,-1
    1c90:	ed16f6e3          	bgeu	a3,a7,1b5c <strncpy+0x9e>
    1c94:	b7fd                	j	1c82 <strncpy+0x1c4>
    1c96:	40a00733          	neg	a4,a0
    1c9a:	8832                	mv	a6,a2
    1c9c:	00777793          	and	a5,a4,7
    1ca0:	4581                	li	a1,0
    1ca2:	ea0608e3          	beqz	a2,1b52 <strncpy+0x94>
    1ca6:	b7c5                	j	1c86 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca8:	00350693          	add	a3,a0,3
    1cac:	470d                	li	a4,3
    1cae:	b729                	j	1bb8 <strncpy+0xfa>
    1cb0:	00150693          	add	a3,a0,1
    1cb4:	4705                	li	a4,1
    1cb6:	b709                	j	1bb8 <strncpy+0xfa>
tail:
    1cb8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cba:	4701                	li	a4,0
    1cbc:	bdf5                	j	1bb8 <strncpy+0xfa>
    1cbe:	8082                	ret
tail:
    1cc0:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cc2:	4781                	li	a5,0
    1cc4:	bf39                	j	1be2 <strncpy+0x124>
    1cc6:	00250693          	add	a3,a0,2
    1cca:	4709                	li	a4,2
    1ccc:	b5f5                	j	1bb8 <strncpy+0xfa>
    1cce:	00650693          	add	a3,a0,6
    1cd2:	4719                	li	a4,6
    1cd4:	b5d5                	j	1bb8 <strncpy+0xfa>
    1cd6:	8082                	ret

0000000000001cd8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cd8:	87aa                	mv	a5,a0
    1cda:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cdc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ce0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ce4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1ce6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <openat>:
    register long a7 __asm__("a7") = n;
    1cf0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cf4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <close>:
    register long a7 __asm__("a7") = n;
    1d00:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <read>:
    register long a7 __asm__("a7") = n;
    1d0c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d10:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d14:	8082                	ret

0000000000001d16 <write>:
    register long a7 __asm__("a7") = n;
    1d16:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d1e:	8082                	ret

0000000000001d20 <getpid>:
    register long a7 __asm__("a7") = n;
    1d20:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d24:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <getppid>:
    register long a7 __asm__("a7") = n;
    1d2c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d30:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d38:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d3c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <fork>:
    register long a7 __asm__("a7") = n;
    1d44:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d48:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d4a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d54:	85b2                	mv	a1,a2
    1d56:	863a                	mv	a2,a4
    if (stack)
    1d58:	c191                	beqz	a1,1d5c <clone+0x8>
	stack += stack_size;
    1d5a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d5c:	4781                	li	a5,0
    1d5e:	4701                	li	a4,0
    1d60:	4681                	li	a3,0
    1d62:	2601                	sext.w	a2,a2
    1d64:	ac01                	j	1f74 <__clone>

0000000000001d66 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d66:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d6a:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d6e:	8082                	ret

0000000000001d70 <exit>:
    register long a7 __asm__("a7") = n;
    1d70:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d78:	8082                	ret

0000000000001d7a <waitpid>:
    register long a7 __asm__("a7") = n;
    1d7a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d7e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d80:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <exec>:
    register long a7 __asm__("a7") = n;
    1d88:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d8c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <execve>:
    register long a7 __asm__("a7") = n;
    1d94:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d98:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <times>:
    register long a7 __asm__("a7") = n;
    1da0:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1da4:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <get_time>:

int64 get_time()
{
    1dac:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dae:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1db2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1db4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dba:	2501                	sext.w	a0,a0
    1dbc:	ed09                	bnez	a0,1dd6 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dbe:	67a2                	ld	a5,8(sp)
    1dc0:	3e800713          	li	a4,1000
    1dc4:	00015503          	lhu	a0,0(sp)
    1dc8:	02e7d7b3          	divu	a5,a5,a4
    1dcc:	02e50533          	mul	a0,a0,a4
    1dd0:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dd2:	0141                	add	sp,sp,16
    1dd4:	8082                	ret
        return -1;
    1dd6:	557d                	li	a0,-1
    1dd8:	bfed                	j	1dd2 <get_time+0x26>

0000000000001dda <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dda:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <time>:
    register long a7 __asm__("a7") = n;
    1de6:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <sleep>:

int sleep(unsigned long long time)
{
    1df2:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1df4:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1df6:	850a                	mv	a0,sp
    1df8:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dfa:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dfe:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e00:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e04:	e501                	bnez	a0,1e0c <sleep+0x1a>
    return 0;
    1e06:	4501                	li	a0,0
}
    1e08:	0141                	add	sp,sp,16
    1e0a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e0c:	4502                	lw	a0,0(sp)
}
    1e0e:	0141                	add	sp,sp,16
    1e10:	8082                	ret

0000000000001e12 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e12:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e1e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e22:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e26:	8082                	ret

0000000000001e28 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e28:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2c:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <munmap>:
    register long a7 __asm__("a7") = n;
    1e34:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <wait>:

int wait(int *code)
{
    1e40:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e42:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e46:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e48:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e4a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e4c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <spawn>:
    register long a7 __asm__("a7") = n;
    1e54:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <mailread>:
    register long a7 __asm__("a7") = n;
    1e60:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e6c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <fstat>:
    register long a7 __asm__("a7") = n;
    1e78:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e84:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e86:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e8a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8c:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e94:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e96:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e9a:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ea4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ea6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eaa:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <link>:

int link(char *old_path, char *new_path)
{
    1eb4:	87aa                	mv	a5,a0
    1eb6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eb8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ebc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ec0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ec2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ec6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <unlink>:

int unlink(char *path)
{
    1ed0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ed6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eda:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1edc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <uname>:
    register long a7 __asm__("a7") = n;
    1ee4:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ee8:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <brk>:
    register long a7 __asm__("a7") = n;
    1ef0:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ef4:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <getcwd>:
    register long a7 __asm__("a7") = n;
    1efc:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efe:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f02:	8082                	ret

0000000000001f04 <chdir>:
    register long a7 __asm__("a7") = n;
    1f04:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f08:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f10:	862e                	mv	a2,a1
    1f12:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f14:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f16:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f1a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f1e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f20:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f22:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <getdents>:
    register long a7 __asm__("a7") = n;
    1f2a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <pipe>:
    register long a7 __asm__("a7") = n;
    1f36:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f3a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <dup>:
    register long a7 __asm__("a7") = n;
    1f44:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f46:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <dup2>:
    register long a7 __asm__("a7") = n;
    1f4e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f50:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f52:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f56:	2501                	sext.w	a0,a0
    1f58:	8082                	ret

0000000000001f5a <mount>:
    register long a7 __asm__("a7") = n;
    1f5a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f5e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f62:	2501                	sext.w	a0,a0
    1f64:	8082                	ret

0000000000001f66 <umount>:
    register long a7 __asm__("a7") = n;
    1f66:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f74:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f76:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f78:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f7a:	8532                	mv	a0,a2
	mv a2, a4
    1f7c:	863a                	mv	a2,a4
	mv a3, a5
    1f7e:	86be                	mv	a3,a5
	mv a4, a6
    1f80:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f82:	0dc00893          	li	a7,220
	ecall
    1f86:	00000073          	ecall

	beqz a0, 1f
    1f8a:	c111                	beqz	a0,1f8e <__clone+0x1a>
	# Parent
	ret
    1f8c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f8e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f90:	6522                	ld	a0,8(sp)
	jalr a1
    1f92:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f94:	05d00893          	li	a7,93
	ecall
    1f98:	00000073          	ecall
