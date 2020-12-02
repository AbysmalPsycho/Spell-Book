class Gg::APIManager

    BASE_URL = "https://www.dnd5eapi.co/api/"

    def self.get_Gg
        puts "making network request"

        url = BASE_URL + "spells"
        res = HTTParty.get(url)
        spellsarr = res["results"]
        Gg::Spells.mass_create_from_api(spellsarr)
    end 

    def self.get_spell_info(spell_obj)
        puts "\nMAKING NETWORK REQUEST..\n"

        url = spell_obj.url
        res = HTTParty.get(url)
    
        
    end  


end 
