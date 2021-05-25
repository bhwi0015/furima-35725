# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false | 
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :addreses
- has_many :purchase_user

## products テーブル

| Column              | Type       | Options |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    | 
| status_id           | integer    | null: false                    | 
| shipping_id         | integer    | null: false                    | 
| sprefecture_id      | integer    | null: false                    | 
| send_day_id         | integer    | null: false                    | 
| price               | integer    | null: false                    | 
| user                | references | null: false, foreign_key: true |
| credit              | references |                                |
| address             | references |                                |

### Association

- has_many :comments
- has_many :purchase_user
- belongs_to :user

## comments テーブル

 Column     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :product

  # address テーブル

| Column              | Type       | Options                        |
| postal_code         | string     | null: false                    | 
| prefecture          | integer    | null: false                    | 
| city                | string     | null: false                    | 
| flat_number         | string     | null: false                    | 
| apartment           | string     |                                |
| phone_number        | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user

 # purchase_user テーブル

| Column  | Type       | Options                        |
| user    | references | null: false, foreign_key: true | 
| product | references | null: false, foreign_key: true | 

- belongs_to :product
- belongs_to :user