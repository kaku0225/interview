class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, class_name: "CartItem"
end
