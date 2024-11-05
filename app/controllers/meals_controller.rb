require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    name = @view.ask_for_name
    price = @view.ask_for_price

    meal = Meal.new(name:, price:)

    @meal_repository.create(meal)
  end

end
