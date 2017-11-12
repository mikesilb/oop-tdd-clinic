require "spec_helper"

RSpec.describe Position do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:john_chip) { Chip.new(john.name, "X") }
  let(:computer) {Player.new("MyMacComputer", 3, 9.99, 21) }
  let(:computer_chip) { Chip.new(computer.name, 'O') }
  let(:positionA) { Position.new([0,0], false, john_chip)}
  let(:positionB) { Position.new([4,3], true)}
  let(:positionC) { Position.new([5,6], true)}
  let(:positionD) { Position.new([3,4], false, computer_chip)}
  describe "position" do
    it "defines a position by its location and its availability" do
      expect(positionA.location).to eq [0,0]
      expect(positionA.availability).to eq false
      expect(positionB.location).to eq [4,3]
      expect(positionB.availability).to eq true
      expect(positionC.location).to eq [5,6]
      expect(positionC.availability).to eq true
    end
    it "if a position is occupied, the chip that occupies the position is included" do
      expect(positionA.chip_at_position).to eq john_chip
      expect(positionD.chip_at_position).to eq computer_chip
    end
  end
  describe "#occupy" do
    it "occupies the position with a specific chip" do
      positionB.occupy(:computer_chip)
      expect(positionB.availability).to eq false
      expect(positionB.chip_at_position).to eq :computer_chip
      positionC.occupy(:john_chip)
      expect(positionC.availability).to eq false
      expect(positionC.chip_at_position).to eq :john_chip
    end
    it "will not occupy an already occupied position" do
      positionC.occupy(:john_chip)
      positionC.occupy(:computer_chip)
      expect(positionC.chip_at_position).to eq :john_chip
    end
  end
end
