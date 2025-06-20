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
    addu $t0, $t0, $s0  # Add A again to the result
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

# (-805306368)_2 # 0xC0000000 in hexadecimal
# 10.6 10.2時点でオーバーフロウしてるので10.6もオーバーフロウする
