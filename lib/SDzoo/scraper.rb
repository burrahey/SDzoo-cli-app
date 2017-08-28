class SDzoo::SCRAPER

  def self.scrape_and_create_animals
    sections = Nokogiri::HTML(open("http://animals.sandiegozoo.org/animals")).search("div.views-field-title span.field-content a")

    animal_array = []

    sections.each do |section|
      animal = SDzoo::ANIMAL.new(section.text, section["href"])
      animal_array << animal
    end

    animal_array
  end

  def self.add_attributes_to_animals(file_path)
    animal_hash = {}
    doc = Nokogiri::HTML(open("http://animals.sandiegozoo.org/animals/condor-andean"))

    taxo_array = doc.css("div.field-node--field-classifications.field-name-field-classifications div.field__items div.field__item ul").text.split("\n\t")
    animal_hash[:taxonomy] = taxo_array.join(", ").strip.chomp(",")

    animal_hash[:conservation_status] = doc.search("div.vocabulary-conservation-status div.field__item").text
    animal_hash[:life_span] = doc.css("div#block-sidebarcontent").text.strip.split("\n\n")[1]
    animal_hash[:fun_fact] = doc.css("div#block-sidebarcontent").text.strip.split("FUN FACTS")[-1]

    animal_hash
  end

end
