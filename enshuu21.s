.text
.globl main

main:
    lui $t0, 0x0101

    slt $t2, $zero, $t0 #0<$t0 ? 1:0
    bne $t2, $zero, ELSE #0じゃなければELSEへジャンプ
    j DONE
ELSE:
    addi $t2, $t2, 2
DONE:
    add $a0, $t2, $zero # 結果を$a0にセット
    li $v0, 1 # 出力のためのシステムコール
    syscall # 結果を出力
    li $v0, 10 # プログラム終了
    syscall

