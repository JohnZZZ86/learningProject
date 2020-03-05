class StoreItem < ApplicationRecord
  belongs_to :store, dependent: :destroy
  belongs_to :item, dependent: :destroy
end
