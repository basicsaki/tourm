require "spec_helper"

RSpec.describe Tax do

	before :each do 
		@exempted_product = Product.new(1,1,"book",12)
		@imported_product = Product.new(1,1,"imported remote",14)
		@exempted_imported_product = Product.new(1,1,"imported book",14)
		@non_exempted_product = Product.new(1,1,"headphones",16)
		@non_exempted_imported_product = Product.new(1,1,"imported book",18)
	end

	describe "#new" do
		it "should init a new tax"  do
			tax = Tax.new(@exempted_product)
			expect(tax).to be_an_instance_of(Tax)
		end
	end

	describe "#calculate_tax" do
		it "should calculate the sales tax for exempted product"  do
			tax = Tax.new(@exempted_product)
			calculated_tax = tax.calculate_tax
			expect(calculated_tax).to eq(0)
		end

		it "should calculate the sales tax for the imported product"  do
			tax = Tax.new(@imported_product)
			calculated_tax = tax.calculate_tax
			expect(calculated_tax).to eq(2.1)
		end

		it "should calculate the sales tax for the non exempted product"  do
			tax = Tax.new(@exempted_imported_product)
			calculated_tax = tax.calculate_tax
			expect(calculated_tax).to eq(0.75)
		end

		it "should calculate the sales tax for non exempted imported product"  do
			tax = Tax.new(@non_exempted_product)
			calculated_tax = tax.calculate_tax
			expect(calculated_tax).to eq(1.6)
		end

		it "should calculate the sales tax for the exempted imported product"  do
			tax = Tax.new(@non_exempted_imported_product)
			calculated_tax = tax.calculate_tax
			expect(calculated_tax).to eq(0.9)
		end

	end

	describe "#format_tax" do
		it "format value of a text to 2 digits"  do
			value = 1.2333
			tax = Tax.new(@exempted_product).format_tax(1.233)
			expect(tax).to eq(1.25)
		end
	end

end