
/home/hbh/oslab/oslab/user/build/riscv64/munmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa01                	j	1112 <__start_main>

0000000000001004 <test_munmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_munmap(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f4250513          	add	a0,a0,-190 # 1f48 <__clone+0x28>
void test_munmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	356000ef          	jal	136a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0a850513          	add	a0,a0,168 # 20c0 <__func__.0>
    1020:	34a000ef          	jal	136a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f3c50513          	add	a0,a0,-196 # 1f60 <__clone+0x40>
    102c:	33e000ef          	jal	136a <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	f3c50513          	add	a0,a0,-196 # 1f70 <__clone+0x50>
    103c:	449000ef          	jal	1c84 <open>
    1040:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1042:	00001517          	auipc	a0,0x1
    1046:	f3e50513          	add	a0,a0,-194 # 1f80 <__clone+0x60>
    104a:	09d000ef          	jal	18e6 <strlen>
    104e:	862a                	mv	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	f3058593          	add	a1,a1,-208 # 1f80 <__clone+0x60>
    1058:	8522                	mv	a0,s0
    105a:	469000ef          	jal	1cc2 <write>
    fstat(fd, &kst);
    105e:	00001497          	auipc	s1,0x1
    1062:	fe248493          	add	s1,s1,-30 # 2040 <kst>
    1066:	85a6                	mv	a1,s1
    1068:	8522                	mv	a0,s0
    106a:	5bb000ef          	jal	1e24 <fstat>
    printf("file len: %d\n", kst.st_size);
    106e:	788c                	ld	a1,48(s1)
    1070:	00001517          	auipc	a0,0x1
    1074:	f3050513          	add	a0,a0,-208 # 1fa0 <__clone+0x80>
    1078:	314000ef          	jal	138c <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107c:	788c                	ld	a1,48(s1)
    107e:	4781                	li	a5,0
    1080:	8722                	mv	a4,s0
    1082:	4685                	li	a3,1
    1084:	460d                	li	a2,3
    1086:	4501                	li	a0,0
    1088:	543000ef          	jal	1dca <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    108c:	57fd                	li	a5,-1
    108e:	06f50363          	beq	a0,a5,10f4 <test_munmap+0xf0>
	printf("mmap error.\n");
    }else{
	//printf("mmap content: %s\n", array);

    	int ret = munmap(array, kst.st_size);
    1092:	788c                	ld	a1,48(s1)
    1094:	54d000ef          	jal	1de0 <munmap>
    1098:	84aa                	mv	s1,a0
	printf("munmap return: %d\n",ret);
    109a:	85aa                	mv	a1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	f2450513          	add	a0,a0,-220 # 1fc0 <__clone+0xa0>
    10a4:	2e8000ef          	jal	138c <printf>
	assert(ret == 0);
    10a8:	ec9d                	bnez	s1,10e6 <test_munmap+0xe2>

	if (ret == 0)
		printf("munmap successfully!\n");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	f2e50513          	add	a0,a0,-210 # 1fd8 <__clone+0xb8>
    10b2:	2da000ef          	jal	138c <printf>
    }
    close(fd);
    10b6:	8522                	mv	a0,s0
    10b8:	3f5000ef          	jal	1cac <close>

    TEST_END(__func__);
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f5450513          	add	a0,a0,-172 # 2010 <__clone+0xf0>
    10c4:	2a6000ef          	jal	136a <puts>
    10c8:	00001517          	auipc	a0,0x1
    10cc:	ff850513          	add	a0,a0,-8 # 20c0 <__func__.0>
    10d0:	29a000ef          	jal	136a <puts>
}
    10d4:	6442                	ld	s0,16(sp)
    10d6:	60e2                	ld	ra,24(sp)
    10d8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10da:	00001517          	auipc	a0,0x1
    10de:	e8650513          	add	a0,a0,-378 # 1f60 <__clone+0x40>
}
    10e2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10e4:	a459                	j	136a <puts>
	assert(ret == 0);
    10e6:	00001517          	auipc	a0,0x1
    10ea:	f0a50513          	add	a0,a0,-246 # 1ff0 <__clone+0xd0>
    10ee:	518000ef          	jal	1606 <panic>
	if (ret == 0)
    10f2:	b7d1                	j	10b6 <test_munmap+0xb2>
	printf("mmap error.\n");
    10f4:	00001517          	auipc	a0,0x1
    10f8:	ebc50513          	add	a0,a0,-324 # 1fb0 <__clone+0x90>
    10fc:	290000ef          	jal	138c <printf>
    1100:	bf5d                	j	10b6 <test_munmap+0xb2>

0000000000001102 <main>:

int main(void){
    1102:	1141                	add	sp,sp,-16
    1104:	e406                	sd	ra,8(sp)
    test_munmap();
    1106:	effff0ef          	jal	1004 <test_munmap>
    return 0;
}
    110a:	60a2                	ld	ra,8(sp)
    110c:	4501                	li	a0,0
    110e:	0141                	add	sp,sp,16
    1110:	8082                	ret

