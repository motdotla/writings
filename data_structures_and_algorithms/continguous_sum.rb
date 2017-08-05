given_array = [1,2,3,4,5]

class SumContigiousArray
  def initialize(array)
    @array = array.sort
  end

  # S = n(n + 1) / 2
  # Arithmetic series - Carl Friedrich Gauss
  def run
    n = would_be_length
    n2 = was_missing_length
    puts arth_series(n2)
    arth_series(n) - arth_series(n2)
  end

  def arth_series(n)
    n * (n + 1) / 2
  end

  def first_number
    @array[0]
  end

  def would_be_length
    @array.length + first_number - 1
  end

  def was_missing_length
    would_be_length - @array.length
  end
end

puts SumContigiousArray.new([1,2,3,4,5]).run
puts SumContigiousArray.new([1,2,3,4,5,6]).run
puts SumContigiousArray.new([1,2,3,4,5,6,7]).run
puts SumContigiousArray.new([3,4,5]).run # 12
