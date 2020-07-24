class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postNo, :pref, :city, :block, :family_name, :first_name, :family_name_f, :first_name_f ,presence: true
end
