require "spec_helper"

RSpec.describe Card do
  let(:card1) { Card.new("♦",2) }
  let(:card2) { Card.new("♥",2) }
  let(:card3) { Card.new("♥",10) }
  let(:card4) { Card.new("♥","K") }
  # Your tests here
  it "generates a distintive suit and rank for each card" do
    expect(card1.suit).not_to eq "♥"
    expect(card1.suit).to eq "♦"
    expect(card1.rank).not_to eq 7
    expect(card1.rank).not_to eq "K"
    expect(card1.rank).to eq "2"
    expect(card2.suit).to eq "♥"
    expect(card3.suit).to eq "♥"
    expect(card4.suit).to eq "♥"
    expect(card2.rank).to eq 2
    expect(card3.rank).to eq 10
    expect(card3.rank).to eq "K"
  end
end
