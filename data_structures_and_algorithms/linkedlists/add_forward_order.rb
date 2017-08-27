require 'byebug'

class Print
  def initialize(node)
    @node = node
  end

  def run
    values = []

    while @node
      values.push(@node.value)

      @node = @node.next
    end

    values
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    self.value = value
  end
end

def add_forward_order(l1, l2)
  head = nil
  tail = nil
  hold_in_memory = nil

  while l1
    sum = l1.value + l2.value

    if sum >= 10
      # walk to the end adding an increment
      while hold_in_memory
        hold_in_memory.value += 1 # increment it by 1 because there was a remainder

        hold_in_memory.value -= 10 if hold_in_memory.value >= 10

        hold_in_memory = hold_in_memory.next
      end

      sum = sum - 10 # adjust sum to just the remainder
    end

    # build node
    node = Node.new(sum)

    # hold in memory for later possible change - if a carry shows up,
    # don't reset if the newest sum is a 9, since it could cascade
    if sum == 9 && hold_in_memory # already exists
      # keep the prior one held in memory
    else
      hold_in_memory = node
    end
    
    # first time building head and tail
    unless head
      head = node
      tail = node
    end
  
    tail.next = node
    tail = node

    l1 = l1.next
    l2 = l2.next
  end

  head
end

l1 = Node.new(6)
l1.next = Node.new(1)
l1.next.next = Node.new(7)

l2 = Node.new(2)
l2.next = Node.new(8)
l2.next.next = Node.new(5)

result = add_forward_order(l1, l2)

puts Print.new(result).run.to_s
