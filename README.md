# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | ------   | -----------               |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type        | Options                        |
| ------            | ------      | -----------                    |
| product_name      | string      | null: false                    |
| description       | text        | null: false                    |
| category_id       | integer     | null: false                    |
| condition_id      | integer     | null: false                    |
| postage_id        | integer     | null: false                    |
| region_id         | integer     | null: false                    |
| shopping_date_id  | integer     | null: false                    |
| price             | integer     | null: false                    |
| users             | references  | null: false, foreign_key: true |



### Association

- belongs_tp :users
- belongs_to :buys

## shopping_address テーブル

| Column           | Type       |Options                         |
| ------           | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buys

## buys テーブル

| Column     | Type       |Options                         |
| ------     | ---------- | ------------------------------ |
| users      | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items