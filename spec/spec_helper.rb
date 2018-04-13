require "bundler/setup"
require "tourm"

require_relative "./../lib/tourm/algo.rb"
require_relative "./../lib/tourm/parser.rb"
require_relative "./../lib/tourm/print.rb"
require_relative "./../lib/tourm/product.rb"
require_relative "./../lib/tourm/tax.rb"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
