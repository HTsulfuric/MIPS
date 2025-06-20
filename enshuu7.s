.data

arrayA:
  .word 0xFFFFFFFF, 0x00000000  //MIPSは下位、上位の順で格納される
  .word 0x22222222, 0x22222222
  .word 0x33333333, 0x33333333
  .word 0x44444444, 0x44444444
  .word 0x55555555, 0x55555555
  .word 0x66666666, 0x66666666
  .word 0x77777777, 0x77777777
  .word 0x88888888, 0x88888888
  .word 0x99999999, 0x99999999
  .word 0xAAAAAAAA, 0xAAAAAAAA
arrayB:
  .word 0x00000000, 0x00000000
  .word 0x22222222, 0x22222222
  .word 0x33333333, 0x33333333
  .word 0x44444444, 0x44444444
  .word 0x55555555, 0x55555555
  .word 0x66666666, 0x66666666
  .word 0x77777777, 0x77777777
  .word 0x88888888, 0x88888888
  .word 0x99999999, 0x99999999
  .word 0xAAAAAAAA, 0xAAAAAAAA

data_i:
	.word 0

data_j:
	.word 0

.text
.globl main

main:
	jal init
	nop
	sll $s3, $s3, 3  # i * 8 1要素が8Bytesなので
	sll $s4, $s4, 3  # j * 8
	add $s6, $s6, $s3  # arrayA + i * 8
	add $s8, $s7, $s4  # arrayB + j * 8
	lw $t0, 0($s6)  # Load arrayA[31:0]
	lw $t1, 4($s6)  # Load arrayA[63:32]
	lw $t2, 0($s8)  # Load arrayB[31:0]
	lw $t3, 4($s8)  # Load arrayB[63:32]
	addu $t2, $t0, $t2  # Add lower 32 bits
	sltu $t0, $t0, $t2  # See if overflow occurred
	addu $t3, $t1, $t3  # Add upper 32 bits
	addu $t3, $t3, $t0  # Add carry from lower addition
	sw $t2, 64($s7) 
	sw $t3, 68($s7)	# Store result in arrayB
	nop
	lw $a0, 68($s7)  # Load result from arrayB
	li $v0, 1  # Print integer syscall
	syscall
	lw $a0, 64($s7)  # Load lower part of result
	syscall
	li $v0, 10
	syscall  # Exit syscall

init:
  lw $s3, data_i
  lw $s4, data_j
  la $s6, arrayA
  la $s7, arrayB
  jr $ra
