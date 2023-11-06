def functional(students)
  students.partition do |student|
    student.grades.count { |grade| grade < 10 } < 3
  end
end
