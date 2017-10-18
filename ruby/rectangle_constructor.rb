class Rectangle
  attr_reader :width, :height
  def initialize(width, height=nil)
    @width = width
    if height.nil?
      @height = @width
    else
      @height = height
    end
  end

  def area
    @height * @width
  end
end
