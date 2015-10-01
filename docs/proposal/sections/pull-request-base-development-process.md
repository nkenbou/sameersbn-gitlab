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

分散型バージョン管理システム

最初の作者: Linus Torvalds


## 集中型バージョン管理システム


## 分散型バージョン管理システム

![Git](/sections/img/distributed-version-control-system.svg) <!-- .element: style="width: 80%; height: 80%;" -->
