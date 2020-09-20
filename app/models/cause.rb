class Cause < ApplicationRecord
  # has_many :products
  belongs_to :user
  # belongs_to :product


  def user
    User.find_by(id: user_id)
  end
end
