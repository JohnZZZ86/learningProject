class Item < ApplicationRecord
  has_many :store_items
  has_many :stores, through: :store_items
end