0000000000001112 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1112:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1114:	4108                	lw	a0,0(a0)
{
    1116:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1118:	05a1                	add	a1,a1,8
{
    111a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    111c:	fe7ff0ef          	jal	1102 <main>
    1120:	3fd000ef          	jal	1d1c <exit>
	return 0;
}
    1124:	60a2                	ld	ra,8(sp)
    1126:	4501                	li	a0,0
    1128:	0141                	add	sp,sp,16
    112a:	8082                	ret

000000000000112c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    112c:	7179                	add	sp,sp,-48
    112e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1130:	12054863          	bltz	a0,1260 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1134:	02b577bb          	remuw	a5,a0,a1
    1138:	00001697          	auipc	a3,0x1
    113c:	f9868693          	add	a3,a3,-104 # 20d0 <digits>
    buf[16] = 0;
    1140:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1144:	0005871b          	sext.w	a4,a1
    1148:	1782                	sll	a5,a5,0x20
    114a:	9381                	srl	a5,a5,0x20
    114c:	97b6                	add	a5,a5,a3
    114e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1152:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1156:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    115a:	1ab56663          	bltu	a0,a1,1306 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    115e:	02e8763b          	remuw	a2,a6,a4
    1162:	1602                	sll	a2,a2,0x20
    1164:	9201                	srl	a2,a2,0x20
    1166:	9636                	add	a2,a2,a3
    1168:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1170:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1174:	12e86c63          	bltu	a6,a4,12ac <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1178:	02e5f63b          	remuw	a2,a1,a4
    117c:	1602                	sll	a2,a2,0x20
    117e:	9201                	srl	a2,a2,0x20
    1180:	9636                	add	a2,a2,a3
    1182:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1186:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    118e:	12e5e863          	bltu	a1,a4,12be <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1192:	02e8763b          	remuw	a2,a6,a4
    1196:	1602                	sll	a2,a2,0x20
    1198:	9201                	srl	a2,a2,0x20
    119a:	9636                	add	a2,a2,a3
    119c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a4:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11a8:	12e86463          	bltu	a6,a4,12d0 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11ac:	02e5f63b          	remuw	a2,a1,a4
    11b0:	1602                	sll	a2,a2,0x20
    11b2:	9201                	srl	a2,a2,0x20
    11b4:	9636                	add	a2,a2,a3
    11b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ba:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11be:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11c2:	12e5e063          	bltu	a1,a4,12e2 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11c6:	02e8763b          	remuw	a2,a6,a4
    11ca:	1602                	sll	a2,a2,0x20
    11cc:	9201                	srl	a2,a2,0x20
    11ce:	9636                	add	a2,a2,a3
    11d0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11dc:	0ae86f63          	bltu	a6,a4,129a <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11e0:	02e5f63b          	remuw	a2,a1,a4
    11e4:	1602                	sll	a2,a2,0x20
    11e6:	9201                	srl	a2,a2,0x20
    11e8:	9636                	add	a2,a2,a3
    11ea:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ee:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11f2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11f6:	0ee5ef63          	bltu	a1,a4,12f4 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11fa:	02e8763b          	remuw	a2,a6,a4
    11fe:	1602                	sll	a2,a2,0x20
    1200:	9201                	srl	a2,a2,0x20
    1202:	9636                	add	a2,a2,a3
    1204:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1208:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    120c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1210:	0ee86d63          	bltu	a6,a4,130a <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1214:	02e5f63b          	remuw	a2,a1,a4
    1218:	1602                	sll	a2,a2,0x20
    121a:	9201                	srl	a2,a2,0x20
    121c:	9636                	add	a2,a2,a3
    121e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1222:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1226:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    122a:	0ee5e963          	bltu	a1,a4,131c <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    122e:	1782                	sll	a5,a5,0x20
    1230:	9381                	srl	a5,a5,0x20
    1232:	96be                	add	a3,a3,a5
    1234:	0006c783          	lbu	a5,0(a3)
    1238:	4599                	li	a1,6
    123a:	00f10723          	sb	a5,14(sp)

    if (sign)
    123e:	00055763          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1242:	02d00793          	li	a5,45
    1246:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    124a:	4595                	li	a1,5
    write(f, s, l);
    124c:	003c                	add	a5,sp,8
    124e:	4641                	li	a2,16
    1250:	9e0d                	subw	a2,a2,a1
    1252:	4505                	li	a0,1
    1254:	95be                	add	a1,a1,a5
    1256:	26d000ef          	jal	1cc2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    125a:	70a2                	ld	ra,40(sp)
    125c:	6145                	add	sp,sp,48
    125e:	8082                	ret
        x = -xx;
    1260:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1264:	02b677bb          	remuw	a5,a2,a1
    1268:	00001697          	auipc	a3,0x1
    126c:	e6868693          	add	a3,a3,-408 # 20d0 <digits>
    buf[16] = 0;
    1270:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1274:	0005871b          	sext.w	a4,a1
    1278:	1782                	sll	a5,a5,0x20
    127a:	9381                	srl	a5,a5,0x20
    127c:	97b6                	add	a5,a5,a3
    127e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1282:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1286:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    128a:	ecb67ae3          	bgeu	a2,a1,115e <printint.constprop.0+0x32>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1296:	45b9                	li	a1,14
    1298:	bf55                	j	124c <printint.constprop.0+0x120>
    129a:	45a9                	li	a1,10
    if (sign)
    129c:	fa0558e3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12a8:	45a5                	li	a1,9
    12aa:	b74d                	j	124c <printint.constprop.0+0x120>
    12ac:	45b9                	li	a1,14
    if (sign)
    12ae:	f8055fe3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b2:	02d00793          	li	a5,45
    12b6:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12ba:	45b5                	li	a1,13
    12bc:	bf41                	j	124c <printint.constprop.0+0x120>
    12be:	45b5                	li	a1,13
    if (sign)
    12c0:	f80556e3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c4:	02d00793          	li	a5,45
    12c8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12cc:	45b1                	li	a1,12
    12ce:	bfbd                	j	124c <printint.constprop.0+0x120>
    12d0:	45b1                	li	a1,12
    if (sign)
    12d2:	f6055de3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d6:	02d00793          	li	a5,45
    12da:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12de:	45ad                	li	a1,11
    12e0:	b7b5                	j	124c <printint.constprop.0+0x120>
    12e2:	45ad                	li	a1,11
    if (sign)
    12e4:	f60554e3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e8:	02d00793          	li	a5,45
    12ec:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12f0:	45a9                	li	a1,10
    12f2:	bfa9                	j	124c <printint.constprop.0+0x120>
    12f4:	45a5                	li	a1,9
    if (sign)
    12f6:	f4055be3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12fa:	02d00793          	li	a5,45
    12fe:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1302:	45a1                	li	a1,8
    1304:	b7a1                	j	124c <printint.constprop.0+0x120>
    i = 15;
    1306:	45bd                	li	a1,15
    1308:	b791                	j	124c <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    130a:	45a1                	li	a1,8
    if (sign)
    130c:	f40550e3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1310:	02d00793          	li	a5,45
    1314:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1318:	459d                	li	a1,7
    131a:	bf0d                	j	124c <printint.constprop.0+0x120>
    131c:	459d                	li	a1,7
    if (sign)
    131e:	f20557e3          	bgez	a0,124c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1322:	02d00793          	li	a5,45
    1326:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    132a:	4599                	li	a1,6
    132c:	b705                	j	124c <printint.constprop.0+0x120>

000000000000132e <getchar>:
{
    132e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1330:	00f10593          	add	a1,sp,15
    1334:	4605                	li	a2,1
    1336:	4501                	li	a0,0
{
    1338:	ec06                	sd	ra,24(sp)
    char byte = 0;
    133a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    133e:	17b000ef          	jal	1cb8 <read>
}
    1342:	60e2                	ld	ra,24(sp)
    1344:	00f14503          	lbu	a0,15(sp)
    1348:	6105                	add	sp,sp,32
    134a:	8082                	ret

000000000000134c <putchar>:
{
    134c:	1101                	add	sp,sp,-32
    134e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1350:	00f10593          	add	a1,sp,15
    1354:	4605                	li	a2,1
    1356:	4505                	li	a0,1
{
    1358:	ec06                	sd	ra,24(sp)
    char byte = c;
    135a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    135e:	165000ef          	jal	1cc2 <write>
}
    1362:	60e2                	ld	ra,24(sp)
    1364:	2501                	sext.w	a0,a0
    1366:	6105                	add	sp,sp,32
    1368:	8082                	ret

000000000000136a <puts>:
{
    136a:	1141                	add	sp,sp,-16
    136c:	e406                	sd	ra,8(sp)
    136e:	e022                	sd	s0,0(sp)
    1370:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1372:	574000ef          	jal	18e6 <strlen>
    1376:	862a                	mv	a2,a0
    1378:	85a2                	mv	a1,s0
    137a:	4505                	li	a0,1
    137c:	147000ef          	jal	1cc2 <write>
}
    1380:	60a2                	ld	ra,8(sp)
    1382:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1384:	957d                	sra	a0,a0,0x3f
    return r;
    1386:	2501                	sext.w	a0,a0
}
    1388:	0141                	add	sp,sp,16
    138a:	8082                	ret

000000000000138c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    138c:	7171                	add	sp,sp,-176
    138e:	f85a                	sd	s6,48(sp)
    1390:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1392:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1394:	18bc                	add	a5,sp,120
{
    1396:	e8ca                	sd	s2,80(sp)
    1398:	e4ce                	sd	s3,72(sp)
    139a:	e0d2                	sd	s4,64(sp)
    139c:	fc56                	sd	s5,56(sp)
    139e:	f486                	sd	ra,104(sp)
    13a0:	f0a2                	sd	s0,96(sp)
    13a2:	eca6                	sd	s1,88(sp)
    13a4:	fcae                	sd	a1,120(sp)
    13a6:	e132                	sd	a2,128(sp)
    13a8:	e536                	sd	a3,136(sp)
    13aa:	e93a                	sd	a4,144(sp)
    13ac:	f142                	sd	a6,160(sp)
    13ae:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13b0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13b2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13b6:	07300a13          	li	s4,115
    13ba:	07800a93          	li	s5,120
    buf[i++] = '0';
    13be:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c2:	00001997          	auipc	s3,0x1
    13c6:	d0e98993          	add	s3,s3,-754 # 20d0 <digits>
        if (!*s)
    13ca:	00054783          	lbu	a5,0(a0)
    13ce:	16078a63          	beqz	a5,1542 <printf+0x1b6>
    13d2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13d4:	19278d63          	beq	a5,s2,156e <printf+0x1e2>
    13d8:	00164783          	lbu	a5,1(a2)
    13dc:	0605                	add	a2,a2,1
    13de:	fbfd                	bnez	a5,13d4 <printf+0x48>
    13e0:	84b2                	mv	s1,a2
        l = z - a;
    13e2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13e6:	85aa                	mv	a1,a0
    13e8:	8622                	mv	a2,s0
    13ea:	4505                	li	a0,1
    13ec:	0d7000ef          	jal	1cc2 <write>
        if (l)
    13f0:	1a041463          	bnez	s0,1598 <printf+0x20c>
        if (s[1] == 0)
    13f4:	0014c783          	lbu	a5,1(s1)
    13f8:	14078563          	beqz	a5,1542 <printf+0x1b6>
        switch (s[1])
    13fc:	1b478063          	beq	a5,s4,159c <printf+0x210>
    1400:	14fa6b63          	bltu	s4,a5,1556 <printf+0x1ca>
    1404:	06400713          	li	a4,100
    1408:	1ee78063          	beq	a5,a4,15e8 <printf+0x25c>
    140c:	07000713          	li	a4,112
    1410:	1ae79963          	bne	a5,a4,15c2 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1414:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1416:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    141a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    141c:	631c                	ld	a5,0(a4)
    141e:	0721                	add	a4,a4,8
    1420:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1422:	00479293          	sll	t0,a5,0x4
    1426:	00879f93          	sll	t6,a5,0x8
    142a:	00c79f13          	sll	t5,a5,0xc
    142e:	01079e93          	sll	t4,a5,0x10
    1432:	01479e13          	sll	t3,a5,0x14
    1436:	01879313          	sll	t1,a5,0x18
    143a:	01c79893          	sll	a7,a5,0x1c
    143e:	02479813          	sll	a6,a5,0x24
    1442:	02879513          	sll	a0,a5,0x28
    1446:	02c79593          	sll	a1,a5,0x2c
    144a:	03079693          	sll	a3,a5,0x30
    144e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1452:	03c7d413          	srl	s0,a5,0x3c
    1456:	01c7d39b          	srlw	t2,a5,0x1c
    145a:	03c2d293          	srl	t0,t0,0x3c
    145e:	03cfdf93          	srl	t6,t6,0x3c
    1462:	03cf5f13          	srl	t5,t5,0x3c
    1466:	03cede93          	srl	t4,t4,0x3c
    146a:	03ce5e13          	srl	t3,t3,0x3c
    146e:	03c35313          	srl	t1,t1,0x3c
    1472:	03c8d893          	srl	a7,a7,0x3c
    1476:	03c85813          	srl	a6,a6,0x3c
    147a:	9171                	srl	a0,a0,0x3c
    147c:	91f1                	srl	a1,a1,0x3c
    147e:	92f1                	srl	a3,a3,0x3c
    1480:	9371                	srl	a4,a4,0x3c
    1482:	96ce                	add	a3,a3,s3
    1484:	974e                	add	a4,a4,s3
    1486:	944e                	add	s0,s0,s3
    1488:	92ce                	add	t0,t0,s3
    148a:	9fce                	add	t6,t6,s3
    148c:	9f4e                	add	t5,t5,s3
    148e:	9ece                	add	t4,t4,s3
    1490:	9e4e                	add	t3,t3,s3
    1492:	934e                	add	t1,t1,s3
    1494:	98ce                	add	a7,a7,s3
    1496:	93ce                	add	t2,t2,s3
    1498:	984e                	add	a6,a6,s3
    149a:	954e                	add	a0,a0,s3
    149c:	95ce                	add	a1,a1,s3
    149e:	0006c083          	lbu	ra,0(a3)
    14a2:	0002c283          	lbu	t0,0(t0)
    14a6:	00074683          	lbu	a3,0(a4)
    14aa:	000fcf83          	lbu	t6,0(t6)
    14ae:	000f4f03          	lbu	t5,0(t5)
    14b2:	000ece83          	lbu	t4,0(t4)
    14b6:	000e4e03          	lbu	t3,0(t3)
    14ba:	00034303          	lbu	t1,0(t1)
    14be:	0008c883          	lbu	a7,0(a7)
    14c2:	0003c383          	lbu	t2,0(t2)
    14c6:	00084803          	lbu	a6,0(a6)
    14ca:	00054503          	lbu	a0,0(a0)
    14ce:	0005c583          	lbu	a1,0(a1)
    14d2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14da:	9371                	srl	a4,a4,0x3c
    14dc:	8bbd                	and	a5,a5,15
    14de:	974e                	add	a4,a4,s3
    14e0:	97ce                	add	a5,a5,s3
    14e2:	005105a3          	sb	t0,11(sp)
    14e6:	01f10623          	sb	t6,12(sp)
    14ea:	01e106a3          	sb	t5,13(sp)
    14ee:	01d10723          	sb	t4,14(sp)
    14f2:	01c107a3          	sb	t3,15(sp)
    14f6:	00610823          	sb	t1,16(sp)
    14fa:	011108a3          	sb	a7,17(sp)
    14fe:	00710923          	sb	t2,18(sp)
    1502:	010109a3          	sb	a6,19(sp)
    1506:	00a10a23          	sb	a0,20(sp)
    150a:	00b10aa3          	sb	a1,21(sp)
    150e:	00110b23          	sb	ra,22(sp)
    1512:	00d10ba3          	sb	a3,23(sp)
    1516:	00810523          	sb	s0,10(sp)
    151a:	00074703          	lbu	a4,0(a4)
    151e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1522:	002c                	add	a1,sp,8
    1524:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1526:	00e10c23          	sb	a4,24(sp)
    152a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1532:	790000ef          	jal	1cc2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1536:	00248513          	add	a0,s1,2
        if (!*s)
    153a:	00054783          	lbu	a5,0(a0)
    153e:	e8079ae3          	bnez	a5,13d2 <printf+0x46>
    }
    va_end(ap);
}
    1542:	70a6                	ld	ra,104(sp)
    1544:	7406                	ld	s0,96(sp)
    1546:	64e6                	ld	s1,88(sp)
    1548:	6946                	ld	s2,80(sp)
    154a:	69a6                	ld	s3,72(sp)
    154c:	6a06                	ld	s4,64(sp)
    154e:	7ae2                	ld	s5,56(sp)
    1550:	7b42                	ld	s6,48(sp)
    1552:	614d                	add	sp,sp,176
    1554:	8082                	ret
        switch (s[1])
    1556:	07579663          	bne	a5,s5,15c2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    155a:	6782                	ld	a5,0(sp)
    155c:	45c1                	li	a1,16
    155e:	4388                	lw	a0,0(a5)
    1560:	07a1                	add	a5,a5,8
    1562:	e03e                	sd	a5,0(sp)
    1564:	bc9ff0ef          	jal	112c <printint.constprop.0>
        s += 2;
    1568:	00248513          	add	a0,s1,2
    156c:	b7f9                	j	153a <printf+0x1ae>
    156e:	84b2                	mv	s1,a2
    1570:	a039                	j	157e <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1572:	0024c783          	lbu	a5,2(s1)
    1576:	0605                	add	a2,a2,1
    1578:	0489                	add	s1,s1,2
    157a:	e72794e3          	bne	a5,s2,13e2 <printf+0x56>
    157e:	0014c783          	lbu	a5,1(s1)
    1582:	ff2788e3          	beq	a5,s2,1572 <printf+0x1e6>
        l = z - a;
    1586:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    158a:	85aa                	mv	a1,a0
    158c:	8622                	mv	a2,s0
    158e:	4505                	li	a0,1
    1590:	732000ef          	jal	1cc2 <write>
        if (l)
    1594:	e60400e3          	beqz	s0,13f4 <printf+0x68>
    1598:	8526                	mv	a0,s1
    159a:	bd05                	j	13ca <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    159c:	6782                	ld	a5,0(sp)
    159e:	6380                	ld	s0,0(a5)
    15a0:	07a1                	add	a5,a5,8
    15a2:	e03e                	sd	a5,0(sp)
    15a4:	cc21                	beqz	s0,15fc <printf+0x270>
            l = strnlen(a, 200);
    15a6:	0c800593          	li	a1,200
    15aa:	8522                	mv	a0,s0
    15ac:	424000ef          	jal	19d0 <strnlen>
    write(f, s, l);
    15b0:	0005061b          	sext.w	a2,a0
    15b4:	85a2                	mv	a1,s0
    15b6:	4505                	li	a0,1
    15b8:	70a000ef          	jal	1cc2 <write>
        s += 2;
    15bc:	00248513          	add	a0,s1,2
    15c0:	bfad                	j	153a <printf+0x1ae>
    return write(stdout, &byte, 1);
    15c2:	4605                	li	a2,1
    15c4:	002c                	add	a1,sp,8
    15c6:	4505                	li	a0,1
    char byte = c;
    15c8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15cc:	6f6000ef          	jal	1cc2 <write>
    char byte = c;
    15d0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d4:	4605                	li	a2,1
    15d6:	002c                	add	a1,sp,8
    15d8:	4505                	li	a0,1
    char byte = c;
    15da:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15de:	6e4000ef          	jal	1cc2 <write>
        s += 2;
    15e2:	00248513          	add	a0,s1,2
    15e6:	bf91                	j	153a <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15e8:	6782                	ld	a5,0(sp)
    15ea:	45a9                	li	a1,10
    15ec:	4388                	lw	a0,0(a5)
    15ee:	07a1                	add	a5,a5,8
    15f0:	e03e                	sd	a5,0(sp)
    15f2:	b3bff0ef          	jal	112c <printint.constprop.0>
        s += 2;
    15f6:	00248513          	add	a0,s1,2
    15fa:	b781                	j	153a <printf+0x1ae>
                a = "(null)";
    15fc:	00001417          	auipc	s0,0x1
    1600:	a2440413          	add	s0,s0,-1500 # 2020 <__clone+0x100>
    1604:	b74d                	j	15a6 <printf+0x21a>

0000000000001606 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1606:	1141                	add	sp,sp,-16
    1608:	e406                	sd	ra,8(sp)
    puts(m);
    160a:	d61ff0ef          	jal	136a <puts>
    exit(-100);
}
    160e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1610:	f9c00513          	li	a0,-100
}
    1614:	0141                	add	sp,sp,16
    exit(-100);
    1616:	a719                	j	1d1c <exit>

