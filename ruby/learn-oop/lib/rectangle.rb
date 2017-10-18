class Rectangle
  attr_reader :length, :width
  attr_accessor :x, :y
  def initialize(length, width, x = 0, y = 0)
    @length = length
    @width = width
    @x = x
    @y = y
  end
  def area
    @length * @width
  end
end
