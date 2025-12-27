
initcode.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <__syscall0>:
   0:	fe010113          	add	sp,sp,-32
   4:	00813c23          	sd	s0,24(sp)
   8:	02010413          	add	s0,sp,32
   c:	fea43423          	sd	a0,-24(s0)
  10:	fe843883          	ld	a7,-24(s0)
  14:	00000073          	ecall
  18:	00050793          	mv	a5,a0
  1c:	00078513          	mv	a0,a5
  20:	01813403          	ld	s0,24(sp)
  24:	02010113          	add	sp,sp,32
  28:	00008067          	ret

000000000000002c <__syscall1>:
  2c:	fe010113          	add	sp,sp,-32
  30:	00813c23          	sd	s0,24(sp)
  34:	02010413          	add	s0,sp,32
  38:	fea43423          	sd	a0,-24(s0)
  3c:	feb43023          	sd	a1,-32(s0)
  40:	fe843883          	ld	a7,-24(s0)
  44:	fe043503          	ld	a0,-32(s0)
  48:	00000073          	ecall
  4c:	00050793          	mv	a5,a0
  50:	00078513          	mv	a0,a5
  54:	01813403          	ld	s0,24(sp)
  58:	02010113          	add	sp,sp,32
  5c:	00008067          	ret

0000000000000060 <main>:
  60:	fd010113          	add	sp,sp,-48
  64:	02113423          	sd	ra,40(sp)
  68:	02813023          	sd	s0,32(sp)
  6c:	03010413          	add	s0,sp,48
  70:	00000797          	auipc	a5,0x0
  74:	2a878793          	add	a5,a5,680 # 318 <main+0x2b8>
  78:	00078593          	mv	a1,a5
  7c:	00000513          	li	a0,0
  80:	00000097          	auipc	ra,0x0
  84:	fac080e7          	jalr	-84(ra) # 2c <__syscall1>
  88:	00000593          	li	a1,0
  8c:	00100513          	li	a0,1
  90:	00000097          	auipc	ra,0x0
  94:	f9c080e7          	jalr	-100(ra) # 2c <__syscall1>
  98:	fea43023          	sd	a0,-32(s0)
  9c:	fe043783          	ld	a5,-32(s0)
  a0:	01078793          	add	a5,a5,16
  a4:	00078713          	mv	a4,a5
  a8:	00000797          	auipc	a5,0x0
  ac:	2c878793          	add	a5,a5,712 # 370 <str1>
  b0:	00e7b023          	sd	a4,0(a5)
  b4:	fe043703          	ld	a4,-32(s0)
  b8:	00000797          	auipc	a5,0x0
  bc:	2c078793          	add	a5,a5,704 # 378 <str2>
  c0:	00e7b023          	sd	a4,0(a5)
  c4:	fe043703          	ld	a4,-32(s0)
  c8:	000017b7          	lui	a5,0x1
  cc:	00f707b3          	add	a5,a4,a5
  d0:	00078593          	mv	a1,a5
  d4:	00100513          	li	a0,1
  d8:	00000097          	auipc	ra,0x0
  dc:	f54080e7          	jalr	-172(ra) # 2c <__syscall1>
  e0:	00000797          	auipc	a5,0x0
  e4:	29078793          	add	a5,a5,656 # 370 <str1>
  e8:	0007b783          	ld	a5,0(a5)
  ec:	04d00713          	li	a4,77
  f0:	00e78023          	sb	a4,0(a5)
  f4:	00000797          	auipc	a5,0x0
  f8:	27c78793          	add	a5,a5,636 # 370 <str1>
  fc:	0007b783          	ld	a5,0(a5)
 100:	00178793          	add	a5,a5,1
 104:	04d00713          	li	a4,77
 108:	00e78023          	sb	a4,0(a5)
 10c:	00000797          	auipc	a5,0x0
 110:	26478793          	add	a5,a5,612 # 370 <str1>
 114:	0007b783          	ld	a5,0(a5)
 118:	00278793          	add	a5,a5,2
 11c:	04100713          	li	a4,65
 120:	00e78023          	sb	a4,0(a5)
 124:	00000797          	auipc	a5,0x0
 128:	24c78793          	add	a5,a5,588 # 370 <str1>
 12c:	0007b783          	ld	a5,0(a5)
 130:	00378793          	add	a5,a5,3
 134:	05000713          	li	a4,80
 138:	00e78023          	sb	a4,0(a5)
 13c:	00000797          	auipc	a5,0x0
 140:	23478793          	add	a5,a5,564 # 370 <str1>
 144:	0007b783          	ld	a5,0(a5)
 148:	00478793          	add	a5,a5,4
 14c:	00a00713          	li	a4,10
 150:	00e78023          	sb	a4,0(a5)
 154:	00000797          	auipc	a5,0x0
 158:	21c78793          	add	a5,a5,540 # 370 <str1>
 15c:	0007b783          	ld	a5,0(a5)
 160:	00578793          	add	a5,a5,5
 164:	00078023          	sb	zero,0(a5)
 168:	00000797          	auipc	a5,0x0
 16c:	21078793          	add	a5,a5,528 # 378 <str2>
 170:	0007b783          	ld	a5,0(a5)
 174:	04800713          	li	a4,72
 178:	00e78023          	sb	a4,0(a5)
 17c:	00000797          	auipc	a5,0x0
 180:	1fc78793          	add	a5,a5,508 # 378 <str2>
 184:	0007b783          	ld	a5,0(a5)
 188:	00178793          	add	a5,a5,1
 18c:	04500713          	li	a4,69
 190:	00e78023          	sb	a4,0(a5)
 194:	00000797          	auipc	a5,0x0
 198:	1e478793          	add	a5,a5,484 # 378 <str2>
 19c:	0007b783          	ld	a5,0(a5)
 1a0:	00278793          	add	a5,a5,2
 1a4:	04100713          	li	a4,65
 1a8:	00e78023          	sb	a4,0(a5)
 1ac:	00000797          	auipc	a5,0x0
 1b0:	1cc78793          	add	a5,a5,460 # 378 <str2>
 1b4:	0007b783          	ld	a5,0(a5)
 1b8:	00378793          	add	a5,a5,3
 1bc:	05000713          	li	a4,80
 1c0:	00e78023          	sb	a4,0(a5)
 1c4:	00000797          	auipc	a5,0x0
 1c8:	1b478793          	add	a5,a5,436 # 378 <str2>
 1cc:	0007b783          	ld	a5,0(a5)
 1d0:	00478793          	add	a5,a5,4
 1d4:	00a00713          	li	a4,10
 1d8:	00e78023          	sb	a4,0(a5)
 1dc:	00000797          	auipc	a5,0x0
 1e0:	19c78793          	add	a5,a5,412 # 378 <str2>
 1e4:	0007b783          	ld	a5,0(a5)
 1e8:	00578793          	add	a5,a5,5
 1ec:	00078023          	sb	zero,0(a5)
 1f0:	00400513          	li	a0,4
 1f4:	00000097          	auipc	ra,0x0
 1f8:	e0c080e7          	jalr	-500(ra) # 0 <__syscall0>
 1fc:	00050793          	mv	a5,a0
 200:	fcf42e23          	sw	a5,-36(s0)
 204:	fdc42783          	lw	a5,-36(s0)
 208:	0007879b          	sext.w	a5,a5
 20c:	0a079463          	bnez	a5,2b4 <main+0x254>
 210:	fe042623          	sw	zero,-20(s0)
 214:	0100006f          	j	224 <main+0x1c4>
 218:	fec42783          	lw	a5,-20(s0)
 21c:	0017879b          	addw	a5,a5,1
 220:	fef42623          	sw	a5,-20(s0)
 224:	fec42783          	lw	a5,-20(s0)
 228:	0007871b          	sext.w	a4,a5
 22c:	05f5e7b7          	lui	a5,0x5f5e
 230:	0ff78793          	add	a5,a5,255 # 5f5e0ff <__global_pointer$+0x5f5d590>
 234:	fee7d2e3          	bge	a5,a4,218 <main+0x1b8>
 238:	00000797          	auipc	a5,0x0
 23c:	0f078793          	add	a5,a5,240 # 328 <main+0x2c8>
 240:	00078593          	mv	a1,a5
 244:	00000513          	li	a0,0
 248:	00000097          	auipc	ra,0x0
 24c:	de4080e7          	jalr	-540(ra) # 2c <__syscall1>
 250:	00000797          	auipc	a5,0x0
 254:	12078793          	add	a5,a5,288 # 370 <str1>
 258:	0007b783          	ld	a5,0(a5)
 25c:	00078593          	mv	a1,a5
 260:	00000513          	li	a0,0
 264:	00000097          	auipc	ra,0x0
 268:	dc8080e7          	jalr	-568(ra) # 2c <__syscall1>
 26c:	00000797          	auipc	a5,0x0
 270:	10c78793          	add	a5,a5,268 # 378 <str2>
 274:	0007b783          	ld	a5,0(a5)
 278:	00078593          	mv	a1,a5
 27c:	00000513          	li	a0,0
 280:	00000097          	auipc	ra,0x0
 284:	dac080e7          	jalr	-596(ra) # 2c <__syscall1>
 288:	00100593          	li	a1,1
 28c:	00600513          	li	a0,6
 290:	00000097          	auipc	ra,0x0
 294:	d9c080e7          	jalr	-612(ra) # 2c <__syscall1>
 298:	00000797          	auipc	a5,0x0
 29c:	0a078793          	add	a5,a5,160 # 338 <main+0x2d8>
 2a0:	00078593          	mv	a1,a5
 2a4:	00000513          	li	a0,0
 2a8:	00000097          	auipc	ra,0x0
 2ac:	d84080e7          	jalr	-636(ra) # 2c <__syscall1>
 2b0:	0600006f          	j	310 <main+0x2b0>
 2b4:	fd840793          	add	a5,s0,-40
 2b8:	00078593          	mv	a1,a5
 2bc:	00500513          	li	a0,5
 2c0:	00000097          	auipc	ra,0x0
 2c4:	d6c080e7          	jalr	-660(ra) # 2c <__syscall1>
 2c8:	fd842783          	lw	a5,-40(s0)
 2cc:	00078713          	mv	a4,a5
 2d0:	00100793          	li	a5,1
 2d4:	02f71063          	bne	a4,a5,2f4 <main+0x294>
 2d8:	00000797          	auipc	a5,0x0
 2dc:	07878793          	add	a5,a5,120 # 350 <main+0x2f0>
 2e0:	00078593          	mv	a1,a5
 2e4:	00000513          	li	a0,0
 2e8:	00000097          	auipc	ra,0x0
 2ec:	d44080e7          	jalr	-700(ra) # 2c <__syscall1>
 2f0:	0200006f          	j	310 <main+0x2b0>
 2f4:	00000797          	auipc	a5,0x0
 2f8:	06c78793          	add	a5,a5,108 # 360 <main+0x300>
 2fc:	00078593          	mv	a1,a5
 300:	00000513          	li	a0,0
 304:	00000097          	auipc	ra,0x0
 308:	d28080e7          	jalr	-728(ra) # 2c <__syscall1>
 30c:	00000013          	nop
 310:	00000013          	nop
 314:	ffdff06f          	j	310 <main+0x2b0>
