
/home/hbh/oslab/oslab/user/build/riscv64/brk:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a855                	j	10b6 <__start_main>

0000000000001004 <test_brk>:
 * "After alloc,heap pos: [num+64]"
 * "Alloc again,heap pos: [num+128]"
 * 
 * Linux 中brk(0)只返回0，此处与Linux表现不同，应特殊说明。
 */
void test_brk(){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eda50513          	add	a0,a0,-294 # 1ee0 <__clone+0x2e>
void test_brk(){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	2fa000ef          	jal	130e <puts>
    1018:	00001497          	auipc	s1,0x1
    101c:	f8048493          	add	s1,s1,-128 # 1f98 <__func__.0>
    1020:	8526                	mv	a0,s1
    1022:	2ec000ef          	jal	130e <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	ed250513          	add	a0,a0,-302 # 1ef8 <__clone+0x46>
    102e:	2e0000ef          	jal	130e <puts>
    intptr_t cur_pos, alloc_pos, alloc_pos_1;

    cur_pos = brk(0);
    1032:	4501                	li	a0,0
    1034:	5fb000ef          	jal	1e2e <brk>
    printf("Before alloc,heap pos: %d\n", cur_pos);
    1038:	85aa                	mv	a1,a0
    cur_pos = brk(0);
    103a:	842a                	mv	s0,a0
    printf("Before alloc,heap pos: %d\n", cur_pos);
    103c:	00001517          	auipc	a0,0x1
    1040:	ecc50513          	add	a0,a0,-308 # 1f08 <__clone+0x56>
    1044:	2ec000ef          	jal	1330 <printf>
    brk(cur_pos + 64);
    1048:	04040513          	add	a0,s0,64
    104c:	5e3000ef          	jal	1e2e <brk>
    alloc_pos = brk(0);
    1050:	4501                	li	a0,0
    1052:	5dd000ef          	jal	1e2e <brk>
    printf("After alloc,heap pos: %d\n",alloc_pos);
    1056:	85aa                	mv	a1,a0
    alloc_pos = brk(0);
    1058:	842a                	mv	s0,a0
    printf("After alloc,heap pos: %d\n",alloc_pos);
    105a:	00001517          	auipc	a0,0x1
    105e:	ece50513          	add	a0,a0,-306 # 1f28 <__clone+0x76>
    1062:	2ce000ef          	jal	1330 <printf>
    brk(alloc_pos + 64);
    1066:	04040513          	add	a0,s0,64
    106a:	5c5000ef          	jal	1e2e <brk>
    alloc_pos_1 = brk(0);
    106e:	4501                	li	a0,0
    1070:	5bf000ef          	jal	1e2e <brk>
    1074:	85aa                	mv	a1,a0
    printf("Alloc again,heap pos: %d\n",alloc_pos_1);
    1076:	00001517          	auipc	a0,0x1
    107a:	ed250513          	add	a0,a0,-302 # 1f48 <__clone+0x96>
    107e:	2b2000ef          	jal	1330 <printf>
    TEST_END(__func__);
    1082:	00001517          	auipc	a0,0x1
    1086:	ee650513          	add	a0,a0,-282 # 1f68 <__clone+0xb6>
    108a:	284000ef          	jal	130e <puts>
    108e:	8526                	mv	a0,s1
    1090:	27e000ef          	jal	130e <puts>
}
    1094:	6442                	ld	s0,16(sp)
    1096:	60e2                	ld	ra,24(sp)
    1098:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e5e50513          	add	a0,a0,-418 # 1ef8 <__clone+0x46>
}
    10a2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10a4:	a4ad                	j	130e <puts>

00000000000010a6 <main>:

