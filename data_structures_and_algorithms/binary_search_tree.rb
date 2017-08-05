class Node
  attr_accessor :lchild, :value, :rchild

  def initialize(lchild: nil, value:, rchild: nil)
    self.lchild = lchild
    self.value = value
    self.rchild = rchild
  end
end

class BinarySearchTree
  def initialize(head)
    @node = head
  end

  def find(value)
    return @node.value if @node.value == value # if in the head

    while @node && @node.value != value
      if value < @node.value
        @node = @node.lchild
      else
        @node = @node.rchild
      end
    end
    
    @node.value if @node
  end
end

lllchild1 = Node.new(value: 6)
lllchild2 = Node.new(value: 12)
rrrchild2 = Node.new(value: 13)

llchild1 = Node.new(value: 8, lchild: lllchild1)
rrchild1 = Node.new(value: 13, lchild: lllchild2, rchild: rrrchild2)
llchild2 = Node.new(value: 20)
rrchild2 = Node.new(value: 32)

lchild = Node.new(value: 10, lchild: llchild1, rchild: rrchild1)
rchild = Node.new(value: 23, lchild: llchild2, rchild: rrchild2)

head = Node.new(value: 19, lchild: lchild, rchild: rchild)

service = BinarySearchTree.new(head)
puts service.find(19) # 19

service = BinarySearchTree.new(head)
puts service.find(10) # 10

service = BinarySearchTree.new(head)
puts service.find(23) # 23

service = BinarySearchTree.new(head)
puts service.find(12) # 12


