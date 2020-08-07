class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
  

  validates :name, :discribe, :status, :category, :shipping_cost, :shipping_from, :days, presence: true
  validates :images, presence: {message:"を1枚以上追加してください"}
  validates :name, length: {maximum: 40 , message:"を40文字以内で入力してください"}
  validates :discribe, length: {maximum: 1000, message:"を1000文字以内で入力してください"}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"を300円から9,999,999円までの間で入力してください"}

  enum status: [:brandNew, :almostNew, :noDamage, :slightlyDamaged, :damaged, :bad]

  enum shipping_cost: [:included, :excluded]
  enum shipping_from: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukushima,
    :ibaraki, :tochigi, :gunma, :saitama, :chiba, :tokyo,:kanagawa,
    :niigata, :toyama, :ishikawa, :fukui, :yamanashi, :nagano,
    :gifu, :sizuoka, :aichi, :mie, :shiga, :kyoto, :osaka,
    :hyogo, :nara, :wakayama, :tottori, :shimane, :okayama,
    :hiroshima, :yamaguchi, :tokushima, :kagawa, :ehime,
    :kochi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita,
    :miyazaki, :kagoshima , :okinawa]

  enum days:[:maxTwo, :maxThree, :maxSeven]
end