0000000000001618 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	02000793          	li	a5,32
    161c:	00f50663          	beq	a0,a5,1628 <isspace+0x10>
    1620:	355d                	addw	a0,a0,-9
    1622:	00553513          	sltiu	a0,a0,5
    1626:	8082                	ret
    1628:	4505                	li	a0,1
}
    162a:	8082                	ret

000000000000162c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    162c:	fd05051b          	addw	a0,a0,-48
}
    1630:	00a53513          	sltiu	a0,a0,10
    1634:	8082                	ret

0000000000001636 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	02000693          	li	a3,32
    163a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    163c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1640:	ff77871b          	addw	a4,a5,-9
    1644:	04d78c63          	beq	a5,a3,169c <atoi+0x66>
    1648:	0007861b          	sext.w	a2,a5
    164c:	04e5f863          	bgeu	a1,a4,169c <atoi+0x66>
        s++;
    switch (*s)
    1650:	02b00713          	li	a4,43
    1654:	04e78963          	beq	a5,a4,16a6 <atoi+0x70>
    1658:	02d00713          	li	a4,45
    165c:	06e78263          	beq	a5,a4,16c0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1660:	fd06069b          	addw	a3,a2,-48
    1664:	47a5                	li	a5,9
    1666:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1668:	4301                	li	t1,0
    while (isdigit(*s))
    166a:	04d7e963          	bltu	a5,a3,16bc <atoi+0x86>
    int n = 0, neg = 0;
    166e:	4501                	li	a0,0
    while (isdigit(*s))
    1670:	48a5                	li	a7,9
    1672:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1676:	0025179b          	sllw	a5,a0,0x2
    167a:	9fa9                	addw	a5,a5,a0
    167c:	fd06059b          	addw	a1,a2,-48
    1680:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1684:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1688:	0705                	add	a4,a4,1
    168a:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    168e:	0006861b          	sext.w	a2,a3
    1692:	ff08f0e3          	bgeu	a7,a6,1672 <atoi+0x3c>
    return neg ? n : -n;
    1696:	00030563          	beqz	t1,16a0 <atoi+0x6a>
}
    169a:	8082                	ret
        s++;
    169c:	0505                	add	a0,a0,1
    169e:	bf79                	j	163c <atoi+0x6>
    return neg ? n : -n;
    16a0:	40f5853b          	subw	a0,a1,a5
    16a4:	8082                	ret
    while (isdigit(*s))
    16a6:	00154603          	lbu	a2,1(a0)
    16aa:	47a5                	li	a5,9
        s++;
    16ac:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16b0:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16b4:	4301                	li	t1,0
    while (isdigit(*s))
    16b6:	2601                	sext.w	a2,a2
    16b8:	fad7fbe3          	bgeu	a5,a3,166e <atoi+0x38>
    16bc:	4501                	li	a0,0
}
    16be:	8082                	ret
    while (isdigit(*s))
    16c0:	00154603          	lbu	a2,1(a0)
    16c4:	47a5                	li	a5,9
        s++;
    16c6:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16ca:	fd06069b          	addw	a3,a2,-48
    16ce:	2601                	sext.w	a2,a2
    16d0:	fed7e6e3          	bltu	a5,a3,16bc <atoi+0x86>
        neg = 1;
    16d4:	4305                	li	t1,1
    16d6:	bf61                	j	166e <atoi+0x38>

