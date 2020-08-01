class Comment < ApplicationRecord
  has_one :products, dependent: :destroy
  belongs_to :user, optional: true
end
