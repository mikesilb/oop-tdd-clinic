require_relative './position'
require 'pry'
class Board
  attr_reader :column, :row, :the_grid
  def initialize(column = 7, row = 6)
    @column = column
    @row = row
    y=@row - 1
    @the_grid = [];
    while y >= 0
      x=0
      while x <= @column -1
        @the_grid << Position.new([x,y])
        x+=1
      end
      y-=1
    end
  end

  def rendering
    column_num = 0
    print "  "
    while column_num < @column
      print column_num
      column_num +=1
    end
    puts " "
    @the_grid.each do | the_location |
      if the_location.availability == true && the_location.location[0] % column == column - 1
        puts ".|"
      elsif the_location.availability == true && the_location.location[0] == 0
        print "#{the_location.location[1]}|."
      else
        print '.'
      end
    end
  end
end
the_new_board = Board.new
the_new_board.rendering
