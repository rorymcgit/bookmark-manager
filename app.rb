ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/helpers/dm_config'

class App < Sinatra::Base

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
    link = Link.new(title: params[:name], url: params[:url])
    tag = Tag.first_or_create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect('/links')
  end

  get '/tags/:given_tag' do
    @links = []
    Tag.all.each do |tag|
      if tag.links.tags[0].tag == params[:given_tag]
        @links << tag.links
      end
    end
    @links.flatten!

    # ONLY FILTERS FIRST TAG, AS tag BECOMES FIRST ITEM IN COLLECTION
    # tag = Tag.first(tag: params[:given_tag])
    # @links = tag ? tag.links : []
    erb(:links)
  end

end
