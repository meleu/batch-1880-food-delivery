class SessionsView
  def ask_for(something)
    puts "Enter the #{something}:"
    gets.chomp
  end

  def signed_in
    puts "Welcome back!"
  end

  def wrong_credentials
    puts "Wrong credentials...\nTry again."
  end
end
