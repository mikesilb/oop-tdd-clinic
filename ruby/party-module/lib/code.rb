module PartyGoer
  attr_accessor :num_drinks
  def initialize(num_drinks = 0)
    @num_drinks = num_drinks
  end
  def drink
    if @num_drinks >= 3
      false
    else
      @num_drinks += 1
      true
    end
  end
  def sing
    "I wanna ROCK!!!"
  end
  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end
  def invited?
    true
  end
end

class PersonalizedHavocError < StandardError
end
