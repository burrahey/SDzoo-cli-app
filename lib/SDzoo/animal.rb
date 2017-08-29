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
    puts "\n"

    self.all.each_with_index do |animal, index|
      puts "#{index+1}. #{animal.name}"
      puts "\n"

    end


  end

end
