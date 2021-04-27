class Game
  attr_accessor :human_player, :players_left, :enemies_in_sight_in_sight

  def initialize (name)
    @players_left = 10
    @enemies_in_sight = []
    @human_player=HumanPlayer.new(name)
  end

  def kill_player
    @enemies_in_sight.each do |player|
      if player.life_points<=0
        @enemies_in_sight.delete(player)
      else
      end
    end
    return @enemies_in_sight.length
  end

  def is_still_ongoing?
    if @players_left !=0 && @human_player.life_points>0
      return true
    else
      return false
    end
  end

  def show_players
    @human_player.show_state
    puts "Tu as, pour le moment, #{@enemies_in_sight.length} ennemis en vue."
  end

  def menu
    puts "Quelle action veux-tu effectuer?
    [a] chercher une meilleure arme
    [s] chercher à se soigner
    attaquer un joueur en vue"
    @enemies_in_sight.each do |player|
      print "    [#{@enemies_in_sight.index(player)}] "
      player.show_state
    end
  end

  def menu_choice(string)
    if string == "a"
      @human_player.search_weapon
    elsif string == "s"
      @human_player.search_health_pack
    else
      @human_player.attacks(@enemies_in_sight[string.to_i])
    end
  end

  def enemies_attack
    if @enemies_in_sight.length != 0
      puts "attention, les autres joueurs attaquent!"
      @enemies_in_sight.each do |player|
        if player.life_points>0
          player.attacks(@human_player)
        else
        end
      end
    end
  end

  def end_of_game
    if @human_player.life_points>0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Looser ! Tu as perdu !"
    end
  end

  def new_player_in_sight
    if @enemies_in_sight.length == @players_left
      puts "tous les ennemis sont déjà en vue"
    else
      result = rand (1..6)
        if result == 1
          puts "aucun adversaire n'est arrivé !"
        elsif result >=5
          puts "2 nouveaux adversaires sont en vue !"
          for i in 1..2 do
            random_number_player = rand(100..4000)
            player = Player.new("player_#{random_number_player}")
            @enemies_in_sight << player
          end
        else
          puts "1 nouvel adversaire est en vue !"
          string = "player_"
          player = string.concat(rand(100..4000))
          player = Player.new(player)
          @enemies_in_sight << player
        end
    end
  end

end