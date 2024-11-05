class CustomersView
  def display(customers)
    customers.each do |c|
      puts "#{c.id}: #{c.name} - #{c.address}"
    end
  end

  def ask_for(something)
    puts "Enter the customer #{something}:"
    gets.chomp
  end
end
