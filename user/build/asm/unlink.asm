
/home/hbh/oslab/oslab/user/build/riscv64/unlink:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8f9                	j	10e0 <__start_main>

0000000000001004 <test_unlink>:
 * 测试失败，应有如下输出：
 * "  unlink error!"
 */

int test_unlink()
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1250513          	add	a0,a0,-238 # 1f18 <__clone+0x2a>
{
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	326000ef          	jal	1338 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fba50513          	add	a0,a0,-70 # 1fd0 <__func__.0>
    101e:	31a000ef          	jal	1338 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0e50513          	add	a0,a0,-242 # 1f30 <__clone+0x42>
    102a:	30e000ef          	jal	1338 <puts>

    char *fname = "./test_unlink";
    int fd, ret;

    fd = open(fname, O_CREATE | O_WRONLY);
    102e:	04100593          	li	a1,65
    1032:	00001517          	auipc	a0,0x1
    1036:	f0e50513          	add	a0,a0,-242 # 1f40 <__clone+0x52>
    103a:	419000ef          	jal	1c52 <open>
    103e:	842a                	mv	s0,a0
    assert(fd > 0);
    1040:	08a05163          	blez	a0,10c2 <test_unlink+0xbe>
    close(fd);
    1044:	8522                	mv	a0,s0
    1046:	435000ef          	jal	1c7a <close>

    // unlink test
    ret = unlink(fname);
    104a:	00001517          	auipc	a0,0x1
    104e:	ef650513          	add	a0,a0,-266 # 1f40 <__clone+0x52>
    1052:	5f9000ef          	jal	1e4a <unlink>
    assert(ret == 0);
    1056:	ed39                	bnez	a0,10b4 <test_unlink+0xb0>
    fd = open(fname, O_RDONLY);
    1058:	4581                	li	a1,0
    105a:	00001517          	auipc	a0,0x1
    105e:	ee650513          	add	a0,a0,-282 # 1f40 <__clone+0x52>
    1062:	3f1000ef          	jal	1c52 <open>
    1066:	842a                	mv	s0,a0
    if(fd < 0){
    1068:	02054f63          	bltz	a0,10a6 <test_unlink+0xa2>
        printf("  unlink success!\n");
    }else{
	printf("  unlink error!\n");
    106c:	00001517          	auipc	a0,0x1
    1070:	f1c50513          	add	a0,a0,-228 # 1f88 <__clone+0x9a>
    1074:	2e6000ef          	jal	135a <printf>
        close(fd);
    1078:	8522                	mv	a0,s0
    107a:	401000ef          	jal	1c7a <close>
    }
    // It's Ok if you don't delete the inode and data blocks.

    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	f2250513          	add	a0,a0,-222 # 1fa0 <__clone+0xb2>
    1086:	2b2000ef          	jal	1338 <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	f4650513          	add	a0,a0,-186 # 1fd0 <__func__.0>
    1092:	2a6000ef          	jal	1338 <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e9650513          	add	a0,a0,-362 # 1f30 <__clone+0x42>
}
    10a2:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a4:	ac51                	j	1338 <puts>
        printf("  unlink success!\n");
    10a6:	00001517          	auipc	a0,0x1
    10aa:	eca50513          	add	a0,a0,-310 # 1f70 <__clone+0x82>
    10ae:	2ac000ef          	jal	135a <printf>
    10b2:	b7f1                	j	107e <test_unlink+0x7a>
    assert(ret == 0);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	e9c50513          	add	a0,a0,-356 # 1f50 <__clone+0x62>
    10bc:	518000ef          	jal	15d4 <panic>
    10c0:	bf61                	j	1058 <test_unlink+0x54>
    assert(fd > 0);
    10c2:	00001517          	auipc	a0,0x1
    10c6:	e8e50513          	add	a0,a0,-370 # 1f50 <__clone+0x62>
    10ca:	50a000ef          	jal	15d4 <panic>
    10ce:	bf9d                	j	1044 <test_unlink+0x40>

00000000000010d0 <main>:

int main(void) {
    10d0:	1141                	add	sp,sp,-16
    10d2:	e406                	sd	ra,8(sp)
	test_unlink();
    10d4:	f31ff0ef          	jal	1004 <test_unlink>
	return 0;
}
    10d8:	60a2                	ld	ra,8(sp)
    10da:	4501                	li	a0,0
    10dc:	0141                	add	sp,sp,16
    10de:	8082                	ret