00000000000016d8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16d8:	18060163          	beqz	a2,185a <memset+0x182>
    16dc:	40a006b3          	neg	a3,a0
    16e0:	0076f793          	and	a5,a3,7
    16e4:	00778813          	add	a6,a5,7
    16e8:	48ad                	li	a7,11
    16ea:	0ff5f713          	zext.b	a4,a1
    16ee:	fff60593          	add	a1,a2,-1
    16f2:	17186563          	bltu	a6,a7,185c <memset+0x184>
    16f6:	1705ed63          	bltu	a1,a6,1870 <memset+0x198>
    16fa:	16078363          	beqz	a5,1860 <memset+0x188>
    16fe:	00e50023          	sb	a4,0(a0)
    1702:	0066f593          	and	a1,a3,6
    1706:	16058063          	beqz	a1,1866 <memset+0x18e>
    170a:	00e500a3          	sb	a4,1(a0)
    170e:	4589                	li	a1,2
    1710:	16f5f363          	bgeu	a1,a5,1876 <memset+0x19e>
    1714:	00e50123          	sb	a4,2(a0)
    1718:	8a91                	and	a3,a3,4
    171a:	00350593          	add	a1,a0,3
    171e:	4e0d                	li	t3,3
    1720:	ce9d                	beqz	a3,175e <memset+0x86>
    1722:	00e501a3          	sb	a4,3(a0)
    1726:	4691                	li	a3,4
    1728:	00450593          	add	a1,a0,4
    172c:	4e11                	li	t3,4
    172e:	02f6f863          	bgeu	a3,a5,175e <memset+0x86>
    1732:	00e50223          	sb	a4,4(a0)
    1736:	4695                	li	a3,5
    1738:	00550593          	add	a1,a0,5
    173c:	4e15                	li	t3,5
    173e:	02d78063          	beq	a5,a3,175e <memset+0x86>
    1742:	fff50693          	add	a3,a0,-1
    1746:	00e502a3          	sb	a4,5(a0)
    174a:	8a9d                	and	a3,a3,7
    174c:	00650593          	add	a1,a0,6
    1750:	4e19                	li	t3,6
    1752:	e691                	bnez	a3,175e <memset+0x86>
    1754:	00750593          	add	a1,a0,7
    1758:	00e50323          	sb	a4,6(a0)
    175c:	4e1d                	li	t3,7
    175e:	00871693          	sll	a3,a4,0x8
    1762:	01071813          	sll	a6,a4,0x10
    1766:	8ed9                	or	a3,a3,a4
    1768:	01871893          	sll	a7,a4,0x18
    176c:	0106e6b3          	or	a3,a3,a6
    1770:	0116e6b3          	or	a3,a3,a7
    1774:	02071813          	sll	a6,a4,0x20
    1778:	02871313          	sll	t1,a4,0x28
    177c:	0106e6b3          	or	a3,a3,a6
    1780:	40f608b3          	sub	a7,a2,a5
    1784:	03071813          	sll	a6,a4,0x30
    1788:	0066e6b3          	or	a3,a3,t1
    178c:	0106e6b3          	or	a3,a3,a6
    1790:	03871313          	sll	t1,a4,0x38
    1794:	97aa                	add	a5,a5,a0
    1796:	ff88f813          	and	a6,a7,-8
    179a:	0066e6b3          	or	a3,a3,t1
    179e:	983e                	add	a6,a6,a5
    17a0:	e394                	sd	a3,0(a5)
    17a2:	07a1                	add	a5,a5,8
    17a4:	ff079ee3          	bne	a5,a6,17a0 <memset+0xc8>
    17a8:	ff88f793          	and	a5,a7,-8
    17ac:	0078f893          	and	a7,a7,7
    17b0:	00f586b3          	add	a3,a1,a5
    17b4:	01c787bb          	addw	a5,a5,t3
    17b8:	0a088b63          	beqz	a7,186e <memset+0x196>
    17bc:	00e68023          	sb	a4,0(a3)
    17c0:	0017859b          	addw	a1,a5,1
    17c4:	08c5fb63          	bgeu	a1,a2,185a <memset+0x182>
    17c8:	00e680a3          	sb	a4,1(a3)
    17cc:	0027859b          	addw	a1,a5,2
    17d0:	08c5f563          	bgeu	a1,a2,185a <memset+0x182>
    17d4:	00e68123          	sb	a4,2(a3)
    17d8:	0037859b          	addw	a1,a5,3
    17dc:	06c5ff63          	bgeu	a1,a2,185a <memset+0x182>
    17e0:	00e681a3          	sb	a4,3(a3)
    17e4:	0047859b          	addw	a1,a5,4
    17e8:	06c5f963          	bgeu	a1,a2,185a <memset+0x182>
    17ec:	00e68223          	sb	a4,4(a3)
    17f0:	0057859b          	addw	a1,a5,5
    17f4:	06c5f363          	bgeu	a1,a2,185a <memset+0x182>
    17f8:	00e682a3          	sb	a4,5(a3)
    17fc:	0067859b          	addw	a1,a5,6
    1800:	04c5fd63          	bgeu	a1,a2,185a <memset+0x182>
    1804:	00e68323          	sb	a4,6(a3)
    1808:	0077859b          	addw	a1,a5,7
    180c:	04c5f763          	bgeu	a1,a2,185a <memset+0x182>
    1810:	00e683a3          	sb	a4,7(a3)
    1814:	0087859b          	addw	a1,a5,8
    1818:	04c5f163          	bgeu	a1,a2,185a <memset+0x182>
    181c:	00e68423          	sb	a4,8(a3)
    1820:	0097859b          	addw	a1,a5,9
    1824:	02c5fb63          	bgeu	a1,a2,185a <memset+0x182>
    1828:	00e684a3          	sb	a4,9(a3)
    182c:	00a7859b          	addw	a1,a5,10
    1830:	02c5f563          	bgeu	a1,a2,185a <memset+0x182>
    1834:	00e68523          	sb	a4,10(a3)
    1838:	00b7859b          	addw	a1,a5,11
    183c:	00c5ff63          	bgeu	a1,a2,185a <memset+0x182>
    1840:	00e685a3          	sb	a4,11(a3)
    1844:	00c7859b          	addw	a1,a5,12
    1848:	00c5f963          	bgeu	a1,a2,185a <memset+0x182>
    184c:	00e68623          	sb	a4,12(a3)
    1850:	27b5                	addw	a5,a5,13
    1852:	00c7f463          	bgeu	a5,a2,185a <memset+0x182>
    1856:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    185a:	8082                	ret
    185c:	482d                	li	a6,11
    185e:	bd61                	j	16f6 <memset+0x1e>
    char *p = dest;
    1860:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1862:	4e01                	li	t3,0
    1864:	bded                	j	175e <memset+0x86>
    1866:	00150593          	add	a1,a0,1
    186a:	4e05                	li	t3,1
    186c:	bdcd                	j	175e <memset+0x86>
    186e:	8082                	ret
    char *p = dest;
    1870:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1872:	4781                	li	a5,0
    1874:	b7a1                	j	17bc <memset+0xe4>
    1876:	00250593          	add	a1,a0,2
    187a:	4e09                	li	t3,2
    187c:	b5cd                	j	175e <memset+0x86>

