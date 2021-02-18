class Cart < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :items, class_name: "CartItem"
end