int main(void) {
    10a6:	1141                	add	sp,sp,-16
    10a8:	e406                	sd	ra,8(sp)
    test_brk();
    10aa:	f5bff0ef          	jal	1004 <test_brk>
    return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b8:	4108                	lw	a0,0(a0)
{
    10ba:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10bc:	05a1                	add	a1,a1,8
{
    10be:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c0:	fe7ff0ef          	jal	10a6 <main>
    10c4:	3eb000ef          	jal	1cae <exit>
	return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d0:	7179                	add	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d4:	12054863          	bltz	a0,1204 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d8:	02b577bb          	remuw	a5,a0,a1
    10dc:	00001697          	auipc	a3,0x1
    10e0:	ecc68693          	add	a3,a3,-308 # 1fa8 <digits>
    buf[16] = 0;
    10e4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e8:	0005871b          	sext.w	a4,a1
    10ec:	1782                	sll	a5,a5,0x20
    10ee:	9381                	srl	a5,a5,0x20
    10f0:	97b6                	add	a5,a5,a3
    10f2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10fa:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10fe:	1ab56663          	bltu	a0,a1,12aa <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1102:	02e8763b          	remuw	a2,a6,a4
    1106:	1602                	sll	a2,a2,0x20
    1108:	9201                	srl	a2,a2,0x20
    110a:	9636                	add	a2,a2,a3
    110c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1110:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1114:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1118:	12e86c63          	bltu	a6,a4,1250 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    111c:	02e5f63b          	remuw	a2,a1,a4
    1120:	1602                	sll	a2,a2,0x20
    1122:	9201                	srl	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    112e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1132:	12e5e863          	bltu	a1,a4,1262 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1136:	02e8763b          	remuw	a2,a6,a4
    113a:	1602                	sll	a2,a2,0x20
    113c:	9201                	srl	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1148:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    114c:	12e86463          	bltu	a6,a4,1274 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1150:	02e5f63b          	remuw	a2,a1,a4
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1162:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1166:	12e5e063          	bltu	a1,a4,1286 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    116a:	02e8763b          	remuw	a2,a6,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1180:	0ae86f63          	bltu	a6,a4,123e <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1184:	02e5f63b          	remuw	a2,a1,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1196:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    119a:	0ee5ef63          	bltu	a1,a4,1298 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    119e:	02e8763b          	remuw	a2,a6,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b4:	0ee86d63          	bltu	a6,a4,12ae <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11b8:	02e5f63b          	remuw	a2,a1,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ca:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ce:	0ee5e963          	bltu	a1,a4,12c0 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11d2:	1782                	sll	a5,a5,0x20
    11d4:	9381                	srl	a5,a5,0x20
    11d6:	96be                	add	a3,a3,a5
    11d8:	0006c783          	lbu	a5,0(a3)
    11dc:	4599                	li	a1,6
    11de:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e2:	00055763          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11e6:	02d00793          	li	a5,45
    11ea:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ee:	4595                	li	a1,5
    write(f, s, l);
    11f0:	003c                	add	a5,sp,8
    11f2:	4641                	li	a2,16
    11f4:	9e0d                	subw	a2,a2,a1
    11f6:	4505                	li	a0,1
    11f8:	95be                	add	a1,a1,a5
    11fa:	25b000ef          	jal	1c54 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fe:	70a2                	ld	ra,40(sp)
    1200:	6145                	add	sp,sp,48
    1202:	8082                	ret
        x = -xx;
    1204:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1208:	02b677bb          	remuw	a5,a2,a1
    120c:	00001697          	auipc	a3,0x1
    1210:	d9c68693          	add	a3,a3,-612 # 1fa8 <digits>
    buf[16] = 0;
    1214:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1218:	0005871b          	sext.w	a4,a1
    121c:	1782                	sll	a5,a5,0x20
    121e:	9381                	srl	a5,a5,0x20
    1220:	97b6                	add	a5,a5,a3
    1222:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1226:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122e:	ecb67ae3          	bgeu	a2,a1,1102 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123a:	45b9                	li	a1,14
    123c:	bf55                	j	11f0 <printint.constprop.0+0x120>
    123e:	45a9                	li	a1,10
    if (sign)
    1240:	fa0558e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    124c:	45a5                	li	a1,9
    124e:	b74d                	j	11f0 <printint.constprop.0+0x120>
    1250:	45b9                	li	a1,14
    if (sign)
    1252:	f8055fe3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    125e:	45b5                	li	a1,13
    1260:	bf41                	j	11f0 <printint.constprop.0+0x120>
    1262:	45b5                	li	a1,13
    if (sign)
    1264:	f80556e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1270:	45b1                	li	a1,12
    1272:	bfbd                	j	11f0 <printint.constprop.0+0x120>
    1274:	45b1                	li	a1,12
    if (sign)
    1276:	f6055de3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1282:	45ad                	li	a1,11
    1284:	b7b5                	j	11f0 <printint.constprop.0+0x120>
    1286:	45ad                	li	a1,11
    if (sign)
    1288:	f60554e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1294:	45a9                	li	a1,10
    1296:	bfa9                	j	11f0 <printint.constprop.0+0x120>
    1298:	45a5                	li	a1,9
    if (sign)
    129a:	f4055be3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a6:	45a1                	li	a1,8
    12a8:	b7a1                	j	11f0 <printint.constprop.0+0x120>
    i = 15;
    12aa:	45bd                	li	a1,15
    12ac:	b791                	j	11f0 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12ae:	45a1                	li	a1,8
    if (sign)
    12b0:	f40550e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12bc:	459d                	li	a1,7
    12be:	bf0d                	j	11f0 <printint.constprop.0+0x120>
    12c0:	459d                	li	a1,7
    if (sign)
    12c2:	f20557e3          	bgez	a0,11f0 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ce:	4599                	li	a1,6
    12d0:	b705                	j	11f0 <printint.constprop.0+0x120>

00000000000012d2 <getchar>:
{
    12d2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12d4:	00f10593          	add	a1,sp,15
    12d8:	4605                	li	a2,1
    12da:	4501                	li	a0,0
{
    12dc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12de:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e2:	169000ef          	jal	1c4a <read>
}
    12e6:	60e2                	ld	ra,24(sp)
    12e8:	00f14503          	lbu	a0,15(sp)
    12ec:	6105                	add	sp,sp,32
    12ee:	8082                	ret

00000000000012f0 <putchar>:
{
    12f0:	1101                	add	sp,sp,-32
    12f2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12f4:	00f10593          	add	a1,sp,15
    12f8:	4605                	li	a2,1
    12fa:	4505                	li	a0,1
{
    12fc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12fe:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1302:	153000ef          	jal	1c54 <write>
}
    1306:	60e2                	ld	ra,24(sp)
    1308:	2501                	sext.w	a0,a0
    130a:	6105                	add	sp,sp,32
    130c:	8082                	ret

000000000000130e <puts>:
{
    130e:	1141                	add	sp,sp,-16
    1310:	e406                	sd	ra,8(sp)
    1312:	e022                	sd	s0,0(sp)
    1314:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1316:	562000ef          	jal	1878 <strlen>
    131a:	862a                	mv	a2,a0
    131c:	85a2                	mv	a1,s0
    131e:	4505                	li	a0,1
    1320:	135000ef          	jal	1c54 <write>
}
    1324:	60a2                	ld	ra,8(sp)
    1326:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1328:	957d                	sra	a0,a0,0x3f
    return r;
    132a:	2501                	sext.w	a0,a0
}
    132c:	0141                	add	sp,sp,16
    132e:	8082                	ret

0000000000001330 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1330:	7171                	add	sp,sp,-176
    1332:	f85a                	sd	s6,48(sp)
    1334:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1336:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1338:	18bc                	add	a5,sp,120
{
    133a:	e8ca                	sd	s2,80(sp)
    133c:	e4ce                	sd	s3,72(sp)
    133e:	e0d2                	sd	s4,64(sp)
    1340:	fc56                	sd	s5,56(sp)
    1342:	f486                	sd	ra,104(sp)
    1344:	f0a2                	sd	s0,96(sp)
    1346:	eca6                	sd	s1,88(sp)
    1348:	fcae                	sd	a1,120(sp)
    134a:	e132                	sd	a2,128(sp)
    134c:	e536                	sd	a3,136(sp)
    134e:	e93a                	sd	a4,144(sp)
    1350:	f142                	sd	a6,160(sp)
    1352:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1354:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1356:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    135a:	07300a13          	li	s4,115
    135e:	07800a93          	li	s5,120
    buf[i++] = '0';
    1362:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1366:	00001997          	auipc	s3,0x1
    136a:	c4298993          	add	s3,s3,-958 # 1fa8 <digits>
        if (!*s)
    136e:	00054783          	lbu	a5,0(a0)
    1372:	16078a63          	beqz	a5,14e6 <printf+0x1b6>
    1376:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1378:	19278d63          	beq	a5,s2,1512 <printf+0x1e2>
    137c:	00164783          	lbu	a5,1(a2)
    1380:	0605                	add	a2,a2,1
    1382:	fbfd                	bnez	a5,1378 <printf+0x48>
    1384:	84b2                	mv	s1,a2
        l = z - a;
    1386:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    138a:	85aa                	mv	a1,a0
    138c:	8622                	mv	a2,s0
    138e:	4505                	li	a0,1
    1390:	0c5000ef          	jal	1c54 <write>
        if (l)
    1394:	1a041463          	bnez	s0,153c <printf+0x20c>
        if (s[1] == 0)
    1398:	0014c783          	lbu	a5,1(s1)
    139c:	14078563          	beqz	a5,14e6 <printf+0x1b6>
        switch (s[1])
    13a0:	1b478063          	beq	a5,s4,1540 <printf+0x210>
    13a4:	14fa6b63          	bltu	s4,a5,14fa <printf+0x1ca>
    13a8:	06400713          	li	a4,100
    13ac:	1ee78063          	beq	a5,a4,158c <printf+0x25c>
    13b0:	07000713          	li	a4,112
    13b4:	1ae79963          	bne	a5,a4,1566 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ba:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13be:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c0:	631c                	ld	a5,0(a4)
    13c2:	0721                	add	a4,a4,8
    13c4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c6:	00479293          	sll	t0,a5,0x4
    13ca:	00879f93          	sll	t6,a5,0x8
    13ce:	00c79f13          	sll	t5,a5,0xc
    13d2:	01079e93          	sll	t4,a5,0x10
    13d6:	01479e13          	sll	t3,a5,0x14
    13da:	01879313          	sll	t1,a5,0x18
    13de:	01c79893          	sll	a7,a5,0x1c
    13e2:	02479813          	sll	a6,a5,0x24
    13e6:	02879513          	sll	a0,a5,0x28
    13ea:	02c79593          	sll	a1,a5,0x2c
    13ee:	03079693          	sll	a3,a5,0x30
    13f2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f6:	03c7d413          	srl	s0,a5,0x3c
    13fa:	01c7d39b          	srlw	t2,a5,0x1c
    13fe:	03c2d293          	srl	t0,t0,0x3c
    1402:	03cfdf93          	srl	t6,t6,0x3c
    1406:	03cf5f13          	srl	t5,t5,0x3c
    140a:	03cede93          	srl	t4,t4,0x3c
    140e:	03ce5e13          	srl	t3,t3,0x3c
    1412:	03c35313          	srl	t1,t1,0x3c
    1416:	03c8d893          	srl	a7,a7,0x3c
    141a:	03c85813          	srl	a6,a6,0x3c
    141e:	9171                	srl	a0,a0,0x3c
    1420:	91f1                	srl	a1,a1,0x3c
    1422:	92f1                	srl	a3,a3,0x3c
    1424:	9371                	srl	a4,a4,0x3c
    1426:	96ce                	add	a3,a3,s3
    1428:	974e                	add	a4,a4,s3
    142a:	944e                	add	s0,s0,s3
    142c:	92ce                	add	t0,t0,s3
    142e:	9fce                	add	t6,t6,s3
    1430:	9f4e                	add	t5,t5,s3
    1432:	9ece                	add	t4,t4,s3
    1434:	9e4e                	add	t3,t3,s3
    1436:	934e                	add	t1,t1,s3
    1438:	98ce                	add	a7,a7,s3
    143a:	93ce                	add	t2,t2,s3
    143c:	984e                	add	a6,a6,s3
    143e:	954e                	add	a0,a0,s3
    1440:	95ce                	add	a1,a1,s3
    1442:	0006c083          	lbu	ra,0(a3)
    1446:	0002c283          	lbu	t0,0(t0)
    144a:	00074683          	lbu	a3,0(a4)
    144e:	000fcf83          	lbu	t6,0(t6)
    1452:	000f4f03          	lbu	t5,0(t5)
    1456:	000ece83          	lbu	t4,0(t4)
    145a:	000e4e03          	lbu	t3,0(t3)
    145e:	00034303          	lbu	t1,0(t1)
    1462:	0008c883          	lbu	a7,0(a7)
    1466:	0003c383          	lbu	t2,0(t2)
    146a:	00084803          	lbu	a6,0(a6)
    146e:	00054503          	lbu	a0,0(a0)
    1472:	0005c583          	lbu	a1,0(a1)
    1476:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147e:	9371                	srl	a4,a4,0x3c
    1480:	8bbd                	and	a5,a5,15
    1482:	974e                	add	a4,a4,s3
    1484:	97ce                	add	a5,a5,s3
    1486:	005105a3          	sb	t0,11(sp)
    148a:	01f10623          	sb	t6,12(sp)
    148e:	01e106a3          	sb	t5,13(sp)
    1492:	01d10723          	sb	t4,14(sp)
    1496:	01c107a3          	sb	t3,15(sp)
    149a:	00610823          	sb	t1,16(sp)
    149e:	011108a3          	sb	a7,17(sp)
    14a2:	00710923          	sb	t2,18(sp)
    14a6:	010109a3          	sb	a6,19(sp)
    14aa:	00a10a23          	sb	a0,20(sp)
    14ae:	00b10aa3          	sb	a1,21(sp)
    14b2:	00110b23          	sb	ra,22(sp)
    14b6:	00d10ba3          	sb	a3,23(sp)
    14ba:	00810523          	sb	s0,10(sp)
    14be:	00074703          	lbu	a4,0(a4)
    14c2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c6:	002c                	add	a1,sp,8
    14c8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	00e10c23          	sb	a4,24(sp)
    14ce:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14d6:	77e000ef          	jal	1c54 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14da:	00248513          	add	a0,s1,2
        if (!*s)
    14de:	00054783          	lbu	a5,0(a0)
    14e2:	e8079ae3          	bnez	a5,1376 <printf+0x46>
    }
    va_end(ap);
}
    14e6:	70a6                	ld	ra,104(sp)
    14e8:	7406                	ld	s0,96(sp)
    14ea:	64e6                	ld	s1,88(sp)
    14ec:	6946                	ld	s2,80(sp)
    14ee:	69a6                	ld	s3,72(sp)
    14f0:	6a06                	ld	s4,64(sp)
    14f2:	7ae2                	ld	s5,56(sp)
    14f4:	7b42                	ld	s6,48(sp)
    14f6:	614d                	add	sp,sp,176
    14f8:	8082                	ret
        switch (s[1])
    14fa:	07579663          	bne	a5,s5,1566 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    14fe:	6782                	ld	a5,0(sp)
    1500:	45c1                	li	a1,16
    1502:	4388                	lw	a0,0(a5)
    1504:	07a1                	add	a5,a5,8
    1506:	e03e                	sd	a5,0(sp)
    1508:	bc9ff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    150c:	00248513          	add	a0,s1,2
    1510:	b7f9                	j	14de <printf+0x1ae>
    1512:	84b2                	mv	s1,a2
    1514:	a039                	j	1522 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1516:	0024c783          	lbu	a5,2(s1)
    151a:	0605                	add	a2,a2,1
    151c:	0489                	add	s1,s1,2
    151e:	e72794e3          	bne	a5,s2,1386 <printf+0x56>
    1522:	0014c783          	lbu	a5,1(s1)
    1526:	ff2788e3          	beq	a5,s2,1516 <printf+0x1e6>
        l = z - a;
    152a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    152e:	85aa                	mv	a1,a0
    1530:	8622                	mv	a2,s0
    1532:	4505                	li	a0,1
    1534:	720000ef          	jal	1c54 <write>
        if (l)
    1538:	e60400e3          	beqz	s0,1398 <printf+0x68>
    153c:	8526                	mv	a0,s1
    153e:	bd05                	j	136e <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1540:	6782                	ld	a5,0(sp)
    1542:	6380                	ld	s0,0(a5)
    1544:	07a1                	add	a5,a5,8
    1546:	e03e                	sd	a5,0(sp)
    1548:	cc21                	beqz	s0,15a0 <printf+0x270>
            l = strnlen(a, 200);
    154a:	0c800593          	li	a1,200
    154e:	8522                	mv	a0,s0
    1550:	412000ef          	jal	1962 <strnlen>
    write(f, s, l);
    1554:	0005061b          	sext.w	a2,a0
    1558:	85a2                	mv	a1,s0
    155a:	4505                	li	a0,1
    155c:	6f8000ef          	jal	1c54 <write>
        s += 2;
    1560:	00248513          	add	a0,s1,2
    1564:	bfad                	j	14de <printf+0x1ae>
    return write(stdout, &byte, 1);
    1566:	4605                	li	a2,1
    1568:	002c                	add	a1,sp,8
    156a:	4505                	li	a0,1
    char byte = c;
    156c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1570:	6e4000ef          	jal	1c54 <write>
    char byte = c;
    1574:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	add	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1582:	6d2000ef          	jal	1c54 <write>
        s += 2;
    1586:	00248513          	add	a0,s1,2
    158a:	bf91                	j	14de <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    158c:	6782                	ld	a5,0(sp)
    158e:	45a9                	li	a1,10
    1590:	4388                	lw	a0,0(a5)
    1592:	07a1                	add	a5,a5,8
    1594:	e03e                	sd	a5,0(sp)
    1596:	b3bff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    159a:	00248513          	add	a0,s1,2
    159e:	b781                	j	14de <printf+0x1ae>
                a = "(null)";
    15a0:	00001417          	auipc	s0,0x1
    15a4:	9d840413          	add	s0,s0,-1576 # 1f78 <__clone+0xc6>
    15a8:	b74d                	j	154a <printf+0x21a>

00000000000015aa <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15aa:	02000793          	li	a5,32
    15ae:	00f50663          	beq	a0,a5,15ba <isspace+0x10>
    15b2:	355d                	addw	a0,a0,-9
    15b4:	00553513          	sltiu	a0,a0,5
    15b8:	8082                	ret
    15ba:	4505                	li	a0,1
}
    15bc:	8082                	ret

00000000000015be <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15be:	fd05051b          	addw	a0,a0,-48
}
    15c2:	00a53513          	sltiu	a0,a0,10
    15c6:	8082                	ret

00000000000015c8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c8:	02000693          	li	a3,32
    15cc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ce:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	ff77871b          	addw	a4,a5,-9
    15d6:	04d78c63          	beq	a5,a3,162e <atoi+0x66>
    15da:	0007861b          	sext.w	a2,a5
    15de:	04e5f863          	bgeu	a1,a4,162e <atoi+0x66>
        s++;
    switch (*s)
    15e2:	02b00713          	li	a4,43
    15e6:	04e78963          	beq	a5,a4,1638 <atoi+0x70>
    15ea:	02d00713          	li	a4,45
    15ee:	06e78263          	beq	a5,a4,1652 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f2:	fd06069b          	addw	a3,a2,-48
    15f6:	47a5                	li	a5,9
    15f8:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15fa:	4301                	li	t1,0
    while (isdigit(*s))
    15fc:	04d7e963          	bltu	a5,a3,164e <atoi+0x86>
    int n = 0, neg = 0;
    1600:	4501                	li	a0,0
    while (isdigit(*s))
    1602:	48a5                	li	a7,9
    1604:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1608:	0025179b          	sllw	a5,a0,0x2
    160c:	9fa9                	addw	a5,a5,a0
    160e:	fd06059b          	addw	a1,a2,-48
    1612:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1616:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    161a:	0705                	add	a4,a4,1
    161c:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1620:	0006861b          	sext.w	a2,a3
    1624:	ff08f0e3          	bgeu	a7,a6,1604 <atoi+0x3c>
    return neg ? n : -n;
    1628:	00030563          	beqz	t1,1632 <atoi+0x6a>
}
    162c:	8082                	ret
        s++;
    162e:	0505                	add	a0,a0,1
    1630:	bf79                	j	15ce <atoi+0x6>
    return neg ? n : -n;
    1632:	40f5853b          	subw	a0,a1,a5
    1636:	8082                	ret
    while (isdigit(*s))
    1638:	00154603          	lbu	a2,1(a0)
    163c:	47a5                	li	a5,9
        s++;
    163e:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1642:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1646:	4301                	li	t1,0
    while (isdigit(*s))
    1648:	2601                	sext.w	a2,a2
    164a:	fad7fbe3          	bgeu	a5,a3,1600 <atoi+0x38>
    164e:	4501                	li	a0,0
}
    1650:	8082                	ret
    while (isdigit(*s))
    1652:	00154603          	lbu	a2,1(a0)
    1656:	47a5                	li	a5,9
        s++;
    1658:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    165c:	fd06069b          	addw	a3,a2,-48
    1660:	2601                	sext.w	a2,a2
    1662:	fed7e6e3          	bltu	a5,a3,164e <atoi+0x86>
        neg = 1;
    1666:	4305                	li	t1,1
    1668:	bf61                	j	1600 <atoi+0x38>

