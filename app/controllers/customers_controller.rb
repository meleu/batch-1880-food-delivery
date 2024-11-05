require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    name = @view.ask_for(:name)
    address = @view.ask_for(:address)

    customer = Customer.new(name:, address:)

    @customer_repository.create(customer)
    list
  end
end
