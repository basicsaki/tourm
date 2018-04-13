class Algo
  attr_accessor :products	

	def initialize(products)
		@products = products
	end

	def run
		@products.each do |product|
			tax = Tax.new(product)
			product.sales_tax = tax.calculate_tax
			product.price_after_tax = product.quantity.to_i * (product.price + product.sales_tax)
		end
	end

end