00000000000010e0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e2:	4108                	lw	a0,0(a0)
{
    10e4:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10e6:	05a1                	add	a1,a1,8
{
    10e8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ea:	fe7ff0ef          	jal	10d0 <main>
    10ee:	3fd000ef          	jal	1cea <exit>
	return 0;
}
    10f2:	60a2                	ld	ra,8(sp)
    10f4:	4501                	li	a0,0
    10f6:	0141                	add	sp,sp,16
    10f8:	8082                	ret

00000000000010fa <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fa:	7179                	add	sp,sp,-48
    10fc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10fe:	12054863          	bltz	a0,122e <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1102:	02b577bb          	remuw	a5,a0,a1
    1106:	00001697          	auipc	a3,0x1
    110a:	eda68693          	add	a3,a3,-294 # 1fe0 <digits>
    buf[16] = 0;
    110e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1112:	0005871b          	sext.w	a4,a1
    1116:	1782                	sll	a5,a5,0x20
    1118:	9381                	srl	a5,a5,0x20
    111a:	97b6                	add	a5,a5,a3
    111c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1120:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1124:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1128:	1ab56663          	bltu	a0,a1,12d4 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    112c:	02e8763b          	remuw	a2,a6,a4
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1142:	12e86c63          	bltu	a6,a4,127a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1146:	02e5f63b          	remuw	a2,a1,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1158:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    115c:	12e5e863          	bltu	a1,a4,128c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1160:	02e8763b          	remuw	a2,a6,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1172:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1176:	12e86463          	bltu	a6,a4,129e <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    117a:	02e5f63b          	remuw	a2,a1,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1190:	12e5e063          	bltu	a1,a4,12b0 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1194:	02e8763b          	remuw	a2,a6,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a6:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11aa:	0ae86f63          	bltu	a6,a4,1268 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11ae:	02e5f63b          	remuw	a2,a1,a4
    11b2:	1602                	sll	a2,a2,0x20
    11b4:	9201                	srl	a2,a2,0x20
    11b6:	9636                	add	a2,a2,a3
    11b8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11bc:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11c0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11c4:	0ee5ef63          	bltu	a1,a4,12c2 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11c8:	02e8763b          	remuw	a2,a6,a4
    11cc:	1602                	sll	a2,a2,0x20
    11ce:	9201                	srl	a2,a2,0x20
    11d0:	9636                	add	a2,a2,a3
    11d2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11da:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11de:	0ee86d63          	bltu	a6,a4,12d8 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11e2:	02e5f63b          	remuw	a2,a1,a4
    11e6:	1602                	sll	a2,a2,0x20
    11e8:	9201                	srl	a2,a2,0x20
    11ea:	9636                	add	a2,a2,a3
    11ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11f4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f8:	0ee5e963          	bltu	a1,a4,12ea <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11fc:	1782                	sll	a5,a5,0x20
    11fe:	9381                	srl	a5,a5,0x20
    1200:	96be                	add	a3,a3,a5
    1202:	0006c783          	lbu	a5,0(a3)
    1206:	4599                	li	a1,6
    1208:	00f10723          	sb	a5,14(sp)

    if (sign)
    120c:	00055763          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1210:	02d00793          	li	a5,45
    1214:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1218:	4595                	li	a1,5
    write(f, s, l);
    121a:	003c                	add	a5,sp,8
    121c:	4641                	li	a2,16
    121e:	9e0d                	subw	a2,a2,a1
    1220:	4505                	li	a0,1
    1222:	95be                	add	a1,a1,a5
    1224:	26d000ef          	jal	1c90 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1228:	70a2                	ld	ra,40(sp)
    122a:	6145                	add	sp,sp,48
    122c:	8082                	ret
        x = -xx;
    122e:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1232:	02b677bb          	remuw	a5,a2,a1
    1236:	00001697          	auipc	a3,0x1
    123a:	daa68693          	add	a3,a3,-598 # 1fe0 <digits>
    buf[16] = 0;
    123e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1242:	0005871b          	sext.w	a4,a1
    1246:	1782                	sll	a5,a5,0x20
    1248:	9381                	srl	a5,a5,0x20
    124a:	97b6                	add	a5,a5,a3
    124c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1250:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1254:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1258:	ecb67ae3          	bgeu	a2,a1,112c <printint.constprop.0+0x32>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1264:	45b9                	li	a1,14
    1266:	bf55                	j	121a <printint.constprop.0+0x120>
    1268:	45a9                	li	a1,10
    if (sign)
    126a:	fa0558e3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1276:	45a5                	li	a1,9
    1278:	b74d                	j	121a <printint.constprop.0+0x120>
    127a:	45b9                	li	a1,14
    if (sign)
    127c:	f8055fe3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1288:	45b5                	li	a1,13
    128a:	bf41                	j	121a <printint.constprop.0+0x120>
    128c:	45b5                	li	a1,13
    if (sign)
    128e:	f80556e3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    129a:	45b1                	li	a1,12
    129c:	bfbd                	j	121a <printint.constprop.0+0x120>
    129e:	45b1                	li	a1,12
    if (sign)
    12a0:	f6055de3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12ac:	45ad                	li	a1,11
    12ae:	b7b5                	j	121a <printint.constprop.0+0x120>
    12b0:	45ad                	li	a1,11
    if (sign)
    12b2:	f60554e3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12be:	45a9                	li	a1,10
    12c0:	bfa9                	j	121a <printint.constprop.0+0x120>
    12c2:	45a5                	li	a1,9
    if (sign)
    12c4:	f4055be3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12d0:	45a1                	li	a1,8
    12d2:	b7a1                	j	121a <printint.constprop.0+0x120>
    i = 15;
    12d4:	45bd                	li	a1,15
    12d6:	b791                	j	121a <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12d8:	45a1                	li	a1,8
    if (sign)
    12da:	f40550e3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12e6:	459d                	li	a1,7
    12e8:	bf0d                	j	121a <printint.constprop.0+0x120>
    12ea:	459d                	li	a1,7
    if (sign)
    12ec:	f20557e3          	bgez	a0,121a <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12f8:	4599                	li	a1,6
    12fa:	b705                	j	121a <printint.constprop.0+0x120>

00000000000012fc <getchar>:
{
    12fc:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12fe:	00f10593          	add	a1,sp,15
    1302:	4605                	li	a2,1
    1304:	4501                	li	a0,0
{
    1306:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1308:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    130c:	17b000ef          	jal	1c86 <read>
}
    1310:	60e2                	ld	ra,24(sp)
    1312:	00f14503          	lbu	a0,15(sp)
    1316:	6105                	add	sp,sp,32
    1318:	8082                	ret

000000000000131a <putchar>:
{
    131a:	1101                	add	sp,sp,-32
    131c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    131e:	00f10593          	add	a1,sp,15
    1322:	4605                	li	a2,1
    1324:	4505                	li	a0,1
{
    1326:	ec06                	sd	ra,24(sp)
    char byte = c;
    1328:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    132c:	165000ef          	jal	1c90 <write>
}
    1330:	60e2                	ld	ra,24(sp)
    1332:	2501                	sext.w	a0,a0
    1334:	6105                	add	sp,sp,32
    1336:	8082                	ret

0000000000001338 <puts>:
{
    1338:	1141                	add	sp,sp,-16
    133a:	e406                	sd	ra,8(sp)
    133c:	e022                	sd	s0,0(sp)
    133e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1340:	574000ef          	jal	18b4 <strlen>
    1344:	862a                	mv	a2,a0
    1346:	85a2                	mv	a1,s0
    1348:	4505                	li	a0,1
    134a:	147000ef          	jal	1c90 <write>
}
    134e:	60a2                	ld	ra,8(sp)
    1350:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1352:	957d                	sra	a0,a0,0x3f
    return r;
    1354:	2501                	sext.w	a0,a0
}
    1356:	0141                	add	sp,sp,16
    1358:	8082                	ret

000000000000135a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    135a:	7171                	add	sp,sp,-176
    135c:	f85a                	sd	s6,48(sp)
    135e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1360:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1362:	18bc                	add	a5,sp,120
{
    1364:	e8ca                	sd	s2,80(sp)
    1366:	e4ce                	sd	s3,72(sp)
    1368:	e0d2                	sd	s4,64(sp)
    136a:	fc56                	sd	s5,56(sp)
    136c:	f486                	sd	ra,104(sp)
    136e:	f0a2                	sd	s0,96(sp)
    1370:	eca6                	sd	s1,88(sp)
    1372:	fcae                	sd	a1,120(sp)
    1374:	e132                	sd	a2,128(sp)
    1376:	e536                	sd	a3,136(sp)
    1378:	e93a                	sd	a4,144(sp)
    137a:	f142                	sd	a6,160(sp)
    137c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    137e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1380:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1384:	07300a13          	li	s4,115
    1388:	07800a93          	li	s5,120
    buf[i++] = '0';
    138c:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1390:	00001997          	auipc	s3,0x1
    1394:	c5098993          	add	s3,s3,-944 # 1fe0 <digits>
        if (!*s)
    1398:	00054783          	lbu	a5,0(a0)
    139c:	16078a63          	beqz	a5,1510 <printf+0x1b6>
    13a0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13a2:	19278d63          	beq	a5,s2,153c <printf+0x1e2>
    13a6:	00164783          	lbu	a5,1(a2)
    13aa:	0605                	add	a2,a2,1
    13ac:	fbfd                	bnez	a5,13a2 <printf+0x48>
    13ae:	84b2                	mv	s1,a2
        l = z - a;
    13b0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13b4:	85aa                	mv	a1,a0
    13b6:	8622                	mv	a2,s0
    13b8:	4505                	li	a0,1
    13ba:	0d7000ef          	jal	1c90 <write>
        if (l)
    13be:	1a041463          	bnez	s0,1566 <printf+0x20c>
        if (s[1] == 0)
    13c2:	0014c783          	lbu	a5,1(s1)
    13c6:	14078563          	beqz	a5,1510 <printf+0x1b6>
        switch (s[1])
    13ca:	1b478063          	beq	a5,s4,156a <printf+0x210>
    13ce:	14fa6b63          	bltu	s4,a5,1524 <printf+0x1ca>
    13d2:	06400713          	li	a4,100
    13d6:	1ee78063          	beq	a5,a4,15b6 <printf+0x25c>
    13da:	07000713          	li	a4,112
    13de:	1ae79963          	bne	a5,a4,1590 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13e2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e4:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13e8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ea:	631c                	ld	a5,0(a4)
    13ec:	0721                	add	a4,a4,8
    13ee:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f0:	00479293          	sll	t0,a5,0x4
    13f4:	00879f93          	sll	t6,a5,0x8
    13f8:	00c79f13          	sll	t5,a5,0xc
    13fc:	01079e93          	sll	t4,a5,0x10
    1400:	01479e13          	sll	t3,a5,0x14
    1404:	01879313          	sll	t1,a5,0x18
    1408:	01c79893          	sll	a7,a5,0x1c
    140c:	02479813          	sll	a6,a5,0x24
    1410:	02879513          	sll	a0,a5,0x28
    1414:	02c79593          	sll	a1,a5,0x2c
    1418:	03079693          	sll	a3,a5,0x30
    141c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1420:	03c7d413          	srl	s0,a5,0x3c
    1424:	01c7d39b          	srlw	t2,a5,0x1c
    1428:	03c2d293          	srl	t0,t0,0x3c
    142c:	03cfdf93          	srl	t6,t6,0x3c
    1430:	03cf5f13          	srl	t5,t5,0x3c
    1434:	03cede93          	srl	t4,t4,0x3c
    1438:	03ce5e13          	srl	t3,t3,0x3c
    143c:	03c35313          	srl	t1,t1,0x3c
    1440:	03c8d893          	srl	a7,a7,0x3c
    1444:	03c85813          	srl	a6,a6,0x3c
    1448:	9171                	srl	a0,a0,0x3c
    144a:	91f1                	srl	a1,a1,0x3c
    144c:	92f1                	srl	a3,a3,0x3c
    144e:	9371                	srl	a4,a4,0x3c
    1450:	96ce                	add	a3,a3,s3
    1452:	974e                	add	a4,a4,s3
    1454:	944e                	add	s0,s0,s3
    1456:	92ce                	add	t0,t0,s3
    1458:	9fce                	add	t6,t6,s3
    145a:	9f4e                	add	t5,t5,s3
    145c:	9ece                	add	t4,t4,s3
    145e:	9e4e                	add	t3,t3,s3
    1460:	934e                	add	t1,t1,s3
    1462:	98ce                	add	a7,a7,s3
    1464:	93ce                	add	t2,t2,s3
    1466:	984e                	add	a6,a6,s3
    1468:	954e                	add	a0,a0,s3
    146a:	95ce                	add	a1,a1,s3
    146c:	0006c083          	lbu	ra,0(a3)
    1470:	0002c283          	lbu	t0,0(t0)
    1474:	00074683          	lbu	a3,0(a4)
    1478:	000fcf83          	lbu	t6,0(t6)
    147c:	000f4f03          	lbu	t5,0(t5)
    1480:	000ece83          	lbu	t4,0(t4)
    1484:	000e4e03          	lbu	t3,0(t3)
    1488:	00034303          	lbu	t1,0(t1)
    148c:	0008c883          	lbu	a7,0(a7)
    1490:	0003c383          	lbu	t2,0(t2)
    1494:	00084803          	lbu	a6,0(a6)
    1498:	00054503          	lbu	a0,0(a0)
    149c:	0005c583          	lbu	a1,0(a1)
    14a0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a4:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a8:	9371                	srl	a4,a4,0x3c
    14aa:	8bbd                	and	a5,a5,15
    14ac:	974e                	add	a4,a4,s3
    14ae:	97ce                	add	a5,a5,s3
    14b0:	005105a3          	sb	t0,11(sp)
    14b4:	01f10623          	sb	t6,12(sp)
    14b8:	01e106a3          	sb	t5,13(sp)
    14bc:	01d10723          	sb	t4,14(sp)
    14c0:	01c107a3          	sb	t3,15(sp)
    14c4:	00610823          	sb	t1,16(sp)
    14c8:	011108a3          	sb	a7,17(sp)
    14cc:	00710923          	sb	t2,18(sp)
    14d0:	010109a3          	sb	a6,19(sp)
    14d4:	00a10a23          	sb	a0,20(sp)
    14d8:	00b10aa3          	sb	a1,21(sp)
    14dc:	00110b23          	sb	ra,22(sp)
    14e0:	00d10ba3          	sb	a3,23(sp)
    14e4:	00810523          	sb	s0,10(sp)
    14e8:	00074703          	lbu	a4,0(a4)
    14ec:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f0:	002c                	add	a1,sp,8
    14f2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f4:	00e10c23          	sb	a4,24(sp)
    14f8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14fc:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1500:	790000ef          	jal	1c90 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1504:	00248513          	add	a0,s1,2
        if (!*s)
    1508:	00054783          	lbu	a5,0(a0)
    150c:	e8079ae3          	bnez	a5,13a0 <printf+0x46>
    }
    va_end(ap);
}
    1510:	70a6                	ld	ra,104(sp)
    1512:	7406                	ld	s0,96(sp)
    1514:	64e6                	ld	s1,88(sp)
    1516:	6946                	ld	s2,80(sp)
    1518:	69a6                	ld	s3,72(sp)
    151a:	6a06                	ld	s4,64(sp)
    151c:	7ae2                	ld	s5,56(sp)
    151e:	7b42                	ld	s6,48(sp)
    1520:	614d                	add	sp,sp,176
    1522:	8082                	ret
        switch (s[1])
    1524:	07579663          	bne	a5,s5,1590 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1528:	6782                	ld	a5,0(sp)
    152a:	45c1                	li	a1,16
    152c:	4388                	lw	a0,0(a5)
    152e:	07a1                	add	a5,a5,8
    1530:	e03e                	sd	a5,0(sp)
    1532:	bc9ff0ef          	jal	10fa <printint.constprop.0>
        s += 2;
    1536:	00248513          	add	a0,s1,2
    153a:	b7f9                	j	1508 <printf+0x1ae>
    153c:	84b2                	mv	s1,a2
    153e:	a039                	j	154c <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1540:	0024c783          	lbu	a5,2(s1)
    1544:	0605                	add	a2,a2,1
    1546:	0489                	add	s1,s1,2
    1548:	e72794e3          	bne	a5,s2,13b0 <printf+0x56>
    154c:	0014c783          	lbu	a5,1(s1)
    1550:	ff2788e3          	beq	a5,s2,1540 <printf+0x1e6>
        l = z - a;
    1554:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1558:	85aa                	mv	a1,a0
    155a:	8622                	mv	a2,s0
    155c:	4505                	li	a0,1
    155e:	732000ef          	jal	1c90 <write>
        if (l)
    1562:	e60400e3          	beqz	s0,13c2 <printf+0x68>
    1566:	8526                	mv	a0,s1
    1568:	bd05                	j	1398 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    156a:	6782                	ld	a5,0(sp)
    156c:	6380                	ld	s0,0(a5)
    156e:	07a1                	add	a5,a5,8
    1570:	e03e                	sd	a5,0(sp)
    1572:	cc21                	beqz	s0,15ca <printf+0x270>
            l = strnlen(a, 200);
    1574:	0c800593          	li	a1,200
    1578:	8522                	mv	a0,s0
    157a:	424000ef          	jal	199e <strnlen>
    write(f, s, l);
    157e:	0005061b          	sext.w	a2,a0
    1582:	85a2                	mv	a1,s0
    1584:	4505                	li	a0,1
    1586:	70a000ef          	jal	1c90 <write>
        s += 2;
    158a:	00248513          	add	a0,s1,2
    158e:	bfad                	j	1508 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1590:	4605                	li	a2,1
    1592:	002c                	add	a1,sp,8
    1594:	4505                	li	a0,1
    char byte = c;
    1596:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    159a:	6f6000ef          	jal	1c90 <write>
    char byte = c;
    159e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15a2:	4605                	li	a2,1
    15a4:	002c                	add	a1,sp,8
    15a6:	4505                	li	a0,1
    char byte = c;
    15a8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15ac:	6e4000ef          	jal	1c90 <write>
        s += 2;
    15b0:	00248513          	add	a0,s1,2
    15b4:	bf91                	j	1508 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15b6:	6782                	ld	a5,0(sp)
    15b8:	45a9                	li	a1,10
    15ba:	4388                	lw	a0,0(a5)
    15bc:	07a1                	add	a5,a5,8
    15be:	e03e                	sd	a5,0(sp)
    15c0:	b3bff0ef          	jal	10fa <printint.constprop.0>
        s += 2;
    15c4:	00248513          	add	a0,s1,2
    15c8:	b781                	j	1508 <printf+0x1ae>
                a = "(null)";
    15ca:	00001417          	auipc	s0,0x1
    15ce:	9e640413          	add	s0,s0,-1562 # 1fb0 <__clone+0xc2>
    15d2:	b74d                	j	1574 <printf+0x21a>

00000000000015d4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15d4:	1141                	add	sp,sp,-16
    15d6:	e406                	sd	ra,8(sp)
    puts(m);
    15d8:	d61ff0ef          	jal	1338 <puts>
    exit(-100);
}
    15dc:	60a2                	ld	ra,8(sp)
    exit(-100);
    15de:	f9c00513          	li	a0,-100
}
    15e2:	0141                	add	sp,sp,16
    exit(-100);
    15e4:	a719                	j	1cea <exit>

