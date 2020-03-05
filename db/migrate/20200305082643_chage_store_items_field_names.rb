class ChageStoreItemsFieldNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :store_items, :stores_id, :store_id
    rename_column :store_items, :items_id, :item_id
  end
end
