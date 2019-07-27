class Posts < ApplicationController 
  
  get '/posts' do 
    @post = Post.all 
    erb :'/posts/index' 
  end 
  
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
      @post = Post.create(posts: params[:content], recipes: params[:recipes], user_id: current_user.id) 
      redirect to '/posts/#{@post.id}' 
    else 
      redirect to '/posts/show' 
    end 
    
    get '/posts/:id' do  
      set_post  
      erb :'/posts/show'   
    end 
   end
   
     get '/posts/:id/edit' do 
       set_post 
       if logged_in?
         if @post.user = current_user 
           erb :'/posts/edit' 
         else
           redirect to '/posts/#{current_user.id}'
       else 
         redirect to '/'
       end 
     end 
         
     end 
     
     patch '/posts/:id' do 
       set_post
      if logged_in?
         if @post.user = current_user 
           erb :'/posts/edit' 
         else
           redirect to '/posts/#{current_user.id}'
       else 
         redirect to '/'
       end  
     end 
     
     get set_post 
       @post = Post.find(params[:id])
     end 
   
end 