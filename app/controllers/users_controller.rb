class UsersController < ApplicationController
  # What routes do I need for login? 
  get '/login' do 
    erb :'/users/login'  
  end 
  
  post '/login' do 
    # find the user 
    @user = User.find_by(email: params[:email]) 
    # authenticate the user 
    if @user && @user.authenticate(params[:password]) 
      # log the user in 
      session[:user_id] = @user.id 
      # redirect to the user's landing page 
      flash[:message] = "Welcome, #{@user.name}!"
      redirect "users/#{@user.id}"
    else
      flash[:message] = "Your credientials were invalid. Please sign up or try again." 
      redirect to '/login' 
    end 
  end 
  
  get '/signup' do 
    erb :'/users/signup'  
  end 
  
  post '/users' do 
       @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id 
        flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
        redirect "/users/#{@user.id}"
      else 
       flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
       redirect '/signup' 
    end
  end 
  
  # SHOW route 
  get '/users/:id' do 
    
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'/users/show'
  end 
  
  get '/logout' do 
    session.clear 
    redirect '/'
  end 
end 