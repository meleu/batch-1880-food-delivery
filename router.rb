class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_employee = @sessions_controller.login
      @logged_in = true
      while @logged_in
        if @current_employee.manager?
          choice = manager_menu
          manager_action(choice)
        else
          choice = rider_menu
          rider_action(choice)
        end
      end
    end
  end

  private

  def manager_menu
    puts "--------------------------"
    puts "- M A N A G E R  M E N U -"
    puts "--------------------------"
    puts "Choose an action"
    puts "1 - List all meals"
    puts "2 - Add new meal"
    puts "3 - List all customers"
    puts "4 - Add new customer"
    puts "8 - Logout"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then logout!
    when 9 then quit!
    else
      puts "Try again..."
    end
  end

  def rider_menu
    puts "----------------------"
    puts "- R I D E R  M E N U -"
    puts "----------------------"
    puts "do rider things"
    puts "8 - Logout"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def rider_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then logout!
    when 9 then quit!
    else
      puts "Try again..."
    end
  end

  def logout!
    @logged_in = false
  end

  def quit!
    logout!
    @running = false
  end
end
