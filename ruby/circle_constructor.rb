class Circle
  attr_accessor :radius
  def initialize(parameter)
    if parameter.kind_of?(Fixnum) || parameter.kind_of?(Float)
      @radius = parameter
    else
      if !parameter[:radius].nil?
        @radius = parameter[:radius]
      elsif !parameter[:diameter].nil?
        @radius = parameter[:diameter]/2.0
      end
    end
  end
end
