require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/links' do
    erb(:links)
  end

end
