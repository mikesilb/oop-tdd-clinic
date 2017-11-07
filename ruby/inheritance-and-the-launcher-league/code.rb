class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero
  def backstory
    "I always got away"
  end
  def powers
    "Faster than the speed of light"
  end
  def weakness
    "Freeze time and I'm screwed"
  end
  def speed_in_mph
    super * 1000
  end
end

class Brawler < SuperHero
  def backstory
    "I am too much like Tyson"
  end
  def powers
    "I can Float like Butterfly and Sting like Bee"
  end
  def weakness
    "I have a glass jaw"
  end
  def health
    super * 20
  end
end

class Detective < SuperHero
  def backstory
    "I live the life of Sherlock Holmes"
  end
  def powers
    "I have sleuth strength"
  end
  def weakness
    "Luke Bayne"
  end
  def speed_in_mph
    super / 6
  end
end

class Demigod < SuperHero
  def backstory
    "Call me Zeus"
  end
  def powers
    "I live the glamorous life"
  end
  def weakness
    "No substance....all style"
  end
  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades < SuperHero
  def backstory
    "I can sell you a car, teach you calculus, and swat flies simultaneously"
  end
  def powers
    "I morph constantly"
  end
  def weakness
    "Master of NONE!!!"
  end
  def species
    "Alien"
  end
  def home
    "Venus"
  end
  def psychic?
    !super
  end
end

class WaterBased < SuperHero
  def backstory
    "I have been known as the BIG FISH"
  end
  def powers
    "I swim at warp speed"
  end
  def weakness
    "Take me out of water and I die"
  end
  def home
    "Earth's Oceans"
  end
  def fans_per_thousand
    super / 100
  end
  def psychic?
    !super
  end
end
