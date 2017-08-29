class SDzoo::ANIMAL
  attr_accessor :name, :url, :taxonomy, :conservation_status, :life_span, :fun_fact

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    self.class.all << self
  end

  def add_attributes_to_animal(animal_hash)
    animal_hash.each do |type, value|
      self.send("#{type}=", value)
    end
  end

  def self.all
    @@all
  end

  def self.display_all
    self.all.each_with_index do |animal, index|
      puts "#{index+1}. #{animal.name}"
    end
    puts "\n"
  end

  def display_all_attributes
    puts "Okay, here's some more info:"
    puts "NAME: #{@name}"
    if @conservation_status.downcase.include?("threat")
      puts "CONSERVATION STATUS: #{@conservation_status}".colorize(:red)
    else
      puts "CONSERVATION STATUS: #{@conservation_status}"
    end
    puts "LIFE SPAN: #{@life_span}"
    puts "FUN FACT: #{@fun_fact}"
    puts "TAXONOMIC INFO:"
    puts "#{@taxonomy}"
    puts "\n"
  end
end
