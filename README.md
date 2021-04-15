## DB設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_ruby         | string | null: false               |
| last_ruby          | string | null: false               |
| birth_year         | date   | null: false               |
| birth_month        | date   | null: false               |
| birth_day          | date   | null: false               |


### Association
- has_many :items
- has_one :shopping

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | string     | null: false                    |
| condition_id       | string     | null: false                    |
| delivery_charge_id | string     | null: false                    |
| shopping_area_id   | string     | null: false                    |
| days_to_ship_id    | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :shopping


## addressesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture_id | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association
- belongs_to :user
- belongs_to :item


## shoppingsテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item