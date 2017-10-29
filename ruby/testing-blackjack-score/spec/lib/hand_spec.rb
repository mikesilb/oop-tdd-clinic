require "spec_helper"

describe Hand do
  let(:hand1) { Hand.new([Card.new("♦",2), Card.new("♥",3)]) }
  let(:hand2) { Hand.new([Card.new("♥",2), Card.new("♦",3)]) }
  let(:hand3) { Hand.new([Card.new("♠",2), Card.new("♣",3)]) }
  let(:hand4) { Hand.new([Card.new("♠",10), Card.new("♣",9)]) }
  let(:hand5) { Hand.new([Card.new("♠",9), Card.new("♣",10)]) }
  let(:hand6) { Hand.new([Card.new("♦",6), Card.new("♥","J")]) }
  let(:hand7) { Hand.new([Card.new("♦",6), Card.new("♥","Q")]) }
  let(:hand8) { Hand.new([Card.new("♦",6), Card.new("♥","K")]) }
  let(:hand9) { Hand.new([Card.new("♦",6), Card.new("♥","A")]) }
  let(:hand10) { Hand.new([Card.new("♦",10), Card.new("♥","A")]) }
  let(:hand11) { Hand.new([Card.new("♦","Q"), Card.new("♥","A")]) }
  let(:hand12) { Hand.new([Card.new("♥","A"), Card.new("♦",6)]) }
  let(:hand13) { Hand.new([Card.new("♥","A"), Card.new("♦",10)]) }
  let(:hand14) { Hand.new([Card.new("♥","A"), Card.new("♦","Q")]) }
  let(:hand15) { Hand.new([Card.new("♥","A"), Card.new("♦","A")]) }
  let(:hand16) { Hand.new([Card.new("♥","A"), Card.new("♦",6), Card.new("♠","A")]) }
  let(:hand17) { Hand.new([Card.new("♥","A"), Card.new("♦","A"), Card.new("♠","A")]) }
  let(:hand18) { Hand.new([Card.new("♥","A"), Card.new("♦","A"), Card.new("♠","A"), Card.new("♣","A")]) }

  describe "#calculate_hand" do
    it "adds two numbers properly" do
      expect(hand1.calculate_hand).to eq(5)
      expect(hand2.calculate_hand).to eq(5)
      expect(hand3.calculate_hand).to eq(5)
      expect(hand4.calculate_hand).to eq(19)
      expect(hand5.calculate_hand).to eq(19)
    end
    it "adds face cards properly" do
      expect(hand6.calculate_hand).to eq(16)
      expect(hand7.calculate_hand).to eq(16)
      expect(hand8.calculate_hand).to eq(16)
    end
    it "adds aces properly to the largest possible amount" do
      expect(hand9.calculate_hand).to eq(17)
      expect(hand10.calculate_hand).to eq(21)
      expect(hand11.calculate_hand).to eq(21)
      expect(hand12.calculate_hand).to eq(17)
      expect(hand13.calculate_hand).to eq(21)
      expect(hand14.calculate_hand).to eq(21)
      expect(hand15.calculate_hand).to eq(12)
      expect(hand16.calculate_hand).to eq(18)
      expect(hand17.calculate_hand).to eq(13)
      expect(hand18.calculate_hand).to eq(14)
    end
  end
end
