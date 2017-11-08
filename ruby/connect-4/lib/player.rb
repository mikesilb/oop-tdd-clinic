class Player
  attr_reader :name, :age, :skill_level
  attr_accessor :num_chips_remain
  def initialize(name, age, skill_level, num_chips_remain = 21)
    @name = name
    @age = age
    @skill_level = skill_level
    @num_chips_remain = num_chips_remain
  end

  def decrease_chips
    @num_chips_remain -= 1
  end
end
