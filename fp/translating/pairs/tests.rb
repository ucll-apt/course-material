require_relative './solution.rb'


def imperative(xs)
  result = []

  i = 0
  while i < xs.size
    j = 0

    while j < xs.size
      result << [xs[i], xs[j]]

      j += 1
    end

    i += 1
  end

  result
end


def assert(condition, message)
  abort message unless condition
end


def check(xs)
  puts "Testing on #{xs}"
  expected = imperative(xs)
  actual = functional(xs)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end


rnd = Random.new 1456

100.times do
  n = rnd.rand(1..10)
  ns = (1..n).map { rnd.rand(1..100) }
  check(ns)
end

puts 'Success'
