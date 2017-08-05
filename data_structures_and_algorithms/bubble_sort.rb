class BubbleSort
  def initialize(array)
    @array = array
    @swap_count = 0
  end

  def run
    sort
  end

  def sort
    @array.length.times do |i|
      current = @array[i]
      nexxt = @array[i+1]

      if nexxt && nexxt < current
        @array[i] = nexxt
        @array[i+1] = current

        @swap_count += 1
      end
    end
  end
end

items = [2,7,8,3,1]
result = BubbleSort.new(items).run
puts result.to_s