000000000000166a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166a:	18060163          	beqz	a2,17ec <memset+0x182>
    166e:	40a006b3          	neg	a3,a0
    1672:	0076f793          	and	a5,a3,7
    1676:	00778813          	add	a6,a5,7
    167a:	48ad                	li	a7,11
    167c:	0ff5f713          	zext.b	a4,a1
    1680:	fff60593          	add	a1,a2,-1
    1684:	17186563          	bltu	a6,a7,17ee <memset+0x184>
    1688:	1705ed63          	bltu	a1,a6,1802 <memset+0x198>
    168c:	16078363          	beqz	a5,17f2 <memset+0x188>
    1690:	00e50023          	sb	a4,0(a0)
    1694:	0066f593          	and	a1,a3,6
    1698:	16058063          	beqz	a1,17f8 <memset+0x18e>
    169c:	00e500a3          	sb	a4,1(a0)
    16a0:	4589                	li	a1,2
    16a2:	16f5f363          	bgeu	a1,a5,1808 <memset+0x19e>
    16a6:	00e50123          	sb	a4,2(a0)
    16aa:	8a91                	and	a3,a3,4
    16ac:	00350593          	add	a1,a0,3
    16b0:	4e0d                	li	t3,3
    16b2:	ce9d                	beqz	a3,16f0 <memset+0x86>
    16b4:	00e501a3          	sb	a4,3(a0)
    16b8:	4691                	li	a3,4
    16ba:	00450593          	add	a1,a0,4
    16be:	4e11                	li	t3,4
    16c0:	02f6f863          	bgeu	a3,a5,16f0 <memset+0x86>
    16c4:	00e50223          	sb	a4,4(a0)
    16c8:	4695                	li	a3,5
    16ca:	00550593          	add	a1,a0,5
    16ce:	4e15                	li	t3,5
    16d0:	02d78063          	beq	a5,a3,16f0 <memset+0x86>
    16d4:	fff50693          	add	a3,a0,-1
    16d8:	00e502a3          	sb	a4,5(a0)
    16dc:	8a9d                	and	a3,a3,7
    16de:	00650593          	add	a1,a0,6
    16e2:	4e19                	li	t3,6
    16e4:	e691                	bnez	a3,16f0 <memset+0x86>
    16e6:	00750593          	add	a1,a0,7
    16ea:	00e50323          	sb	a4,6(a0)
    16ee:	4e1d                	li	t3,7
    16f0:	00871693          	sll	a3,a4,0x8
    16f4:	01071813          	sll	a6,a4,0x10
    16f8:	8ed9                	or	a3,a3,a4
    16fa:	01871893          	sll	a7,a4,0x18
    16fe:	0106e6b3          	or	a3,a3,a6
    1702:	0116e6b3          	or	a3,a3,a7
    1706:	02071813          	sll	a6,a4,0x20
    170a:	02871313          	sll	t1,a4,0x28
    170e:	0106e6b3          	or	a3,a3,a6
    1712:	40f608b3          	sub	a7,a2,a5
    1716:	03071813          	sll	a6,a4,0x30
    171a:	0066e6b3          	or	a3,a3,t1
    171e:	0106e6b3          	or	a3,a3,a6
    1722:	03871313          	sll	t1,a4,0x38
    1726:	97aa                	add	a5,a5,a0
    1728:	ff88f813          	and	a6,a7,-8
    172c:	0066e6b3          	or	a3,a3,t1
    1730:	983e                	add	a6,a6,a5
    1732:	e394                	sd	a3,0(a5)
    1734:	07a1                	add	a5,a5,8
    1736:	ff079ee3          	bne	a5,a6,1732 <memset+0xc8>
    173a:	ff88f793          	and	a5,a7,-8
    173e:	0078f893          	and	a7,a7,7
    1742:	00f586b3          	add	a3,a1,a5
    1746:	01c787bb          	addw	a5,a5,t3
    174a:	0a088b63          	beqz	a7,1800 <memset+0x196>
    174e:	00e68023          	sb	a4,0(a3)
    1752:	0017859b          	addw	a1,a5,1
    1756:	08c5fb63          	bgeu	a1,a2,17ec <memset+0x182>
    175a:	00e680a3          	sb	a4,1(a3)
    175e:	0027859b          	addw	a1,a5,2
    1762:	08c5f563          	bgeu	a1,a2,17ec <memset+0x182>
    1766:	00e68123          	sb	a4,2(a3)
    176a:	0037859b          	addw	a1,a5,3
    176e:	06c5ff63          	bgeu	a1,a2,17ec <memset+0x182>
    1772:	00e681a3          	sb	a4,3(a3)
    1776:	0047859b          	addw	a1,a5,4
    177a:	06c5f963          	bgeu	a1,a2,17ec <memset+0x182>
    177e:	00e68223          	sb	a4,4(a3)
    1782:	0057859b          	addw	a1,a5,5
    1786:	06c5f363          	bgeu	a1,a2,17ec <memset+0x182>
    178a:	00e682a3          	sb	a4,5(a3)
    178e:	0067859b          	addw	a1,a5,6
    1792:	04c5fd63          	bgeu	a1,a2,17ec <memset+0x182>
    1796:	00e68323          	sb	a4,6(a3)
    179a:	0077859b          	addw	a1,a5,7
    179e:	04c5f763          	bgeu	a1,a2,17ec <memset+0x182>
    17a2:	00e683a3          	sb	a4,7(a3)
    17a6:	0087859b          	addw	a1,a5,8
    17aa:	04c5f163          	bgeu	a1,a2,17ec <memset+0x182>
    17ae:	00e68423          	sb	a4,8(a3)
    17b2:	0097859b          	addw	a1,a5,9
    17b6:	02c5fb63          	bgeu	a1,a2,17ec <memset+0x182>
    17ba:	00e684a3          	sb	a4,9(a3)
    17be:	00a7859b          	addw	a1,a5,10
    17c2:	02c5f563          	bgeu	a1,a2,17ec <memset+0x182>
    17c6:	00e68523          	sb	a4,10(a3)
    17ca:	00b7859b          	addw	a1,a5,11
    17ce:	00c5ff63          	bgeu	a1,a2,17ec <memset+0x182>
    17d2:	00e685a3          	sb	a4,11(a3)
    17d6:	00c7859b          	addw	a1,a5,12
    17da:	00c5f963          	bgeu	a1,a2,17ec <memset+0x182>
    17de:	00e68623          	sb	a4,12(a3)
    17e2:	27b5                	addw	a5,a5,13
    17e4:	00c7f463          	bgeu	a5,a2,17ec <memset+0x182>
    17e8:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17ec:	8082                	ret
    17ee:	482d                	li	a6,11
    17f0:	bd61                	j	1688 <memset+0x1e>
    char *p = dest;
    17f2:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f4:	4e01                	li	t3,0
    17f6:	bded                	j	16f0 <memset+0x86>
    17f8:	00150593          	add	a1,a0,1
    17fc:	4e05                	li	t3,1
    17fe:	bdcd                	j	16f0 <memset+0x86>
    1800:	8082                	ret
    char *p = dest;
    1802:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1804:	4781                	li	a5,0
    1806:	b7a1                	j	174e <memset+0xe4>
    1808:	00250593          	add	a1,a0,2
    180c:	4e09                	li	t3,2
    180e:	b5cd                	j	16f0 <memset+0x86>

