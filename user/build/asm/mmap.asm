
/home/hbh/oslab/oslab/user/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a201                	j	1102 <__start_main>

0000000000001004 <test_mmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f2250513          	add	a0,a0,-222 # 1f28 <__clone+0x2a>
void test_mmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e04a                	sd	s2,0(sp)
    1014:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1016:	344000ef          	jal	135a <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	04e50513          	add	a0,a0,78 # 2068 <__func__.0>
    1022:	338000ef          	jal	135a <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	f1a50513          	add	a0,a0,-230 # 1f40 <__clone+0x42>
    102e:	32c000ef          	jal	135a <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1032:	04200593          	li	a1,66
    1036:	00001517          	auipc	a0,0x1
    103a:	f1a50513          	add	a0,a0,-230 # 1f50 <__clone+0x52>
    103e:	425000ef          	jal	1c62 <open>
    1042:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1044:	00001517          	auipc	a0,0x1
    1048:	f1c50513          	add	a0,a0,-228 # 1f60 <__clone+0x62>
    104c:	079000ef          	jal	18c4 <strlen>
    1050:	862a                	mv	a2,a0
    1052:	00001597          	auipc	a1,0x1
    1056:	f0e58593          	add	a1,a1,-242 # 1f60 <__clone+0x62>
    105a:	8522                	mv	a0,s0
    105c:	445000ef          	jal	1ca0 <write>
    fstat(fd, &kst);
    1060:	00001917          	auipc	s2,0x1
    1064:	f8890913          	add	s2,s2,-120 # 1fe8 <kst>
    1068:	85ca                	mv	a1,s2
    106a:	8522                	mv	a0,s0
    106c:	597000ef          	jal	1e02 <fstat>
    printf("file len: %d\n", kst.st_size);
    1070:	03093583          	ld	a1,48(s2)
    1074:	00001517          	auipc	a0,0x1
    1078:	f0c50513          	add	a0,a0,-244 # 1f80 <__clone+0x82>
    107c:	300000ef          	jal	137c <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1080:	03093583          	ld	a1,48(s2)
    1084:	4781                	li	a5,0
    1086:	8722                	mv	a4,s0
    1088:	4685                	li	a3,1
    108a:	460d                	li	a2,3
    108c:	4501                	li	a0,0
    108e:	51b000ef          	jal	1da8 <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    1092:	57fd                	li	a5,-1
    1094:	04f50863          	beq	a0,a5,10e4 <test_mmap+0xe0>
	printf("mmap error.\n");
    }else{
	printf("mmap content: %s\n", array);
    1098:	85aa                	mv	a1,a0
    109a:	84aa                	mv	s1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	f0450513          	add	a0,a0,-252 # 1fa0 <__clone+0xa2>
    10a4:	2d8000ef          	jal	137c <printf>
	//printf("%s\n", str);

	munmap(array, kst.st_size);
    10a8:	03093583          	ld	a1,48(s2)
    10ac:	8526                	mv	a0,s1
    10ae:	511000ef          	jal	1dbe <munmap>
    }

    close(fd);
    10b2:	8522                	mv	a0,s0
    10b4:	3d7000ef          	jal	1c8a <close>

    TEST_END(__func__);
    10b8:	00001517          	auipc	a0,0x1
    10bc:	f0050513          	add	a0,a0,-256 # 1fb8 <__clone+0xba>
    10c0:	29a000ef          	jal	135a <puts>
    10c4:	00001517          	auipc	a0,0x1
    10c8:	fa450513          	add	a0,a0,-92 # 2068 <__func__.0>
    10cc:	28e000ef          	jal	135a <puts>
}
    10d0:	6442                	ld	s0,16(sp)
    10d2:	60e2                	ld	ra,24(sp)
    10d4:	64a2                	ld	s1,8(sp)
    10d6:	6902                	ld	s2,0(sp)
    TEST_END(__func__);
    10d8:	00001517          	auipc	a0,0x1
    10dc:	e6850513          	add	a0,a0,-408 # 1f40 <__clone+0x42>
}
    10e0:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10e2:	aca5                	j	135a <puts>
	printf("mmap error.\n");
    10e4:	00001517          	auipc	a0,0x1
    10e8:	eac50513          	add	a0,a0,-340 # 1f90 <__clone+0x92>
    10ec:	290000ef          	jal	137c <printf>
    10f0:	b7c9                	j	10b2 <test_mmap+0xae>

00000000000010f2 <main>:

int main(void){
    10f2:	1141                	add	sp,sp,-16
    10f4:	e406                	sd	ra,8(sp)
    test_mmap();
    10f6:	f0fff0ef          	jal	1004 <test_mmap>
    return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	add	sp,sp,16
    1100:	8082                	ret

0000000000001102 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1102:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1104:	4108                	lw	a0,0(a0)
{
    1106:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1108:	05a1                	add	a1,a1,8
{
    110a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    110c:	fe7ff0ef          	jal	10f2 <main>
    1110:	3eb000ef          	jal	1cfa <exit>
	return 0;
}
    1114:	60a2                	ld	ra,8(sp)
    1116:	4501                	li	a0,0
    1118:	0141                	add	sp,sp,16
    111a:	8082                	ret

000000000000111c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    111c:	7179                	add	sp,sp,-48
    111e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1120:	12054863          	bltz	a0,1250 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1124:	02b577bb          	remuw	a5,a0,a1
    1128:	00001697          	auipc	a3,0x1
    112c:	f5068693          	add	a3,a3,-176 # 2078 <digits>
    buf[16] = 0;
    1130:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1134:	0005871b          	sext.w	a4,a1
    1138:	1782                	sll	a5,a5,0x20
    113a:	9381                	srl	a5,a5,0x20
    113c:	97b6                	add	a5,a5,a3
    113e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1142:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1146:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    114a:	1ab56663          	bltu	a0,a1,12f6 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    114e:	02e8763b          	remuw	a2,a6,a4
    1152:	1602                	sll	a2,a2,0x20
    1154:	9201                	srl	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1164:	12e86c63          	bltu	a6,a4,129c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1168:	02e5f63b          	remuw	a2,a1,a4
    116c:	1602                	sll	a2,a2,0x20
    116e:	9201                	srl	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    117e:	12e5e863          	bltu	a1,a4,12ae <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	sll	a2,a2,0x20
    1188:	9201                	srl	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1198:	12e86463          	bltu	a6,a4,12c0 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	sll	a2,a2,0x20
    11a2:	9201                	srl	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11b2:	12e5e063          	bltu	a1,a4,12d2 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	sll	a2,a2,0x20
    11bc:	9201                	srl	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11cc:	0ae86f63          	bltu	a6,a4,128a <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	sll	a2,a2,0x20
    11d6:	9201                	srl	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11e6:	0ee5ef63          	bltu	a1,a4,12e4 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11ea:	02e8763b          	remuw	a2,a6,a4
    11ee:	1602                	sll	a2,a2,0x20
    11f0:	9201                	srl	a2,a2,0x20
    11f2:	9636                	add	a2,a2,a3
    11f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fc:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1200:	0ee86d63          	bltu	a6,a4,12fa <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1204:	02e5f63b          	remuw	a2,a1,a4
    1208:	1602                	sll	a2,a2,0x20
    120a:	9201                	srl	a2,a2,0x20
    120c:	9636                	add	a2,a2,a3
    120e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1212:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1216:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    121a:	0ee5e963          	bltu	a1,a4,130c <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    121e:	1782                	sll	a5,a5,0x20
    1220:	9381                	srl	a5,a5,0x20
    1222:	96be                	add	a3,a3,a5
    1224:	0006c783          	lbu	a5,0(a3)
    1228:	4599                	li	a1,6
    122a:	00f10723          	sb	a5,14(sp)

    if (sign)
    122e:	00055763          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    123a:	4595                	li	a1,5
    write(f, s, l);
    123c:	003c                	add	a5,sp,8
    123e:	4641                	li	a2,16
    1240:	9e0d                	subw	a2,a2,a1
    1242:	4505                	li	a0,1
    1244:	95be                	add	a1,a1,a5
    1246:	25b000ef          	jal	1ca0 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    124a:	70a2                	ld	ra,40(sp)
    124c:	6145                	add	sp,sp,48
    124e:	8082                	ret
        x = -xx;
    1250:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1254:	02b677bb          	remuw	a5,a2,a1
    1258:	00001697          	auipc	a3,0x1
    125c:	e2068693          	add	a3,a3,-480 # 2078 <digits>
    buf[16] = 0;
    1260:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1264:	0005871b          	sext.w	a4,a1
    1268:	1782                	sll	a5,a5,0x20
    126a:	9381                	srl	a5,a5,0x20
    126c:	97b6                	add	a5,a5,a3
    126e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1272:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1276:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    127a:	ecb67ae3          	bgeu	a2,a1,114e <printint.constprop.0+0x32>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1286:	45b9                	li	a1,14
    1288:	bf55                	j	123c <printint.constprop.0+0x120>
    128a:	45a9                	li	a1,10
    if (sign)
    128c:	fa0558e3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1290:	02d00793          	li	a5,45
    1294:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1298:	45a5                	li	a1,9
    129a:	b74d                	j	123c <printint.constprop.0+0x120>
    129c:	45b9                	li	a1,14
    if (sign)
    129e:	f8055fe3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12aa:	45b5                	li	a1,13
    12ac:	bf41                	j	123c <printint.constprop.0+0x120>
    12ae:	45b5                	li	a1,13
    if (sign)
    12b0:	f80556e3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12bc:	45b1                	li	a1,12
    12be:	bfbd                	j	123c <printint.constprop.0+0x120>
    12c0:	45b1                	li	a1,12
    if (sign)
    12c2:	f6055de3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12ce:	45ad                	li	a1,11
    12d0:	b7b5                	j	123c <printint.constprop.0+0x120>
    12d2:	45ad                	li	a1,11
    if (sign)
    12d4:	f60554e3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d8:	02d00793          	li	a5,45
    12dc:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12e0:	45a9                	li	a1,10
    12e2:	bfa9                	j	123c <printint.constprop.0+0x120>
    12e4:	45a5                	li	a1,9
    if (sign)
    12e6:	f4055be3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ea:	02d00793          	li	a5,45
    12ee:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12f2:	45a1                	li	a1,8
    12f4:	b7a1                	j	123c <printint.constprop.0+0x120>
    i = 15;
    12f6:	45bd                	li	a1,15
    12f8:	b791                	j	123c <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12fa:	45a1                	li	a1,8
    if (sign)
    12fc:	f40550e3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1300:	02d00793          	li	a5,45
    1304:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1308:	459d                	li	a1,7
    130a:	bf0d                	j	123c <printint.constprop.0+0x120>
    130c:	459d                	li	a1,7
    if (sign)
    130e:	f20557e3          	bgez	a0,123c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1312:	02d00793          	li	a5,45
    1316:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    131a:	4599                	li	a1,6
    131c:	b705                	j	123c <printint.constprop.0+0x120>

000000000000131e <getchar>:
{
    131e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1320:	00f10593          	add	a1,sp,15
    1324:	4605                	li	a2,1
    1326:	4501                	li	a0,0
{
    1328:	ec06                	sd	ra,24(sp)
    char byte = 0;
    132a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    132e:	169000ef          	jal	1c96 <read>
}
    1332:	60e2                	ld	ra,24(sp)
    1334:	00f14503          	lbu	a0,15(sp)
    1338:	6105                	add	sp,sp,32
    133a:	8082                	ret

000000000000133c <putchar>:
{
    133c:	1101                	add	sp,sp,-32
    133e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1340:	00f10593          	add	a1,sp,15
    1344:	4605                	li	a2,1
    1346:	4505                	li	a0,1
{
    1348:	ec06                	sd	ra,24(sp)
    char byte = c;
    134a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    134e:	153000ef          	jal	1ca0 <write>
}
    1352:	60e2                	ld	ra,24(sp)
    1354:	2501                	sext.w	a0,a0
    1356:	6105                	add	sp,sp,32
    1358:	8082                	ret

000000000000135a <puts>:
{
    135a:	1141                	add	sp,sp,-16
    135c:	e406                	sd	ra,8(sp)
    135e:	e022                	sd	s0,0(sp)
    1360:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1362:	562000ef          	jal	18c4 <strlen>
    1366:	862a                	mv	a2,a0
    1368:	85a2                	mv	a1,s0
    136a:	4505                	li	a0,1
    136c:	135000ef          	jal	1ca0 <write>
}
    1370:	60a2                	ld	ra,8(sp)
    1372:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1374:	957d                	sra	a0,a0,0x3f
    return r;
    1376:	2501                	sext.w	a0,a0
}
    1378:	0141                	add	sp,sp,16
    137a:	8082                	ret

000000000000137c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    137c:	7171                	add	sp,sp,-176
    137e:	f85a                	sd	s6,48(sp)
    1380:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1382:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1384:	18bc                	add	a5,sp,120
{
    1386:	e8ca                	sd	s2,80(sp)
    1388:	e4ce                	sd	s3,72(sp)
    138a:	e0d2                	sd	s4,64(sp)
    138c:	fc56                	sd	s5,56(sp)
    138e:	f486                	sd	ra,104(sp)
    1390:	f0a2                	sd	s0,96(sp)
    1392:	eca6                	sd	s1,88(sp)
    1394:	fcae                	sd	a1,120(sp)
    1396:	e132                	sd	a2,128(sp)
    1398:	e536                	sd	a3,136(sp)
    139a:	e93a                	sd	a4,144(sp)
    139c:	f142                	sd	a6,160(sp)
    139e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13a0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13a2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13a6:	07300a13          	li	s4,115
    13aa:	07800a93          	li	s5,120
    buf[i++] = '0';
    13ae:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b2:	00001997          	auipc	s3,0x1
    13b6:	cc698993          	add	s3,s3,-826 # 2078 <digits>
        if (!*s)
    13ba:	00054783          	lbu	a5,0(a0)
    13be:	16078a63          	beqz	a5,1532 <printf+0x1b6>
    13c2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13c4:	19278d63          	beq	a5,s2,155e <printf+0x1e2>
    13c8:	00164783          	lbu	a5,1(a2)
    13cc:	0605                	add	a2,a2,1
    13ce:	fbfd                	bnez	a5,13c4 <printf+0x48>
    13d0:	84b2                	mv	s1,a2
        l = z - a;
    13d2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13d6:	85aa                	mv	a1,a0
    13d8:	8622                	mv	a2,s0
    13da:	4505                	li	a0,1
    13dc:	0c5000ef          	jal	1ca0 <write>
        if (l)
    13e0:	1a041463          	bnez	s0,1588 <printf+0x20c>
        if (s[1] == 0)
    13e4:	0014c783          	lbu	a5,1(s1)
    13e8:	14078563          	beqz	a5,1532 <printf+0x1b6>
        switch (s[1])
    13ec:	1b478063          	beq	a5,s4,158c <printf+0x210>
    13f0:	14fa6b63          	bltu	s4,a5,1546 <printf+0x1ca>
    13f4:	06400713          	li	a4,100
    13f8:	1ee78063          	beq	a5,a4,15d8 <printf+0x25c>
    13fc:	07000713          	li	a4,112
    1400:	1ae79963          	bne	a5,a4,15b2 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1404:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1406:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    140a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    140c:	631c                	ld	a5,0(a4)
    140e:	0721                	add	a4,a4,8
    1410:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1412:	00479293          	sll	t0,a5,0x4
    1416:	00879f93          	sll	t6,a5,0x8
    141a:	00c79f13          	sll	t5,a5,0xc
    141e:	01079e93          	sll	t4,a5,0x10
    1422:	01479e13          	sll	t3,a5,0x14
    1426:	01879313          	sll	t1,a5,0x18
    142a:	01c79893          	sll	a7,a5,0x1c
    142e:	02479813          	sll	a6,a5,0x24
    1432:	02879513          	sll	a0,a5,0x28
    1436:	02c79593          	sll	a1,a5,0x2c
    143a:	03079693          	sll	a3,a5,0x30
    143e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1442:	03c7d413          	srl	s0,a5,0x3c
    1446:	01c7d39b          	srlw	t2,a5,0x1c
    144a:	03c2d293          	srl	t0,t0,0x3c
    144e:	03cfdf93          	srl	t6,t6,0x3c
    1452:	03cf5f13          	srl	t5,t5,0x3c
    1456:	03cede93          	srl	t4,t4,0x3c
    145a:	03ce5e13          	srl	t3,t3,0x3c
    145e:	03c35313          	srl	t1,t1,0x3c
    1462:	03c8d893          	srl	a7,a7,0x3c
    1466:	03c85813          	srl	a6,a6,0x3c
    146a:	9171                	srl	a0,a0,0x3c
    146c:	91f1                	srl	a1,a1,0x3c
    146e:	92f1                	srl	a3,a3,0x3c
    1470:	9371                	srl	a4,a4,0x3c
    1472:	96ce                	add	a3,a3,s3
    1474:	974e                	add	a4,a4,s3
    1476:	944e                	add	s0,s0,s3
    1478:	92ce                	add	t0,t0,s3
    147a:	9fce                	add	t6,t6,s3
    147c:	9f4e                	add	t5,t5,s3
    147e:	9ece                	add	t4,t4,s3
    1480:	9e4e                	add	t3,t3,s3
    1482:	934e                	add	t1,t1,s3
    1484:	98ce                	add	a7,a7,s3
    1486:	93ce                	add	t2,t2,s3
    1488:	984e                	add	a6,a6,s3
    148a:	954e                	add	a0,a0,s3
    148c:	95ce                	add	a1,a1,s3
    148e:	0006c083          	lbu	ra,0(a3)
    1492:	0002c283          	lbu	t0,0(t0)
    1496:	00074683          	lbu	a3,0(a4)
    149a:	000fcf83          	lbu	t6,0(t6)
    149e:	000f4f03          	lbu	t5,0(t5)
    14a2:	000ece83          	lbu	t4,0(t4)
    14a6:	000e4e03          	lbu	t3,0(t3)
    14aa:	00034303          	lbu	t1,0(t1)
    14ae:	0008c883          	lbu	a7,0(a7)
    14b2:	0003c383          	lbu	t2,0(t2)
    14b6:	00084803          	lbu	a6,0(a6)
    14ba:	00054503          	lbu	a0,0(a0)
    14be:	0005c583          	lbu	a1,0(a1)
    14c2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	9371                	srl	a4,a4,0x3c
    14cc:	8bbd                	and	a5,a5,15
    14ce:	974e                	add	a4,a4,s3
    14d0:	97ce                	add	a5,a5,s3
    14d2:	005105a3          	sb	t0,11(sp)
    14d6:	01f10623          	sb	t6,12(sp)
    14da:	01e106a3          	sb	t5,13(sp)
    14de:	01d10723          	sb	t4,14(sp)
    14e2:	01c107a3          	sb	t3,15(sp)
    14e6:	00610823          	sb	t1,16(sp)
    14ea:	011108a3          	sb	a7,17(sp)
    14ee:	00710923          	sb	t2,18(sp)
    14f2:	010109a3          	sb	a6,19(sp)
    14f6:	00a10a23          	sb	a0,20(sp)
    14fa:	00b10aa3          	sb	a1,21(sp)
    14fe:	00110b23          	sb	ra,22(sp)
    1502:	00d10ba3          	sb	a3,23(sp)
    1506:	00810523          	sb	s0,10(sp)
    150a:	00074703          	lbu	a4,0(a4)
    150e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1512:	002c                	add	a1,sp,8
    1514:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1516:	00e10c23          	sb	a4,24(sp)
    151a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1522:	77e000ef          	jal	1ca0 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1526:	00248513          	add	a0,s1,2
        if (!*s)
    152a:	00054783          	lbu	a5,0(a0)
    152e:	e8079ae3          	bnez	a5,13c2 <printf+0x46>
    }
    va_end(ap);
}
    1532:	70a6                	ld	ra,104(sp)
    1534:	7406                	ld	s0,96(sp)
    1536:	64e6                	ld	s1,88(sp)
    1538:	6946                	ld	s2,80(sp)
    153a:	69a6                	ld	s3,72(sp)
    153c:	6a06                	ld	s4,64(sp)
    153e:	7ae2                	ld	s5,56(sp)
    1540:	7b42                	ld	s6,48(sp)
    1542:	614d                	add	sp,sp,176
    1544:	8082                	ret
        switch (s[1])
    1546:	07579663          	bne	a5,s5,15b2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    154a:	6782                	ld	a5,0(sp)
    154c:	45c1                	li	a1,16
    154e:	4388                	lw	a0,0(a5)
    1550:	07a1                	add	a5,a5,8
    1552:	e03e                	sd	a5,0(sp)
    1554:	bc9ff0ef          	jal	111c <printint.constprop.0>
        s += 2;
    1558:	00248513          	add	a0,s1,2
    155c:	b7f9                	j	152a <printf+0x1ae>
    155e:	84b2                	mv	s1,a2
    1560:	a039                	j	156e <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1562:	0024c783          	lbu	a5,2(s1)
    1566:	0605                	add	a2,a2,1
    1568:	0489                	add	s1,s1,2
    156a:	e72794e3          	bne	a5,s2,13d2 <printf+0x56>
    156e:	0014c783          	lbu	a5,1(s1)
    1572:	ff2788e3          	beq	a5,s2,1562 <printf+0x1e6>
        l = z - a;
    1576:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    157a:	85aa                	mv	a1,a0
    157c:	8622                	mv	a2,s0
    157e:	4505                	li	a0,1
    1580:	720000ef          	jal	1ca0 <write>
        if (l)
    1584:	e60400e3          	beqz	s0,13e4 <printf+0x68>
    1588:	8526                	mv	a0,s1
    158a:	bd05                	j	13ba <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    158c:	6782                	ld	a5,0(sp)
    158e:	6380                	ld	s0,0(a5)
    1590:	07a1                	add	a5,a5,8
    1592:	e03e                	sd	a5,0(sp)
    1594:	cc21                	beqz	s0,15ec <printf+0x270>
            l = strnlen(a, 200);
    1596:	0c800593          	li	a1,200
    159a:	8522                	mv	a0,s0
    159c:	412000ef          	jal	19ae <strnlen>
    write(f, s, l);
    15a0:	0005061b          	sext.w	a2,a0
    15a4:	85a2                	mv	a1,s0
    15a6:	4505                	li	a0,1
    15a8:	6f8000ef          	jal	1ca0 <write>
        s += 2;
    15ac:	00248513          	add	a0,s1,2
    15b0:	bfad                	j	152a <printf+0x1ae>
    return write(stdout, &byte, 1);
    15b2:	4605                	li	a2,1
    15b4:	002c                	add	a1,sp,8
    15b6:	4505                	li	a0,1
    char byte = c;
    15b8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15bc:	6e4000ef          	jal	1ca0 <write>
    char byte = c;
    15c0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15c4:	4605                	li	a2,1
    15c6:	002c                	add	a1,sp,8
    15c8:	4505                	li	a0,1
    char byte = c;
    15ca:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15ce:	6d2000ef          	jal	1ca0 <write>
        s += 2;
    15d2:	00248513          	add	a0,s1,2
    15d6:	bf91                	j	152a <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15d8:	6782                	ld	a5,0(sp)
    15da:	45a9                	li	a1,10
    15dc:	4388                	lw	a0,0(a5)
    15de:	07a1                	add	a5,a5,8
    15e0:	e03e                	sd	a5,0(sp)
    15e2:	b3bff0ef          	jal	111c <printint.constprop.0>
        s += 2;
    15e6:	00248513          	add	a0,s1,2
    15ea:	b781                	j	152a <printf+0x1ae>
                a = "(null)";
    15ec:	00001417          	auipc	s0,0x1
    15f0:	9dc40413          	add	s0,s0,-1572 # 1fc8 <__clone+0xca>
    15f4:	b74d                	j	1596 <printf+0x21a>

00000000000015f6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	02000793          	li	a5,32
    15fa:	00f50663          	beq	a0,a5,1606 <isspace+0x10>
    15fe:	355d                	addw	a0,a0,-9
    1600:	00553513          	sltiu	a0,a0,5
    1604:	8082                	ret
    1606:	4505                	li	a0,1
}
    1608:	8082                	ret

000000000000160a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    160a:	fd05051b          	addw	a0,a0,-48
}
    160e:	00a53513          	sltiu	a0,a0,10
    1612:	8082                	ret

0000000000001614 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1614:	02000693          	li	a3,32
    1618:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    161a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    161e:	ff77871b          	addw	a4,a5,-9
    1622:	04d78c63          	beq	a5,a3,167a <atoi+0x66>
    1626:	0007861b          	sext.w	a2,a5
    162a:	04e5f863          	bgeu	a1,a4,167a <atoi+0x66>
        s++;
    switch (*s)
    162e:	02b00713          	li	a4,43
    1632:	04e78963          	beq	a5,a4,1684 <atoi+0x70>
    1636:	02d00713          	li	a4,45
    163a:	06e78263          	beq	a5,a4,169e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    163e:	fd06069b          	addw	a3,a2,-48
    1642:	47a5                	li	a5,9
    1644:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1646:	4301                	li	t1,0
    while (isdigit(*s))
    1648:	04d7e963          	bltu	a5,a3,169a <atoi+0x86>
    int n = 0, neg = 0;
    164c:	4501                	li	a0,0
    while (isdigit(*s))
    164e:	48a5                	li	a7,9
    1650:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1654:	0025179b          	sllw	a5,a0,0x2
    1658:	9fa9                	addw	a5,a5,a0
    165a:	fd06059b          	addw	a1,a2,-48
    165e:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1662:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1666:	0705                	add	a4,a4,1
    1668:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    166c:	0006861b          	sext.w	a2,a3
    1670:	ff08f0e3          	bgeu	a7,a6,1650 <atoi+0x3c>
    return neg ? n : -n;
    1674:	00030563          	beqz	t1,167e <atoi+0x6a>
}
    1678:	8082                	ret
        s++;
    167a:	0505                	add	a0,a0,1
    167c:	bf79                	j	161a <atoi+0x6>
    return neg ? n : -n;
    167e:	40f5853b          	subw	a0,a1,a5
    1682:	8082                	ret
    while (isdigit(*s))
    1684:	00154603          	lbu	a2,1(a0)
    1688:	47a5                	li	a5,9
        s++;
    168a:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    168e:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1692:	4301                	li	t1,0
    while (isdigit(*s))
    1694:	2601                	sext.w	a2,a2
    1696:	fad7fbe3          	bgeu	a5,a3,164c <atoi+0x38>
    169a:	4501                	li	a0,0
}
    169c:	8082                	ret
    while (isdigit(*s))
    169e:	00154603          	lbu	a2,1(a0)
    16a2:	47a5                	li	a5,9
        s++;
    16a4:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16a8:	fd06069b          	addw	a3,a2,-48
    16ac:	2601                	sext.w	a2,a2
    16ae:	fed7e6e3          	bltu	a5,a3,169a <atoi+0x86>
        neg = 1;
    16b2:	4305                	li	t1,1
    16b4:	bf61                	j	164c <atoi+0x38>