00000000000015e6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e6:	02000793          	li	a5,32
    15ea:	00f50663          	beq	a0,a5,15f6 <isspace+0x10>
    15ee:	355d                	addw	a0,a0,-9
    15f0:	00553513          	sltiu	a0,a0,5
    15f4:	8082                	ret
    15f6:	4505                	li	a0,1
}
    15f8:	8082                	ret

00000000000015fa <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15fa:	fd05051b          	addw	a0,a0,-48
}
    15fe:	00a53513          	sltiu	a0,a0,10
    1602:	8082                	ret

0000000000001604 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1604:	02000693          	li	a3,32
    1608:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    160a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	ff77871b          	addw	a4,a5,-9
    1612:	04d78c63          	beq	a5,a3,166a <atoi+0x66>
    1616:	0007861b          	sext.w	a2,a5
    161a:	04e5f863          	bgeu	a1,a4,166a <atoi+0x66>
        s++;
    switch (*s)
    161e:	02b00713          	li	a4,43
    1622:	04e78963          	beq	a5,a4,1674 <atoi+0x70>
    1626:	02d00713          	li	a4,45
    162a:	06e78263          	beq	a5,a4,168e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    162e:	fd06069b          	addw	a3,a2,-48
    1632:	47a5                	li	a5,9
    1634:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1636:	4301                	li	t1,0
    while (isdigit(*s))
    1638:	04d7e963          	bltu	a5,a3,168a <atoi+0x86>
    int n = 0, neg = 0;
    163c:	4501                	li	a0,0
    while (isdigit(*s))
    163e:	48a5                	li	a7,9
    1640:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1644:	0025179b          	sllw	a5,a0,0x2
    1648:	9fa9                	addw	a5,a5,a0
    164a:	fd06059b          	addw	a1,a2,-48
    164e:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1652:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1656:	0705                	add	a4,a4,1
    1658:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    165c:	0006861b          	sext.w	a2,a3
    1660:	ff08f0e3          	bgeu	a7,a6,1640 <atoi+0x3c>
    return neg ? n : -n;
    1664:	00030563          	beqz	t1,166e <atoi+0x6a>
}
    1668:	8082                	ret
        s++;
    166a:	0505                	add	a0,a0,1
    166c:	bf79                	j	160a <atoi+0x6>
    return neg ? n : -n;
    166e:	40f5853b          	subw	a0,a1,a5
    1672:	8082                	ret
    while (isdigit(*s))
    1674:	00154603          	lbu	a2,1(a0)
    1678:	47a5                	li	a5,9
        s++;
    167a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    167e:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1682:	4301                	li	t1,0
    while (isdigit(*s))
    1684:	2601                	sext.w	a2,a2
    1686:	fad7fbe3          	bgeu	a5,a3,163c <atoi+0x38>
    168a:	4501                	li	a0,0
}
    168c:	8082                	ret
    while (isdigit(*s))
    168e:	00154603          	lbu	a2,1(a0)
    1692:	47a5                	li	a5,9
        s++;
    1694:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1698:	fd06069b          	addw	a3,a2,-48
    169c:	2601                	sext.w	a2,a2
    169e:	fed7e6e3          	bltu	a5,a3,168a <atoi+0x86>
        neg = 1;
    16a2:	4305                	li	t1,1
    16a4:	bf61                	j	163c <atoi+0x38>

