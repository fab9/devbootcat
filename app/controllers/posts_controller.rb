class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id]) 
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated!"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Wrong parameters"
      render :edit
    end
  end



  def post_params
    params.require(:post).permit(:title, :body)
  end

end
