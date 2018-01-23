require 'rails_helper'

describe User do
  # when replacing let with instance variable, instance variable must exist in (before do) block
  before do
    # let(:user) { FactoryBot.build(:user) }
    # let(:invalid_email_user) { FactoryBot.build(:invalid_email_user) }
    # let(:admin) { FactoryBot.build(:admin) }
    @user =  FactoryBot.build(:user)
    @invalid_email_user = FactoryBot.build(:invalid_email_user)
    @admin =  FactoryBot.build(:admin)
  end

  context "first and last name present" do
    it "should return first and last names" do
      expect(@user.full_name).to eq "valid user"
    end
  end

  context "when user signs up" do
    it "returns creation failed, email must be exist " do
      expect(@invalid_email_user).not_to be_valid
    end
    it "returns creation failed, email must has valid regex format " do
      expect(@invalid_email_user).not_to be_valid
    end
  end

  context "admin user has an admin flag true" do
    it "should return true to admin flag" do
      expect(@admin.admin?).to eq true
    end
  end
end
