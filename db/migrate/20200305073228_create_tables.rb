class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :color
      t.timestamps
    end

    create_table :stores do |t|
      t.string :name
      t.timestamps
    end

    create_table :store_items do |t|
      t.string :quantity
      t.belongs_to :items
      t.belongs_to :stores
      t.timestamps
    end
  end
end
