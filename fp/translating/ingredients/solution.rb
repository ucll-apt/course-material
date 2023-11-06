def functional(recipes, stock)
  recipes.select do |recipe|
    recipe.ingredients.all? do |ingredient, amount|
      (stock[ingredient] || 0) >= amount
    end
  end.map(&:name).to_set
end
