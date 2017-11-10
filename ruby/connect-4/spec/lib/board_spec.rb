require "spec_helper"

RSpec.describe Board do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:john_chip) { Chip.new(john.name, "X") }
  let(:computer) { Player.new("MyMacComputer", 3, 9.99, 21) }
  let(:computer_chip) { Chip.new(computer.name, 'O') }
  let(:the_new_board) { Board.new(7, 6)}
  describe "board" do
    it "initializes the board conditions" do
      expect(the_new_board.column).to eq 7
      expect(the_new_board.row).to eq 6
      expect(the_new_board.the_grid.length).to eq 42
      expect(the_new_board.the_grid[6].location[0]).to eq 6
      expect(the_new_board.the_grid[6].location[1]).to eq 5
      expect(the_new_board.the_grid[-1].location[0]).to eq 6
      expect(the_new_board.the_grid[-1].location[1]).to eq 0
    end
  end
end
