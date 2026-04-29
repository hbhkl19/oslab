
init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	1141                	add	sp,sp,-16
   2:	e022                	sd	s0,0(sp)
   4:	e406                	sd	ra,8(sp)
   6:	0800                	add	s0,sp,16
   8:	00001697          	auipc	a3,0x1
   c:	a7968693          	add	a3,a3,-1415 # a81 <run_fallback_elves+0x4d7>
  10:	87b6                	mv	a5,a3
  12:	0007c703          	lbu	a4,0(a5)
  16:	863e                	mv	a2,a5
  18:	0785                	add	a5,a5,1
  1a:	ff65                	bnez	a4,12 <_start+0x12>
  1c:	9e15                	subw	a2,a2,a3
  1e:	2605                	addw	a2,a2,1
  20:	04000893          	li	a7,64
  24:	4505                	li	a0,1
  26:	00001597          	auipc	a1,0x1
  2a:	a5a58593          	add	a1,a1,-1446 # a80 <run_fallback_elves+0x4d6>
  2e:	00000073          	ecall
  32:	00000097          	auipc	ra,0x0
  36:	0fe080e7          	jalr	254(ra) # 130 <scan_and_run_scripts>
  3a:	cd1d                	beqz	a0,78 <_start+0x78>
  3c:	00001697          	auipc	a3,0x1
  40:	a9568693          	add	a3,a3,-1387 # ad1 <run_fallback_elves+0x527>
  44:	87b6                	mv	a5,a3
  46:	0007c703          	lbu	a4,0(a5)
  4a:	863e                	mv	a2,a5
  4c:	0785                	add	a5,a5,1
  4e:	ff65                	bnez	a4,46 <_start+0x46>
  50:	9e15                	subw	a2,a2,a3
  52:	04000893          	li	a7,64
  56:	4505                	li	a0,1
  58:	00001597          	auipc	a1,0x1
  5c:	a7858593          	add	a1,a1,-1416 # ad0 <run_fallback_elves+0x526>
  60:	2605                	addw	a2,a2,1
  62:	00000073          	ecall
  66:	05d00893          	li	a7,93
  6a:	4501                	li	a0,0
  6c:	00000073          	ecall
  70:	60a2                	ld	ra,8(sp)
  72:	6402                	ld	s0,0(sp)
  74:	0141                	add	sp,sp,16
  76:	8082                	ret
  78:	00001697          	auipc	a3,0x1
  7c:	a2968693          	add	a3,a3,-1495 # aa1 <run_fallback_elves+0x4f7>
  80:	87b6                	mv	a5,a3
  82:	0007c703          	lbu	a4,0(a5)
  86:	863e                	mv	a2,a5
  88:	0785                	add	a5,a5,1
  8a:	ff65                	bnez	a4,82 <_start+0x82>
  8c:	9e15                	subw	a2,a2,a3
  8e:	04000893          	li	a7,64
  92:	4505                	li	a0,1
  94:	00001597          	auipc	a1,0x1
  98:	a0c58593          	add	a1,a1,-1524 # aa0 <run_fallback_elves+0x4f6>
  9c:	2605                	addw	a2,a2,1
  9e:	00000073          	ecall
  a2:	00000097          	auipc	ra,0x0
  a6:	508080e7          	jalr	1288(ra) # 5aa <run_fallback_elves>
  aa:	bf49                	j	3c <_start+0x3c>

00000000000000ac <is_elf>:
  ac:	85aa                	mv	a1,a0
  ae:	03800893          	li	a7,56
  b2:	f9c00513          	li	a0,-100
  b6:	4601                	li	a2,0
  b8:	4681                	li	a3,0
  ba:	4701                	li	a4,0
  bc:	00000073          	ecall
  c0:	0005079b          	sext.w	a5,a0
  c4:	0607c463          	bltz	a5,12c <is_elf+0x80>
  c8:	1101                	add	sp,sp,-32
  ca:	ec22                	sd	s0,24(sp)
  cc:	1000                	add	s0,sp,32
  ce:	03f00893          	li	a7,63
  d2:	853e                	mv	a0,a5
  d4:	fe840593          	add	a1,s0,-24
  d8:	4611                	li	a2,4
  da:	00000073          	ecall
  de:	03900893          	li	a7,57
  e2:	0005071b          	sext.w	a4,a0
  e6:	853e                	mv	a0,a5
  e8:	00000073          	ecall
  ec:	4791                	li	a5,4
  ee:	00f70663          	beq	a4,a5,fa <is_elf+0x4e>
  f2:	4501                	li	a0,0
  f4:	6462                	ld	s0,24(sp)
  f6:	6105                	add	sp,sp,32
  f8:	8082                	ret
  fa:	fe844703          	lbu	a4,-24(s0)
  fe:	07f00793          	li	a5,127
 102:	fef718e3          	bne	a4,a5,f2 <is_elf+0x46>
 106:	fe944703          	lbu	a4,-23(s0)
 10a:	04500793          	li	a5,69
 10e:	fef712e3          	bne	a4,a5,f2 <is_elf+0x46>
 112:	fea44703          	lbu	a4,-22(s0)
 116:	04c00793          	li	a5,76
 11a:	fcf71ce3          	bne	a4,a5,f2 <is_elf+0x46>
 11e:	feb44503          	lbu	a0,-21(s0)
 122:	fba50513          	add	a0,a0,-70
 126:	00153513          	seqz	a0,a0
 12a:	b7e9                	j	f4 <is_elf+0x48>
 12c:	4501                	li	a0,0
 12e:	8082                	ret

