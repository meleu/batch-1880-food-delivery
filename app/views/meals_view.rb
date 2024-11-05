class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - $ #{meal.price}"
    end
  end

  def ask_for_name
    puts "Enter the meal name:"
    gets.chomp
  end

  def ask_for_price
    puts "Enter the meal price:"
    gets.chomp.to_i
  end
end
