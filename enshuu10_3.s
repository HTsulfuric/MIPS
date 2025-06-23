#32bitでやります

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
    sub $t0, $s0, $s1  # Subtract B from A
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

# (-13242177280)_2 # 0xB0000000 in hexadecimal
# 10.4 はい。 (実際に計算するときはx+bar(x)+1 = 0の関係から正負反転)
