class Cart < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :cart_items
  has_many :items, through: :cart_items, source: 'order'
end
