class GetUniqueValuesByGivenCount
  COUNT_OF_VALUES_RANDOM_ARRAY = 10

  def initialize(output_array_length)
    @output_array = []
    @output_array_length = output_array_length
  end

  def generate_array_original_array
    original_array = []
    (1..COUNT_OF_VALUES_RANDOM_ARRAY).each do
      original_array << rand(COUNT_OF_VALUES_RANDOM_ARRAY)
    end
    puts "Random generated array - " + original_array.join
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
        puts  " index = " + index.to_s  + " " + @output_array.join.to_s + " " + temp_array.join.to_s
        get_uniq_array_given_length(temp_array)
        @output_array
      end
    end

  end

  def generate_output
    get_uniq_array_given_length(generate_array_original_array)
  end
end