000000000000187e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    187e:	00054783          	lbu	a5,0(a0)
    1882:	0005c703          	lbu	a4,0(a1)
    1886:	00e79863          	bne	a5,a4,1896 <strcmp+0x18>
    188a:	0505                	add	a0,a0,1
    188c:	0585                	add	a1,a1,1
    188e:	fbe5                	bnez	a5,187e <strcmp>
    1890:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1892:	9d19                	subw	a0,a0,a4
    1894:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1896:	0007851b          	sext.w	a0,a5
    189a:	bfe5                	j	1892 <strcmp+0x14>

000000000000189c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    189c:	ca15                	beqz	a2,18d0 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18a2:	167d                	add	a2,a2,-1
    18a4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a8:	eb99                	bnez	a5,18be <strncmp+0x22>
    18aa:	a815                	j	18de <strncmp+0x42>
    18ac:	00a68e63          	beq	a3,a0,18c8 <strncmp+0x2c>
    18b0:	0505                	add	a0,a0,1
    18b2:	00f71b63          	bne	a4,a5,18c8 <strncmp+0x2c>
    18b6:	00054783          	lbu	a5,0(a0)
    18ba:	cf89                	beqz	a5,18d4 <strncmp+0x38>
    18bc:	85b2                	mv	a1,a2
    18be:	0005c703          	lbu	a4,0(a1)
    18c2:	00158613          	add	a2,a1,1
    18c6:	f37d                	bnez	a4,18ac <strncmp+0x10>
        ;
    return *l - *r;
    18c8:	0007851b          	sext.w	a0,a5
    18cc:	9d19                	subw	a0,a0,a4
    18ce:	8082                	ret
        return 0;
    18d0:	4501                	li	a0,0
}
    18d2:	8082                	ret
    return *l - *r;
    18d4:	0015c703          	lbu	a4,1(a1)
    18d8:	4501                	li	a0,0
    18da:	9d19                	subw	a0,a0,a4
    18dc:	8082                	ret
    18de:	0005c703          	lbu	a4,0(a1)
    18e2:	4501                	li	a0,0
    18e4:	b7e5                	j	18cc <strncmp+0x30>

