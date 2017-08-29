class SDzoo::CLI

  def call
    puts "Welcome to the San Diego Zoo CLI app!"
    puts "To get started, what type of animals would you like to learn more about?"
    main_menu
    input = gets.strip

    while input != "exit"

      case input.downcase
      when "list"
        puts  <<~HEREDOC
          1. Mammals
          2. Reptiles
          3. Birds
          4. Amphibians
          5. Insects
          6. Fish
        HEREDOC
        puts "You can type a number or name."
      when "1" || "mammals"
        mammals
      when "2" || "reptiles"
        reptiles
      when "3" || "birds"
        birds
      when "4" || "amphibians"
        amphibians
      when "5" || "insects"
        arthropods
      when "6" || "fish"
        fish
      when 'exit'
        break
      end
      sleep(2)
      puts "What kind of animal would you like to learn about next?"
      main_menu
      input = gets.strip
    end

    bye
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
      1. Mammals
      2. Reptiles
      3. Birds
      4. Amphibians
      5. Insects
      6. Fish
    HEREDOC
    puts "You can type a number or name, or 'exit'"
  end

  def mammals
    create_animals("mammals")
    SDzoo::MAMMALS.display_all

    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::MAMMALS.all.length
      animal = SDzoo::MAMMALS.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    end
  end

  def birds
    create_animals("birds")
    SDzoo::BIRDS.display_all

    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::BIRDS.all.length
      animal = SDzoo::BIRDS.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    end
  end

  def reptiles
    create_animals("reptiles")
    SDzoo::REPTILES.display_all

    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::REPTILES.all.length
      animal = SDzoo::REPTILES.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    end
  end

  def fish
    create_animals("fish")
    SDzoo::FISH.display_all

    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::MAMMALS.all.length
      animal = SDzoo::MAMMALS.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    end
  end

  def arthropods
    create_animals("arthropods")
    SDzoo::ARTHROPODS.display_all
    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::ARTHROPODS.all.length
      animal = SDzoo::ARTHROPODS.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
    end
  end

  def amphibians
    create_animals("amphibians")
    SDzoo::AMPHIBIANS.display_all

    puts "What animal would you like to find out more about? Enter a number."
    more = gets.strip.to_i
    if more < SDzoo::AMPHIBIANS.all.length
      animal = SDzoo::AMPHIBIANS.all[more - 1]
      add_attributes_to_animals(animal)
      animal.display_all_attributes
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
  end



end