0000000000001810 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1810:	00054783          	lbu	a5,0(a0)
    1814:	0005c703          	lbu	a4,0(a1)
    1818:	00e79863          	bne	a5,a4,1828 <strcmp+0x18>
    181c:	0505                	add	a0,a0,1
    181e:	0585                	add	a1,a1,1
    1820:	fbe5                	bnez	a5,1810 <strcmp>
    1822:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1824:	9d19                	subw	a0,a0,a4
    1826:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1828:	0007851b          	sext.w	a0,a5
    182c:	bfe5                	j	1824 <strcmp+0x14>

000000000000182e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    182e:	ca15                	beqz	a2,1862 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1830:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1834:	167d                	add	a2,a2,-1
    1836:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183a:	eb99                	bnez	a5,1850 <strncmp+0x22>
    183c:	a815                	j	1870 <strncmp+0x42>
    183e:	00a68e63          	beq	a3,a0,185a <strncmp+0x2c>
    1842:	0505                	add	a0,a0,1
    1844:	00f71b63          	bne	a4,a5,185a <strncmp+0x2c>
    1848:	00054783          	lbu	a5,0(a0)
    184c:	cf89                	beqz	a5,1866 <strncmp+0x38>
    184e:	85b2                	mv	a1,a2
    1850:	0005c703          	lbu	a4,0(a1)
    1854:	00158613          	add	a2,a1,1
    1858:	f37d                	bnez	a4,183e <strncmp+0x10>
        ;
    return *l - *r;
    185a:	0007851b          	sext.w	a0,a5
    185e:	9d19                	subw	a0,a0,a4
    1860:	8082                	ret
        return 0;
    1862:	4501                	li	a0,0
}
    1864:	8082                	ret
    return *l - *r;
    1866:	0015c703          	lbu	a4,1(a1)
    186a:	4501                	li	a0,0
    186c:	9d19                	subw	a0,a0,a4
    186e:	8082                	ret
    1870:	0005c703          	lbu	a4,0(a1)
    1874:	4501                	li	a0,0
    1876:	b7e5                	j	185e <strncmp+0x30>