00000000000018e6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18e6:	00757793          	and	a5,a0,7
    18ea:	cf89                	beqz	a5,1904 <strlen+0x1e>
    18ec:	87aa                	mv	a5,a0
    18ee:	a029                	j	18f8 <strlen+0x12>
    18f0:	0785                	add	a5,a5,1
    18f2:	0077f713          	and	a4,a5,7
    18f6:	cb01                	beqz	a4,1906 <strlen+0x20>
        if (!*s)
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	fb75                	bnez	a4,18f0 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18fe:	40a78533          	sub	a0,a5,a0
}
    1902:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1904:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1906:	6394                	ld	a3,0(a5)
    1908:	00000597          	auipc	a1,0x0
    190c:	7205b583          	ld	a1,1824(a1) # 2028 <__clone+0x108>
    1910:	00000617          	auipc	a2,0x0
    1914:	72063603          	ld	a2,1824(a2) # 2030 <__clone+0x110>
    1918:	a019                	j	191e <strlen+0x38>
    191a:	6794                	ld	a3,8(a5)
    191c:	07a1                	add	a5,a5,8
    191e:	00b68733          	add	a4,a3,a1
    1922:	fff6c693          	not	a3,a3
    1926:	8f75                	and	a4,a4,a3
    1928:	8f71                	and	a4,a4,a2
    192a:	db65                	beqz	a4,191a <strlen+0x34>
    for (; *s; s++)
    192c:	0007c703          	lbu	a4,0(a5)
    1930:	d779                	beqz	a4,18fe <strlen+0x18>
    1932:	0017c703          	lbu	a4,1(a5)
    1936:	0785                	add	a5,a5,1
    1938:	d379                	beqz	a4,18fe <strlen+0x18>
    193a:	0017c703          	lbu	a4,1(a5)
    193e:	0785                	add	a5,a5,1
    1940:	fb6d                	bnez	a4,1932 <strlen+0x4c>
    1942:	bf75                	j	18fe <strlen+0x18>

0000000000001944 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1944:	00757713          	and	a4,a0,7
{
    1948:	87aa                	mv	a5,a0
    194a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194e:	cb19                	beqz	a4,1964 <memchr+0x20>
    1950:	ce25                	beqz	a2,19c8 <memchr+0x84>
    1952:	0007c703          	lbu	a4,0(a5)
    1956:	00b70763          	beq	a4,a1,1964 <memchr+0x20>
    195a:	0785                	add	a5,a5,1
    195c:	0077f713          	and	a4,a5,7
    1960:	167d                	add	a2,a2,-1
    1962:	f77d                	bnez	a4,1950 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1964:	4501                	li	a0,0
    if (n && *s != c)
    1966:	c235                	beqz	a2,19ca <memchr+0x86>
    1968:	0007c703          	lbu	a4,0(a5)
    196c:	06b70063          	beq	a4,a1,19cc <memchr+0x88>
        size_t k = ONES * c;
    1970:	00000517          	auipc	a0,0x0
    1974:	6c853503          	ld	a0,1736(a0) # 2038 <__clone+0x118>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1978:	471d                	li	a4,7
        size_t k = ONES * c;
    197a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    197e:	04c77763          	bgeu	a4,a2,19cc <memchr+0x88>
    1982:	00000897          	auipc	a7,0x0
    1986:	6a68b883          	ld	a7,1702(a7) # 2028 <__clone+0x108>
    198a:	00000817          	auipc	a6,0x0
    198e:	6a683803          	ld	a6,1702(a6) # 2030 <__clone+0x110>
    1992:	431d                	li	t1,7
    1994:	a029                	j	199e <memchr+0x5a>
    1996:	1661                	add	a2,a2,-8
    1998:	07a1                	add	a5,a5,8
    199a:	00c37c63          	bgeu	t1,a2,19b2 <memchr+0x6e>
    199e:	6398                	ld	a4,0(a5)
    19a0:	8f29                	xor	a4,a4,a0
    19a2:	011706b3          	add	a3,a4,a7
    19a6:	fff74713          	not	a4,a4
    19aa:	8f75                	and	a4,a4,a3
    19ac:	01077733          	and	a4,a4,a6
    19b0:	d37d                	beqz	a4,1996 <memchr+0x52>
    19b2:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19b4:	e601                	bnez	a2,19bc <memchr+0x78>
    19b6:	a809                	j	19c8 <memchr+0x84>
    19b8:	0505                	add	a0,a0,1
    19ba:	c619                	beqz	a2,19c8 <memchr+0x84>
    19bc:	00054783          	lbu	a5,0(a0)
    19c0:	167d                	add	a2,a2,-1
    19c2:	feb79be3          	bne	a5,a1,19b8 <memchr+0x74>
    19c6:	8082                	ret
    return n ? (void *)s : 0;
    19c8:	4501                	li	a0,0
}
    19ca:	8082                	ret
    if (n && *s != c)
    19cc:	853e                	mv	a0,a5
    19ce:	b7fd                	j	19bc <memchr+0x78>

00000000000019d0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19d0:	1101                	add	sp,sp,-32
    19d2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19d4:	862e                	mv	a2,a1
{
    19d6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19d8:	4581                	li	a1,0
{
    19da:	e426                	sd	s1,8(sp)
    19dc:	ec06                	sd	ra,24(sp)
    19de:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19e0:	f65ff0ef          	jal	1944 <memchr>
    return p ? p - s : n;
    19e4:	c519                	beqz	a0,19f2 <strnlen+0x22>
}
    19e6:	60e2                	ld	ra,24(sp)
    19e8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ea:	8d05                	sub	a0,a0,s1
}
    19ec:	64a2                	ld	s1,8(sp)
    19ee:	6105                	add	sp,sp,32
    19f0:	8082                	ret
    19f2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19f4:	8522                	mv	a0,s0
}
    19f6:	6442                	ld	s0,16(sp)
    19f8:	64a2                	ld	s1,8(sp)
    19fa:	6105                	add	sp,sp,32
    19fc:	8082                	ret

00000000000019fe <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19fe:	00a5c7b3          	xor	a5,a1,a0
    1a02:	8b9d                	and	a5,a5,7
    1a04:	eb95                	bnez	a5,1a38 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a06:	0075f793          	and	a5,a1,7
    1a0a:	e7b1                	bnez	a5,1a56 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a0c:	6198                	ld	a4,0(a1)
    1a0e:	00000617          	auipc	a2,0x0
    1a12:	61a63603          	ld	a2,1562(a2) # 2028 <__clone+0x108>
    1a16:	00000817          	auipc	a6,0x0
    1a1a:	61a83803          	ld	a6,1562(a6) # 2030 <__clone+0x110>
    1a1e:	a029                	j	1a28 <strcpy+0x2a>
    1a20:	05a1                	add	a1,a1,8
    1a22:	e118                	sd	a4,0(a0)
    1a24:	6198                	ld	a4,0(a1)
    1a26:	0521                	add	a0,a0,8
    1a28:	00c707b3          	add	a5,a4,a2
    1a2c:	fff74693          	not	a3,a4
    1a30:	8ff5                	and	a5,a5,a3
    1a32:	0107f7b3          	and	a5,a5,a6
    1a36:	d7ed                	beqz	a5,1a20 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	00f50023          	sb	a5,0(a0)
    1a40:	c785                	beqz	a5,1a68 <strcpy+0x6a>
    1a42:	0015c783          	lbu	a5,1(a1)
    1a46:	0505                	add	a0,a0,1
    1a48:	0585                	add	a1,a1,1
    1a4a:	00f50023          	sb	a5,0(a0)
    1a4e:	fbf5                	bnez	a5,1a42 <strcpy+0x44>
        ;
    return d;
}
    1a50:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a52:	0505                	add	a0,a0,1
    1a54:	df45                	beqz	a4,1a0c <strcpy+0xe>
            if (!(*d = *s))
    1a56:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a5a:	0585                	add	a1,a1,1
    1a5c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	f7fd                	bnez	a5,1a52 <strcpy+0x54>
}
    1a66:	8082                	ret
    1a68:	8082                	ret

