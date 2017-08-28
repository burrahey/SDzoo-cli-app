class SDzoo::ANIMAL
  attr_accessor :name, :url, :taxonomy, :conservation_status, :life_span, :fun_fact

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.display_all
    puts "\n\n"
    self.all.each_with_index do |animal, index|
      puts "#{index+1}. #{animal.name}"
    end
  end

end
