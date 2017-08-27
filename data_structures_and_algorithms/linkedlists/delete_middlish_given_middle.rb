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


def delete_middlish_given_middle(n)
  nxt = n.next.clone # clone d
  n.value = nxt.value # set c to equal d
  n.next = nxt.next # set c next to eql d.next which is e
end

c = head.next.next

delete_middlish_given_middle(c)

puts PrintValues.new(head).run.to_s
