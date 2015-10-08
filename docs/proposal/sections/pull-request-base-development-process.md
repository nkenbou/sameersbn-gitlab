# プルリクエストベースの開発フロー



## 現在抱えているソースコードレビューの問題

* レビューのための準備作業 <!-- .element: class="fragment" data-fragment-index="1" -->
* あいまいなレビュー範囲 <!-- .element: class="fragment" data-fragment-index="2" -->
  * レビュー対象の機能以外の影響による変更の混在 <!-- .element: class="fragment" data-fragment-index="2" -->
* レビュー時期が遅くなるため <!-- .element: class="fragment" data-fragment-index="3" -->
  * 手戻りのコストが大きい <!-- .element: class="fragment" data-fragment-index="3" -->
  * 開発の終盤での指摘の場合、修正できないことも <!-- .element: class="fragment" data-fragment-index="3" -->
* 会議のコスト <!-- .element: class="fragment" data-fragment-index="4" -->
  * 日程調整 <!-- .element: class="fragment" data-fragment-index="4" -->
  * 各自作業の中断 (スイッチングコスト) <!-- .element: class="fragment" data-fragment-index="4" -->


## 現在のソースコードレビューのフロー

1. 機能リーダーがレビュー機能を選定 <!-- .element: class="fragment" data-fragment-index="1" -->
2. ソースコードの変更箇所を Excel へ記述 <!-- .element: class="fragment" data-fragment-index="2" -->
3. レビュー参加者が他メンバーの変更箇所をチェック <!-- .element: class="fragment" data-fragment-index="3" -->
4. レビュー会議でチェックした箇所の報告および議論 <!-- .element: class="fragment" data-fragment-index="4" -->



## 改善する開発工程の範囲

* ×: 要件定義
* ×: 基本設計
* △: 詳細設計
* ○: 実装
* ○: 単体テスト (自動テスト)
* △: 機能テスト
* ×: システムテスト



## そこで、
## プルリクエストベースの開発フロー！



## と、その前に



## 使うものを紹介

* GitHub (GitHub クローン)
* Git



## GitHub <!-- .element: style="color: red;" -->
<!-- .slide: data-background="/sections/img/GitHub.png" -->


## GitHub とは

* ソーシャルコーディング
  * 世界中の誰もがソースコードを所有し、自在に変更し、公開する。
* 世界標準の開発環境 (OSS の世界)


## 利用企業

* クックパッド
* GREE
* サイバーエージェント
* はてな
* etc...


## 利用プロジェクト

* Ruby on Rails
* Bootstrap
* Docker
* Fluentd
* Go
* Symfony2
* jQuery
* node
* etc...


## GitHub クローン

コンプライアンスや契約上、社外にソースコードや資料などを預けられない場合…

* GitLab
* GitBucket



## Git <!-- .element: style="color: red;" -->
<!-- .slide: data-background="/sections/img/Git.png" -->


## Git とは

<span style="color: blue;">分散型</span>バージョン管理システム

最初の作者: Linus Torvalds


## <span style="color: yellow;">集中型</span>？
## <span style="color: blue;">分散型</span>？


## <span style="color: yellow;">集中型</span>バージョン管理システム

![Git](/sections/img/centralized-version-control-systems.svg) <!-- .element: style="width: 80%; height: 80%;" -->


## <span style="color: blue;">分散型</span>バージョン管理システム

![Git](/sections/img/distributed-version-control-system.svg) <!-- .element: style="width: 80%; height: 80%;" -->


## 分散型のメリット

* オフラインでもコミット可能
  * 出張の移動中など
* 好きなタイミングでコミットできる
  * ローカルリポジトリに対してコミットするので、他の開発メンバーに迷惑がかからない
* 統合リポジトリには常に完成した機能だけが含まれる
  * ブランチで開発を進めて、完成したら統合リポジトリにマージ
  * 誰かに見せるときに常に動作する状態


<!-- .slide: data-background="/sections/img/google-trend-git-vs-svn.png" -->


## 機能対応表

 | TortoiseSVN | Git
-|-----------|--------
チェックアウト | SVN チェックアウト | clone
更新 | SVN 更新 | pull
コミット | SVNコミット | commit
変更箇所の確認 | SVN 変更をチェック | status
差分比較 | 差分を表示 | diff
履歴照会 | ログを表示 | log
取り消し | 変更の取り消し | checkout
ロック | ロックを取得/解除 | <span style="color: red;">×</span>
etc... | △ | <span style="color: red;">たくさん</span>


