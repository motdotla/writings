class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

head = Node.new('t')
head.next = Node.new('a')
head.next.next = Node.new('c')
head.next.next.next = Node.new('o')
head.next.next.next.next = Node.new('c')
head.next.next.next.next.next = Node.new('a')
head.next.next.next.next.next.next = Node.new('t')

head2 = Node.new('t')
head2.next = Node.new('a')
head2.next.next = Node.new('c')

class Stack
  def initialize
    @s = []
  end

  def push(v)
    @s.push(v)
  end

  def pop
    @s.pop
  end
end

class Queue
  def initialize
    @q = []
  end

  def in(v)
    @q.push(v)
  end

  def out
    @q.shift
  end
end

def is_palindrome(node)
  s = Stack.new
  q = Queue.new

  while node
    s.push(node.value)
    q.in(node.value)
    
    node = node.next
  end

  sv = s.pop
  qv = q.out

  while sv && qv
    if sv != qv
      return false
      break
    end

    sv = s.pop
    qv = q.out
  end
  # 1. walk it once, put in queu and in stack,
  # 2. unwind both and check that all are true
  # 3. otherwise short circuit

  return true
end

puts is_palindrome(head)
puts is_palindrome(head2)
