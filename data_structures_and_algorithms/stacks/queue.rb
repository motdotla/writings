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

class MyQueue
  def initialize
    @s1 = Stack.new
    @s2 = Stack.new
  end

  def in(v)
    @s1.push(v)
  end

  def out
    move_to_stack_2

    v = @s2.pop

    move_to_stack_1

    v
  end

  private

  def move_to_stack_2
    while v = @s1.pop
      @s2.push(v)
    end
  end

  def move_to_stack_1
    while v = @s2.pop
      @s1.push(v)
    end
  end
end

q = MyQueue.new
q.in(1)
q.in(2)
q.in(3)
q.in(4)
q.in(5)

puts q.out # 1
puts q.out # 2
puts q.out # 3
