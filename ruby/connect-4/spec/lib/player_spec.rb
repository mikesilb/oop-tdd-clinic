require "spec_helper"

RSpec.describe Player do
  let(:john) { Player.new("John", 12, 8.5, 21) }
  let(:computer) {Player.new("MyMacComputer", 3, 9.99, 21) }

  describe "player" do
    it "defines player by name, age, skill_level, and the number of chips remaining" do
      expect(john.name).to eq "John"
      expect(john.age).to eq 12
      expect(john.skill_level).to eq 8.5
      expect(john.num_chips_remain).to eq 21
      expect(computer.name).to eq "MyMacComputer"
      expect(computer.age).to eq 3
      expect(computer.skill_level).to eq 9.99
      expect(computer.num_chips_remain).to eq 21
    end
  end

  describe "#decrease_chips" do
    it "decrease the number of remaining chips by one" do
      john.decrease_chips
      expect(john.num_chips_remain).to eq 20
      computer.decrease_chips
      expect(computer.num_chips_remain).to eq 20
      3.times { john.decrease_chips }
      expect(john.num_chips_remain).to eq 17
    end
  end
end
