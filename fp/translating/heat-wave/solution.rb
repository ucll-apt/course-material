def functional(ns)
  ns.each_cons(5).any? do |period|
    period.all? { |n| n >= 25 } and period.count { |n| n >= 30 } >= 3
  end
end
