def functional(xs)
  xs.flat_map do |x|
    xs.map do |y|
      [x, y]
    end
  end
end
