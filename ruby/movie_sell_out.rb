class Theater
  attr_accessor :capacity, :people_admitted
  def initialize(capacity = 0)
    @capacity = capacity
    @people_admitted = 0
  end
  def admit!(people = 1)
    @people_admitted += people
    if at_capacity? == true
      puts "Theater is at capacity.  Can't admit all these people now"
      @people_admitted -= people
    else
      puts "These people are being admitted!"
    end
  end

  def at_capacity?
    if @people_admitted > @capacity
      true
    else
      false
    end
  end

  def record_walk_outs!(people = 1)
    @people_admitted -= people
  end
end
