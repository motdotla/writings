class Stack
  def initialize
    @s = []
  end

  def push(v)
    @s.push(v)
  end
  
  def pop
    @s.pop
  end
end

class StackWithMin
  def initialize
    @s = []
    @mins = Stack.new
  end

  def push(v)
    set_min(v)

    @s.push v
  end
  
  def pop
    v = @s.pop

    unset_min(v)

    v
  end

  def min
    determine_min
  end

  private

  def determine_min
    v = @mins.pop

    return nil unless v

    @mins.push(v) # don't lose track of it

    v
  end

  def set_min(value)
    if !min || value < min
      @mins.push(value) # add the latest min
    end
  end

  def unset_min(value)
    if value == min
      @mins.pop # pop it off
    end
  end
end

s = StackWithMin.new
s.push(5)
s.push(10)
s.push(8)
s.push(4)
s.push(2)

puts s.min # 2

s.pop

puts s.min # 4

s.pop
puts s.min # 5