00000000000016b6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b6:	18060163          	beqz	a2,1838 <memset+0x182>
    16ba:	40a006b3          	neg	a3,a0
    16be:	0076f793          	and	a5,a3,7
    16c2:	00778813          	add	a6,a5,7
    16c6:	48ad                	li	a7,11
    16c8:	0ff5f713          	zext.b	a4,a1
    16cc:	fff60593          	add	a1,a2,-1
    16d0:	17186563          	bltu	a6,a7,183a <memset+0x184>
    16d4:	1705ed63          	bltu	a1,a6,184e <memset+0x198>
    16d8:	16078363          	beqz	a5,183e <memset+0x188>
    16dc:	00e50023          	sb	a4,0(a0)
    16e0:	0066f593          	and	a1,a3,6
    16e4:	16058063          	beqz	a1,1844 <memset+0x18e>
    16e8:	00e500a3          	sb	a4,1(a0)
    16ec:	4589                	li	a1,2
    16ee:	16f5f363          	bgeu	a1,a5,1854 <memset+0x19e>
    16f2:	00e50123          	sb	a4,2(a0)
    16f6:	8a91                	and	a3,a3,4
    16f8:	00350593          	add	a1,a0,3
    16fc:	4e0d                	li	t3,3
    16fe:	ce9d                	beqz	a3,173c <memset+0x86>
    1700:	00e501a3          	sb	a4,3(a0)
    1704:	4691                	li	a3,4
    1706:	00450593          	add	a1,a0,4
    170a:	4e11                	li	t3,4
    170c:	02f6f863          	bgeu	a3,a5,173c <memset+0x86>
    1710:	00e50223          	sb	a4,4(a0)
    1714:	4695                	li	a3,5
    1716:	00550593          	add	a1,a0,5
    171a:	4e15                	li	t3,5
    171c:	02d78063          	beq	a5,a3,173c <memset+0x86>
    1720:	fff50693          	add	a3,a0,-1
    1724:	00e502a3          	sb	a4,5(a0)
    1728:	8a9d                	and	a3,a3,7
    172a:	00650593          	add	a1,a0,6
    172e:	4e19                	li	t3,6
    1730:	e691                	bnez	a3,173c <memset+0x86>
    1732:	00750593          	add	a1,a0,7
    1736:	00e50323          	sb	a4,6(a0)
    173a:	4e1d                	li	t3,7
    173c:	00871693          	sll	a3,a4,0x8
    1740:	01071813          	sll	a6,a4,0x10
    1744:	8ed9                	or	a3,a3,a4
    1746:	01871893          	sll	a7,a4,0x18
    174a:	0106e6b3          	or	a3,a3,a6
    174e:	0116e6b3          	or	a3,a3,a7
    1752:	02071813          	sll	a6,a4,0x20
    1756:	02871313          	sll	t1,a4,0x28
    175a:	0106e6b3          	or	a3,a3,a6
    175e:	40f608b3          	sub	a7,a2,a5
    1762:	03071813          	sll	a6,a4,0x30
    1766:	0066e6b3          	or	a3,a3,t1
    176a:	0106e6b3          	or	a3,a3,a6
    176e:	03871313          	sll	t1,a4,0x38
    1772:	97aa                	add	a5,a5,a0
    1774:	ff88f813          	and	a6,a7,-8
    1778:	0066e6b3          	or	a3,a3,t1
    177c:	983e                	add	a6,a6,a5
    177e:	e394                	sd	a3,0(a5)
    1780:	07a1                	add	a5,a5,8
    1782:	ff079ee3          	bne	a5,a6,177e <memset+0xc8>
    1786:	ff88f793          	and	a5,a7,-8
    178a:	0078f893          	and	a7,a7,7
    178e:	00f586b3          	add	a3,a1,a5
    1792:	01c787bb          	addw	a5,a5,t3
    1796:	0a088b63          	beqz	a7,184c <memset+0x196>
    179a:	00e68023          	sb	a4,0(a3)
    179e:	0017859b          	addw	a1,a5,1
    17a2:	08c5fb63          	bgeu	a1,a2,1838 <memset+0x182>
    17a6:	00e680a3          	sb	a4,1(a3)
    17aa:	0027859b          	addw	a1,a5,2
    17ae:	08c5f563          	bgeu	a1,a2,1838 <memset+0x182>
    17b2:	00e68123          	sb	a4,2(a3)
    17b6:	0037859b          	addw	a1,a5,3
    17ba:	06c5ff63          	bgeu	a1,a2,1838 <memset+0x182>
    17be:	00e681a3          	sb	a4,3(a3)
    17c2:	0047859b          	addw	a1,a5,4
    17c6:	06c5f963          	bgeu	a1,a2,1838 <memset+0x182>
    17ca:	00e68223          	sb	a4,4(a3)
    17ce:	0057859b          	addw	a1,a5,5
    17d2:	06c5f363          	bgeu	a1,a2,1838 <memset+0x182>
    17d6:	00e682a3          	sb	a4,5(a3)
    17da:	0067859b          	addw	a1,a5,6
    17de:	04c5fd63          	bgeu	a1,a2,1838 <memset+0x182>
    17e2:	00e68323          	sb	a4,6(a3)
    17e6:	0077859b          	addw	a1,a5,7
    17ea:	04c5f763          	bgeu	a1,a2,1838 <memset+0x182>
    17ee:	00e683a3          	sb	a4,7(a3)
    17f2:	0087859b          	addw	a1,a5,8
    17f6:	04c5f163          	bgeu	a1,a2,1838 <memset+0x182>
    17fa:	00e68423          	sb	a4,8(a3)
    17fe:	0097859b          	addw	a1,a5,9
    1802:	02c5fb63          	bgeu	a1,a2,1838 <memset+0x182>
    1806:	00e684a3          	sb	a4,9(a3)
    180a:	00a7859b          	addw	a1,a5,10
    180e:	02c5f563          	bgeu	a1,a2,1838 <memset+0x182>
    1812:	00e68523          	sb	a4,10(a3)
    1816:	00b7859b          	addw	a1,a5,11
    181a:	00c5ff63          	bgeu	a1,a2,1838 <memset+0x182>
    181e:	00e685a3          	sb	a4,11(a3)
    1822:	00c7859b          	addw	a1,a5,12
    1826:	00c5f963          	bgeu	a1,a2,1838 <memset+0x182>
    182a:	00e68623          	sb	a4,12(a3)
    182e:	27b5                	addw	a5,a5,13
    1830:	00c7f463          	bgeu	a5,a2,1838 <memset+0x182>
    1834:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1838:	8082                	ret
    183a:	482d                	li	a6,11
    183c:	bd61                	j	16d4 <memset+0x1e>
    char *p = dest;
    183e:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1840:	4e01                	li	t3,0
    1842:	bded                	j	173c <memset+0x86>
    1844:	00150593          	add	a1,a0,1
    1848:	4e05                	li	t3,1
    184a:	bdcd                	j	173c <memset+0x86>
    184c:	8082                	ret
    char *p = dest;
    184e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1850:	4781                	li	a5,0
    1852:	b7a1                	j	179a <memset+0xe4>
    1854:	00250593          	add	a1,a0,2
    1858:	4e09                	li	t3,2
    185a:	b5cd                	j	173c <memset+0x86>

