require "spec_helper"

RSpec.describe Board do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:john_chip) { Chip.new(john.name, "X") }
  let(:computer) { Player.new("MyMacComputer", 3, 9.99, 21) }
  let(:computer_chip) { Chip.new(computer.name, 'O') }
  let(:the_board) { Board.new(7, 6)}
  describe "board" do
    it "initializes the board conditions" do
      expect(the_board.width).to eq 7
      expect(the_board.height).to eq 6
    end
  end
end
