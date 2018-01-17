require 'rails_helper'

describe Comment do

  context "when the comment is created" do
    let(:product) {Product.create!(name: 'PES 18', description: 'Stunning football/sport game brought to you by Konami', image_url: 'PES18.jpg', category: 'Sport/Football', price: 39.9)}
    let(:user) {User.create!(first_name: 'Demo', last_name: 'User', email: 'demo@user.com', password: 'demouserpassword')}

    it "returns comemnt body exists but creation is not vaild, rating is blank" do
      expect(Comment.new(user: user, product: product, body: "Great FPS Game")).not_to be_valid
    end
    it "returns comemnt body exists but creation is not vaild, rating is numeric only" do
      expect(Comment.new(user: user, product: product, body: "Great FPS Game", rating: "Five Stars")).not_to be_valid
    end
  end
end