00000000000016a6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16a6:	18060163          	beqz	a2,1828 <memset+0x182>
    16aa:	40a006b3          	neg	a3,a0
    16ae:	0076f793          	and	a5,a3,7
    16b2:	00778813          	add	a6,a5,7
    16b6:	48ad                	li	a7,11
    16b8:	0ff5f713          	zext.b	a4,a1
    16bc:	fff60593          	add	a1,a2,-1
    16c0:	17186563          	bltu	a6,a7,182a <memset+0x184>
    16c4:	1705ed63          	bltu	a1,a6,183e <memset+0x198>
    16c8:	16078363          	beqz	a5,182e <memset+0x188>
    16cc:	00e50023          	sb	a4,0(a0)
    16d0:	0066f593          	and	a1,a3,6
    16d4:	16058063          	beqz	a1,1834 <memset+0x18e>
    16d8:	00e500a3          	sb	a4,1(a0)
    16dc:	4589                	li	a1,2
    16de:	16f5f363          	bgeu	a1,a5,1844 <memset+0x19e>
    16e2:	00e50123          	sb	a4,2(a0)
    16e6:	8a91                	and	a3,a3,4
    16e8:	00350593          	add	a1,a0,3
    16ec:	4e0d                	li	t3,3
    16ee:	ce9d                	beqz	a3,172c <memset+0x86>
    16f0:	00e501a3          	sb	a4,3(a0)
    16f4:	4691                	li	a3,4
    16f6:	00450593          	add	a1,a0,4
    16fa:	4e11                	li	t3,4
    16fc:	02f6f863          	bgeu	a3,a5,172c <memset+0x86>
    1700:	00e50223          	sb	a4,4(a0)
    1704:	4695                	li	a3,5
    1706:	00550593          	add	a1,a0,5
    170a:	4e15                	li	t3,5
    170c:	02d78063          	beq	a5,a3,172c <memset+0x86>
    1710:	fff50693          	add	a3,a0,-1
    1714:	00e502a3          	sb	a4,5(a0)
    1718:	8a9d                	and	a3,a3,7
    171a:	00650593          	add	a1,a0,6
    171e:	4e19                	li	t3,6
    1720:	e691                	bnez	a3,172c <memset+0x86>
    1722:	00750593          	add	a1,a0,7
    1726:	00e50323          	sb	a4,6(a0)
    172a:	4e1d                	li	t3,7
    172c:	00871693          	sll	a3,a4,0x8
    1730:	01071813          	sll	a6,a4,0x10
    1734:	8ed9                	or	a3,a3,a4
    1736:	01871893          	sll	a7,a4,0x18
    173a:	0106e6b3          	or	a3,a3,a6
    173e:	0116e6b3          	or	a3,a3,a7
    1742:	02071813          	sll	a6,a4,0x20
    1746:	02871313          	sll	t1,a4,0x28
    174a:	0106e6b3          	or	a3,a3,a6
    174e:	40f608b3          	sub	a7,a2,a5
    1752:	03071813          	sll	a6,a4,0x30
    1756:	0066e6b3          	or	a3,a3,t1
    175a:	0106e6b3          	or	a3,a3,a6
    175e:	03871313          	sll	t1,a4,0x38
    1762:	97aa                	add	a5,a5,a0
    1764:	ff88f813          	and	a6,a7,-8
    1768:	0066e6b3          	or	a3,a3,t1
    176c:	983e                	add	a6,a6,a5
    176e:	e394                	sd	a3,0(a5)
    1770:	07a1                	add	a5,a5,8
    1772:	ff079ee3          	bne	a5,a6,176e <memset+0xc8>
    1776:	ff88f793          	and	a5,a7,-8
    177a:	0078f893          	and	a7,a7,7
    177e:	00f586b3          	add	a3,a1,a5
    1782:	01c787bb          	addw	a5,a5,t3
    1786:	0a088b63          	beqz	a7,183c <memset+0x196>
    178a:	00e68023          	sb	a4,0(a3)
    178e:	0017859b          	addw	a1,a5,1
    1792:	08c5fb63          	bgeu	a1,a2,1828 <memset+0x182>
    1796:	00e680a3          	sb	a4,1(a3)
    179a:	0027859b          	addw	a1,a5,2
    179e:	08c5f563          	bgeu	a1,a2,1828 <memset+0x182>
    17a2:	00e68123          	sb	a4,2(a3)
    17a6:	0037859b          	addw	a1,a5,3
    17aa:	06c5ff63          	bgeu	a1,a2,1828 <memset+0x182>
    17ae:	00e681a3          	sb	a4,3(a3)
    17b2:	0047859b          	addw	a1,a5,4
    17b6:	06c5f963          	bgeu	a1,a2,1828 <memset+0x182>
    17ba:	00e68223          	sb	a4,4(a3)
    17be:	0057859b          	addw	a1,a5,5
    17c2:	06c5f363          	bgeu	a1,a2,1828 <memset+0x182>
    17c6:	00e682a3          	sb	a4,5(a3)
    17ca:	0067859b          	addw	a1,a5,6
    17ce:	04c5fd63          	bgeu	a1,a2,1828 <memset+0x182>
    17d2:	00e68323          	sb	a4,6(a3)
    17d6:	0077859b          	addw	a1,a5,7
    17da:	04c5f763          	bgeu	a1,a2,1828 <memset+0x182>
    17de:	00e683a3          	sb	a4,7(a3)
    17e2:	0087859b          	addw	a1,a5,8
    17e6:	04c5f163          	bgeu	a1,a2,1828 <memset+0x182>
    17ea:	00e68423          	sb	a4,8(a3)
    17ee:	0097859b          	addw	a1,a5,9
    17f2:	02c5fb63          	bgeu	a1,a2,1828 <memset+0x182>
    17f6:	00e684a3          	sb	a4,9(a3)
    17fa:	00a7859b          	addw	a1,a5,10
    17fe:	02c5f563          	bgeu	a1,a2,1828 <memset+0x182>
    1802:	00e68523          	sb	a4,10(a3)
    1806:	00b7859b          	addw	a1,a5,11
    180a:	00c5ff63          	bgeu	a1,a2,1828 <memset+0x182>
    180e:	00e685a3          	sb	a4,11(a3)
    1812:	00c7859b          	addw	a1,a5,12
    1816:	00c5f963          	bgeu	a1,a2,1828 <memset+0x182>
    181a:	00e68623          	sb	a4,12(a3)
    181e:	27b5                	addw	a5,a5,13
    1820:	00c7f463          	bgeu	a5,a2,1828 <memset+0x182>
    1824:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1828:	8082                	ret
    182a:	482d                	li	a6,11
    182c:	bd61                	j	16c4 <memset+0x1e>
    char *p = dest;
    182e:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1830:	4e01                	li	t3,0
    1832:	bded                	j	172c <memset+0x86>
    1834:	00150593          	add	a1,a0,1
    1838:	4e05                	li	t3,1
    183a:	bdcd                	j	172c <memset+0x86>
    183c:	8082                	ret
    char *p = dest;
    183e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1840:	4781                	li	a5,0
    1842:	b7a1                	j	178a <memset+0xe4>
    1844:	00250593          	add	a1,a0,2
    1848:	4e09                	li	t3,2
    184a:	b5cd                	j	172c <memset+0x86>

