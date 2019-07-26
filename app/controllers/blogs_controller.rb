class Blogs < ApplicationController 
  
  # get posts/new 
  
   get '/posts/new' do 
     erb :'/posts/new' 
   end 
   
   post '/posts' do 
    raise params.inspect 
    
    
    if !logged_in
      redirect to '/'
    end 
    
    if params[:posts] != ""
      @post = Post.create(posts: params[:posts], recipes: params[:recipes], user_id: current_user.id) 
      redirect to '/posts/#{@post.id}' 
    else 
      
    end 
   end
   
end 