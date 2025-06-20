.data

A:
    .word 0xFFFFFFFF,

.text
.globl main

main:
    jal init
    nop
    sub $t2, $zero, $t2  # $t2 = -A
    addi $t1, $t2, -1  # $t2 = -A - 1

    add $a0, $t1, $zero  # 結果を$a0にセット
    li $v0, 1  # 出力のためのシステムコール
    syscall  # 結果を出力
    li $v0, 10  # プログラム終了
    syscall

init:
    lw $t2, A
    jr $ra
