require_relative ("./tax.rb")

class Product

	attr_accessor :id,:quantity,:name,:price,:exempt,:imported,:sales_tax,:import_duty,:price_after_tax

	def initialize( id = nil, quantity = nil, name = nil, price = nil )
		@id = id
		@quantity = quantity
		@name = name
		@price = price.to_f
		@imported = check_imported
		@exempt = check_exempt
		@sales_tax,@import_duty,@price_after_tax = 0,0,0
	end

	def check_imported
		self.name.index(/imported/).nil? ?  false : true
	end

	def check_exempt
		keywords = Product.food_category_keywords + Product.medicine_category_keywords + Product.book_category_keywords 
		( self.name.split(" ") & keywords )==[] ? false : true  
	end

	class << self

	def food_category_keywords
		["chocolate","chocolates"]
	end

	def medicine_category_keywords
		["pills"]
	end

	def book_category_keywords
		["book"]
	end

	end
end