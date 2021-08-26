# テーブル設計

## users テーブル
|Column              |Type       |Options                  |
------------------------------------------------------------
|nickname            |string     |null: false              |
|email               |string     |null: false, unique: true|
|encrypted_password  |string     |null: false              |

### Association
- has_many :picts
- has_many :hics
- has_many :evals

## picts テーブル
|Column              |Type       |Options                       |
----------------------------------------------------------------
|title               |string     |null: false                   |
|comment             |text       |null: false                   |
|user                |references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ has_many :hics

## hics テーブル
|Column              |Type       |Options                       |
----------------------------------------------------------------
|hic                 |string     |null: false                   |
|kigo                |string     |null: false                   |
|user                |references |null: false, foreign_key: true|
|pict                |references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ belongs_to :pict
_ has_many :evals

## evals テーブル
|Column              |Type       |Options                       |
----------------------------------------------------------------
|review              |test       |null: false                   |
|scene               |integer    |null: false                   |
|rhythm              |integer    |null: false                   |
|kigo                |integer    |null: false                   |
|tech                |integer    |null: false                   |
|original            |integer    |null: false                   |
|user                |references |null: false, foreign_key: true|
|hic                 |references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ belongs_to :hic