0000000000001878 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1878:	00757793          	and	a5,a0,7
    187c:	cf89                	beqz	a5,1896 <strlen+0x1e>
    187e:	87aa                	mv	a5,a0
    1880:	a029                	j	188a <strlen+0x12>
    1882:	0785                	add	a5,a5,1
    1884:	0077f713          	and	a4,a5,7
    1888:	cb01                	beqz	a4,1898 <strlen+0x20>
        if (!*s)
    188a:	0007c703          	lbu	a4,0(a5)
    188e:	fb75                	bnez	a4,1882 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1890:	40a78533          	sub	a0,a5,a0
}
    1894:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1896:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1898:	6394                	ld	a3,0(a5)
    189a:	00000597          	auipc	a1,0x0
    189e:	6e65b583          	ld	a1,1766(a1) # 1f80 <__clone+0xce>
    18a2:	00000617          	auipc	a2,0x0
    18a6:	6e663603          	ld	a2,1766(a2) # 1f88 <__clone+0xd6>
    18aa:	a019                	j	18b0 <strlen+0x38>
    18ac:	6794                	ld	a3,8(a5)
    18ae:	07a1                	add	a5,a5,8
    18b0:	00b68733          	add	a4,a3,a1
    18b4:	fff6c693          	not	a3,a3
    18b8:	8f75                	and	a4,a4,a3
    18ba:	8f71                	and	a4,a4,a2
    18bc:	db65                	beqz	a4,18ac <strlen+0x34>
    for (; *s; s++)
    18be:	0007c703          	lbu	a4,0(a5)
    18c2:	d779                	beqz	a4,1890 <strlen+0x18>
    18c4:	0017c703          	lbu	a4,1(a5)
    18c8:	0785                	add	a5,a5,1
    18ca:	d379                	beqz	a4,1890 <strlen+0x18>
    18cc:	0017c703          	lbu	a4,1(a5)
    18d0:	0785                	add	a5,a5,1
    18d2:	fb6d                	bnez	a4,18c4 <strlen+0x4c>
    18d4:	bf75                	j	1890 <strlen+0x18>

