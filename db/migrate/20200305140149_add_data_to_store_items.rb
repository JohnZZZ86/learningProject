class AddDataToStoreItems < ActiveRecord::Migration[6.0]

  COUNT_OF_ITEMS_EACH_STORE =200
  RAND_QUANTITY =100

  def change
    Store.all.each do |store|
      (1..COUNT_OF_ITEMS_EACH_STORE).each do
        StoreItem.create!(quantity: rand(RAND_QUANTITY), item_id: rand(Item.minimum(:id)..Item.maximum(:id)), store_id: store.id)
      end
    end
  end
end
