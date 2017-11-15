require_relative "player"
require_relative "chip"
require_relative "position"
require_relative "board"
require_relative "move"

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
      the_game_board: nil
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

  def play_the_game
    @game_data[:the_game_board] = Board.new
    @game_data[:the_game_board].rendering
    @game_data[:Player_1_chip_total] = (@game_data[:the_game_board].row * @game_data[:the_game_board].column)/2
    @game_data[:Player_2_chip_total] = @game_data[:Player_1_chip_total]
    @game_data[:Player_1].num_chips_remain = @game_data[:Player_1_chip_total]
    @game_data[:Player_2].num_chips_remain = @game_data[:Player_2_chip_total]
    while @game_data[:Player_1_chip_total] > 0 && @game_data[:Player_2_chip_total] > 0
      make_a_move(@game_data[:Player_1], @game_data[:Player_1_chip])
      if @game_data[:the_game_board].check_board_for_horiz_connect4?('X') == true || @game_data[:the_game_board].check_board_for_vertical_connect4?('X') == true
        puts "The game is over and player 1 wins!"
        return
      end
      make_a_move(@game_data[:Player_2], @game_data[:Player_2_chip])
      if @game_data[:the_game_board].check_board_for_horiz_connect4?('O') == true || @game_data[:the_game_board].check_board_for_vertical_connect4?('O') == true
        puts "The game is over and player 2 wins!"
        return
      end
    end
    puts "This game is a stalemate!"
  end

  def are_we_interested?(interest_var)
    while interest_var == true
      play_the_game
      response = nil
      while response != 'Y' && response != 'N'
        puts "Would you like to play again (Y|N) ?"
        response = gets.chomp.upcase
        if response == 'N'
          interest_var = false
          puts "Great game!!!"
        end
      end
    end
  end

end

interest_to_play = true
c4 = Connect4.new
c4.name_input(:Player_1)
c4.name_input(:Player_2)
c4.are_we_interested?(interest_to_play)
