class Node
  attr_accessor :p, :value, :n

  def initialize(p: nil, value:, n: nil)
    self.p = p
    self.value = value
    self.n = n
  end
end

class LinkedList
  def initialize(node)
    @node = node
  end

  def traverse
    while @node.n
      @node = @node.n
    end

    @node
  end
end

tail7 = Node.new(value: 7)
tail4 = Node.new(value: 4, n: tail7)
tail3 = Node.new(value: 3, n: tail4)
tail2 = Node.new(value: 2, n: tail3)
head = Node.new(value: 1, n: tail2)

ll = LinkedList.new(head)

tail = ll.traverse
puts tail.value