## Git のその他の便利機能

1つのファイル内の一部の変更のみコミット (git add -p)、直前のコミットをやり直す (git commit --amend)、直前のコミットをなかったことにする (git reset --hard HEAD^)、変更履歴のコミットグラフ表示 (git log --graph)、ファイルの1行1行がどのコミットで変更されたのかを表示 (git blame <path>)、複数の連続する履歴を1つの履歴にする (git rebase -i)、歴史を戻ってブランチを作成する (git reset --hard <オブジェクト名>、git checkout -b <ブランチ名>)、他のブランチの任意のコミットだけを取り込む (git cherry-pick <オブジェクト名>)、...



## プルリクエスト開発プロセス

1. ローカルリポジトリでブランチを作成する
2. 空コミットをしてリモートリポジトリに push する
3. WIP プルリクエストを作成する
4. ブランチ内で実装を進め、コミットを重ねる
5. 任意のタイミングで push する
6. 4、5 を繰り返す
7. 実装が完了したらレビュー依頼を出す
8. レビューをして、GitLab で指摘事項などを記入する
9. 指摘事項に対し、議論および修正をする
10. 8、9 を繰り返し、指摘事項がなくなったら、統合リポジトリにマージする


## 1. ローカルリポジトリでブランチを作成する。

```
$ git checkout -b change-output-text
```

ブランチの単位は、機能やバグ対応ごと


## 2. 空コミットをしてリモートリポジトリに push する

```
$ git commit --allow-empty -m "wip"
$ git push origin change-output-text
```


### 2.1. GitLab 側にもブランチが自動的にできる

![GitLab のブランチ](/sections/img/hello-world/13.png)


## 3.WIP プルリクエストを作成する

WIP = Work in Progress (進行中の作業)

![GitLab で WIP Pull Request 作成](/sections/img/hello-world/14.png)


## 4. ブランチ内で作業を進め、コミットを重ねる

編集して、コミットを繰り返す

```
$ git add .
$ git commit
```


## 5. 任意のタイミングで push する

```
$ git push
```

push のタイミング

* 1つのブランチを共同で実装しているときは頻繁に
* 途中でも誰かにレビューしてもらいたいとき
* 設計・実装について意見を求めたいとき


## 6. 4、5 を繰り返す

ブランチを育てていくイメージ

※ここに、ブランチのグラフイメージ


## 7. 実装が完了したらレビュー依頼を出す <!-- .element: style="font-size: 1.4em" -->


### 7.1. レビュー依頼の記入

[WIP] を取り除き、@レビュアーで依頼を記入する

WIP があるとマージできないように制御される

![GitLab でレビュー依頼](/sections/img/hello-world/16.png)


### 7.2. レビュー依頼後の表示

![GitLab でレビュー依頼後の表示](/sections/img/hello-world/17.png)

→ 登録してあるメールアドレスに自動的にメッセージが飛ぶ


## 8. レビューをして、GitLab で指摘事項などを記入する


### 8.1. 統合リポジトリとブランチの差分

![GitLab での差分](/sections/img/hello-world/18.png)

* ブランチ単位で差分が確認できるので修正箇所が明確になる


### 8.2. レビュー指摘と議論

![GitLab でのレビューコメント](/sections/img/hello-world/19.png)

* 行単位でコメントできる (スレッド)


### 8.3. テスト、動作確認のしかた (レビュアー)

リモートリポジトリからブランチを取得する

```
$ git fetch
$ git checkout -b <PRブランチ> origin/<PRブランチ>
```

動作確認や、テストの実行をして問題がないか確かめる


## 9. 指摘事項に対し、議論および修正をする


## 10. 8、9 を繰り返し、指摘事項がなくなったら、統合リポジトリにマージする


### 10.1. ローカルからのマージ方法

```
$ git checkout <マージ先ブランチ>
$ git pull
$ git merge <PRブランチ>
$ git push
```

GitLab のプルリクエストは自動的に Open → Merged に変わる

レビューに使った一時的なブランチを削除するには <!-- .element: style="font-size: 75%;" -->

```
$ git branch -D <PRブランチ>
```


### 10.2. GitLab からのマージ方法

"Accept Merge Request" ボタンをクリック

![GitLab からのマージ](/sections/img/hello-world/20.png)


