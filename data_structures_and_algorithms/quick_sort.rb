require 'byebug'

def quick_sort(lst)
  return lst if lst.length <= 1

  left = []
  right = []

  pivot = lst.pop
  right.push(pivot)

  while value = lst.shift
    if value > pivot
      in_place = lst.pop

      lst.unshift(in_place)

      right.push(value)
    else
      left.push(value)
    end
  end
  
  quick_sort(left).concat(quick_sort(right))
end

lst = [5,2,8,1,4,3,7,6]
puts quick_sort(lst).to_s
