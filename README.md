# README
## Usersテーブル
|Column|Type|Option|
|------|----|------|
|nick_name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :Products
- has_many :Comments
## Creditsテーブル
|Column|Type|Option|
|------|----|------|
|card_num|string|null: false|
|name|string|null: false|
|expiration_date|string|null: false|
|security_num|integer|null: false|
### Association


## Namesテーブル
|Column|Type|Option|
|------|----|------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_f|string|null: false|
|first_name_f|string|null: false|
|birthday|integer|null: false|
### Association


## Addresssテーブル
|Column|Type|Option|
|------|----|------|
|postNo|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|family_Name|string|null: false|
|first_Name|string|null: false|
|family_Name_f|string|null: false|
|first_Name_f|string|null: false|
|phone|integer||
### Association


## Categorysテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
### Association
- has_many :Products: through: :Categorys_Products
- has_many :Categorys_Products


## Productsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|discribe|text|null: false|
|brand|string||
|status|string|null: false|
|price|integer|null: false|
|shipping_host|string|null: false|
|shipping_from|string|null: false|
|days|integer|null: false|
|user|integer||
|category|integer||
### Association
- has_many :Comments
- has_many :Categorys: through: :Categorys_Products
- has_many :Categorys_Products
- has_many :images
- belongs_to :User

## Commentsテーブル
|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
### Association
- belongs_to :Product
- belongs_to :User

## imagesテーブル
|Column|Type|Option|
|------|----|------|
|image|integer|null: false|
### Association
- belongs_to :Product

## Category_Productsテーブル
|Column|Type|Option|
|------|----|------|
|Product|reference|null: false, foreign_key: true|
|Category|reference|null: false, foreign_key: true|
### Association
- belongs_to :Product
- belongs_to :Category

