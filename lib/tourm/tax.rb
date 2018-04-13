class Tax

	SALES_TAX,IMPORT_DUTY,BOTH_TAX = 0.10,0.05,0.15
	
	def initialize(product)
		@product = product
	end

	def calculate_tax
		if @product.exempt == true && @product.imported == true
			tax = @product.price*Tax::IMPORT_DUTY
		elsif @product.exempt == false && @product.imported == true
			tax = @product.price*Tax::BOTH_TAX
		elsif @product.exempt == false && @product.imported == false
			tax = @product.price*Tax::SALES_TAX
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