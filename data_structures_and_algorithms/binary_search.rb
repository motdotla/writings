require 'byebug'

def binary_search_recursive(list, look_for)
  return list if list.length <= 1

  left = []
  right = []

  split = list.length / 2
  left = list[0..split-1]
  right = list[split..list.length-1]

  if look_for <= left[-1]
    binary_search_recursive(left, look_for)
  else
    binary_search_recursive(right, look_for)
  end
end

def binary_search(list, look_for)
  min = 0
  max = list.length
  middle = nil
  while min < max
    middle = (min + max) / 2

    if list[middle] == look_for
      return middle
    elsif look_for < list[middle]
      break if middle == max
      max = middle
    else
      break if middle == min
      min = middle
    end
  end

  return -1
end

list = [10,20,30,40,50,60]
puts binary_search_recursive(list, 50).to_s

list = [10,20,30,40,50,60]
puts binary_search(list, 60).to_s
puts binary_search(list, 70).to_s
puts binary_search(list, 20).to_s
