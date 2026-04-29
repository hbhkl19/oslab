
/home/hbh/oslab/oslab/user/build/riscv64/pipe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a281                	j	1142 <__start_main>

0000000000001004 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1004:	7135                	add	sp,sp,-160
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f7250513          	add	a0,a0,-142 # 1f78 <__clone+0x28>
void test_pipe(void){
    100e:	ed06                	sd	ra,152(sp)
    1010:	e922                	sd	s0,144(sp)
    1012:	e526                	sd	s1,136(sp)
    TEST_START(__func__);
    1014:	386000ef          	jal	139a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	01050513          	add	a0,a0,16 # 2028 <__func__.0>
    1020:	37a000ef          	jal	139a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f6c50513          	add	a0,a0,-148 # 1f90 <__clone+0x40>
    102c:	36e000ef          	jal	139a <puts>
    int cpid;
    char buf[128] = {0};
    int ret = pipe(fd);
    1030:	00001517          	auipc	a0,0x1
    1034:	ff050513          	add	a0,a0,-16 # 2020 <fd>
    char buf[128] = {0};
    1038:	e002                	sd	zero,0(sp)
    103a:	e402                	sd	zero,8(sp)
    103c:	e802                	sd	zero,16(sp)
    103e:	ec02                	sd	zero,24(sp)
    1040:	f002                	sd	zero,32(sp)
    1042:	f402                	sd	zero,40(sp)
    1044:	f802                	sd	zero,48(sp)
    1046:	fc02                	sd	zero,56(sp)
    1048:	e082                	sd	zero,64(sp)
    104a:	e482                	sd	zero,72(sp)
    104c:	e882                	sd	zero,80(sp)
    104e:	ec82                	sd	zero,88(sp)
    1050:	f082                	sd	zero,96(sp)
    1052:	f482                	sd	zero,104(sp)
    1054:	f882                	sd	zero,112(sp)
    1056:	fc82                	sd	zero,120(sp)
    int ret = pipe(fd);
    1058:	6bb000ef          	jal	1f12 <pipe>
    assert(ret != -1);
    105c:	57fd                	li	a5,-1
    105e:	0cf50363          	beq	a0,a5,1124 <test_pipe+0x120>
    const char *data = "  Write to pipe successfully.\n";
    cpid = fork();
    1062:	4bf000ef          	jal	1d20 <fork>
    1066:	842a                	mv	s0,a0
    printf("cpid: %d\n", cpid);
    1068:	85aa                	mv	a1,a0
    106a:	00001517          	auipc	a0,0x1
    106e:	f5650513          	add	a0,a0,-170 # 1fc0 <__clone+0x70>
    1072:	34a000ef          	jal	13bc <printf>
    if(cpid > 0){
    1076:	06805a63          	blez	s0,10ea <test_pipe+0xe6>
	close(fd[1]);
    107a:	00001417          	auipc	s0,0x1
    107e:	fa640413          	add	s0,s0,-90 # 2020 <fd>
    1082:	4048                	lw	a0,4(s0)
    1084:	459000ef          	jal	1cdc <close>
	while(read(fd[0], buf, 1) > 0)
    1088:	a019                	j	108e <test_pipe+0x8a>
            write(STDOUT, buf, 1);
    108a:	469000ef          	jal	1cf2 <write>
	while(read(fd[0], buf, 1) > 0)
    108e:	4008                	lw	a0,0(s0)
    1090:	4605                	li	a2,1
    1092:	858a                	mv	a1,sp
    1094:	455000ef          	jal	1ce8 <read>
    1098:	87aa                	mv	a5,a0
            write(STDOUT, buf, 1);
    109a:	4605                	li	a2,1
    109c:	858a                	mv	a1,sp
    109e:	4505                	li	a0,1
	while(read(fd[0], buf, 1) > 0)
    10a0:	fef045e3          	bgtz	a5,108a <test_pipe+0x86>
	write(STDOUT, "\n", 1);
    10a4:	00001597          	auipc	a1,0x1
    10a8:	f1458593          	add	a1,a1,-236 # 1fb8 <__clone+0x68>
    10ac:	447000ef          	jal	1cf2 <write>
	close(fd[0]);
    10b0:	4008                	lw	a0,0(s0)
    10b2:	42b000ef          	jal	1cdc <close>
	wait(NULL);
    10b6:	4501                	li	a0,0
    10b8:	565000ef          	jal	1e1c <wait>
	close(fd[0]);
	write(fd[1], data, strlen(data));
	close(fd[1]);
	exit(0);
    }
    TEST_END(__func__);
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f3450513          	add	a0,a0,-204 # 1ff0 <__clone+0xa0>
    10c4:	2d6000ef          	jal	139a <puts>
    10c8:	00001517          	auipc	a0,0x1
    10cc:	f6050513          	add	a0,a0,-160 # 2028 <__func__.0>
    10d0:	2ca000ef          	jal	139a <puts>
    10d4:	00001517          	auipc	a0,0x1
    10d8:	ebc50513          	add	a0,a0,-324 # 1f90 <__clone+0x40>
    10dc:	2be000ef          	jal	139a <puts>
}
    10e0:	60ea                	ld	ra,152(sp)
    10e2:	644a                	ld	s0,144(sp)
    10e4:	64aa                	ld	s1,136(sp)
    10e6:	610d                	add	sp,sp,160
    10e8:	8082                	ret
	close(fd[0]);
    10ea:	00001417          	auipc	s0,0x1
    10ee:	f3640413          	add	s0,s0,-202 # 2020 <fd>
    10f2:	4008                	lw	a0,0(s0)
    10f4:	3e9000ef          	jal	1cdc <close>
	write(fd[1], data, strlen(data));
    10f8:	4044                	lw	s1,4(s0)
    10fa:	00001517          	auipc	a0,0x1
    10fe:	ed650513          	add	a0,a0,-298 # 1fd0 <__clone+0x80>
    1102:	015000ef          	jal	1916 <strlen>
    1106:	862a                	mv	a2,a0
    1108:	00001597          	auipc	a1,0x1
    110c:	ec858593          	add	a1,a1,-312 # 1fd0 <__clone+0x80>
    1110:	8526                	mv	a0,s1
    1112:	3e1000ef          	jal	1cf2 <write>
	close(fd[1]);
    1116:	4048                	lw	a0,4(s0)
    1118:	3c5000ef          	jal	1cdc <close>
	exit(0);
    111c:	4501                	li	a0,0
    111e:	42f000ef          	jal	1d4c <exit>
    1122:	bf69                	j	10bc <test_pipe+0xb8>
    assert(ret != -1);
    1124:	00001517          	auipc	a0,0x1
    1128:	e7c50513          	add	a0,a0,-388 # 1fa0 <__clone+0x50>
    112c:	50a000ef          	jal	1636 <panic>
    1130:	bf0d                	j	1062 <test_pipe+0x5e>

0000000000001132 <main>:

int main(void){
    1132:	1141                	add	sp,sp,-16
    1134:	e406                	sd	ra,8(sp)
    test_pipe();
    1136:	ecfff0ef          	jal	1004 <test_pipe>
    return 0;
}
    113a:	60a2                	ld	ra,8(sp)
    113c:	4501                	li	a0,0
    113e:	0141                	add	sp,sp,16
    1140:	8082                	ret

