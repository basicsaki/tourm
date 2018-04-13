require "spec_helper"

RSpec.describe Print do

	before :each do 

		product_1 = Product.new(1,1,"book",12)
		product_2 = Product.new(2,1,"imported book",14)
		product_3 = Product.new(3,1,"icey",16)
		product_4 = Product.new(4,1,"qwerty",11) 
		
		product_1.sales_tax,product_1.price_after_tax = 5,20
		product_2.sales_tax,product_2.price_after_tax = 5,20
		product_3.sales_tax,product_3.price_after_tax = 5,20
		product_4.sales_tax,product_4.price_after_tax = 5,20

		
		products = [product_1,product_2,product_3,product_4]

		@print_obj = Print.new(products)
	end

	describe "#new" do
		it "should init a new print object" do
			expect(@print_obj).to be_an_instance_of(Print)
		end
	end

	describe "#total sales tax" do
		it "should calculate the total sales tax of all the products" do
			expect(@print_obj.total_sales_tax).to eq(20)
		end
	end

	describe "#total price" do
		it "should calculate the total price of all the products" do
			expect(@print_obj.total_price).to eq(80)
		end
	end


end