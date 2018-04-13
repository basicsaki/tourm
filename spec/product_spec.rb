require "spec_helper"

RSpec.describe Product do

	before :each do 
		@product = Product.new(1,1,"book",12)
		@imported_product = Product.new(1,1,"imported remote",14)
	end

	describe "#new" do
		it "should init a new product" do
			expect(@product).to be_an_instance_of(Product)
		end

		it "should have the attributes id,quantity,name and price" do
			  expect(@product).to have_attributes(:id => 1, :price => 12, :name=> "book",:quantity => 1)
		end

		it "should check if an object is imported or not" do
			expect(@product).to have_attributes(:imported => false)
			expect(@imported_product).to have_attributes(:imported => true)
		end

		it "should check if the product is exempt from list or not" do
			expect(@product).to have_attributes(:exempt => true)
			expect(@imported_product).to have_attributes(:exempt => false)
		end
	end

	describe "#check_imported" do
		it "should correctly check for inport property"  do
			expect(@product).to have_attributes(:imported => false)
			expect(@imported_product).to have_attributes(:imported => true)
		end
	end

	describe "#check_exempt" do
		it "should correctly check for exempt property"  do
			expect(@product).not_to have_attributes(:exempt => false)
			expect(@imported_product).not_to have_attributes(:exempt => true)
		end
	end

end