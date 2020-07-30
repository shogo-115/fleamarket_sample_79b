class Name < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name,presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角文字のみが使えます" }
  validates :first_name,presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角文字のみが使えます" }
  validates :family_name_f,presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナのみが使えます" }
  validates :first_name_f,presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナのみが使えます" }
  validates :birthday ,presence: true
end


