# 2.16

MIPSのレジスタファイル数を128に拡大する

## 1

> R命令への影響は?

レジスタへのアドレスを示すために7bit必要になる。 R命令はレジスタアドレスを3つ指定するので追加で6bit必要になる。

## 2

> I命令への影響は?

レジスタアドレスを2つ指定するので追加で4bit。 即値の拡張は必要ない

## 影響は?

### いい点

- レジスタファイルの拡大のおかげで退避命令をよぶ数が減る

### 悪い点

- 64bit命令になるので、命令の長さが長くなる
