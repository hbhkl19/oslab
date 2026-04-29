
/home/hbh/oslab/oslab/user/build/riscv64/umount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa21                	j	111a <__start_main>

0000000000001004 <test_umount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_umount() {
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f4a50513          	add	a0,a0,-182 # 1f50 <__clone+0x28>
void test_umount() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1012:	360000ef          	jal	1372 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	08a50513          	add	a0,a0,138 # 20a0 <__func__.0>
    101e:	354000ef          	jal	1372 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f4650513          	add	a0,a0,-186 # 1f68 <__clone+0x40>
    102a:	348000ef          	jal	1372 <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    102e:	00001617          	auipc	a2,0x1
    1032:	ff260613          	add	a2,a2,-14 # 2020 <mntpoint>
    1036:	00001597          	auipc	a1,0x1
    103a:	02a58593          	add	a1,a1,42 # 2060 <device>
    103e:	00001517          	auipc	a0,0x1
    1042:	f3a50513          	add	a0,a0,-198 # 1f78 <__clone+0x50>
    1046:	34e000ef          	jal	1394 <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104a:	00001597          	auipc	a1,0x1
    104e:	fd658593          	add	a1,a1,-42 # 2020 <mntpoint>
    1052:	4701                	li	a4,0
    1054:	4681                	li	a3,0
    1056:	00001617          	auipc	a2,0x1
    105a:	f3a60613          	add	a2,a2,-198 # 1f90 <__clone+0x68>
    105e:	00001517          	auipc	a0,0x1
    1062:	00250513          	add	a0,a0,2 # 2060 <device>
    1066:	6a9000ef          	jal	1f0e <mount>
    106a:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106c:	85aa                	mv	a1,a0
    106e:	00001517          	auipc	a0,0x1
    1072:	f2a50513          	add	a0,a0,-214 # 1f98 <__clone+0x70>
    1076:	31e000ef          	jal	1394 <printf>

	if (ret == 0) {
    107a:	c40d                	beqz	s0,10a4 <test_umount+0xa0>
		ret = umount(mntpoint);
		assert(ret == 0);
		printf("umount success.\nreturn: %d\n", ret);
	}

	TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f7450513          	add	a0,a0,-140 # 1ff0 <__clone+0xc8>
    1084:	2ee000ef          	jal	1372 <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	01850513          	add	a0,a0,24 # 20a0 <__func__.0>
    1090:	2e2000ef          	jal	1372 <puts>
}
    1094:	6442                	ld	s0,16(sp)
    1096:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	ed050513          	add	a0,a0,-304 # 1f68 <__clone+0x40>
}
    10a0:	6105                	add	sp,sp,32
	TEST_END(__func__);
    10a2:	acc1                	j	1372 <puts>
		ret = umount(mntpoint);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f7c50513          	add	a0,a0,-132 # 2020 <mntpoint>
    10ac:	66f000ef          	jal	1f1a <umount>
    10b0:	85aa                	mv	a1,a0
		assert(ret == 0);
    10b2:	e901                	bnez	a0,10c2 <test_umount+0xbe>
		printf("umount success.\nreturn: %d\n", ret);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	f1c50513          	add	a0,a0,-228 # 1fd0 <__clone+0xa8>
    10bc:	2d8000ef          	jal	1394 <printf>
    10c0:	bf75                	j	107c <test_umount+0x78>
    10c2:	e42a                	sd	a0,8(sp)
		assert(ret == 0);
    10c4:	00001517          	auipc	a0,0x1
    10c8:	eec50513          	add	a0,a0,-276 # 1fb0 <__clone+0x88>
    10cc:	542000ef          	jal	160e <panic>
    10d0:	65a2                	ld	a1,8(sp)
    10d2:	b7cd                	j	10b4 <test_umount+0xb0>

00000000000010d4 <main>:

int main(int argc,char *argv[]) {
    10d4:	1101                	add	sp,sp,-32
    10d6:	ec06                	sd	ra,24(sp)
    10d8:	e822                	sd	s0,16(sp)
    10da:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    10dc:	4785                	li	a5,1
    10de:	00a7ca63          	blt	a5,a0,10f2 <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_umount();
    10e2:	f23ff0ef          	jal	1004 <test_umount>
	return 0;
}
    10e6:	60e2                	ld	ra,24(sp)
    10e8:	6442                	ld	s0,16(sp)
    10ea:	64a2                	ld	s1,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	6105                	add	sp,sp,32
    10f0:	8082                	ret
		strcpy(device, argv[1]);
    10f2:	84ae                	mv	s1,a1
    10f4:	658c                	ld	a1,8(a1)
    10f6:	842a                	mv	s0,a0
    10f8:	00001517          	auipc	a0,0x1
    10fc:	f6850513          	add	a0,a0,-152 # 2060 <device>
    1100:	107000ef          	jal	1a06 <strcpy>
	if(argc >= 3){
    1104:	4789                	li	a5,2
    1106:	fcf40ee3          	beq	s0,a5,10e2 <main+0xe>
		strcpy(mntpoint, argv[2]);
    110a:	688c                	ld	a1,16(s1)
    110c:	00001517          	auipc	a0,0x1
    1110:	f1450513          	add	a0,a0,-236 # 2020 <mntpoint>
    1114:	0f3000ef          	jal	1a06 <strcpy>
    1118:	b7e9                	j	10e2 <main+0xe>

000000000000111a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    111a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    111c:	4108                	lw	a0,0(a0)
{
    111e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1120:	05a1                	add	a1,a1,8
{
    1122:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1124:	fb1ff0ef          	jal	10d4 <main>
    1128:	3fd000ef          	jal	1d24 <exit>
	return 0;
}
    112c:	60a2                	ld	ra,8(sp)
    112e:	4501                	li	a0,0
    1130:	0141                	add	sp,sp,16
    1132:	8082                	ret

0000000000001134 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1134:	7179                	add	sp,sp,-48
    1136:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1138:	12054863          	bltz	a0,1268 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    113c:	02b577bb          	remuw	a5,a0,a1
    1140:	00001697          	auipc	a3,0x1
    1144:	f7068693          	add	a3,a3,-144 # 20b0 <digits>
    buf[16] = 0;
    1148:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    114c:	0005871b          	sext.w	a4,a1
    1150:	1782                	sll	a5,a5,0x20
    1152:	9381                	srl	a5,a5,0x20
    1154:	97b6                	add	a5,a5,a3
    1156:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    115a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    115e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1162:	1ab56663          	bltu	a0,a1,130e <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1166:	02e8763b          	remuw	a2,a6,a4
    116a:	1602                	sll	a2,a2,0x20
    116c:	9201                	srl	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1178:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    117c:	12e86c63          	bltu	a6,a4,12b4 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1180:	02e5f63b          	remuw	a2,a1,a4
    1184:	1602                	sll	a2,a2,0x20
    1186:	9201                	srl	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1192:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1196:	12e5e863          	bltu	a1,a4,12c6 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    119a:	02e8763b          	remuw	a2,a6,a4
    119e:	1602                	sll	a2,a2,0x20
    11a0:	9201                	srl	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ac:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11b0:	12e86463          	bltu	a6,a4,12d8 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11b4:	02e5f63b          	remuw	a2,a1,a4
    11b8:	1602                	sll	a2,a2,0x20
    11ba:	9201                	srl	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11c6:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11ca:	12e5e063          	bltu	a1,a4,12ea <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11ce:	02e8763b          	remuw	a2,a6,a4
    11d2:	1602                	sll	a2,a2,0x20
    11d4:	9201                	srl	a2,a2,0x20
    11d6:	9636                	add	a2,a2,a3
    11d8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11dc:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11e0:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11e4:	0ae86f63          	bltu	a6,a4,12a2 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11e8:	02e5f63b          	remuw	a2,a1,a4
    11ec:	1602                	sll	a2,a2,0x20
    11ee:	9201                	srl	a2,a2,0x20
    11f0:	9636                	add	a2,a2,a3
    11f2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11fa:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11fe:	0ee5ef63          	bltu	a1,a4,12fc <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    1202:	02e8763b          	remuw	a2,a6,a4
    1206:	1602                	sll	a2,a2,0x20
    1208:	9201                	srl	a2,a2,0x20
    120a:	9636                	add	a2,a2,a3
    120c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1210:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1214:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1218:	0ee86d63          	bltu	a6,a4,1312 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    121c:	02e5f63b          	remuw	a2,a1,a4
    1220:	1602                	sll	a2,a2,0x20
    1222:	9201                	srl	a2,a2,0x20
    1224:	9636                	add	a2,a2,a3
    1226:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    122e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1232:	0ee5e963          	bltu	a1,a4,1324 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    1236:	1782                	sll	a5,a5,0x20
    1238:	9381                	srl	a5,a5,0x20
    123a:	96be                	add	a3,a3,a5
    123c:	0006c783          	lbu	a5,0(a3)
    1240:	4599                	li	a1,6
    1242:	00f10723          	sb	a5,14(sp)

    if (sign)
    1246:	00055763          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1252:	4595                	li	a1,5
    write(f, s, l);
    1254:	003c                	add	a5,sp,8
    1256:	4641                	li	a2,16
    1258:	9e0d                	subw	a2,a2,a1
    125a:	4505                	li	a0,1
    125c:	95be                	add	a1,a1,a5
    125e:	26d000ef          	jal	1cca <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1262:	70a2                	ld	ra,40(sp)
    1264:	6145                	add	sp,sp,48
    1266:	8082                	ret
        x = -xx;
    1268:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    126c:	02b677bb          	remuw	a5,a2,a1
    1270:	00001697          	auipc	a3,0x1
    1274:	e4068693          	add	a3,a3,-448 # 20b0 <digits>
    buf[16] = 0;
    1278:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    127c:	0005871b          	sext.w	a4,a1
    1280:	1782                	sll	a5,a5,0x20
    1282:	9381                	srl	a5,a5,0x20
    1284:	97b6                	add	a5,a5,a3
    1286:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    128a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    128e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1292:	ecb67ae3          	bgeu	a2,a1,1166 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    129e:	45b9                	li	a1,14
    12a0:	bf55                	j	1254 <printint.constprop.0+0x120>
    12a2:	45a9                	li	a1,10
    if (sign)
    12a4:	fa0558e3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12b0:	45a5                	li	a1,9
    12b2:	b74d                	j	1254 <printint.constprop.0+0x120>
    12b4:	45b9                	li	a1,14
    if (sign)
    12b6:	f8055fe3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12c2:	45b5                	li	a1,13
    12c4:	bf41                	j	1254 <printint.constprop.0+0x120>
    12c6:	45b5                	li	a1,13
    if (sign)
    12c8:	f80556e3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12d4:	45b1                	li	a1,12
    12d6:	bfbd                	j	1254 <printint.constprop.0+0x120>
    12d8:	45b1                	li	a1,12
    if (sign)
    12da:	f6055de3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12e6:	45ad                	li	a1,11
    12e8:	b7b5                	j	1254 <printint.constprop.0+0x120>
    12ea:	45ad                	li	a1,11
    if (sign)
    12ec:	f60554e3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12f8:	45a9                	li	a1,10
    12fa:	bfa9                	j	1254 <printint.constprop.0+0x120>
    12fc:	45a5                	li	a1,9
    if (sign)
    12fe:	f4055be3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    130a:	45a1                	li	a1,8
    130c:	b7a1                	j	1254 <printint.constprop.0+0x120>
    i = 15;
    130e:	45bd                	li	a1,15
    1310:	b791                	j	1254 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    1312:	45a1                	li	a1,8
    if (sign)
    1314:	f40550e3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1320:	459d                	li	a1,7
    1322:	bf0d                	j	1254 <printint.constprop.0+0x120>
    1324:	459d                	li	a1,7
    if (sign)
    1326:	f20557e3          	bgez	a0,1254 <printint.constprop.0+0x120>
        buf[i--] = '-';
    132a:	02d00793          	li	a5,45
    132e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1332:	4599                	li	a1,6
    1334:	b705                	j	1254 <printint.constprop.0+0x120>

0000000000001336 <getchar>:
{
    1336:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1338:	00f10593          	add	a1,sp,15
    133c:	4605                	li	a2,1
    133e:	4501                	li	a0,0
{
    1340:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1342:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1346:	17b000ef          	jal	1cc0 <read>
}
    134a:	60e2                	ld	ra,24(sp)
    134c:	00f14503          	lbu	a0,15(sp)
    1350:	6105                	add	sp,sp,32
    1352:	8082                	ret

0000000000001354 <putchar>:
{
    1354:	1101                	add	sp,sp,-32
    1356:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1358:	00f10593          	add	a1,sp,15
    135c:	4605                	li	a2,1
    135e:	4505                	li	a0,1
{
    1360:	ec06                	sd	ra,24(sp)
    char byte = c;
    1362:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1366:	165000ef          	jal	1cca <write>
}
    136a:	60e2                	ld	ra,24(sp)
    136c:	2501                	sext.w	a0,a0
    136e:	6105                	add	sp,sp,32
    1370:	8082                	ret

0000000000001372 <puts>:
{
    1372:	1141                	add	sp,sp,-16
    1374:	e406                	sd	ra,8(sp)
    1376:	e022                	sd	s0,0(sp)
    1378:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    137a:	574000ef          	jal	18ee <strlen>
    137e:	862a                	mv	a2,a0
    1380:	85a2                	mv	a1,s0
    1382:	4505                	li	a0,1
    1384:	147000ef          	jal	1cca <write>
}
    1388:	60a2                	ld	ra,8(sp)
    138a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    138c:	957d                	sra	a0,a0,0x3f
    return r;
    138e:	2501                	sext.w	a0,a0
}
    1390:	0141                	add	sp,sp,16
    1392:	8082                	ret

0000000000001394 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1394:	7171                	add	sp,sp,-176
    1396:	f85a                	sd	s6,48(sp)
    1398:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    139a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    139c:	18bc                	add	a5,sp,120
{
    139e:	e8ca                	sd	s2,80(sp)
    13a0:	e4ce                	sd	s3,72(sp)
    13a2:	e0d2                	sd	s4,64(sp)
    13a4:	fc56                	sd	s5,56(sp)
    13a6:	f486                	sd	ra,104(sp)
    13a8:	f0a2                	sd	s0,96(sp)
    13aa:	eca6                	sd	s1,88(sp)
    13ac:	fcae                	sd	a1,120(sp)
    13ae:	e132                	sd	a2,128(sp)
    13b0:	e536                	sd	a3,136(sp)
    13b2:	e93a                	sd	a4,144(sp)
    13b4:	f142                	sd	a6,160(sp)
    13b6:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13b8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13ba:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13be:	07300a13          	li	s4,115
    13c2:	07800a93          	li	s5,120
    buf[i++] = '0';
    13c6:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ca:	00001997          	auipc	s3,0x1
    13ce:	ce698993          	add	s3,s3,-794 # 20b0 <digits>
        if (!*s)
    13d2:	00054783          	lbu	a5,0(a0)
    13d6:	16078a63          	beqz	a5,154a <printf+0x1b6>
    13da:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13dc:	19278d63          	beq	a5,s2,1576 <printf+0x1e2>
    13e0:	00164783          	lbu	a5,1(a2)
    13e4:	0605                	add	a2,a2,1
    13e6:	fbfd                	bnez	a5,13dc <printf+0x48>
    13e8:	84b2                	mv	s1,a2
        l = z - a;
    13ea:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13ee:	85aa                	mv	a1,a0
    13f0:	8622                	mv	a2,s0
    13f2:	4505                	li	a0,1
    13f4:	0d7000ef          	jal	1cca <write>
        if (l)
    13f8:	1a041463          	bnez	s0,15a0 <printf+0x20c>
        if (s[1] == 0)
    13fc:	0014c783          	lbu	a5,1(s1)
    1400:	14078563          	beqz	a5,154a <printf+0x1b6>
        switch (s[1])
    1404:	1b478063          	beq	a5,s4,15a4 <printf+0x210>
    1408:	14fa6b63          	bltu	s4,a5,155e <printf+0x1ca>
    140c:	06400713          	li	a4,100
    1410:	1ee78063          	beq	a5,a4,15f0 <printf+0x25c>
    1414:	07000713          	li	a4,112
    1418:	1ae79963          	bne	a5,a4,15ca <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    141c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    141e:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1422:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1424:	631c                	ld	a5,0(a4)
    1426:	0721                	add	a4,a4,8
    1428:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    142a:	00479293          	sll	t0,a5,0x4
    142e:	00879f93          	sll	t6,a5,0x8
    1432:	00c79f13          	sll	t5,a5,0xc
    1436:	01079e93          	sll	t4,a5,0x10
    143a:	01479e13          	sll	t3,a5,0x14
    143e:	01879313          	sll	t1,a5,0x18
    1442:	01c79893          	sll	a7,a5,0x1c
    1446:	02479813          	sll	a6,a5,0x24
    144a:	02879513          	sll	a0,a5,0x28
    144e:	02c79593          	sll	a1,a5,0x2c
    1452:	03079693          	sll	a3,a5,0x30
    1456:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145a:	03c7d413          	srl	s0,a5,0x3c
    145e:	01c7d39b          	srlw	t2,a5,0x1c
    1462:	03c2d293          	srl	t0,t0,0x3c
    1466:	03cfdf93          	srl	t6,t6,0x3c
    146a:	03cf5f13          	srl	t5,t5,0x3c
    146e:	03cede93          	srl	t4,t4,0x3c
    1472:	03ce5e13          	srl	t3,t3,0x3c
    1476:	03c35313          	srl	t1,t1,0x3c
    147a:	03c8d893          	srl	a7,a7,0x3c
    147e:	03c85813          	srl	a6,a6,0x3c
    1482:	9171                	srl	a0,a0,0x3c
    1484:	91f1                	srl	a1,a1,0x3c
    1486:	92f1                	srl	a3,a3,0x3c
    1488:	9371                	srl	a4,a4,0x3c
    148a:	96ce                	add	a3,a3,s3
    148c:	974e                	add	a4,a4,s3
    148e:	944e                	add	s0,s0,s3
    1490:	92ce                	add	t0,t0,s3
    1492:	9fce                	add	t6,t6,s3
    1494:	9f4e                	add	t5,t5,s3
    1496:	9ece                	add	t4,t4,s3
    1498:	9e4e                	add	t3,t3,s3
    149a:	934e                	add	t1,t1,s3
    149c:	98ce                	add	a7,a7,s3
    149e:	93ce                	add	t2,t2,s3
    14a0:	984e                	add	a6,a6,s3
    14a2:	954e                	add	a0,a0,s3
    14a4:	95ce                	add	a1,a1,s3
    14a6:	0006c083          	lbu	ra,0(a3)
    14aa:	0002c283          	lbu	t0,0(t0)
    14ae:	00074683          	lbu	a3,0(a4)
    14b2:	000fcf83          	lbu	t6,0(t6)
    14b6:	000f4f03          	lbu	t5,0(t5)
    14ba:	000ece83          	lbu	t4,0(t4)
    14be:	000e4e03          	lbu	t3,0(t3)
    14c2:	00034303          	lbu	t1,0(t1)
    14c6:	0008c883          	lbu	a7,0(a7)
    14ca:	0003c383          	lbu	t2,0(t2)
    14ce:	00084803          	lbu	a6,0(a6)
    14d2:	00054503          	lbu	a0,0(a0)
    14d6:	0005c583          	lbu	a1,0(a1)
    14da:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14de:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e2:	9371                	srl	a4,a4,0x3c
    14e4:	8bbd                	and	a5,a5,15
    14e6:	974e                	add	a4,a4,s3
    14e8:	97ce                	add	a5,a5,s3
    14ea:	005105a3          	sb	t0,11(sp)
    14ee:	01f10623          	sb	t6,12(sp)
    14f2:	01e106a3          	sb	t5,13(sp)
    14f6:	01d10723          	sb	t4,14(sp)
    14fa:	01c107a3          	sb	t3,15(sp)
    14fe:	00610823          	sb	t1,16(sp)
    1502:	011108a3          	sb	a7,17(sp)
    1506:	00710923          	sb	t2,18(sp)
    150a:	010109a3          	sb	a6,19(sp)
    150e:	00a10a23          	sb	a0,20(sp)
    1512:	00b10aa3          	sb	a1,21(sp)
    1516:	00110b23          	sb	ra,22(sp)
    151a:	00d10ba3          	sb	a3,23(sp)
    151e:	00810523          	sb	s0,10(sp)
    1522:	00074703          	lbu	a4,0(a4)
    1526:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    152a:	002c                	add	a1,sp,8
    152c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    152e:	00e10c23          	sb	a4,24(sp)
    1532:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1536:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    153a:	790000ef          	jal	1cca <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    153e:	00248513          	add	a0,s1,2
        if (!*s)
    1542:	00054783          	lbu	a5,0(a0)
    1546:	e8079ae3          	bnez	a5,13da <printf+0x46>
    }
    va_end(ap);
}
    154a:	70a6                	ld	ra,104(sp)
    154c:	7406                	ld	s0,96(sp)
    154e:	64e6                	ld	s1,88(sp)
    1550:	6946                	ld	s2,80(sp)
    1552:	69a6                	ld	s3,72(sp)
    1554:	6a06                	ld	s4,64(sp)
    1556:	7ae2                	ld	s5,56(sp)
    1558:	7b42                	ld	s6,48(sp)
    155a:	614d                	add	sp,sp,176
    155c:	8082                	ret
        switch (s[1])
    155e:	07579663          	bne	a5,s5,15ca <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1562:	6782                	ld	a5,0(sp)
    1564:	45c1                	li	a1,16
    1566:	4388                	lw	a0,0(a5)
    1568:	07a1                	add	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	bc9ff0ef          	jal	1134 <printint.constprop.0>
        s += 2;
    1570:	00248513          	add	a0,s1,2
    1574:	b7f9                	j	1542 <printf+0x1ae>
    1576:	84b2                	mv	s1,a2
    1578:	a039                	j	1586 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    157a:	0024c783          	lbu	a5,2(s1)
    157e:	0605                	add	a2,a2,1
    1580:	0489                	add	s1,s1,2
    1582:	e72794e3          	bne	a5,s2,13ea <printf+0x56>
    1586:	0014c783          	lbu	a5,1(s1)
    158a:	ff2788e3          	beq	a5,s2,157a <printf+0x1e6>
        l = z - a;
    158e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1592:	85aa                	mv	a1,a0
    1594:	8622                	mv	a2,s0
    1596:	4505                	li	a0,1
    1598:	732000ef          	jal	1cca <write>
        if (l)
    159c:	e60400e3          	beqz	s0,13fc <printf+0x68>
    15a0:	8526                	mv	a0,s1
    15a2:	bd05                	j	13d2 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15a4:	6782                	ld	a5,0(sp)
    15a6:	6380                	ld	s0,0(a5)
    15a8:	07a1                	add	a5,a5,8
    15aa:	e03e                	sd	a5,0(sp)
    15ac:	cc21                	beqz	s0,1604 <printf+0x270>
            l = strnlen(a, 200);
    15ae:	0c800593          	li	a1,200
    15b2:	8522                	mv	a0,s0
    15b4:	424000ef          	jal	19d8 <strnlen>
    write(f, s, l);
    15b8:	0005061b          	sext.w	a2,a0
    15bc:	85a2                	mv	a1,s0
    15be:	4505                	li	a0,1
    15c0:	70a000ef          	jal	1cca <write>
        s += 2;
    15c4:	00248513          	add	a0,s1,2
    15c8:	bfad                	j	1542 <printf+0x1ae>
    return write(stdout, &byte, 1);
    15ca:	4605                	li	a2,1
    15cc:	002c                	add	a1,sp,8
    15ce:	4505                	li	a0,1
    char byte = c;
    15d0:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15d4:	6f6000ef          	jal	1cca <write>
    char byte = c;
    15d8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15dc:	4605                	li	a2,1
    15de:	002c                	add	a1,sp,8
    15e0:	4505                	li	a0,1
    char byte = c;
    15e2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e6:	6e4000ef          	jal	1cca <write>
        s += 2;
    15ea:	00248513          	add	a0,s1,2
    15ee:	bf91                	j	1542 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15f0:	6782                	ld	a5,0(sp)
    15f2:	45a9                	li	a1,10
    15f4:	4388                	lw	a0,0(a5)
    15f6:	07a1                	add	a5,a5,8
    15f8:	e03e                	sd	a5,0(sp)
    15fa:	b3bff0ef          	jal	1134 <printint.constprop.0>
        s += 2;
    15fe:	00248513          	add	a0,s1,2
    1602:	b781                	j	1542 <printf+0x1ae>
                a = "(null)";
    1604:	00001417          	auipc	s0,0x1
    1608:	9fc40413          	add	s0,s0,-1540 # 2000 <__clone+0xd8>
    160c:	b74d                	j	15ae <printf+0x21a>

000000000000160e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    160e:	1141                	add	sp,sp,-16
    1610:	e406                	sd	ra,8(sp)
    puts(m);
    1612:	d61ff0ef          	jal	1372 <puts>
    exit(-100);
}
    1616:	60a2                	ld	ra,8(sp)
    exit(-100);
    1618:	f9c00513          	li	a0,-100
}
    161c:	0141                	add	sp,sp,16
    exit(-100);
    161e:	a719                	j	1d24 <exit>