0000000000001a6a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a6a:	00a5c7b3          	xor	a5,a1,a0
    1a6e:	8b9d                	and	a5,a5,7
    1a70:	e3b5                	bnez	a5,1ad4 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a72:	0075f793          	and	a5,a1,7
    1a76:	cf99                	beqz	a5,1a94 <strncpy+0x2a>
    1a78:	ea09                	bnez	a2,1a8a <strncpy+0x20>
    1a7a:	a421                	j	1c82 <strncpy+0x218>
    1a7c:	0585                	add	a1,a1,1
    1a7e:	0075f793          	and	a5,a1,7
    1a82:	167d                	add	a2,a2,-1
    1a84:	0505                	add	a0,a0,1
    1a86:	c799                	beqz	a5,1a94 <strncpy+0x2a>
    1a88:	c225                	beqz	a2,1ae8 <strncpy+0x7e>
    1a8a:	0005c783          	lbu	a5,0(a1)
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	f7ed                	bnez	a5,1a7c <strncpy+0x12>
            ;
        if (!n || !*s)
    1a94:	ca31                	beqz	a2,1ae8 <strncpy+0x7e>
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	cba1                	beqz	a5,1aea <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a9c:	479d                	li	a5,7
    1a9e:	02c7fc63          	bgeu	a5,a2,1ad6 <strncpy+0x6c>
    1aa2:	00000897          	auipc	a7,0x0
    1aa6:	5868b883          	ld	a7,1414(a7) # 2028 <__clone+0x108>
    1aaa:	00000817          	auipc	a6,0x0
    1aae:	58683803          	ld	a6,1414(a6) # 2030 <__clone+0x110>
    1ab2:	431d                	li	t1,7
    1ab4:	a039                	j	1ac2 <strncpy+0x58>
            *wd = *ws;
    1ab6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab8:	1661                	add	a2,a2,-8
    1aba:	05a1                	add	a1,a1,8
    1abc:	0521                	add	a0,a0,8
    1abe:	00c37b63          	bgeu	t1,a2,1ad4 <strncpy+0x6a>
    1ac2:	6198                	ld	a4,0(a1)
    1ac4:	011707b3          	add	a5,a4,a7
    1ac8:	fff74693          	not	a3,a4
    1acc:	8ff5                	and	a5,a5,a3
    1ace:	0107f7b3          	and	a5,a5,a6
    1ad2:	d3f5                	beqz	a5,1ab6 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ad4:	ca11                	beqz	a2,1ae8 <strncpy+0x7e>
    1ad6:	0005c783          	lbu	a5,0(a1)
    1ada:	0585                	add	a1,a1,1
    1adc:	00f50023          	sb	a5,0(a0)
    1ae0:	c789                	beqz	a5,1aea <strncpy+0x80>
    1ae2:	167d                	add	a2,a2,-1
    1ae4:	0505                	add	a0,a0,1
    1ae6:	fa65                	bnez	a2,1ad6 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae8:	8082                	ret
    1aea:	4805                	li	a6,1
    1aec:	14061b63          	bnez	a2,1c42 <strncpy+0x1d8>
    1af0:	40a00733          	neg	a4,a0
    1af4:	00777793          	and	a5,a4,7
    1af8:	4581                	li	a1,0
    1afa:	12061c63          	bnez	a2,1c32 <strncpy+0x1c8>
    1afe:	00778693          	add	a3,a5,7
    1b02:	48ad                	li	a7,11
    1b04:	1316e563          	bltu	a3,a7,1c2e <strncpy+0x1c4>
    1b08:	16d5e263          	bltu	a1,a3,1c6c <strncpy+0x202>
    1b0c:	14078c63          	beqz	a5,1c64 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b10:	00050023          	sb	zero,0(a0)
    1b14:	00677693          	and	a3,a4,6
    1b18:	14068263          	beqz	a3,1c5c <strncpy+0x1f2>
    1b1c:	000500a3          	sb	zero,1(a0)
    1b20:	4689                	li	a3,2
    1b22:	14f6f863          	bgeu	a3,a5,1c72 <strncpy+0x208>
    1b26:	00050123          	sb	zero,2(a0)
    1b2a:	8b11                	and	a4,a4,4
    1b2c:	12070463          	beqz	a4,1c54 <strncpy+0x1ea>
    1b30:	000501a3          	sb	zero,3(a0)
    1b34:	4711                	li	a4,4
    1b36:	00450693          	add	a3,a0,4
    1b3a:	02f77563          	bgeu	a4,a5,1b64 <strncpy+0xfa>
    1b3e:	00050223          	sb	zero,4(a0)
    1b42:	4715                	li	a4,5
    1b44:	00550693          	add	a3,a0,5
    1b48:	00e78e63          	beq	a5,a4,1b64 <strncpy+0xfa>
    1b4c:	fff50713          	add	a4,a0,-1
    1b50:	000502a3          	sb	zero,5(a0)
    1b54:	8b1d                	and	a4,a4,7
    1b56:	12071263          	bnez	a4,1c7a <strncpy+0x210>
    1b5a:	00750693          	add	a3,a0,7
    1b5e:	00050323          	sb	zero,6(a0)
    1b62:	471d                	li	a4,7
    1b64:	40f80833          	sub	a6,a6,a5
    1b68:	ff887593          	and	a1,a6,-8
    1b6c:	97aa                	add	a5,a5,a0
    1b6e:	95be                	add	a1,a1,a5
    1b70:	0007b023          	sd	zero,0(a5)
    1b74:	07a1                	add	a5,a5,8
    1b76:	feb79de3          	bne	a5,a1,1b70 <strncpy+0x106>
    1b7a:	ff887593          	and	a1,a6,-8
    1b7e:	00787813          	and	a6,a6,7
    1b82:	00e587bb          	addw	a5,a1,a4
    1b86:	00b68733          	add	a4,a3,a1
    1b8a:	0e080063          	beqz	a6,1c6a <strncpy+0x200>
    1b8e:	00070023          	sb	zero,0(a4)
    1b92:	0017869b          	addw	a3,a5,1
    1b96:	f4c6f9e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1b9a:	000700a3          	sb	zero,1(a4)
    1b9e:	0027869b          	addw	a3,a5,2
    1ba2:	f4c6f3e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1ba6:	00070123          	sb	zero,2(a4)
    1baa:	0037869b          	addw	a3,a5,3
    1bae:	f2c6fde3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bb2:	000701a3          	sb	zero,3(a4)
    1bb6:	0047869b          	addw	a3,a5,4
    1bba:	f2c6f7e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bbe:	00070223          	sb	zero,4(a4)
    1bc2:	0057869b          	addw	a3,a5,5
    1bc6:	f2c6f1e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bca:	000702a3          	sb	zero,5(a4)
    1bce:	0067869b          	addw	a3,a5,6
    1bd2:	f0c6fbe3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bd6:	00070323          	sb	zero,6(a4)
    1bda:	0077869b          	addw	a3,a5,7
    1bde:	f0c6f5e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1be2:	000703a3          	sb	zero,7(a4)
    1be6:	0087869b          	addw	a3,a5,8
    1bea:	eec6ffe3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bee:	00070423          	sb	zero,8(a4)
    1bf2:	0097869b          	addw	a3,a5,9
    1bf6:	eec6f9e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1bfa:	000704a3          	sb	zero,9(a4)
    1bfe:	00a7869b          	addw	a3,a5,10
    1c02:	eec6f3e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1c06:	00070523          	sb	zero,10(a4)
    1c0a:	00b7869b          	addw	a3,a5,11
    1c0e:	ecc6fde3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1c12:	000705a3          	sb	zero,11(a4)
    1c16:	00c7869b          	addw	a3,a5,12
    1c1a:	ecc6f7e3          	bgeu	a3,a2,1ae8 <strncpy+0x7e>
    1c1e:	00070623          	sb	zero,12(a4)
    1c22:	27b5                	addw	a5,a5,13
    1c24:	ecc7f2e3          	bgeu	a5,a2,1ae8 <strncpy+0x7e>
    1c28:	000706a3          	sb	zero,13(a4)
}
    1c2c:	8082                	ret
    1c2e:	46ad                	li	a3,11
    1c30:	bde1                	j	1b08 <strncpy+0x9e>
    1c32:	00778693          	add	a3,a5,7
    1c36:	48ad                	li	a7,11
    1c38:	fff60593          	add	a1,a2,-1
    1c3c:	ed16f6e3          	bgeu	a3,a7,1b08 <strncpy+0x9e>
    1c40:	b7fd                	j	1c2e <strncpy+0x1c4>
    1c42:	40a00733          	neg	a4,a0
    1c46:	8832                	mv	a6,a2
    1c48:	00777793          	and	a5,a4,7
    1c4c:	4581                	li	a1,0
    1c4e:	ea0608e3          	beqz	a2,1afe <strncpy+0x94>
    1c52:	b7c5                	j	1c32 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c54:	00350693          	add	a3,a0,3
    1c58:	470d                	li	a4,3
    1c5a:	b729                	j	1b64 <strncpy+0xfa>
    1c5c:	00150693          	add	a3,a0,1
    1c60:	4705                	li	a4,1
    1c62:	b709                	j	1b64 <strncpy+0xfa>
