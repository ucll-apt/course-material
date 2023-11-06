require_relative './solution.rb'


Student = Struct.new :id, :grades


def imperative(students)
  passing = []
  failing = []

  i = 0
  while i < students.size
    student = students[i]
    count = 0

    j = 0
    while j < student.grades.size
      grade = student.grades[j]
      count += 1 if grade < 10
      j += 1
    end

    if count < 3
      passing << student
    else
      failing << student
    end

    i += 1
  end

  [passing, failing]
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
  nstudents = rnd.rand(1..20)
  students = (1..nstudents).map do |id|
    ngrades = rnd.rand(1..10)
    grades = (1..ngrades).map { rnd.rand(0..20) }
    Student.new(id, grades)
  end

  check(students)
end


puts 'Success'
