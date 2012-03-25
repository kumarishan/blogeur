%w{
  rubygems
  sinatra
  active_record
}.each { |r| require r }

require './lib/blog.rb'

configure do
  enable :logging
  set :public_folder, File.dirname(__FILE__) + '/public'
  # set :static_cache_control, [:public, :max_age => 300]
end

#show the default dashboard of the application

get '/' do
  # blog = Blog.new
  @user = Blog.getUser
  @spaces = Blog.getSpaces

  haml :index, :format => :html5 
end

# get all the spaces of the user.

get '/space/:space_id' do 
  # blog = Blog.new
  @space =  Blog.getSpace(params[:space_id])
  haml :space, :format => :html5
end

get '/space/:space_id/posts'  do 
  # blog = Blog.new
  @space = Blog.getSpace(params[:space_id])
  haml :posts, :format => :html5
end
