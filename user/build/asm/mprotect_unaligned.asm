
/home/hbh/oslab/oslab/user/build/riscv64/mprotect_unaligned:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa1d                	j	1138 <__start_main>

0000000000001004 <test_mprotect_unaligned>:
#include "stdlib.h"

static struct kstat kst;

void test_mprotect_unaligned(void)
{
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6a50513          	add	a0,a0,-150 # 1f70 <__clone+0x2a>
{
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    1014:	e84a                	sd	s2,16(sp)
    1016:	e44e                	sd	s3,8(sp)
    1018:	e052                	sd	s4,0(sp)
    TEST_START(__func__);
    101a:	376000ef          	jal	1390 <puts>
    101e:	00001517          	auipc	a0,0x1
    1022:	0d250513          	add	a0,a0,210 # 20f0 <__func__.0>
    1026:	36a000ef          	jal	1390 <puts>
    102a:	00001517          	auipc	a0,0x1
    102e:	f5e50513          	add	a0,a0,-162 # 1f88 <__clone+0x42>
    1032:	35e000ef          	jal	1390 <puts>

    const char *str = "  Hello, mmap successfully!";
    int fd = open("test_mprotect_bad.txt", O_RDWR | O_CREATE);
    1036:	04200593          	li	a1,66
    103a:	00001517          	auipc	a0,0x1
    103e:	f5e50513          	add	a0,a0,-162 # 1f98 <__clone+0x52>
    1042:	469000ef          	jal	1caa <open>
    1046:	842a                	mv	s0,a0
    assert(fd > 0);
    1048:	0ca05963          	blez	a0,111a <test_mprotect_unaligned+0x116>
    write(fd, str, strlen(str));
    104c:	00001517          	auipc	a0,0x1
    1050:	f8450513          	add	a0,a0,-124 # 1fd0 <__clone+0x8a>
    1054:	0b9000ef          	jal	190c <strlen>
    1058:	862a                	mv	a2,a0
    105a:	00001597          	auipc	a1,0x1
    105e:	f7658593          	add	a1,a1,-138 # 1fd0 <__clone+0x8a>
    1062:	8522                	mv	a0,s0
    1064:	485000ef          	jal	1ce8 <write>
    fstat(fd, &kst);
    1068:	00001917          	auipc	s2,0x1
    106c:	00890913          	add	s2,s2,8 # 2070 <kst>
    1070:	85ca                	mv	a1,s2
    1072:	8522                	mv	a0,s0
    1074:	5d7000ef          	jal	1e4a <fstat>

    char *array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1078:	03093583          	ld	a1,48(s2)
    107c:	4781                	li	a5,0
    107e:	8722                	mv	a4,s0
    1080:	4685                	li	a3,1
    1082:	460d                	li	a2,3
    1084:	4501                	li	a0,0
    1086:	56b000ef          	jal	1df0 <mmap>
    if(array == MAP_FAILED) {
    108a:	5a7d                	li	s4,-1
    char *array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    108c:	84aa                	mv	s1,a0
    if(array == MAP_FAILED) {
    108e:	07450f63          	beq	a0,s4,110c <test_mprotect_unaligned+0x108>
        printf("mprotect bad mmap failed.\n");
    } else {
        int ret = mprotect(array + 1, kst.st_size, PROT_READ);
    1092:	03093583          	ld	a1,48(s2)
    1096:	4605                	li	a2,1
    1098:	0505                	add	a0,a0,1
    109a:	561000ef          	jal	1dfa <mprotect>
    109e:	89aa                	mv	s3,a0
        printf("mprotect bad ret: %d\n", ret);
    10a0:	85aa                	mv	a1,a0
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f6e50513          	add	a0,a0,-146 # 2010 <__clone+0xca>
    10aa:	308000ef          	jal	13b2 <printf>
        assert(ret == -1);
    10ae:	05499863          	bne	s3,s4,10fe <test_mprotect_unaligned+0xfa>
        printf("mprotect bad success.\n");
    10b2:	00001517          	auipc	a0,0x1
    10b6:	f7650513          	add	a0,a0,-138 # 2028 <__clone+0xe2>
    10ba:	2f8000ef          	jal	13b2 <printf>
        munmap(array, kst.st_size);
    10be:	03093583          	ld	a1,48(s2)
    10c2:	8526                	mv	a0,s1
    10c4:	543000ef          	jal	1e06 <munmap>
    }
    close(fd);
    10c8:	8522                	mv	a0,s0
    10ca:	409000ef          	jal	1cd2 <close>

    TEST_END(__func__);
    10ce:	00001517          	auipc	a0,0x1
    10d2:	f7250513          	add	a0,a0,-142 # 2040 <__clone+0xfa>
    10d6:	2ba000ef          	jal	1390 <puts>
    10da:	00001517          	auipc	a0,0x1
    10de:	01650513          	add	a0,a0,22 # 20f0 <__func__.0>
    10e2:	2ae000ef          	jal	1390 <puts>
}
    10e6:	7402                	ld	s0,32(sp)
    10e8:	70a2                	ld	ra,40(sp)
    10ea:	64e2                	ld	s1,24(sp)
    10ec:	6942                	ld	s2,16(sp)
    10ee:	69a2                	ld	s3,8(sp)
    10f0:	6a02                	ld	s4,0(sp)
    TEST_END(__func__);
    10f2:	00001517          	auipc	a0,0x1
    10f6:	e9650513          	add	a0,a0,-362 # 1f88 <__clone+0x42>
}
    10fa:	6145                	add	sp,sp,48
    TEST_END(__func__);
    10fc:	ac51                	j	1390 <puts>
        assert(ret == -1);
    10fe:	00001517          	auipc	a0,0x1
    1102:	eb250513          	add	a0,a0,-334 # 1fb0 <__clone+0x6a>
    1106:	526000ef          	jal	162c <panic>
    110a:	b765                	j	10b2 <test_mprotect_unaligned+0xae>
        printf("mprotect bad mmap failed.\n");
    110c:	00001517          	auipc	a0,0x1
    1110:	ee450513          	add	a0,a0,-284 # 1ff0 <__clone+0xaa>
    1114:	29e000ef          	jal	13b2 <printf>
    1118:	bf45                	j	10c8 <test_mprotect_unaligned+0xc4>
    assert(fd > 0);
    111a:	00001517          	auipc	a0,0x1
    111e:	e9650513          	add	a0,a0,-362 # 1fb0 <__clone+0x6a>
    1122:	50a000ef          	jal	162c <panic>
    1126:	b71d                	j	104c <test_mprotect_unaligned+0x48>

0000000000001128 <main>:

int main(void)
{
    1128:	1141                	add	sp,sp,-16
    112a:	e406                	sd	ra,8(sp)
    test_mprotect_unaligned();
    112c:	ed9ff0ef          	jal	1004 <test_mprotect_unaligned>
    return 0;
}
    1130:	60a2                	ld	ra,8(sp)
    1132:	4501                	li	a0,0
    1134:	0141                	add	sp,sp,16
    1136:	8082                	ret

0000000000001138 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1138:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    113a:	4108                	lw	a0,0(a0)
{
    113c:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    113e:	05a1                	add	a1,a1,8
{
    1140:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1142:	fe7ff0ef          	jal	1128 <main>
    1146:	3fd000ef          	jal	1d42 <exit>
	return 0;
}
    114a:	60a2                	ld	ra,8(sp)
    114c:	4501                	li	a0,0
    114e:	0141                	add	sp,sp,16
    1150:	8082                	ret

0000000000001152 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1152:	7179                	add	sp,sp,-48
    1154:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1156:	12054863          	bltz	a0,1286 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    115a:	02b577bb          	remuw	a5,a0,a1
    115e:	00001697          	auipc	a3,0x1
    1162:	faa68693          	add	a3,a3,-86 # 2108 <digits>
    buf[16] = 0;
    1166:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    116a:	0005871b          	sext.w	a4,a1
    116e:	1782                	sll	a5,a5,0x20
    1170:	9381                	srl	a5,a5,0x20
    1172:	97b6                	add	a5,a5,a3
    1174:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1178:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    117c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1180:	1ab56663          	bltu	a0,a1,132c <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1184:	02e8763b          	remuw	a2,a6,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1196:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    119a:	12e86c63          	bltu	a6,a4,12d2 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    119e:	02e5f63b          	remuw	a2,a1,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11b4:	12e5e863          	bltu	a1,a4,12e4 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11b8:	02e8763b          	remuw	a2,a6,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ca:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11ce:	12e86463          	bltu	a6,a4,12f6 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11d2:	02e5f63b          	remuw	a2,a1,a4
    11d6:	1602                	sll	a2,a2,0x20
    11d8:	9201                	srl	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e4:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11e8:	12e5e063          	bltu	a1,a4,1308 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11ec:	02e8763b          	remuw	a2,a6,a4
    11f0:	1602                	sll	a2,a2,0x20
    11f2:	9201                	srl	a2,a2,0x20
    11f4:	9636                	add	a2,a2,a3
    11f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fa:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fe:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1202:	0ae86f63          	bltu	a6,a4,12c0 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1206:	02e5f63b          	remuw	a2,a1,a4
    120a:	1602                	sll	a2,a2,0x20
    120c:	9201                	srl	a2,a2,0x20
    120e:	9636                	add	a2,a2,a3
    1210:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1214:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1218:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    121c:	0ee5ef63          	bltu	a1,a4,131a <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1220:	02e8763b          	remuw	a2,a6,a4
    1224:	1602                	sll	a2,a2,0x20
    1226:	9201                	srl	a2,a2,0x20
    1228:	9636                	add	a2,a2,a3
    122a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1232:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1236:	0ee86d63          	bltu	a6,a4,1330 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    123a:	02e5f63b          	remuw	a2,a1,a4
    123e:	1602                	sll	a2,a2,0x20
    1240:	9201                	srl	a2,a2,0x20
    1242:	9636                	add	a2,a2,a3
    1244:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1248:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    124c:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1250:	0ee5e963          	bltu	a1,a4,1342 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1254:	1782                	sll	a5,a5,0x20
    1256:	9381                	srl	a5,a5,0x20
    1258:	96be                	add	a3,a3,a5
    125a:	0006c783          	lbu	a5,0(a3)
    125e:	4599                	li	a1,6
    1260:	00f10723          	sb	a5,14(sp)

    if (sign)
    1264:	00055763          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1270:	4595                	li	a1,5
    write(f, s, l);
    1272:	003c                	add	a5,sp,8
    1274:	4641                	li	a2,16
    1276:	9e0d                	subw	a2,a2,a1
    1278:	4505                	li	a0,1
    127a:	95be                	add	a1,a1,a5
    127c:	26d000ef          	jal	1ce8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1280:	70a2                	ld	ra,40(sp)
    1282:	6145                	add	sp,sp,48
    1284:	8082                	ret
        x = -xx;
    1286:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    128a:	02b677bb          	remuw	a5,a2,a1
    128e:	00001697          	auipc	a3,0x1
    1292:	e7a68693          	add	a3,a3,-390 # 2108 <digits>
    buf[16] = 0;
    1296:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    129a:	0005871b          	sext.w	a4,a1
    129e:	1782                	sll	a5,a5,0x20
    12a0:	9381                	srl	a5,a5,0x20
    12a2:	97b6                	add	a5,a5,a3
    12a4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12a8:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12ac:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12b0:	ecb67ae3          	bgeu	a2,a1,1184 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12bc:	45b9                	li	a1,14
    12be:	bf55                	j	1272 <printint.constprop.0+0x120>
    12c0:	45a9                	li	a1,10
    if (sign)
    12c2:	fa0558e3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12ce:	45a5                	li	a1,9
    12d0:	b74d                	j	1272 <printint.constprop.0+0x120>
    12d2:	45b9                	li	a1,14
    if (sign)
    12d4:	f8055fe3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d8:	02d00793          	li	a5,45
    12dc:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12e0:	45b5                	li	a1,13
    12e2:	bf41                	j	1272 <printint.constprop.0+0x120>
    12e4:	45b5                	li	a1,13
    if (sign)
    12e6:	f80556e3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ea:	02d00793          	li	a5,45
    12ee:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12f2:	45b1                	li	a1,12
    12f4:	bfbd                	j	1272 <printint.constprop.0+0x120>
    12f6:	45b1                	li	a1,12
    if (sign)
    12f8:	f6055de3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fc:	02d00793          	li	a5,45
    1300:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1304:	45ad                	li	a1,11
    1306:	b7b5                	j	1272 <printint.constprop.0+0x120>
    1308:	45ad                	li	a1,11
    if (sign)
    130a:	f60554e3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    130e:	02d00793          	li	a5,45
    1312:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1316:	45a9                	li	a1,10
    1318:	bfa9                	j	1272 <printint.constprop.0+0x120>
    131a:	45a5                	li	a1,9
    if (sign)
    131c:	f4055be3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1320:	02d00793          	li	a5,45
    1324:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1328:	45a1                	li	a1,8
    132a:	b7a1                	j	1272 <printint.constprop.0+0x120>
    i = 15;
    132c:	45bd                	li	a1,15
    132e:	b791                	j	1272 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1330:	45a1                	li	a1,8
    if (sign)
    1332:	f40550e3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1336:	02d00793          	li	a5,45
    133a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    133e:	459d                	li	a1,7
    1340:	bf0d                	j	1272 <printint.constprop.0+0x120>
    1342:	459d                	li	a1,7
    if (sign)
    1344:	f20557e3          	bgez	a0,1272 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1348:	02d00793          	li	a5,45
    134c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1350:	4599                	li	a1,6
    1352:	b705                	j	1272 <printint.constprop.0+0x120>

0000000000001354 <getchar>:
{
    1354:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1356:	00f10593          	add	a1,sp,15
    135a:	4605                	li	a2,1
    135c:	4501                	li	a0,0
{
    135e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1360:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1364:	17b000ef          	jal	1cde <read>
}
    1368:	60e2                	ld	ra,24(sp)
    136a:	00f14503          	lbu	a0,15(sp)
    136e:	6105                	add	sp,sp,32
    1370:	8082                	ret

0000000000001372 <putchar>:
{
    1372:	1101                	add	sp,sp,-32
    1374:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1376:	00f10593          	add	a1,sp,15
    137a:	4605                	li	a2,1
    137c:	4505                	li	a0,1
{
    137e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1380:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1384:	165000ef          	jal	1ce8 <write>
}
    1388:	60e2                	ld	ra,24(sp)
    138a:	2501                	sext.w	a0,a0
    138c:	6105                	add	sp,sp,32
    138e:	8082                	ret

0000000000001390 <puts>:
{
    1390:	1141                	add	sp,sp,-16
    1392:	e406                	sd	ra,8(sp)
    1394:	e022                	sd	s0,0(sp)
    1396:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1398:	574000ef          	jal	190c <strlen>
    139c:	862a                	mv	a2,a0
    139e:	85a2                	mv	a1,s0
    13a0:	4505                	li	a0,1
    13a2:	147000ef          	jal	1ce8 <write>
}
    13a6:	60a2                	ld	ra,8(sp)
    13a8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13aa:	957d                	sra	a0,a0,0x3f
    return r;
    13ac:	2501                	sext.w	a0,a0
}
    13ae:	0141                	add	sp,sp,16
    13b0:	8082                	ret

00000000000013b2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13b2:	7171                	add	sp,sp,-176
    13b4:	f85a                	sd	s6,48(sp)
    13b6:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13b8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13ba:	18bc                	add	a5,sp,120
{
    13bc:	e8ca                	sd	s2,80(sp)
    13be:	e4ce                	sd	s3,72(sp)
    13c0:	e0d2                	sd	s4,64(sp)
    13c2:	fc56                	sd	s5,56(sp)
    13c4:	f486                	sd	ra,104(sp)
    13c6:	f0a2                	sd	s0,96(sp)
    13c8:	eca6                	sd	s1,88(sp)
    13ca:	fcae                	sd	a1,120(sp)
    13cc:	e132                	sd	a2,128(sp)
    13ce:	e536                	sd	a3,136(sp)
    13d0:	e93a                	sd	a4,144(sp)
    13d2:	f142                	sd	a6,160(sp)
    13d4:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13d6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13d8:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13dc:	07300a13          	li	s4,115
    13e0:	07800a93          	li	s5,120
    buf[i++] = '0';
    13e4:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e8:	00001997          	auipc	s3,0x1
    13ec:	d2098993          	add	s3,s3,-736 # 2108 <digits>
        if (!*s)
    13f0:	00054783          	lbu	a5,0(a0)
    13f4:	16078a63          	beqz	a5,1568 <printf+0x1b6>
    13f8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13fa:	19278d63          	beq	a5,s2,1594 <printf+0x1e2>
    13fe:	00164783          	lbu	a5,1(a2)
    1402:	0605                	add	a2,a2,1
    1404:	fbfd                	bnez	a5,13fa <printf+0x48>
    1406:	84b2                	mv	s1,a2
        l = z - a;
    1408:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    140c:	85aa                	mv	a1,a0
    140e:	8622                	mv	a2,s0
    1410:	4505                	li	a0,1
    1412:	0d7000ef          	jal	1ce8 <write>
        if (l)
    1416:	1a041463          	bnez	s0,15be <printf+0x20c>
        if (s[1] == 0)
    141a:	0014c783          	lbu	a5,1(s1)
    141e:	14078563          	beqz	a5,1568 <printf+0x1b6>
        switch (s[1])
    1422:	1b478063          	beq	a5,s4,15c2 <printf+0x210>
    1426:	14fa6b63          	bltu	s4,a5,157c <printf+0x1ca>
    142a:	06400713          	li	a4,100
    142e:	1ee78063          	beq	a5,a4,160e <printf+0x25c>
    1432:	07000713          	li	a4,112
    1436:	1ae79963          	bne	a5,a4,15e8 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    143a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    143c:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1440:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1442:	631c                	ld	a5,0(a4)
    1444:	0721                	add	a4,a4,8
    1446:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1448:	00479293          	sll	t0,a5,0x4
    144c:	00879f93          	sll	t6,a5,0x8
    1450:	00c79f13          	sll	t5,a5,0xc
    1454:	01079e93          	sll	t4,a5,0x10
    1458:	01479e13          	sll	t3,a5,0x14
    145c:	01879313          	sll	t1,a5,0x18
    1460:	01c79893          	sll	a7,a5,0x1c
    1464:	02479813          	sll	a6,a5,0x24
    1468:	02879513          	sll	a0,a5,0x28
    146c:	02c79593          	sll	a1,a5,0x2c
    1470:	03079693          	sll	a3,a5,0x30
    1474:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1478:	03c7d413          	srl	s0,a5,0x3c
    147c:	01c7d39b          	srlw	t2,a5,0x1c
    1480:	03c2d293          	srl	t0,t0,0x3c
    1484:	03cfdf93          	srl	t6,t6,0x3c
    1488:	03cf5f13          	srl	t5,t5,0x3c
    148c:	03cede93          	srl	t4,t4,0x3c
    1490:	03ce5e13          	srl	t3,t3,0x3c
    1494:	03c35313          	srl	t1,t1,0x3c
    1498:	03c8d893          	srl	a7,a7,0x3c
    149c:	03c85813          	srl	a6,a6,0x3c
    14a0:	9171                	srl	a0,a0,0x3c
    14a2:	91f1                	srl	a1,a1,0x3c
    14a4:	92f1                	srl	a3,a3,0x3c
    14a6:	9371                	srl	a4,a4,0x3c
    14a8:	96ce                	add	a3,a3,s3
    14aa:	974e                	add	a4,a4,s3
    14ac:	944e                	add	s0,s0,s3
    14ae:	92ce                	add	t0,t0,s3
    14b0:	9fce                	add	t6,t6,s3
    14b2:	9f4e                	add	t5,t5,s3
    14b4:	9ece                	add	t4,t4,s3
    14b6:	9e4e                	add	t3,t3,s3
    14b8:	934e                	add	t1,t1,s3
    14ba:	98ce                	add	a7,a7,s3
    14bc:	93ce                	add	t2,t2,s3
    14be:	984e                	add	a6,a6,s3
    14c0:	954e                	add	a0,a0,s3
    14c2:	95ce                	add	a1,a1,s3
    14c4:	0006c083          	lbu	ra,0(a3)
    14c8:	0002c283          	lbu	t0,0(t0)
    14cc:	00074683          	lbu	a3,0(a4)
    14d0:	000fcf83          	lbu	t6,0(t6)
    14d4:	000f4f03          	lbu	t5,0(t5)
    14d8:	000ece83          	lbu	t4,0(t4)
    14dc:	000e4e03          	lbu	t3,0(t3)
    14e0:	00034303          	lbu	t1,0(t1)
    14e4:	0008c883          	lbu	a7,0(a7)
    14e8:	0003c383          	lbu	t2,0(t2)
    14ec:	00084803          	lbu	a6,0(a6)
    14f0:	00054503          	lbu	a0,0(a0)
    14f4:	0005c583          	lbu	a1,0(a1)
    14f8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14fc:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1500:	9371                	srl	a4,a4,0x3c
    1502:	8bbd                	and	a5,a5,15
    1504:	974e                	add	a4,a4,s3
    1506:	97ce                	add	a5,a5,s3
    1508:	005105a3          	sb	t0,11(sp)
    150c:	01f10623          	sb	t6,12(sp)
    1510:	01e106a3          	sb	t5,13(sp)
    1514:	01d10723          	sb	t4,14(sp)
    1518:	01c107a3          	sb	t3,15(sp)
    151c:	00610823          	sb	t1,16(sp)
    1520:	011108a3          	sb	a7,17(sp)
    1524:	00710923          	sb	t2,18(sp)
    1528:	010109a3          	sb	a6,19(sp)
    152c:	00a10a23          	sb	a0,20(sp)
    1530:	00b10aa3          	sb	a1,21(sp)
    1534:	00110b23          	sb	ra,22(sp)
    1538:	00d10ba3          	sb	a3,23(sp)
    153c:	00810523          	sb	s0,10(sp)
    1540:	00074703          	lbu	a4,0(a4)
    1544:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1548:	002c                	add	a1,sp,8
    154a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    154c:	00e10c23          	sb	a4,24(sp)
    1550:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1554:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1558:	790000ef          	jal	1ce8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    155c:	00248513          	add	a0,s1,2
        if (!*s)
    1560:	00054783          	lbu	a5,0(a0)
    1564:	e8079ae3          	bnez	a5,13f8 <printf+0x46>
    }
    va_end(ap);
}
    1568:	70a6                	ld	ra,104(sp)
    156a:	7406                	ld	s0,96(sp)
    156c:	64e6                	ld	s1,88(sp)
    156e:	6946                	ld	s2,80(sp)
    1570:	69a6                	ld	s3,72(sp)
    1572:	6a06                	ld	s4,64(sp)
    1574:	7ae2                	ld	s5,56(sp)
    1576:	7b42                	ld	s6,48(sp)
    1578:	614d                	add	sp,sp,176
    157a:	8082                	ret
        switch (s[1])
    157c:	07579663          	bne	a5,s5,15e8 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1580:	6782                	ld	a5,0(sp)
    1582:	45c1                	li	a1,16
    1584:	4388                	lw	a0,0(a5)
    1586:	07a1                	add	a5,a5,8
    1588:	e03e                	sd	a5,0(sp)
    158a:	bc9ff0ef          	jal	1152 <printint.constprop.0>
        s += 2;
    158e:	00248513          	add	a0,s1,2
    1592:	b7f9                	j	1560 <printf+0x1ae>
    1594:	84b2                	mv	s1,a2
    1596:	a039                	j	15a4 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1598:	0024c783          	lbu	a5,2(s1)
    159c:	0605                	add	a2,a2,1
    159e:	0489                	add	s1,s1,2
    15a0:	e72794e3          	bne	a5,s2,1408 <printf+0x56>
    15a4:	0014c783          	lbu	a5,1(s1)
    15a8:	ff2788e3          	beq	a5,s2,1598 <printf+0x1e6>
        l = z - a;
    15ac:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15b0:	85aa                	mv	a1,a0
    15b2:	8622                	mv	a2,s0
    15b4:	4505                	li	a0,1
    15b6:	732000ef          	jal	1ce8 <write>
        if (l)
    15ba:	e60400e3          	beqz	s0,141a <printf+0x68>
    15be:	8526                	mv	a0,s1
    15c0:	bd05                	j	13f0 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15c2:	6782                	ld	a5,0(sp)
    15c4:	6380                	ld	s0,0(a5)
    15c6:	07a1                	add	a5,a5,8
    15c8:	e03e                	sd	a5,0(sp)
    15ca:	cc21                	beqz	s0,1622 <printf+0x270>
            l = strnlen(a, 200);
    15cc:	0c800593          	li	a1,200
    15d0:	8522                	mv	a0,s0
    15d2:	424000ef          	jal	19f6 <strnlen>
    write(f, s, l);
    15d6:	0005061b          	sext.w	a2,a0
    15da:	85a2                	mv	a1,s0
    15dc:	4505                	li	a0,1
    15de:	70a000ef          	jal	1ce8 <write>
        s += 2;
    15e2:	00248513          	add	a0,s1,2
    15e6:	bfad                	j	1560 <printf+0x1ae>
    return write(stdout, &byte, 1);
    15e8:	4605                	li	a2,1
    15ea:	002c                	add	a1,sp,8
    15ec:	4505                	li	a0,1
    char byte = c;
    15ee:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15f2:	6f6000ef          	jal	1ce8 <write>
    char byte = c;
    15f6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15fa:	4605                	li	a2,1
    15fc:	002c                	add	a1,sp,8
    15fe:	4505                	li	a0,1
    char byte = c;
    1600:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1604:	6e4000ef          	jal	1ce8 <write>
        s += 2;
    1608:	00248513          	add	a0,s1,2
    160c:	bf91                	j	1560 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    160e:	6782                	ld	a5,0(sp)
    1610:	45a9                	li	a1,10
    1612:	4388                	lw	a0,0(a5)
    1614:	07a1                	add	a5,a5,8
    1616:	e03e                	sd	a5,0(sp)
    1618:	b3bff0ef          	jal	1152 <printint.constprop.0>
        s += 2;
    161c:	00248513          	add	a0,s1,2
    1620:	b781                	j	1560 <printf+0x1ae>
                a = "(null)";
    1622:	00001417          	auipc	s0,0x1
    1626:	a2e40413          	add	s0,s0,-1490 # 2050 <__clone+0x10a>
    162a:	b74d                	j	15cc <printf+0x21a>

000000000000162c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    162c:	1141                	add	sp,sp,-16
    162e:	e406                	sd	ra,8(sp)
    puts(m);
    1630:	d61ff0ef          	jal	1390 <puts>
    exit(-100);
}
    1634:	60a2                	ld	ra,8(sp)
    exit(-100);
    1636:	f9c00513          	li	a0,-100
}
    163a:	0141                	add	sp,sp,16
    exit(-100);
    163c:	a719                	j	1d42 <exit>

