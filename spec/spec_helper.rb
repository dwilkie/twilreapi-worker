$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require_relative 'support/dotenv'
require 'twilreapi/worker'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }
