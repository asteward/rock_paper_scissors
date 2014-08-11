require './lib/game'
require './lib/player'

def header
  system 'clear'
  puts "
   █▀▀█ █▀▀█ █▀▀ █ █    █▀▀█ █▀▀█ █▀▀█ █▀▀ █▀▀█
   █▄▄▀ █  █ █   █▀▄    █▄▄█ █▄▄█ █  █ █▀▀ █▄▄▀
   █  █ ▀▀▀▀ ▀▀▀ ▀ ▀    █    ▀  ▀ █▀▀▀ ▀▀▀ ▀ ▀▀

  　 　 █▀▀▀█ █▀▀  ▀  █▀▀ █▀▀ █▀▀█ █▀▀█ █▀▀
　   　  ▀▀▄▄ █   ▀█▀ ▀▀█ ▀▀█ █  █ █▄▄▀ ▀▀█
　 　   █▄▄▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀ ▀▀ ▀▀▀
  \n\n"
end

def main_menu
  header
  @current_game = false
  puts "  N > New Game"
  puts "  E > Exit"
  main_choice = gets.chomp.upcase
  case(main_choice)
  when 'N'
    game_menu
  when 'E'
    puts "Have an excellent day!"
    exit
  else
    puts "  \"#{main_choice}\" is not a valid option. Please try again."
    sleep 2
  end
  main_menu
end



def game_menu
  if @current_game == false
    @game = Game.new()
    @player1 = Player.new(player_name(1))
    @player2 = Player.new(player_name(2))
    @current_game = true
  end
  header
  puts "#{@player1.name} vs. #{@player2.name}"
  puts "  N > New Round"
  puts "  V > View Game Win Stats"
  puts "  R > Return to Main Menu"
  choice = gets.chomp.upcase
  case(choice)
  when 'N'
    new_round
  when 'V'
    view_stats
  when 'R'
    main_menu
  else
    puts "  \"#{choice}\" is not a valid option. Please try again."
    sleep 2
  end
  game_menu
end

def player_name(number)
  header
  puts "Please enter Player #{number}'s name:"
  player_name = gets.chomp.capitalize
  if player_name.length > 0
    puts "Thank you #{player_name}!"
    sleep 1.5
    player_name
  else
    puts "Name must be at least one character long."
    sleep 2
    player_name(number)
  end
end

def new_round
  @player1.hand = player_choice(@player1.name)
  @player2.hand = player_choice(@player2.name)
  header
  puts "And the results are..."
  sleep 2
  winner = @player1.compare_hands(@player2)
  @game.winners << winner
  puts "#{winner.name} WINS!!!"
  sleep 3
end

def player_choice(name)
  header
  puts "#{name}'s turn!"
  puts " R > ROCK!"
  puts " P > PAPER!!"
  puts " S > SCISSORS!!!"
  choice = gets.chomp.upcase
  case(choice)
  when 'R'
    weapon = "R"
  when 'P'
    weapon = "P"
  when 'S'
    weapon = "S"
  else
    puts "  \"#{choice}\" is not a valid option. Please try again."
    sleep 2
    player_choice(name)
  end
  puts "Excellent choice."
  sleep 1
  weapon
end



main_menu