000000000000163e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    163e:	02000793          	li	a5,32
    1642:	00f50663          	beq	a0,a5,164e <isspace+0x10>
    1646:	355d                	addw	a0,a0,-9
    1648:	00553513          	sltiu	a0,a0,5
    164c:	8082                	ret
    164e:	4505                	li	a0,1
}
    1650:	8082                	ret

0000000000001652 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1652:	fd05051b          	addw	a0,a0,-48
}
    1656:	00a53513          	sltiu	a0,a0,10
    165a:	8082                	ret

000000000000165c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    165c:	02000693          	li	a3,32
    1660:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1662:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1666:	ff77871b          	addw	a4,a5,-9
    166a:	04d78c63          	beq	a5,a3,16c2 <atoi+0x66>
    166e:	0007861b          	sext.w	a2,a5
    1672:	04e5f863          	bgeu	a1,a4,16c2 <atoi+0x66>
        s++;
    switch (*s)
    1676:	02b00713          	li	a4,43
    167a:	04e78963          	beq	a5,a4,16cc <atoi+0x70>
    167e:	02d00713          	li	a4,45
    1682:	06e78263          	beq	a5,a4,16e6 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1686:	fd06069b          	addw	a3,a2,-48
    168a:	47a5                	li	a5,9
    168c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    168e:	4301                	li	t1,0
    while (isdigit(*s))
    1690:	04d7e963          	bltu	a5,a3,16e2 <atoi+0x86>
    int n = 0, neg = 0;
    1694:	4501                	li	a0,0
    while (isdigit(*s))
    1696:	48a5                	li	a7,9
    1698:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    169c:	0025179b          	sllw	a5,a0,0x2
    16a0:	9fa9                	addw	a5,a5,a0
    16a2:	fd06059b          	addw	a1,a2,-48
    16a6:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16aa:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16ae:	0705                	add	a4,a4,1
    16b0:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16b4:	0006861b          	sext.w	a2,a3
    16b8:	ff08f0e3          	bgeu	a7,a6,1698 <atoi+0x3c>
    return neg ? n : -n;
    16bc:	00030563          	beqz	t1,16c6 <atoi+0x6a>
}
    16c0:	8082                	ret
        s++;
    16c2:	0505                	add	a0,a0,1
    16c4:	bf79                	j	1662 <atoi+0x6>
    return neg ? n : -n;
    16c6:	40f5853b          	subw	a0,a1,a5
    16ca:	8082                	ret
    while (isdigit(*s))
    16cc:	00154603          	lbu	a2,1(a0)
    16d0:	47a5                	li	a5,9
        s++;
    16d2:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16d6:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16da:	4301                	li	t1,0
    while (isdigit(*s))
    16dc:	2601                	sext.w	a2,a2
    16de:	fad7fbe3          	bgeu	a5,a3,1694 <atoi+0x38>
    16e2:	4501                	li	a0,0
}
    16e4:	8082                	ret
    while (isdigit(*s))
    16e6:	00154603          	lbu	a2,1(a0)
    16ea:	47a5                	li	a5,9
        s++;
    16ec:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16f0:	fd06069b          	addw	a3,a2,-48
    16f4:	2601                	sext.w	a2,a2
    16f6:	fed7e6e3          	bltu	a5,a3,16e2 <atoi+0x86>
        neg = 1;
    16fa:	4305                	li	t1,1
    16fc:	bf61                	j	1694 <atoi+0x38>

