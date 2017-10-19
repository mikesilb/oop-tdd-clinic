class Cup
  attr_reader :max_capacity
  attr_accessor :amount

  def initialize(amount = 8.0, max_capacity = 12.0)
    @amount = amount
    @max_capacity = max_capacity
    check_for_valid
  end
  
  def check_for_valid
    if max_capacity > 2.0
      @max_capacity = max_capacity
    else
      puts "This cup is too small"
      @amount = nil
    end
    if @amount > max_capacity - 2
      if amount > max_capacity
        puts "The cup spilleth over.  Make a new cup"
      else
        puts "I cant add this much coffee.  Sorry about that. Make a new cup"
      end
      @amount = nil
      @max_capacity = nil
    end
  end

  def sip!
    @amount -= 0.5
  end

  def spill!
    @amount = 0.0
  end

  def refill!(new_amount)
    if new_amount + @amount > max_capacity - 2
      puts "I cant add this much coffee.  Sorry about that"
    else
      @amount += new_amount
    end
  end
end
