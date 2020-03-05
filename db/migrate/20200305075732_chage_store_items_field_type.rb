class ChageStoreItemsFieldType < ActiveRecord::Migration[6.0]
  def change
    change_column :store_items, :quantity, :integer
  end
end
