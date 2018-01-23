require 'rails_helper'

describe Product do

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @product.comments.create!(rating: 5, user: @user, body: "Great Game!")
    @product.comments.create!(rating: 3, user: @user, body: "Not Bad!")
    @product.comments.create!(rating: 1, user: @user, body: "Very Bad Game!")
  end

  context "when the product has comments" do
    it "returns the average rating of all comments" do
      # average_rating method in product model uses the built-in average method in active record directly without using any scope in comment model.
      expect(@product.average_rating).to eq 3
    end
    it "returns the highest rating of all comments" do
      # highest_rating_comment method in product model uses scope in comment model that fetchs a collection of first highest rating, so there is a need to pass (rating) column in expect method after calling the scope.
      expect(@product.highest_rating_comment.rating).to eq 5
    end
    it "returns the lowest rating of all comments" do
      # lowest_rating_comment method in product model uses scope in comment model that fetchs a collection of first lowest rating, so there is a need to pass (rating) column in expect method after calling the scope.
      expect(@product.lowest_rating_comment.rating).to eq 1
    end
  end


  context "when the product is created" do
    it "returns product name exists but creation is not vaild, some paramters are invalid or blank" do
      expect(Product.new(description: "PES 18")).not_to be_valid
    end
    it "returns product paramters exist but minimum charcters for product description are not met" do
      expect(Product.new(name: 'CoD WWII', description: 'Call of Duty', image_url: 'CoDWWII.jpg', category: 'FPS/Action', price: 59.9)).not_to be_valid
    end
    it "returns product paramters exist but image format is invalid" do
      expect(Product.new(name: 'GTA IV', description: 'Grand Theft Auto V is an action-adventure video game developed by Rockstar North and published by Rockstar Games', image_url: 'GTAV', category: 'FPS/Action', price: 79.9)).not_to be_valid
    end
    it "returns product paramters exist but price amount is invalid" do
      expect(Product.new(name: 'Battlefield 1', description: 'Battlefield 1 is a first-person shooter video game developed by EA DICE and published by Electronic Arts.', image_url: 'battlefield1.jpg', category: 'FPS/Action', price: -0.9)).not_to be_valid
    end
  end
end
