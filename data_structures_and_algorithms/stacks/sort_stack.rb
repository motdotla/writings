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

  def to_s
    @s.to_s
  end

  def peek
  end

  def is_empty?
  end
end

class SortStack
  def initialize(stack)
    @left = stack
    @right = Stack.new
  end

  def run
    # push the largest values into the stack first
    @needs_sort = true

    while @needs_sort == true
      sort(@left, @right)
      rewind(@right)
    end

    @left
  end

  def sort(lefts, rights)
    @needs_sort = false

    while left = lefts.pop
      left
      right = rights.pop

      if left && right
        if left < right
          @needs_sort = true

          rights.push(left)
          rights.push(right)
        else
          rights.push(right)
          rights.push(left)
        end
      else
        # first time around, drop onto right
        rights.push(left)
      end
    end
  end

  def rewind(rights)
    while right = rights.pop
      @left.push(right)
    end
  end
end

stack = Stack.new
stack.push(2)
stack.push(2)
stack.push(1)
stack.push(1)
stack.push(2)

puts SortStack.new(stack).run # 2, 2, 2, 1, 1

stack = Stack.new
stack.push(2)
stack.push(2)
stack.push(3)
stack.push(1)
stack.push(1)
stack.push(2)

puts SortStack.new(stack).run # 3, 2, 2, 2, 1, 1

stack = Stack.new
stack.push(2)
20.times { stack.push((rand * 100).to_i) }
stack.push(2)

puts SortStack.new(stack).run

