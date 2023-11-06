def functional(xs)
  xs.tally
    .max_by { |x, n| n }
    .first
end