000000000000184c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    184c:	00054783          	lbu	a5,0(a0)
    1850:	0005c703          	lbu	a4,0(a1)
    1854:	00e79863          	bne	a5,a4,1864 <strcmp+0x18>
    1858:	0505                	add	a0,a0,1
    185a:	0585                	add	a1,a1,1
    185c:	fbe5                	bnez	a5,184c <strcmp>
    185e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1860:	9d19                	subw	a0,a0,a4
    1862:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1864:	0007851b          	sext.w	a0,a5
    1868:	bfe5                	j	1860 <strcmp+0x14>

000000000000186a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    186a:	ca15                	beqz	a2,189e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1870:	167d                	add	a2,a2,-1
    1872:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1876:	eb99                	bnez	a5,188c <strncmp+0x22>
    1878:	a815                	j	18ac <strncmp+0x42>
    187a:	00a68e63          	beq	a3,a0,1896 <strncmp+0x2c>
    187e:	0505                	add	a0,a0,1
    1880:	00f71b63          	bne	a4,a5,1896 <strncmp+0x2c>
    1884:	00054783          	lbu	a5,0(a0)
    1888:	cf89                	beqz	a5,18a2 <strncmp+0x38>
    188a:	85b2                	mv	a1,a2
    188c:	0005c703          	lbu	a4,0(a1)
    1890:	00158613          	add	a2,a1,1
    1894:	f37d                	bnez	a4,187a <strncmp+0x10>
        ;
    return *l - *r;
    1896:	0007851b          	sext.w	a0,a5
    189a:	9d19                	subw	a0,a0,a4
    189c:	8082                	ret
        return 0;
    189e:	4501                	li	a0,0
}
    18a0:	8082                	ret
    return *l - *r;
    18a2:	0015c703          	lbu	a4,1(a1)
    18a6:	4501                	li	a0,0
    18a8:	9d19                	subw	a0,a0,a4
    18aa:	8082                	ret
    18ac:	0005c703          	lbu	a4,0(a1)
    18b0:	4501                	li	a0,0
    18b2:	b7e5                	j	189a <strncmp+0x30>

00000000000018b4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18b4:	00757793          	and	a5,a0,7
    18b8:	cf89                	beqz	a5,18d2 <strlen+0x1e>
    18ba:	87aa                	mv	a5,a0
    18bc:	a029                	j	18c6 <strlen+0x12>
    18be:	0785                	add	a5,a5,1
    18c0:	0077f713          	and	a4,a5,7
    18c4:	cb01                	beqz	a4,18d4 <strlen+0x20>
        if (!*s)
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	fb75                	bnez	a4,18be <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18cc:	40a78533          	sub	a0,a5,a0
}
    18d0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18d2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18d4:	6394                	ld	a3,0(a5)
    18d6:	00000597          	auipc	a1,0x0
    18da:	6e25b583          	ld	a1,1762(a1) # 1fb8 <__clone+0xca>
    18de:	00000617          	auipc	a2,0x0
    18e2:	6e263603          	ld	a2,1762(a2) # 1fc0 <__clone+0xd2>
    18e6:	a019                	j	18ec <strlen+0x38>
    18e8:	6794                	ld	a3,8(a5)
    18ea:	07a1                	add	a5,a5,8
    18ec:	00b68733          	add	a4,a3,a1
    18f0:	fff6c693          	not	a3,a3
    18f4:	8f75                	and	a4,a4,a3
    18f6:	8f71                	and	a4,a4,a2
    18f8:	db65                	beqz	a4,18e8 <strlen+0x34>
    for (; *s; s++)
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	d779                	beqz	a4,18cc <strlen+0x18>
    1900:	0017c703          	lbu	a4,1(a5)
    1904:	0785                	add	a5,a5,1
    1906:	d379                	beqz	a4,18cc <strlen+0x18>
    1908:	0017c703          	lbu	a4,1(a5)
    190c:	0785                	add	a5,a5,1
    190e:	fb6d                	bnez	a4,1900 <strlen+0x4c>
    1910:	bf75                	j	18cc <strlen+0x18>

