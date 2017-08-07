# 3 types of edits that can be performed on strings
# - insert a character
# - remove a character
# - replace a character
# write a method to check if 2 strings are one edit or two edits away
# so the first things that jump out at me are
# - if the strings equal each other, they are 0 edits out
# - if the strings have a difference in length of more than 1, they are more than 1 edits out, no matter how you slice it
# so I'd like to just get that logic off my mind first, mind if I start with that?
# so keeping track of the shorter string up front will help with things
# let's talk about replace a character first, for this to work, the strings need to be the same length
# - so let's work through that bit

def one_edit_replace(short, long)
  found_difference = false

  (0..short.length-1).each do |i|
    if short[i] != long[i]
      if found_difference
        return false
        break
      end

      found_difference = true
    end
  end

  true
end

def one_edit_insert(short, long)
  counts = {}
  (0..long.length-1).each do |i|
    char = long[i]
    counts[char] = counts[char].to_i + 1
  end

  (0..short.length-1).each do |i|
    char = short[i]
    counts[char] = counts[char].to_i - 1
  end

  found_one = false

  counts.each do |_, v|
    if v > 1
      return false
      break
    end

    if v == 1
      if found_one
        return false
        break
      end
      found_one = true
    end
  end

  true
end

def one_or_less_edits_away?(s1, s2)
  short = s1
  long = s2

  if s1.length > s2.length
    short = s2
    long = s1
  end

  return true if short == long
  return false if (long.length - short.length) > 1

  # can it just replace a single character
  # do the strings only have a single different character?
  if long.length == short.length
    return one_edit_replace(short, long)
  else
    return one_edit_insert(short, long)
  end
end

s1 = 'abe'
s2 = 'abe'
puts one_or_less_edits_away?(s1, s2) # true

s1 = 'abe'
s2 = 'abezz'
puts one_or_less_edits_away?(s1, s2) # false

s1 = 'abe'
s2 = 'aba'
puts one_or_less_edits_away?(s1, s2) # true

s1 = 'babe'
s2 = 'abe'
puts one_or_less_edits_away?(s1, s2) # true

s1 = 'abe'
s2 = 'abez'
puts one_or_less_edits_away?(s1, s2) # true

s1 = 'abe'
s2 = 'acez'
puts one_or_less_edits_away?(s1, s2) # false


