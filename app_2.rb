require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "HUMAN donne moi ton PRENOM !"
name = gets.chomp

user = HumanPlayer.new(name)
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]



while user.life_points >0 && (player1.life_points >0 || player2.life_points >0)
    p user.show_state
    p
    puts " ********  Quelle action veux-tu effectuer   ********"
    puts 
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    p
    puts "attaquer un joueur en vue :"
    p
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
    puts
    print '>'
    choise = gets.chomp

    case choise
        when "a"
            user.search_weapon
        when "s"
            user.search_health_pack
        when "0"
            user.attacks(player1)
        when "1"
            user.attacks(player2)
    end
    puts
    puts  "Les autres joueurs t'attaquent !, (prepare-toi ! & press ENTER)"
    puts
    gets

    enemies.each do |enemy|
        if enemy.life_points > 0
        enemy.attacks(user)
        end
        puts
    end
    gets
    system("clear")
    
end





