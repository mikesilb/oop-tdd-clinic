require_relative "player"
require_relative "chip"
require_relative "position"
require_relative "board"
require_relative "move"
require 'pry'

class Connect4
  attr_reader :game_data
  def initialize
    @game_data = {
      Player_1: nil,
      Player_2: nil,
      Player_1_chip: nil,
      Player_2_chip: nil,
      Player_1_chip_total: nil,
      Player_2_chip_total: nil,
      the_game_board: Board.new()
    }
  end
  def name_input(which_player)
    name = ""
    while name == ""
      puts "#{which_player} what is your name?"
      name = gets.chomp
    end
    while which_player == :Player_2 && name == @game_data[:Player_1].name
      puts "You can't have the same name as Player 1"
      puts "#{which_player} what is your name?"
      name = gets.chomp
    end
    @game_data[which_player] = Player.new(name)
    if which_player == :Player_1
      @game_data[:Player_1_chip] = Chip.new(@game_data[:Player1], 'X')
      @game_data[:Player_1_chip_total] = @game_data[:Player_1].num_chips_remain
    elsif which_player == :Player_2
      @game_data[:Player_2_chip] = Chip.new(@game_data[:Player1], 'O')
      @game_data[:Player_2_chip_total] = @game_data[:Player_2].num_chips_remain
    end
  end

  def make_a_move(which_player, which_players_chips)
    the_result = nil
    until the_result == true
      puts "#{which_player.name}, which column do you choose to insert your chip?"
      column = gets.chomp.to_i
      the_move = Move.new(which_players_chips, column)
      the_result = the_move.identify_drop_position(@game_data[:the_game_board])
    end
    which_player.decrease_chips
    if which_player == @game_data[:Player_1]
      @game_data[:Player_1_chip_total] = which_player.num_chips_remain
    elsif which_player == @game_data[:Player_2]
      @game_data[:Player_2_chip_total] = which_player.num_chips_remain
    end
    @game_data[:the_game_board].rendering
  end
end

def the_game
  c4 = Connect4.new
  c4.name_input(:Player_1)
  c4.name_input(:Player_2)
  c4.game_data[:the_game_board].rendering
  while c4.game_data[:Player_1_chip_total] > 0 && c4.game_data[:Player_2_chip_total] > 0
    c4.make_a_move(c4.game_data[:Player_1], c4.game_data[:Player_1_chip])
    c4.make_a_move(c4.game_data[:Player_2], c4.game_data[:Player_2_chip])
  end
end

the_game