00000000000018d6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d6:	00757713          	and	a4,a0,7
{
    18da:	87aa                	mv	a5,a0
    18dc:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e0:	cb19                	beqz	a4,18f6 <memchr+0x20>
    18e2:	ce25                	beqz	a2,195a <memchr+0x84>
    18e4:	0007c703          	lbu	a4,0(a5)
    18e8:	00b70763          	beq	a4,a1,18f6 <memchr+0x20>
    18ec:	0785                	add	a5,a5,1
    18ee:	0077f713          	and	a4,a5,7
    18f2:	167d                	add	a2,a2,-1
    18f4:	f77d                	bnez	a4,18e2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f6:	4501                	li	a0,0
    if (n && *s != c)
    18f8:	c235                	beqz	a2,195c <memchr+0x86>
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	06b70063          	beq	a4,a1,195e <memchr+0x88>
        size_t k = ONES * c;
    1902:	00000517          	auipc	a0,0x0
    1906:	68e53503          	ld	a0,1678(a0) # 1f90 <__clone+0xde>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190a:	471d                	li	a4,7
        size_t k = ONES * c;
    190c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1910:	04c77763          	bgeu	a4,a2,195e <memchr+0x88>
    1914:	00000897          	auipc	a7,0x0
    1918:	66c8b883          	ld	a7,1644(a7) # 1f80 <__clone+0xce>
    191c:	00000817          	auipc	a6,0x0
    1920:	66c83803          	ld	a6,1644(a6) # 1f88 <__clone+0xd6>
    1924:	431d                	li	t1,7
    1926:	a029                	j	1930 <memchr+0x5a>
    1928:	1661                	add	a2,a2,-8
    192a:	07a1                	add	a5,a5,8
    192c:	00c37c63          	bgeu	t1,a2,1944 <memchr+0x6e>
    1930:	6398                	ld	a4,0(a5)
    1932:	8f29                	xor	a4,a4,a0
    1934:	011706b3          	add	a3,a4,a7
    1938:	fff74713          	not	a4,a4
    193c:	8f75                	and	a4,a4,a3
    193e:	01077733          	and	a4,a4,a6
    1942:	d37d                	beqz	a4,1928 <memchr+0x52>
    1944:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1946:	e601                	bnez	a2,194e <memchr+0x78>
    1948:	a809                	j	195a <memchr+0x84>
    194a:	0505                	add	a0,a0,1
    194c:	c619                	beqz	a2,195a <memchr+0x84>
    194e:	00054783          	lbu	a5,0(a0)
    1952:	167d                	add	a2,a2,-1
    1954:	feb79be3          	bne	a5,a1,194a <memchr+0x74>
    1958:	8082                	ret
    return n ? (void *)s : 0;
    195a:	4501                	li	a0,0
}
    195c:	8082                	ret
    if (n && *s != c)
    195e:	853e                	mv	a0,a5
    1960:	b7fd                	j	194e <memchr+0x78>

0000000000001962 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1962:	1101                	add	sp,sp,-32
    1964:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1966:	862e                	mv	a2,a1
{
    1968:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    196a:	4581                	li	a1,0
{
    196c:	e426                	sd	s1,8(sp)
    196e:	ec06                	sd	ra,24(sp)
    1970:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1972:	f65ff0ef          	jal	18d6 <memchr>
    return p ? p - s : n;
    1976:	c519                	beqz	a0,1984 <strnlen+0x22>
}
    1978:	60e2                	ld	ra,24(sp)
    197a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    197c:	8d05                	sub	a0,a0,s1
}
    197e:	64a2                	ld	s1,8(sp)
    1980:	6105                	add	sp,sp,32
    1982:	8082                	ret
    1984:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1986:	8522                	mv	a0,s0
}
    1988:	6442                	ld	s0,16(sp)
    198a:	64a2                	ld	s1,8(sp)
    198c:	6105                	add	sp,sp,32
    198e:	8082                	ret

0000000000001990 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1990:	00a5c7b3          	xor	a5,a1,a0
    1994:	8b9d                	and	a5,a5,7
    1996:	eb95                	bnez	a5,19ca <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1998:	0075f793          	and	a5,a1,7
    199c:	e7b1                	bnez	a5,19e8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    199e:	6198                	ld	a4,0(a1)
    19a0:	00000617          	auipc	a2,0x0
    19a4:	5e063603          	ld	a2,1504(a2) # 1f80 <__clone+0xce>
    19a8:	00000817          	auipc	a6,0x0
    19ac:	5e083803          	ld	a6,1504(a6) # 1f88 <__clone+0xd6>
    19b0:	a029                	j	19ba <strcpy+0x2a>
    19b2:	05a1                	add	a1,a1,8
    19b4:	e118                	sd	a4,0(a0)
    19b6:	6198                	ld	a4,0(a1)
    19b8:	0521                	add	a0,a0,8
    19ba:	00c707b3          	add	a5,a4,a2
    19be:	fff74693          	not	a3,a4
    19c2:	8ff5                	and	a5,a5,a3
    19c4:	0107f7b3          	and	a5,a5,a6
    19c8:	d7ed                	beqz	a5,19b2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ca:	0005c783          	lbu	a5,0(a1)
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	c785                	beqz	a5,19fa <strcpy+0x6a>
    19d4:	0015c783          	lbu	a5,1(a1)
    19d8:	0505                	add	a0,a0,1
    19da:	0585                	add	a1,a1,1
    19dc:	00f50023          	sb	a5,0(a0)
    19e0:	fbf5                	bnez	a5,19d4 <strcpy+0x44>
        ;
    return d;
}
    19e2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0505                	add	a0,a0,1
    19e6:	df45                	beqz	a4,199e <strcpy+0xe>
            if (!(*d = *s))
    19e8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ec:	0585                	add	a1,a1,1
    19ee:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19f2:	00f50023          	sb	a5,0(a0)
    19f6:	f7fd                	bnez	a5,19e4 <strcpy+0x54>
}
    19f8:	8082                	ret
    19fa:	8082                	ret

