class Stack
  def initialize
    @values = []
  end

  def peek
    @values[-1]
  end

  def pop
    @values.pop()
  end
  
  def push(value)
    @values.push(value)
  end
end

class QueueUsingTwoStacks
  def initialize
    @in = Stack.new
    @out = Stack.new
  end

  # stand at the end of the line
  def enqueue(new_plate)
    while plate = @out.pop
      @in.push(plate)
    end

    @in.push(new_plate) # place plate on top of stack of plates
  end

  # serve the first person in line
  def dequeue
    while plate = @in.pop
      @out.push(plate)
    end

    @out.pop()
  end
end

queue = QueueUsingTwoStacks.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

result = queue.dequeue()
puts result # 1

queue.enqueue(4)
result = queue.dequeue()
puts result # 2

result = queue.dequeue()
result = queue.dequeue()
puts result # 4
