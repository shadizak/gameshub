require 'rails_helper'

describe User do

  context "first and last name present" do
    let(:user) { User.new(first_name: "Mohammed", last_name: "Manahi") }
    it "should return first and last names" do
      expect(user.full_name).to eq "Mohammed Manahi"
    end
  end

  context "when user signs up" do
    it "returns creation failed, email must be exist " do
      expect(User.new(first_name: "Mohammed", last_name: "Manahi", email: nil, password: "123456")).not_to be_valid
    end
    it "returns creation failed, email must has valid regex format " do
      expect(User.new(first_name: "Mohammed", last_name: "Manahi", email: "m.manahi", password: "123456")).not_to be_valid
    end
  end
end
