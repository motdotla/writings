require 'byebug'

class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

def sum_linked_lists(l1, l2)

  sum = l1.value + l2.value

  ll = Node.new(sum)

  waiting_nines = 0

  tmp_ll = ll

  while l1.next
    sum = l1.next.value + l2.next.value

    if sum == 9
      waiting_nines += 1
      # special case - wait before writing next linked list
    elsif sum > 9
      single_digit = sum - 10
      tmp_ll.value += 1 # increment the value of the current node
      
      # x times here for how many 9s were last seen
      if waiting_nines > 0
        (1..waiting_nines).each do |n|
          tmp_ll.next = Node.new(0)
          tmp_ll = tmp_ll.next
        end
        waiting_nines = 0
      end
      
      tmp_ll.next = Node.new(single_digit) # set the value of the new node
    else
      tmp_ll.next = Node.new(sum)
    end

    l1 = l1.next
    l2 = l2.next
  end  

  ll
end

# 6 7 8 7
l1 = Node.new(6)
l1.next = Node.new(7)
l1.next.next = Node.new(8)
l1.next.next.next = Node.new(7)

# 1 2 1 6
l2 = Node.new(1)
l2.next = Node.new(2)
l2.next.next = Node.new(1)
l2.next.next.next = Node.new(6)

# 8 0 0 3
result = sum_linked_lists(l1, l2)
puts result.value
puts result.next.value
puts result.next.next.value
puts result.next.next.next.value

