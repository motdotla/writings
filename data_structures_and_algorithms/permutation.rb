# abe, bae = true
# abe, abb = false
# are 2 strings permutations of the other
# am i assuming the strings are the same length to be a permutation? not a substring permutation right?
# no, must be equal lengths
def permutation?(s1, s2)
  return false if s1.length != s2.length

  # loop through the first string, and inside that loop,
  # loop through the second and see if that element was found only once
  # but this would O(n^2) time. I think we could do better.
  # we could iterate through each, and count the characters, then see if those
  # character counts match
  dict1 = {}
  dict2 = {}
  
  (0..s1.length-1).each do |i|
    char = s1[i]

    dict1[char] = dict1[char].to_i + 1
  end

  (0..s2.length-1).each do |i|
    char = s2[i]

    dict2[char] = dict2[char].to_i + 1
  end

  dict1 == dict2
end

puts permutation?('abe', 'ab') # false
puts permutation?('abe', 'bae') # true
