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

def add(l1, l2)
  head = nil
  tail = nil
  carry = 0  # starts at 0

  while l1
    # calculate
    sum = l1.value + l2.value + carry

    # determine remainder if greater than 9, and set carry to 1
    if sum >= 10
      carry = 1
      sum = sum - 10 # override for node, 12 - 10 = 2, 10 - 10 => 0, 11 - 10 => 1, etc
    else
      carry = 0
    end

    # build node
    node = Node.new(sum)
    
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

l1 = Node.new(7)
l1.next = Node.new(1)
l1.next.next = Node.new(6)

l2 = Node.new(5)
l2.next = Node.new(9)
l2.next.next = Node.new(2)

result = add(l1, l2)

puts Print.new(result).run.to_s
