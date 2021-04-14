## DB設計

## usersテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| email       | string  | null: false |
| password    | string  | null: false |
| nickname    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birth_year  | integer | null: false  |
| birth_month | integer | null: false  |
| birth_day   | integer | null: false  |


### Association
- has_many :items
- has_one :shopping

## itemsテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| item_name     | string     | null: false                     |
| text          | text       | null: false                     |
| category      | string     | null: false                     |
| condition     | string     | null: false                     |
| shopping_area | string     | null: false                     |
| days_to_ship  | string     | null: false                     |
| price         | integer    | null: false                     |
| user          | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one :shopping


## shoppingsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item