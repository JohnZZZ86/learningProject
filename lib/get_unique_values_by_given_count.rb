class GetUniqueValuesByGivenCount
  COUNT_OF_VALUES_RANDOM_ARRAY = 400

  def initialize()
    @output_array_length = 200
  end

  def generate_original_array
    original_array = []
    item_ids_list = Item.pluck(:id)
    (1..COUNT_OF_VALUES_RANDOM_ARRAY).each do
      original_array << item_ids_list[rand(0..item_ids_list.length-1)]
    end
    #puts "Random generated array - " + original_array.join
    original_array
  end

  def get_uniq_array_given_length(temp_array)
    unless temp_array.length < 1 || @output_array.length > @output_array_length - 1
      index = rand(0..temp_array.length-1)
      if @output_array.include?(temp_array[index])
        temp_array.delete_at(index)
      else
        @output_array << temp_array[index]
        temp_array.delete_at(index)
        #puts  " index = " + index.to_s  + " " + @output_array.join.to_s + " " + temp_array.join.to_s
        get_uniq_array_given_length(temp_array)
        @output_array
      end
    end
  end

  def generate_output
    @output_array = []
    get_uniq_array_given_length(generate_original_array)
  end

  def output_stores
    stores = Store.all
    stores.each do |store|
      uniqe_ids_array = generate_output
      uniqe_ids_array.each do |element|
        new_store_item = StoreItem.new
        new_store_item.quantity = rand(1..100)
        new_store_item.item_id = element
        new_store_item.store_id = store.id
        new_store_item.save
      end
    end
  end
end