0000000000001142 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1142:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1144:	4108                	lw	a0,0(a0)
{
    1146:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1148:	05a1                	add	a1,a1,8
{
    114a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    114c:	fe7ff0ef          	jal	1132 <main>
    1150:	3fd000ef          	jal	1d4c <exit>
	return 0;
}
    1154:	60a2                	ld	ra,8(sp)
    1156:	4501                	li	a0,0
    1158:	0141                	add	sp,sp,16
    115a:	8082                	ret

000000000000115c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    115c:	7179                	add	sp,sp,-48
    115e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1160:	12054863          	bltz	a0,1290 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1164:	02b577bb          	remuw	a5,a0,a1
    1168:	00001697          	auipc	a3,0x1
    116c:	ed068693          	add	a3,a3,-304 # 2038 <digits>
    buf[16] = 0;
    1170:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1174:	0005871b          	sext.w	a4,a1
    1178:	1782                	sll	a5,a5,0x20
    117a:	9381                	srl	a5,a5,0x20
    117c:	97b6                	add	a5,a5,a3
    117e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1182:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1186:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    118a:	1ab56663          	bltu	a0,a1,1336 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    118e:	02e8763b          	remuw	a2,a6,a4
    1192:	1602                	sll	a2,a2,0x20
    1194:	9201                	srl	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a0:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11a4:	12e86c63          	bltu	a6,a4,12dc <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11a8:	02e5f63b          	remuw	a2,a1,a4
    11ac:	1602                	sll	a2,a2,0x20
    11ae:	9201                	srl	a2,a2,0x20
    11b0:	9636                	add	a2,a2,a3
    11b2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ba:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11be:	12e5e863          	bltu	a1,a4,12ee <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    11c2:	02e8763b          	remuw	a2,a6,a4
    11c6:	1602                	sll	a2,a2,0x20
    11c8:	9201                	srl	a2,a2,0x20
    11ca:	9636                	add	a2,a2,a3
    11cc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d4:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11d8:	12e86463          	bltu	a6,a4,1300 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    11dc:	02e5f63b          	remuw	a2,a1,a4
    11e0:	1602                	sll	a2,a2,0x20
    11e2:	9201                	srl	a2,a2,0x20
    11e4:	9636                	add	a2,a2,a3
    11e6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ea:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ee:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11f2:	12e5e063          	bltu	a1,a4,1312 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11f6:	02e8763b          	remuw	a2,a6,a4
    11fa:	1602                	sll	a2,a2,0x20
    11fc:	9201                	srl	a2,a2,0x20
    11fe:	9636                	add	a2,a2,a3
    1200:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1204:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1208:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    120c:	0ae86f63          	bltu	a6,a4,12ca <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1210:	02e5f63b          	remuw	a2,a1,a4
    1214:	1602                	sll	a2,a2,0x20
    1216:	9201                	srl	a2,a2,0x20
    1218:	9636                	add	a2,a2,a3
    121a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    121e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1222:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1226:	0ee5ef63          	bltu	a1,a4,1324 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    122a:	02e8763b          	remuw	a2,a6,a4
    122e:	1602                	sll	a2,a2,0x20
    1230:	9201                	srl	a2,a2,0x20
    1232:	9636                	add	a2,a2,a3
    1234:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1238:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    123c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1240:	0ee86d63          	bltu	a6,a4,133a <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    1244:	02e5f63b          	remuw	a2,a1,a4
    1248:	1602                	sll	a2,a2,0x20
    124a:	9201                	srl	a2,a2,0x20
    124c:	9636                	add	a2,a2,a3
    124e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1252:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1256:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    125a:	0ee5e963          	bltu	a1,a4,134c <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    125e:	1782                	sll	a5,a5,0x20
    1260:	9381                	srl	a5,a5,0x20
    1262:	96be                	add	a3,a3,a5
    1264:	0006c783          	lbu	a5,0(a3)
    1268:	4599                	li	a1,6
    126a:	00f10723          	sb	a5,14(sp)

    if (sign)
    126e:	00055763          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    127a:	4595                	li	a1,5
    write(f, s, l);
    127c:	003c                	add	a5,sp,8
    127e:	4641                	li	a2,16
    1280:	9e0d                	subw	a2,a2,a1
    1282:	4505                	li	a0,1
    1284:	95be                	add	a1,a1,a5
    1286:	26d000ef          	jal	1cf2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    128a:	70a2                	ld	ra,40(sp)
    128c:	6145                	add	sp,sp,48
    128e:	8082                	ret
        x = -xx;
    1290:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1294:	02b677bb          	remuw	a5,a2,a1
    1298:	00001697          	auipc	a3,0x1
    129c:	da068693          	add	a3,a3,-608 # 2038 <digits>
    buf[16] = 0;
    12a0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12a4:	0005871b          	sext.w	a4,a1
    12a8:	1782                	sll	a5,a5,0x20
    12aa:	9381                	srl	a5,a5,0x20
    12ac:	97b6                	add	a5,a5,a3
    12ae:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12b2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12b6:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12ba:	ecb67ae3          	bgeu	a2,a1,118e <printint.constprop.0+0x32>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12c6:	45b9                	li	a1,14
    12c8:	bf55                	j	127c <printint.constprop.0+0x120>
    12ca:	45a9                	li	a1,10
    if (sign)
    12cc:	fa0558e3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d0:	02d00793          	li	a5,45
    12d4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12d8:	45a5                	li	a1,9
    12da:	b74d                	j	127c <printint.constprop.0+0x120>
    12dc:	45b9                	li	a1,14
    if (sign)
    12de:	f8055fe3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12ea:	45b5                	li	a1,13
    12ec:	bf41                	j	127c <printint.constprop.0+0x120>
    12ee:	45b5                	li	a1,13
    if (sign)
    12f0:	f80556e3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f4:	02d00793          	li	a5,45
    12f8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12fc:	45b1                	li	a1,12
    12fe:	bfbd                	j	127c <printint.constprop.0+0x120>
    1300:	45b1                	li	a1,12
    if (sign)
    1302:	f6055de3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    130e:	45ad                	li	a1,11
    1310:	b7b5                	j	127c <printint.constprop.0+0x120>
    1312:	45ad                	li	a1,11
    if (sign)
    1314:	f60554e3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1320:	45a9                	li	a1,10
    1322:	bfa9                	j	127c <printint.constprop.0+0x120>
    1324:	45a5                	li	a1,9
    if (sign)
    1326:	f4055be3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    132a:	02d00793          	li	a5,45
    132e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1332:	45a1                	li	a1,8
    1334:	b7a1                	j	127c <printint.constprop.0+0x120>
    i = 15;
    1336:	45bd                	li	a1,15
    1338:	b791                	j	127c <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    133a:	45a1                	li	a1,8
    if (sign)
    133c:	f40550e3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1340:	02d00793          	li	a5,45
    1344:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1348:	459d                	li	a1,7
    134a:	bf0d                	j	127c <printint.constprop.0+0x120>
    134c:	459d                	li	a1,7
    if (sign)
    134e:	f20557e3          	bgez	a0,127c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1352:	02d00793          	li	a5,45
    1356:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    135a:	4599                	li	a1,6
    135c:	b705                	j	127c <printint.constprop.0+0x120>

000000000000135e <getchar>:
{
    135e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1360:	00f10593          	add	a1,sp,15
    1364:	4605                	li	a2,1
    1366:	4501                	li	a0,0
{
    1368:	ec06                	sd	ra,24(sp)
    char byte = 0;
    136a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    136e:	17b000ef          	jal	1ce8 <read>
}
    1372:	60e2                	ld	ra,24(sp)
    1374:	00f14503          	lbu	a0,15(sp)
    1378:	6105                	add	sp,sp,32
    137a:	8082                	ret

000000000000137c <putchar>:
{
    137c:	1101                	add	sp,sp,-32
    137e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1380:	00f10593          	add	a1,sp,15
    1384:	4605                	li	a2,1
    1386:	4505                	li	a0,1
{
    1388:	ec06                	sd	ra,24(sp)
    char byte = c;
    138a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    138e:	165000ef          	jal	1cf2 <write>
}
    1392:	60e2                	ld	ra,24(sp)
    1394:	2501                	sext.w	a0,a0
    1396:	6105                	add	sp,sp,32
    1398:	8082                	ret

000000000000139a <puts>:
{
    139a:	1141                	add	sp,sp,-16
    139c:	e406                	sd	ra,8(sp)
    139e:	e022                	sd	s0,0(sp)
    13a0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13a2:	574000ef          	jal	1916 <strlen>
    13a6:	862a                	mv	a2,a0
    13a8:	85a2                	mv	a1,s0
    13aa:	4505                	li	a0,1
    13ac:	147000ef          	jal	1cf2 <write>
}
    13b0:	60a2                	ld	ra,8(sp)
    13b2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13b4:	957d                	sra	a0,a0,0x3f
    return r;
    13b6:	2501                	sext.w	a0,a0
}
    13b8:	0141                	add	sp,sp,16
    13ba:	8082                	ret

00000000000013bc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13bc:	7171                	add	sp,sp,-176
    13be:	f85a                	sd	s6,48(sp)
    13c0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13c2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13c4:	18bc                	add	a5,sp,120
{
    13c6:	e8ca                	sd	s2,80(sp)
    13c8:	e4ce                	sd	s3,72(sp)
    13ca:	e0d2                	sd	s4,64(sp)
    13cc:	fc56                	sd	s5,56(sp)
    13ce:	f486                	sd	ra,104(sp)
    13d0:	f0a2                	sd	s0,96(sp)
    13d2:	eca6                	sd	s1,88(sp)
    13d4:	fcae                	sd	a1,120(sp)
    13d6:	e132                	sd	a2,128(sp)
    13d8:	e536                	sd	a3,136(sp)
    13da:	e93a                	sd	a4,144(sp)
    13dc:	f142                	sd	a6,160(sp)
    13de:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13e0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13e2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13e6:	07300a13          	li	s4,115
    13ea:	07800a93          	li	s5,120
    buf[i++] = '0';
    13ee:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f2:	00001997          	auipc	s3,0x1
    13f6:	c4698993          	add	s3,s3,-954 # 2038 <digits>
        if (!*s)
    13fa:	00054783          	lbu	a5,0(a0)
    13fe:	16078a63          	beqz	a5,1572 <printf+0x1b6>
    1402:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1404:	19278d63          	beq	a5,s2,159e <printf+0x1e2>
    1408:	00164783          	lbu	a5,1(a2)
    140c:	0605                	add	a2,a2,1
    140e:	fbfd                	bnez	a5,1404 <printf+0x48>
    1410:	84b2                	mv	s1,a2
        l = z - a;
    1412:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1416:	85aa                	mv	a1,a0
    1418:	8622                	mv	a2,s0
    141a:	4505                	li	a0,1
    141c:	0d7000ef          	jal	1cf2 <write>
        if (l)
    1420:	1a041463          	bnez	s0,15c8 <printf+0x20c>
        if (s[1] == 0)
    1424:	0014c783          	lbu	a5,1(s1)
    1428:	14078563          	beqz	a5,1572 <printf+0x1b6>
        switch (s[1])
    142c:	1b478063          	beq	a5,s4,15cc <printf+0x210>
    1430:	14fa6b63          	bltu	s4,a5,1586 <printf+0x1ca>
    1434:	06400713          	li	a4,100
    1438:	1ee78063          	beq	a5,a4,1618 <printf+0x25c>
    143c:	07000713          	li	a4,112
    1440:	1ae79963          	bne	a5,a4,15f2 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1444:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1446:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    144a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    144c:	631c                	ld	a5,0(a4)
    144e:	0721                	add	a4,a4,8
    1450:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1452:	00479293          	sll	t0,a5,0x4
    1456:	00879f93          	sll	t6,a5,0x8
    145a:	00c79f13          	sll	t5,a5,0xc
    145e:	01079e93          	sll	t4,a5,0x10
    1462:	01479e13          	sll	t3,a5,0x14
    1466:	01879313          	sll	t1,a5,0x18
    146a:	01c79893          	sll	a7,a5,0x1c
    146e:	02479813          	sll	a6,a5,0x24
    1472:	02879513          	sll	a0,a5,0x28
    1476:	02c79593          	sll	a1,a5,0x2c
    147a:	03079693          	sll	a3,a5,0x30
    147e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1482:	03c7d413          	srl	s0,a5,0x3c
    1486:	01c7d39b          	srlw	t2,a5,0x1c
    148a:	03c2d293          	srl	t0,t0,0x3c
    148e:	03cfdf93          	srl	t6,t6,0x3c
    1492:	03cf5f13          	srl	t5,t5,0x3c
    1496:	03cede93          	srl	t4,t4,0x3c
    149a:	03ce5e13          	srl	t3,t3,0x3c
    149e:	03c35313          	srl	t1,t1,0x3c
    14a2:	03c8d893          	srl	a7,a7,0x3c
    14a6:	03c85813          	srl	a6,a6,0x3c
    14aa:	9171                	srl	a0,a0,0x3c
    14ac:	91f1                	srl	a1,a1,0x3c
    14ae:	92f1                	srl	a3,a3,0x3c
    14b0:	9371                	srl	a4,a4,0x3c
    14b2:	96ce                	add	a3,a3,s3
    14b4:	974e                	add	a4,a4,s3
    14b6:	944e                	add	s0,s0,s3
    14b8:	92ce                	add	t0,t0,s3
    14ba:	9fce                	add	t6,t6,s3
    14bc:	9f4e                	add	t5,t5,s3
    14be:	9ece                	add	t4,t4,s3
    14c0:	9e4e                	add	t3,t3,s3
    14c2:	934e                	add	t1,t1,s3
    14c4:	98ce                	add	a7,a7,s3
    14c6:	93ce                	add	t2,t2,s3
    14c8:	984e                	add	a6,a6,s3
    14ca:	954e                	add	a0,a0,s3
    14cc:	95ce                	add	a1,a1,s3
    14ce:	0006c083          	lbu	ra,0(a3)
    14d2:	0002c283          	lbu	t0,0(t0)
    14d6:	00074683          	lbu	a3,0(a4)
    14da:	000fcf83          	lbu	t6,0(t6)
    14de:	000f4f03          	lbu	t5,0(t5)
    14e2:	000ece83          	lbu	t4,0(t4)
    14e6:	000e4e03          	lbu	t3,0(t3)
    14ea:	00034303          	lbu	t1,0(t1)
    14ee:	0008c883          	lbu	a7,0(a7)
    14f2:	0003c383          	lbu	t2,0(t2)
    14f6:	00084803          	lbu	a6,0(a6)
    14fa:	00054503          	lbu	a0,0(a0)
    14fe:	0005c583          	lbu	a1,0(a1)
    1502:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1506:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150a:	9371                	srl	a4,a4,0x3c
    150c:	8bbd                	and	a5,a5,15
    150e:	974e                	add	a4,a4,s3
    1510:	97ce                	add	a5,a5,s3
    1512:	005105a3          	sb	t0,11(sp)
    1516:	01f10623          	sb	t6,12(sp)
    151a:	01e106a3          	sb	t5,13(sp)
    151e:	01d10723          	sb	t4,14(sp)
    1522:	01c107a3          	sb	t3,15(sp)
    1526:	00610823          	sb	t1,16(sp)
    152a:	011108a3          	sb	a7,17(sp)
    152e:	00710923          	sb	t2,18(sp)
    1532:	010109a3          	sb	a6,19(sp)
    1536:	00a10a23          	sb	a0,20(sp)
    153a:	00b10aa3          	sb	a1,21(sp)
    153e:	00110b23          	sb	ra,22(sp)
    1542:	00d10ba3          	sb	a3,23(sp)
    1546:	00810523          	sb	s0,10(sp)
    154a:	00074703          	lbu	a4,0(a4)
    154e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1552:	002c                	add	a1,sp,8
    1554:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1556:	00e10c23          	sb	a4,24(sp)
    155a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    155e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1562:	790000ef          	jal	1cf2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1566:	00248513          	add	a0,s1,2
        if (!*s)
    156a:	00054783          	lbu	a5,0(a0)
    156e:	e8079ae3          	bnez	a5,1402 <printf+0x46>
    }
    va_end(ap);
}
    1572:	70a6                	ld	ra,104(sp)
    1574:	7406                	ld	s0,96(sp)
    1576:	64e6                	ld	s1,88(sp)
    1578:	6946                	ld	s2,80(sp)
    157a:	69a6                	ld	s3,72(sp)
    157c:	6a06                	ld	s4,64(sp)
    157e:	7ae2                	ld	s5,56(sp)
    1580:	7b42                	ld	s6,48(sp)
    1582:	614d                	add	sp,sp,176
    1584:	8082                	ret
        switch (s[1])
    1586:	07579663          	bne	a5,s5,15f2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    158a:	6782                	ld	a5,0(sp)
    158c:	45c1                	li	a1,16
    158e:	4388                	lw	a0,0(a5)
    1590:	07a1                	add	a5,a5,8
    1592:	e03e                	sd	a5,0(sp)
    1594:	bc9ff0ef          	jal	115c <printint.constprop.0>
        s += 2;
    1598:	00248513          	add	a0,s1,2
    159c:	b7f9                	j	156a <printf+0x1ae>
    159e:	84b2                	mv	s1,a2
    15a0:	a039                	j	15ae <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15a2:	0024c783          	lbu	a5,2(s1)
    15a6:	0605                	add	a2,a2,1
    15a8:	0489                	add	s1,s1,2
    15aa:	e72794e3          	bne	a5,s2,1412 <printf+0x56>
    15ae:	0014c783          	lbu	a5,1(s1)
    15b2:	ff2788e3          	beq	a5,s2,15a2 <printf+0x1e6>
        l = z - a;
    15b6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15ba:	85aa                	mv	a1,a0
    15bc:	8622                	mv	a2,s0
    15be:	4505                	li	a0,1
    15c0:	732000ef          	jal	1cf2 <write>
        if (l)
    15c4:	e60400e3          	beqz	s0,1424 <printf+0x68>
    15c8:	8526                	mv	a0,s1
    15ca:	bd05                	j	13fa <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    15cc:	6782                	ld	a5,0(sp)
    15ce:	6380                	ld	s0,0(a5)
    15d0:	07a1                	add	a5,a5,8
    15d2:	e03e                	sd	a5,0(sp)
    15d4:	cc21                	beqz	s0,162c <printf+0x270>
            l = strnlen(a, 200);
    15d6:	0c800593          	li	a1,200
    15da:	8522                	mv	a0,s0
    15dc:	424000ef          	jal	1a00 <strnlen>
    write(f, s, l);
    15e0:	0005061b          	sext.w	a2,a0
    15e4:	85a2                	mv	a1,s0
    15e6:	4505                	li	a0,1
    15e8:	70a000ef          	jal	1cf2 <write>
        s += 2;
    15ec:	00248513          	add	a0,s1,2
    15f0:	bfad                	j	156a <printf+0x1ae>
    return write(stdout, &byte, 1);
    15f2:	4605                	li	a2,1
    15f4:	002c                	add	a1,sp,8
    15f6:	4505                	li	a0,1
    char byte = c;
    15f8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15fc:	6f6000ef          	jal	1cf2 <write>
    char byte = c;
    1600:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1604:	4605                	li	a2,1
    1606:	002c                	add	a1,sp,8
    1608:	4505                	li	a0,1
    char byte = c;
    160a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    160e:	6e4000ef          	jal	1cf2 <write>
        s += 2;
    1612:	00248513          	add	a0,s1,2
    1616:	bf91                	j	156a <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    1618:	6782                	ld	a5,0(sp)
    161a:	45a9                	li	a1,10
    161c:	4388                	lw	a0,0(a5)
    161e:	07a1                	add	a5,a5,8
    1620:	e03e                	sd	a5,0(sp)
    1622:	b3bff0ef          	jal	115c <printint.constprop.0>
        s += 2;
    1626:	00248513          	add	a0,s1,2
    162a:	b781                	j	156a <printf+0x1ae>
                a = "(null)";
    162c:	00001417          	auipc	s0,0x1
    1630:	9d440413          	add	s0,s0,-1580 # 2000 <__clone+0xb0>
    1634:	b74d                	j	15d6 <printf+0x21a>

0000000000001636 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1636:	1141                	add	sp,sp,-16
    1638:	e406                	sd	ra,8(sp)
    puts(m);
    163a:	d61ff0ef          	jal	139a <puts>
    exit(-100);
}
    163e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1640:	f9c00513          	li	a0,-100
}
    1644:	0141                	add	sp,sp,16
    exit(-100);
    1646:	a719                	j	1d4c <exit>

