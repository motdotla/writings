require 'byebug'

arr = [1,2,3,4,5,6,7]

puts arr.to_s

class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    self.value = value
    self.left = left
    self.right = right
  end
end

def make_binary_tree(arr)
  return nil if arr.length <= 0
  return Node.new(arr[0]) if arr.length == 1

  middle = arr.length / 2
  value = arr[middle]
  left = arr[0..middle-1]
  right = arr[middle+1..-1]

  head = Node.new(value)

  head.left = make_binary_tree(left)
  head.right = make_binary_tree(right)

  head
end

result = make_binary_tree(arr)

puts result.inspect
