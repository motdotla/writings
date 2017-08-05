class Stack
  def initialize
    @tape = []
  end

  # add to the stack
  def push(value)
    @tape.push(value)
  end

  # take off the top (end) of the stack
  def pop
    @tape.pop()
  end

  def to_s
    @tape.to_s
  end
end

stack = Stack.new
stack.push(1)
stack.push(0)
stack.push(0)
stack.push(1)
stack.pop()
stack.pop()

puts stack.to_s