0000000000001648 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1648:	02000793          	li	a5,32
    164c:	00f50663          	beq	a0,a5,1658 <isspace+0x10>
    1650:	355d                	addw	a0,a0,-9
    1652:	00553513          	sltiu	a0,a0,5
    1656:	8082                	ret
    1658:	4505                	li	a0,1
}
    165a:	8082                	ret

000000000000165c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    165c:	fd05051b          	addw	a0,a0,-48
}
    1660:	00a53513          	sltiu	a0,a0,10
    1664:	8082                	ret

0000000000001666 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1666:	02000693          	li	a3,32
    166a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    166c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1670:	ff77871b          	addw	a4,a5,-9
    1674:	04d78c63          	beq	a5,a3,16cc <atoi+0x66>
    1678:	0007861b          	sext.w	a2,a5
    167c:	04e5f863          	bgeu	a1,a4,16cc <atoi+0x66>
        s++;
    switch (*s)
    1680:	02b00713          	li	a4,43
    1684:	04e78963          	beq	a5,a4,16d6 <atoi+0x70>
    1688:	02d00713          	li	a4,45
    168c:	06e78263          	beq	a5,a4,16f0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1690:	fd06069b          	addw	a3,a2,-48
    1694:	47a5                	li	a5,9
    1696:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1698:	4301                	li	t1,0
    while (isdigit(*s))
    169a:	04d7e963          	bltu	a5,a3,16ec <atoi+0x86>
    int n = 0, neg = 0;
    169e:	4501                	li	a0,0
    while (isdigit(*s))
    16a0:	48a5                	li	a7,9
    16a2:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16a6:	0025179b          	sllw	a5,a0,0x2
    16aa:	9fa9                	addw	a5,a5,a0
    16ac:	fd06059b          	addw	a1,a2,-48
    16b0:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    16b4:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    16b8:	0705                	add	a4,a4,1
    16ba:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    16be:	0006861b          	sext.w	a2,a3
    16c2:	ff08f0e3          	bgeu	a7,a6,16a2 <atoi+0x3c>
    return neg ? n : -n;
    16c6:	00030563          	beqz	t1,16d0 <atoi+0x6a>
}
    16ca:	8082                	ret
        s++;
    16cc:	0505                	add	a0,a0,1
    16ce:	bf79                	j	166c <atoi+0x6>
    return neg ? n : -n;
    16d0:	40f5853b          	subw	a0,a1,a5
    16d4:	8082                	ret
    while (isdigit(*s))
    16d6:	00154603          	lbu	a2,1(a0)
    16da:	47a5                	li	a5,9
        s++;
    16dc:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16e0:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    16e4:	4301                	li	t1,0
    while (isdigit(*s))
    16e6:	2601                	sext.w	a2,a2
    16e8:	fad7fbe3          	bgeu	a5,a3,169e <atoi+0x38>
    16ec:	4501                	li	a0,0
}
    16ee:	8082                	ret
    while (isdigit(*s))
    16f0:	00154603          	lbu	a2,1(a0)
    16f4:	47a5                	li	a5,9
        s++;
    16f6:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16fa:	fd06069b          	addw	a3,a2,-48
    16fe:	2601                	sext.w	a2,a2
    1700:	fed7e6e3          	bltu	a5,a3,16ec <atoi+0x86>
        neg = 1;
    1704:	4305                	li	t1,1
    1706:	bf61                	j	169e <atoi+0x38>

