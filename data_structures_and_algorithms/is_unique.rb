def is_unique(string)
  max = string.length - 1

  dict = {}

  (0..max).each do |i|
    value = string[i]

    if dict[value]
      return false
      break
    end

    dict[value] = true 
  end
  
  true
end

def is_unique_no_data_structures(string)
  max = string.length

  (0..max).each do |i|
    value = string[i]
    count = 0

    (0..max).each do |i|
      count += 1 if string[i] == value

      if count > 1
        return false
        break
      end
    end 
  end

  true
end

puts is_unique('abcde') # true
puts is_unique('abcdee') # false
puts is_unique_no_data_structures('abcde') # true
puts is_unique_no_data_structures('abcdee') # false


