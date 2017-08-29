class SDzoo::CLI

  VALID_INPUT = ['mammals', 'birds', 'amphibians', 'arthropods', 'fish', 'reptiles']

  def call
    puts "Welcome to the San Diego Zoo CLI app!"
    puts "To get started, what type of animals would you like to learn more about?"
    main_menu
    input = gets.strip.downcase

    while input != "exit"

      if valid_input?(input)
        create_animals(input)
        SDzoo::ANIMAL.display_all(input)

        puts "What animal would you like to find out more about? Enter a number or name."
        more = gets.strip

        # Handle the case where they entered a number
        if more.to_i > 0 && more.to_i < SDzoo::ANIMAL.send("all_#{input}").length
          search_by_number(input, more)
        else
        # Handle the case where they entered a name
          search_by_name(input, more)
        end

        sleep(2)
      else
        "Sorry, that wasn't valid input."
      end
      puts "\nWhat kind of animal would you like to learn about next?"
      main_menu
      input = gets.strip.downcase
    end

    bye
  end

  def valid_input?(input)
    if VALID_INPUT.include?(input)
      return true
    else
      return false
    end
  end

  def create_animals(type)
    animal_array = SDzoo::SCRAPER.scrape_and_create_animals(type)
  end

  def add_attributes_to_animals(animal)
    animal_hash = SDzoo::SCRAPER.add_attributes_to_animal(animal.url)
    animal.add_attributes_to_animal(animal_hash)
  end

  def search_by_number(input, more)
    animal = SDzoo::ANIMAL.send("all_#{input}")[more.to_i - 1]
    add_attributes_to_animals(animal)
    puts "\nOkay, here's some more info:"
    animal.display_all_attributes

  end

  def search_by_name(input, more)
    potential_answers = SDzoo::ANIMAL.send("all_#{input}").select {|animal| animal.name.downcase.include?(more.downcase)}
    if potential_answers.length == 0
      puts "\nSorry, none of the animal names match that description."
    elsif potential_answers.length == 1
      animal = potential_answers[0]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    else
      puts "\nHere are some of the #{input} that match that name: "
      potential_answers.each do |animal|
        add_attributes_to_animals(animal)
        animal.display_all_attributes
      end
    end
  end

  def main_menu
    VALID_INPUT.each {|valid_input| puts valid_input.capitalize}
    puts "You can choose a name from above, or type 'exit'"
  end

  def bye
    puts "Goodbye! Thanks for using the San Diego Zoo CLI app."
    puts <<~HEREDOC
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@'~~~     ~~~`@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@'                     `@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@'                           `@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@'                               `@@@@@@@@@@@@@@@
    @@@@@@@@@@@'                                   `@@@@@@@@@@@@@
    @@@@@@@@@@'                                     `@@@@@@@@@@@@
    @@@@@@@@@'                                       `@@@@@@@@@@@
    @@@@@@@@@                                         @@@@@@@@@@@
    @@@@@@@@'                      n,                 `@@@@@@@@@@
    @@@@@@@@                     _/ | _                @@@@@@@@@@
    @@@@@@@@                    /'  `'/                @@@@@@@@@@
    @@@@@@@@a                 <~    .'                a@@@@@@@@@@
    @@@@@@@@@                 .'    |                 @@@@@@@@@@@
    @@@@@@@@@a              _/      |                a@@@@@@@@@@@
    @@@@@@@@@@a           _/      `.`.              a@@@@@@@@@@@@
    @@@@@@@@@@@a     ____/ '   \__ | |______       a@@@@@@@@@@@@@
    @@@@@@@@@@@@@a__/___/      /__\ \ \     \___.a@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@/  (___.'\_______)\_|_|        \@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@|\________                       ~~~~~\@@@@@@@@@@
    HEREDOC
    puts "P.S You can do more to help stop animal extinction here: http://endextinction.org/"
  end
end
