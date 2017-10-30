require_relative "card"
require_relative "deck"
require_relative "hand"

deck = Deck.new
player = Hand.new(deck.deal(2))
computer = Hand.new(deck.deal(2))
# Your code here...
