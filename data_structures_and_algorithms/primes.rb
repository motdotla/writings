def calc_primes(range, primes=[], count=0)
  divisor = range.shift

  primes.push(divisor)

  puts count
  return primes if range.length < 1

  remaining = []
  range.each do |n|
    count += 1
    if n % divisor != 0
      remaining.push(n)
    end
  end

  calc_primes(remaining, primes, count)
end

range = (2..1000).to_a
puts calc_primes(range).length

def sieve(n)
  # setup the grid
  grid = {}
  (2..n).each do |i|
    grid[i] = false
  end

  limit = Math.sqrt(n)
  (2..limit).each do |i|
    x = i + i

    while x <= n
      grid[x] = true
      x += i
    end
  end

  out = []
  (2..n).each do |i|
    out.push(i) if !grid[i]
  end

  out
end

puts sieve(1000).length

def sieve2(n)
end
