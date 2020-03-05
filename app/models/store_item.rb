class StoreItem < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :stores, dependent: :destroy
end
