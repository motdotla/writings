require 'byebug'

lst = [6,7,3,8,2,5,4,1]

def merge_sort(lst)
  return lst if lst.length <= 1

  middle = lst.length / 2

  left = lst[0..middle-1]
  right = lst[middle..lst.length]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []

  while left.length > 0 || right.length > 0
    if left.length > 0 && right.length > 0
      if left[0] < right[0]
        result.push(left.shift)
      else
        result.push(right.shift)
      end
    elsif left.length > 0
      result.push(left.shift)
    else
      result.push(right.shift)
    end
  end

  result
end

puts merge_sort(lst).to_s

