require_relative './solution.rb'


def imperative(xs)
  # Create map that initially associates value 0 with each key
  freqs = Hash.new(0)

  i = 0
  while i < xs.size
    freqs[xs[i]] += 1
    i += 1
  end

  max_frequency = -Float::INFINITY
  keys = freqs.keys
  i = 0
  while i < keys.size
    freq = freqs[keys[i]]
    if freq > max_frequency
      max_frequency = freq
    end
    i += 1
  end

  i = 0
  while i < xs.size
    if freqs[xs[i]] == max_frequency
      return xs[i]
    end
    i += 1
  end

  abort 'Bug'
end



def assert(condition, message)
  abort message unless condition
end


def check(receiver)
  puts "Testing on #{receiver.inspect}"
  actual = functional(receiver)
  expected = imperative(receiver)

  assert(expected == actual, "Wrong result: expected #{expected}, got #{actual}")
end


check([1])
check([1, 1])
check([1, 1, 2])
check([1, 2, 2])
check('abbaa'.chars)
check('yxyxyxy'.chars)

puts 'Success'
