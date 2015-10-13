# <span style="color: #c5de00;">プルリクエスト</span>ベースの開発ワークフロー

--------------------------------------------------

## 現在抱えている<span style="color: #ffd83b;">ソースコードレビュー</span>の問題

* レビューのための準備作業 <!-- .element: class="fragment" -->
* あいまいなレビュー範囲 <!-- .element: class="fragment" -->
  * レビュー対象の機能以外による変更の混在 <!-- .element: class="fragment" -->
* レビュー時期が遅くなることによる弊害 <!-- .element: class="fragment" -->
  * 手戻りのコストが大きい <!-- .element: class="fragment" -->
  * 開発の終盤での指摘の場合、修正できないことも <!-- .element: class="fragment" -->
* 会議のコスト <!-- .element: class="fragment" -->
  * 日程調整 <!-- .element: class="fragment" -->
  * きりが悪い状態での作業の中断 (スイッチングコスト) <!-- .element: class="fragment" -->

---

## レビューのための準備作業
## 現在のワークフロー <!-- .element: style="color: #ffd83b;" -->

1. 機能リーダーがレビュー機能を選定 <!-- .element: class="fragment" data-fragment-index="1" -->
2. ソースコードの変更箇所を Excel へ記述 <!-- .element: class="fragment" data-fragment-index="2" -->
3. レビュー参加者が他メンバーの変更箇所をチェック <!-- .element: class="fragment" data-fragment-index="3" -->
4. レビュー会議でチェックした箇所の報告および議論 <!-- .element: class="fragment" data-fragment-index="4" -->

--------------------------------------------------

# これらの問題を、
# <span style="color: #c5de00;">プルリクエスト</span>ベースの開発ワークフローで
# 改善する

--------------------------------------------------

## 改善する開発工程の範囲

* ×: 要件定義 <!-- .element: style="text-align: left; color: #9FA0A0;" -->
* ×: 基本設計 <!-- .element: style="text-align: left; color: #9FA0A0;" -->
* △: 詳細設計
* ○: 実装 <!-- .element: style="text-align: left; color: #ffd83b;" -->
* ○: 単体テスト (自動テスト) <!-- .element: style="text-align: left; color: #ffd83b;" -->
* △: 機能テスト
* ×: システムテスト <!-- .element: style="text-align: left; color: #9FA0A0;" -->

--------------------------------------------------

# と、その前に

--------------------------------------------------

## 使うものを紹介

* GitHub (GitHub クローン)
* Git

--------------------------------------------------

# GitHub <!-- .element: style="color: #f34c27;" -->
<!-- .slide: data-background="/sections/img/GitHub.png" -->

---

## <span style="color: #f34c27;">GitHub</span> とは

* ソーシャルコーディングという概念を作り上げたサービス
  * 世界中の誰もがソースコードを所有し、自在に変更し、公開する。
* <span style="color: #ffd83b;">世界標準</span>の開発環境 (OSS の世界)

---

## 利用企業

* クックパッド
* GREE
* サイバーエージェント
* はてな
* etc...

---

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

---

## <span style="color: #f34c27;">GitHub</span> クローン

* GitLab
* GitBucket

コンプライアンスや契約上、ソースコードや資料などを社外に出せない場合に自社サーバーで運用する

---

## <span style="color: #98b0d6;">Trac</span> との違い

* <span style="color: #98b0d6;">Trac</span> = プロジェクト管理ツール
* <span style="color: #f34c27;">GitHub</span> = ソフトウェア開発者を支援するためのツール

<span class="fragment"><span style="color: #ffd83b;">品質の高い</span>ソフトウェアを<span style="color: #ffd83b;">高速で開発</span>していくための後押しをするツール</span>

プロジェクト管理の機能はないが、 <!-- .element: class="fragment" -->
# ソフトウェア開発を支援する機能は豊富！ <!-- .element: class="fragment" -->

---

## Issue の作成画面

プロジェクトを管理するために必要な情報の入力はない

開始日、終了日、工数、進捗率…

![Create Issue](/sections/img/gitlab-create-issue.png)

---

## <span style="color: #f34c27;">GitLab</span> の機能 (1)

* <span style="color: #c5de00;">マージリクエスト</span> (=<span style="color: #c5de00;">プルリクエスト</span>)
* <span style="color: #c5de00;">マージリクエスト</span>の中に<span style="color: #ffd83b;">コミュニケーションを集約・一本化</span>
  * レビュー、議論、質疑応答など
* <span style="color: #c5de00;">マージリクエスト</span> (ブランチ) 単位でのソースコードの差分
* ソースコードの行に対してコメント可能
* コメント記述時に任意の相手への通知
* 行ごとの最新コミット表示
* 豊富なコメント機能 (引用、絵文字、通知)
* マーカーでの引用
* GitHub Flavored Markdown (Issue、Wiki、コメント、etc...)

