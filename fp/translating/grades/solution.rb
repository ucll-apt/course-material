def functional(exams)
  exams.group_by(&:student)
       .transform_values { |exams| (exams.map(&:grade).sum / exams.count).round }
end