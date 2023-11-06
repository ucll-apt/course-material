require_relative './solution.rb'


def imperative(ns)
  result = []

  i = 0
  while i + 2 < ns.length
    x, y, z = ns[i...i+3]

    result << y if y > x and y > z

    i += 1
  end

  result
end


def assert(condition, message)
  abort message unless condition
end


def check(ns)
  puts "Testing on #{ns}"
  expected = imperative(ns)
  actual = functional(ns)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end

rnd = Random.new 4141


100.times do
  n = rnd.rand(1..100)
  ns = (1..n).map { rnd.rand(1..1000) }
  check(ns)
end

puts 'Success'
