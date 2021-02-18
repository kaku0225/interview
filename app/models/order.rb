class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items, source: 'cart'
end
