require_relative 'card'
class Deck
  attr_reader :the_deck
  def initialize
    @the_deck = [];
    suit_list = ['♦', '♣', '♠', '♥']
    rank_list = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

    suit_list.each do | suit |
      rank_list.each do | rank |
        @the_deck.push(Card.new(suit, rank))
      end
    end
    the_deck.shuffle!
  end

  def deal(num_cards)
    @the_deck.pop(num_cards)
  end
end
