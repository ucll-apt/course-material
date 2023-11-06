require_relative './solution.rb'


# Defines a type with fields "student", "course" and "grade"
Exam = Struct.new :student, :course, :grade


def imperative(exams)
  result = {}

  i = 0
  while i < exams.size
    exam = exams[i]

    # "body unless cond" is shorthand for "if !cond then body end"
    result[exam.student] = [] unless result.has_key? exam.student

    # "xs << x" adds x to xs
    result[exam.student] << exam.grade

    i += 1
  end

  students = result.keys

  i = 0
  while i < students.size
    student = students[i]
    grades = result[student]

    total = 0
    j = 0
    while j < grades.size
      total += grades[j]
      j += 1
    end

    average = total / grades.size
    result[student] = average.round

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
  Exam.new('r01', 'APT', 18)
])

check([
  Exam.new('r01', 'APT', 18),
  Exam.new('r01', 'BOP', 16),
])

check([
  Exam.new('r01', 'APT', 18),
  Exam.new('r02', 'BOP', 16),
])

check([
  Exam.new('r01', 'APT', 18),
  Exam.new('r01', 'BOP', 12),
  Exam.new('r01', 'PVM', 20),
  Exam.new('r02', 'BOP', 15),
  Exam.new('r02', 'DB1', 11),
  Exam.new('r02', 'DB2', 5),
])

check([
  Exam.new('r01', 'APT', 18),
  Exam.new('r02', 'BOP', 12),
  Exam.new('r03', 'PVM', 20),
  Exam.new('r04', 'BOP', 15),
  Exam.new('r05', 'DB1', 11),
  Exam.new('r06', 'DB2', 5),
])

puts 'Success'
