# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| birth_day          | datetime | null: false |

### Association

has_many :items
has_many :record



## items テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| image              | string  | null: false                   |
| title              | string  | null: false                   |
| explanation        | string  | null: false                   |
| category           | string  | null: false                   |
| condition          | string  | null: false                   |
| delivery_charge    | string  | null: false                   |
| shipment_source    | string  | null: false                   |
| shipping_days      | string  | null: false                   |
| price              | string  | null: false                   |
| users_id           | integer | null: false, foreign_key:true |

### Association

belongs_to :users
has_one :record



## record テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| last_name       | string  | null: false                    |
| first_name      | string  | null: false                    |
| last_name_kana  | string  | null: false                    |
| first_name_kana | string  | null: false,                   |
| users_id        | integer | null: false, foreign_key: true |

### Association

belongs_to :users
belongs_to :items
has_one :address



## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string    | null: false, foreign_key: true |

### Association

belongs_to :record