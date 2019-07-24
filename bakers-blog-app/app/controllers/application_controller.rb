require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "bakers_blog_app" 
  end

  get "/" do 
    erb :welcome  
  end 

end
