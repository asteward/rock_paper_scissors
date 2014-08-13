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
    @player1 = Player.new({:name => player_name(1)})
    @player2 = Player.new({:name => player_name(2)})
    @current_game = true
  end
  header
  puts "#{@player1.name} vs. #{@player2.name} -- Round #{@game.round}"
  puts "  N > New Round"
  if @game.round > 1
    puts "  V > View Game History"
  end
  puts "  R > Return to Main Menu"
  choice = gets.chomp.upcase
  case(choice)
  when 'N'
    new_round
  when 'V'
    if @game.round > 1
      view_history
    else
      puts "  \"#{choice}\" is not a valid option. Please try again."
      sleep 2
    end
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
    puts "Thank you, #{player_name}!"
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
  if winner == "TIE"
    @game.tie_games += 1
    puts "  IT'S A TIE!!!"
  else
    @game.winners << winner
    puts "  #{winner.name} WINS WITH #{winner.hand}!!!"
  end
  puts "\nPress ENTER to continue..."
  gets
  @game.round += 1
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
    weapon = "ROCK"
  when 'P'
    weapon = "PAPER"
  when 'S'
    weapon = "SCISSORS"
  else
    puts "  \"#{choice}\" is not a valid option. Please try again."
    sleep 2
    player_choice(name)
  end
  puts "Excellent choice."
  sleep 1
  weapon
end

def view_history
  count = 1
  puts "GAME STATS:\n"
  puts "  Number of Tie-Games: #{@game.tie_games}\n"
  puts "  Winner's Log:"
  @game.winners.each do |winner|
    puts "    Round #{count.to_s}: #{winner.name} won with #{winner.hand.capitalize}"
    count += 1
  end
  puts "\nPress ENTER to continue..."
  gets
end



main_menu
