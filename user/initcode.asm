
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

0000000000000060 <__syscall2>:
  60:	fd010113          	add	sp,sp,-48
  64:	02813423          	sd	s0,40(sp)
  68:	03010413          	add	s0,sp,48
  6c:	fea43423          	sd	a0,-24(s0)
  70:	feb43023          	sd	a1,-32(s0)
  74:	fcc43c23          	sd	a2,-40(s0)
  78:	fe843883          	ld	a7,-24(s0)
  7c:	fe043503          	ld	a0,-32(s0)
  80:	fd843583          	ld	a1,-40(s0)
  84:	00000073          	ecall
  88:	00050793          	mv	a5,a0
  8c:	00078513          	mv	a0,a5
  90:	02813403          	ld	s0,40(sp)
  94:	03010113          	add	sp,sp,48
  98:	00008067          	ret

000000000000009c <__syscall3>:
  9c:	fd010113          	add	sp,sp,-48
  a0:	02813423          	sd	s0,40(sp)
  a4:	03010413          	add	s0,sp,48
  a8:	fea43423          	sd	a0,-24(s0)
  ac:	feb43023          	sd	a1,-32(s0)
  b0:	fcc43c23          	sd	a2,-40(s0)
  b4:	fcd43823          	sd	a3,-48(s0)
  b8:	fe843883          	ld	a7,-24(s0)
  bc:	fe043503          	ld	a0,-32(s0)
  c0:	fd843583          	ld	a1,-40(s0)
  c4:	fd043603          	ld	a2,-48(s0)
  c8:	00000073          	ecall
  cc:	00050793          	mv	a5,a0
  d0:	00078513          	mv	a0,a5
  d4:	02813403          	ld	s0,40(sp)
  d8:	03010113          	add	sp,sp,48
  dc:	00008067          	ret

00000000000000e0 <main>:
  e0:	fc010113          	add	sp,sp,-64
  e4:	02113c23          	sd	ra,56(sp)
  e8:	02813823          	sd	s0,48(sp)
  ec:	04010413          	add	s0,sp,64
  f0:	657437b7          	lui	a5,0x65743
  f4:	f2e78793          	add	a5,a5,-210 # 65742f2e <__global_pointer$+0x657424d0>
  f8:	fef42023          	sw	a5,-32(s0)
  fc:	000077b7          	lui	a5,0x7
 100:	47378793          	add	a5,a5,1139 # 7473 <__global_pointer$+0x6a15>
 104:	fef41223          	sh	a5,-28(s0)
 108:	fe040323          	sb	zero,-26(s0)
 10c:	00000797          	auipc	a5,0x0
 110:	0fc78793          	add	a5,a5,252 # 208 <main+0x128>
 114:	fcf43423          	sd	a5,-56(s0)
 118:	00000797          	auipc	a5,0x0
 11c:	0f878793          	add	a5,a5,248 # 210 <main+0x130>
 120:	fcf43823          	sd	a5,-48(s0)
 124:	fc043c23          	sd	zero,-40(s0)
 128:	00400513          	li	a0,4
 12c:	00000097          	auipc	ra,0x0
 130:	ed4080e7          	jalr	-300(ra) # 0 <__syscall0>
 134:	00050793          	mv	a5,a0
 138:	fef42623          	sw	a5,-20(s0)
 13c:	fec42783          	lw	a5,-20(s0)
 140:	0007879b          	sext.w	a5,a5
 144:	0207d463          	bgez	a5,16c <main+0x8c>
 148:	00000797          	auipc	a5,0x0
 14c:	0d078793          	add	a5,a5,208 # 218 <main+0x138>
 150:	00078693          	mv	a3,a5
 154:	01400613          	li	a2,20
 158:	00000593          	li	a1,0
 15c:	00b00513          	li	a0,11
 160:	00000097          	auipc	ra,0x0
 164:	f3c080e7          	jalr	-196(ra) # 9c <__syscall3>
 168:	0880006f          	j	1f0 <main+0x110>
 16c:	fec42783          	lw	a5,-20(s0)
 170:	0007879b          	sext.w	a5,a5
 174:	04079263          	bnez	a5,1b8 <main+0xd8>
 178:	00000797          	auipc	a5,0x0
 17c:	0b878793          	add	a5,a5,184 # 230 <main+0x150>
 180:	00078693          	mv	a3,a5
 184:	01600613          	li	a2,22
 188:	00000593          	li	a1,0
 18c:	00b00513          	li	a0,11
 190:	00000097          	auipc	ra,0x0
 194:	f0c080e7          	jalr	-244(ra) # 9c <__syscall3>
 198:	fe040793          	add	a5,s0,-32
 19c:	fc840713          	add	a4,s0,-56
 1a0:	00070613          	mv	a2,a4
 1a4:	00078593          	mv	a1,a5
 1a8:	00000513          	li	a0,0
 1ac:	00000097          	auipc	ra,0x0
 1b0:	eb4080e7          	jalr	-332(ra) # 60 <__syscall2>
 1b4:	03c0006f          	j	1f0 <main+0x110>
 1b8:	00000593          	li	a1,0
 1bc:	00500513          	li	a0,5
 1c0:	00000097          	auipc	ra,0x0
 1c4:	e6c080e7          	jalr	-404(ra) # 2c <__syscall1>
 1c8:	00000797          	auipc	a5,0x0
 1cc:	08078793          	add	a5,a5,128 # 248 <main+0x168>
 1d0:	00078693          	mv	a3,a5
 1d4:	01500613          	li	a2,21
 1d8:	00000593          	li	a1,0
 1dc:	00b00513          	li	a0,11
 1e0:	00000097          	auipc	ra,0x0
 1e4:	ebc080e7          	jalr	-324(ra) # 9c <__syscall3>
 1e8:	00000013          	nop
 1ec:	ffdff06f          	j	1e8 <main+0x108>
 1f0:	00000793          	li	a5,0
 1f4:	00078513          	mv	a0,a5
 1f8:	03813083          	ld	ra,56(sp)
 1fc:	03013403          	ld	s0,48(sp)
 200:	04010113          	add	sp,sp,64
 204:	00008067          	ret
