# board-app

## boardsテーブル
| Column  | Type        | Options           |
| --------| ----------- | ----------------- |
| title   | string      | null: false       |
| image   | string      |                   |
| text    | text        | null: false       |
| user_id | references  | foreign_key: true |

### Association 
- belongs_to :user
- has_many :comments

## commentsテーブル
| Column     | Type       | Options           |
|----------- | ---------- | ----------------- |
| comment    | string     | null: false       |
| board_id   | references | foreign_key: true |
| user_id    | references | foreign_key: true |

### Association 
- belongs_to :user
- belongs_to :board

## usersテーブル
| Column             | Type    | Options      |
|--------------------| ------- | ------------ |
| name               | string  | null: false  |
| email              | string  | null: false  |
| encrypted_password | string  | null: false  |


### Association 
- has_many :comments
- has_many :boards



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