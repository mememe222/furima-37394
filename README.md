# テーブル設計

## users テーブル

| Column                       | Type   | Options                   |
| ---------------------------- | ------ | ------------------------- |
| nickname                     | string | null: false               |
| email                        | string | null: false, unique: true |
| encrypted_password           | string | null: false               |
| last_name                    | string | null: false               |
| first_name                   | string | null: false               |
| last_name_kana               | string | null: false               |
| first_name_kana              | string | null: false               |
| birth_day                    | date   | null: false               |

### Association

has_many :items
has_many :records



## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| shipment_source_id | integer    | null: false                   |
| shipping_days_id   | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key:true |

### Association

belongs_to :user
has_one :record



## record テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address



## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false, foreign_key: true |
| record           | references | null: false, foreign_key: true |

### Association

belongs_to :record