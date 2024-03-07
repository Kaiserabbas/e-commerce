class Product < ApplicationRecord
    belongs_to :catagory
    has_many_attached :images
end