---

## <span style="color: #f34c27;">GitLab</span> の機能 (2)

* コミットと Issue、<span style="color: #c5de00;">マージリクエスト</span>との関連付け
* コミットからの Issue、<span style="color: #c5de00;">マージリクエスト</span>の操作
* Issue のステータス管理
* マイルストーン
* Wiki
* コードスニペット
* キーボード・ショートカット
* 外部ツール、サービスとの連携 (<span style="color: #ffd83b;">Jenkins</span> など)

--------------------------------------------------

# Git <!-- .element: style="color: #f34c27;" -->
<!-- .slide: data-background="/sections/img/Git.png" -->

---

## <span style="color: #f34c27;">Git</span> とは

<span style="color: #f34c27;">分散型</span>バージョン管理システム

最初の作者: Linus Torvalds

---

# <span style="color: #98b0d6;">集中型</span>？
# <span style="color: #f34c27;">分散型</span>？

---

## <span style="color: #98b0d6;">集中型</span>バージョン管理システム

![Git](/sections/img/centralized-version-control-systems.svg) <!-- .element: style="width: 80%; height: 80%;" -->

---

## <span style="color: #f34c27;">分散型</span>バージョン管理システム

![Git](/sections/img/distributed-version-control-system.svg) <!-- .element: style="width: 80%; height: 80%;" -->

---

## <span style="color: #f34c27;">分散型</span>のメリット (1)

* ローカルリポジトリに対してコミットする <!-- .element: class="fragment" -->
  * 他の開発メンバーに迷惑がかからないので、好きなタイミングでコミットできる <!-- .element: class="fragment" -->
  * 壊れている状態でコミットしても OK  <!-- .element: class="fragment" -->
* 自分の PC にも好きにリポジトリが作れる <!-- .element: class="fragment" -->
  * ちょっとしたプロトタイプの実装に <!-- .element: class="fragment" -->
  * メモなどのバージョン管理に <!-- .element: class="fragment" -->

---

## <span style="color: #f34c27;">分散型</span>のメリット (2)

* ブランチが切りやすい <!-- .element: class="fragment" -->
  * 目的ごとにブランチを切って平行作業が可能 <!-- .element: class="fragment" -->
  * 作業中に緊急の割り込み作業が入ってもブランチを切り替えるだけ <!-- .element: class="fragment" -->
* 統合ブランチには常に完成した機能だけが含まれる <!-- .element: class="fragment" -->
  * ブランチで開発を進めて、完成したら統合リポジトリにマージ <!-- .element: class="fragment" -->
  * 誰かに見せるときには常に動作する状態 <!-- .element: class="fragment" -->
* オフラインでもコミット可能 <!-- .element: class="fragment" -->
  * サーバーメンテナンス中でもコミット可能 <!-- .element: class="fragment" -->
  * 出張の移動中などにも作業できる <!-- .element: class="fragment" -->

---

<!-- .slide: data-background="/sections/img/google-trend-git-vs-svn.png" -->

---

## 機能比較

 | <span style="color: #98b0d6;">TortoiseSVN</span> | <span style="color: #f34c27;">Git</span>
-|-------------|-----
チェックアウト | SVN チェックアウト | clone
更新 | SVN 更新 | pull
コミット | SVNコミット | commit
変更箇所の確認 | SVN 変更をチェック | status
差分比較 | 差分を表示 | diff
履歴照会 | ログを表示 | log
取り消し | 変更の取り消し | checkout
ロック | ロックを取得/解除 | <span style="color: #ffd83b;">×</span>
etc... | △ | <span style="color: #ffd83b;">たくさん</span>

---

## <span style="color: #f34c27;">Git</span> のその他の便利機能 (抜粋)

1つのファイル内の一部の変更のみコミット (git add -p)、直前のコミットをやり直す (git commit --amend)、直前のコミットをなかったことにする (git reset --hard HEAD^)、変更履歴のコミットグラフ表示 (git log --graph)、ファイルの1行1行がどのコミットで変更されたのかを表示 (git blame <path>)、複数の連続する履歴を1つの履歴にする (git rebase -i)、歴史を戻ってブランチを作成する (git reset --hard <オブジェクト名>、git checkout -b <ブランチ名>)、他のブランチの任意のコミットだけを取り込む (git cherry-pick <オブジェクト名>)、...

--------------------------------------------------

## <span style="color: #c5de00;">プルリクエスト</span>開発プロセス

