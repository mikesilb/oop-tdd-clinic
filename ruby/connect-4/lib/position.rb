class Position
  attr_reader :location
  attr_accessor :availability, :chip_at_position
  def initialize(location, availability = true, chip_at_position = nil)
    @location = location
    @availability = availability
    @chip_at_position = chip_at_position
  end
  def occupy(chip)
    if @availability == true
      @availability = false
      @chip_at_position = chip
    end
  end
end
