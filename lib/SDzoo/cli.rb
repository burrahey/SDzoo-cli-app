class SDzoo::CLI

  def call
    puts "Welcome to the San Diego Zoo CLI app!"
    puts "To get started, what type of animals would you like to learn more about?"
    main_menu
    input = gets.strip.downcase

    while input != "exit"

      if valid_input?(input)
        create_animals(input)
        SDzoo::ANIMALS.display_all(input)

        puts "What animal would you like to find out more about? Enter a number."
        more = gets.strip.to_i

        if more < SDzoo::ANIMALS.send("all_#{input}").length
          animal = SDzoo::ANIMALS.send("all_#{input}")[more - 1]
          add_attributes_to_animals(animal)
          animal.display_all_attributes
        end

        sleep(2)
      else 
        "Sorry, that wasn't valid input."
      end
      puts "What kind of animal would you like to learn about next?"
      main_menu
      input = gets.strip.downcase
    end

    bye
  end

  def valid_input?
    valid = ['mammal', 'birds', 'amphibians', 'insects', 'fish', 'reptiles', 'fish']
    if valid.include?(input)
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

  def main_menu
    puts  <<~HEREDOC
      Mammals
      Reptiles
      Birds
      Amphibians
      Insects
      Fish
    HEREDOC
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