0000000000000130 <scan_and_run_scripts>:
 130:	ac010113          	add	sp,sp,-1344
 134:	52813823          	sd	s0,1328(sp)
 138:	52113c23          	sd	ra,1336(sp)
 13c:	52913423          	sd	s1,1320(sp)
 140:	53213023          	sd	s2,1312(sp)
 144:	51313c23          	sd	s3,1304(sp)
 148:	51413823          	sd	s4,1296(sp)
 14c:	51513423          	sd	s5,1288(sp)
 150:	51613023          	sd	s6,1280(sp)
 154:	4f713c23          	sd	s7,1272(sp)
 158:	4f813823          	sd	s8,1264(sp)
 15c:	4f913423          	sd	s9,1256(sp)
 160:	4fa13023          	sd	s10,1248(sp)
 164:	4db13c23          	sd	s11,1240(sp)
 168:	54010413          	add	s0,sp,1344
 16c:	03800893          	li	a7,56
 170:	f9c00513          	li	a0,-100
 174:	00001597          	auipc	a1,0x1
 178:	8b458593          	add	a1,a1,-1868 # a28 <run_fallback_elves+0x47e>
 17c:	4601                	li	a2,0
 17e:	4681                	li	a3,0
 180:	4701                	li	a4,0
 182:	00000073          	ecall
 186:	00050b9b          	sext.w	s7,a0
 18a:	3c0bc463          	bltz	s7,552 <scan_and_run_scripts+0x422>
 18e:	03d00893          	li	a7,61
 192:	855e                	mv	a0,s7
 194:	b9040593          	add	a1,s0,-1136
 198:	40000613          	li	a2,1024
 19c:	00000073          	ecall
 1a0:	0005099b          	sext.w	s3,a0
 1a4:	3f305c63          	blez	s3,59c <scan_and_run_scripts+0x46c>
 1a8:	4c85                	li	s9,1
 1aa:	b1140d93          	add	s11,s0,-1263
 1ae:	00001c17          	auipc	s8,0x1
 1b2:	82bc0c13          	add	s8,s8,-2005 # 9d9 <run_fallback_elves+0x42f>
 1b6:	00001d17          	auipc	s10,0x1
 1ba:	833d0d13          	add	s10,s10,-1997 # 9e9 <run_fallback_elves+0x43f>
 1be:	4301                	li	t1,0
 1c0:	418c8c3b          	subw	s8,s9,s8
 1c4:	41ac8d3b          	subw	s10,s9,s10
 1c8:	41bc883b          	subw	a6,s9,s11
 1cc:	4901                	li	s2,0
 1ce:	4aa1                	li	s5,8
 1d0:	02e00b13          	li	s6,46
 1d4:	08000a13          	li	s4,128
 1d8:	a039                	j	1e6 <scan_and_run_scripts+0xb6>
 1da:	0104d783          	lhu	a5,16(s1)
 1de:	0127893b          	addw	s2,a5,s2
 1e2:	1f395163          	bge	s2,s3,3c4 <scan_and_run_scripts+0x294>
 1e6:	b9040793          	add	a5,s0,-1136
 1ea:	012784b3          	add	s1,a5,s2
 1ee:	0124c783          	lbu	a5,18(s1)
 1f2:	ff5794e3          	bne	a5,s5,1da <scan_and_run_scripts+0xaa>
 1f6:	0134c603          	lbu	a2,19(s1)
 1fa:	ff6600e3          	beq	a2,s6,1da <scan_and_run_scripts+0xaa>
 1fe:	02f00793          	li	a5,47
 202:	b0f40823          	sb	a5,-1264(s0)
 206:	24060b63          	beqz	a2,45c <scan_and_run_scripts+0x32c>
 20a:	4789                	li	a5,2
 20c:	a021                	j	214 <scan_and_run_scripts+0xe4>
 20e:	0785                	add	a5,a5,1
 210:	21478a63          	beq	a5,s4,424 <scan_and_run_scripts+0x2f4>
 214:	b1040693          	add	a3,s0,-1264
 218:	00f48733          	add	a4,s1,a5
 21c:	96be                	add	a3,a3,a5
 21e:	fec68fa3          	sb	a2,-1(a3)
 222:	01274603          	lbu	a2,18(a4)
 226:	f665                	bnez	a2,20e <scan_and_run_scripts+0xde>
 228:	2781                	sext.w	a5,a5
 22a:	f9078793          	add	a5,a5,-112
 22e:	97a2                	add	a5,a5,s0
 230:	01448613          	add	a2,s1,20
 234:	b8078023          	sb	zero,-1152(a5)
 238:	87b2                	mv	a5,a2
 23a:	0007c703          	lbu	a4,0(a5)
 23e:	86be                	mv	a3,a5
 240:	0785                	add	a5,a5,1
 242:	ff65                	bnez	a4,23a <scan_and_run_scripts+0x10a>
 244:	40cc863b          	subw	a2,s9,a2
 248:	9e35                	addw	a2,a2,a3
 24a:	00000797          	auipc	a5,0x0
 24e:	78f78793          	add	a5,a5,1935 # 9d9 <run_fallback_elves+0x42f>
 252:	0007c703          	lbu	a4,0(a5)
 256:	86be                	mv	a3,a5
 258:	0785                	add	a5,a5,1
 25a:	ff65                	bnez	a4,252 <scan_and_run_scripts+0x122>
 25c:	00dc07bb          	addw	a5,s8,a3
 260:	86be                	mv	a3,a5
 262:	f6f64ce3          	blt	a2,a5,1da <scan_and_run_scripts+0xaa>
 266:	9e15                	subw	a2,a2,a3
 268:	01348793          	add	a5,s1,19
 26c:	97b2                	add	a5,a5,a2
 26e:	00000717          	auipc	a4,0x0
 272:	76a70713          	add	a4,a4,1898 # 9d8 <run_fallback_elves+0x42e>
 276:	05f00693          	li	a3,95
 27a:	0007c603          	lbu	a2,0(a5)
 27e:	0705                	add	a4,a4,1
 280:	0785                	add	a5,a5,1
 282:	f4d61ce3          	bne	a2,a3,1da <scan_and_run_scripts+0xaa>
 286:	00074683          	lbu	a3,0(a4)
 28a:	fae5                	bnez	a3,27a <scan_and_run_scripts+0x14a>
 28c:	b1044583          	lbu	a1,-1264(s0)
 290:	18058d63          	beqz	a1,42a <scan_and_run_scripts+0x2fa>
 294:	b1040e13          	add	t3,s0,-1264
 298:	811ca7b7          	lui	a5,0x811ca
 29c:	01000637          	lui	a2,0x1000
 2a0:	86ae                	mv	a3,a1
 2a2:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 2a6:	8772                	mv	a4,t3
 2a8:	1936061b          	addw	a2,a2,403 # 1000193 <seen_cnt+0xfff4a3>
 2ac:	0705                	add	a4,a4,1
 2ae:	8fb5                	xor	a5,a5,a3
 2b0:	00074683          	lbu	a3,0(a4)
 2b4:	02f607bb          	mulw	a5,a2,a5
 2b8:	faf5                	bnez	a3,2ac <scan_and_run_scripts+0x17c>
 2ba:	00001f17          	auipc	t5,0x1
 2be:	a36f0f13          	add	t5,t5,-1482 # cf0 <seen_cnt>
 2c2:	000f2e83          	lw	t4,0(t5)
 2c6:	2bd05e63          	blez	t4,582 <scan_and_run_scripts+0x452>
 2ca:	00001517          	auipc	a0,0x1
 2ce:	82650513          	add	a0,a0,-2010 # af0 <seen_tests>
 2d2:	002e9893          	sll	a7,t4,0x2
 2d6:	872a                	mv	a4,a0
 2d8:	01150633          	add	a2,a0,a7
 2dc:	4314                	lw	a3,0(a4)
 2de:	0711                	add	a4,a4,4
 2e0:	eef68de3          	beq	a3,a5,1da <scan_and_run_scripts+0xaa>
 2e4:	fee61ce3          	bne	a2,a4,2dc <scan_and_run_scripts+0x1ac>
 2e8:	07f00793          	li	a5,127
 2ec:	b1040e13          	add	t3,s0,-1264
 2f0:	03d7ca63          	blt	a5,t4,324 <scan_and_run_scripts+0x1f4>
 2f4:	2e85                	addw	t4,t4,1
 2f6:	01df2023          	sw	t4,0(t5)
 2fa:	2a058363          	beqz	a1,5a0 <scan_and_run_scripts+0x470>
 2fe:	811ca7b7          	lui	a5,0x811ca
 302:	010006b7          	lui	a3,0x1000
 306:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 30a:	8772                	mv	a4,t3
 30c:	1936869b          	addw	a3,a3,403 # 1000193 <seen_cnt+0xfff4a3>
 310:	0705                	add	a4,a4,1
 312:	8fad                	xor	a5,a5,a1
 314:	00074583          	lbu	a1,0(a4)
 318:	02f687bb          	mulw	a5,a3,a5
 31c:	f9f5                	bnez	a1,310 <scan_and_run_scripts+0x1e0>
 31e:	98aa                	add	a7,a7,a0
 320:	00f8a023          	sw	a5,0(a7)
 324:	00000797          	auipc	a5,0x0
 328:	6c578793          	add	a5,a5,1733 # 9e9 <run_fallback_elves+0x43f>
 32c:	0007c703          	lbu	a4,0(a5)
 330:	863e                	mv	a2,a5
 332:	0785                	add	a5,a5,1
 334:	ff65                	bnez	a4,32c <scan_and_run_scripts+0x1fc>
 336:	04000893          	li	a7,64
 33a:	4505                	li	a0,1
 33c:	00000597          	auipc	a1,0x0
 340:	6ac58593          	add	a1,a1,1708 # 9e8 <run_fallback_elves+0x43e>
 344:	00cd063b          	addw	a2,s10,a2
 348:	00000073          	ecall
 34c:	b1044783          	lbu	a5,-1264(s0)
 350:	24078463          	beqz	a5,598 <scan_and_run_scripts+0x468>
 354:	87ee                	mv	a5,s11
 356:	0007c703          	lbu	a4,0(a5)
 35a:	86be                	mv	a3,a5
 35c:	0785                	add	a5,a5,1
 35e:	ff65                	bnez	a4,356 <scan_and_run_scripts+0x226>
 360:	00d8063b          	addw	a2,a6,a3
 364:	04000893          	li	a7,64
 368:	4505                	li	a0,1
 36a:	85f2                	mv	a1,t3
 36c:	00000073          	ecall
 370:	4505                	li	a0,1
 372:	00000597          	auipc	a1,0x0
 376:	6be58593          	add	a1,a1,1726 # a30 <run_fallback_elves+0x486>
 37a:	4605                	li	a2,1
 37c:	00000073          	ecall
 380:	0dc00893          	li	a7,220
 384:	4545                	li	a0,17
 386:	4581                	li	a1,0
 388:	4601                	li	a2,0
 38a:	4681                	li	a3,0
 38c:	4701                	li	a4,0
 38e:	00000073          	ecall
 392:	c969                	beqz	a0,464 <scan_and_run_scripts+0x334>
 394:	18a05863          	blez	a0,524 <scan_and_run_scripts+0x3f4>
 398:	10400893          	li	a7,260
 39c:	557d                	li	a0,-1
 39e:	00000073          	ecall
 3a2:	04000893          	li	a7,64
 3a6:	4505                	li	a0,1
 3a8:	00000597          	auipc	a1,0x0
 3ac:	68858593          	add	a1,a1,1672 # a30 <run_fallback_elves+0x486>
 3b0:	4605                	li	a2,1
 3b2:	00000073          	ecall
 3b6:	0104d783          	lhu	a5,16(s1)
 3ba:	4305                	li	t1,1
 3bc:	0127893b          	addw	s2,a5,s2
 3c0:	e33943e3          	blt	s2,s3,1e6 <scan_and_run_scripts+0xb6>
 3c4:	03d00893          	li	a7,61
 3c8:	855e                	mv	a0,s7
 3ca:	b9040593          	add	a1,s0,-1136
 3ce:	40000613          	li	a2,1024
 3d2:	00000073          	ecall
 3d6:	0005099b          	sext.w	s3,a0
 3da:	df3049e3          	bgtz	s3,1cc <scan_and_run_scripts+0x9c>
 3de:	03900893          	li	a7,57
 3e2:	855e                	mv	a0,s7
 3e4:	00000073          	ecall
 3e8:	53813083          	ld	ra,1336(sp)
 3ec:	53013403          	ld	s0,1328(sp)
 3f0:	52813483          	ld	s1,1320(sp)
 3f4:	52013903          	ld	s2,1312(sp)
 3f8:	51813983          	ld	s3,1304(sp)
 3fc:	51013a03          	ld	s4,1296(sp)
 400:	50813a83          	ld	s5,1288(sp)
 404:	50013b03          	ld	s6,1280(sp)
 408:	4f813b83          	ld	s7,1272(sp)
 40c:	4f013c03          	ld	s8,1264(sp)
 410:	4e813c83          	ld	s9,1256(sp)
 414:	4e013d03          	ld	s10,1248(sp)
 418:	4d813d83          	ld	s11,1240(sp)
 41c:	851a                	mv	a0,t1
 41e:	54010113          	add	sp,sp,1344
 422:	8082                	ret
 424:	07f00793          	li	a5,127
 428:	b509                	j	22a <scan_and_run_scripts+0xfa>
 42a:	00001f17          	auipc	t5,0x1
 42e:	8c6f0f13          	add	t5,t5,-1850 # cf0 <seen_cnt>
 432:	000f2e83          	lw	t4,0(t5)
 436:	811ca7b7          	lui	a5,0x811ca
 43a:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 43e:	e9d046e3          	bgtz	t4,2ca <scan_and_run_scripts+0x19a>
 442:	001e871b          	addw	a4,t4,1
 446:	00ef2023          	sw	a4,0(t5)
 44a:	b1040e13          	add	t3,s0,-1264
 44e:	00000517          	auipc	a0,0x0
 452:	6a250513          	add	a0,a0,1698 # af0 <seen_tests>
 456:	002e9893          	sll	a7,t4,0x2
 45a:	b5d1                	j	31e <scan_and_run_scripts+0x1ee>
 45c:	b00408a3          	sb	zero,-1263(s0)
 460:	4601                	li	a2,0
 462:	b3e5                	j	24a <scan_and_run_scripts+0x11a>
 464:	8572                	mv	a0,t3
 466:	ad042223          	sw	a6,-1340(s0)
 46a:	adc43423          	sd	t3,-1336(s0)
 46e:	00000097          	auipc	ra,0x0
 472:	c3e080e7          	jalr	-962(ra) # ac <is_elf>
 476:	ac843e03          	ld	t3,-1336(s0)
 47a:	ac442803          	lw	a6,-1340(s0)
 47e:	e551                	bnez	a0,50a <scan_and_run_scripts+0x3da>
 480:	00000797          	auipc	a5,0x0
 484:	5b878793          	add	a5,a5,1464 # a38 <run_fallback_elves+0x48e>
 488:	00000717          	auipc	a4,0x0
 48c:	5b870713          	add	a4,a4,1464 # a40 <run_fallback_elves+0x496>
 490:	aef43823          	sd	a5,-1296(s0)
 494:	aee43c23          	sd	a4,-1288(s0)
 498:	b1c43023          	sd	t3,-1280(s0)
 49c:	b0043423          	sd	zero,-1272(s0)
 4a0:	0dd00893          	li	a7,221
 4a4:	00000517          	auipc	a0,0x0
 4a8:	5a450513          	add	a0,a0,1444 # a48 <run_fallback_elves+0x49e>
 4ac:	af040593          	add	a1,s0,-1296
 4b0:	4601                	li	a2,0
 4b2:	00000073          	ecall
 4b6:	00000517          	auipc	a0,0x0
 4ba:	59250513          	add	a0,a0,1426 # a48 <run_fallback_elves+0x49e>
 4be:	acf43c23          	sd	a5,-1320(s0)
 4c2:	afc43023          	sd	t3,-1312(s0)
 4c6:	ae043423          	sd	zero,-1304(s0)
 4ca:	ad840593          	add	a1,s0,-1320
 4ce:	00000073          	ecall
 4d2:	00000617          	auipc	a2,0x0
 4d6:	52f60613          	add	a2,a2,1327 # a01 <run_fallback_elves+0x457>
 4da:	87b2                	mv	a5,a2
 4dc:	0007c703          	lbu	a4,0(a5)
 4e0:	86be                	mv	a3,a5
 4e2:	0785                	add	a5,a5,1
 4e4:	ff65                	bnez	a4,4dc <scan_and_run_scripts+0x3ac>
 4e6:	40c6863b          	subw	a2,a3,a2
 4ea:	04000893          	li	a7,64
 4ee:	4505                	li	a0,1
 4f0:	00000597          	auipc	a1,0x0
 4f4:	51058593          	add	a1,a1,1296 # a00 <run_fallback_elves+0x456>
 4f8:	2605                	addw	a2,a2,1
 4fa:	00000073          	ecall
 4fe:	05d00893          	li	a7,93
 502:	557d                	li	a0,-1
 504:	00000073          	ecall
 508:	bd69                	j	3a2 <scan_and_run_scripts+0x272>
 50a:	afc43823          	sd	t3,-1296(s0)
 50e:	ae043c23          	sd	zero,-1288(s0)
 512:	0dd00893          	li	a7,221
 516:	8572                	mv	a0,t3
 518:	af040593          	add	a1,s0,-1296
 51c:	4601                	li	a2,0
 51e:	00000073          	ecall
 522:	bfb9                	j	480 <scan_and_run_scripts+0x350>
 524:	00000617          	auipc	a2,0x0
 528:	4f560613          	add	a2,a2,1269 # a19 <run_fallback_elves+0x46f>
 52c:	87b2                	mv	a5,a2
 52e:	0007c703          	lbu	a4,0(a5)
 532:	86be                	mv	a3,a5
 534:	0785                	add	a5,a5,1
 536:	ff65                	bnez	a4,52e <scan_and_run_scripts+0x3fe>
 538:	40c6863b          	subw	a2,a3,a2
 53c:	04000893          	li	a7,64
 540:	4505                	li	a0,1
 542:	00000597          	auipc	a1,0x0
 546:	4d658593          	add	a1,a1,1238 # a18 <run_fallback_elves+0x46e>
 54a:	2605                	addw	a2,a2,1
 54c:	00000073          	ecall
 550:	bd89                	j	3a2 <scan_and_run_scripts+0x272>
 552:	00000617          	auipc	a2,0x0
 556:	46760613          	add	a2,a2,1127 # 9b9 <run_fallback_elves+0x40f>
 55a:	87b2                	mv	a5,a2
 55c:	0007c703          	lbu	a4,0(a5)
 560:	86be                	mv	a3,a5
 562:	0785                	add	a5,a5,1
 564:	ff65                	bnez	a4,55c <scan_and_run_scripts+0x42c>
 566:	40c6863b          	subw	a2,a3,a2
 56a:	04000893          	li	a7,64
 56e:	4505                	li	a0,1
 570:	00000597          	auipc	a1,0x0
 574:	44858593          	add	a1,a1,1096 # 9b8 <run_fallback_elves+0x40e>
 578:	2605                	addw	a2,a2,1
 57a:	00000073          	ecall
 57e:	4301                	li	t1,0
 580:	b5a5                	j	3e8 <scan_and_run_scripts+0x2b8>
 582:	001e879b          	addw	a5,t4,1
 586:	00ff2023          	sw	a5,0(t5)
 58a:	00000517          	auipc	a0,0x0
 58e:	56650513          	add	a0,a0,1382 # af0 <seen_tests>
 592:	002e9893          	sll	a7,t4,0x2
 596:	b3a5                	j	2fe <scan_and_run_scripts+0x1ce>
 598:	4601                	li	a2,0
 59a:	b3e9                	j	364 <scan_and_run_scripts+0x234>
 59c:	4301                	li	t1,0
 59e:	b581                	j	3de <scan_and_run_scripts+0x2ae>
 5a0:	811ca7b7          	lui	a5,0x811ca
 5a4:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 5a8:	bb9d                	j	31e <scan_and_run_scripts+0x1ee>

