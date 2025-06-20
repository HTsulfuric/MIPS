
.data

A:
    .word 0xAAAAAAAA

B:
    .word 0x12345678

.text
.globl main

main:
    jal init
    nop
    srl $t2, $t0, 3
    andi $t2, $t2, 0xFFFF #andiはゼロ拡張なので、下位16bitのマスクに等しい
    nop
    add $a0, $t2, $zero  # Move result to $a0 for printing
    li $v0, 1  # Print integer syscall
    syscall
    li $v0, 10  # Exit syscall
    syscall

init:
    lw $t0, A
    lw $t1, B
    nop
    jr $ra

#21845 0b10101010101010101 を得る

