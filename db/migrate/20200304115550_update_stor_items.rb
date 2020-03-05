class UpdateStorItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :store_items, :item, index: true
    add_foreign_key :store_items, :items

    add_reference :store_items, :store, index: true
    add_foreign_key :store_items, :stores
  end
end