0000000000001708 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1708:	18060163          	beqz	a2,188a <memset+0x182>
    170c:	40a006b3          	neg	a3,a0
    1710:	0076f793          	and	a5,a3,7
    1714:	00778813          	add	a6,a5,7
    1718:	48ad                	li	a7,11
    171a:	0ff5f713          	zext.b	a4,a1
    171e:	fff60593          	add	a1,a2,-1
    1722:	17186563          	bltu	a6,a7,188c <memset+0x184>
    1726:	1705ed63          	bltu	a1,a6,18a0 <memset+0x198>
    172a:	16078363          	beqz	a5,1890 <memset+0x188>
    172e:	00e50023          	sb	a4,0(a0)
    1732:	0066f593          	and	a1,a3,6
    1736:	16058063          	beqz	a1,1896 <memset+0x18e>
    173a:	00e500a3          	sb	a4,1(a0)
    173e:	4589                	li	a1,2
    1740:	16f5f363          	bgeu	a1,a5,18a6 <memset+0x19e>
    1744:	00e50123          	sb	a4,2(a0)
    1748:	8a91                	and	a3,a3,4
    174a:	00350593          	add	a1,a0,3
    174e:	4e0d                	li	t3,3
    1750:	ce9d                	beqz	a3,178e <memset+0x86>
    1752:	00e501a3          	sb	a4,3(a0)
    1756:	4691                	li	a3,4
    1758:	00450593          	add	a1,a0,4
    175c:	4e11                	li	t3,4
    175e:	02f6f863          	bgeu	a3,a5,178e <memset+0x86>
    1762:	00e50223          	sb	a4,4(a0)
    1766:	4695                	li	a3,5
    1768:	00550593          	add	a1,a0,5
    176c:	4e15                	li	t3,5
    176e:	02d78063          	beq	a5,a3,178e <memset+0x86>
    1772:	fff50693          	add	a3,a0,-1
    1776:	00e502a3          	sb	a4,5(a0)
    177a:	8a9d                	and	a3,a3,7
    177c:	00650593          	add	a1,a0,6
    1780:	4e19                	li	t3,6
    1782:	e691                	bnez	a3,178e <memset+0x86>
    1784:	00750593          	add	a1,a0,7
    1788:	00e50323          	sb	a4,6(a0)
    178c:	4e1d                	li	t3,7
    178e:	00871693          	sll	a3,a4,0x8
    1792:	01071813          	sll	a6,a4,0x10
    1796:	8ed9                	or	a3,a3,a4
    1798:	01871893          	sll	a7,a4,0x18
    179c:	0106e6b3          	or	a3,a3,a6
    17a0:	0116e6b3          	or	a3,a3,a7
    17a4:	02071813          	sll	a6,a4,0x20
    17a8:	02871313          	sll	t1,a4,0x28
    17ac:	0106e6b3          	or	a3,a3,a6
    17b0:	40f608b3          	sub	a7,a2,a5
    17b4:	03071813          	sll	a6,a4,0x30
    17b8:	0066e6b3          	or	a3,a3,t1
    17bc:	0106e6b3          	or	a3,a3,a6
    17c0:	03871313          	sll	t1,a4,0x38
    17c4:	97aa                	add	a5,a5,a0
    17c6:	ff88f813          	and	a6,a7,-8
    17ca:	0066e6b3          	or	a3,a3,t1
    17ce:	983e                	add	a6,a6,a5
    17d0:	e394                	sd	a3,0(a5)
    17d2:	07a1                	add	a5,a5,8
    17d4:	ff079ee3          	bne	a5,a6,17d0 <memset+0xc8>
    17d8:	ff88f793          	and	a5,a7,-8
    17dc:	0078f893          	and	a7,a7,7
    17e0:	00f586b3          	add	a3,a1,a5
    17e4:	01c787bb          	addw	a5,a5,t3
    17e8:	0a088b63          	beqz	a7,189e <memset+0x196>
    17ec:	00e68023          	sb	a4,0(a3)
    17f0:	0017859b          	addw	a1,a5,1
    17f4:	08c5fb63          	bgeu	a1,a2,188a <memset+0x182>
    17f8:	00e680a3          	sb	a4,1(a3)
    17fc:	0027859b          	addw	a1,a5,2
    1800:	08c5f563          	bgeu	a1,a2,188a <memset+0x182>
    1804:	00e68123          	sb	a4,2(a3)
    1808:	0037859b          	addw	a1,a5,3
    180c:	06c5ff63          	bgeu	a1,a2,188a <memset+0x182>
    1810:	00e681a3          	sb	a4,3(a3)
    1814:	0047859b          	addw	a1,a5,4
    1818:	06c5f963          	bgeu	a1,a2,188a <memset+0x182>
    181c:	00e68223          	sb	a4,4(a3)
    1820:	0057859b          	addw	a1,a5,5
    1824:	06c5f363          	bgeu	a1,a2,188a <memset+0x182>
    1828:	00e682a3          	sb	a4,5(a3)
    182c:	0067859b          	addw	a1,a5,6
    1830:	04c5fd63          	bgeu	a1,a2,188a <memset+0x182>
    1834:	00e68323          	sb	a4,6(a3)
    1838:	0077859b          	addw	a1,a5,7
    183c:	04c5f763          	bgeu	a1,a2,188a <memset+0x182>
    1840:	00e683a3          	sb	a4,7(a3)
    1844:	0087859b          	addw	a1,a5,8
    1848:	04c5f163          	bgeu	a1,a2,188a <memset+0x182>
    184c:	00e68423          	sb	a4,8(a3)
    1850:	0097859b          	addw	a1,a5,9
    1854:	02c5fb63          	bgeu	a1,a2,188a <memset+0x182>
    1858:	00e684a3          	sb	a4,9(a3)
    185c:	00a7859b          	addw	a1,a5,10
    1860:	02c5f563          	bgeu	a1,a2,188a <memset+0x182>
    1864:	00e68523          	sb	a4,10(a3)
    1868:	00b7859b          	addw	a1,a5,11
    186c:	00c5ff63          	bgeu	a1,a2,188a <memset+0x182>
    1870:	00e685a3          	sb	a4,11(a3)
    1874:	00c7859b          	addw	a1,a5,12
    1878:	00c5f963          	bgeu	a1,a2,188a <memset+0x182>
    187c:	00e68623          	sb	a4,12(a3)
    1880:	27b5                	addw	a5,a5,13
    1882:	00c7f463          	bgeu	a5,a2,188a <memset+0x182>
    1886:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    188a:	8082                	ret
    188c:	482d                	li	a6,11
    188e:	bd61                	j	1726 <memset+0x1e>
    char *p = dest;
    1890:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1892:	4e01                	li	t3,0
    1894:	bded                	j	178e <memset+0x86>
    1896:	00150593          	add	a1,a0,1
    189a:	4e05                	li	t3,1
    189c:	bdcd                	j	178e <memset+0x86>
    189e:	8082                	ret
    char *p = dest;
    18a0:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18a2:	4781                	li	a5,0
    18a4:	b7a1                	j	17ec <memset+0xe4>
    18a6:	00250593          	add	a1,a0,2
    18aa:	4e09                	li	t3,2
    18ac:	b5cd                	j	178e <memset+0x86>