00000000000016fe <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16fe:	18060163          	beqz	a2,1880 <memset+0x182>
    1702:	40a006b3          	neg	a3,a0
    1706:	0076f793          	and	a5,a3,7
    170a:	00778813          	add	a6,a5,7
    170e:	48ad                	li	a7,11
    1710:	0ff5f713          	zext.b	a4,a1
    1714:	fff60593          	add	a1,a2,-1
    1718:	17186563          	bltu	a6,a7,1882 <memset+0x184>
    171c:	1705ed63          	bltu	a1,a6,1896 <memset+0x198>
    1720:	16078363          	beqz	a5,1886 <memset+0x188>
    1724:	00e50023          	sb	a4,0(a0)
    1728:	0066f593          	and	a1,a3,6
    172c:	16058063          	beqz	a1,188c <memset+0x18e>
    1730:	00e500a3          	sb	a4,1(a0)
    1734:	4589                	li	a1,2
    1736:	16f5f363          	bgeu	a1,a5,189c <memset+0x19e>
    173a:	00e50123          	sb	a4,2(a0)
    173e:	8a91                	and	a3,a3,4
    1740:	00350593          	add	a1,a0,3
    1744:	4e0d                	li	t3,3
    1746:	ce9d                	beqz	a3,1784 <memset+0x86>
    1748:	00e501a3          	sb	a4,3(a0)
    174c:	4691                	li	a3,4
    174e:	00450593          	add	a1,a0,4
    1752:	4e11                	li	t3,4
    1754:	02f6f863          	bgeu	a3,a5,1784 <memset+0x86>
    1758:	00e50223          	sb	a4,4(a0)
    175c:	4695                	li	a3,5
    175e:	00550593          	add	a1,a0,5
    1762:	4e15                	li	t3,5
    1764:	02d78063          	beq	a5,a3,1784 <memset+0x86>
    1768:	fff50693          	add	a3,a0,-1
    176c:	00e502a3          	sb	a4,5(a0)
    1770:	8a9d                	and	a3,a3,7
    1772:	00650593          	add	a1,a0,6
    1776:	4e19                	li	t3,6
    1778:	e691                	bnez	a3,1784 <memset+0x86>
    177a:	00750593          	add	a1,a0,7
    177e:	00e50323          	sb	a4,6(a0)
    1782:	4e1d                	li	t3,7
    1784:	00871693          	sll	a3,a4,0x8
    1788:	01071813          	sll	a6,a4,0x10
    178c:	8ed9                	or	a3,a3,a4
    178e:	01871893          	sll	a7,a4,0x18
    1792:	0106e6b3          	or	a3,a3,a6
    1796:	0116e6b3          	or	a3,a3,a7
    179a:	02071813          	sll	a6,a4,0x20
    179e:	02871313          	sll	t1,a4,0x28
    17a2:	0106e6b3          	or	a3,a3,a6
    17a6:	40f608b3          	sub	a7,a2,a5
    17aa:	03071813          	sll	a6,a4,0x30
    17ae:	0066e6b3          	or	a3,a3,t1
    17b2:	0106e6b3          	or	a3,a3,a6
    17b6:	03871313          	sll	t1,a4,0x38
    17ba:	97aa                	add	a5,a5,a0
    17bc:	ff88f813          	and	a6,a7,-8
    17c0:	0066e6b3          	or	a3,a3,t1
    17c4:	983e                	add	a6,a6,a5
    17c6:	e394                	sd	a3,0(a5)
    17c8:	07a1                	add	a5,a5,8
    17ca:	ff079ee3          	bne	a5,a6,17c6 <memset+0xc8>
    17ce:	ff88f793          	and	a5,a7,-8
    17d2:	0078f893          	and	a7,a7,7
    17d6:	00f586b3          	add	a3,a1,a5
    17da:	01c787bb          	addw	a5,a5,t3
    17de:	0a088b63          	beqz	a7,1894 <memset+0x196>
    17e2:	00e68023          	sb	a4,0(a3)
    17e6:	0017859b          	addw	a1,a5,1
    17ea:	08c5fb63          	bgeu	a1,a2,1880 <memset+0x182>
    17ee:	00e680a3          	sb	a4,1(a3)
    17f2:	0027859b          	addw	a1,a5,2
    17f6:	08c5f563          	bgeu	a1,a2,1880 <memset+0x182>
    17fa:	00e68123          	sb	a4,2(a3)
    17fe:	0037859b          	addw	a1,a5,3
    1802:	06c5ff63          	bgeu	a1,a2,1880 <memset+0x182>
    1806:	00e681a3          	sb	a4,3(a3)
    180a:	0047859b          	addw	a1,a5,4
    180e:	06c5f963          	bgeu	a1,a2,1880 <memset+0x182>
    1812:	00e68223          	sb	a4,4(a3)
    1816:	0057859b          	addw	a1,a5,5
    181a:	06c5f363          	bgeu	a1,a2,1880 <memset+0x182>
    181e:	00e682a3          	sb	a4,5(a3)
    1822:	0067859b          	addw	a1,a5,6
    1826:	04c5fd63          	bgeu	a1,a2,1880 <memset+0x182>
    182a:	00e68323          	sb	a4,6(a3)
    182e:	0077859b          	addw	a1,a5,7
    1832:	04c5f763          	bgeu	a1,a2,1880 <memset+0x182>
    1836:	00e683a3          	sb	a4,7(a3)
    183a:	0087859b          	addw	a1,a5,8
    183e:	04c5f163          	bgeu	a1,a2,1880 <memset+0x182>
    1842:	00e68423          	sb	a4,8(a3)
    1846:	0097859b          	addw	a1,a5,9
    184a:	02c5fb63          	bgeu	a1,a2,1880 <memset+0x182>
    184e:	00e684a3          	sb	a4,9(a3)
    1852:	00a7859b          	addw	a1,a5,10
    1856:	02c5f563          	bgeu	a1,a2,1880 <memset+0x182>
    185a:	00e68523          	sb	a4,10(a3)
    185e:	00b7859b          	addw	a1,a5,11
    1862:	00c5ff63          	bgeu	a1,a2,1880 <memset+0x182>
    1866:	00e685a3          	sb	a4,11(a3)
    186a:	00c7859b          	addw	a1,a5,12
    186e:	00c5f963          	bgeu	a1,a2,1880 <memset+0x182>
    1872:	00e68623          	sb	a4,12(a3)
    1876:	27b5                	addw	a5,a5,13
    1878:	00c7f463          	bgeu	a5,a2,1880 <memset+0x182>
    187c:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1880:	8082                	ret
    1882:	482d                	li	a6,11
    1884:	bd61                	j	171c <memset+0x1e>
    char *p = dest;
    1886:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1888:	4e01                	li	t3,0
    188a:	bded                	j	1784 <memset+0x86>
    188c:	00150593          	add	a1,a0,1
    1890:	4e05                	li	t3,1
    1892:	bdcd                	j	1784 <memset+0x86>
    1894:	8082                	ret
    char *p = dest;
    1896:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1898:	4781                	li	a5,0
    189a:	b7a1                	j	17e2 <memset+0xe4>
    189c:	00250593          	add	a1,a0,2
    18a0:	4e09                	li	t3,2
    18a2:	b5cd                	j	1784 <memset+0x86>

