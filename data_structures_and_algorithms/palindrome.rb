# permutation of a palindrome?
# examples of palindromes
# - dad
# - goog
# - tacocat
# example of a permutation of a palindrome
# - catotac
# so what do palindromes have in common?
# - they have equal amount of the same characters
# - so 2 cs, 2 ts, 2 as
# - and they might have 1 other character outlier
# - could be 4 cs, 4ts, 4 as, and 3os
# - ccaattooottaacc
# - ttaaccoooccaatt
# - so in thinking about this I could compare the counts, and make sure there is only 1 odd character count, all others should be even
# - thinking of this a different way, I could think, well if i increment and decrement every character, I should either end up with a 1 or 0 total sum
# - let's try
# - so lets start by collectin counts
def palindrome?(s1)
  counts = {}

  (0..s1.length-1).each do |i|
    char = s1[i]

    if counts[char] == 1
      counts[char] = 0
    elsif counts[char] == 0
      counts[char] = 1
    else
      counts[char] = 1
    end
  end

  odd_count = false

  counts.each do |_, v|
    if v > 0
      if odd_count == true
        return false
        break
      end

      odd_count = true
    end
  end

  true
end

puts palindrome?('tacocat') # true
puts palindrome?('catotac') # true
puts palindrome?('catootac') # true
puts palindrome?('catokotac') # true
puts palindrome?('catootak') # false
puts palindrome?('bad') # false

def palindrome_as_we_go?(s1)
  odds = 0
  counts = {}

  (0..s1.length-1).each do |i|
    char = s1[i]

    counts[char] = counts[char].to_i + 1
    
    remainder = counts[char] % 2
    if remainder != 0
      odds += 1 
    else
      odds -= 1 
    end
  end

  odds <= 1
end

puts '-' * 30
puts palindrome_as_we_go?('tacocat') # true
puts palindrome_as_we_go?('dad') # true
puts palindrome_as_we_go?('takocat') # false
