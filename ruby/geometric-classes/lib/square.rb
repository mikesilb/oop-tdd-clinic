class Square
  attr_reader :side, :x, :y
  def initialize(side, x=0, y=0)
    @side = side
    @x = x
    @y = y
  end
  def length
    @side
  end
  def width
    @side
  end
  def diameter
    @side * Math::sqrt(2)
  end
  def perimeter
    @side * 4
  end
  def area
    @side ** 2
  end
  def contains_point?(x, y)
    if (x >= @x - (@side*Math.sqrt(2)/2)) && (x <= @x + (@side*Math.sqrt(2)/2)) && (y >= @y - (@side*Math.sqrt(2)/2)) && (y <= @x + (@side*Math.sqrt(2)/2))
      true
    else
      false
    end
  end
end
