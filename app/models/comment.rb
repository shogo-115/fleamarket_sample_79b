class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true

  validates :text, presence: true, length:{maximum: 300}
end
