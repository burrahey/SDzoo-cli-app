class SDzoo::SCRAPER

  BASE_PATH = "http://animals.sandiegozoo.org/"
  BASE_TYPE_PATH = "animals/"
  def self.scrape_and_create_animals(type)

    sections = Nokogiri::HTML(open(BASE_PATH + BASE_TYPE_PATH + type)).search("div.views-field-title span.field-content a")

      sections.each do |section|
        animal = SDzoo::ANIMAL.new(section.text, section["href"], type)
      end

  end

  def self.add_attributes_to_animal(file_path)
    doc = Nokogiri::HTML(open(BASE_PATH + file_path))
    Hash.new.tap do |animal_hash|
      animal_hash[:taxonomy] = doc.css("div.field-node--field-classifications.field-name-field-classifications div.field__items div.field__item ul").text.split("\n\t").join("\n").strip.chomp(",")
      animal_hash[:conservation_status] = doc.search("div.vocabulary-conservation-status div.field__item").text.strip
      animal_hash[:life_span] = doc.css("div#block-sidebarcontent").text.strip.split("\n\n")[1].strip
      animal_hash[:fun_fact] = doc.css("div#block-sidebarcontent").text.strip.split("FUN FACTS")[-1].strip.split(".")[0] + "."
      animal_hash
    end
  end

end
