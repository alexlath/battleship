require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

computer_data = {
  computer_board: Board.new,
  cruiser: Ship.new("Cruiser", 3),
  submarine: Ship.new("Submarine", 2)
}

player_data = {
  player_board: Board.new,
  cruiser: Ship.new("Cruiser", 3),
  submarine: Ship.new("Submarine", 2)
}

game = Game.new(computer_data, player_data)

loop do
  response = nil
  until response == "p"
    game.main_menu
    response = gets.chomp.downcase
    return abort("Fine, byeeeeeee.") if response == "q"
  end

  puts "What size board do you want? (between 4-26)"
  size = gets.chomp.to_i
  until size >= 4 && size <= 26
    puts "That's not a valid size!"
    size = gets.chomp.to_i
  end

  computer_data[:computer_board].generate_cells(size)
  player_data[:player_board].generate_cells(size)

  game.setup
  game.turn
  game.end_game
end
