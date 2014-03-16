Dir['./flowershop.rb'].map {|f| require f}
Dir['./spec/support/**/*.rb'].map {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
  config.include Lib::Models::ProductRangeHelper
end

