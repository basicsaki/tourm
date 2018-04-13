class Tax

	class << self
		def sales_tax
			0.10
		end

		def import_duty
			0.05
		end

		def both_tax
			0.15
		end
	end
	
	def initialize(product)
		@product = product
	end

	def calculate_tax
		if @product.exempt == true && @product.imported == true
			tax = @product.price*Tax.import_duty
		elsif @product.exempt == false && @product.imported == true
			tax = @product.price*Tax.both_tax
		elsif @product.exempt == false && @product.imported == false
			tax = @product.price*Tax.sales_tax
		end
		
		return format_tax(tax)  
	end

	def format_tax(tax)
		factor = 1/0.05
		tax = 0.0 if tax.nil?
		new_tax = (((tax*factor).ceil)/factor)
		return new_tax
	end

=begin
	def calculate_import_duty
		return @product.imported == true ? (@product.price*Tax.import_duty) : 0
	end

	def calculate_both_tax
		return @product.imported == true ? (@product.price*Tax.both_tax) : 0
	end
=end

end