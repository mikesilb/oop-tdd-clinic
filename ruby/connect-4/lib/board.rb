require_relative './position'
class Board
  attr_reader :width, :height, :the_grid
  def initialize(width = 7, height = 6)
    @width = width
    @height = height
    x=0
    @the_grid = [];
    while x < @width
      y=0
      while y < @height
        @the_grid << Position.new([x,y])
        y+=1
      end
      x+=1
    end
  end
end
the_new_board = Board.new
