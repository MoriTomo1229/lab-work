# 第3回：Python の引数と標準入出力

`第３回.pptx` に登場するサンプルコードを、実行できる形でまとめたものです。
PowerPoint は画像中心の構成のため、画像内のコードと実行例を読み取って再構成しています。

## ファイル一覧

| ファイル | スライド | 内容 |
|---|---|---|
| `args.py` | Pythonでの引数の処理 | `sys.argv` の中身を表示する |
| `plus_a.py` | 引数を使ったコマンドの作成1 | 引数 2 つを足す |
| `plus_b.py` | 引数を使ったコマンドの作成2 | 引数をすべて足す（for 文） |
| `plus_c.py` | 引数を使ったコマンドの作成3 | 引数をすべて足す（リスト内包表記） |
| `count_sign.py` | 練習の解答 | 負・ゼロ・正の数を数える |
| `read_stdin.py` | ファイルからの入力 | 標準入力を 1 行ずつ表示する |
| `plus_stdin.py` | 標準入力からの数字の足し算 | 標準入力の数値をすべて足す |

スライドでは `./args`、`./plus_a` のように拡張子なしで実行していますが、
このフォルダでは Python ファイルとして分かりやすいよう `.py` を付けています。

## 実行方法

すべてのファイルにシバン行と実行権限を付けています。`第03回` ディレクトリで実行してください。

### 1. 引数の処理（`args.py`）

```console
$ ./args.py 引数1 引数2 引数3
['./args.py', '引数1', '引数2', '引数3']
```

`sys.argv[0]` にはスクリプト名が入り、実際の引数は `sys.argv[1:]` です。
`python3 args.py ...` で実行した場合は、先頭が `'args.py'` になります。

### 2. 引数 2 つを足す（`plus_a.py`）

```console
$ ./plus_a.py 1 2
3.0
```

### 3. 引数をすべて足す（`plus_b.py`）

```console
$ ./plus_b.py 1 2 3 4 5 6 7 8 9 10
55.0
```

`for n in sys.argv[1:]:` で、スクリプト名を除いた引数を 1 つずつ取り出します。

### 4. リスト内包表記で足す（`plus_c.py`）

```console
$ ./plus_c.py 1 2 3 4 5 6 7 8 9 10
55.0
```

```python
nums = [float(e) for e in sys.argv[1:]]
print(sum(nums))
```

### 5. 練習の解答（`count_sign.py`）

```console
$ ./count_sign.py -3 -1 0 2 4
負: 2
0: 1
正: 2
```

`if` / `elif` / `else` で、負・ゼロ・正を数えます。

```python
if x < 0.0:
    minus += 1
elif x > 0.0:
    plus += 1
else:
    zero += 1
```

## 標準入出力の操作

### 6. ファイルからの入力（`read_stdin.py`）

```console
$ seq 10 > nums
$ cat nums
1
2
...
10
$ ./read_stdin.py < nums
1

2

...

10
```

`< ファイル` は、ファイルの中身を標準入力としてコマンドに渡します。
`read_stdin.py` は `print(line)` で表示するため、元の改行に加えて `print` の改行が入り、空行が発生します。

### 7. 標準入力からの足し算（`plus_stdin.py`）

```console
$ ./plus_stdin.py < nums
55.0
```

```python
ans = 0.0
for line in sys.stdin:
    ans += float(line)

print(ans)
```

### 8. 出力のリダイレクト

```console
$ ./plus_c.py 1 2 3 4 5 6 7 8 9 10 > ans
$ cat ans
55.0
```

`> ファイル` は標準出力をファイルへ保存します（リダイレクト）。
`>> ファイル` にすると追記になります。

### 9. パイプと tr

```console
$ echo 1 2 3 4 5 > yoko_nums
$ cat yoko_nums | tr ' ' '\n' | ./plus_stdin.py
15.0
```

`|`（パイプ）は、左のコマンドの標準出力を右のコマンドの標準入力へつなぎます。
`tr ' ' '\n'` は、空白を改行に置換します。

`nums` を作らずに次のようにも書けます。

```console
$ seq 10 | ./plus_stdin.py
55.0
```

### 10. 標準エラー出力

```console
$ echo あ | ./plus_stdin.py > ans 2> err
$ cat err
Traceback (most recent call last):
  File ".../第03回/plus_stdin.py", line 6, in <module>
    ans += float(line)
ValueError: could not convert string to float: 'あ\n'
```

（`File` のパスは実行環境によって変わります。）
エラーメッセージは標準エラー出力に出るため、`> ans` には入りません。
標準エラー出力をファイルへ保存するには `2> ファイル` を使います。

## 補足

- スライド 11 は `read_stdin.py` の実行結果（空行が入る例）です。
- スライド 15 はパイプの利点、スライド 17 はまとめで、新しいコードはありません。
- スライド 1 はタイトル用の白紙スライドです。
