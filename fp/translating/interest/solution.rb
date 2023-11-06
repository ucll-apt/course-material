def functional(amounts)
  amounts.map do |m|
    (m * 1.05).round
  end
end