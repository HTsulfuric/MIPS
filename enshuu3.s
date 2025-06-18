.data

arrayA:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

arrayB:
	.space 40 # 配列Bのためのスペース確保 これだと4*10bytes確保される

exit_message:
	.asciiz "\nProgram terminated successfully.\n"

error_msg:
	.asciiz "Error: boundary condition not satisfied.\n"

.text
.globl main

main:
	la   $s0, arrayA # $s0にarrayAのベースアドレスをロード
	la   $s1, arrayB # $s1にarrayBのベースアドレスをロード
	li   $s3, 10 # $s3にiをロード
	li   $s4, 4 # $s4にjをロード
	li   $t0, 10 # $t0に配列長をロード
	li   $t1, 0 # $t1を0に初期化
	nop #回答はここから
	sub  $s3, $s3, $s4 # $s3 = i - j
	sltu $t1, $s3, $t0 # 0 < i - j < 10
	beq  $t1, $zero, error # 条件が満たされない場合はerrorへジャンプ
	sll  $s3, $s3, 2 # $s3を4倍してバイトオフセットに変換
	add  $s3, $s3, $s0 # arrayAのベースアドレスにオフセットを加算
	lw   $t2, 0($s3) # arrayA[i - j]を$t2にロード
	sw   $t2, 32($s1) # arrayB[0]に$t2をストア
	nop #ここまで

end:
	lw $a0, 32($s1) # arrayB[0]の値を$a0にロード
	li   $v0, 1 # arrayB[0]を表示するためのシステムコール
	syscall
	li   $v0, 4 # exit_messageを表示するためのシステムコール
	la   $a0, exit_message # exit_messageのアドレスを$a0にロード
	syscall

exit:
	li $v0, 10 # プログラム終了のためのシステムコール
	syscall

error:
  li $v0, 4 # エラーメッセージを表示するためのシステムコール
	la $a0, error_msg # エラーメッセージのアドレスを$a0にロード
	syscall
	j exit
