require 'byebug'

class Fib
  def initialize
    @n = 0
    @dict = {}
    @count = 0
  end
  
  def count
    @count
  end

  def run(n)
    result = fib(n)

    @dict[n] = result

    result
  end

  def fib(n)
    @count += 1
    return 0 if n == 0
    return 1 if n == 1

    return @dict[n] if @dict[n]

    fib(n - 1) + fib(n - 2)
  end
end

def fib_faster(n)
  sequence = [0,1]
  (2..n).each do |i|
    sequence.push(sequence[i-1] + sequence[i-2])
  end

  sequence[-1]
end

puts fib_faster(1000)

def fib_constant_space(n)
  two_fibs_ago = 0
  one_fib_ago = 1
  current_fib = 0

  return two_fibs_ago if n == 0
  return one_fib_ago if n == 1

  (2..n).each do |i|
    current_fib = one_fib_ago + two_fibs_ago
    two_fibs_ago = one_fib_ago
    one_fib_ago = current_fib
  end

  return current_fib
end

(0..100).each do |n|
  puts fib_constant_space(n)
end


def yield_fib(n)
  last_two = [0,1]

  yield 0 if n >= 0
  yield 1 if n >= 1

  (2..n).each do |n|
    fib = last_two[0] + last_two[1]
    last_two[0] = last_two[1]
    last_two[1] = fib

    yield fib
  end
end

yield_fib(10) do |value|
  puts value
end

