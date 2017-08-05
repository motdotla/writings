class BubbleSort
  def initialize(array)
    @array = array
  end

  def run
    sort
  end

  def sort
    swapped = false

    @array.length.times do |i|
      current = @array[i]
      nexxt = @array[i+1]

      if nexxt && nexxt < current
        @array[i] = nexxt
        @array[i+1] = current

        swapped = true
      end
    end

    if swapped
      puts 'iteration'
      sort
    else
      @array
    end
  end
end

items = [2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1,2,7,8,3,1]

result = BubbleSort.new(items).run
puts result.to_s