00000000000018a4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18a4:	00054783          	lbu	a5,0(a0)
    18a8:	0005c703          	lbu	a4,0(a1)
    18ac:	00e79863          	bne	a5,a4,18bc <strcmp+0x18>
    18b0:	0505                	add	a0,a0,1
    18b2:	0585                	add	a1,a1,1
    18b4:	fbe5                	bnez	a5,18a4 <strcmp>
    18b6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18b8:	9d19                	subw	a0,a0,a4
    18ba:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18bc:	0007851b          	sext.w	a0,a5
    18c0:	bfe5                	j	18b8 <strcmp+0x14>

00000000000018c2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18c2:	ca15                	beqz	a2,18f6 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18c4:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18c8:	167d                	add	a2,a2,-1
    18ca:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18ce:	eb99                	bnez	a5,18e4 <strncmp+0x22>
    18d0:	a815                	j	1904 <strncmp+0x42>
    18d2:	00a68e63          	beq	a3,a0,18ee <strncmp+0x2c>
    18d6:	0505                	add	a0,a0,1
    18d8:	00f71b63          	bne	a4,a5,18ee <strncmp+0x2c>
    18dc:	00054783          	lbu	a5,0(a0)
    18e0:	cf89                	beqz	a5,18fa <strncmp+0x38>
    18e2:	85b2                	mv	a1,a2
    18e4:	0005c703          	lbu	a4,0(a1)
    18e8:	00158613          	add	a2,a1,1
    18ec:	f37d                	bnez	a4,18d2 <strncmp+0x10>
        ;
    return *l - *r;
    18ee:	0007851b          	sext.w	a0,a5
    18f2:	9d19                	subw	a0,a0,a4
    18f4:	8082                	ret
        return 0;
    18f6:	4501                	li	a0,0
}
    18f8:	8082                	ret
    return *l - *r;
    18fa:	0015c703          	lbu	a4,1(a1)
    18fe:	4501                	li	a0,0
    1900:	9d19                	subw	a0,a0,a4
    1902:	8082                	ret
    1904:	0005c703          	lbu	a4,0(a1)
    1908:	4501                	li	a0,0
    190a:	b7e5                	j	18f2 <strncmp+0x30>

