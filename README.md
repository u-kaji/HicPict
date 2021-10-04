# アプリ名
# HicPict
---

# 概要実装機能
写真と俳句のSNS  
100個の"いいね"より1個の"5・7・5"をコンセプトに作成したアプリケーションです。  
カメラが趣味の方が写真をアップして  
俳句が趣味の方が写真に対して俳句を詠むアプリとなっております。  
俳句は品評が可能であり、「情景」「音律」「季語」「技術」「独創」の5項目から評価されます。  

# 制作背景
写真をUPするSNSはいろいろありますが、  
俳句のSNSは少ないことに気がつきました。  
最近は俳句番組の視聴率も高く、人気になりつつあります。  
写真を撮る人もただ、いいねやコメントをもらうのではなく、  
俳句を詠んでもらうという新しい感覚を味わえる、  
そんなSNSを作ってみたいと思い作成しました。  

# 実装機能
## 写真
- 新規投稿、削除  
- 検索、いいね
## 俳句
- 新規投稿
- 品評、コメント
- 品評結果表示
## ユーザー管理機能
- gem:devise使用

# 本番環境（デプロイ先とテストアカウントとID）
- GitHub:
- デプロイ先:
- テストアカウント:Email; /Password;

# DEM0

# 工夫したポイント

# 使用技術
- 言語:
- フレームワーク:
- DB:
- サーバー:

# 課題や今後実装したい機能

# テーブル設計

## users テーブル
|Column|Type|Options|  
|---|---|---|  
|nickname|string|null: false|  
|email|string|null: false, unique: true|  
|encrypted_password|string|null: false|  

### Association
- has_many :picts
- has_many :hics
- has_many :evals

## picts テーブル
|Column|Type|Options|
|---|---|---|
|title|string|null: false|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
_ has_many :hics

## hics テーブル
|Column|Type|Options|
|---|---|---|
|hic|string|null: false|
|kigo|string|null: false|
|user|references|null: false, foreign_key: true|
|pict|references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ belongs_to :pict
_ has_many :evals

## evals テーブル
|Column|Type|Options|
|---|---|---|
|review|test|null: false|
|scene|integer|null: false|
|rhythm|integer|null: false|
|kigo|integer|null: false|
|tech|integer|null: false|
|original|integer|null: false|
|user|references|null: false, foreign_key: true|
|hic|references|null: false, foreign_key: true|

### Association
- belongs_to :user
_ belongs_to :hic