1. ローカルリポジトリでブランチを作成する <!-- .element: class="fragment" -->
2. 空コミットをしてリモートリポジトリに push する <!-- .element: class="fragment" -->
3. WIP プルリクエストを作成する <!-- .element: class="fragment" -->
4. ブランチ内で実装を進め、コミットを重ねる <!-- .element: class="fragment" -->
5. 任意のタイミングで push する <!-- .element: class="fragment" -->
6. 4、5 を繰り返す <!-- .element: class="fragment" -->
7. 実装が完了したらレビュー依頼を出す <!-- .element: class="fragment" -->
8. レビューをして、GitLab で指摘事項などを記入する <!-- .element: class="fragment" -->
9. 指摘事項に対し、議論および修正をする <!-- .element: class="fragment" -->
10. 8、9 を繰り返し、指摘事項がなくなったら、統合リポジトリにマージする <!-- .element: class="fragment" -->

---

## 1. ローカルリポジトリでブランチを作成する。

```
$ git checkout -b change-output-text
```

ブランチの単位は、機能やバグ対応ごと

---

## 2. 空コミットをしてリモートリポジトリに push する

```
$ git commit --allow-empty -m "wip"
$ git push origin change-output-text
```

---

## 2.1. <span style="color: #f34c27;">GitLab</span> 側にもブランチが自動的にできる

![GitLab のブランチ](/sections/img/hello-world/13.png)

---

## 3.<span style="color: #c5de00;">WIP プルリクエスト</span>を作成する

WIP = Work in Progress (進行中の作業)

![GitLab で WIP Pull Request 作成](/sections/img/hello-world/14.png)

---

## 4. ブランチ内で作業を進め、コミットを重ねる

編集して、コミットを繰り返す

```
$ git add .
$ git commit
```

---

## 5. 任意のタイミングで push する

```
$ git push
```

### push のタイミング <!-- .element: style="color: #ffd83b;" -->

* 1つのブランチを共同で実装しているときは頻繁に
* 途中でも誰かにレビューしてもらいたいとき
* 設計・実装について意見を求めたいとき

---

## 6. 4、5 を繰り返す

ブランチを<span style="color: #ffd83b;">育てていく</span>イメージ

---

## 7. 実装が完了したらレビュー依頼を出す

---

## 7.1. レビュー依頼の記入

[WIP] を取り除き、@レビュアーで依頼を記入する

※WIP があるとマージできないように制御される

![GitLab でレビュー依頼](/sections/img/hello-world/16.png)

---

## 7.2. レビュー依頼後の表示

![GitLab でレビュー依頼後の表示](/sections/img/hello-world/17.png)

→ @ + ユーザー名、グループ名、all で登録してあるメールアドレスに自動的にメッセージが飛ぶ <!-- .element: style="font-size: 60%;" -->

---

## 8. レビューを実施し、<span style="color: #f34c27;">GitLab</span> で指摘事項などを記入する

---

## 8.1. 統合リポジトリとブランチの差分

![GitLab での差分](/sections/img/hello-world/18.png)

<span style="font-size: 90%;"><span style="color: #ffd83b;">ブランチ単位で差分が確認できる</span>ので修正箇所が明確になる</span>

---

## 8.2. レビュー指摘と議論

![GitLab でのレビューコメント](/sections/img/hello-world/19.png)

<span style="color: #ffd83b;">行単位でコメントできる (スレッド)</span>

---

## 8.3. テスト、動作確認のしかた
## (レビュアー)

#### 1. リモートリポジトリからブランチを取得する <!-- .element: style="text-align: left;" -->

```
$ git fetch
$ git checkout -b <PRブランチ> origin/<PRブランチ>
```

#### 2. 動作確認や、テストの実行をして問題がないか確かめる <!-- .element: style="text-align: left;" -->

---

## 9. 指摘事項に対し、議論および修正をする

---

## 10. 8、9 を繰り返し、指摘事項がなくなったら、統合リポジトリにマージする

---

## 10.1. ローカルからのマージ方法

```
$ git checkout <マージ先ブランチ>
$ git pull
$ git merge <PRブランチ>
$ git push
```

<span style="color: #f34c27;">GitLab</span> の<span style="color: #c5de00;">プルリクエスト</span>は自動的に Open → Merged に変わる

※レビューに使った一時的なブランチを削除するには

```
$ git branch -D <PRブランチ>
```

---

## 10.2. <span style="color: #f34c27;">GitLab</span> からのマージ方法

"Accept Merge Request" ボタンをクリック

![GitLab からのマージ](/sections/img/hello-world/20.png)

---

## 10.3. マージ後の表示

![GitLab のマージ後の表示](/sections/img/hello-world/21.png)

--------------------------------------------------

