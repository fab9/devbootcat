class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]


  def index
    @posts = Post.all
  end

  def show
    @post = get_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      set_flash :success, object: @post
      redirect_to post_path(@post)
    else
      set_flash :error, object: @post
      render :new
    end
  end

  def edit
    @post = get_post
    verify_authorship
  end

  def update
    @post = get_post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated!"
      # set_flash :success, object: @post
      redirect_to post_path(@post)
    else
      set_flash :error, object: @post
      # flash[:notice] = "Wrong parameters"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'

  end


  private

  def get_post
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

  def verify_authorship
    redirect_to '/' unless @post.author_id == current_user.id
  end

end