0000000000001620 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1620:	02000793          	li	a5,32
    1624:	00f50663          	beq	a0,a5,1630 <isspace+0x10>
    1628:	355d                	addw	a0,a0,-9
    162a:	00553513          	sltiu	a0,a0,5
    162e:	8082                	ret
    1630:	4505                	li	a0,1
}
    1632:	8082                	ret

0000000000001634 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1634:	fd05051b          	addw	a0,a0,-48
}
    1638:	00a53513          	sltiu	a0,a0,10
    163c:	8082                	ret

000000000000163e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    163e:	02000693          	li	a3,32
    1642:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1644:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1648:	ff77871b          	addw	a4,a5,-9
    164c:	04d78c63          	beq	a5,a3,16a4 <atoi+0x66>
    1650:	0007861b          	sext.w	a2,a5
    1654:	04e5f863          	bgeu	a1,a4,16a4 <atoi+0x66>
        s++;
    switch (*s)
    1658:	02b00713          	li	a4,43
    165c:	04e78963          	beq	a5,a4,16ae <atoi+0x70>
    1660:	02d00713          	li	a4,45
    1664:	06e78263          	beq	a5,a4,16c8 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1668:	fd06069b          	addw	a3,a2,-48
    166c:	47a5                	li	a5,9
    166e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1670:	4301                	li	t1,0
    while (isdigit(*s))
    1672:	04d7e963          	bltu	a5,a3,16c4 <atoi+0x86>
    int n = 0, neg = 0;
    1676:	4501                	li	a0,0
    while (isdigit(*s))
    1678:	48a5                	li	a7,9
    167a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    167e:	0025179b          	sllw	a5,a0,0x2
    1682:	9fa9                	addw	a5,a5,a0
    1684:	fd06059b          	addw	a1,a2,-48
    1688:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    168c:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1690:	0705                	add	a4,a4,1
    1692:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1696:	0006861b          	sext.w	a2,a3
    169a:	ff08f0e3          	bgeu	a7,a6,167a <atoi+0x3c>
    return neg ? n : -n;
    169e:	00030563          	beqz	t1,16a8 <atoi+0x6a>
}
    16a2:	8082                	ret
        s++;
    16a4:	0505                	add	a0,a0,1
    16a6:	bf79                	j	1644 <atoi+0x6>
    return neg ? n : -n;
    16a8:	40f5853b          	subw	a0,a1,a5
    16ac:	8082                	ret
    while (isdigit(*s))
    16ae:	00154603          	lbu	a2,1(a0)
    16b2:	47a5                	li	a5,9
        s++;
    16b4:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16b8:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16bc:	4301                	li	t1,0
    while (isdigit(*s))
    16be:	2601                	sext.w	a2,a2
    16c0:	fad7fbe3          	bgeu	a5,a3,1676 <atoi+0x38>
    16c4:	4501                	li	a0,0
}
    16c6:	8082                	ret
    while (isdigit(*s))
    16c8:	00154603          	lbu	a2,1(a0)
    16cc:	47a5                	li	a5,9
        s++;
    16ce:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16d2:	fd06069b          	addw	a3,a2,-48
    16d6:	2601                	sext.w	a2,a2
    16d8:	fed7e6e3          	bltu	a5,a3,16c4 <atoi+0x86>
        neg = 1;
    16dc:	4305                	li	t1,1
    16de:	bf61                	j	1676 <atoi+0x38>

