require 'bundler'
require 'sinatra/base'

Dir[File.dirname(__FILE__) + "/app/routes/**"].each do |route|
  require route
end

class Server < Sinatra::Base
  configure do
    # Load up database and such
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end
end
