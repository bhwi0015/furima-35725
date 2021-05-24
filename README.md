# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name_kanji  | string | null: false | 
| first_name_kanji | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday_year    | string | null: false |
| birthday_month   | string | null: false |
| birthday_day     | string | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :addreses
- has_many :credits

## products テーブル　

| Column           | Type       | Options |
| ---------------- | ---------- | ------------------------------ |
| product_name     | text       | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    | 
| status           | string     | null: false                    | 
| shipping         | string     | null: false                    | 
| shipping_source  | string     | null: false                    | 
| shipping_address | string     | null: false                    | 
| send_day         | string     | null: false                    | 
| price            | integer    | null: false                    | 
| user             | references | null: false, foreign_key: true |
| credit           | references |                                |
| address          | references |                                |

### Association

- has_many :comments
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

# credits テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card_number         | integer    | null: false                    |
| expiration-month    | integer    | null: false                    |
| expiration-year     | integer    | null: false                    | 
| security_code       | integer    | null: false                    | 

### Association
  - belongs_to :user

  # address テーブル
| Column              | Type       | Options                        |
| postal_code         | integer    | null: false                    | 
| prefecture          | string     | null: false                    | 
| city                | string     | null: false                    | 
| flat_number         | string     | null: false                    | 
| apartment           | string     |                                |
| phone_number        | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