00000000000018ae <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18ae:	00054783          	lbu	a5,0(a0)
    18b2:	0005c703          	lbu	a4,0(a1)
    18b6:	00e79863          	bne	a5,a4,18c6 <strcmp+0x18>
    18ba:	0505                	add	a0,a0,1
    18bc:	0585                	add	a1,a1,1
    18be:	fbe5                	bnez	a5,18ae <strcmp>
    18c0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18c2:	9d19                	subw	a0,a0,a4
    18c4:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18c6:	0007851b          	sext.w	a0,a5
    18ca:	bfe5                	j	18c2 <strcmp+0x14>

00000000000018cc <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18cc:	ca15                	beqz	a2,1900 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18ce:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18d2:	167d                	add	a2,a2,-1
    18d4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18d8:	eb99                	bnez	a5,18ee <strncmp+0x22>
    18da:	a815                	j	190e <strncmp+0x42>
    18dc:	00a68e63          	beq	a3,a0,18f8 <strncmp+0x2c>
    18e0:	0505                	add	a0,a0,1
    18e2:	00f71b63          	bne	a4,a5,18f8 <strncmp+0x2c>
    18e6:	00054783          	lbu	a5,0(a0)
    18ea:	cf89                	beqz	a5,1904 <strncmp+0x38>
    18ec:	85b2                	mv	a1,a2
    18ee:	0005c703          	lbu	a4,0(a1)
    18f2:	00158613          	add	a2,a1,1
    18f6:	f37d                	bnez	a4,18dc <strncmp+0x10>
        ;
    return *l - *r;
    18f8:	0007851b          	sext.w	a0,a5
    18fc:	9d19                	subw	a0,a0,a4
    18fe:	8082                	ret
        return 0;
    1900:	4501                	li	a0,0
}
    1902:	8082                	ret
    return *l - *r;
    1904:	0015c703          	lbu	a4,1(a1)
    1908:	4501                	li	a0,0
    190a:	9d19                	subw	a0,a0,a4
    190c:	8082                	ret
    190e:	0005c703          	lbu	a4,0(a1)
    1912:	4501                	li	a0,0
    1914:	b7e5                	j	18fc <strncmp+0x30>