### 10.3. マージ後の表示

![GitLab のマージ後の表示](/sections/img/hello-world/21.png)



## ブランチ戦略

Git は自由度が高いので


## ○○○○の場合、Git Flow をベースにすればよさそう

詳しくは… <!-- .element: style="text-align: left; color: grey;" -->

[A successful Git branching model を翻訳しました](http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html)


<!-- .slide: data-background="/sections/img/GitFlow.png" data-background-size="38%" -->


<!-- .slide: data-background="/sections/img/GitFlow-PIXS.svg" data-background-size="38%" -->



## 当スライドで登場した Git コマンド

<table style="font-size: 60%;">
<colgroup>
  <col width="40%;">
  <col width="60%;">
</colgroup>

<tr><td>ブランチを切り替える</td><td>`git checkout <ブランチ名>`</td></tr>
<tr><td>ブランチを作成し、切り替える</td><td>`git checkout -b <ブランチ名>`</td></tr>
<tr><td>ブランチを削除する</td><td>`git branch -D <ブランチ名>`</td></tr>
<tr><td>変更のあった全てのファイルをコミット対象に追加する</td><td>`git add .`</td></tr>
<tr><td>コミットする</td><td>`git commit`</td></tr>
<tr><td>空コミットをする (WIP)</td><td>`git commit --allow-empty -m "wip"`</td></tr>
<tr><td>リモートリポジトリに反映する</td><td>`git push`</td></tr>
<tr><td>リモートリポジトリの指定ブランチに反映する</td><td>`git push origin <ブランチ名>`</td></tr>
<tr><td>リモートリポジトリから更新を取得する</td><td>`git fetch`</td></tr>
<tr><td>リモートリポジトリから更新を取得して取り込む</td><td>`git pull`</td></tr>
<tr><td>現在のブランチにマージする</td><td>`git merge <ブランチ名>`</td></tr>
<tr><td>リモートブランチを取得し、ブランチを作成し、切り替える</td><td>`git checkout -b <ブランチ名> origin/<ブランチ名>`</td></tr>
<!-- <tr><td></td><td></td></tr> -->
</table>


## その他、最低限の Git コマンド

<table style="font-size: 60%;">
<colgroup>
  <col width="40%;">
  <col width="60%;">
</colgroup>

<tr><td>ファイルをコミット対象に追加する</td><td>`git add <ファイル名>`</td></tr>
<tr><td>ファイルの変更を取り消す</td><td>`git checkout HEAD <ファイル名>`</td></tr>
<tr><td>ワークツリーで変更した差分を確認する</td><td>`git diff`</td></tr>
<tr><td>ログを確認する</td><td>`git log`</td></tr>
<tr><td>ログを要約のみで確認する</td><td>`git log --pretty=short`</td></tr>
<tr><td>ログをグラフ表示で確認する</td><td>`git log --graph`</td></tr>
<tr><td>ファイルの1行1行がどのコミットで変更されたか確認する</td><td>`git blame <ファイル名>`</td></tr>
<tr><td>タグを作成する</td><td>`git tag <タグ名>`</td></tr>
<!-- <tr><td></td><td></td></tr> -->
</table>


## もちろん GUI もあるよ！

* Git GUI ←Git 標準
* SourceTree ←おすすめ
* TortoiseSVN ←おなじみの UI
* EGit ←Eclipse ユーザーなら



## GitHub の紹介


### プラン

* Organization plans
  * 料金: $25 - $200/月 (パブリックリポジトリだけなら $0)
  * 組織用アカウント
  * サービス自体は通常の GitHub

* GitHub Enterprise
  * 料金: $2500/年 (10ユーザーまで、それ以上はユーザー数に応じて)
  * GitHub のサービスを丸ごと社内に持ってくるイメージ
  * アップデートが簡単
  * テクニカルサポートあり


### GitHub を勧める理由

* 世界標準の開発環境
* プライベートで利用している人が多いため教育コストの削減に
* リポジトリサーバーのメンテナンスが不要



## Backlog

* じょうれいくんで導入済み (ただし、チケット管理だけ)
* Git、Subversion に両対応
* エンジニア以外にもやさしい UI
* アジャイル開発にも！ (バーンダウンチャート)


<!-- .slide: data-background="/sections/img/Backlog.png" data-background-size="55%" -->



## ご清聴ありがとうございました
