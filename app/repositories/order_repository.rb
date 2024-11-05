require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @orders = []
    @next_id = 1
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_csv if File.exist?(@csv_file)
  end

  def all
    @orders
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def undelivered_orders
    @orders.select { |order| order.delivered? == false }
  end

  def employee_undelivered_orders(employee)
    @orders.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      delivered = row[:delivered] == "true"

      meal_id = row[:meal_id].to_i
      meal = @meal_repository.find(meal_id)

      customer_id = row[:customer_id].to_i
      customer = @customer_repository.find(customer_id)

      employee_id = row[:employee_id].to_i
      employee = @employee_repository.find(employee_id)

      order = Order.new(id:, delivered:, meal:, customer:, employee:)
      @orders << order
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end