00000000000019fc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19fc:	00a5c7b3          	xor	a5,a1,a0
    1a00:	8b9d                	and	a5,a5,7
    1a02:	e3b5                	bnez	a5,1a66 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a04:	0075f793          	and	a5,a1,7
    1a08:	cf99                	beqz	a5,1a26 <strncpy+0x2a>
    1a0a:	ea09                	bnez	a2,1a1c <strncpy+0x20>
    1a0c:	a421                	j	1c14 <strncpy+0x218>
    1a0e:	0585                	add	a1,a1,1
    1a10:	0075f793          	and	a5,a1,7
    1a14:	167d                	add	a2,a2,-1
    1a16:	0505                	add	a0,a0,1
    1a18:	c799                	beqz	a5,1a26 <strncpy+0x2a>
    1a1a:	c225                	beqz	a2,1a7a <strncpy+0x7e>
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	00f50023          	sb	a5,0(a0)
    1a24:	f7ed                	bnez	a5,1a0e <strncpy+0x12>
            ;
        if (!n || !*s)
    1a26:	ca31                	beqz	a2,1a7a <strncpy+0x7e>
    1a28:	0005c783          	lbu	a5,0(a1)
    1a2c:	cba1                	beqz	a5,1a7c <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a2e:	479d                	li	a5,7
    1a30:	02c7fc63          	bgeu	a5,a2,1a68 <strncpy+0x6c>
    1a34:	00000897          	auipc	a7,0x0
    1a38:	54c8b883          	ld	a7,1356(a7) # 1f80 <__clone+0xce>
    1a3c:	00000817          	auipc	a6,0x0
    1a40:	54c83803          	ld	a6,1356(a6) # 1f88 <__clone+0xd6>
    1a44:	431d                	li	t1,7
    1a46:	a039                	j	1a54 <strncpy+0x58>
            *wd = *ws;
    1a48:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a4a:	1661                	add	a2,a2,-8
    1a4c:	05a1                	add	a1,a1,8
    1a4e:	0521                	add	a0,a0,8
    1a50:	00c37b63          	bgeu	t1,a2,1a66 <strncpy+0x6a>
    1a54:	6198                	ld	a4,0(a1)
    1a56:	011707b3          	add	a5,a4,a7
    1a5a:	fff74693          	not	a3,a4
    1a5e:	8ff5                	and	a5,a5,a3
    1a60:	0107f7b3          	and	a5,a5,a6
    1a64:	d3f5                	beqz	a5,1a48 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a66:	ca11                	beqz	a2,1a7a <strncpy+0x7e>
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	0585                	add	a1,a1,1
    1a6e:	00f50023          	sb	a5,0(a0)
    1a72:	c789                	beqz	a5,1a7c <strncpy+0x80>
    1a74:	167d                	add	a2,a2,-1
    1a76:	0505                	add	a0,a0,1
    1a78:	fa65                	bnez	a2,1a68 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a7a:	8082                	ret
    1a7c:	4805                	li	a6,1
    1a7e:	14061b63          	bnez	a2,1bd4 <strncpy+0x1d8>
    1a82:	40a00733          	neg	a4,a0
    1a86:	00777793          	and	a5,a4,7
    1a8a:	4581                	li	a1,0
    1a8c:	12061c63          	bnez	a2,1bc4 <strncpy+0x1c8>
    1a90:	00778693          	add	a3,a5,7
    1a94:	48ad                	li	a7,11
    1a96:	1316e563          	bltu	a3,a7,1bc0 <strncpy+0x1c4>
    1a9a:	16d5e263          	bltu	a1,a3,1bfe <strncpy+0x202>
    1a9e:	14078c63          	beqz	a5,1bf6 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aa2:	00050023          	sb	zero,0(a0)
    1aa6:	00677693          	and	a3,a4,6
    1aaa:	14068263          	beqz	a3,1bee <strncpy+0x1f2>
    1aae:	000500a3          	sb	zero,1(a0)
    1ab2:	4689                	li	a3,2
    1ab4:	14f6f863          	bgeu	a3,a5,1c04 <strncpy+0x208>
    1ab8:	00050123          	sb	zero,2(a0)
    1abc:	8b11                	and	a4,a4,4
    1abe:	12070463          	beqz	a4,1be6 <strncpy+0x1ea>
    1ac2:	000501a3          	sb	zero,3(a0)
    1ac6:	4711                	li	a4,4
    1ac8:	00450693          	add	a3,a0,4
    1acc:	02f77563          	bgeu	a4,a5,1af6 <strncpy+0xfa>
    1ad0:	00050223          	sb	zero,4(a0)
    1ad4:	4715                	li	a4,5
    1ad6:	00550693          	add	a3,a0,5
    1ada:	00e78e63          	beq	a5,a4,1af6 <strncpy+0xfa>
    1ade:	fff50713          	add	a4,a0,-1
    1ae2:	000502a3          	sb	zero,5(a0)
    1ae6:	8b1d                	and	a4,a4,7
    1ae8:	12071263          	bnez	a4,1c0c <strncpy+0x210>
    1aec:	00750693          	add	a3,a0,7
    1af0:	00050323          	sb	zero,6(a0)
    1af4:	471d                	li	a4,7
    1af6:	40f80833          	sub	a6,a6,a5
    1afa:	ff887593          	and	a1,a6,-8
    1afe:	97aa                	add	a5,a5,a0
    1b00:	95be                	add	a1,a1,a5
    1b02:	0007b023          	sd	zero,0(a5)
    1b06:	07a1                	add	a5,a5,8
    1b08:	feb79de3          	bne	a5,a1,1b02 <strncpy+0x106>
    1b0c:	ff887593          	and	a1,a6,-8
    1b10:	00787813          	and	a6,a6,7
    1b14:	00e587bb          	addw	a5,a1,a4
    1b18:	00b68733          	add	a4,a3,a1
    1b1c:	0e080063          	beqz	a6,1bfc <strncpy+0x200>
    1b20:	00070023          	sb	zero,0(a4)
    1b24:	0017869b          	addw	a3,a5,1
    1b28:	f4c6f9e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b2c:	000700a3          	sb	zero,1(a4)
    1b30:	0027869b          	addw	a3,a5,2
    1b34:	f4c6f3e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b38:	00070123          	sb	zero,2(a4)
    1b3c:	0037869b          	addw	a3,a5,3
    1b40:	f2c6fde3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b44:	000701a3          	sb	zero,3(a4)
    1b48:	0047869b          	addw	a3,a5,4
    1b4c:	f2c6f7e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b50:	00070223          	sb	zero,4(a4)
    1b54:	0057869b          	addw	a3,a5,5
    1b58:	f2c6f1e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b5c:	000702a3          	sb	zero,5(a4)
    1b60:	0067869b          	addw	a3,a5,6
    1b64:	f0c6fbe3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b68:	00070323          	sb	zero,6(a4)
    1b6c:	0077869b          	addw	a3,a5,7
    1b70:	f0c6f5e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b74:	000703a3          	sb	zero,7(a4)
    1b78:	0087869b          	addw	a3,a5,8
    1b7c:	eec6ffe3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b80:	00070423          	sb	zero,8(a4)
    1b84:	0097869b          	addw	a3,a5,9
    1b88:	eec6f9e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b8c:	000704a3          	sb	zero,9(a4)
    1b90:	00a7869b          	addw	a3,a5,10
    1b94:	eec6f3e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1b98:	00070523          	sb	zero,10(a4)
    1b9c:	00b7869b          	addw	a3,a5,11
    1ba0:	ecc6fde3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1ba4:	000705a3          	sb	zero,11(a4)
    1ba8:	00c7869b          	addw	a3,a5,12
    1bac:	ecc6f7e3          	bgeu	a3,a2,1a7a <strncpy+0x7e>
    1bb0:	00070623          	sb	zero,12(a4)
    1bb4:	27b5                	addw	a5,a5,13
    1bb6:	ecc7f2e3          	bgeu	a5,a2,1a7a <strncpy+0x7e>
    1bba:	000706a3          	sb	zero,13(a4)
}
    1bbe:	8082                	ret
    1bc0:	46ad                	li	a3,11
    1bc2:	bde1                	j	1a9a <strncpy+0x9e>
    1bc4:	00778693          	add	a3,a5,7
    1bc8:	48ad                	li	a7,11
    1bca:	fff60593          	add	a1,a2,-1
    1bce:	ed16f6e3          	bgeu	a3,a7,1a9a <strncpy+0x9e>
    1bd2:	b7fd                	j	1bc0 <strncpy+0x1c4>
    1bd4:	40a00733          	neg	a4,a0
    1bd8:	8832                	mv	a6,a2
    1bda:	00777793          	and	a5,a4,7
    1bde:	4581                	li	a1,0
    1be0:	ea0608e3          	beqz	a2,1a90 <strncpy+0x94>
    1be4:	b7c5                	j	1bc4 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be6:	00350693          	add	a3,a0,3
    1bea:	470d                	li	a4,3
    1bec:	b729                	j	1af6 <strncpy+0xfa>
    1bee:	00150693          	add	a3,a0,1
    1bf2:	4705                	li	a4,1
    1bf4:	b709                	j	1af6 <strncpy+0xfa>
