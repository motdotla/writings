require 'byebug'

class Stack
  def initialize
    @s = []
  end

  def push(v)
    @s.push v
  end

  def pop
    @s.pop
  end
end

class SetOfStacks
  def initialize(threshold)
    @threshold = threshold

    @current_length = 0
    @current_stack = Stack.new
  
    @stack_of_stacks = []
  end

  def pop_at(i)
    @stack_of_stacks[i].pop
  end

  def push(v)
    @current_stack.push v

    increment_length
    setup_new_stack if @current_length >= @threshold

    @current_stack
  end

  def pop
    result = @current_stack.pop

    if result
      decrement_length

      result
    else
      go_to_previous_stack_and_pop
    end
  end

  private

  def setup_new_stack
    @stack_of_stacks.push @current_stack

    @current_stack = Stack.new

    @current_length = 0
  end

  def reset_current_length
    @current_length = 0
  end

  def increment_length
    @current_length += 1
  end

  def decrement_length
    @current_length -= 1
  end

  def go_to_previous_stack_and_pop
    # go to the prior stack
    @current_stack = @stack_of_stacks.pop
  
    # current length should now be the threshold
    @current_length = @threshold

    pop if @current_stack
  end
end

st = SetOfStacks.new(3)
st.push(1)
st.push(2)
st.push(3)
st.push(4)
st.push(5)
st.push(6)
st.push(7)
st.push(8)

puts st.inspect

puts st.pop_at(0)

while v = st.pop
  puts v
end

