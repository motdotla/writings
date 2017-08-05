class CheckForDuplicate
  def initialize(array)
    @array = array
  end

  def run
    items = {}

    @array.each do |item|
      if items[item]
        @value = true

        break
      end

      items[item] = true
    end

    @value || false
  end
end

puts CheckForDuplicate.new([1,2]).run # false
puts CheckForDuplicate.new([1,2,3,4,5,6,3]).run # true