tail:
    1bf6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf8:	4701                	li	a4,0
    1bfa:	bdf5                	j	1af6 <strncpy+0xfa>
    1bfc:	8082                	ret
tail:
    1bfe:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c00:	4781                	li	a5,0
    1c02:	bf39                	j	1b20 <strncpy+0x124>
    1c04:	00250693          	add	a3,a0,2
    1c08:	4709                	li	a4,2
    1c0a:	b5f5                	j	1af6 <strncpy+0xfa>
    1c0c:	00650693          	add	a3,a0,6
    1c10:	4719                	li	a4,6
    1c12:	b5d5                	j	1af6 <strncpy+0xfa>
    1c14:	8082                	ret

0000000000001c16 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c16:	87aa                	mv	a5,a0
    1c18:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c1a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c1e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c22:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c24:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c26:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c2a:	2501                	sext.w	a0,a0
    1c2c:	8082                	ret

0000000000001c2e <openat>:
    register long a7 __asm__("a7") = n;
    1c2e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c32:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c36:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c3a:	2501                	sext.w	a0,a0
    1c3c:	8082                	ret

0000000000001c3e <close>:
    register long a7 __asm__("a7") = n;
    1c3e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c42:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c46:	2501                	sext.w	a0,a0
    1c48:	8082                	ret

0000000000001c4a <read>:
    register long a7 __asm__("a7") = n;
    1c4a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c4e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c52:	8082                	ret

0000000000001c54 <write>:
    register long a7 __asm__("a7") = n;
    1c54:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c58:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c5c:	8082                	ret

0000000000001c5e <getpid>:
    register long a7 __asm__("a7") = n;
    1c5e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c62:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <getppid>:
    register long a7 __asm__("a7") = n;
    1c6a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c6e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c76:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c7a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <fork>:
    register long a7 __asm__("a7") = n;
    1c82:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c86:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c92:	85b2                	mv	a1,a2
    1c94:	863a                	mv	a2,a4
    if (stack)
    1c96:	c191                	beqz	a1,1c9a <clone+0x8>
	stack += stack_size;
    1c98:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c9a:	4781                	li	a5,0
    1c9c:	4701                	li	a4,0
    1c9e:	4681                	li	a3,0
    1ca0:	2601                	sext.w	a2,a2
    1ca2:	ac01                	j	1eb2 <__clone>

0000000000001ca4 <sys_clone_raw>:
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    register long a7 __asm__("a7") = n;
    1ca4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ca8:	00000073          	ecall
}

long sys_clone_raw(unsigned long flags, void *stack, int *ptid, void *tls, int *ctid)
{
    return syscall(SYS_clone, flags, stack, ptid, tls, ctid);
}
    1cac:	8082                	ret

0000000000001cae <exit>:
    register long a7 __asm__("a7") = n;
    1cae:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb6:	8082                	ret

0000000000001cb8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cbc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cbe:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <exec>:
    register long a7 __asm__("a7") = n;
    1cc6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <execve>:
    register long a7 __asm__("a7") = n;
    1cd2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <times>:
    register long a7 __asm__("a7") = n;
    1cde:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <get_time>:

int64 get_time()
{
    1cea:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cec:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cf0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cf2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	ed09                	bnez	a0,1d14 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cfc:	67a2                	ld	a5,8(sp)
    1cfe:	3e800713          	li	a4,1000
    1d02:	00015503          	lhu	a0,0(sp)
    1d06:	02e7d7b3          	divu	a5,a5,a4
    1d0a:	02e50533          	mul	a0,a0,a4
    1d0e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d10:	0141                	add	sp,sp,16
    1d12:	8082                	ret
        return -1;
    1d14:	557d                	li	a0,-1
    1d16:	bfed                	j	1d10 <get_time+0x26>

0000000000001d18 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d18:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <time>:
    register long a7 __asm__("a7") = n;
    1d24:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d28:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <sleep>:

int sleep(unsigned long long time)
{
    1d30:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d32:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d34:	850a                	mv	a0,sp
    1d36:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d38:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d3c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d42:	e501                	bnez	a0,1d4a <sleep+0x1a>
    return 0;
    1d44:	4501                	li	a0,0
}
    1d46:	0141                	add	sp,sp,16
    1d48:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d4a:	4502                	lw	a0,0(sp)
}
    1d4c:	0141                	add	sp,sp,16
    1d4e:	8082                	ret

0000000000001d50 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d50:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <mmap>:
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d5c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d60:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d64:	8082                	ret

0000000000001d66 <mprotect>:
    register long a7 __asm__("a7") = n;
    1d66:	0e200893          	li	a7,226
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6a:	00000073          	ecall

int mprotect(void *addr, size_t len, int prot)
{
    return syscall(SYS_mprotect, addr, len, prot);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <munmap>:
    register long a7 __asm__("a7") = n;
    1d72:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d76:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <wait>:

int wait(int *code)
{
    1d7e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d80:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d84:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d86:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d88:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <spawn>:
    register long a7 __asm__("a7") = n;
    1d92:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d96:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <mailread>:
    register long a7 __asm__("a7") = n;
    1d9e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <mailwrite>:
    register long a7 __asm__("a7") = n;
    1daa:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dae:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <fstat>:
    register long a7 __asm__("a7") = n;
    1db6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <sys_mkdirat>:
    register long a2 __asm__("a2") = c;
    1dc2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc4:	02200893          	li	a7,34
    register long a2 __asm__("a2") = c;
    1dc8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dca:	00000073          	ecall

int sys_mkdirat(int dirfd, const char *path, mode_t mode)
{
    return syscall(SYS_mkdirat, dirfd, path, mode);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd2:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd8:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dda:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <link>:

int link(char *old_path, char *new_path)
{
    1df2:	87aa                	mv	a5,a0
    1df4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dfa:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dfe:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e00:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e04:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e06:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <unlink>:

int unlink(char *path)
{
    1e0e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e10:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e14:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e18:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <uname>:
    register long a7 __asm__("a7") = n;
    1e22:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <brk>:
    register long a7 __asm__("a7") = n;
    1e2e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e3a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e40:	8082                	ret

0000000000001e42 <chdir>:
    register long a7 __asm__("a7") = n;
    1e42:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e46:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e4e:	862e                	mv	a2,a1
    1e50:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e52:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e54:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e58:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e5c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e5e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e60:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <getdents>:
    register long a7 __asm__("a7") = n;
    1e68:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <pipe>:
    register long a7 __asm__("a7") = n;
    1e74:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e78:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <dup>:
    register long a7 __asm__("a7") = n;
    1e82:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e84:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <dup2>:
    register long a7 __asm__("a7") = n;
    1e8c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e8e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e90:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <mount>:
    register long a7 __asm__("a7") = n;
    1e98:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <umount>:
    register long a7 __asm__("a7") = n;
    1ea4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eaa:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb2:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb8:	8532                	mv	a0,a2
	mv a2, a4
    1eba:	863a                	mv	a2,a4
	mv a3, a5
    1ebc:	86be                	mv	a3,a5
	mv a4, a6
    1ebe:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec0:	0dc00893          	li	a7,220
	ecall
    1ec4:	00000073          	ecall

	beqz a0, 1f
    1ec8:	c111                	beqz	a0,1ecc <__clone+0x1a>
	# Parent
	ret
    1eca:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ecc:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ece:	6522                	ld	a0,8(sp)
	jalr a1
    1ed0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed2:	05d00893          	li	a7,93
	ecall
    1ed6:	00000073          	ecall
