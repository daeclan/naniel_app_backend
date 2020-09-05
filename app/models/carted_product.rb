class CartedProduct < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  belongs_to :order, optional: true
end
