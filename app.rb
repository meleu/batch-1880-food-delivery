require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'

require_relative 'router'

meal_repository = MealRepository.new(File.join(__dir__, './data/meals.csv'))
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(File.join(__dir__, './data/customers.csv'))
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new(File.join(__dir__, './data/employees.csv'))
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run