000000000000185c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185c:	00054783          	lbu	a5,0(a0)
    1860:	0005c703          	lbu	a4,0(a1)
    1864:	00e79863          	bne	a5,a4,1874 <strcmp+0x18>
    1868:	0505                	add	a0,a0,1
    186a:	0585                	add	a1,a1,1
    186c:	fbe5                	bnez	a5,185c <strcmp>
    186e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1870:	9d19                	subw	a0,a0,a4
    1872:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1874:	0007851b          	sext.w	a0,a5
    1878:	bfe5                	j	1870 <strcmp+0x14>

000000000000187a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    187a:	ca15                	beqz	a2,18ae <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1880:	167d                	add	a2,a2,-1
    1882:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1886:	eb99                	bnez	a5,189c <strncmp+0x22>
    1888:	a815                	j	18bc <strncmp+0x42>
    188a:	00a68e63          	beq	a3,a0,18a6 <strncmp+0x2c>
    188e:	0505                	add	a0,a0,1
    1890:	00f71b63          	bne	a4,a5,18a6 <strncmp+0x2c>
    1894:	00054783          	lbu	a5,0(a0)
    1898:	cf89                	beqz	a5,18b2 <strncmp+0x38>
    189a:	85b2                	mv	a1,a2
    189c:	0005c703          	lbu	a4,0(a1)
    18a0:	00158613          	add	a2,a1,1
    18a4:	f37d                	bnez	a4,188a <strncmp+0x10>
        ;
    return *l - *r;
    18a6:	0007851b          	sext.w	a0,a5
    18aa:	9d19                	subw	a0,a0,a4
    18ac:	8082                	ret
        return 0;
    18ae:	4501                	li	a0,0
}
    18b0:	8082                	ret
    return *l - *r;
    18b2:	0015c703          	lbu	a4,1(a1)
    18b6:	4501                	li	a0,0
    18b8:	9d19                	subw	a0,a0,a4
    18ba:	8082                	ret
    18bc:	0005c703          	lbu	a4,0(a1)
    18c0:	4501                	li	a0,0
    18c2:	b7e5                	j	18aa <strncmp+0x30>

