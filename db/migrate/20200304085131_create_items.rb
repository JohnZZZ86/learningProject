class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :color
      t.timestamps
    end
  end
end
