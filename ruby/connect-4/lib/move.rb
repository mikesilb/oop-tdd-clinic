class Move
  attr_reader :chip_from_player, :column
  def initialize(chip_from_player, column)
    @chip_from_player = chip_from_player
    @column = column
  end

  def identify_drop_position(board)
    output = nil
    if board.check_for_availability(@column, board.row - 1) == false
      puts "\n\n\nThis column is completely filled.  Make another move."
      output = false
    else
      row = 0
      while row <= board.row
        if board.check_for_availability(@column, row) == true
          board.occupying_the_position(@column, row, @chip_from_player)
          output = true
          return output
        else
          row += 1
        end
      end
    end
  end
end
