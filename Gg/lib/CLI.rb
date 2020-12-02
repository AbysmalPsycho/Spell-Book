class Gg::CLI

    def start 
        introduction
        get_spell_data
        menu_loop
    end 

    def introduction
        puts "\n\n\n\n\nYou open your leather bound book to find a spell..\n\n\n\n\n"
    end 

    def get_spell_data
        Gg::APIManager.get_Gg
    end 

    def menu_loop
        loop do
            menu
            input = get_spell
            case input
            when "exit"
                break
            when input = "invalid"
                menu
            else
                show_single_spell(input)
        end 
    end 
        puts "in menu loop"
        
    end 

    def menu
        show_spell
        show_instructions

    end 

    def get_spell
        input = gets.strip.downcase 
        if input.to_i.between?(1, Gg::Spells.all.length)
            return input.to_i - 1
        else 
            puts "you must focus"
            return "invalid"
        end 
    end 

    def show_spell
        spell = Gg::Spells.all
        spell.each.with_index(1) do |script, index|

            puts "#{index}. #{script.name}"
        end 
    end 

    def show_single_spell(l)
    
        spell_obj = Gg::Spells.all[l]
        Gg::APIManager.get_spell_info(spell_obj)
        
    end 

    def show_instructions
        puts <<-INST

        Invision the spell you wish to see or close the book (exit)

        INST

    end 
end 