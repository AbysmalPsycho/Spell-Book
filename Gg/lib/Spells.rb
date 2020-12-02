class Gg::Spells 

    @@all = []

    def self.all
        @@all
    end 

    def self.mass_create_from_api(spellsarr)
        spellsarr.each do |spellshash|
            self.new(spellshash["name"], spellshash["url"])
        end
    end 
    attr_accessor :name, :url

    def initialize(name, url)
        @name, @url = name, url
        save
    end 

    def save    
        @@all << self


    end
end 