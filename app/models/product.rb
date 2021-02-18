class Product < ApplicationRecord
  has_one :stock
  has_many :fav_products
  has_many :user, through: :fav_products
end
