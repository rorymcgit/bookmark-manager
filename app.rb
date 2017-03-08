require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

end
