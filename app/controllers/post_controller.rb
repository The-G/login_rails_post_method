class PostController < ApplicationController
  def index
    @post = Post.all
  end

  def new

  end

  def create
    title = params[:title]
    content = params[:content]
    Post.create(
      user_id: session[:user_id],
      title: title,
      content: content
      )
      
    redirect_to '/'
  end

  def show
    @id = params[:id]
    @title = Post.find(@id).title
    @content = Post.find(@id).content
    
    @comments = Comment.where(:post_id => @id)
  end
  
  def destroy
    @id = params[:id]
    Post.find(@id).destroy  
    redirect_to '/'

  end
  
  def modify
    @post = Post.find(params[:id])
  end
  
  def update
    id = params[:id]
    title = params[:title]
    content = params[:content]
    Post.find(id).update(
      title: title,
      content: content
      )
      
    redirect_to "/post/show/#{id}"
  end
  
  def create_comment
    @comment = params[:comment]
    Comment.create(
      user_id: session[:user_id],
      post_id: params[:post_id],
      content: @comment
      )
    
    redirect_to :back
  end
  

end
