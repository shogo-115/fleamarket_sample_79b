# Application Name - アプリ名
　FURIMA

# newRead - 概要
  不用品販売のフリーマーケットのWEBアプリケーション

# :ledger: Deploy - 本番環境
  IPアドレス：http://54.150.31.239/
  ID/Pass
    ID: 79b
    Pass: 7979b
  ＜テスト用アカウント＞
  ・購入者用
    メールアドレス: buyer@com
    パスワード: buy12345 
   購入用カード情報
    カード番号： 4242424242424242
    期限： 12/20
    セキュリティコード：123
  ・出品者用
    メールアドレス名: seller@com
    パスワード: sell12345

# :iphone: DEMO -  使用方法
  ## 【トップページ】
  <div align="center">
  <img src="https://i.gyazo.com/dd087063fb74365aaa93d6abd95b89cd.jpg" alt="Image from Gyazo" width="80%">
  </div>
  
  
  ## 【商品出品機能】<br>
  <div align="center">
  <img src="https://i.gyazo.com/62e3f1ec441b3e262d07c086decfc1df.jpg" alt="Image from Gyazo" width="80%">
  </div>
  <div align="right">
  テスト<br>
  </div>
  
  
  ### 【商品購入機能】<br>
  <div align="center">
  <img src="https://i.gyazo.com/45e5e0f72625c84cb443ccd3be1db0c5.gif" alt="Image from Gyazo" width="80%">
  </div>
  <div align="right">
  テスト<br>
  </div>
  
  
  ## 【商品検索機能】<br>
  <div align="center">
  <img src="https://i.gyazo.com/b46e300826461175d4b120195de82f44.jpg" alt="Image from Gyazo" width="80%">
  </div>
  <div align="right">
  テスト<br>
  </div>

# 工夫したポイント

# 使用環境

# 課題や今後実装したい機能

# DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|nick_name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :products
- has_many :comments
- has_one :names, dependent: :destroy
- has_one :address, dependent: :destroy


## namesテーブル
|Column|Type|Option|
|------|----|------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_f|string|null: false|
|first_name_f|string|null: false|
|birthday|integer|null: false|
### Association
- belongs_to :user

## addresssテーブル
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
- belongs_to :user

## categorysテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products


## productsテーブル
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
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :category


## commentsテーブル
|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user|reference|null: false, foreign_key:true|
|product|reference|null: false, foreign_key:true|
### Association
- belongs_to :product
- belongs_to :user


## imagesテーブル
|Column|Type|Option|
|------|----|------|
|image|integer|null: false|
|product|reference|null: false, foreign_key:true|
### Association
- belongs_to :product