## 現在抱えているソースコードレビューの問題 〜 <span style="color: #ffd83b;">解決編！</span>

* レビューのための準備作業
  * → GitLab でレビュー範囲を差分として見ることができる <!-- .element: class="fragment" style="list-style-type: none;" -->
* あいまいなレビュー範囲
  * → 機能単位でブランチを切るので差分も明確  <!-- .element: class="fragment" style="list-style-type: none;" -->
* レビュー時期が遅くなることによる弊害
  * → WIP プルリクエストで実装着手と同時にレビュー (議論) が可能 <!-- .element: class="fragment" style="list-style-type: none;" -->
* 会議のコスト
  * → 集合する必要がない (周知したい内容があればレビューとは別に) <!-- .element: class="fragment" style="list-style-type: none;" -->
  * → レビュアーの都合のよいタイミングでレビュー <!-- .element: class="fragment" style="list-style-type: none;" -->

---

## <span style="color: #c5de00;">プルリクエスト</span>が重要な理由

### <span class="fragment">それぞれのブランチがどんな状態にあるのか<span style="color: #ffd83b;">見える化</span>するのが<span style="color: #c5de00;">プルリクエスト</span></span>

### <span class="fragment">開発プロジェクトでは「<span style="color: #ff2c2d;">誰が何を開発すべきか</span>」をタスク管理ツールで<span style="color: #ffd83b;">見える化</span>することが重要</span>

### <span class="fragment">同様に<span style="color: #c5de00;">プルリクエスト</span>は「<span style="color: #ff2c2d;">誰がどんな開発をしていて、それがどう取り込まれたか</span>」をソースコードレベルで<span style="color: #ffd83b;">見える化</span>する</span>



--------------------------------------------------

## ブランチ戦略

<span style="color: #f34c27;">Git</span> は自由度が高いので運用を考えたブランチ戦略が重要

確実にブランチ戦略に従って運用する

---

## ベースとなるブランチ戦略

* Git Flow
* GitHub Flow
* GitLab Flow
* etc...

---

## ○○○○の場合、<span style="color: #f34c27;">Git Flow</span> をベースにすればよさそう

詳しくは… <!-- .element: style="text-align: left; color: #9FA0A0;" -->

[A successful Git branching model を翻訳しました](http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html)

---

<!-- .slide: data-background="/sections/img/GitFlow.png" data-background-size="38%" -->

---

<!-- .slide: data-background="/sections/img/GitFlow-PIXS.svg" data-background-size="38%" -->

---

## ブランチは運用次第で自由自在

例. 顧客ごとのカスタマイズが必要なパッケージ開発

![パッケージ開発ブランチ戦略](/sections/img/customizing-branch.svg)

--------------------------------------------------

## 当スライドで登場した <span style="color: #f34c27;">Git</span> コマンド

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

---

## その他、最低限の <span style="color: #f34c27;">Git</span> コマンド

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

---

## もちろん <span style="color: #ffd83b;">GUI</span> もあるよ！

* Git GUI ←Git 標準
* SourceTree ←おすすめ
* TortoiseSVN ←おなじみの UI
* EGit ←Eclipse ユーザーなら

--------------------------------------------------

# <span style="color: #f34c27;">GitHub</span> の紹介

---

## <span style="color: #f34c27;">GitHub</span> を勧める理由

* 世界標準の開発環境
* プライベートで利用している人が多いため教育コストの削減に
* リポジトリサーバーのメンテナンスが不要

---

## プラン

* Organization plans
  * 料金: $25 - $200/月 (パブリックリポジトリだけなら $0)
  * 組織用アカウント
  * サービス自体は通常の GitHub

* GitHub Enterprise
  * 料金: $2500/年 (10ユーザーまで、それ以上はユーザー数に応じて)
  * GitHub のサービスを丸ごと社内に持ってくるイメージ
  * アップデートが簡単
  * テクニカルサポートあり

--------------------------------------------------

## Backlog <!-- .element: style="color: #49a62e;" -->

* じょうれいくんで導入済み (ただし、チケット管理だけ)
* <span style="color: #f34c27;">Git</span>、<span style="color: #98b0d6;">Subversion</span> に両対応
* エンジニア以外にもやさしい UI
* アジャイル開発にも！ (バーンダウンチャート)

---

<!-- .slide: data-background="/sections/img/Backlog.png" data-background-size="55%" -->

--------------------------------------------------

## おすすめ資料

* こわくない Git: http://www.slideshare.net/kotas/git-15276118
* GitHub実践入門: http://gihyo.jp/book/2014/978-4-7741-6366-6
* A successful Git branching model: http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html

--------------------------------------------------

## ご清聴ありがとうございました
