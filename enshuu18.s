.data

A:
    .word 0x00000000
B:
    .word 0xFFFFFFFF

.text
.globl main

main:
    jal init
    nop
    sll $t2, $t0, 15
    srl $t2, $t2, 26
    sll $t2, $t2, 26
    sll $t3, $t1, 6
    srl $t3, $t3, 6
    or $t2, $t2, $t3 # $t2 = A | B
    nop
    add $a0, $t3, $zero # 結果を$a0にセット
    li $v0, 1 # 出力のためのシステムコール
    syscall # 結果を出力
    li $v0, 10 # プログラム終了
    syscall


init:
    lw $t0, A
    lw $t1, B
    jr $ra