tail:
    1c64:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c66:	4701                	li	a4,0
    1c68:	bdf5                	j	1b64 <strncpy+0xfa>
    1c6a:	8082                	ret
tail:
    1c6c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6e:	4781                	li	a5,0
    1c70:	bf39                	j	1b8e <strncpy+0x124>
    1c72:	00250693          	add	a3,a0,2
    1c76:	4709                	li	a4,2
    1c78:	b5f5                	j	1b64 <strncpy+0xfa>
    1c7a:	00650693          	add	a3,a0,6
    1c7e:	4719                	li	a4,6
    1c80:	b5d5                	j	1b64 <strncpy+0xfa>
    1c82:	8082                	ret

0000000000001c84 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c84:	87aa                	mv	a5,a0
    1c86:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c88:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c8c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c90:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c92:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c94:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <openat>:
    register long a7 __asm__("a7") = n;
    1c9c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ca0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <close>:
    register long a7 __asm__("a7") = n;
    1cac:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cb0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <read>:
    register long a7 __asm__("a7") = n;
    1cb8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cc0:	8082                	ret

0000000000001cc2 <write>:
    register long a7 __asm__("a7") = n;
    1cc2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cca:	8082                	ret

0000000000001ccc <getpid>:
    register long a7 __asm__("a7") = n;
    1ccc:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cd0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <getppid>:
    register long a7 __asm__("a7") = n;
    1cd8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cdc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ce4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ce8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <fork>:
    register long a7 __asm__("a7") = n;
    1cf0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cf4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cf6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d00:	85b2                	mv	a1,a2
    1d02:	863a                	mv	a2,a4
    if (stack)
    1d04:	c191                	beqz	a1,1d08 <clone+0x8>
	stack += stack_size;
    1d06:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d08:	4781                	li	a5,0
    1d0a:	4701                	li	a4,0
    1d0c:	4681                	li	a3,0
    1d0e:	2601                	sext.w	a2,a2
    1d10:	ac01                	j	1f20 <__clone>

0000000000001d12 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d12:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d16:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d1a:	8082                	ret

0000000000001d1c <exit>:
    register long a7 __asm__("a7") = n;
    1d1c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d24:	8082                	ret

0000000000001d26 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d26:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d2a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <exec>:
    register long a7 __asm__("a7") = n;
    1d34:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d38:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <execve>:
    register long a7 __asm__("a7") = n;
    1d40:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d44:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <times>:
    register long a7 __asm__("a7") = n;
    1d4c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <get_time>:

int64 get_time()
{
    1d58:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d5a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d5e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d60:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d62:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d66:	2501                	sext.w	a0,a0
    1d68:	ed09                	bnez	a0,1d82 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d6a:	67a2                	ld	a5,8(sp)
    1d6c:	3e800713          	li	a4,1000
    1d70:	00015503          	lhu	a0,0(sp)
    1d74:	02e7d7b3          	divu	a5,a5,a4
    1d78:	02e50533          	mul	a0,a0,a4
    1d7c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d7e:	0141                	add	sp,sp,16
    1d80:	8082                	ret
        return -1;
    1d82:	557d                	li	a0,-1
    1d84:	bfed                	j	1d7e <get_time+0x26>

0000000000001d86 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d86:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <time>:
    register long a7 __asm__("a7") = n;
    1d92:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d96:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <sleep>:

int sleep(unsigned long long time)
{
    1d9e:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1da0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1da2:	850a                	mv	a0,sp
    1da4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1da6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1daa:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db0:	e501                	bnez	a0,1db8 <sleep+0x1a>
    return 0;
    1db2:	4501                	li	a0,0
}
    1db4:	0141                	add	sp,sp,16
    1db6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db8:	4502                	lw	a0,0(sp)
}
    1dba:	0141                	add	sp,sp,16
    1dbc:	8082                	ret

0000000000001dbe <set_priority>:
    register long a7 __asm__("a7") = n;
    1dbe:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dc2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dca:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dce:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dd2:	8082                	ret

0000000000001dd4 <mprotect>:
    register long a7 __asm__("a7") = n;
    1dd4:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd8:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <munmap>:
    register long a7 __asm__("a7") = n;
    1de0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <wait>:

int wait(int *code)
{
    1dec:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dee:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1df2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1df4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1df6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <spawn>:
    register long a7 __asm__("a7") = n;
    1e00:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <mailread>:
    register long a7 __asm__("a7") = n;
    1e0c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e10:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e18:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <fstat>:
    register long a7 __asm__("a7") = n;
    1e24:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e28:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e30:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e32:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e36:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e38:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e40:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e42:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e46:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e48:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e50:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e52:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e56:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <link>:

int link(char *old_path, char *new_path)
{
    1e60:	87aa                	mv	a5,a0
    1e62:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e64:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e6c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e6e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e72:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e74:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <unlink>:

int unlink(char *path)
{
    1e7c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e7e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e82:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <uname>:
    register long a7 __asm__("a7") = n;
    1e90:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e94:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <brk>:
    register long a7 __asm__("a7") = n;
    1e9c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ea0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ea8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eaa:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1eae:	8082                	ret

0000000000001eb0 <chdir>:
    register long a7 __asm__("a7") = n;
    1eb0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eb4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ebc:	862e                	mv	a2,a1
    1ebe:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ec0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ec2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ec6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eca:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ecc:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ece:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ed6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eda:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <pipe>:
    register long a7 __asm__("a7") = n;
    1ee2:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ee6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee8:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <dup>:
    register long a7 __asm__("a7") = n;
    1ef0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ef2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <dup2>:
    register long a7 __asm__("a7") = n;
    1efa:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1efc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efe:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <mount>:
    register long a7 __asm__("a7") = n;
    1f06:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <umount>:
    register long a7 __asm__("a7") = n;
    1f12:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f18:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f20:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f22:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f24:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f26:	8532                	mv	a0,a2
	mv a2, a4
    1f28:	863a                	mv	a2,a4
	mv a3, a5
    1f2a:	86be                	mv	a3,a5
	mv a4, a6
    1f2c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f2e:	0dc00893          	li	a7,220
	ecall
    1f32:	00000073          	ecall

	beqz a0, 1f
    1f36:	c111                	beqz	a0,1f3a <__clone+0x1a>
	# Parent
	ret
    1f38:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f3a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f3c:	6522                	ld	a0,8(sp)
	jalr a1
    1f3e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f40:	05d00893          	li	a7,93
	ecall
    1f44:	00000073          	ecall
