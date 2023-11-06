require_relative './solution.rb'


def imperative(ns)
  i = 0
  while i + 4 < ns.size
    c1 = 0
    c2 = 0

    di = 0
    while di < 5
      c1 += 1 if ns[i + di] >= 25  # "body if c" is shorthand for "if c then body end"
      c2 += 1 if ns[i + di] >= 30
      di += 1
    end

    return true if c1 == 5 and c2 >= 3

    i += 1
  end

  false
end



def assert(condition, message)
  abort message unless condition
end


def check(ns)
  expected = imperative(ns)
  puts "Testing for #{ns}, should be #{expected}"
  actual = functional(ns)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end


check([])
check([1])
check([30])
check([25,25,25,25,25])
check([25,25,30,30,30])
check([30,30,30,30,30])
check([26,31,27,34,30])
check([5,26,31,27,34,30,9])
check([5,26,31,27,24,34,30,9])
check([5,26,31,27,24,34,30,31,34,35])
check([5,26,31,27,24,34,30,31,34,35,8])

puts 'Success'
