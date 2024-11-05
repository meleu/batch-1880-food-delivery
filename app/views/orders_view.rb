class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name}"
    end
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}: #{meal.name} - $#{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}: #{customer.name} - #{customer.address}"
    end
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}: #{rider.username}"
    end
  end

  def ask_for_index
    puts "Choose an item:"
    gets.chomp.to_i - 1
  end
end