0000000000001912 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1912:	00757713          	and	a4,a0,7
{
    1916:	87aa                	mv	a5,a0
    1918:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191c:	cb19                	beqz	a4,1932 <memchr+0x20>
    191e:	ce25                	beqz	a2,1996 <memchr+0x84>
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	00b70763          	beq	a4,a1,1932 <memchr+0x20>
    1928:	0785                	add	a5,a5,1
    192a:	0077f713          	and	a4,a5,7
    192e:	167d                	add	a2,a2,-1
    1930:	f77d                	bnez	a4,191e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1932:	4501                	li	a0,0
    if (n && *s != c)
    1934:	c235                	beqz	a2,1998 <memchr+0x86>
    1936:	0007c703          	lbu	a4,0(a5)
    193a:	06b70063          	beq	a4,a1,199a <memchr+0x88>
        size_t k = ONES * c;
    193e:	00000517          	auipc	a0,0x0
    1942:	68a53503          	ld	a0,1674(a0) # 1fc8 <__clone+0xda>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1946:	471d                	li	a4,7
        size_t k = ONES * c;
    1948:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194c:	04c77763          	bgeu	a4,a2,199a <memchr+0x88>
    1950:	00000897          	auipc	a7,0x0
    1954:	6688b883          	ld	a7,1640(a7) # 1fb8 <__clone+0xca>
    1958:	00000817          	auipc	a6,0x0
    195c:	66883803          	ld	a6,1640(a6) # 1fc0 <__clone+0xd2>
    1960:	431d                	li	t1,7
    1962:	a029                	j	196c <memchr+0x5a>
    1964:	1661                	add	a2,a2,-8
    1966:	07a1                	add	a5,a5,8
    1968:	00c37c63          	bgeu	t1,a2,1980 <memchr+0x6e>
    196c:	6398                	ld	a4,0(a5)
    196e:	8f29                	xor	a4,a4,a0
    1970:	011706b3          	add	a3,a4,a7
    1974:	fff74713          	not	a4,a4
    1978:	8f75                	and	a4,a4,a3
    197a:	01077733          	and	a4,a4,a6
    197e:	d37d                	beqz	a4,1964 <memchr+0x52>
    1980:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1982:	e601                	bnez	a2,198a <memchr+0x78>
    1984:	a809                	j	1996 <memchr+0x84>
    1986:	0505                	add	a0,a0,1
    1988:	c619                	beqz	a2,1996 <memchr+0x84>
    198a:	00054783          	lbu	a5,0(a0)
    198e:	167d                	add	a2,a2,-1
    1990:	feb79be3          	bne	a5,a1,1986 <memchr+0x74>
    1994:	8082                	ret
    return n ? (void *)s : 0;
    1996:	4501                	li	a0,0
}
    1998:	8082                	ret
    if (n && *s != c)
    199a:	853e                	mv	a0,a5
    199c:	b7fd                	j	198a <memchr+0x78>

000000000000199e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    199e:	1101                	add	sp,sp,-32
    19a0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19a2:	862e                	mv	a2,a1
{
    19a4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19a6:	4581                	li	a1,0
{
    19a8:	e426                	sd	s1,8(sp)
    19aa:	ec06                	sd	ra,24(sp)
    19ac:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19ae:	f65ff0ef          	jal	1912 <memchr>
    return p ? p - s : n;
    19b2:	c519                	beqz	a0,19c0 <strnlen+0x22>
}
    19b4:	60e2                	ld	ra,24(sp)
    19b6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19b8:	8d05                	sub	a0,a0,s1
}
    19ba:	64a2                	ld	s1,8(sp)
    19bc:	6105                	add	sp,sp,32
    19be:	8082                	ret
    19c0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19c2:	8522                	mv	a0,s0
}
    19c4:	6442                	ld	s0,16(sp)
    19c6:	64a2                	ld	s1,8(sp)
    19c8:	6105                	add	sp,sp,32
    19ca:	8082                	ret

00000000000019cc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19cc:	00a5c7b3          	xor	a5,a1,a0
    19d0:	8b9d                	and	a5,a5,7
    19d2:	eb95                	bnez	a5,1a06 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d4:	0075f793          	and	a5,a1,7
    19d8:	e7b1                	bnez	a5,1a24 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19da:	6198                	ld	a4,0(a1)
    19dc:	00000617          	auipc	a2,0x0
    19e0:	5dc63603          	ld	a2,1500(a2) # 1fb8 <__clone+0xca>
    19e4:	00000817          	auipc	a6,0x0
    19e8:	5dc83803          	ld	a6,1500(a6) # 1fc0 <__clone+0xd2>
    19ec:	a029                	j	19f6 <strcpy+0x2a>
    19ee:	05a1                	add	a1,a1,8
    19f0:	e118                	sd	a4,0(a0)
    19f2:	6198                	ld	a4,0(a1)
    19f4:	0521                	add	a0,a0,8
    19f6:	00c707b3          	add	a5,a4,a2
    19fa:	fff74693          	not	a3,a4
    19fe:	8ff5                	and	a5,a5,a3
    1a00:	0107f7b3          	and	a5,a5,a6
    1a04:	d7ed                	beqz	a5,19ee <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a06:	0005c783          	lbu	a5,0(a1)
    1a0a:	00f50023          	sb	a5,0(a0)
    1a0e:	c785                	beqz	a5,1a36 <strcpy+0x6a>
    1a10:	0015c783          	lbu	a5,1(a1)
    1a14:	0505                	add	a0,a0,1
    1a16:	0585                	add	a1,a1,1
    1a18:	00f50023          	sb	a5,0(a0)
    1a1c:	fbf5                	bnez	a5,1a10 <strcpy+0x44>
        ;
    return d;
}
    1a1e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a20:	0505                	add	a0,a0,1
    1a22:	df45                	beqz	a4,19da <strcpy+0xe>
            if (!(*d = *s))
    1a24:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a28:	0585                	add	a1,a1,1
    1a2a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a2e:	00f50023          	sb	a5,0(a0)
    1a32:	f7fd                	bnez	a5,1a20 <strcpy+0x54>
}
    1a34:	8082                	ret
    1a36:	8082                	ret

