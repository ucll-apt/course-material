def functional(people)
  people.select { |p| p.gender == :male }.max_by(&:age)
end