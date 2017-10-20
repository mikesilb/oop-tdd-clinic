class Ingredient
  def initialize(quantity, units, name)
    @quantity = quantity
    @units = units
    @name = name
  end

  def summary
    "#{@quantity} #{@units} #{@name}"
  end

  def is_valid?
    valid = ["brussels sprouts", "spinach", "eggs", "milk",
    "tofu", "seitan", "bell peppers", "quinoa", "kale", "chocolate",
    "beer", "wine", "whiskey"]

    if !valid.include?(@name)
      false
    else
      true
    end
  end
end

class Recipe
  attr_reader :name, :instructions, :ingredients
  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    puts "Name: #{@name}\n"
    puts "\nIngredients"
    @ingredients.each { |ingredient| puts "- #{ingredient.summary}"}
    puts "\nInstuctions"
    @instructions.each_with_index do |instruction, index|
      puts "#{index + 1}. #{instruction}"
    end
    return
  end
  def is_valid?
    outcome = true
    @ingredients.each do |ingredient|
      if ingredient.is_valid? == false
        outcome = false
      end
    end
    outcome
  end
end

safe_name = "Chocolate Quinoa"
safe_ingredients = [
        Ingredient.new(1.0, "cup", "quinoa"),
        Ingredient.new(1.0, "cup", "chocolate")
      ]
safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
puts "Is #{safe_recipe.name} safe? #{safe_recipe.is_valid?}"
