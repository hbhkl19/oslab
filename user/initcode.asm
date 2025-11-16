
initcode.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <__syscall1>:
   0:	fe010113          	add	sp,sp,-32
   4:	00813c23          	sd	s0,24(sp)
   8:	02010413          	add	s0,sp,32
   c:	fea43423          	sd	a0,-24(s0)
  10:	feb43023          	sd	a1,-32(s0)
  14:	fe843883          	ld	a7,-24(s0)
  18:	fe043503          	ld	a0,-32(s0)
  1c:	00000073          	ecall
  20:	00050793          	mv	a5,a0
  24:	00078513          	mv	a0,a5
  28:	01813403          	ld	s0,24(sp)
  2c:	02010113          	add	sp,sp,32
  30:	00008067          	ret

0000000000000034 <main>:
  34:	fe010113          	add	sp,sp,-32
  38:	00113c23          	sd	ra,24(sp)
  3c:	00813823          	sd	s0,16(sp)
  40:	02010413          	add	s0,sp,32
  44:	00000593          	li	a1,0
  48:	00100513          	li	a0,1
  4c:	00000097          	auipc	ra,0x0
  50:	fb4080e7          	jalr	-76(ra) # 0 <__syscall1>
  54:	fea43423          	sd	a0,-24(s0)
  58:	fe843703          	ld	a4,-24(s0)
  5c:	0000a7b7          	lui	a5,0xa
  60:	00f707b3          	add	a5,a4,a5
  64:	00078593          	mv	a1,a5
  68:	00100513          	li	a0,1
  6c:	00000097          	auipc	ra,0x0
  70:	f94080e7          	jalr	-108(ra) # 0 <__syscall1>
  74:	fea43423          	sd	a0,-24(s0)
  78:	fe843703          	ld	a4,-24(s0)
  7c:	ffffb7b7          	lui	a5,0xffffb
  80:	00f707b3          	add	a5,a4,a5
  84:	00078593          	mv	a1,a5
  88:	00100513          	li	a0,1
  8c:	00000097          	auipc	ra,0x0
  90:	f74080e7          	jalr	-140(ra) # 0 <__syscall1>
  94:	fea43423          	sd	a0,-24(s0)
  98:	00000013          	nop
  9c:	ffdff06f          	j	98 <main+0x64>