0000000000001916 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1916:	00757793          	and	a5,a0,7
    191a:	cf89                	beqz	a5,1934 <strlen+0x1e>
    191c:	87aa                	mv	a5,a0
    191e:	a029                	j	1928 <strlen+0x12>
    1920:	0785                	add	a5,a5,1
    1922:	0077f713          	and	a4,a5,7
    1926:	cb01                	beqz	a4,1936 <strlen+0x20>
        if (!*s)
    1928:	0007c703          	lbu	a4,0(a5)
    192c:	fb75                	bnez	a4,1920 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    192e:	40a78533          	sub	a0,a5,a0
}
    1932:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1934:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1936:	6394                	ld	a3,0(a5)
    1938:	00000597          	auipc	a1,0x0
    193c:	6d05b583          	ld	a1,1744(a1) # 2008 <__clone+0xb8>
    1940:	00000617          	auipc	a2,0x0
    1944:	6d063603          	ld	a2,1744(a2) # 2010 <__clone+0xc0>
    1948:	a019                	j	194e <strlen+0x38>
    194a:	6794                	ld	a3,8(a5)
    194c:	07a1                	add	a5,a5,8
    194e:	00b68733          	add	a4,a3,a1
    1952:	fff6c693          	not	a3,a3
    1956:	8f75                	and	a4,a4,a3
    1958:	8f71                	and	a4,a4,a2
    195a:	db65                	beqz	a4,194a <strlen+0x34>
    for (; *s; s++)
    195c:	0007c703          	lbu	a4,0(a5)
    1960:	d779                	beqz	a4,192e <strlen+0x18>
    1962:	0017c703          	lbu	a4,1(a5)
    1966:	0785                	add	a5,a5,1
    1968:	d379                	beqz	a4,192e <strlen+0x18>
    196a:	0017c703          	lbu	a4,1(a5)
    196e:	0785                	add	a5,a5,1
    1970:	fb6d                	bnez	a4,1962 <strlen+0x4c>
    1972:	bf75                	j	192e <strlen+0x18>

0000000000001974 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1974:	00757713          	and	a4,a0,7
{
    1978:	87aa                	mv	a5,a0
    197a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    197e:	cb19                	beqz	a4,1994 <memchr+0x20>
    1980:	ce25                	beqz	a2,19f8 <memchr+0x84>
    1982:	0007c703          	lbu	a4,0(a5)
    1986:	00b70763          	beq	a4,a1,1994 <memchr+0x20>
    198a:	0785                	add	a5,a5,1
    198c:	0077f713          	and	a4,a5,7
    1990:	167d                	add	a2,a2,-1
    1992:	f77d                	bnez	a4,1980 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1994:	4501                	li	a0,0
    if (n && *s != c)
    1996:	c235                	beqz	a2,19fa <memchr+0x86>
    1998:	0007c703          	lbu	a4,0(a5)
    199c:	06b70063          	beq	a4,a1,19fc <memchr+0x88>
        size_t k = ONES * c;
    19a0:	00000517          	auipc	a0,0x0
    19a4:	67853503          	ld	a0,1656(a0) # 2018 <__clone+0xc8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a8:	471d                	li	a4,7
        size_t k = ONES * c;
    19aa:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ae:	04c77763          	bgeu	a4,a2,19fc <memchr+0x88>
    19b2:	00000897          	auipc	a7,0x0
    19b6:	6568b883          	ld	a7,1622(a7) # 2008 <__clone+0xb8>
    19ba:	00000817          	auipc	a6,0x0
    19be:	65683803          	ld	a6,1622(a6) # 2010 <__clone+0xc0>
    19c2:	431d                	li	t1,7
    19c4:	a029                	j	19ce <memchr+0x5a>
    19c6:	1661                	add	a2,a2,-8
    19c8:	07a1                	add	a5,a5,8
    19ca:	00c37c63          	bgeu	t1,a2,19e2 <memchr+0x6e>
    19ce:	6398                	ld	a4,0(a5)
    19d0:	8f29                	xor	a4,a4,a0
    19d2:	011706b3          	add	a3,a4,a7
    19d6:	fff74713          	not	a4,a4
    19da:	8f75                	and	a4,a4,a3
    19dc:	01077733          	and	a4,a4,a6
    19e0:	d37d                	beqz	a4,19c6 <memchr+0x52>
    19e2:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    19e4:	e601                	bnez	a2,19ec <memchr+0x78>
    19e6:	a809                	j	19f8 <memchr+0x84>
    19e8:	0505                	add	a0,a0,1
    19ea:	c619                	beqz	a2,19f8 <memchr+0x84>
    19ec:	00054783          	lbu	a5,0(a0)
    19f0:	167d                	add	a2,a2,-1
    19f2:	feb79be3          	bne	a5,a1,19e8 <memchr+0x74>
    19f6:	8082                	ret
    return n ? (void *)s : 0;
    19f8:	4501                	li	a0,0
}
    19fa:	8082                	ret
    if (n && *s != c)
    19fc:	853e                	mv	a0,a5
    19fe:	b7fd                	j	19ec <memchr+0x78>

0000000000001a00 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a00:	1101                	add	sp,sp,-32
    1a02:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a04:	862e                	mv	a2,a1
{
    1a06:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a08:	4581                	li	a1,0
{
    1a0a:	e426                	sd	s1,8(sp)
    1a0c:	ec06                	sd	ra,24(sp)
    1a0e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a10:	f65ff0ef          	jal	1974 <memchr>
    return p ? p - s : n;
    1a14:	c519                	beqz	a0,1a22 <strnlen+0x22>
}
    1a16:	60e2                	ld	ra,24(sp)
    1a18:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a1a:	8d05                	sub	a0,a0,s1
}
    1a1c:	64a2                	ld	s1,8(sp)
    1a1e:	6105                	add	sp,sp,32
    1a20:	8082                	ret
    1a22:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a24:	8522                	mv	a0,s0
}
    1a26:	6442                	ld	s0,16(sp)
    1a28:	64a2                	ld	s1,8(sp)
    1a2a:	6105                	add	sp,sp,32
    1a2c:	8082                	ret

0000000000001a2e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a2e:	00a5c7b3          	xor	a5,a1,a0
    1a32:	8b9d                	and	a5,a5,7
    1a34:	eb95                	bnez	a5,1a68 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a36:	0075f793          	and	a5,a1,7
    1a3a:	e7b1                	bnez	a5,1a86 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a3c:	6198                	ld	a4,0(a1)
    1a3e:	00000617          	auipc	a2,0x0
    1a42:	5ca63603          	ld	a2,1482(a2) # 2008 <__clone+0xb8>
    1a46:	00000817          	auipc	a6,0x0
    1a4a:	5ca83803          	ld	a6,1482(a6) # 2010 <__clone+0xc0>
    1a4e:	a029                	j	1a58 <strcpy+0x2a>
    1a50:	05a1                	add	a1,a1,8
    1a52:	e118                	sd	a4,0(a0)
    1a54:	6198                	ld	a4,0(a1)
    1a56:	0521                	add	a0,a0,8
    1a58:	00c707b3          	add	a5,a4,a2
    1a5c:	fff74693          	not	a3,a4
    1a60:	8ff5                	and	a5,a5,a3
    1a62:	0107f7b3          	and	a5,a5,a6
    1a66:	d7ed                	beqz	a5,1a50 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	c785                	beqz	a5,1a98 <strcpy+0x6a>
    1a72:	0015c783          	lbu	a5,1(a1)
    1a76:	0505                	add	a0,a0,1
    1a78:	0585                	add	a1,a1,1
    1a7a:	00f50023          	sb	a5,0(a0)
    1a7e:	fbf5                	bnez	a5,1a72 <strcpy+0x44>
        ;
    return d;
}
    1a80:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a82:	0505                	add	a0,a0,1
    1a84:	df45                	beqz	a4,1a3c <strcpy+0xe>
            if (!(*d = *s))
    1a86:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a8a:	0585                	add	a1,a1,1
    1a8c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	f7fd                	bnez	a5,1a82 <strcpy+0x54>
}
    1a96:	8082                	ret
    1a98:	8082                	ret

