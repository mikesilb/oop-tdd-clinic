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

  def occupying_the_position(column, row, chip)
    the_grid.each do | the_location |
      if (the_location.location == [column, row])
        the_location.occupy(chip)
      end
    end
  end

end
