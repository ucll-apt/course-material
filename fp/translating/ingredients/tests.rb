require 'set'
require_relative './solution.rb'


Recipe = Struct.new :name, :ingredients


def imperative(recipes, stock)
  result = [].to_set

  i = 0
  while i < recipes.size
    recipe = recipes[i]
    required_ingredients = recipe.ingredients.keys

    j = 0
    all_present = true
    while j < required_ingredients.size and all_present
      required_ingredient = required_ingredients[j]
      required_amount = recipe.ingredients[required_ingredient]
      available_amount = stock.has_key?(required_ingredient) ? stock[required_ingredient] : 0
      all_present = available_amount >= required_amount
      j += 1
    end

    result << recipe.name if all_present

    i += 1
  end

  result
end



def assert(condition, message)
  abort message unless condition
end


def check(recipes, stock)
  puts "Testing using recipes=#{recipes}, stock=#{stock}"
  expected = imperative(recipes, stock)
  actual = functional(recipes, stock)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end


check([], {})

check([
  Recipe.new(:omelet, { eggs: 4 })
], {
  eggs: 4
})

check([
  Recipe.new(:omelet, { eggs: 4 })
], {
  eggs: 5
})

check([
  Recipe.new(:omelet, { eggs: 4 })
], {
  eggs: 3
})

check([
  Recipe.new(:omelet, { eggs: 4 })
], {

})

check([
  Recipe.new(:omelet, { eggs: 4 }),
  Recipe.new(:cake, { eggs: 5, flour: 250, butter: 250, sugar: 250 })
], {
  eggs: 4
})

check([
  Recipe.new(:omelet, { eggs: 4 }),
  Recipe.new(:cake, { eggs: 5, flour: 250, butter: 250, sugar: 250 })
], {
  eggs: 5
})

check([
  Recipe.new(:omelet, { eggs: 4 }),
  Recipe.new(:cake, { eggs: 5, flour: 250, butter: 250, sugar: 250 })
], {
  eggs: 5, flour: 250, butter: 250, sugar: 250
})

check([
  Recipe.new(:omelet, { eggs: 4 }),
  Recipe.new(:cake, { eggs: 5, flour: 250, butter: 250, sugar: 250 })
], {
  eggs: 5, flour: 250, butter: 250, sugar: 300
})

check([
  Recipe.new(:omelet, { eggs: 4 }),
  Recipe.new(:cake, { eggs: 5, flour: 250, butter: 250, sugar: 250 }),
  Recipe.new(:muffin, { eggs: 1, flour: 50, butter: 50, sugar: 50 }),
], {
  eggs: 5, flour: 250, butter: 250, sugar: 250
})

puts 'Success'
