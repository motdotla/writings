
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
  attr_accessor :value, :left, :right, :next

  def initialize(value)
    self.value = value
  end
end

def traverse(tree)
  return nil unless tree

  puts tree.left.value if tree.left
  puts tree.right.value if tree.right

  generate(tree.left)
  generate(tree.right)
end

head = Node.new(4)
head.left = Node.new(2)
head.left.left = Node.new(1)
head.left.right = Node.new(3)
head.right = Node.new(6)
head.right.left = Node.new(5)
head.right.right = Node.new(7)

generate(head)

# lists.each do |list|
#   puts Print.new(list).run.to_s
# end


# [4]
# [2, 6]
# [1, 3, 5, 7]
