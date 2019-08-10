require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bakers_blog_app" 
    register Sinatra::Flash 
  end

  get "/" do 
    if logged_in? 
      redirect to "/users/#{current_user.id}"  
    else 
    erb :welcome 
    end 
  end 
  
  helpers do 
    
    def redirect_if_not_authorized 
        if @post.user == current_user && params[:content] != "" 
          @post.update(content: params[:content]) 
          redirect "/posts/#{@post.id}" 
        else
          redirect "/users/#{current_user.id}" 
        end 
         # post doesn't belong to the current user send them to their home page
      end 
    
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
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