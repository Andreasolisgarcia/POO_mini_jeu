require_relative 'player.rb'
# require 'pry'

class Game
    attr_accessor :human_player, :enemies

    def initialize(human_name)
        @human_player = HumanPlayer.new(human_name)
        player1 = Player.new("Magneto")
        player2 = Player.new("Le Grinch")
        player3 = Player.new("le Pinguin")
        player4 = Player.new("Wanda")
        @enemies = [player1, player2, player3, player4]
    end

    def kill_player(player)
        @enemies.delete(player)
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 &&  @enemies.empty? == false
            return true
        else 
            return false
        end
    end

    def show_players
        @human_player.show_state
        @enemies.each do |enemy|
            enemy.show_state
        end
    end

    def menu
        while 
            puts " ********  Quelle action veux-tu effectuer   ********"
            puts 
            puts "a - chercher une meilleure arme"
            puts "s - chercher à se soigner"
            p
            puts "attaquer un joueur en vue :"
            p
            puts "0 - #{player1.name} a #{player1.life_points} points de vie"
            puts "1 - #{player2.name} a #{player2.life_points} points de vie"
            puts "2 - #{player3.name} a #{player3.life_points} points de vie"
            puts "3 - #{player4.name} a #{player4.life_points} points de vie"
            puts "4 - #{player5.name} a #{player5.life_points} points de vie"
            puts "5 - #{player6.name} a #{player6.life_points} points de vie"

            puts
            print 'ton choix >'
            choise = gets.chomp

            case choise
                when "a"
                    @human_player.search_weapon
                when "s"
                    @human_player.search_health_pack
                when "0"
                    @human_player.attacks(player1)
                when "1"
                    @human_player.attacks(player2)
                when "2"
                    @human_player.attacks(player3)
                when "3"
                    @human_player.attacks(player4)
                when "4"
                    @human_player.attacks(player5)
                when "5"
                    @human_player.attacks(player6)
            end 
            puts
            puts  "Les autres joueurs t'attaquent !, (prepare-toi ! & press ENTER)"
            puts
            puts 'Press Enter'
            gets

            @enemies.each do |enemy|
                if enemy.life_points > 0
                    enemy.attacks(@human_player)
                end
                    puts
            end

            puts 'Press Enter'
            gets
        end
    end
end

# binding.pry
