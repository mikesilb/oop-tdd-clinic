require_relative 'card'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    sum = 0
    @cards.each do |card|
      if card.rank.class == Fixnum
        sum += card.rank
      elsif card.rank.class == String && card.rank != "A"
        sum += 10
      elsif sum <= 10
        sum += 11
      else
        sum += 1
      end
    end
    sum
  end
end