00000000000016e0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16e0:	18060163          	beqz	a2,1862 <memset+0x182>
    16e4:	40a006b3          	neg	a3,a0
    16e8:	0076f793          	and	a5,a3,7
    16ec:	00778813          	add	a6,a5,7
    16f0:	48ad                	li	a7,11
    16f2:	0ff5f713          	zext.b	a4,a1
    16f6:	fff60593          	add	a1,a2,-1
    16fa:	17186563          	bltu	a6,a7,1864 <memset+0x184>
    16fe:	1705ed63          	bltu	a1,a6,1878 <memset+0x198>
    1702:	16078363          	beqz	a5,1868 <memset+0x188>
    1706:	00e50023          	sb	a4,0(a0)
    170a:	0066f593          	and	a1,a3,6
    170e:	16058063          	beqz	a1,186e <memset+0x18e>
    1712:	00e500a3          	sb	a4,1(a0)
    1716:	4589                	li	a1,2
    1718:	16f5f363          	bgeu	a1,a5,187e <memset+0x19e>
    171c:	00e50123          	sb	a4,2(a0)
    1720:	8a91                	and	a3,a3,4
    1722:	00350593          	add	a1,a0,3
    1726:	4e0d                	li	t3,3
    1728:	ce9d                	beqz	a3,1766 <memset+0x86>
    172a:	00e501a3          	sb	a4,3(a0)
    172e:	4691                	li	a3,4
    1730:	00450593          	add	a1,a0,4
    1734:	4e11                	li	t3,4
    1736:	02f6f863          	bgeu	a3,a5,1766 <memset+0x86>
    173a:	00e50223          	sb	a4,4(a0)
    173e:	4695                	li	a3,5
    1740:	00550593          	add	a1,a0,5
    1744:	4e15                	li	t3,5
    1746:	02d78063          	beq	a5,a3,1766 <memset+0x86>
    174a:	fff50693          	add	a3,a0,-1
    174e:	00e502a3          	sb	a4,5(a0)
    1752:	8a9d                	and	a3,a3,7
    1754:	00650593          	add	a1,a0,6
    1758:	4e19                	li	t3,6
    175a:	e691                	bnez	a3,1766 <memset+0x86>
    175c:	00750593          	add	a1,a0,7
    1760:	00e50323          	sb	a4,6(a0)
    1764:	4e1d                	li	t3,7
    1766:	00871693          	sll	a3,a4,0x8
    176a:	01071813          	sll	a6,a4,0x10
    176e:	8ed9                	or	a3,a3,a4
    1770:	01871893          	sll	a7,a4,0x18
    1774:	0106e6b3          	or	a3,a3,a6
    1778:	0116e6b3          	or	a3,a3,a7
    177c:	02071813          	sll	a6,a4,0x20
    1780:	02871313          	sll	t1,a4,0x28
    1784:	0106e6b3          	or	a3,a3,a6
    1788:	40f608b3          	sub	a7,a2,a5
    178c:	03071813          	sll	a6,a4,0x30
    1790:	0066e6b3          	or	a3,a3,t1
    1794:	0106e6b3          	or	a3,a3,a6
    1798:	03871313          	sll	t1,a4,0x38
    179c:	97aa                	add	a5,a5,a0
    179e:	ff88f813          	and	a6,a7,-8
    17a2:	0066e6b3          	or	a3,a3,t1
    17a6:	983e                	add	a6,a6,a5
    17a8:	e394                	sd	a3,0(a5)
    17aa:	07a1                	add	a5,a5,8
    17ac:	ff079ee3          	bne	a5,a6,17a8 <memset+0xc8>
    17b0:	ff88f793          	and	a5,a7,-8
    17b4:	0078f893          	and	a7,a7,7
    17b8:	00f586b3          	add	a3,a1,a5
    17bc:	01c787bb          	addw	a5,a5,t3
    17c0:	0a088b63          	beqz	a7,1876 <memset+0x196>
    17c4:	00e68023          	sb	a4,0(a3)
    17c8:	0017859b          	addw	a1,a5,1
    17cc:	08c5fb63          	bgeu	a1,a2,1862 <memset+0x182>
    17d0:	00e680a3          	sb	a4,1(a3)
    17d4:	0027859b          	addw	a1,a5,2
    17d8:	08c5f563          	bgeu	a1,a2,1862 <memset+0x182>
    17dc:	00e68123          	sb	a4,2(a3)
    17e0:	0037859b          	addw	a1,a5,3
    17e4:	06c5ff63          	bgeu	a1,a2,1862 <memset+0x182>
    17e8:	00e681a3          	sb	a4,3(a3)
    17ec:	0047859b          	addw	a1,a5,4
    17f0:	06c5f963          	bgeu	a1,a2,1862 <memset+0x182>
    17f4:	00e68223          	sb	a4,4(a3)
    17f8:	0057859b          	addw	a1,a5,5
    17fc:	06c5f363          	bgeu	a1,a2,1862 <memset+0x182>
    1800:	00e682a3          	sb	a4,5(a3)
    1804:	0067859b          	addw	a1,a5,6
    1808:	04c5fd63          	bgeu	a1,a2,1862 <memset+0x182>
    180c:	00e68323          	sb	a4,6(a3)
    1810:	0077859b          	addw	a1,a5,7
    1814:	04c5f763          	bgeu	a1,a2,1862 <memset+0x182>
    1818:	00e683a3          	sb	a4,7(a3)
    181c:	0087859b          	addw	a1,a5,8
    1820:	04c5f163          	bgeu	a1,a2,1862 <memset+0x182>
    1824:	00e68423          	sb	a4,8(a3)
    1828:	0097859b          	addw	a1,a5,9
    182c:	02c5fb63          	bgeu	a1,a2,1862 <memset+0x182>
    1830:	00e684a3          	sb	a4,9(a3)
    1834:	00a7859b          	addw	a1,a5,10
    1838:	02c5f563          	bgeu	a1,a2,1862 <memset+0x182>
    183c:	00e68523          	sb	a4,10(a3)
    1840:	00b7859b          	addw	a1,a5,11
    1844:	00c5ff63          	bgeu	a1,a2,1862 <memset+0x182>
    1848:	00e685a3          	sb	a4,11(a3)
    184c:	00c7859b          	addw	a1,a5,12
    1850:	00c5f963          	bgeu	a1,a2,1862 <memset+0x182>
    1854:	00e68623          	sb	a4,12(a3)
    1858:	27b5                	addw	a5,a5,13
    185a:	00c7f463          	bgeu	a5,a2,1862 <memset+0x182>
    185e:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1862:	8082                	ret
    1864:	482d                	li	a6,11
    1866:	bd61                	j	16fe <memset+0x1e>
    char *p = dest;
    1868:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    186a:	4e01                	li	t3,0
    186c:	bded                	j	1766 <memset+0x86>
    186e:	00150593          	add	a1,a0,1
    1872:	4e05                	li	t3,1
    1874:	bdcd                	j	1766 <memset+0x86>
    1876:	8082                	ret
    char *p = dest;
    1878:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    187a:	4781                	li	a5,0
    187c:	b7a1                	j	17c4 <memset+0xe4>
    187e:	00250593          	add	a1,a0,2
    1882:	4e09                	li	t3,2
    1884:	b5cd                	j	1766 <memset+0x86>