00000000000018c4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c4:	00757793          	and	a5,a0,7
    18c8:	cf89                	beqz	a5,18e2 <strlen+0x1e>
    18ca:	87aa                	mv	a5,a0
    18cc:	a029                	j	18d6 <strlen+0x12>
    18ce:	0785                	add	a5,a5,1
    18d0:	0077f713          	and	a4,a5,7
    18d4:	cb01                	beqz	a4,18e4 <strlen+0x20>
        if (!*s)
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	fb75                	bnez	a4,18ce <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18dc:	40a78533          	sub	a0,a5,a0
}
    18e0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e4:	6394                	ld	a3,0(a5)
    18e6:	00000597          	auipc	a1,0x0
    18ea:	6ea5b583          	ld	a1,1770(a1) # 1fd0 <__clone+0xd2>
    18ee:	00000617          	auipc	a2,0x0
    18f2:	6ea63603          	ld	a2,1770(a2) # 1fd8 <__clone+0xda>
    18f6:	a019                	j	18fc <strlen+0x38>
    18f8:	6794                	ld	a3,8(a5)
    18fa:	07a1                	add	a5,a5,8
    18fc:	00b68733          	add	a4,a3,a1
    1900:	fff6c693          	not	a3,a3
    1904:	8f75                	and	a4,a4,a3
    1906:	8f71                	and	a4,a4,a2
    1908:	db65                	beqz	a4,18f8 <strlen+0x34>
    for (; *s; s++)
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	d779                	beqz	a4,18dc <strlen+0x18>
    1910:	0017c703          	lbu	a4,1(a5)
    1914:	0785                	add	a5,a5,1
    1916:	d379                	beqz	a4,18dc <strlen+0x18>
    1918:	0017c703          	lbu	a4,1(a5)
    191c:	0785                	add	a5,a5,1
    191e:	fb6d                	bnez	a4,1910 <strlen+0x4c>
    1920:	bf75                	j	18dc <strlen+0x18>

0000000000001922 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1922:	00757713          	and	a4,a0,7
{
    1926:	87aa                	mv	a5,a0
    1928:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192c:	cb19                	beqz	a4,1942 <memchr+0x20>
    192e:	ce25                	beqz	a2,19a6 <memchr+0x84>
    1930:	0007c703          	lbu	a4,0(a5)
    1934:	00b70763          	beq	a4,a1,1942 <memchr+0x20>
    1938:	0785                	add	a5,a5,1
    193a:	0077f713          	and	a4,a5,7
    193e:	167d                	add	a2,a2,-1
    1940:	f77d                	bnez	a4,192e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1942:	4501                	li	a0,0
    if (n && *s != c)
    1944:	c235                	beqz	a2,19a8 <memchr+0x86>
    1946:	0007c703          	lbu	a4,0(a5)
    194a:	06b70063          	beq	a4,a1,19aa <memchr+0x88>
        size_t k = ONES * c;
    194e:	00000517          	auipc	a0,0x0
    1952:	69253503          	ld	a0,1682(a0) # 1fe0 <__clone+0xe2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1956:	471d                	li	a4,7
        size_t k = ONES * c;
    1958:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195c:	04c77763          	bgeu	a4,a2,19aa <memchr+0x88>
    1960:	00000897          	auipc	a7,0x0
    1964:	6708b883          	ld	a7,1648(a7) # 1fd0 <__clone+0xd2>
    1968:	00000817          	auipc	a6,0x0
    196c:	67083803          	ld	a6,1648(a6) # 1fd8 <__clone+0xda>
    1970:	431d                	li	t1,7
    1972:	a029                	j	197c <memchr+0x5a>
    1974:	1661                	add	a2,a2,-8
    1976:	07a1                	add	a5,a5,8
    1978:	00c37c63          	bgeu	t1,a2,1990 <memchr+0x6e>
    197c:	6398                	ld	a4,0(a5)
    197e:	8f29                	xor	a4,a4,a0
    1980:	011706b3          	add	a3,a4,a7
    1984:	fff74713          	not	a4,a4
    1988:	8f75                	and	a4,a4,a3
    198a:	01077733          	and	a4,a4,a6
    198e:	d37d                	beqz	a4,1974 <memchr+0x52>
    1990:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1992:	e601                	bnez	a2,199a <memchr+0x78>
    1994:	a809                	j	19a6 <memchr+0x84>
    1996:	0505                	add	a0,a0,1
    1998:	c619                	beqz	a2,19a6 <memchr+0x84>
    199a:	00054783          	lbu	a5,0(a0)
    199e:	167d                	add	a2,a2,-1
    19a0:	feb79be3          	bne	a5,a1,1996 <memchr+0x74>
    19a4:	8082                	ret
    return n ? (void *)s : 0;
    19a6:	4501                	li	a0,0
}
    19a8:	8082                	ret
    if (n && *s != c)
    19aa:	853e                	mv	a0,a5
    19ac:	b7fd                	j	199a <memchr+0x78>

00000000000019ae <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ae:	1101                	add	sp,sp,-32
    19b0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b2:	862e                	mv	a2,a1
{
    19b4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b6:	4581                	li	a1,0
{
    19b8:	e426                	sd	s1,8(sp)
    19ba:	ec06                	sd	ra,24(sp)
    19bc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19be:	f65ff0ef          	jal	1922 <memchr>
    return p ? p - s : n;
    19c2:	c519                	beqz	a0,19d0 <strnlen+0x22>
}
    19c4:	60e2                	ld	ra,24(sp)
    19c6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c8:	8d05                	sub	a0,a0,s1
}
    19ca:	64a2                	ld	s1,8(sp)
    19cc:	6105                	add	sp,sp,32
    19ce:	8082                	ret
    19d0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d2:	8522                	mv	a0,s0
}
    19d4:	6442                	ld	s0,16(sp)
    19d6:	64a2                	ld	s1,8(sp)
    19d8:	6105                	add	sp,sp,32
    19da:	8082                	ret

00000000000019dc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19dc:	00a5c7b3          	xor	a5,a1,a0
    19e0:	8b9d                	and	a5,a5,7
    19e2:	eb95                	bnez	a5,1a16 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0075f793          	and	a5,a1,7
    19e8:	e7b1                	bnez	a5,1a34 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ea:	6198                	ld	a4,0(a1)
    19ec:	00000617          	auipc	a2,0x0
    19f0:	5e463603          	ld	a2,1508(a2) # 1fd0 <__clone+0xd2>
    19f4:	00000817          	auipc	a6,0x0
    19f8:	5e483803          	ld	a6,1508(a6) # 1fd8 <__clone+0xda>
    19fc:	a029                	j	1a06 <strcpy+0x2a>
    19fe:	05a1                	add	a1,a1,8
    1a00:	e118                	sd	a4,0(a0)
    1a02:	6198                	ld	a4,0(a1)
    1a04:	0521                	add	a0,a0,8
    1a06:	00c707b3          	add	a5,a4,a2
    1a0a:	fff74693          	not	a3,a4
    1a0e:	8ff5                	and	a5,a5,a3
    1a10:	0107f7b3          	and	a5,a5,a6
    1a14:	d7ed                	beqz	a5,19fe <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	c785                	beqz	a5,1a46 <strcpy+0x6a>
    1a20:	0015c783          	lbu	a5,1(a1)
    1a24:	0505                	add	a0,a0,1
    1a26:	0585                	add	a1,a1,1
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	fbf5                	bnez	a5,1a20 <strcpy+0x44>
        ;
    return d;
}
    1a2e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a30:	0505                	add	a0,a0,1
    1a32:	df45                	beqz	a4,19ea <strcpy+0xe>
            if (!(*d = *s))
    1a34:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a38:	0585                	add	a1,a1,1
    1a3a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	f7fd                	bnez	a5,1a30 <strcpy+0x54>
}
    1a44:	8082                	ret
    1a46:	8082                	ret

