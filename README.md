# FURIMAテーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :listings
- has_many :purchases


## listings テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_burden_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| listing_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :delivery


## deliverys テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| municipality   | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false                    |
| purchase_id    | integer | null: false, foreign_key: true |

- belongs_to :purchase