0000000000001886 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1886:	00054783          	lbu	a5,0(a0)
    188a:	0005c703          	lbu	a4,0(a1)
    188e:	00e79863          	bne	a5,a4,189e <strcmp+0x18>
    1892:	0505                	add	a0,a0,1
    1894:	0585                	add	a1,a1,1
    1896:	fbe5                	bnez	a5,1886 <strcmp>
    1898:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    189a:	9d19                	subw	a0,a0,a4
    189c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    189e:	0007851b          	sext.w	a0,a5
    18a2:	bfe5                	j	189a <strcmp+0x14>

00000000000018a4 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18a4:	ca15                	beqz	a2,18d8 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a6:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18aa:	167d                	add	a2,a2,-1
    18ac:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18b0:	eb99                	bnez	a5,18c6 <strncmp+0x22>
    18b2:	a815                	j	18e6 <strncmp+0x42>
    18b4:	00a68e63          	beq	a3,a0,18d0 <strncmp+0x2c>
    18b8:	0505                	add	a0,a0,1
    18ba:	00f71b63          	bne	a4,a5,18d0 <strncmp+0x2c>
    18be:	00054783          	lbu	a5,0(a0)
    18c2:	cf89                	beqz	a5,18dc <strncmp+0x38>
    18c4:	85b2                	mv	a1,a2
    18c6:	0005c703          	lbu	a4,0(a1)
    18ca:	00158613          	add	a2,a1,1
    18ce:	f37d                	bnez	a4,18b4 <strncmp+0x10>
        ;
    return *l - *r;
    18d0:	0007851b          	sext.w	a0,a5
    18d4:	9d19                	subw	a0,a0,a4
    18d6:	8082                	ret
        return 0;
    18d8:	4501                	li	a0,0
}
    18da:	8082                	ret
    return *l - *r;
    18dc:	0015c703          	lbu	a4,1(a1)
    18e0:	4501                	li	a0,0
    18e2:	9d19                	subw	a0,a0,a4
    18e4:	8082                	ret
    18e6:	0005c703          	lbu	a4,0(a1)
    18ea:	4501                	li	a0,0
    18ec:	b7e5                	j	18d4 <strncmp+0x30>

00000000000018ee <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18ee:	00757793          	and	a5,a0,7
    18f2:	cf89                	beqz	a5,190c <strlen+0x1e>
    18f4:	87aa                	mv	a5,a0
    18f6:	a029                	j	1900 <strlen+0x12>
    18f8:	0785                	add	a5,a5,1
    18fa:	0077f713          	and	a4,a5,7
    18fe:	cb01                	beqz	a4,190e <strlen+0x20>
        if (!*s)
    1900:	0007c703          	lbu	a4,0(a5)
    1904:	fb75                	bnez	a4,18f8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1906:	40a78533          	sub	a0,a5,a0
}
    190a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    190c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    190e:	6394                	ld	a3,0(a5)
    1910:	00000597          	auipc	a1,0x0
    1914:	6f85b583          	ld	a1,1784(a1) # 2008 <__clone+0xe0>
    1918:	00000617          	auipc	a2,0x0
    191c:	6f863603          	ld	a2,1784(a2) # 2010 <__clone+0xe8>
    1920:	a019                	j	1926 <strlen+0x38>
    1922:	6794                	ld	a3,8(a5)
    1924:	07a1                	add	a5,a5,8
    1926:	00b68733          	add	a4,a3,a1
    192a:	fff6c693          	not	a3,a3
    192e:	8f75                	and	a4,a4,a3
    1930:	8f71                	and	a4,a4,a2
    1932:	db65                	beqz	a4,1922 <strlen+0x34>
    for (; *s; s++)
    1934:	0007c703          	lbu	a4,0(a5)
    1938:	d779                	beqz	a4,1906 <strlen+0x18>
    193a:	0017c703          	lbu	a4,1(a5)
    193e:	0785                	add	a5,a5,1
    1940:	d379                	beqz	a4,1906 <strlen+0x18>
    1942:	0017c703          	lbu	a4,1(a5)
    1946:	0785                	add	a5,a5,1
    1948:	fb6d                	bnez	a4,193a <strlen+0x4c>
    194a:	bf75                	j	1906 <strlen+0x18>

000000000000194c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194c:	00757713          	and	a4,a0,7
{
    1950:	87aa                	mv	a5,a0
    1952:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1956:	cb19                	beqz	a4,196c <memchr+0x20>
    1958:	ce25                	beqz	a2,19d0 <memchr+0x84>
    195a:	0007c703          	lbu	a4,0(a5)
    195e:	00b70763          	beq	a4,a1,196c <memchr+0x20>
    1962:	0785                	add	a5,a5,1
    1964:	0077f713          	and	a4,a5,7
    1968:	167d                	add	a2,a2,-1
    196a:	f77d                	bnez	a4,1958 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    196c:	4501                	li	a0,0
    if (n && *s != c)
    196e:	c235                	beqz	a2,19d2 <memchr+0x86>
    1970:	0007c703          	lbu	a4,0(a5)
    1974:	06b70063          	beq	a4,a1,19d4 <memchr+0x88>
        size_t k = ONES * c;
    1978:	00000517          	auipc	a0,0x0
    197c:	6a053503          	ld	a0,1696(a0) # 2018 <__clone+0xf0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1980:	471d                	li	a4,7
        size_t k = ONES * c;
    1982:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1986:	04c77763          	bgeu	a4,a2,19d4 <memchr+0x88>
    198a:	00000897          	auipc	a7,0x0
    198e:	67e8b883          	ld	a7,1662(a7) # 2008 <__clone+0xe0>
    1992:	00000817          	auipc	a6,0x0
    1996:	67e83803          	ld	a6,1662(a6) # 2010 <__clone+0xe8>
    199a:	431d                	li	t1,7
    199c:	a029                	j	19a6 <memchr+0x5a>
    199e:	1661                	add	a2,a2,-8
    19a0:	07a1                	add	a5,a5,8
    19a2:	00c37c63          	bgeu	t1,a2,19ba <memchr+0x6e>
    19a6:	6398                	ld	a4,0(a5)
    19a8:	8f29                	xor	a4,a4,a0
    19aa:	011706b3          	add	a3,a4,a7
    19ae:	fff74713          	not	a4,a4
    19b2:	8f75                	and	a4,a4,a3
    19b4:	01077733          	and	a4,a4,a6
    19b8:	d37d                	beqz	a4,199e <memchr+0x52>
    19ba:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19bc:	e601                	bnez	a2,19c4 <memchr+0x78>
    19be:	a809                	j	19d0 <memchr+0x84>
    19c0:	0505                	add	a0,a0,1
    19c2:	c619                	beqz	a2,19d0 <memchr+0x84>
    19c4:	00054783          	lbu	a5,0(a0)
    19c8:	167d                	add	a2,a2,-1
    19ca:	feb79be3          	bne	a5,a1,19c0 <memchr+0x74>
    19ce:	8082                	ret
    return n ? (void *)s : 0;
    19d0:	4501                	li	a0,0
}
    19d2:	8082                	ret
    if (n && *s != c)
    19d4:	853e                	mv	a0,a5
    19d6:	b7fd                	j	19c4 <memchr+0x78>

00000000000019d8 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19d8:	1101                	add	sp,sp,-32
    19da:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19dc:	862e                	mv	a2,a1
{
    19de:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19e0:	4581                	li	a1,0
{
    19e2:	e426                	sd	s1,8(sp)
    19e4:	ec06                	sd	ra,24(sp)
    19e6:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19e8:	f65ff0ef          	jal	194c <memchr>
    return p ? p - s : n;
    19ec:	c519                	beqz	a0,19fa <strnlen+0x22>
}
    19ee:	60e2                	ld	ra,24(sp)
    19f0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19f2:	8d05                	sub	a0,a0,s1
}
    19f4:	64a2                	ld	s1,8(sp)
    19f6:	6105                	add	sp,sp,32
    19f8:	8082                	ret
    19fa:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19fc:	8522                	mv	a0,s0
}
    19fe:	6442                	ld	s0,16(sp)
    1a00:	64a2                	ld	s1,8(sp)
    1a02:	6105                	add	sp,sp,32
    1a04:	8082                	ret

0000000000001a06 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a06:	00a5c7b3          	xor	a5,a1,a0
    1a0a:	8b9d                	and	a5,a5,7
    1a0c:	eb95                	bnez	a5,1a40 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a0e:	0075f793          	and	a5,a1,7
    1a12:	e7b1                	bnez	a5,1a5e <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a14:	6198                	ld	a4,0(a1)
    1a16:	00000617          	auipc	a2,0x0
    1a1a:	5f263603          	ld	a2,1522(a2) # 2008 <__clone+0xe0>
    1a1e:	00000817          	auipc	a6,0x0
    1a22:	5f283803          	ld	a6,1522(a6) # 2010 <__clone+0xe8>
    1a26:	a029                	j	1a30 <strcpy+0x2a>
    1a28:	05a1                	add	a1,a1,8
    1a2a:	e118                	sd	a4,0(a0)
    1a2c:	6198                	ld	a4,0(a1)
    1a2e:	0521                	add	a0,a0,8
    1a30:	00c707b3          	add	a5,a4,a2
    1a34:	fff74693          	not	a3,a4
    1a38:	8ff5                	and	a5,a5,a3
    1a3a:	0107f7b3          	and	a5,a5,a6
    1a3e:	d7ed                	beqz	a5,1a28 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a40:	0005c783          	lbu	a5,0(a1)
    1a44:	00f50023          	sb	a5,0(a0)
    1a48:	c785                	beqz	a5,1a70 <strcpy+0x6a>
    1a4a:	0015c783          	lbu	a5,1(a1)
    1a4e:	0505                	add	a0,a0,1
    1a50:	0585                	add	a1,a1,1
    1a52:	00f50023          	sb	a5,0(a0)
    1a56:	fbf5                	bnez	a5,1a4a <strcpy+0x44>
        ;
    return d;
}
    1a58:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a5a:	0505                	add	a0,a0,1
    1a5c:	df45                	beqz	a4,1a14 <strcpy+0xe>
            if (!(*d = *s))
    1a5e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a62:	0585                	add	a1,a1,1
    1a64:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a68:	00f50023          	sb	a5,0(a0)
    1a6c:	f7fd                	bnez	a5,1a5a <strcpy+0x54>
}
    1a6e:	8082                	ret
    1a70:	8082                	ret

