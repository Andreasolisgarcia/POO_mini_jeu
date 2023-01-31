#require "pry"
class Player
    attr_accessor :name, :life_points  


    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{self.name} a #{self.life_points}"
    end

    def gets_damage(damage)
        @life_points= @life_points - damage
        if @life_points <= 0 
            puts "le joueur #{@name} a été tué!"
            puts "End of the game!"
            exit  # pour arreter le jeu une fois que qqn est mort
        end
    end

    def compute_damage
        return rand(1..6)
    end

    def attacks(rival)
        puts "le joueur #{self.name} attaque le joueur #{rival.name}"
        damage = compute_damage
        rival.gets_damage(damage)
        puts "il lui inflige #{damage} points de dommages"
    end

end


#binding.pry
