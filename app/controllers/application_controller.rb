require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "bakers_blog_app" 
    register Sinatra::Flash 
  end

  get "/" do 
    if logged_in? 
      redirect to "/users/#{@current_user}" 
    else 
    erb :welcome 
    end 
  end 
  
  helpers do 
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    
    def authorized_to_edit?(post)
      post.user == current_user
    end 
  
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end
    
    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end

  end 
end