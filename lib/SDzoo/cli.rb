class SDzoo::CLI

  def call
    puts "Welcome to the San Diego Zoo CLI app!"
    puts "To get started, what type of animals would you like to learn more about?"
    puts  <<~HEREDOC
      1. Mammals
      2. Reptiles
      2. Birds
      3. Amphibians
      4. Insects
      5. Fish
    HEREDOC
    puts "You can type a number or name."
    input = gets.strip

    while input != "exit"

      puts "What would you like to see next? Here are your options"
      puts "You can type 'list' to see the main list again or simply type 'exit'."
      input = gets.strip
    end

    bye
  end

  def bye
    puts "Goodbye! Thanks for using the San Diego Zoo CLI app. You can do more to help stop animal extinction here: http://endextinction.org/"
  end

end
