require "spec_helper"

RSpec.describe UserAccountValidator do
  let(:user1) { UserAccountValidator.new({
    email: "jack@be_nimble.com",
    username: "JackBN",
    name: "jackbn"
  }) }
  let(:user2) { UserAccountValidator.new({
    email: "john@be_quick.com",
    name: "johnbq"
  }) }
  let(:user3) { UserAccountValidator.new({
    username: "JimCandlestick",
    name: "jimCS"
  }) }
  let(:user4) { UserAccountValidator.new({
    email: "moe_from_3Stooges",
    username: "moehoward",
    name: "Moe Howard"
  }) }
  let(:user5) { UserAccountValidator.new({
    email: "Curley@from_3Stooges",
    username: "curleyhoward",
  }) }


  describe "UserAccountValidator" do
    it "will not raise an error when all conditions are met" do
      expect {user1}.to_not raise_error
    end
    it "will raise an error when email is absent" do
      expect {user2}.to raise_error(MissingUsernameError)
    end
    it "will raise an error when username is absent" do
      expect {user3}.to raise_error(MissingEmailError)
    end
    it "will raise an error when email lacks a @ symbol" do
      expect {user4}.to raise_error(MissingAtSymbolError)
    end
    it "will not raise an error when name is absent" do
      expect {user5}.to_not raise_error
    end
  end
end
