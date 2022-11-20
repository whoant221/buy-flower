class User < ApplicationRecord
  has_secure_password

  has_many :shopping_carts
  has_many :flowers, through: :shopping_carts
  has_many :orders

  has_many :comments
  has_many :flowers, through: :comments

  validates :email, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :password_digest, :address, :phone_number, :name
end
