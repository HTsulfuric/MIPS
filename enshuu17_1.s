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
    sll $t2, $t0, 31 #SPIMシミュレータが31よりおおきいシフトを許容しない
    sll $t2, $t2, 13 #あわせて44bit shift
    or $t2, $t2, $t1 # AとBを比較
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
