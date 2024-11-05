require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
  end

  def list_deliveries
    orders = @order_repository.all
    @orders_view.display(orders)
  end
end