0000000000001a48 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a48:	00a5c7b3          	xor	a5,a1,a0
    1a4c:	8b9d                	and	a5,a5,7
    1a4e:	e3b5                	bnez	a5,1ab2 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a50:	0075f793          	and	a5,a1,7
    1a54:	cf99                	beqz	a5,1a72 <strncpy+0x2a>
    1a56:	ea09                	bnez	a2,1a68 <strncpy+0x20>
    1a58:	a421                	j	1c60 <strncpy+0x218>
    1a5a:	0585                	add	a1,a1,1
    1a5c:	0075f793          	and	a5,a1,7
    1a60:	167d                	add	a2,a2,-1
    1a62:	0505                	add	a0,a0,1
    1a64:	c799                	beqz	a5,1a72 <strncpy+0x2a>
    1a66:	c225                	beqz	a2,1ac6 <strncpy+0x7e>
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	f7ed                	bnez	a5,1a5a <strncpy+0x12>
            ;
        if (!n || !*s)
    1a72:	ca31                	beqz	a2,1ac6 <strncpy+0x7e>
    1a74:	0005c783          	lbu	a5,0(a1)
    1a78:	cba1                	beqz	a5,1ac8 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a7a:	479d                	li	a5,7
    1a7c:	02c7fc63          	bgeu	a5,a2,1ab4 <strncpy+0x6c>
    1a80:	00000897          	auipc	a7,0x0
    1a84:	5508b883          	ld	a7,1360(a7) # 1fd0 <__clone+0xd2>
    1a88:	00000817          	auipc	a6,0x0
    1a8c:	55083803          	ld	a6,1360(a6) # 1fd8 <__clone+0xda>
    1a90:	431d                	li	t1,7
    1a92:	a039                	j	1aa0 <strncpy+0x58>
            *wd = *ws;
    1a94:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a96:	1661                	add	a2,a2,-8
    1a98:	05a1                	add	a1,a1,8
    1a9a:	0521                	add	a0,a0,8
    1a9c:	00c37b63          	bgeu	t1,a2,1ab2 <strncpy+0x6a>
    1aa0:	6198                	ld	a4,0(a1)
    1aa2:	011707b3          	add	a5,a4,a7
    1aa6:	fff74693          	not	a3,a4
    1aaa:	8ff5                	and	a5,a5,a3
    1aac:	0107f7b3          	and	a5,a5,a6
    1ab0:	d3f5                	beqz	a5,1a94 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ab2:	ca11                	beqz	a2,1ac6 <strncpy+0x7e>
    1ab4:	0005c783          	lbu	a5,0(a1)
    1ab8:	0585                	add	a1,a1,1
    1aba:	00f50023          	sb	a5,0(a0)
    1abe:	c789                	beqz	a5,1ac8 <strncpy+0x80>
    1ac0:	167d                	add	a2,a2,-1
    1ac2:	0505                	add	a0,a0,1
    1ac4:	fa65                	bnez	a2,1ab4 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac6:	8082                	ret
    1ac8:	4805                	li	a6,1
    1aca:	14061b63          	bnez	a2,1c20 <strncpy+0x1d8>
    1ace:	40a00733          	neg	a4,a0
    1ad2:	00777793          	and	a5,a4,7
    1ad6:	4581                	li	a1,0
    1ad8:	12061c63          	bnez	a2,1c10 <strncpy+0x1c8>
    1adc:	00778693          	add	a3,a5,7
    1ae0:	48ad                	li	a7,11
    1ae2:	1316e563          	bltu	a3,a7,1c0c <strncpy+0x1c4>
    1ae6:	16d5e263          	bltu	a1,a3,1c4a <strncpy+0x202>
    1aea:	14078c63          	beqz	a5,1c42 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aee:	00050023          	sb	zero,0(a0)
    1af2:	00677693          	and	a3,a4,6
    1af6:	14068263          	beqz	a3,1c3a <strncpy+0x1f2>
    1afa:	000500a3          	sb	zero,1(a0)
    1afe:	4689                	li	a3,2
    1b00:	14f6f863          	bgeu	a3,a5,1c50 <strncpy+0x208>
    1b04:	00050123          	sb	zero,2(a0)
    1b08:	8b11                	and	a4,a4,4
    1b0a:	12070463          	beqz	a4,1c32 <strncpy+0x1ea>
    1b0e:	000501a3          	sb	zero,3(a0)
    1b12:	4711                	li	a4,4
    1b14:	00450693          	add	a3,a0,4
    1b18:	02f77563          	bgeu	a4,a5,1b42 <strncpy+0xfa>
    1b1c:	00050223          	sb	zero,4(a0)
    1b20:	4715                	li	a4,5
    1b22:	00550693          	add	a3,a0,5
    1b26:	00e78e63          	beq	a5,a4,1b42 <strncpy+0xfa>
    1b2a:	fff50713          	add	a4,a0,-1
    1b2e:	000502a3          	sb	zero,5(a0)
    1b32:	8b1d                	and	a4,a4,7
    1b34:	12071263          	bnez	a4,1c58 <strncpy+0x210>
    1b38:	00750693          	add	a3,a0,7
    1b3c:	00050323          	sb	zero,6(a0)
    1b40:	471d                	li	a4,7
    1b42:	40f80833          	sub	a6,a6,a5
    1b46:	ff887593          	and	a1,a6,-8
    1b4a:	97aa                	add	a5,a5,a0
    1b4c:	95be                	add	a1,a1,a5
    1b4e:	0007b023          	sd	zero,0(a5)
    1b52:	07a1                	add	a5,a5,8
    1b54:	feb79de3          	bne	a5,a1,1b4e <strncpy+0x106>
    1b58:	ff887593          	and	a1,a6,-8
    1b5c:	00787813          	and	a6,a6,7
    1b60:	00e587bb          	addw	a5,a1,a4
    1b64:	00b68733          	add	a4,a3,a1
    1b68:	0e080063          	beqz	a6,1c48 <strncpy+0x200>
    1b6c:	00070023          	sb	zero,0(a4)
    1b70:	0017869b          	addw	a3,a5,1
    1b74:	f4c6f9e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1b78:	000700a3          	sb	zero,1(a4)
    1b7c:	0027869b          	addw	a3,a5,2
    1b80:	f4c6f3e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1b84:	00070123          	sb	zero,2(a4)
    1b88:	0037869b          	addw	a3,a5,3
    1b8c:	f2c6fde3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1b90:	000701a3          	sb	zero,3(a4)
    1b94:	0047869b          	addw	a3,a5,4
    1b98:	f2c6f7e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1b9c:	00070223          	sb	zero,4(a4)
    1ba0:	0057869b          	addw	a3,a5,5
    1ba4:	f2c6f1e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1ba8:	000702a3          	sb	zero,5(a4)
    1bac:	0067869b          	addw	a3,a5,6
    1bb0:	f0c6fbe3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bb4:	00070323          	sb	zero,6(a4)
    1bb8:	0077869b          	addw	a3,a5,7
    1bbc:	f0c6f5e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bc0:	000703a3          	sb	zero,7(a4)
    1bc4:	0087869b          	addw	a3,a5,8
    1bc8:	eec6ffe3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bcc:	00070423          	sb	zero,8(a4)
    1bd0:	0097869b          	addw	a3,a5,9
    1bd4:	eec6f9e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bd8:	000704a3          	sb	zero,9(a4)
    1bdc:	00a7869b          	addw	a3,a5,10
    1be0:	eec6f3e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1be4:	00070523          	sb	zero,10(a4)
    1be8:	00b7869b          	addw	a3,a5,11
    1bec:	ecc6fde3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bf0:	000705a3          	sb	zero,11(a4)
    1bf4:	00c7869b          	addw	a3,a5,12
    1bf8:	ecc6f7e3          	bgeu	a3,a2,1ac6 <strncpy+0x7e>
    1bfc:	00070623          	sb	zero,12(a4)
    1c00:	27b5                	addw	a5,a5,13
    1c02:	ecc7f2e3          	bgeu	a5,a2,1ac6 <strncpy+0x7e>
    1c06:	000706a3          	sb	zero,13(a4)
}
    1c0a:	8082                	ret
    1c0c:	46ad                	li	a3,11
    1c0e:	bde1                	j	1ae6 <strncpy+0x9e>
    1c10:	00778693          	add	a3,a5,7
    1c14:	48ad                	li	a7,11
    1c16:	fff60593          	add	a1,a2,-1
    1c1a:	ed16f6e3          	bgeu	a3,a7,1ae6 <strncpy+0x9e>
    1c1e:	b7fd                	j	1c0c <strncpy+0x1c4>
    1c20:	40a00733          	neg	a4,a0
    1c24:	8832                	mv	a6,a2
    1c26:	00777793          	and	a5,a4,7
    1c2a:	4581                	li	a1,0
    1c2c:	ea0608e3          	beqz	a2,1adc <strncpy+0x94>
    1c30:	b7c5                	j	1c10 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c32:	00350693          	add	a3,a0,3
    1c36:	470d                	li	a4,3
    1c38:	b729                	j	1b42 <strncpy+0xfa>
    1c3a:	00150693          	add	a3,a0,1
    1c3e:	4705                	li	a4,1
    1c40:	b709                	j	1b42 <strncpy+0xfa>
