class Name < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_f, :first_name_f, :birthday ,presence: true
end