000000000000190c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    190c:	00757793          	and	a5,a0,7
    1910:	cf89                	beqz	a5,192a <strlen+0x1e>
    1912:	87aa                	mv	a5,a0
    1914:	a029                	j	191e <strlen+0x12>
    1916:	0785                	add	a5,a5,1
    1918:	0077f713          	and	a4,a5,7
    191c:	cb01                	beqz	a4,192c <strlen+0x20>
        if (!*s)
    191e:	0007c703          	lbu	a4,0(a5)
    1922:	fb75                	bnez	a4,1916 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1924:	40a78533          	sub	a0,a5,a0
}
    1928:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    192a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    192c:	6394                	ld	a3,0(a5)
    192e:	00000597          	auipc	a1,0x0
    1932:	72a5b583          	ld	a1,1834(a1) # 2058 <__clone+0x112>
    1936:	00000617          	auipc	a2,0x0
    193a:	72a63603          	ld	a2,1834(a2) # 2060 <__clone+0x11a>
    193e:	a019                	j	1944 <strlen+0x38>
    1940:	6794                	ld	a3,8(a5)
    1942:	07a1                	add	a5,a5,8
    1944:	00b68733          	add	a4,a3,a1
    1948:	fff6c693          	not	a3,a3
    194c:	8f75                	and	a4,a4,a3
    194e:	8f71                	and	a4,a4,a2
    1950:	db65                	beqz	a4,1940 <strlen+0x34>
    for (; *s; s++)
    1952:	0007c703          	lbu	a4,0(a5)
    1956:	d779                	beqz	a4,1924 <strlen+0x18>
    1958:	0017c703          	lbu	a4,1(a5)
    195c:	0785                	add	a5,a5,1
    195e:	d379                	beqz	a4,1924 <strlen+0x18>
    1960:	0017c703          	lbu	a4,1(a5)
    1964:	0785                	add	a5,a5,1
    1966:	fb6d                	bnez	a4,1958 <strlen+0x4c>
    1968:	bf75                	j	1924 <strlen+0x18>

