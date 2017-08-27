require 'byebug'

# find the kth TO LAST element
# a, b, c, d, e, f
# kth to last = 0 is f
# kth to last = 1 is e
# kth to last = 2 is d
# etc
# if we now the length of the linked list, then we can just take the length minus the
# k and iterate that many number of times through the linked list.

class PrintLinkedListValues
  def initialize(node)
    @node = node
  end

  def run
    values = []

    values.push(@node.value)

    while @node = @node.next
      values.push @node.value
    end

    values
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)

class Queue
  def initialize(max_size:)
    @max_size = max_size
    @values = []
  end

  def in(value)
    out if reached_max?

    @values.push value
  end

  def out
    @values.shift
  end

  private

  def reached_max?
    @values.length >= @max_size # keep to max size
  end
end

def kth_to_last(node, k)
  q = Queue.new(max_size: k + 1) # so for 0 index, you hold at least one in the queue
  q.in node

  while node = node.next
    q.in node
  end

  q.out
end

puts kth_to_last(head, 0).value # 6
puts kth_to_last(head, 1).value # 5
puts kth_to_last(head, 2).value # 4
puts kth_to_last(head, 3).value # 3
puts kth_to_last(head, 4).value # 2
puts kth_to_last(head, 5).value # 1

def kth_to_last_without_queue(node, k)
  # behind runner
  behind_counter = -k
  behind_node = node

  while node = node.next
    behind_counter += 1

    behind_node = behind_node.next if behind_counter > 0
  end

  behind_node
end

puts '=' * 50

puts kth_to_last_without_queue(head, 0).value # 6
puts kth_to_last_without_queue(head, 1).value # 5
puts kth_to_last_without_queue(head, 2).value # 4
puts kth_to_last_without_queue(head, 3).value # 3
puts kth_to_last_without_queue(head, 4).value # 2
puts kth_to_last_without_queue(head, 5).value # 1

