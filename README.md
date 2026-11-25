# lab-work

[![test](https://github.com/MoriTomo1229/lab-work/actions/workflows/test.yml/badge.svg)](https://github.com/MoriTomo1229/lab-work/actions/workflows/test.yml)

ゼミの課題・演習用のコードや練習問題をまとめたリポジトリです。  
Python による標準入出力・コマンドライン引数の処理、Bash を用いたリグレッションテスト、GitHub Actions による自動テストを扱っています。

## 主なコマンド：`plus-stdin.py`

標準入力から 1 行ずつ数値を読み込み、その合計を標準出力へ出力するコマンドです。

### 実行例

```console
$ seq 5 | ./plus-stdin.py
15.0
```

数値以外の文字列や空行が渡された場合はエラー終了（終了ステータス `1`）します。入力が 0 行の場合は `0.0` を出力します。

## リポジトリ構成

| パス | 内容 |
| --- | --- |
| [`plus-stdin.py`](./plus-stdin.py) | 標準入力の数値を合計して出力するスクリプト（テスト対象） |
| [`基礎・練習問題/`](./基礎・練習問題) | Python 基礎のサンプルコード（`hello.py`〜`fruits.py`）、[`練習問題.md`](./基礎・練習問題/練習問題.md)、[`解答と解説.md`](./基礎・練習問題/解答と解説.md)、[`解答コード/`](./基礎・練習問題/解答コード) |
| [`第03回/`](./第03回/README.md) | Python の引数処理と標準入出力のサンプル（詳細は [`第03回/README.md`](./第03回/README.md)） |
| [`第06回/`](./第06回/README.md) | Bash によるリグレッションテスト（詳細は [`第06回/README.md`](./第06回/README.md)） |
| [`.github/workflows/test.yml`](./.github/workflows/test.yml) | GitHub Actions による自動テスト設定 |

## 必要なソフトウェア・テスト環境

- Python 3（GitHub Actions のマトリクス設定: `3.7`, `3.8`, `3.9`, `3.10`）
- Bash
- Ubuntu（GitHub Actions: `ubuntu-latest`）

## テストの実行

リポジトリ直下で以下を実行すると、`plus-stdin.py` のリグレッションテストが走ります。

```console
$ ./第06回/test.bash
OK
$ echo $?
0
```

このテストは `push` 時に GitHub Actions（[`.github/workflows/test.yml`](./.github/workflows/test.yml)）でも自動実行されます。テストケースの詳細は [`第06回/README.md`](./第06回/README.md) を参照してください。

## 権利・ライセンス

- このリポジトリのテスト対象スクリプトおよびテストスクリプトは、各ファイルの SPDX ヘッダーに記載のとおり **GPL-3.0** ライセンスの下で公開されています。
- &copy; Tomohiro Morikuni
