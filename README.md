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

## usersテーブル
| Column             | Type    | Options    |
|--------------------|---------|----------- |
| nickname           | string  | null:false, unique: true |
| email              | string  | null:false, unique: true |
| encrypted_password | string  | null:false, unique: true |
| last_name          | string  | null:false |
| first_name         | string  | null:false |
| last_name_kana     | string  | null:false |
| first_name_kana    | string  | null:false |
| birthday           | date    | null:false |
has_many :items
has_many :buys
has_many :comments

## itemsテーブル
| Column             | Type              | Options                      |
|--------------------|-------------------|------------------------------|
| user               | references        | null:false, foreign_key:true |
| name               | string            | null:false                   |
| description        | text              | null:false                   |
| category_id        | integer           | null:false                   |
| item_status_id     | integer           | null:false                   |
| shipping_costs_id  | integer           | null:false                   |
| price              | integer           | null:false                   |
| shipping_date_id   | integer           | null:false                   |
| delivery_area_id   | integer           | null:false                   |
belongs_to :user
has_one :buy
has_many :comments




## buysテーブル
| Column             | Type              | Options                      |
|--------------------|-------------------|------------------------------|
| user               | references        | null:false, foreign_key:true |
| item               | references        | null:false, foreign_key:true |
belongs_to :user
belongs_to :item
has_one :shipping_address


## user_addressesテーブル
| Column             | Type              | Options                      |
|--------------------|-------------------|------------------------------|
| buy                | references        | null:false, foreign_key:true |
| postcode           | string            | null:false                   |
| prefecture_id      | integer           | null:false                   |
| city               | string            | null:false                   |
| block              | string            | null:false                   |
| building           | string            |                              |
| phone_number       | string            | null:false                   |
belongs_to :buy

## commentsテーブル
| Column             | Type              | Options                      |
|--------------------|-------------------|------------------------------|
| user               | references        | null:false, foreign_key:true |
| item               | references        | null:false, foreign_key:true |
| text               | text              | null:false                   |
belongs_to :user
belongs_to :item