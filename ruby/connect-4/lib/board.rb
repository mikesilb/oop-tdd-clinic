require_relative './position'
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
    puts "\n"
    column_num = 0
    print " "
    while column_num < @column
      print " #{column_num}"
      column_num +=1
    end
    puts " "
    @the_grid.each do | the_location |
      if the_location.availability == true && the_location.location[0] % column == column - 1
        puts " .|"
      elsif the_location.availability == false && the_location.location[0] % column == column - 1
        puts " #{the_location.chip_at_position.symbol}|"
      elsif the_location.availability == true && the_location.location[0] == 0
        print "#{the_location.location[1]}|."
      elsif the_location.availability == false && the_location.location[0] == 0
        print "#{the_location.location[1]}|#{the_location.chip_at_position.symbol}"
      elsif the_location.availability == false
        print " #{the_location.chip_at_position.symbol}"
      elsif the_location.availability == true
        print ' .'
      end
    end
  end

  def check_for_availability(column, row)
    available = nil
    the_grid.each do | the_location |
      if (the_location.location == [column, row]) && (the_location.availability == true)
        available = true
      elsif (the_location.location == [column, row]) && (the_location.availability == false)
        available = false
      end
    end
    available
  end

  def has_a_chip?(column, row, symbol)
    result = nil
    @the_grid.each do | the_location |
      if the_location.location == [column, row]
        if the_location.availability == false && the_location.chip_at_position.symbol == symbol
          result = true
        else
          result = false
        end
      end
    end
    result
  end


  def occupying_the_position(column, row, chip)
    the_grid.each do | the_location |
      if (the_location.location == [column, row])
        the_location.occupy(chip)
      end
    end
  end

  def is_a_horizontal_connect4?(row, symbol)
    horizontal_connect4 = nil
    column = 0
    while column < @column - 3
      if has_a_chip?(column, row, symbol) == true
        if has_a_chip?(column+1, row, symbol) == true
          if has_a_chip?(column+2, row, symbol) == true
            if has_a_chip?(column+3, row, symbol) == true
              horizontal_connect4 = true
            end
          end
        end
      end
      column += 1
    end
    if horizontal_connect4 == nil
      horizontal_connect4 = false
    end
    horizontal_connect4
  end

  def is_a_vertical_connect4?(column, symbol)
    vertical_connect4 = nil
    row = 0
    while row < @row - 3
      if has_a_chip?(column, row, symbol) == true
        if has_a_chip?(column, row+1, symbol) == true
          if has_a_chip?(column, row+2, symbol) == true
            if has_a_chip?(column, row+3, symbol) == true
              vertical_connect4 = true
            end
          end
        end
      end
      row += 1
    end
    if vertical_connect4 == nil
      vertical_connect4 = false
    end
    vertical_connect4
  end

  def is_a_connect4?
    is_connect4 = nil
    #NEEDS TO FILL IN A TON OF STUFF HERE
    is_connect4
  end

end
# b1 = Board.new
# binding.pry
