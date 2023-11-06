require_relative './solution.rb'


def imperative(amounts)
  result = []

  i = 0
  while i < amounts.length
    result << (amounts[i] * 1.05).round
    i += 1
  end

  result
end


def assert(condition, message)
  abort message unless condition
end


def check(amounts)
  puts "Testing on #{amounts}"
  expected = imperative(amounts)
  actual = functional(amounts)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end

rnd = Random.new 4141


100.times do
  n = rnd.rand(1..100)
  amounts = (1..n).map { rnd.rand(1000.0) }
  check(amounts)
end


puts 'Success'
