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

  def peek
    @s.last
  end

  def to_s
    @s.to_s
  end
end


def sort(stack)
  r = Stack.new

  while tmp = stack.pop
    while r.peek && tmp < r.peek
      stack.push(r.pop)
    end
    r.push(tmp)
  end

  while v = r.pop
    stack.push(v)
  end

  stack
end

stack = Stack.new
stack.push(2)
20.times { stack.push((rand * 100).to_i) }
stack.push(2)

puts sort(stack).to_s

