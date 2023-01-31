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
        @enemies.deleate(player)
    end
end