class Chip
  attr_reader :owner, :symbol
  def initialize(owner, symbol)
    @owner = owner
    @symbol = symbol
  end
end
