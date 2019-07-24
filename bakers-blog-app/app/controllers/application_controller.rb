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
<<<<<<< HEAD
  
  helpers do 
    
    def logged_in?
      !!current_user 
    end 
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end 
  end 
=======
>>>>>>> 2feeca4d574e437c37bd448ce0427f233d6556b4

end
