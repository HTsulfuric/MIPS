#この問題はMIPS 64bitを仮定してるが、別に32bitでも同じため32bitで書く

.data
A:
    .word 0x80000000

B:
    .word 0xD0000000

.text
.globl main

main:
    jal init
    nop
    addu $t0, $s0, $s1  # Add A and B
    add $a0, $t0, $zero  # Move result to $a0 for printing
    li $v0, 1  # Print integer syscall
    syscall
    li $v0, 10  # Exit syscall
    syscall


init:
    lw $s0, A
    lw $s1, B
    nop
    jr $ra

#(1342177280)_2 # 0x50000000 in hexadecimal

#10.2 spimでシミュレーションかけるとArithmetic Overflowになるよ
