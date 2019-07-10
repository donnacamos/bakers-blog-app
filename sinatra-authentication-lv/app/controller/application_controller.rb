class ApplicationController < Sinatra::Base 
  config do 
    set :public_folder, 'public' 
    set :views, 'app/views' 
   # enable :sessions 
  #  set :session_secret, " "
  end 
  
  # test 
  get '/' do 
    "Hello, World!" 
  end 
  
end 