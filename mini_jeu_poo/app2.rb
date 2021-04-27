require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts""

puts "Quel est ton prénom?"
print ">"
name = gets.chomp

user=HumanPlayer.new(name)
player1=Player.new("Josiane")
player2=Player.new("José")

enemies = [player1,player2]

while (player1.life_points>0 || player2.life_points>0) && user.life_points>0 do
  puts "Voici un aperçu de ton profil joueur"
  user.show_state
  puts "Quelle action veux-tu effectuer?
  [a] chercher une meilleure arme
  [s] chercher à se soigner
  attaquer un joueur en vue"
    print "  [0] "
    player1.show_state
    print "  [1] "
    player2.show_state
  action = gets.chomp

  if action == "a"
    user.search_weapon
  elsif action == "s"
    user.search_health_pack
  elsif action == "0"
    user.attacks(player1)
  elsif action == "1"
    user.attacks(player2)
  end

  gets.chomp
  if player1.life_points>0 || player2.life_points>0
    puts "attention, les ennemis attaquent!"
    enemies.each do |player| 
      if player.life_points>0
        player.attacks(user)
      else
      end
    end
  end

  gets.chomp
  puts "-----------------------------------------------------"
  puts""
  
end

if user.life_points>0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end


