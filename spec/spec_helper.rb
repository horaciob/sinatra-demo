ENV['RACK_ENV'] = 'test'
require 'bundler'
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment) 
require 'simplecov'
SimpleCov.start

require File.expand_path '../../server.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
  #def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