0000000000001a38 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a38:	00a5c7b3          	xor	a5,a1,a0
    1a3c:	8b9d                	and	a5,a5,7
    1a3e:	e3b5                	bnez	a5,1aa2 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a40:	0075f793          	and	a5,a1,7
    1a44:	cf99                	beqz	a5,1a62 <strncpy+0x2a>
    1a46:	ea09                	bnez	a2,1a58 <strncpy+0x20>
    1a48:	a421                	j	1c50 <strncpy+0x218>
    1a4a:	0585                	add	a1,a1,1
    1a4c:	0075f793          	and	a5,a1,7
    1a50:	167d                	add	a2,a2,-1
    1a52:	0505                	add	a0,a0,1
    1a54:	c799                	beqz	a5,1a62 <strncpy+0x2a>
    1a56:	c225                	beqz	a2,1ab6 <strncpy+0x7e>
    1a58:	0005c783          	lbu	a5,0(a1)
    1a5c:	00f50023          	sb	a5,0(a0)
    1a60:	f7ed                	bnez	a5,1a4a <strncpy+0x12>
            ;
        if (!n || !*s)
    1a62:	ca31                	beqz	a2,1ab6 <strncpy+0x7e>
    1a64:	0005c783          	lbu	a5,0(a1)
    1a68:	cba1                	beqz	a5,1ab8 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6a:	479d                	li	a5,7
    1a6c:	02c7fc63          	bgeu	a5,a2,1aa4 <strncpy+0x6c>
    1a70:	00000897          	auipc	a7,0x0
    1a74:	5488b883          	ld	a7,1352(a7) # 1fb8 <__clone+0xca>
    1a78:	00000817          	auipc	a6,0x0
    1a7c:	54883803          	ld	a6,1352(a6) # 1fc0 <__clone+0xd2>
    1a80:	431d                	li	t1,7
    1a82:	a039                	j	1a90 <strncpy+0x58>
            *wd = *ws;
    1a84:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a86:	1661                	add	a2,a2,-8
    1a88:	05a1                	add	a1,a1,8
    1a8a:	0521                	add	a0,a0,8
    1a8c:	00c37b63          	bgeu	t1,a2,1aa2 <strncpy+0x6a>
    1a90:	6198                	ld	a4,0(a1)
    1a92:	011707b3          	add	a5,a4,a7
    1a96:	fff74693          	not	a3,a4
    1a9a:	8ff5                	and	a5,a5,a3
    1a9c:	0107f7b3          	and	a5,a5,a6
    1aa0:	d3f5                	beqz	a5,1a84 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aa2:	ca11                	beqz	a2,1ab6 <strncpy+0x7e>
    1aa4:	0005c783          	lbu	a5,0(a1)
    1aa8:	0585                	add	a1,a1,1
    1aaa:	00f50023          	sb	a5,0(a0)
    1aae:	c789                	beqz	a5,1ab8 <strncpy+0x80>
    1ab0:	167d                	add	a2,a2,-1
    1ab2:	0505                	add	a0,a0,1
    1ab4:	fa65                	bnez	a2,1aa4 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ab6:	8082                	ret
    1ab8:	4805                	li	a6,1
    1aba:	14061b63          	bnez	a2,1c10 <strncpy+0x1d8>
    1abe:	40a00733          	neg	a4,a0
    1ac2:	00777793          	and	a5,a4,7
    1ac6:	4581                	li	a1,0
    1ac8:	12061c63          	bnez	a2,1c00 <strncpy+0x1c8>
    1acc:	00778693          	add	a3,a5,7
    1ad0:	48ad                	li	a7,11
    1ad2:	1316e563          	bltu	a3,a7,1bfc <strncpy+0x1c4>
    1ad6:	16d5e263          	bltu	a1,a3,1c3a <strncpy+0x202>
    1ada:	14078c63          	beqz	a5,1c32 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ade:	00050023          	sb	zero,0(a0)
    1ae2:	00677693          	and	a3,a4,6
    1ae6:	14068263          	beqz	a3,1c2a <strncpy+0x1f2>
    1aea:	000500a3          	sb	zero,1(a0)
    1aee:	4689                	li	a3,2
    1af0:	14f6f863          	bgeu	a3,a5,1c40 <strncpy+0x208>
    1af4:	00050123          	sb	zero,2(a0)
    1af8:	8b11                	and	a4,a4,4
    1afa:	12070463          	beqz	a4,1c22 <strncpy+0x1ea>
    1afe:	000501a3          	sb	zero,3(a0)
    1b02:	4711                	li	a4,4
    1b04:	00450693          	add	a3,a0,4
    1b08:	02f77563          	bgeu	a4,a5,1b32 <strncpy+0xfa>
    1b0c:	00050223          	sb	zero,4(a0)
    1b10:	4715                	li	a4,5
    1b12:	00550693          	add	a3,a0,5
    1b16:	00e78e63          	beq	a5,a4,1b32 <strncpy+0xfa>
    1b1a:	fff50713          	add	a4,a0,-1
    1b1e:	000502a3          	sb	zero,5(a0)
    1b22:	8b1d                	and	a4,a4,7
    1b24:	12071263          	bnez	a4,1c48 <strncpy+0x210>
    1b28:	00750693          	add	a3,a0,7
    1b2c:	00050323          	sb	zero,6(a0)
    1b30:	471d                	li	a4,7
    1b32:	40f80833          	sub	a6,a6,a5
    1b36:	ff887593          	and	a1,a6,-8
    1b3a:	97aa                	add	a5,a5,a0
    1b3c:	95be                	add	a1,a1,a5
    1b3e:	0007b023          	sd	zero,0(a5)
    1b42:	07a1                	add	a5,a5,8
    1b44:	feb79de3          	bne	a5,a1,1b3e <strncpy+0x106>
    1b48:	ff887593          	and	a1,a6,-8
    1b4c:	00787813          	and	a6,a6,7
    1b50:	00e587bb          	addw	a5,a1,a4
    1b54:	00b68733          	add	a4,a3,a1
    1b58:	0e080063          	beqz	a6,1c38 <strncpy+0x200>
    1b5c:	00070023          	sb	zero,0(a4)
    1b60:	0017869b          	addw	a3,a5,1
    1b64:	f4c6f9e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1b68:	000700a3          	sb	zero,1(a4)
    1b6c:	0027869b          	addw	a3,a5,2
    1b70:	f4c6f3e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1b74:	00070123          	sb	zero,2(a4)
    1b78:	0037869b          	addw	a3,a5,3
    1b7c:	f2c6fde3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1b80:	000701a3          	sb	zero,3(a4)
    1b84:	0047869b          	addw	a3,a5,4
    1b88:	f2c6f7e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1b8c:	00070223          	sb	zero,4(a4)
    1b90:	0057869b          	addw	a3,a5,5
    1b94:	f2c6f1e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1b98:	000702a3          	sb	zero,5(a4)
    1b9c:	0067869b          	addw	a3,a5,6
    1ba0:	f0c6fbe3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1ba4:	00070323          	sb	zero,6(a4)
    1ba8:	0077869b          	addw	a3,a5,7
    1bac:	f0c6f5e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1bb0:	000703a3          	sb	zero,7(a4)
    1bb4:	0087869b          	addw	a3,a5,8
    1bb8:	eec6ffe3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1bbc:	00070423          	sb	zero,8(a4)
    1bc0:	0097869b          	addw	a3,a5,9
    1bc4:	eec6f9e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1bc8:	000704a3          	sb	zero,9(a4)
    1bcc:	00a7869b          	addw	a3,a5,10
    1bd0:	eec6f3e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1bd4:	00070523          	sb	zero,10(a4)
    1bd8:	00b7869b          	addw	a3,a5,11
    1bdc:	ecc6fde3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1be0:	000705a3          	sb	zero,11(a4)
    1be4:	00c7869b          	addw	a3,a5,12
    1be8:	ecc6f7e3          	bgeu	a3,a2,1ab6 <strncpy+0x7e>
    1bec:	00070623          	sb	zero,12(a4)
    1bf0:	27b5                	addw	a5,a5,13
    1bf2:	ecc7f2e3          	bgeu	a5,a2,1ab6 <strncpy+0x7e>
    1bf6:	000706a3          	sb	zero,13(a4)
}
    1bfa:	8082                	ret
    1bfc:	46ad                	li	a3,11
    1bfe:	bde1                	j	1ad6 <strncpy+0x9e>
    1c00:	00778693          	add	a3,a5,7
    1c04:	48ad                	li	a7,11
    1c06:	fff60593          	add	a1,a2,-1
    1c0a:	ed16f6e3          	bgeu	a3,a7,1ad6 <strncpy+0x9e>
    1c0e:	b7fd                	j	1bfc <strncpy+0x1c4>
    1c10:	40a00733          	neg	a4,a0
    1c14:	8832                	mv	a6,a2
    1c16:	00777793          	and	a5,a4,7
    1c1a:	4581                	li	a1,0
    1c1c:	ea0608e3          	beqz	a2,1acc <strncpy+0x94>
    1c20:	b7c5                	j	1c00 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c22:	00350693          	add	a3,a0,3
    1c26:	470d                	li	a4,3
    1c28:	b729                	j	1b32 <strncpy+0xfa>
    1c2a:	00150693          	add	a3,a0,1
    1c2e:	4705                	li	a4,1
    1c30:	b709                	j	1b32 <strncpy+0xfa>