0000000000001a72 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a72:	00a5c7b3          	xor	a5,a1,a0
    1a76:	8b9d                	and	a5,a5,7
    1a78:	e3b5                	bnez	a5,1adc <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a7a:	0075f793          	and	a5,a1,7
    1a7e:	cf99                	beqz	a5,1a9c <strncpy+0x2a>
    1a80:	ea09                	bnez	a2,1a92 <strncpy+0x20>
    1a82:	a421                	j	1c8a <strncpy+0x218>
    1a84:	0585                	add	a1,a1,1
    1a86:	0075f793          	and	a5,a1,7
    1a8a:	167d                	add	a2,a2,-1
    1a8c:	0505                	add	a0,a0,1
    1a8e:	c799                	beqz	a5,1a9c <strncpy+0x2a>
    1a90:	c225                	beqz	a2,1af0 <strncpy+0x7e>
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	f7ed                	bnez	a5,1a84 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a9c:	ca31                	beqz	a2,1af0 <strncpy+0x7e>
    1a9e:	0005c783          	lbu	a5,0(a1)
    1aa2:	cba1                	beqz	a5,1af2 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa4:	479d                	li	a5,7
    1aa6:	02c7fc63          	bgeu	a5,a2,1ade <strncpy+0x6c>
    1aaa:	00000897          	auipc	a7,0x0
    1aae:	55e8b883          	ld	a7,1374(a7) # 2008 <__clone+0xe0>
    1ab2:	00000817          	auipc	a6,0x0
    1ab6:	55e83803          	ld	a6,1374(a6) # 2010 <__clone+0xe8>
    1aba:	431d                	li	t1,7
    1abc:	a039                	j	1aca <strncpy+0x58>
            *wd = *ws;
    1abe:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac0:	1661                	add	a2,a2,-8
    1ac2:	05a1                	add	a1,a1,8
    1ac4:	0521                	add	a0,a0,8
    1ac6:	00c37b63          	bgeu	t1,a2,1adc <strncpy+0x6a>
    1aca:	6198                	ld	a4,0(a1)
    1acc:	011707b3          	add	a5,a4,a7
    1ad0:	fff74693          	not	a3,a4
    1ad4:	8ff5                	and	a5,a5,a3
    1ad6:	0107f7b3          	and	a5,a5,a6
    1ada:	d3f5                	beqz	a5,1abe <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1adc:	ca11                	beqz	a2,1af0 <strncpy+0x7e>
    1ade:	0005c783          	lbu	a5,0(a1)
    1ae2:	0585                	add	a1,a1,1
    1ae4:	00f50023          	sb	a5,0(a0)
    1ae8:	c789                	beqz	a5,1af2 <strncpy+0x80>
    1aea:	167d                	add	a2,a2,-1
    1aec:	0505                	add	a0,a0,1
    1aee:	fa65                	bnez	a2,1ade <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1af0:	8082                	ret
    1af2:	4805                	li	a6,1
    1af4:	14061b63          	bnez	a2,1c4a <strncpy+0x1d8>
    1af8:	40a00733          	neg	a4,a0
    1afc:	00777793          	and	a5,a4,7
    1b00:	4581                	li	a1,0
    1b02:	12061c63          	bnez	a2,1c3a <strncpy+0x1c8>
    1b06:	00778693          	add	a3,a5,7
    1b0a:	48ad                	li	a7,11
    1b0c:	1316e563          	bltu	a3,a7,1c36 <strncpy+0x1c4>
    1b10:	16d5e263          	bltu	a1,a3,1c74 <strncpy+0x202>
    1b14:	14078c63          	beqz	a5,1c6c <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b18:	00050023          	sb	zero,0(a0)
    1b1c:	00677693          	and	a3,a4,6
    1b20:	14068263          	beqz	a3,1c64 <strncpy+0x1f2>
    1b24:	000500a3          	sb	zero,1(a0)
    1b28:	4689                	li	a3,2
    1b2a:	14f6f863          	bgeu	a3,a5,1c7a <strncpy+0x208>
    1b2e:	00050123          	sb	zero,2(a0)
    1b32:	8b11                	and	a4,a4,4
    1b34:	12070463          	beqz	a4,1c5c <strncpy+0x1ea>
    1b38:	000501a3          	sb	zero,3(a0)
    1b3c:	4711                	li	a4,4
    1b3e:	00450693          	add	a3,a0,4
    1b42:	02f77563          	bgeu	a4,a5,1b6c <strncpy+0xfa>
    1b46:	00050223          	sb	zero,4(a0)
    1b4a:	4715                	li	a4,5
    1b4c:	00550693          	add	a3,a0,5
    1b50:	00e78e63          	beq	a5,a4,1b6c <strncpy+0xfa>
    1b54:	fff50713          	add	a4,a0,-1
    1b58:	000502a3          	sb	zero,5(a0)
    1b5c:	8b1d                	and	a4,a4,7
    1b5e:	12071263          	bnez	a4,1c82 <strncpy+0x210>
    1b62:	00750693          	add	a3,a0,7
    1b66:	00050323          	sb	zero,6(a0)
    1b6a:	471d                	li	a4,7
    1b6c:	40f80833          	sub	a6,a6,a5
    1b70:	ff887593          	and	a1,a6,-8
    1b74:	97aa                	add	a5,a5,a0
    1b76:	95be                	add	a1,a1,a5
    1b78:	0007b023          	sd	zero,0(a5)
    1b7c:	07a1                	add	a5,a5,8
    1b7e:	feb79de3          	bne	a5,a1,1b78 <strncpy+0x106>
    1b82:	ff887593          	and	a1,a6,-8
    1b86:	00787813          	and	a6,a6,7
    1b8a:	00e587bb          	addw	a5,a1,a4
    1b8e:	00b68733          	add	a4,a3,a1
    1b92:	0e080063          	beqz	a6,1c72 <strncpy+0x200>
    1b96:	00070023          	sb	zero,0(a4)
    1b9a:	0017869b          	addw	a3,a5,1
    1b9e:	f4c6f9e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1ba2:	000700a3          	sb	zero,1(a4)
    1ba6:	0027869b          	addw	a3,a5,2
    1baa:	f4c6f3e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bae:	00070123          	sb	zero,2(a4)
    1bb2:	0037869b          	addw	a3,a5,3
    1bb6:	f2c6fde3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bba:	000701a3          	sb	zero,3(a4)
    1bbe:	0047869b          	addw	a3,a5,4
    1bc2:	f2c6f7e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bc6:	00070223          	sb	zero,4(a4)
    1bca:	0057869b          	addw	a3,a5,5
    1bce:	f2c6f1e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bd2:	000702a3          	sb	zero,5(a4)
    1bd6:	0067869b          	addw	a3,a5,6
    1bda:	f0c6fbe3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bde:	00070323          	sb	zero,6(a4)
    1be2:	0077869b          	addw	a3,a5,7
    1be6:	f0c6f5e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bea:	000703a3          	sb	zero,7(a4)
    1bee:	0087869b          	addw	a3,a5,8
    1bf2:	eec6ffe3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1bf6:	00070423          	sb	zero,8(a4)
    1bfa:	0097869b          	addw	a3,a5,9
    1bfe:	eec6f9e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1c02:	000704a3          	sb	zero,9(a4)
    1c06:	00a7869b          	addw	a3,a5,10
    1c0a:	eec6f3e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1c0e:	00070523          	sb	zero,10(a4)
    1c12:	00b7869b          	addw	a3,a5,11
    1c16:	ecc6fde3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1c1a:	000705a3          	sb	zero,11(a4)
    1c1e:	00c7869b          	addw	a3,a5,12
    1c22:	ecc6f7e3          	bgeu	a3,a2,1af0 <strncpy+0x7e>
    1c26:	00070623          	sb	zero,12(a4)
    1c2a:	27b5                	addw	a5,a5,13
    1c2c:	ecc7f2e3          	bgeu	a5,a2,1af0 <strncpy+0x7e>
    1c30:	000706a3          	sb	zero,13(a4)
}
    1c34:	8082                	ret
    1c36:	46ad                	li	a3,11
    1c38:	bde1                	j	1b10 <strncpy+0x9e>
    1c3a:	00778693          	add	a3,a5,7
    1c3e:	48ad                	li	a7,11
    1c40:	fff60593          	add	a1,a2,-1
    1c44:	ed16f6e3          	bgeu	a3,a7,1b10 <strncpy+0x9e>
    1c48:	b7fd                	j	1c36 <strncpy+0x1c4>
    1c4a:	40a00733          	neg	a4,a0
    1c4e:	8832                	mv	a6,a2
    1c50:	00777793          	and	a5,a4,7
    1c54:	4581                	li	a1,0
    1c56:	ea0608e3          	beqz	a2,1b06 <strncpy+0x94>
    1c5a:	b7c5                	j	1c3a <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5c:	00350693          	add	a3,a0,3
    1c60:	470d                	li	a4,3
    1c62:	b729                	j	1b6c <strncpy+0xfa>
    1c64:	00150693          	add	a3,a0,1
    1c68:	4705                	li	a4,1
    1c6a:	b709                	j	1b6c <strncpy+0xfa>
