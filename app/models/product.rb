class Product < ApplicationRecord
  belongs_to :catagory
  has_many :stocks
  has_many :order_products
  has_many_attached :images
end
