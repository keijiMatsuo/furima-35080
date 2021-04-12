# FURIMAテーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | string | null: false |

### Association

- has_many :listings
- has_many :purchases


## listings テーブル

| Column          | Type    | Options                        |
| --------------- | --------| ------------------------------ |
| product_name    | string  | null: false                    |
| description     | text    | null: false                    |
| category        | string  | null: false                    |
| status          | string  | null: false                    |
| shipping_burden | string  | null: false                    |
| shipping_area   | string  | null: false                    |
| shipping_days   | string  | null: false                    |
| price           | string  | null: false                    |
| user_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| card_info      | string  | null: false                    |
| deadline       | string  | null: false                    |
| security_chord | string  | null: false                    |
| postal_code    | string  | null: false                    |
| prefectures    | string  | null: false                    |
| municipality   | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false                    |
| user_id        | integer | null: false, foreign_key: true |
| listings_id    | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :listing
