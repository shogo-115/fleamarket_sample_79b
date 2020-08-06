class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nick_name ,presence: true
  has_one :address, dependent: :destroy
  has_one :name, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :comments
  has_many :products
end
