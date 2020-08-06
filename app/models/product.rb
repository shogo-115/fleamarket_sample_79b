class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :discribe, :status, :shipping_cost, :shipping_from, :days, :images, presence: true
  validates :name, length: {maximum: 40}
  validates :discribe, length: {maximum: 1000}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"を300円から9999999円までの間で入力してください"}

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
