#  your code, here.
class CargoTruck
  attr_reader :plate_number, :branding, :odometer
  attr_accessor :driver
  def initialize(plate_number, branding)
    @plate_number = plate_number
    @branding = branding
    @odometer = 0
    @driver = nil
  end
  def summary
    "Amazon truck with plate #{plate_number} is driven by #{driver}"
  end
end

plate_numbers_and_brandings = {
  'AMZ203' => "Amazon",
  'AMZ307' => "Amazon",
  'FEDX934' => "FedEx",
  'FEDX238' => "FedEx",
  'GOOG654' => "Google",
  'GOOG3467' => "Google",
  'GOOG2374' => "Google",
  'FB438' => "FaceBook",
  'FB6732' => "FaceBook",
  'FB8908' => "FaceBook",
  'TW3242' => "Twitter",
  'TW3216' => "Twitter"
}

random_names = ["Jack", "Jim", "Mary", "Charles", "Mike", "Evan", "Elaine", "Sarah", "Lucy", "Dana", "Emma", "Harry", "Jimmy", "Eddie", "Lisa", "Jennifer", "Cindy", "Chrissie", "Johnny", "James", "Keith", "Randy", "Sally", "Saul", "David", "Andrew"]

truck_fleet = []

plate_numbers_and_brandings.each do |plate, brand|
  truck_fleet.push (CargoTruck.new(plate, brand))
end

truck_fleet.each do |truck|
  random_number = rand(random_names.size)
  truck.driver = random_names[random_number]
end

truck_fleet.each do |truck|
  puts truck.summary
end
