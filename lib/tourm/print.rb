
class Print

	def initialize(products)
		@products = products
	end

	def print_statement
		total_price = @products.map{|a| a.price_after_tax}.inject(0,:+)
		sales_tax = @products.map{|a| a.sales_tax}.inject(0,:+)

		@products.each do |p|
			puts "#{p.quantity},#{p.name},#{p.price_after_tax.round(2)}"
		end
		puts "Sales Taxes: #{sales_tax.round(2)}"
		puts "Total: #{total_price.round(2)}"
	end

end