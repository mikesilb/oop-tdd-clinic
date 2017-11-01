require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :game_data
  def initialize
    @game_data = {
      deck: nil,
      player: nil,
      computer: nil
    }
    game_data[:deck] = Deck.new
  end
  def initial_deal
    @game_data[:player] = Hand.new(game_data[:deck].deal(2))
    @game_data[:player].cards.each do |the_card|
      puts "Player was dealt #{the_card.rank} #{the_card.suit}"
    end
    @game_data[:computer] = Hand.new(@game_data[:deck].deal(2))
  end
end

bj = Blackjack.new
bj.initial_deal
