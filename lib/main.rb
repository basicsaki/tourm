require ("./tourm/parser.rb")
require ("./tourm/algo.rb")
require ("./tourm/print.rb")

parsed_data = Parser.new(ARGV[0])
parsed_data.process_data

new_obj = Algo.new(parsed_data.products)
new_obj.run

details = Print.new(new_obj.products)
details.print_statement
