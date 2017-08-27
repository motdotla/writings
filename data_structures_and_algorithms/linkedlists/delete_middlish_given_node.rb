require 'byebug'

class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

class PrintValues
  def initialize(head)
    @head = head
  end

  def run
    node = @head

    values = []

    values.push(node.value)

    while node = node.next
      values.push(node.value)
    end

    values
  end
end

head = Node.new('a')
head.next = Node.new('b')
head.next.next = Node.new('c')
head.next.next.next = Node.new('d')
head.next.next.next.next = Node.new('e')
head.next.next.next.next.next = Node.new('f')
head.next.next.next.next.next.next = Node.new('g')

def delete_middlish_given_head(head)
  # init the main node and the behind node
  node = head
  bnode = head

  # init a counter (for use with the behind nodes)
  counter = 1
 
  # walk the linked list
  while node = node.next
    # 1, b, a
    # 2, c, a
    # 3, d, a
    # 4, e, b
    # 5, f, b
    # 6, g, c
    if counter >= 4 && counter % 2 == 0
      bnode = bnode.next
    end

    counter += 1
  end

  # delete middlish, and strand it
  middlish = bnode.next # middle is the behind node's next
  bnode.next = bnode.next.next # new middle is the next of the middle
  middlish.next = nil

  head
end

head = delete_middlish_given_head(head)

puts PrintValues.new(head).run.to_s
