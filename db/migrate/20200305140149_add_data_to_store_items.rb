class AddDataToStoreItems < ActiveRecord::Migration[6.0]
  def change
    (1..200).each do
      StoreItem.create(quantity: rand(1..100), item_id: rand(10..380), store_id: rand(5..10))
    end
  end
end
