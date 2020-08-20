class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs to :order
end