00000000000005aa <run_fallback_elves>:
 5aa:	b0010113          	add	sp,sp,-1280
 5ae:	4e813823          	sd	s0,1264(sp)
 5b2:	4e113c23          	sd	ra,1272(sp)
 5b6:	4e913423          	sd	s1,1256(sp)
 5ba:	4f213023          	sd	s2,1248(sp)
 5be:	4d313c23          	sd	s3,1240(sp)
 5c2:	4d413823          	sd	s4,1232(sp)
 5c6:	4d513423          	sd	s5,1224(sp)
 5ca:	4d613023          	sd	s6,1216(sp)
 5ce:	4b713c23          	sd	s7,1208(sp)
 5d2:	4b813823          	sd	s8,1200(sp)
 5d6:	4b913423          	sd	s9,1192(sp)
 5da:	4ba13023          	sd	s10,1184(sp)
 5de:	49b13c23          	sd	s11,1176(sp)
 5e2:	50010413          	add	s0,sp,1280
 5e6:	03800893          	li	a7,56
 5ea:	f9c00513          	li	a0,-100
 5ee:	00000597          	auipc	a1,0x0
 5f2:	43a58593          	add	a1,a1,1082 # a28 <run_fallback_elves+0x47e>
 5f6:	4601                	li	a2,0
 5f8:	4681                	li	a3,0
 5fa:	4701                	li	a4,0
 5fc:	00000073          	ecall
 600:	0005091b          	sext.w	s2,a0
 604:	30094363          	bltz	s2,90a <run_fallback_elves+0x360>
 608:	03d00893          	li	a7,61
 60c:	854a                	mv	a0,s2
 60e:	b9040593          	add	a1,s0,-1136
 612:	40000613          	li	a2,1024
 616:	00000073          	ecall
 61a:	00050b1b          	sext.w	s6,a0
 61e:	21605d63          	blez	s6,838 <run_fallback_elves+0x28e>
 622:	811caa37          	lui	s4,0x811ca
 626:	010009b7          	lui	s3,0x1000
 62a:	08000b93          	li	s7,128
 62e:	dc5a0a13          	add	s4,s4,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 632:	1939899b          	addw	s3,s3,403 # 1000193 <seen_cnt+0xfff4a3>
 636:	4a81                	li	s5,0
 638:	4c21                	li	s8,8
 63a:	02e00c93          	li	s9,46
 63e:	02f00d13          	li	s10,47
 642:	a039                	j	650 <run_fallback_elves+0xa6>
 644:	0104d783          	lhu	a5,16(s1)
 648:	01578abb          	addw	s5,a5,s5
 64c:	1d6ad963          	bge	s5,s6,81e <run_fallback_elves+0x274>
 650:	b9040793          	add	a5,s0,-1136
 654:	015784b3          	add	s1,a5,s5
 658:	0124c783          	lbu	a5,18(s1)
 65c:	ff8794e3          	bne	a5,s8,644 <run_fallback_elves+0x9a>
 660:	0134c583          	lbu	a1,19(s1)
 664:	ff9580e3          	beq	a1,s9,644 <run_fallback_elves+0x9a>
 668:	b1a40823          	sb	s10,-1264(s0)
 66c:	01348513          	add	a0,s1,19
 670:	22058a63          	beqz	a1,8a4 <run_fallback_elves+0x2fa>
 674:	862e                	mv	a2,a1
 676:	4789                	li	a5,2
 678:	b1040d93          	add	s11,s0,-1264
 67c:	a021                	j	684 <run_fallback_elves+0xda>
 67e:	0785                	add	a5,a5,1
 680:	21778363          	beq	a5,s7,886 <run_fallback_elves+0x2dc>
 684:	b1040693          	add	a3,s0,-1264
 688:	00f48733          	add	a4,s1,a5
 68c:	96be                	add	a3,a3,a5
 68e:	fec68fa3          	sb	a2,-1(a3)
 692:	01274603          	lbu	a2,18(a4)
 696:	f665                	bnez	a2,67e <run_fallback_elves+0xd4>
 698:	2781                	sext.w	a5,a5
 69a:	f9078793          	add	a5,a5,-112
 69e:	97a2                	add	a5,a5,s0
 6a0:	b8078023          	sb	zero,-1152(a5)
 6a4:	872a                	mv	a4,a0
 6a6:	862e                	mv	a2,a1
 6a8:	00000797          	auipc	a5,0x0
 6ac:	39078793          	add	a5,a5,912 # a38 <run_fallback_elves+0x48e>
 6b0:	a039                	j	6be <run_fallback_elves+0x114>
 6b2:	00c69b63          	bne	a3,a2,6c8 <run_fallback_elves+0x11e>
 6b6:	00074603          	lbu	a2,0(a4)
 6ba:	1c060163          	beqz	a2,87c <run_fallback_elves+0x2d2>
 6be:	0007c683          	lbu	a3,0(a5)
 6c2:	0705                	add	a4,a4,1
 6c4:	0785                	add	a5,a5,1
 6c6:	f6f5                	bnez	a3,6b2 <run_fallback_elves+0x108>
 6c8:	00000797          	auipc	a5,0x0
 6cc:	39078793          	add	a5,a5,912 # a58 <run_fallback_elves+0x4ae>
 6d0:	a039                	j	6de <run_fallback_elves+0x134>
 6d2:	00b71b63          	bne	a4,a1,6e8 <run_fallback_elves+0x13e>
 6d6:	00054583          	lbu	a1,0(a0)
 6da:	1a058963          	beqz	a1,88c <run_fallback_elves+0x2e2>
 6de:	0007c703          	lbu	a4,0(a5)
 6e2:	0505                	add	a0,a0,1
 6e4:	0785                	add	a5,a5,1
 6e6:	f775                	bnez	a4,6d2 <run_fallback_elves+0x128>
 6e8:	856e                	mv	a0,s11
 6ea:	00000097          	auipc	ra,0x0
 6ee:	9c2080e7          	jalr	-1598(ra) # ac <is_elf>
 6f2:	d929                	beqz	a0,644 <run_fallback_elves+0x9a>
 6f4:	b1044603          	lbu	a2,-1264(s0)
 6f8:	87d2                	mv	a5,s4
 6fa:	86ee                	mv	a3,s11
 6fc:	8732                	mv	a4,a2
 6fe:	22060d63          	beqz	a2,938 <run_fallback_elves+0x38e>
 702:	0685                	add	a3,a3,1
 704:	8fb9                	xor	a5,a5,a4
 706:	0006c703          	lbu	a4,0(a3)
 70a:	02f987bb          	mulw	a5,s3,a5
 70e:	fb75                	bnez	a4,702 <run_fallback_elves+0x158>
 710:	00000317          	auipc	t1,0x0
 714:	5e030313          	add	t1,t1,1504 # cf0 <seen_cnt>
 718:	00032503          	lw	a0,0(t1)
 71c:	26a05c63          	blez	a0,994 <run_fallback_elves+0x3ea>
 720:	00000817          	auipc	a6,0x0
 724:	3d080813          	add	a6,a6,976 # af0 <seen_tests>
 728:	00251893          	sll	a7,a0,0x2
 72c:	8742                	mv	a4,a6
 72e:	011805b3          	add	a1,a6,a7
 732:	4314                	lw	a3,0(a4)
 734:	0711                	add	a4,a4,4
 736:	f0f687e3          	beq	a3,a5,644 <run_fallback_elves+0x9a>
 73a:	feb71ce3          	bne	a4,a1,732 <run_fallback_elves+0x188>
 73e:	07f00793          	li	a5,127
 742:	02a7ca63          	blt	a5,a0,776 <run_fallback_elves+0x1cc>
 746:	2505                	addw	a0,a0,1
 748:	00a32023          	sw	a0,0(t1)
 74c:	26060163          	beqz	a2,9ae <run_fallback_elves+0x404>
 750:	811ca7b7          	lui	a5,0x811ca
 754:	010006b7          	lui	a3,0x1000
 758:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 75c:	876e                	mv	a4,s11
 75e:	1936869b          	addw	a3,a3,403 # 1000193 <seen_cnt+0xfff4a3>
 762:	0705                	add	a4,a4,1
 764:	8fb1                	xor	a5,a5,a2
 766:	00074603          	lbu	a2,0(a4)
 76a:	02f687bb          	mulw	a5,a3,a5
 76e:	fa75                	bnez	a2,762 <run_fallback_elves+0x1b8>
 770:	9846                	add	a6,a6,a7
 772:	00f82023          	sw	a5,0(a6)
 776:	00000617          	auipc	a2,0x0
 77a:	2eb60613          	add	a2,a2,747 # a61 <run_fallback_elves+0x4b7>
 77e:	87b2                	mv	a5,a2
 780:	0007c703          	lbu	a4,0(a5)
 784:	86be                	mv	a3,a5
 786:	0785                	add	a5,a5,1
 788:	ff65                	bnez	a4,780 <run_fallback_elves+0x1d6>
 78a:	40c6863b          	subw	a2,a3,a2
 78e:	04000893          	li	a7,64
 792:	4505                	li	a0,1
 794:	00000597          	auipc	a1,0x0
 798:	2cc58593          	add	a1,a1,716 # a60 <run_fallback_elves+0x4b6>
 79c:	2605                	addw	a2,a2,1
 79e:	00000073          	ecall
 7a2:	b1044783          	lbu	a5,-1264(s0)
 7a6:	20078263          	beqz	a5,9aa <run_fallback_elves+0x400>
 7aa:	b1140613          	add	a2,s0,-1263
 7ae:	87b2                	mv	a5,a2
 7b0:	0007c703          	lbu	a4,0(a5)
 7b4:	86be                	mv	a3,a5
 7b6:	0785                	add	a5,a5,1
 7b8:	ff65                	bnez	a4,7b0 <run_fallback_elves+0x206>
 7ba:	9e91                	subw	a3,a3,a2
 7bc:	0016861b          	addw	a2,a3,1
 7c0:	04000893          	li	a7,64
 7c4:	4505                	li	a0,1
 7c6:	85ee                	mv	a1,s11
 7c8:	00000073          	ecall
 7cc:	4505                	li	a0,1
 7ce:	00000597          	auipc	a1,0x0
 7d2:	26258593          	add	a1,a1,610 # a30 <run_fallback_elves+0x486>
 7d6:	4605                	li	a2,1
 7d8:	00000073          	ecall
 7dc:	0dc00893          	li	a7,220
 7e0:	4545                	li	a0,17
 7e2:	4581                	li	a1,0
 7e4:	4601                	li	a2,0
 7e6:	4681                	li	a3,0
 7e8:	4701                	li	a4,0
 7ea:	00000073          	ecall
 7ee:	c579                	beqz	a0,8bc <run_fallback_elves+0x312>
 7f0:	16a05b63          	blez	a0,966 <run_fallback_elves+0x3bc>
 7f4:	10400893          	li	a7,260
 7f8:	557d                	li	a0,-1
 7fa:	00000073          	ecall
 7fe:	04000893          	li	a7,64
 802:	4505                	li	a0,1
 804:	00000597          	auipc	a1,0x0
 808:	22c58593          	add	a1,a1,556 # a30 <run_fallback_elves+0x486>
 80c:	4605                	li	a2,1
 80e:	00000073          	ecall
 812:	0104d783          	lhu	a5,16(s1)
 816:	01578abb          	addw	s5,a5,s5
 81a:	e36acbe3          	blt	s5,s6,650 <run_fallback_elves+0xa6>
 81e:	03d00893          	li	a7,61
 822:	854a                	mv	a0,s2
 824:	b9040593          	add	a1,s0,-1136
 828:	40000613          	li	a2,1024
 82c:	00000073          	ecall
 830:	00050b1b          	sext.w	s6,a0
 834:	e16041e3          	bgtz	s6,636 <run_fallback_elves+0x8c>
 838:	03900893          	li	a7,57
 83c:	854a                	mv	a0,s2
 83e:	00000073          	ecall
 842:	4f813083          	ld	ra,1272(sp)
 846:	4f013403          	ld	s0,1264(sp)
 84a:	4e813483          	ld	s1,1256(sp)
 84e:	4e013903          	ld	s2,1248(sp)
 852:	4d813983          	ld	s3,1240(sp)
 856:	4d013a03          	ld	s4,1232(sp)
 85a:	4c813a83          	ld	s5,1224(sp)
 85e:	4c013b03          	ld	s6,1216(sp)
 862:	4b813b83          	ld	s7,1208(sp)
 866:	4b013c03          	ld	s8,1200(sp)
 86a:	4a813c83          	ld	s9,1192(sp)
 86e:	4a013d03          	ld	s10,1184(sp)
 872:	49813d83          	ld	s11,1176(sp)
 876:	50010113          	add	sp,sp,1280
 87a:	8082                	ret
 87c:	0007c783          	lbu	a5,0(a5)
 880:	dc0782e3          	beqz	a5,644 <run_fallback_elves+0x9a>
 884:	b591                	j	6c8 <run_fallback_elves+0x11e>
 886:	07f00793          	li	a5,127
 88a:	bd01                	j	69a <run_fallback_elves+0xf0>
 88c:	0007c783          	lbu	a5,0(a5)
 890:	da078ae3          	beqz	a5,644 <run_fallback_elves+0x9a>
 894:	856e                	mv	a0,s11
 896:	00000097          	auipc	ra,0x0
 89a:	816080e7          	jalr	-2026(ra) # ac <is_elf>
 89e:	da0503e3          	beqz	a0,644 <run_fallback_elves+0x9a>
 8a2:	bd89                	j	6f4 <run_fallback_elves+0x14a>
 8a4:	b1040d93          	add	s11,s0,-1264
 8a8:	856e                	mv	a0,s11
 8aa:	b00408a3          	sb	zero,-1263(s0)
 8ae:	fffff097          	auipc	ra,0xfffff
 8b2:	7fe080e7          	jalr	2046(ra) # ac <is_elf>
 8b6:	d80507e3          	beqz	a0,644 <run_fallback_elves+0x9a>
 8ba:	bd2d                	j	6f4 <run_fallback_elves+0x14a>
 8bc:	b1b43023          	sd	s11,-1280(s0)
 8c0:	b0043423          	sd	zero,-1272(s0)
 8c4:	0dd00893          	li	a7,221
 8c8:	856e                	mv	a0,s11
 8ca:	b0040593          	add	a1,s0,-1280
 8ce:	00000073          	ecall
 8d2:	00000617          	auipc	a2,0x0
 8d6:	19f60613          	add	a2,a2,415 # a71 <run_fallback_elves+0x4c7>
 8da:	87b2                	mv	a5,a2
 8dc:	0007c703          	lbu	a4,0(a5)
 8e0:	86be                	mv	a3,a5
 8e2:	0785                	add	a5,a5,1
 8e4:	ff65                	bnez	a4,8dc <run_fallback_elves+0x332>
 8e6:	40c6863b          	subw	a2,a3,a2
 8ea:	04000893          	li	a7,64
 8ee:	4505                	li	a0,1
 8f0:	00000597          	auipc	a1,0x0
 8f4:	18058593          	add	a1,a1,384 # a70 <run_fallback_elves+0x4c6>
 8f8:	2605                	addw	a2,a2,1
 8fa:	00000073          	ecall
 8fe:	05d00893          	li	a7,93
 902:	557d                	li	a0,-1
 904:	00000073          	ecall
 908:	bddd                	j	7fe <run_fallback_elves+0x254>
 90a:	00000617          	auipc	a2,0x0
 90e:	0af60613          	add	a2,a2,175 # 9b9 <run_fallback_elves+0x40f>
 912:	87b2                	mv	a5,a2
 914:	0007c703          	lbu	a4,0(a5)
 918:	86be                	mv	a3,a5
 91a:	0785                	add	a5,a5,1
 91c:	ff65                	bnez	a4,914 <run_fallback_elves+0x36a>
 91e:	40c6863b          	subw	a2,a3,a2
 922:	04000893          	li	a7,64
 926:	4505                	li	a0,1
 928:	00000597          	auipc	a1,0x0
 92c:	09058593          	add	a1,a1,144 # 9b8 <run_fallback_elves+0x40e>
 930:	2605                	addw	a2,a2,1
 932:	00000073          	ecall
 936:	b731                	j	842 <run_fallback_elves+0x298>
 938:	00000317          	auipc	t1,0x0
 93c:	3b830313          	add	t1,t1,952 # cf0 <seen_cnt>
 940:	00032503          	lw	a0,0(t1)
 944:	811ca7b7          	lui	a5,0x811ca
 948:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 94c:	dca04ae3          	bgtz	a0,720 <run_fallback_elves+0x176>
 950:	0015071b          	addw	a4,a0,1
 954:	00e32023          	sw	a4,0(t1)
 958:	00000817          	auipc	a6,0x0
 95c:	19880813          	add	a6,a6,408 # af0 <seen_tests>
 960:	00251893          	sll	a7,a0,0x2
 964:	b531                	j	770 <run_fallback_elves+0x1c6>
 966:	00000617          	auipc	a2,0x0
 96a:	0b360613          	add	a2,a2,179 # a19 <run_fallback_elves+0x46f>
 96e:	87b2                	mv	a5,a2
 970:	0007c703          	lbu	a4,0(a5)
 974:	86be                	mv	a3,a5
 976:	0785                	add	a5,a5,1
 978:	ff65                	bnez	a4,970 <run_fallback_elves+0x3c6>
 97a:	40c6863b          	subw	a2,a3,a2
 97e:	04000893          	li	a7,64
 982:	4505                	li	a0,1
 984:	00000597          	auipc	a1,0x0
 988:	09458593          	add	a1,a1,148 # a18 <run_fallback_elves+0x46e>
 98c:	2605                	addw	a2,a2,1
 98e:	00000073          	ecall
 992:	b5b5                	j	7fe <run_fallback_elves+0x254>
 994:	0015079b          	addw	a5,a0,1
 998:	00f32023          	sw	a5,0(t1)
 99c:	00000817          	auipc	a6,0x0
 9a0:	15480813          	add	a6,a6,340 # af0 <seen_tests>
 9a4:	00251893          	sll	a7,a0,0x2
 9a8:	b365                	j	750 <run_fallback_elves+0x1a6>
 9aa:	4601                	li	a2,0
 9ac:	bd11                	j	7c0 <run_fallback_elves+0x216>
 9ae:	811ca7b7          	lui	a5,0x811ca
 9b2:	dc578793          	add	a5,a5,-571 # ffffffff811c9dc5 <seen_cnt+0xffffffff811c90d5>
 9b6:	bb6d                	j	770 <run_fallback_elves+0x1c6>
