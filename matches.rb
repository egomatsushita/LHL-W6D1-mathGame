
module MathGame
  class Match
    def self.call_players
      print "Player 1: Enter your name... "
      play1 = $stdin.gets.chomp
      print "Player 2: Enter your name... "
      play2 = $stdin.gets.chomp
      
      return [play1, play2]
    end

    def self.generate_match
      # enter new players
      players = self.call_players

      # initialize new players
      player1 = Player.new(players.first)
      player2 = Player.new(players.last)
      puts ""

      count = 0

      # end when player lives equal to zero
      while true do
        player = count % 2 == 0 ? player1 : player2

        x = rand(0..20)
        y = rand(0..20)

        # generate a new turn
        turn = Turn.new(player, x, y)
        turn.generate_turn
        puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3", ""

        # condition to exit the loop
        if player1.lives != 0 && player2.lives != 0
          puts "------------ NEW TURN ------------"
        else
          win_player = player1.lives == 0 ? player2 : player1
          puts "#{win_player.name} wins with a score of #{win_player.lives}/3"
          puts "------------ GAME OVER ------------"
          puts "Good bye!"
          exit(0)
        end
        count += 1
      end
    end
  end
end