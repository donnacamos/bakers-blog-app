class UsersController < ApplicationController
  # What routes do I need for login? 
  get '/login' do 
    erb :login 
  end 
  
  post '/login' do 
    # find the user 
    @user = User.find_by(email: params[:email]) 
    # authenticate the user 
    if @user.authenticate(params[:password]) 
    # log the user in 
    session[:user_id] = @user.id 
    # redirect to the user's landing page 
    puts session 
    redirect to "users/#{:user_id}" 
    else
      
    end 
  end 
  
  get '/signup' do 
    erb :signup 
  end 
  
  post '/users' do 
    if params[:name] != "" && params[:email] != "" && params[:password] != "" 
      @user = User.create[:params] 
      redirect to "/users/#{@user.id}"
    else 
    
    end
  end 
  
  # SHOW route 
  get '/user/:id' do  
    erb :'/users/show'
  end 
end 