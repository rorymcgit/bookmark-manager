require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

  ENV['RACK_ENV'] = 'development'

  get '/' do
    "Bookmarker Extraordinaire"
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Link.create(title: params[:name], url: params[:url])
    redirect('/links')
  end

end
