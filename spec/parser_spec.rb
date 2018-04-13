require "spec_helper"

RSpec.describe Parser do

	before :each do 
		@parsed_data = Parser.new
		@parsed_data.process_data
	end

	describe "#new" do
		it "initial data should not be nil"  do
			expect(@parsed_data.data).not_to be_nil	
		end

		it "should load up initial data as a String"  do
			expect(@parsed_data.data).to be_an_instance_of(String)
		end
	end

	describe "#mock_data" do
		it "should load up mock data from a default file"  do
			mock_data = Parser.new.mock_data
			expect(mock_data).not_to be_empty
			expect(mock_data).to be_an_instance_of(String)
		end
	end

	describe "#process_data" do
		it "should process the data as an array"  do
			expect(@parsed_data.products).to be_an_instance_of(Array)
		end

		it "each data element should be an object of product"  do
			expect(@parsed_data.products.first).to be_an_instance_of(Product)
		end
	end

end