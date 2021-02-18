class Product < ApplicationRecord
  has_one :stock
  has_many :fav_products
end
