# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday_y         | integer | null: false               |
| birthday_m         | integer | null: false               |
| birthday_d         | integer | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders
- has_one  :addresses

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| region_origin   | string     | null: false                    |
| estimated       | string     | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :orders
- has_one  :images

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| post_code    | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| apartment    | string     | null: false                    |
| phone_number | integer    | null: false                    |

### Association

- belongs_to :user

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| buyer        | references | null: false, foreign_key: true |
| seller       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| comment      | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :items

## images テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| image        | text       | null: false                    |

### Association

- belongs_to :items

