class PostsController < ApplicationController
  before_action :require_login, only: [:new]


  def index
    @posts = Post.all
  end

  def show
    @post = current_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = current_post
  end

  def update
    @post = current_post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated!"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Wrong parameters"
      render :edit
    end
  end

  private

  def current_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end


  def require_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end


end