000000000000196a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    196a:	00757713          	and	a4,a0,7
{
    196e:	87aa                	mv	a5,a0
    1970:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1974:	cb19                	beqz	a4,198a <memchr+0x20>
    1976:	ce25                	beqz	a2,19ee <memchr+0x84>
    1978:	0007c703          	lbu	a4,0(a5)
    197c:	00b70763          	beq	a4,a1,198a <memchr+0x20>
    1980:	0785                	add	a5,a5,1
    1982:	0077f713          	and	a4,a5,7
    1986:	167d                	add	a2,a2,-1
    1988:	f77d                	bnez	a4,1976 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    198a:	4501                	li	a0,0
    if (n && *s != c)
    198c:	c235                	beqz	a2,19f0 <memchr+0x86>
    198e:	0007c703          	lbu	a4,0(a5)
    1992:	06b70063          	beq	a4,a1,19f2 <memchr+0x88>
        size_t k = ONES * c;
    1996:	00000517          	auipc	a0,0x0
    199a:	6d253503          	ld	a0,1746(a0) # 2068 <__clone+0x122>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199e:	471d                	li	a4,7
        size_t k = ONES * c;
    19a0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a4:	04c77763          	bgeu	a4,a2,19f2 <memchr+0x88>
    19a8:	00000897          	auipc	a7,0x0
    19ac:	6b08b883          	ld	a7,1712(a7) # 2058 <__clone+0x112>
    19b0:	00000817          	auipc	a6,0x0
    19b4:	6b083803          	ld	a6,1712(a6) # 2060 <__clone+0x11a>
    19b8:	431d                	li	t1,7
    19ba:	a029                	j	19c4 <memchr+0x5a>
    19bc:	1661                	add	a2,a2,-8
    19be:	07a1                	add	a5,a5,8
    19c0:	00c37c63          	bgeu	t1,a2,19d8 <memchr+0x6e>
    19c4:	6398                	ld	a4,0(a5)
    19c6:	8f29                	xor	a4,a4,a0
    19c8:	011706b3          	add	a3,a4,a7
    19cc:	fff74713          	not	a4,a4
    19d0:	8f75                	and	a4,a4,a3
    19d2:	01077733          	and	a4,a4,a6
    19d6:	d37d                	beqz	a4,19bc <memchr+0x52>
    19d8:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19da:	e601                	bnez	a2,19e2 <memchr+0x78>
    19dc:	a809                	j	19ee <memchr+0x84>
    19de:	0505                	add	a0,a0,1
    19e0:	c619                	beqz	a2,19ee <memchr+0x84>
    19e2:	00054783          	lbu	a5,0(a0)
    19e6:	167d                	add	a2,a2,-1
    19e8:	feb79be3          	bne	a5,a1,19de <memchr+0x74>
    19ec:	8082                	ret
    return n ? (void *)s : 0;
    19ee:	4501                	li	a0,0
}
    19f0:	8082                	ret
    if (n && *s != c)
    19f2:	853e                	mv	a0,a5
    19f4:	b7fd                	j	19e2 <memchr+0x78>

00000000000019f6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19f6:	1101                	add	sp,sp,-32
    19f8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19fa:	862e                	mv	a2,a1
{
    19fc:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19fe:	4581                	li	a1,0
{
    1a00:	e426                	sd	s1,8(sp)
    1a02:	ec06                	sd	ra,24(sp)
    1a04:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a06:	f65ff0ef          	jal	196a <memchr>
    return p ? p - s : n;
    1a0a:	c519                	beqz	a0,1a18 <strnlen+0x22>
}
    1a0c:	60e2                	ld	ra,24(sp)
    1a0e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a10:	8d05                	sub	a0,a0,s1
}
    1a12:	64a2                	ld	s1,8(sp)
    1a14:	6105                	add	sp,sp,32
    1a16:	8082                	ret
    1a18:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a1a:	8522                	mv	a0,s0
}
    1a1c:	6442                	ld	s0,16(sp)
    1a1e:	64a2                	ld	s1,8(sp)
    1a20:	6105                	add	sp,sp,32
    1a22:	8082                	ret

0000000000001a24 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a24:	00a5c7b3          	xor	a5,a1,a0
    1a28:	8b9d                	and	a5,a5,7
    1a2a:	eb95                	bnez	a5,1a5e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0075f793          	and	a5,a1,7
    1a30:	e7b1                	bnez	a5,1a7c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a32:	6198                	ld	a4,0(a1)
    1a34:	00000617          	auipc	a2,0x0
    1a38:	62463603          	ld	a2,1572(a2) # 2058 <__clone+0x112>
    1a3c:	00000817          	auipc	a6,0x0
    1a40:	62483803          	ld	a6,1572(a6) # 2060 <__clone+0x11a>
    1a44:	a029                	j	1a4e <strcpy+0x2a>
    1a46:	05a1                	add	a1,a1,8
    1a48:	e118                	sd	a4,0(a0)
    1a4a:	6198                	ld	a4,0(a1)
    1a4c:	0521                	add	a0,a0,8
    1a4e:	00c707b3          	add	a5,a4,a2
    1a52:	fff74693          	not	a3,a4
    1a56:	8ff5                	and	a5,a5,a3
    1a58:	0107f7b3          	and	a5,a5,a6
    1a5c:	d7ed                	beqz	a5,1a46 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a5e:	0005c783          	lbu	a5,0(a1)
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	c785                	beqz	a5,1a8e <strcpy+0x6a>
    1a68:	0015c783          	lbu	a5,1(a1)
    1a6c:	0505                	add	a0,a0,1
    1a6e:	0585                	add	a1,a1,1
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	fbf5                	bnez	a5,1a68 <strcpy+0x44>
        ;
    return d;
}
    1a76:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a78:	0505                	add	a0,a0,1
    1a7a:	df45                	beqz	a4,1a32 <strcpy+0xe>
            if (!(*d = *s))
    1a7c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a80:	0585                	add	a1,a1,1
    1a82:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	f7fd                	bnez	a5,1a78 <strcpy+0x54>
}
    1a8c:	8082                	ret
    1a8e:	8082                	ret

