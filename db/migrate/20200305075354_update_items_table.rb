class UpdateItemsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :code, :size
  end
end
