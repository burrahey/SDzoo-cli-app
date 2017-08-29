class SDzoo::CLI

  def call
    puts "Welcome to the San Diego Zoo CLI app!"
    puts "To get started, what type of animals would you like to learn more about?"
    puts  <<~HEREDOC
      1. Mammals
      2. Reptiles
      3. Birds
      4. Amphibians
      5. Insects
      6. Fish
    HEREDOC
    puts "You can type a number or name."
    input = gets.strip

    while input != "exit"

      case input.downcase
      when "1" || "mammals"
        create_animals("mammals")
        SDzoo::ANIMAL.display_all
      when "2" || "reptiles"
        create_animals(type)
        SDzoo::ANIMAL.display_all
      when "3" || "birds"
        create_animals("birds")
        SDzoo::ANIMAL.display_all
      when "4" || "amphibians"
        create_animals("amphibians")
        SDzoo::ANIMAL.display_all
      when "5" || "insects"
        create_animals("arthropods")
        SDzoo::ANIMAL.display_all
      when "6" || "fish"
        create_animals("fish")
        SDzoo::ANIMAL.display_all
      when 'exit'
        break
      end

      puts "Here's the list again:"
      puts <<~HEREDOC
        1. Mammals
        2. Reptiles
        3. Birds
        4. Amphibians
        5. Insects
        6. Fish
      HEREDOC
      puts "You can type a number or name."
      input = gets.strip
    end

    bye
  end

  def create_animals(type)
    animal_array = SDzoo::SCRAPER.scrape_and_create_animals("animals/" + type)
  end

  def add_attributes_to_animals
    #change this method to only scrape animals that people want to see more about
    SDzoo::ANIMAL.all.each do |animal|
      animal_hash = SDzoo::SCRAPER.add_attributes_to_animal(animal.url)
      animal.add_attributes_to_animal(animal_hash)
    end
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
    sleep(1)
  end



end
