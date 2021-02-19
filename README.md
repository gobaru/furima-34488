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

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| encrypted_password | string | null: false  |
| email              | string | unique: true |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name_kana    | string | null: false  |
| last_name_kana     | string | null: false  |
| birth_year         | date   | null: false  |
| birth_month        | date   | null: false  |
| birth_day          | date   | null: false  |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| name           | string      | null: false                    |
| introduction   | text        | null: false                    |
| genre_id       | integer     | null: false                    |
| price          | string      | null: false                    |
| user           | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_address


## shipping_address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    | 
| genre_id       | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase