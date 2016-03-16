require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
			@product = Product.create!(name: "ghost pepper")
			@user = FactoryGirl.build(:user)
			@product.comments.create!(rating: 3, user: @user, body: "Too spicy for me!")
			@product.comments.create!(rating: 5, user: @user, body: "Loved this pepper! I only recommend it if you love spicy food")
			@product.comments.create!(rating: 1, user: @user, body: "Set my mouth on fire for days")
		end
	
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid" do
			expect(Product.new(description: "extremely spicy!")).not_to be_valid	
		end
	end 
end 