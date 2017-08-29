class SDzoo::ANIMAL
  attr_accessor :name, :url, :taxonomy, :conservation_status, :life_span, :fun_fact

  @@all_mammals = []
  @@all_reptiles = []
  @@all_birds = []
  @@all_fish = []
  @@all_arthropods = []
  @@all_amphibians = []

  def initialize(name, url, type)
    @name = name
    @url = url
    @type = type
    self.class.send("all_#{type}") << self
  end

  def add_attributes_to_animal(animal_hash)
    animal_hash.each do |type, value|
      self.send("#{type}=", value)
    end
  end

  def self.all_mammals
  	@@all_mammals
  end

   def self.all_reptiles
   	@@all_reptiles
  end

   def self.all_birds
   	@@all_birds
  end

   def self.all_fish
   	@@all_fish
  end

   def self.all_arthropods
   	@@all_arthropods
  end

   def self.all_amphibians
   	@@all_amphibians
  end

  def self.display_all(type)
    self.send("all_#{type}").each_with_index do |animal, index|
      puts "#{index+1}. #{animal.name}"
    end
    puts "\n"
  end

  def display_all_attributes
    puts "NAME: #{@name}"
    if @conservation_status.downcase.include?("threat") || @conservation_status.downcase.include?("danger")
      puts "CONSERVATION STATUS: #{@conservation_status}".colorize(:red)
    else
      puts "CONSERVATION STATUS: #{@conservation_status}".colorize(:green)
    end
    puts "LIFE SPAN: #{@life_span}"
    puts "FUN FACT: #{@fun_fact}"
    puts "TAXONOMIC INFO:"
    puts "#{@taxonomy}"
    puts "\n"
  end
end
