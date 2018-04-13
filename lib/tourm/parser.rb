require ("./tourm/product.rb")

class Parser

	attr_accessor :data,:products

	#initialize a new conference settings
	def initialize(path = "")
		path = "" if path.nil?
		data = File.open(path,"r"){|f| f.read} if File.exists?(path)
		@data = data.nil? ? mock_data : data
	end

	#incase data is not provided when the operation is called
	def mock_data
		puts "Failsafe. Using mock data as no data is provided or the file path is not a complete file path or file does not exist"
		data = File.open("./tourm/input/input_3.txt","r+") do |f|
			f.read
		end 
		return data
	end

	def process_data
		arr = data.split("\n")
		arr.shift
		@products = []
		arr.each_with_index do |string,a|
			ar = string.split(",")
			product = Product.new(a,ar[0],ar[1],ar[2])
			@products << product
		end
	end

end