class BoundingBox
  attr_accessor :x, :y, :width, :height
  def initialize(x, y, width, height )
    @x = x
    @y = y
    @width = width
    @height = height
  end
  def width
    @width
  end
  def height
    @height
  end
  def left
    @x
  end
  def right
    @x + @width
  end
  def top
    @y + @height
  end
  def bottom
    @y
  end
  def contains_point?(x,y)
    if (x >= left) && (x <= right) && (y >= bottom) && (y <= top)
      true
    else
      false
    end
  end
end
