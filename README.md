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
| birthday           | string   | null: false               |

### Association

- has_many :protocols
- has_many :comment

## items テーブル

| Column         | Type    | Options                        |
| ------         | ------  | -----------                    |
| product_name   | text    | null: false                    |
| description    | text    | null: false                    |
| category       | string  | null: false                    |
| condition      | string  | null: false                    |
| postage        | string  | null: false                    |
| region         | string  | null: false                    |
| shopping_date  | string  | null: false                    |
| price          | integer | null: false                    |
| seller_id      | string  | null: false, foreign_key: true |
| buyer_id       | string  | null: false, foreign_key: true |



### Association

- has_many :comment
- belongs_to :user

## shopping_address テーブル

| Column           | Type       |Options                         |
| ------           | ---------- | ------------------------------ |
| postal_code      | integer    | null: false, foreign_key: true |
| prefectures      | string     | null: false, foreign_key: true |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :protocol

## buy テーブル

| Column     | Type       |Options                         |
| ------     | ---------- | ------------------------------ |
| buyer      | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |
