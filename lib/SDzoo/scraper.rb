class SDzoo::SCRAPER

  BASE_PATH = "http://animals.sandiegozoo.org/"
  BASE_TYPE_PATH = "animals/"
  def self.scrape_and_create_animals(type)

    sections = Nokogiri::HTML(open(BASE_PATH + BASE_TYPE_PATH + type)).search("div.views-field-title span.field-content a")

    case type
    when "mammals"
      sections.each do |section|
        animal = SDzoo::MAMMALS.new(section.text, section["href"])
      end
    when "reptiles"
      sections.each do |section|
        animal = SDzoo::REPTILES.new(section.text, section["href"])
      end

    when "birds"
      sections.each do |section|
        animal = SDzoo::BIRDS.new(section.text, section["href"])
      end

    when "amphibians"
      sections.each do |section|
        animal = SDzoo::AMPHIBIANS.new(section.text, section["href"])
      end

    when "arthropods"

      sections.each do |section|
        animal = SDzoo::ARTHROPODS.new(section.text, section["href"])
      end

    when "fish"
      sections.each do |section|
        animal = SDzoo::FISH.new(section.text, section["href"])
      end
    end

  end

  def self.add_attributes_to_animal(file_path)
    animal_hash = {}

    doc = Nokogiri::HTML(open(BASE_PATH + file_path))

    taxo_array = doc.css("div.field-node--field-classifications.field-name-field-classifications div.field__items div.field__item ul").text.split("\n\t")
    animal_hash[:taxonomy] = taxo_array.join("\n").strip.chomp(",")

    animal_hash[:conservation_status] = doc.search("div.vocabulary-conservation-status div.field__item").text.strip
    animal_hash[:life_span] = doc.css("div#block-sidebarcontent").text.strip.split("\n\n")[1].strip
    animal_hash[:fun_fact] = doc.css("div#block-sidebarcontent").text.strip.split("FUN FACTS")[-1].strip

    animal_hash
  end

end
