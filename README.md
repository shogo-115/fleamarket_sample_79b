# README
## Usersテーブル
|Column|Type|Option|
|------|----|------|
|nick_name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :Products
- has_many :Comments
- has_one :Names, dependent: :destroy
- has_one :Address, dependent: :destroy
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
- belongs_to :User

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
- belongs_to :User

## Categorysテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :Products


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
|user|reference|null: false, foreign_key:true|
|category|reference|null: false, foreign_key:true|
### Association
- has_many :Comments
- has_many :images
- belongs_to :User
- belongs_to :Category


## Commentsテーブル
|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user|reference|null: false, foreign_key:true|
|product|reference|null: false, foreign_key:true|
### Association
- belongs_to :Product
- belongs_to :User


## imagesテーブル
|Column|Type|Option|
|------|----|------|
|image|integer|null: false|
|product|reference|null: false, foreign_key:true|
### Association
- belongs_to :Product

