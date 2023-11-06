def functional(ns)
  ns.each_cons(3)
    .select { |x, y, z| y > x and y > z }
    .map { |triple| triple[1] }
end