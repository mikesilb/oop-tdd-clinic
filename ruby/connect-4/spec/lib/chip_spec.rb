require "spec_helper"

RSpec.describe Chip do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:computer) {Player.new("MyMacComputer", 3, 9.99, 21) }
  let(:john_chip) { Chip.new(john.name, "X") }
  let(:computer_chip) { Chip.new(computer.name, 'O') }

  describe "chip" do
    it "defines a chip type by its owner and its symbol" do
      expect(john_chip.owner).to eq "John"
      expect(john_chip.symbol).to eq "X"
      expect(computer_chip.owner).to eq "MyMacComputer"
      expect(computer_chip.symbol).to eq "O"
    end
  end
end
