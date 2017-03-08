require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

  get '/' do
    "Bookmark Manager Extraordinaire"
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new)
  end

  post '/links' do
    Link.create(title: params[:name], url: params[:url])
    redirect('/links')
  end

end
