ENV['RACK_ENV'] = 'test'
require("rspec")
require("sinatra/activerecord")
require("product")

require("pg")

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
  end
end
