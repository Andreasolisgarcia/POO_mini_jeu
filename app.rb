require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")
puts

puts "Voici l'état de chaque joueur :"
puts
player1.show_state
player2.show_state
puts
puts "Apuie sur ENTER pour commencer"
gets

while player1.life_points >0 || player2.life_points >0
        puts "Passons à la phase d'attaque :"
        puts
        puts player1.attacks(player2)
        puts player2.attacks(player1)
        puts
        player1.show_state
        player2.show_state
        gets

end




