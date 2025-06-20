.data
C:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.globl main

main:
    jal init
    nop

    lw $t0, 0($s0)  # Load C[0]
    sll $t0, $t0, 4

    nop
    add $a0, $t0, $zero  # Set result in $a0
    li $v0, 1  # Print integer syscall
    syscall
    li $v0, 10  # Exit syscall
    syscall


init:
    la $s0, C
    jr $ra
