require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }
  describe "deck" do
    it "consists of 52 unique cards" do
      expect(deck.the_deck.length).to eq 52
      expect(deck.the_deck.uniq.length).to eq 52
    end
  end
  describe "#deal" do
    it "will remove a certain number of cards from the deck" do
      untouched_deck_size = deck.the_deck.length
      deck.deal(2)
      expect(deck.the_deck.length).to eq (untouched_deck_size - 2)
    end
    it "will remove card from the top of the deck" do
      top_card = deck.the_deck[-1]
      bottom_card = deck.the_deck[0]
      the_dealed_card = deck.deal(1)
      expect(the_dealed_card).to eq(top_card)
      expect(the_dealed_card).not_to eq(bottom_card)
    end
  end
end