0000000000001a90 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a90:	00a5c7b3          	xor	a5,a1,a0
    1a94:	8b9d                	and	a5,a5,7
    1a96:	e3b5                	bnez	a5,1afa <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a98:	0075f793          	and	a5,a1,7
    1a9c:	cf99                	beqz	a5,1aba <strncpy+0x2a>
    1a9e:	ea09                	bnez	a2,1ab0 <strncpy+0x20>
    1aa0:	a421                	j	1ca8 <strncpy+0x218>
    1aa2:	0585                	add	a1,a1,1
    1aa4:	0075f793          	and	a5,a1,7
    1aa8:	167d                	add	a2,a2,-1
    1aaa:	0505                	add	a0,a0,1
    1aac:	c799                	beqz	a5,1aba <strncpy+0x2a>
    1aae:	c225                	beqz	a2,1b0e <strncpy+0x7e>
    1ab0:	0005c783          	lbu	a5,0(a1)
    1ab4:	00f50023          	sb	a5,0(a0)
    1ab8:	f7ed                	bnez	a5,1aa2 <strncpy+0x12>
            ;
        if (!n || !*s)
    1aba:	ca31                	beqz	a2,1b0e <strncpy+0x7e>
    1abc:	0005c783          	lbu	a5,0(a1)
    1ac0:	cba1                	beqz	a5,1b10 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac2:	479d                	li	a5,7
    1ac4:	02c7fc63          	bgeu	a5,a2,1afc <strncpy+0x6c>
    1ac8:	00000897          	auipc	a7,0x0
    1acc:	5908b883          	ld	a7,1424(a7) # 2058 <__clone+0x112>
    1ad0:	00000817          	auipc	a6,0x0
    1ad4:	59083803          	ld	a6,1424(a6) # 2060 <__clone+0x11a>
    1ad8:	431d                	li	t1,7
    1ada:	a039                	j	1ae8 <strncpy+0x58>
            *wd = *ws;
    1adc:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ade:	1661                	add	a2,a2,-8
    1ae0:	05a1                	add	a1,a1,8
    1ae2:	0521                	add	a0,a0,8
    1ae4:	00c37b63          	bgeu	t1,a2,1afa <strncpy+0x6a>
    1ae8:	6198                	ld	a4,0(a1)
    1aea:	011707b3          	add	a5,a4,a7
    1aee:	fff74693          	not	a3,a4
    1af2:	8ff5                	and	a5,a5,a3
    1af4:	0107f7b3          	and	a5,a5,a6
    1af8:	d3f5                	beqz	a5,1adc <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1afa:	ca11                	beqz	a2,1b0e <strncpy+0x7e>
    1afc:	0005c783          	lbu	a5,0(a1)
    1b00:	0585                	add	a1,a1,1
    1b02:	00f50023          	sb	a5,0(a0)
    1b06:	c789                	beqz	a5,1b10 <strncpy+0x80>
    1b08:	167d                	add	a2,a2,-1
    1b0a:	0505                	add	a0,a0,1
    1b0c:	fa65                	bnez	a2,1afc <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b0e:	8082                	ret
    1b10:	4805                	li	a6,1
    1b12:	14061b63          	bnez	a2,1c68 <strncpy+0x1d8>
    1b16:	40a00733          	neg	a4,a0
    1b1a:	00777793          	and	a5,a4,7
    1b1e:	4581                	li	a1,0
    1b20:	12061c63          	bnez	a2,1c58 <strncpy+0x1c8>
    1b24:	00778693          	add	a3,a5,7
    1b28:	48ad                	li	a7,11
    1b2a:	1316e563          	bltu	a3,a7,1c54 <strncpy+0x1c4>
    1b2e:	16d5e263          	bltu	a1,a3,1c92 <strncpy+0x202>
    1b32:	14078c63          	beqz	a5,1c8a <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b36:	00050023          	sb	zero,0(a0)
    1b3a:	00677693          	and	a3,a4,6
    1b3e:	14068263          	beqz	a3,1c82 <strncpy+0x1f2>
    1b42:	000500a3          	sb	zero,1(a0)
    1b46:	4689                	li	a3,2
    1b48:	14f6f863          	bgeu	a3,a5,1c98 <strncpy+0x208>
    1b4c:	00050123          	sb	zero,2(a0)
    1b50:	8b11                	and	a4,a4,4
    1b52:	12070463          	beqz	a4,1c7a <strncpy+0x1ea>
    1b56:	000501a3          	sb	zero,3(a0)
    1b5a:	4711                	li	a4,4
    1b5c:	00450693          	add	a3,a0,4
    1b60:	02f77563          	bgeu	a4,a5,1b8a <strncpy+0xfa>
    1b64:	00050223          	sb	zero,4(a0)
    1b68:	4715                	li	a4,5
    1b6a:	00550693          	add	a3,a0,5
    1b6e:	00e78e63          	beq	a5,a4,1b8a <strncpy+0xfa>
    1b72:	fff50713          	add	a4,a0,-1
    1b76:	000502a3          	sb	zero,5(a0)
    1b7a:	8b1d                	and	a4,a4,7
    1b7c:	12071263          	bnez	a4,1ca0 <strncpy+0x210>
    1b80:	00750693          	add	a3,a0,7
    1b84:	00050323          	sb	zero,6(a0)
    1b88:	471d                	li	a4,7
    1b8a:	40f80833          	sub	a6,a6,a5
    1b8e:	ff887593          	and	a1,a6,-8
    1b92:	97aa                	add	a5,a5,a0
    1b94:	95be                	add	a1,a1,a5
    1b96:	0007b023          	sd	zero,0(a5)
    1b9a:	07a1                	add	a5,a5,8
    1b9c:	feb79de3          	bne	a5,a1,1b96 <strncpy+0x106>
    1ba0:	ff887593          	and	a1,a6,-8
    1ba4:	00787813          	and	a6,a6,7
    1ba8:	00e587bb          	addw	a5,a1,a4
    1bac:	00b68733          	add	a4,a3,a1
    1bb0:	0e080063          	beqz	a6,1c90 <strncpy+0x200>
    1bb4:	00070023          	sb	zero,0(a4)
    1bb8:	0017869b          	addw	a3,a5,1
    1bbc:	f4c6f9e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1bc0:	000700a3          	sb	zero,1(a4)
    1bc4:	0027869b          	addw	a3,a5,2
    1bc8:	f4c6f3e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1bcc:	00070123          	sb	zero,2(a4)
    1bd0:	0037869b          	addw	a3,a5,3
    1bd4:	f2c6fde3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1bd8:	000701a3          	sb	zero,3(a4)
    1bdc:	0047869b          	addw	a3,a5,4
    1be0:	f2c6f7e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1be4:	00070223          	sb	zero,4(a4)
    1be8:	0057869b          	addw	a3,a5,5
    1bec:	f2c6f1e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1bf0:	000702a3          	sb	zero,5(a4)
    1bf4:	0067869b          	addw	a3,a5,6
    1bf8:	f0c6fbe3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1bfc:	00070323          	sb	zero,6(a4)
    1c00:	0077869b          	addw	a3,a5,7
    1c04:	f0c6f5e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c08:	000703a3          	sb	zero,7(a4)
    1c0c:	0087869b          	addw	a3,a5,8
    1c10:	eec6ffe3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c14:	00070423          	sb	zero,8(a4)
    1c18:	0097869b          	addw	a3,a5,9
    1c1c:	eec6f9e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c20:	000704a3          	sb	zero,9(a4)
    1c24:	00a7869b          	addw	a3,a5,10
    1c28:	eec6f3e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c2c:	00070523          	sb	zero,10(a4)
    1c30:	00b7869b          	addw	a3,a5,11
    1c34:	ecc6fde3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c38:	000705a3          	sb	zero,11(a4)
    1c3c:	00c7869b          	addw	a3,a5,12
    1c40:	ecc6f7e3          	bgeu	a3,a2,1b0e <strncpy+0x7e>
    1c44:	00070623          	sb	zero,12(a4)
    1c48:	27b5                	addw	a5,a5,13
    1c4a:	ecc7f2e3          	bgeu	a5,a2,1b0e <strncpy+0x7e>
    1c4e:	000706a3          	sb	zero,13(a4)
}
    1c52:	8082                	ret
    1c54:	46ad                	li	a3,11
    1c56:	bde1                	j	1b2e <strncpy+0x9e>
    1c58:	00778693          	add	a3,a5,7
    1c5c:	48ad                	li	a7,11
    1c5e:	fff60593          	add	a1,a2,-1
    1c62:	ed16f6e3          	bgeu	a3,a7,1b2e <strncpy+0x9e>
    1c66:	b7fd                	j	1c54 <strncpy+0x1c4>
    1c68:	40a00733          	neg	a4,a0
    1c6c:	8832                	mv	a6,a2
    1c6e:	00777793          	and	a5,a4,7
    1c72:	4581                	li	a1,0
    1c74:	ea0608e3          	beqz	a2,1b24 <strncpy+0x94>
    1c78:	b7c5                	j	1c58 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c7a:	00350693          	add	a3,a0,3
    1c7e:	470d                	li	a4,3
    1c80:	b729                	j	1b8a <strncpy+0xfa>
    1c82:	00150693          	add	a3,a0,1
    1c86:	4705                	li	a4,1
    1c88:	b709                	j	1b8a <strncpy+0xfa>
