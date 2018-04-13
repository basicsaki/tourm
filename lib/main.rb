require ("./tourm/parser.rb")
require ("./tourm/algo.rb")
require ("./tourm/print.rb")

parsed_data = Parser.new(ARGV[0])
parsed_data.process_data

new_obj = Algo.new(parsed_data.products)
new_obj.run

details = Print.new(new_obj.products)
details.print_statement

=begin
v_data = ValidateData.new(parsed_data.processed_data)

validated_data = v_data.validate_data
v_data.stats_and_check_validations

if v_data.errors.length != 0
	puts "Please fix these errors below first \n"
	puts v_data.errors
else
	obj = Algo.new(validated_data)
	obj.algo
	obj.prepare_final_data
	print_obj = Print.new(obj.sorted_data)
	print_obj.print_output
	puts print_obj.print_arr
end
=end
