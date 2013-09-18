class Product < ActiveRecord::Base
  belongs_to :user

  validates :product_name, presence: true, length: { maximum: 50 }
  validates :product_price, presence: true, numericality: {greater_than: 0 }

  validates :user_id, presence: true
end
