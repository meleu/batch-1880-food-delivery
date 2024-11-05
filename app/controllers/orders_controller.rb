require_relative '../views/orders_view'

class OrdersController
  ##########################################################
  # NOTE: this was what was messing with our livecode!!! 🤬
  ##########################################################
  # initialize MUST receive the repositories in the arguments in the following order:
  # 1. meal_repo
  # 2. customer_repo
  # 3. employee_repo
  # 4. order_repo   👈 during the livecode order_repo was being passed as the first one
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_deliveries
    orders = @order_repository.all
    @orders_view.display(orders)
  end

  def add
    customer = select_customer
    meal = select_meal
    employee = select_employee

    order = Order.new(meal:, customer:, employee:)
    @order_repository.create(order)
    list_deliveries
  end

  private

  def select_meal
    meals = @meal_repository.all
    @orders_view.display_meals(meals)
    index = @orders_view.ask_for_index
    meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @orders_view.display_customers(customers)
    index = @orders_view.ask_for_index
    customers[index]
  end

  def select_employee
    employees = @employee_repository.all_riders
    @orders_view.display_riders(employees)
    index = @orders_view.ask_for_index
    employees[index]
  end
end
