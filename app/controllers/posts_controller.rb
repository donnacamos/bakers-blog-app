class PostsController < ApplicationController 
  
  get '/posts' do 
    @posts = Post.all 
    erb :'/posts/index' 
  end 
  
  # get posts/new 
  
   get '/posts/new' do 
     redirect_if_not_logged_in
     erb :'/posts/new' 
   end 
   
   post '/posts' do 
     redirect_if_not_logged_in
    if params[:content] != ""
      @post = Post.create(content: params[:content], user_id: current_user.id, title: params[:title], recipe: params[:recipe])  
      flash[:message] = "Blog post successfully created." if @post.id
      redirect to "/posts/#{@post.id}" 
    else 
      flash[:errors] = "Something went wrong - you must provide content for your post."
      redirect to '/posts/new' 
    end 
  end 
    
    get '/posts/:id' do  
      set_post  
      erb :'/posts/show'   
    end 
  
   
  get '/posts/:id/edit' do
    redirect_if_not_logged_in
    set_post 
    if authorized_to_edit?(@post)
      erb :'/posts/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end
         
     
     patch '/posts/:id' do 
       redirect_if_not_logged_in
       set_post
       redirect_if_not_authorized 
     end 
     
     delete '/posts/:id' do 
       set_post 
       if authorized_to_edit?(@post)
         @post.destroy
         flash[:message] = "Successfully deleted that post."
         redirect to '/posts'  
       else 
         redirect to '/posts' 
       end 
     end 
     
     private 
     
     helpers do 
     
     def set_post 
       @post = Post.find(params[:id])
     end 
   end 
end 