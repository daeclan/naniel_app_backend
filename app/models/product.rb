class Product < ApplicationRecord
  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :user
  belongs_to :cause
end
