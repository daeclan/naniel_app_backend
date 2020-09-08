class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # belongs_to :cause
  has_many :carted_products
  has_many :products
  has_many :orders

  # def causes
  #   @cause = Causes.where(user_id: id)
  # end
end
