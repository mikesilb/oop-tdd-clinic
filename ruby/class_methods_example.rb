class Car
  def initialize(miles_traveled)
    @miles_traveled = miles_traveled
  end

  def self.miles_to_km(miles)
    miles * 1.6
  end
end

road_length = 100
puts "#{road_length} in km => #{Car.miles_to_km(road_length)}"
