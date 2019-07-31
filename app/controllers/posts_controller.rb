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
      @post = Post.create(content: params[:content], title: params[:title], recipe: params[:recipe], user_id: current_user.id) 
      flash[:message] = "Blog post successfully created." if @post.id
      redirect to "/posts/#{@post.id}" 
    else 
      flash[:errors] = "Something went wrong - you must provide content for your post."
      redirect to '/posts/show' 
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
          redirect to "/posts/#{current_user.id}" 
        end 
      end 
         
     
     patch '/posts/:id' do 
       redirect_if_not_logged_in
       set_post
        if @post.user = current_user && params[:content] != "" 
          @post.update(content: params[:content]) 
          redirect "/posts/#{@post.id}" 
        else
          redirect "/users/#{current_user.id}" 
        end 
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