tail:
    1c32:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c34:	4701                	li	a4,0
    1c36:	bdf5                	j	1b32 <strncpy+0xfa>
    1c38:	8082                	ret
tail:
    1c3a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3c:	4781                	li	a5,0
    1c3e:	bf39                	j	1b5c <strncpy+0x124>
    1c40:	00250693          	add	a3,a0,2
    1c44:	4709                	li	a4,2
    1c46:	b5f5                	j	1b32 <strncpy+0xfa>
    1c48:	00650693          	add	a3,a0,6
    1c4c:	4719                	li	a4,6
    1c4e:	b5d5                	j	1b32 <strncpy+0xfa>
    1c50:	8082                	ret

0000000000001c52 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c52:	87aa                	mv	a5,a0
    1c54:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c56:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c5a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c5e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c60:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c62:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <openat>:
    register long a7 __asm__("a7") = n;
    1c6a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c6e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c72:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <close>:
    register long a7 __asm__("a7") = n;
    1c7a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c7e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <read>:
    register long a7 __asm__("a7") = n;
    1c86:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c8e:	8082                	ret

0000000000001c90 <write>:
    register long a7 __asm__("a7") = n;
    1c90:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c94:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c98:	8082                	ret

0000000000001c9a <getpid>:
    register long a7 __asm__("a7") = n;
    1c9a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c9e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <getppid>:
    register long a7 __asm__("a7") = n;
    1ca6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1caa:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cb6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <fork>:
    register long a7 __asm__("a7") = n;
    1cbe:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cce:	85b2                	mv	a1,a2
    1cd0:	863a                	mv	a2,a4
    if (stack)
    1cd2:	c191                	beqz	a1,1cd6 <clone+0x8>
	stack += stack_size;
    1cd4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cd6:	4781                	li	a5,0
    1cd8:	4701                	li	a4,0
    1cda:	4681                	li	a3,0
    1cdc:	2601                	sext.w	a2,a2
    1cde:	ac01                	j	1eee <__clone>

0000000000001ce0 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1ce0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ce4:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1ce8:	8082                	ret

0000000000001cea <exit>:
    register long a7 __asm__("a7") = n;
    1cea:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cee:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cf2:	8082                	ret

0000000000001cf4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cf4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cf8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfa:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <exec>:
    register long a7 __asm__("a7") = n;
    1d02:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d06:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <execve>:
    register long a7 __asm__("a7") = n;
    1d0e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d12:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <times>:
    register long a7 __asm__("a7") = n;
    1d1a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d1e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <get_time>:

int64 get_time()
{
    1d26:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d28:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d2c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d2e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d30:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d34:	2501                	sext.w	a0,a0
    1d36:	ed09                	bnez	a0,1d50 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d38:	67a2                	ld	a5,8(sp)
    1d3a:	3e800713          	li	a4,1000
    1d3e:	00015503          	lhu	a0,0(sp)
    1d42:	02e7d7b3          	divu	a5,a5,a4
    1d46:	02e50533          	mul	a0,a0,a4
    1d4a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d4c:	0141                	add	sp,sp,16
    1d4e:	8082                	ret
        return -1;
    1d50:	557d                	li	a0,-1
    1d52:	bfed                	j	1d4c <get_time+0x26>

0000000000001d54 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d54:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d58:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <time>:
    register long a7 __asm__("a7") = n;
    1d60:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <sleep>:

int sleep(unsigned long long time)
{
    1d6c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d6e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d70:	850a                	mv	a0,sp
    1d72:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d74:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d78:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7e:	e501                	bnez	a0,1d86 <sleep+0x1a>
    return 0;
    1d80:	4501                	li	a0,0
}
    1d82:	0141                	add	sp,sp,16
    1d84:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d86:	4502                	lw	a0,0(sp)
}
    1d88:	0141                	add	sp,sp,16
    1d8a:	8082                	ret

0000000000001d8c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d8c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d90:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d98:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d9c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1da0:	8082                	ret

0000000000001da2 <mprotect>:
    register long a7 __asm__("a7") = n;
    1da2:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <munmap>:
    register long a7 __asm__("a7") = n;
    1dae:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <wait>:

int wait(int *code)
{
    1dba:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dbc:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dc0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dc2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dc4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <spawn>:
    register long a7 __asm__("a7") = n;
    1dce:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <mailread>:
    register long a7 __asm__("a7") = n;
    1dda:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1de6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <fstat>:
    register long a7 __asm__("a7") = n;
    1df2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dfe:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e00:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e04:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e06:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e0e:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e10:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e14:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e16:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e1e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e20:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e24:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e26:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <link>:

int link(char *old_path, char *new_path)
{
    1e2e:	87aa                	mv	a5,a0
    1e30:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e32:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e40:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e42:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <unlink>:

int unlink(char *path)
{
    1e4a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e4c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e54:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e56:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <uname>:
    register long a7 __asm__("a7") = n;
    1e5e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <brk>:
    register long a7 __asm__("a7") = n;
    1e6a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e76:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e7c:	8082                	ret

0000000000001e7e <chdir>:
    register long a7 __asm__("a7") = n;
    1e7e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e8a:	862e                	mv	a2,a1
    1e8c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e8e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e90:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e94:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e98:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <dup>:
    register long a7 __asm__("a7") = n;
    1ebe:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <dup2>:
    register long a7 __asm__("a7") = n;
    1ec8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eca:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ecc:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <mount>:
    register long a7 __asm__("a7") = n;
    1ed4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <umount>:
    register long a7 __asm__("a7") = n;
    1ee0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eee:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ef0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ef2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef4:	8532                	mv	a0,a2
	mv a2, a4
    1ef6:	863a                	mv	a2,a4
	mv a3, a5
    1ef8:	86be                	mv	a3,a5
	mv a4, a6
    1efa:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1efc:	0dc00893          	li	a7,220
	ecall
    1f00:	00000073          	ecall

	beqz a0, 1f
    1f04:	c111                	beqz	a0,1f08 <__clone+0x1a>
	# Parent
	ret
    1f06:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f08:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f0a:	6522                	ld	a0,8(sp)
	jalr a1
    1f0c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f0e:	05d00893          	li	a7,93
	ecall
    1f12:	00000073          	ecall
