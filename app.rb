ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/helpers/dm_config'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    @user = User.new
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
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(tag: tag)
    end
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
    erb(:links)
  end

  post '/' do
    @user = User.new( email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb(:index)
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