tail:
    1c8a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c8c:	4701                	li	a4,0
    1c8e:	bdf5                	j	1b8a <strncpy+0xfa>
    1c90:	8082                	ret
tail:
    1c92:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c94:	4781                	li	a5,0
    1c96:	bf39                	j	1bb4 <strncpy+0x124>
    1c98:	00250693          	add	a3,a0,2
    1c9c:	4709                	li	a4,2
    1c9e:	b5f5                	j	1b8a <strncpy+0xfa>
    1ca0:	00650693          	add	a3,a0,6
    1ca4:	4719                	li	a4,6
    1ca6:	b5d5                	j	1b8a <strncpy+0xfa>
    1ca8:	8082                	ret

0000000000001caa <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1caa:	87aa                	mv	a5,a0
    1cac:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cae:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cb2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cb6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cb8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cba:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <openat>:
    register long a7 __asm__("a7") = n;
    1cc2:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cc6:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cca:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <close>:
    register long a7 __asm__("a7") = n;
    1cd2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cd6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <read>:
    register long a7 __asm__("a7") = n;
    1cde:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ce6:	8082                	ret

0000000000001ce8 <write>:
    register long a7 __asm__("a7") = n;
    1ce8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cec:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cf0:	8082                	ret

0000000000001cf2 <getpid>:
    register long a7 __asm__("a7") = n;
    1cf2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cf6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <getppid>:
    register long a7 __asm__("a7") = n;
    1cfe:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d02:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d0a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d0e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <fork>:
    register long a7 __asm__("a7") = n;
    1d16:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d1a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d1c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d26:	85b2                	mv	a1,a2
    1d28:	863a                	mv	a2,a4
    if (stack)
    1d2a:	c191                	beqz	a1,1d2e <clone+0x8>
	stack += stack_size;
    1d2c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d2e:	4781                	li	a5,0
    1d30:	4701                	li	a4,0
    1d32:	4681                	li	a3,0
    1d34:	2601                	sext.w	a2,a2
    1d36:	ac01                	j	1f46 <__clone>

0000000000001d38 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d38:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d3c:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d40:	8082                	ret

0000000000001d42 <exit>:
    register long a7 __asm__("a7") = n;
    1d42:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d4a:	8082                	ret

0000000000001d4c <waitpid>:
    register long a7 __asm__("a7") = n;
    1d4c:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d50:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d52:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <exec>:
    register long a7 __asm__("a7") = n;
    1d5a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d5e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <execve>:
    register long a7 __asm__("a7") = n;
    1d66:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <times>:
    register long a7 __asm__("a7") = n;
    1d72:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <get_time>:

int64 get_time()
{
    1d7e:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d80:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d84:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d86:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	ed09                	bnez	a0,1da8 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d90:	67a2                	ld	a5,8(sp)
    1d92:	3e800713          	li	a4,1000
    1d96:	00015503          	lhu	a0,0(sp)
    1d9a:	02e7d7b3          	divu	a5,a5,a4
    1d9e:	02e50533          	mul	a0,a0,a4
    1da2:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1da4:	0141                	add	sp,sp,16
    1da6:	8082                	ret
        return -1;
    1da8:	557d                	li	a0,-1
    1daa:	bfed                	j	1da4 <get_time+0x26>

0000000000001dac <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dac:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db0:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <time>:
    register long a7 __asm__("a7") = n;
    1db8:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sleep>:

int sleep(unsigned long long time)
{
    1dc4:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dc6:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dc8:	850a                	mv	a0,sp
    1dca:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dcc:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dd0:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd2:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dd6:	e501                	bnez	a0,1dde <sleep+0x1a>
    return 0;
    1dd8:	4501                	li	a0,0
}
    1dda:	0141                	add	sp,sp,16
    1ddc:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dde:	4502                	lw	a0,0(sp)
}
    1de0:	0141                	add	sp,sp,16
    1de2:	8082                	ret

0000000000001de4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1de4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1de8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1df0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1df4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1df8:	8082                	ret

0000000000001dfa <mprotect>:
    register long a7 __asm__("a7") = n;
    1dfa:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <munmap>:
    register long a7 __asm__("a7") = n;
    1e06:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <wait>:

int wait(int *code)
{
    1e12:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e14:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e18:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e1a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e1c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e1e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <spawn>:
    register long a7 __asm__("a7") = n;
    1e26:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <mailread>:
    register long a7 __asm__("a7") = n;
    1e32:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e3e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <fstat>:
    register long a7 __asm__("a7") = n;
    1e4a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e56:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e58:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e5c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5e:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e66:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e68:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e6c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e76:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e78:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e7c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <link>:

int link(char *old_path, char *new_path)
{
    1e86:	87aa                	mv	a5,a0
    1e88:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e8a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e8e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e92:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e94:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e98:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <unlink>:

int unlink(char *path)
{
    1ea2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ea8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eae:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <uname>:
    register long a7 __asm__("a7") = n;
    1eb6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eba:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <brk>:
    register long a7 __asm__("a7") = n;
    1ec2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ec6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <getcwd>:
    register long a7 __asm__("a7") = n;
    1ece:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ed4:	8082                	ret

0000000000001ed6 <chdir>:
    register long a7 __asm__("a7") = n;
    1ed6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eda:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ee2:	862e                	mv	a2,a1
    1ee4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ee6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eec:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ef0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ef2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <getdents>:
    register long a7 __asm__("a7") = n;
    1efc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <pipe>:
    register long a7 __asm__("a7") = n;
    1f08:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <dup>:
    register long a7 __asm__("a7") = n;
    1f16:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f18:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <dup2>:
    register long a7 __asm__("a7") = n;
    1f20:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <mount>:
    register long a7 __asm__("a7") = n;
    1f2c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f30:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <umount>:
    register long a7 __asm__("a7") = n;
    1f38:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f46:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f48:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f4a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f4c:	8532                	mv	a0,a2
	mv a2, a4
    1f4e:	863a                	mv	a2,a4
	mv a3, a5
    1f50:	86be                	mv	a3,a5
	mv a4, a6
    1f52:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f54:	0dc00893          	li	a7,220
	ecall
    1f58:	00000073          	ecall

	beqz a0, 1f
    1f5c:	c111                	beqz	a0,1f60 <__clone+0x1a>
	# Parent
	ret
    1f5e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f60:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f62:	6522                	ld	a0,8(sp)
	jalr a1
    1f64:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f66:	05d00893          	li	a7,93
	ecall
    1f6a:	00000073          	ecall
