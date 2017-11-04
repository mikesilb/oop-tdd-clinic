require "spec_helper"

RSpec.describe Blackjack do
  let(:bj) { Blackjack.new }
  describe "Blackjack" do
    it "a new deck exists and consists of 52 unique cards" do
      expect(bj.game_data[:deck].class).to eq Deck
      expect(bj.game_data[:deck].the_deck.length).to eq 52
      expect(bj.game_data[:deck].the_deck.uniq.length).to eq 52
    end
  end
  describe "#initial_deal" do
    it "will deal two cards to the player" do
      bj.initial_deal
      expect(bj.game_data[:player].cards.length).to eq 2

    end
    it "will deal two cards to the computer" do
      bj.initial_deal
      expect(bj.game_data[:computer].cards.length).to eq 2
    end
  end
  describe "#true_hit" do
    it "will deal one card and the score will increase by the value of the dealt card" do
      bj.initial_deal
      the_player_score = bj.game_data[:player_score]
      the_computer_score = bj.game_data[:computer_score]
      # binding.pry
      bj.hit(:player, :player_score)
      expect(bj.game_data[:player].cards.length).to eq 3
      expect(bj.game_data[:computer].cards.length).to eq 2
      expect(bj.game_data[:player_score]).to be > the_player_score
      expect(bj.game_data[:computer_score]).to eq the_computer_score
      bj.hit(:computer, :computer_score)
      expect(bj.game_data[:computer].cards.length).to eq 3
      expect(bj.game_data[:computer_score]).to be > the_computer_score
    end
  end
end
