class Player
    attr_accessor :name, :life_points 

    def initialize(name)
        @name = name
        @life_points = 10
    end


    def show_state
        puts "#{self.name} a #{self.life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points= @life_points - damage
        if @life_points <= 0 
            puts "le joueur #{@name} a été tué!"
            exit # pour arreter le jeu une fois que qqn est mort
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

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{self.name} a #{self.life_points} et  une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if @weapon_level < new_weapon_level
            @weapon_level = new_weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end
    
    def search_health_pack
        package = rand(1..6)
        if package == 1
            puts "Tu n'as rien trouvé... "
        elsif package.between?(2, 5) 
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end 

end