class Zoo
  attr_accessor :cages, :employees
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times do |x|
      @cages << Cage.new
    end
    @employees = []
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    if @season_opening_date < date && date < @season_closing_date
      true
    else
      false
    end
  end
  def add_animal(the_animal)
    @cages[0].animal = the_animal
  end

end
