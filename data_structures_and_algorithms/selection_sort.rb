def selection_sort_recursive(list, start_index=0)
  return list unless list[start_index]

  lowest = Float::INFINITY
  lowest_index = nil
  index = start_index

  while item = list[index]
    if item < lowest
      lowest = item
      lowest_index = index
    end

    index = index + 1
  end

  prior = list[start_index]
  list[lowest_index] = prior
  list[start_index] = lowest

  selection_sort_recursive(list, start_index + 1)
end

def selection_sort(list)
  list.each_with_index do |_, i|
    current_min_index = i

    (current_min_index..list.length-1).each do |x|
      if list[x] < list[current_min_index]
        current_min_index = x
      end
    end

    if current_min_index != i
      old_min_value = list[i]
      list[i] = list[current_min_index]
      list[current_min_index] = old_min_value
    end
  end

  list
end

list = [2,5,1,7,3,6,4]

puts selection_sort_recursive(list).to_s
puts selection_sort(list).to_s
