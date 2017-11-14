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
  describe "#check_for_availability" do
    it "returns true when space is vacant" do
      the_new_board.the_grid[10].occupy(john_chip)
      the_new_board.the_grid[30].occupy(computer_chip)
      expect(the_new_board.check_for_availability(0,0)).to eq true
      expect(the_new_board.check_for_availability(2,0)).to eq true
      expect(the_new_board.check_for_availability(3,5)).to eq true
    end
    it "returns false when space is occupied" do
      the_new_board.the_grid[10].occupy(john_chip)
      the_new_board.the_grid[30].occupy(computer_chip)
      expect(the_new_board.check_for_availability(2,1)).to eq false
      expect(the_new_board.check_for_availability(3,4)).to eq false
    end
  end

  describe "#has_a_chip?" do
    it "returns true if the specific chip symbol is present at a given position" do
      the_new_board.the_grid[10].occupy(john_chip)
      expect(the_new_board.has_a_chip?(3, 4, "X")).to eq true
      expect(the_new_board.has_a_chip?(3, 4, "O")).to eq false
      the_new_board.the_grid[30].occupy(computer_chip)
      expect(the_new_board.has_a_chip?(2, 1, "O")).to eq true
      expect(the_new_board.has_a_chip?(2, 1, "X")).to eq false
    end
  end

  describe "#is_a_horizontal_connect4?" do
    it "returns true if a horizontal connect4 is found for a given chip symbol" do
      expect(the_new_board.is_a_horizontal_connect4?(1, 'X')).to eq false
      the_new_board.the_grid[30].occupy(john_chip)
      the_new_board.the_grid[31].occupy(john_chip)
      the_new_board.the_grid[32].occupy(john_chip)
      expect(the_new_board.is_a_horizontal_connect4?(1, 'X')).to eq false
      the_new_board.the_grid[33].occupy(john_chip)
      expect(the_new_board.is_a_horizontal_connect4?(1, 'X')).to eq true
    end
  end

  describe "#is_a_vertical_connect4?" do
    it "returns true if a vertical connect4 is found for a given chip symbol" do
      expect(the_new_board.is_a_vertical_connect4?(2, 'X')).to eq false
      the_new_board.the_grid[37].occupy(john_chip)
      the_new_board.the_grid[30].occupy(john_chip)
      the_new_board.the_grid[23].occupy(john_chip)
      expect(the_new_board.is_a_vertical_connect4?(2, 'X')).to eq false
      the_new_board.the_grid[16].occupy(john_chip)
      expect(the_new_board.is_a_vertical_connect4?(2, 'X')).to eq true
    end
  end

  describe "#occupying_the_position" do
    it "occupies the specific position on the board" do
      expect(the_new_board.check_for_availability(3,2)).to eq true
      the_new_board.occupying_the_position(3,2, :john_chip)
      expect(the_new_board.check_for_availability(3,2)).to eq false
    end
  end
end
