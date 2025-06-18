.text  #textsegmentの開始位置
.globl main #main関数をグローバルに

main:
	li   $s1, 100 # gに100を代入
	li   $s2, 5 # hに5を代入
	nop  #回答はここから
	addi $s2, $s2, -5 #(h - 5)
	add  $s0, $s1, $s2 #f = g + (h - 5)
	nop  #ここまで
	move $a0, $s0 #fを表示するためのおまじない
	li   $v0, 1
	syscall
	li   $v0, 10 #プログラム終了のためのシステムコール
	syscall
