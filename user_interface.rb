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
  header
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

main_menu
