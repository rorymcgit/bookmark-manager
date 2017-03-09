require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

  ENV['RACK_ENV'] = 'development'

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(title: params[:name], url: params[:url])
    tag = Tag.new(tag: params[:tag])
    link.tags << tag
    link.save
    redirect('/links')
  end

  get '/tags/:given_tag' do
    tag = Tag.first(tag: params[:given_tag])
    @links = tag ? tag.links : []
    erb(:links)
  end

end
