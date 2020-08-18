# Application Name - アプリ名
　FURIMA

# newRead - 概要
  TECH CAMPの最終課題（チーム開発）にて、不用品販売のフリーマーケットのWEBアプリケーションを<br>
  作成しました。<br>
  <br>
# :ledger: Deploy - 本番環境
  IPアドレス：http://54.150.31.239/<br>
  ID/Pass<br>
    ID: 79b<br>
    Pass: 7979b<br>
    <br>
  ＜テスト用アカウント＞<br>
  ・購入者用<br>
    メールアドレス: buyer@com<br>
    パスワード: buy12345<br>
   購入用カード情報<br>
    カード番号： 4242424242424242<br>
    期限： 12/20<br>
    セキュリティコード：123<br>
    <br>
  ・出品者用<br>
    メールアドレス名: seller@com<br>
    パスワード: sell12345<br>
    <br>
# :iphone: DEMO -  使用方法
  ## 【トップページ】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90458645-ee8fac00-e139-11ea-9679-9bd6d09e7246.jpg" alt="Image from Gyazo" width="80%">
  </div>

  ## 【商品出品機能】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90459024-f7cd4880-e13a-11ea-83e3-fb22e9839bb7.gif" alt="Image from Gyazo" width="80%">
  </div>

  ## 【商品購入機能】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90459524-868e9500-e13c-11ea-8d44-20ee780fa3fe.gif" alt="Image from Gyazo" width="80%">
  </div>
  
  ## 【商品お気に入り機能】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90460029-f9e4d680-e13d-11ea-9ca3-4cfebd22950f.gif" alt="Image from Gyazo" width="80%">
  </div>

# 工夫したポイント
  必要最低限の機能の他に、実装経験のないページネーションや絞り込み検索などの機能を実装し、より使いやすいアプリケーションを<br>
  目指しました。<br>
  <br>
# 使用環境
  Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code<br>
  <br>
# 課題や今後実装したい機能
  今後実装したい機能として、SNS認証によるユーザー登録／ログインや、購入傾向からおすすめ商品を表示するなどして<br>
  ユーザーの満足度を向上させたいと考えています。<br>
  <br>
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

