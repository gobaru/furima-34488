# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| password        | string | null: false |
| email           | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |

### Association
- has_many :users
- has_many :purchases


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| introduction   | text       | null: false                    |
| category       | string     | null: false                    |
| item_condition | string     | null: false                    |
| delivery_fee   | string     | null: false                    |
| shipping_area  | string     | null: false                    | 
| shipping_days  | string     | null: false                    |
| price          | string     | null: false                    |
| seller         | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | string     | null: false                    |
| item_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_address


## shipping_address テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture     | string     | null: false | 
| municipalities | string     | null: false |
| address        | string     | null: false |
| bulilding_name | string     | null: false |
| phone_num      | string     | null: false |

### Association
- belongs_to :purchase