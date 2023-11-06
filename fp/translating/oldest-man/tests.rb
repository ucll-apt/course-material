require_relative './solution.rb'


# Defines a type with fields "name", "age" and "gender"
Person = Struct.new :name, :age, :gender


def imperative(people)
  result = nil

  i = 0
  while i < people.size
    person = people[i]
    result = person if person.gender == :male and (!result or person.age > result.age)

    i += 1
  end

  result
end



def assert(condition, message)
  abort message unless condition
end


def check(movies)
  puts "Testing on #{movies}"
  expected = imperative(movies)
  actual = functional(movies)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end


check([])

check([
  Person.new('John', 18, :male)
])

check([
  Person.new('Anna', 18, :female)
])

check([
  Person.new('John', 18, :male),
  Person.new('Anna', 18, :female),
])

check([
  Person.new('John', 19, :male),
  Person.new('Anna', 18, :female),
])

check([
  Person.new('John', 18, :male),
  Person.new('Anna', 19, :female),
])

check([
  Person.new('John', 18, :male),
  Person.new('Peter', 19, :male),
  Person.new('Anna', 18, :female),
])

check([
  Person.new('John', 25, :male),
  Person.new('Peter', 19, :male),
  Person.new('Anna', 18, :female),
])

check([
  Person.new('Monica', 18, :female),
  Person.new('Rachel', 19, :female),
  Person.new('Phoebe', 20, :female),
])

check([
  Person.new('Joey', 18, :female),
  Person.new('Chandler', 19, :female),
  Person.new('Ross', 21, :female),
])


puts 'Success'