tail:
    1c6c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6e:	4701                	li	a4,0
    1c70:	bdf5                	j	1b6c <strncpy+0xfa>
    1c72:	8082                	ret
tail:
    1c74:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c76:	4781                	li	a5,0
    1c78:	bf39                	j	1b96 <strncpy+0x124>
    1c7a:	00250693          	add	a3,a0,2
    1c7e:	4709                	li	a4,2
    1c80:	b5f5                	j	1b6c <strncpy+0xfa>
    1c82:	00650693          	add	a3,a0,6
    1c86:	4719                	li	a4,6
    1c88:	b5d5                	j	1b6c <strncpy+0xfa>
    1c8a:	8082                	ret

0000000000001c8c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c8c:	87aa                	mv	a5,a0
    1c8e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c90:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c94:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c98:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c9a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c9c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <openat>:
    register long a7 __asm__("a7") = n;
    1ca4:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ca8:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cac:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <close>:
    register long a7 __asm__("a7") = n;
    1cb4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cb8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <read>:
    register long a7 __asm__("a7") = n;
    1cc0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cc8:	8082                	ret

0000000000001cca <write>:
    register long a7 __asm__("a7") = n;
    1cca:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cce:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cd2:	8082                	ret

0000000000001cd4 <getpid>:
    register long a7 __asm__("a7") = n;
    1cd4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cd8:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <getppid>:
    register long a7 __asm__("a7") = n;
    1ce0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ce4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cec:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cf0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <fork>:
    register long a7 __asm__("a7") = n;
    1cf8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cfc:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cfe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d00:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d08:	85b2                	mv	a1,a2
    1d0a:	863a                	mv	a2,a4
    if (stack)
    1d0c:	c191                	beqz	a1,1d10 <clone+0x8>
	stack += stack_size;
    1d0e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d10:	4781                	li	a5,0
    1d12:	4701                	li	a4,0
    1d14:	4681                	li	a3,0
    1d16:	2601                	sext.w	a2,a2
    1d18:	ac01                	j	1f28 <__clone>

0000000000001d1a <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d1a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d1e:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d22:	8082                	ret

0000000000001d24 <exit>:
    register long a7 __asm__("a7") = n;
    1d24:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d28:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d2c:	8082                	ret

0000000000001d2e <waitpid>:
    register long a7 __asm__("a7") = n;
    1d2e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d32:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d34:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <exec>:
    register long a7 __asm__("a7") = n;
    1d3c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <execve>:
    register long a7 __asm__("a7") = n;
    1d48:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <times>:
    register long a7 __asm__("a7") = n;
    1d54:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <get_time>:

int64 get_time()
{
    1d60:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d62:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d66:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d68:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d6e:	2501                	sext.w	a0,a0
    1d70:	ed09                	bnez	a0,1d8a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d72:	67a2                	ld	a5,8(sp)
    1d74:	3e800713          	li	a4,1000
    1d78:	00015503          	lhu	a0,0(sp)
    1d7c:	02e7d7b3          	divu	a5,a5,a4
    1d80:	02e50533          	mul	a0,a0,a4
    1d84:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d86:	0141                	add	sp,sp,16
    1d88:	8082                	ret
        return -1;
    1d8a:	557d                	li	a0,-1
    1d8c:	bfed                	j	1d86 <get_time+0x26>

0000000000001d8e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d8e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <time>:
    register long a7 __asm__("a7") = n;
    1d9a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <sleep>:

int sleep(unsigned long long time)
{
    1da6:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1da8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1daa:	850a                	mv	a0,sp
    1dac:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dae:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1db2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db8:	e501                	bnez	a0,1dc0 <sleep+0x1a>
    return 0;
    1dba:	4501                	li	a0,0
}
    1dbc:	0141                	add	sp,sp,16
    1dbe:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dc0:	4502                	lw	a0,0(sp)
}
    1dc2:	0141                	add	sp,sp,16
    1dc4:	8082                	ret

0000000000001dc6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dc6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dca:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dd2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dd6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dda:	8082                	ret

0000000000001ddc <mprotect>:
    register long a7 __asm__("a7") = n;
    1ddc:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <munmap>:
    register long a7 __asm__("a7") = n;
    1de8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <wait>:

int wait(int *code)
{
    1df4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dfa:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dfc:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dfe:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e00:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <spawn>:
    register long a7 __asm__("a7") = n;
    1e08:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <mailread>:
    register long a7 __asm__("a7") = n;
    1e14:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e20:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <fstat>:
    register long a7 __asm__("a7") = n;
    1e2c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e38:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3a:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e3e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e48:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e4a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e4e:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e50:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e58:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e5e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e60:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <link>:

int link(char *old_path, char *new_path)
{
    1e68:	87aa                	mv	a5,a0
    1e6a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e6c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e70:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e74:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e76:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e7a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <unlink>:

int unlink(char *path)
{
    1e84:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e86:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e8a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e8e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e90:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <uname>:
    register long a7 __asm__("a7") = n;
    1e98:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e9c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <brk>:
    register long a7 __asm__("a7") = n;
    1ea4:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ea8:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <getcwd>:
    register long a7 __asm__("a7") = n;
    1eb0:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1eb6:	8082                	ret

0000000000001eb8 <chdir>:
    register long a7 __asm__("a7") = n;
    1eb8:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ebc:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ec4:	862e                	mv	a2,a1
    1ec6:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ec8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eca:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ece:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ed2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ed4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed6:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <getdents>:
    register long a7 __asm__("a7") = n;
    1ede:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <pipe>:
    register long a7 __asm__("a7") = n;
    1eea:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <dup>:
    register long a7 __asm__("a7") = n;
    1ef8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1efa:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <dup2>:
    register long a7 __asm__("a7") = n;
    1f02:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f04:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f06:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <mount>:
    register long a7 __asm__("a7") = n;
    1f0e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f12:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <umount>:
    register long a7 __asm__("a7") = n;
    1f1a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f1e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f20:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f28:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f2a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f2c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f2e:	8532                	mv	a0,a2
	mv a2, a4
    1f30:	863a                	mv	a2,a4
	mv a3, a5
    1f32:	86be                	mv	a3,a5
	mv a4, a6
    1f34:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f36:	0dc00893          	li	a7,220
	ecall
    1f3a:	00000073          	ecall

	beqz a0, 1f
    1f3e:	c111                	beqz	a0,1f42 <__clone+0x1a>
	# Parent
	ret
    1f40:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f42:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f44:	6522                	ld	a0,8(sp)
	jalr a1
    1f46:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f48:	05d00893          	li	a7,93
	ecall
    1f4c:	00000073          	ecall
