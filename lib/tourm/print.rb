class Print

	def initialize(products)
		@products = products
	end

	def total_price
		@products.map{|a| a.price_after_tax}.inject(0,:+)
	end

	def total_sales_tax
		@products.map{|a| a.sales_tax}.inject(0,:+)
	end

	def print_statement
		@products.each do |p|
			puts "#{p.quantity},#{p.name},#{p.price_after_tax.round(2)}"
		end
		puts "Sales Taxes: #{self.total_sales_tax.round(2)}"
		puts "Total: #{self.total_price.round(2)}"
	end

end