0000000000001a9a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a9a:	00a5c7b3          	xor	a5,a1,a0
    1a9e:	8b9d                	and	a5,a5,7
    1aa0:	e3b5                	bnez	a5,1b04 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aa2:	0075f793          	and	a5,a1,7
    1aa6:	cf99                	beqz	a5,1ac4 <strncpy+0x2a>
    1aa8:	ea09                	bnez	a2,1aba <strncpy+0x20>
    1aaa:	a421                	j	1cb2 <strncpy+0x218>
    1aac:	0585                	add	a1,a1,1
    1aae:	0075f793          	and	a5,a1,7
    1ab2:	167d                	add	a2,a2,-1
    1ab4:	0505                	add	a0,a0,1
    1ab6:	c799                	beqz	a5,1ac4 <strncpy+0x2a>
    1ab8:	c225                	beqz	a2,1b18 <strncpy+0x7e>
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	00f50023          	sb	a5,0(a0)
    1ac2:	f7ed                	bnez	a5,1aac <strncpy+0x12>
            ;
        if (!n || !*s)
    1ac4:	ca31                	beqz	a2,1b18 <strncpy+0x7e>
    1ac6:	0005c783          	lbu	a5,0(a1)
    1aca:	cba1                	beqz	a5,1b1a <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1acc:	479d                	li	a5,7
    1ace:	02c7fc63          	bgeu	a5,a2,1b06 <strncpy+0x6c>
    1ad2:	00000897          	auipc	a7,0x0
    1ad6:	5368b883          	ld	a7,1334(a7) # 2008 <__clone+0xb8>
    1ada:	00000817          	auipc	a6,0x0
    1ade:	53683803          	ld	a6,1334(a6) # 2010 <__clone+0xc0>
    1ae2:	431d                	li	t1,7
    1ae4:	a039                	j	1af2 <strncpy+0x58>
            *wd = *ws;
    1ae6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae8:	1661                	add	a2,a2,-8
    1aea:	05a1                	add	a1,a1,8
    1aec:	0521                	add	a0,a0,8
    1aee:	00c37b63          	bgeu	t1,a2,1b04 <strncpy+0x6a>
    1af2:	6198                	ld	a4,0(a1)
    1af4:	011707b3          	add	a5,a4,a7
    1af8:	fff74693          	not	a3,a4
    1afc:	8ff5                	and	a5,a5,a3
    1afe:	0107f7b3          	and	a5,a5,a6
    1b02:	d3f5                	beqz	a5,1ae6 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b04:	ca11                	beqz	a2,1b18 <strncpy+0x7e>
    1b06:	0005c783          	lbu	a5,0(a1)
    1b0a:	0585                	add	a1,a1,1
    1b0c:	00f50023          	sb	a5,0(a0)
    1b10:	c789                	beqz	a5,1b1a <strncpy+0x80>
    1b12:	167d                	add	a2,a2,-1
    1b14:	0505                	add	a0,a0,1
    1b16:	fa65                	bnez	a2,1b06 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b18:	8082                	ret
    1b1a:	4805                	li	a6,1
    1b1c:	14061b63          	bnez	a2,1c72 <strncpy+0x1d8>
    1b20:	40a00733          	neg	a4,a0
    1b24:	00777793          	and	a5,a4,7
    1b28:	4581                	li	a1,0
    1b2a:	12061c63          	bnez	a2,1c62 <strncpy+0x1c8>
    1b2e:	00778693          	add	a3,a5,7
    1b32:	48ad                	li	a7,11
    1b34:	1316e563          	bltu	a3,a7,1c5e <strncpy+0x1c4>
    1b38:	16d5e263          	bltu	a1,a3,1c9c <strncpy+0x202>
    1b3c:	14078c63          	beqz	a5,1c94 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b40:	00050023          	sb	zero,0(a0)
    1b44:	00677693          	and	a3,a4,6
    1b48:	14068263          	beqz	a3,1c8c <strncpy+0x1f2>
    1b4c:	000500a3          	sb	zero,1(a0)
    1b50:	4689                	li	a3,2
    1b52:	14f6f863          	bgeu	a3,a5,1ca2 <strncpy+0x208>
    1b56:	00050123          	sb	zero,2(a0)
    1b5a:	8b11                	and	a4,a4,4
    1b5c:	12070463          	beqz	a4,1c84 <strncpy+0x1ea>
    1b60:	000501a3          	sb	zero,3(a0)
    1b64:	4711                	li	a4,4
    1b66:	00450693          	add	a3,a0,4
    1b6a:	02f77563          	bgeu	a4,a5,1b94 <strncpy+0xfa>
    1b6e:	00050223          	sb	zero,4(a0)
    1b72:	4715                	li	a4,5
    1b74:	00550693          	add	a3,a0,5
    1b78:	00e78e63          	beq	a5,a4,1b94 <strncpy+0xfa>
    1b7c:	fff50713          	add	a4,a0,-1
    1b80:	000502a3          	sb	zero,5(a0)
    1b84:	8b1d                	and	a4,a4,7
    1b86:	12071263          	bnez	a4,1caa <strncpy+0x210>
    1b8a:	00750693          	add	a3,a0,7
    1b8e:	00050323          	sb	zero,6(a0)
    1b92:	471d                	li	a4,7
    1b94:	40f80833          	sub	a6,a6,a5
    1b98:	ff887593          	and	a1,a6,-8
    1b9c:	97aa                	add	a5,a5,a0
    1b9e:	95be                	add	a1,a1,a5
    1ba0:	0007b023          	sd	zero,0(a5)
    1ba4:	07a1                	add	a5,a5,8
    1ba6:	feb79de3          	bne	a5,a1,1ba0 <strncpy+0x106>
    1baa:	ff887593          	and	a1,a6,-8
    1bae:	00787813          	and	a6,a6,7
    1bb2:	00e587bb          	addw	a5,a1,a4
    1bb6:	00b68733          	add	a4,a3,a1
    1bba:	0e080063          	beqz	a6,1c9a <strncpy+0x200>
    1bbe:	00070023          	sb	zero,0(a4)
    1bc2:	0017869b          	addw	a3,a5,1
    1bc6:	f4c6f9e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1bca:	000700a3          	sb	zero,1(a4)
    1bce:	0027869b          	addw	a3,a5,2
    1bd2:	f4c6f3e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1bd6:	00070123          	sb	zero,2(a4)
    1bda:	0037869b          	addw	a3,a5,3
    1bde:	f2c6fde3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1be2:	000701a3          	sb	zero,3(a4)
    1be6:	0047869b          	addw	a3,a5,4
    1bea:	f2c6f7e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1bee:	00070223          	sb	zero,4(a4)
    1bf2:	0057869b          	addw	a3,a5,5
    1bf6:	f2c6f1e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1bfa:	000702a3          	sb	zero,5(a4)
    1bfe:	0067869b          	addw	a3,a5,6
    1c02:	f0c6fbe3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c06:	00070323          	sb	zero,6(a4)
    1c0a:	0077869b          	addw	a3,a5,7
    1c0e:	f0c6f5e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c12:	000703a3          	sb	zero,7(a4)
    1c16:	0087869b          	addw	a3,a5,8
    1c1a:	eec6ffe3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c1e:	00070423          	sb	zero,8(a4)
    1c22:	0097869b          	addw	a3,a5,9
    1c26:	eec6f9e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c2a:	000704a3          	sb	zero,9(a4)
    1c2e:	00a7869b          	addw	a3,a5,10
    1c32:	eec6f3e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c36:	00070523          	sb	zero,10(a4)
    1c3a:	00b7869b          	addw	a3,a5,11
    1c3e:	ecc6fde3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c42:	000705a3          	sb	zero,11(a4)
    1c46:	00c7869b          	addw	a3,a5,12
    1c4a:	ecc6f7e3          	bgeu	a3,a2,1b18 <strncpy+0x7e>
    1c4e:	00070623          	sb	zero,12(a4)
    1c52:	27b5                	addw	a5,a5,13
    1c54:	ecc7f2e3          	bgeu	a5,a2,1b18 <strncpy+0x7e>
    1c58:	000706a3          	sb	zero,13(a4)
}
    1c5c:	8082                	ret
    1c5e:	46ad                	li	a3,11
    1c60:	bde1                	j	1b38 <strncpy+0x9e>
    1c62:	00778693          	add	a3,a5,7
    1c66:	48ad                	li	a7,11
    1c68:	fff60593          	add	a1,a2,-1
    1c6c:	ed16f6e3          	bgeu	a3,a7,1b38 <strncpy+0x9e>
    1c70:	b7fd                	j	1c5e <strncpy+0x1c4>
    1c72:	40a00733          	neg	a4,a0
    1c76:	8832                	mv	a6,a2
    1c78:	00777793          	and	a5,a4,7
    1c7c:	4581                	li	a1,0
    1c7e:	ea0608e3          	beqz	a2,1b2e <strncpy+0x94>
    1c82:	b7c5                	j	1c62 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c84:	00350693          	add	a3,a0,3
    1c88:	470d                	li	a4,3
    1c8a:	b729                	j	1b94 <strncpy+0xfa>
    1c8c:	00150693          	add	a3,a0,1
    1c90:	4705                	li	a4,1
    1c92:	b709                	j	1b94 <strncpy+0xfa>