tail:
    1c42:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c44:	4701                	li	a4,0
    1c46:	bdf5                	j	1b42 <strncpy+0xfa>
    1c48:	8082                	ret
tail:
    1c4a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4c:	4781                	li	a5,0
    1c4e:	bf39                	j	1b6c <strncpy+0x124>
    1c50:	00250693          	add	a3,a0,2
    1c54:	4709                	li	a4,2
    1c56:	b5f5                	j	1b42 <strncpy+0xfa>
    1c58:	00650693          	add	a3,a0,6
    1c5c:	4719                	li	a4,6
    1c5e:	b5d5                	j	1b42 <strncpy+0xfa>
    1c60:	8082                	ret

0000000000001c62 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c62:	87aa                	mv	a5,a0
    1c64:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c66:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c70:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c72:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <openat>:
    register long a7 __asm__("a7") = n;
    1c7a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c7e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c82:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <close>:
    register long a7 __asm__("a7") = n;
    1c8a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c8e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <read>:
    register long a7 __asm__("a7") = n;
    1c96:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c9e:	8082                	ret

0000000000001ca0 <write>:
    register long a7 __asm__("a7") = n;
    1ca0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ca8:	8082                	ret

0000000000001caa <getpid>:
    register long a7 __asm__("a7") = n;
    1caa:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cae:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <getppid>:
    register long a7 __asm__("a7") = n;
    1cb6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cba:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cc2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cc6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <fork>:
    register long a7 __asm__("a7") = n;
    1cce:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cd2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cde:	85b2                	mv	a1,a2
    1ce0:	863a                	mv	a2,a4
    if (stack)
    1ce2:	c191                	beqz	a1,1ce6 <clone+0x8>
	stack += stack_size;
    1ce4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ce6:	4781                	li	a5,0
    1ce8:	4701                	li	a4,0
    1cea:	4681                	li	a3,0
    1cec:	2601                	sext.w	a2,a2
    1cee:	ac01                	j	1efe <__clone>

0000000000001cf0 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1cf0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cf4:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cf8:	8082                	ret

0000000000001cfa <exit>:
    register long a7 __asm__("a7") = n;
    1cfa:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cfe:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d02:	8082                	ret

0000000000001d04 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d04:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d08:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d0a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <exec>:
    register long a7 __asm__("a7") = n;
    1d12:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d16:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <execve>:
    register long a7 __asm__("a7") = n;
    1d1e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d22:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <times>:
    register long a7 __asm__("a7") = n;
    1d2a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d2e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <get_time>:

int64 get_time()
{
    1d36:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d38:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d3c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d3e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d40:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d44:	2501                	sext.w	a0,a0
    1d46:	ed09                	bnez	a0,1d60 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d48:	67a2                	ld	a5,8(sp)
    1d4a:	3e800713          	li	a4,1000
    1d4e:	00015503          	lhu	a0,0(sp)
    1d52:	02e7d7b3          	divu	a5,a5,a4
    1d56:	02e50533          	mul	a0,a0,a4
    1d5a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d5c:	0141                	add	sp,sp,16
    1d5e:	8082                	ret
        return -1;
    1d60:	557d                	li	a0,-1
    1d62:	bfed                	j	1d5c <get_time+0x26>

0000000000001d64 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d64:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <time>:
    register long a7 __asm__("a7") = n;
    1d70:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <sleep>:

int sleep(unsigned long long time)
{
    1d7c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d7e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d80:	850a                	mv	a0,sp
    1d82:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d84:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d88:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d8e:	e501                	bnez	a0,1d96 <sleep+0x1a>
    return 0;
    1d90:	4501                	li	a0,0
}
    1d92:	0141                	add	sp,sp,16
    1d94:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d96:	4502                	lw	a0,0(sp)
}
    1d98:	0141                	add	sp,sp,16
    1d9a:	8082                	ret

0000000000001d9c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d9c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1da0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1da8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dac:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1db0:	8082                	ret

0000000000001db2 <mprotect>:
    register long a7 __asm__("a7") = n;
    1db2:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db6:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <munmap>:
    register long a7 __asm__("a7") = n;
    1dbe:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <wait>:

int wait(int *code)
{
    1dca:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dcc:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dd0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dd2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <spawn>:
    register long a7 __asm__("a7") = n;
    1dde:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <mailread>:
    register long a7 __asm__("a7") = n;
    1dea:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dee:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <fstat>:
    register long a7 __asm__("a7") = n;
    1e02:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e0e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e10:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e14:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e16:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e1e:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e20:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e24:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e26:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e2e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e30:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e34:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e36:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <link>:

int link(char *old_path, char *new_path)
{
    1e3e:	87aa                	mv	a5,a0
    1e40:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e42:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e46:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e4a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e4c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e50:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e52:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <unlink>:

int unlink(char *path)
{
    1e5a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e5c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e60:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e64:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <uname>:
    register long a7 __asm__("a7") = n;
    1e6e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <brk>:
    register long a7 __asm__("a7") = n;
    1e7a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e86:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e88:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e8c:	8082                	ret

0000000000001e8e <chdir>:
    register long a7 __asm__("a7") = n;
    1e8e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e92:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e9a:	862e                	mv	a2,a1
    1e9c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e9e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ea0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ea4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ea8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eaa:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <getdents>:
    register long a7 __asm__("a7") = n;
    1eb4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <pipe>:
    register long a7 __asm__("a7") = n;
    1ec0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ec4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <dup>:
    register long a7 __asm__("a7") = n;
    1ece:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ed0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <dup2>:
    register long a7 __asm__("a7") = n;
    1ed8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eda:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1edc:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <mount>:
    register long a7 __asm__("a7") = n;
    1ee4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <umount>:
    register long a7 __asm__("a7") = n;
    1ef0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ef4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1efe:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f00:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f02:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f04:	8532                	mv	a0,a2
	mv a2, a4
    1f06:	863a                	mv	a2,a4
	mv a3, a5
    1f08:	86be                	mv	a3,a5
	mv a4, a6
    1f0a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f0c:	0dc00893          	li	a7,220
	ecall
    1f10:	00000073          	ecall

	beqz a0, 1f
    1f14:	c111                	beqz	a0,1f18 <__clone+0x1a>
	# Parent
	ret
    1f16:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f18:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f1a:	6522                	ld	a0,8(sp)
	jalr a1
    1f1c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f1e:	05d00893          	li	a7,93
	ecall
    1f22:	00000073          	ecall
