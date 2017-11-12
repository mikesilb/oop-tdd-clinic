require "spec_helper"

RSpec.describe Move do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:computer) { Player.new("MyMacComputer", 3, 9.99, 21) }
  let(:john_chip) { Chip.new(john, 'X') }
  let(:computer_chip) { Chip.new(computer, 'O') }
  let(:the_new_board) { Board.new(7, 6)}
  let(:first_move) { Move.new(john_chip, 2)}
  let(:second_move) { Move.new(computer_chip, 1) }
  let(:third_move) { Move.new(john_chip, 4) }
  let(:fourth_move) { Move.new(john_chip, 4) }
  let(:fifth_move) { Move.new(computer_chip, 4) }
  let(:sixth_move) { Move.new(john_chip, 4) }
  let(:seventh_move) { Move.new(computer_chip, 4) }
  let(:eighth_move) { Move.new(john_chip, 4) }
  let(:ninth_move) { Move.new(computer_chip, 4) }


  describe "move" do
    it "records who is making the move and where" do
      expect(first_move.chip_from_player).to eq john_chip
      expect(first_move.chip_from_player.owner).to eq john
      expect(first_move.column).to eq 2
      expect(second_move.chip_from_player).to eq computer_chip
      expect(second_move.chip_from_player.owner).to eq computer
      expect(second_move.column).to eq 1
    end
  end
  describe "#identify_drop_position" do
    it "places the chip on the bottom row of a column if position is vacant" do
      expect(the_new_board.check_for_availability(first_move.column, 0)).to eq true
      expect(first_move.identify_drop_position(the_new_board)).to eq true
      expect(the_new_board.check_for_availability(first_move.column, 0)).to eq false
    end
    it "places a chip directly above an already present chip provided that the position is vacant" do
      expect(the_new_board.check_for_availability(third_move.column, 0)).to eq true
      expect(the_new_board.check_for_availability(third_move.column, 1)).to eq true
      third_move.identify_drop_position(the_new_board)
      expect(the_new_board.check_for_availability(third_move.column, 0)).to eq false
      expect(the_new_board.check_for_availability(third_move.column, 1)).to eq true
      fourth_move.identify_drop_position(the_new_board)
      expect(the_new_board.check_for_availability(third_move.column, 0)).to eq false
      expect(the_new_board.check_for_availability(third_move.column, 1)).to eq false
    end
    it "will not add any chips to a completely filled column" do
      expect(third_move.identify_drop_position(the_new_board)).to eq true
      expect(fourth_move.identify_drop_position(the_new_board)).to eq true
      expect(fifth_move.identify_drop_position(the_new_board)).to eq true
      expect(sixth_move.identify_drop_position(the_new_board)).to eq true
      expect(seventh_move.identify_drop_position(the_new_board)).to eq true
      expect(eighth_move.identify_drop_position(the_new_board)).to eq true
      expect(ninth_move.identify_drop_position(the_new_board)).to eq false
    end
  end
end