tail:
    1c94:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c96:	4701                	li	a4,0
    1c98:	bdf5                	j	1b94 <strncpy+0xfa>
    1c9a:	8082                	ret
tail:
    1c9c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c9e:	4781                	li	a5,0
    1ca0:	bf39                	j	1bbe <strncpy+0x124>
    1ca2:	00250693          	add	a3,a0,2
    1ca6:	4709                	li	a4,2
    1ca8:	b5f5                	j	1b94 <strncpy+0xfa>
    1caa:	00650693          	add	a3,a0,6
    1cae:	4719                	li	a4,6
    1cb0:	b5d5                	j	1b94 <strncpy+0xfa>
    1cb2:	8082                	ret

0000000000001cb4 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cb4:	87aa                	mv	a5,a0
    1cb6:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cb8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cbc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cc0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cc2:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc4:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <openat>:
    register long a7 __asm__("a7") = n;
    1ccc:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cd0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <close>:
    register long a7 __asm__("a7") = n;
    1cdc:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ce0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <read>:
    register long a7 __asm__("a7") = n;
    1ce8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cec:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cf0:	8082                	ret

0000000000001cf2 <write>:
    register long a7 __asm__("a7") = n;
    1cf2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cfa:	8082                	ret

0000000000001cfc <getpid>:
    register long a7 __asm__("a7") = n;
    1cfc:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d00:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <getppid>:
    register long a7 __asm__("a7") = n;
    1d08:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d0c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d14:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d18:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <fork>:
    register long a7 __asm__("a7") = n;
    1d20:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d24:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d26:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d28:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d30:	85b2                	mv	a1,a2
    1d32:	863a                	mv	a2,a4
    if (stack)
    1d34:	c191                	beqz	a1,1d38 <clone+0x8>
	stack += stack_size;
    1d36:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d38:	4781                	li	a5,0
    1d3a:	4701                	li	a4,0
    1d3c:	4681                	li	a3,0
    1d3e:	2601                	sext.w	a2,a2
    1d40:	ac01                	j	1f50 <__clone>

0000000000001d42 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1d42:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d46:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1d4a:	8082                	ret

0000000000001d4c <exit>:
    register long a7 __asm__("a7") = n;
    1d4c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d54:	8082                	ret

0000000000001d56 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d56:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d5a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <exec>:
    register long a7 __asm__("a7") = n;
    1d64:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <execve>:
    register long a7 __asm__("a7") = n;
    1d70:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d74:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <times>:
    register long a7 __asm__("a7") = n;
    1d7c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <get_time>:

int64 get_time()
{
    1d88:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d8a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d8e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d96:	2501                	sext.w	a0,a0
    1d98:	ed09                	bnez	a0,1db2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d9a:	67a2                	ld	a5,8(sp)
    1d9c:	3e800713          	li	a4,1000
    1da0:	00015503          	lhu	a0,0(sp)
    1da4:	02e7d7b3          	divu	a5,a5,a4
    1da8:	02e50533          	mul	a0,a0,a4
    1dac:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dae:	0141                	add	sp,sp,16
    1db0:	8082                	ret
        return -1;
    1db2:	557d                	li	a0,-1
    1db4:	bfed                	j	1dae <get_time+0x26>

0000000000001db6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1db6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <time>:
    register long a7 __asm__("a7") = n;
    1dc2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <sleep>:

int sleep(unsigned long long time)
{
    1dce:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dd0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dd2:	850a                	mv	a0,sp
    1dd4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dd6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dda:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de0:	e501                	bnez	a0,1de8 <sleep+0x1a>
    return 0;
    1de2:	4501                	li	a0,0
}
    1de4:	0141                	add	sp,sp,16
    1de6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de8:	4502                	lw	a0,0(sp)
}
    1dea:	0141                	add	sp,sp,16
    1dec:	8082                	ret

0000000000001dee <set_priority>:
    register long a7 __asm__("a7") = n;
    1dee:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1df2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dfa:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dfe:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e02:	8082                	ret

0000000000001e04 <mprotect>:
    register long a7 __asm__("a7") = n;
    1e04:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e08:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <munmap>:
    register long a7 __asm__("a7") = n;
    1e10:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e14:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <wait>:

int wait(int *code)
{
    1e1c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e22:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e24:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e26:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e28:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <spawn>:
    register long a7 __asm__("a7") = n;
    1e30:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e34:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <mailread>:
    register long a7 __asm__("a7") = n;
    1e3c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e48:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <fstat>:
    register long a7 __asm__("a7") = n;
    1e54:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1e60:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e62:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1e66:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e70:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e72:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e76:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e78:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e80:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e82:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e86:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <link>:

int link(char *old_path, char *new_path)
{
    1e90:	87aa                	mv	a5,a0
    1e92:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e94:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e98:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e9c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ea2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <unlink>:

int unlink(char *path)
{
    1eac:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eae:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1eb2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eb6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <uname>:
    register long a7 __asm__("a7") = n;
    1ec0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <brk>:
    register long a7 __asm__("a7") = n;
    1ecc:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ed0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ed8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ede:	8082                	ret

0000000000001ee0 <chdir>:
    register long a7 __asm__("a7") = n;
    1ee0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ee4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eec:	862e                	mv	a2,a1
    1eee:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ef0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ef2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ef6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1efa:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1efc:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efe:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <getdents>:
    register long a7 __asm__("a7") = n;
    1f06:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f0a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <pipe>:
    register long a7 __asm__("a7") = n;
    1f12:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f18:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <dup>:
    register long a7 __asm__("a7") = n;
    1f20:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f22:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <dup2>:
    register long a7 __asm__("a7") = n;
    1f2a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f2c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <mount>:
    register long a7 __asm__("a7") = n;
    1f36:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f3a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <umount>:
    register long a7 __asm__("a7") = n;
    1f42:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f46:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f48:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f50:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f52:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f54:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f56:	8532                	mv	a0,a2
	mv a2, a4
    1f58:	863a                	mv	a2,a4
	mv a3, a5
    1f5a:	86be                	mv	a3,a5
	mv a4, a6
    1f5c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f5e:	0dc00893          	li	a7,220
	ecall
    1f62:	00000073          	ecall

	beqz a0, 1f
    1f66:	c111                	beqz	a0,1f6a <__clone+0x1a>
	# Parent
	ret
    1f68:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f6a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f6c:	6522                	ld	a0,8(sp)
	jalr a1
    1f6e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f70:	05d00893          	li	a7,93
	ecall
    1f74:	00000073          	ecall
