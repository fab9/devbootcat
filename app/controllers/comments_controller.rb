class CommentsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = current_comment
    @comment.author_id = current_user.id

  end

  def create
    @comment = current_user.authored_comments.new(comment_params)
    # @post = current_post
    # @user = current_user
    # @comment = Comment.new(text: params[:text], post_id: params[:post_id])
    # @comment.author = current_user

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to :back
    else
      flash[:error] = "Something went wrong..."
      render :new
    end
  end

  def edit
    @comment = current_comment
    verify_authorship
    @post = current_post
  end

  def update
    @comment = current_comment
    verify_authorship
    @post = current_post
    if current_comment.update_attributes(comment_params)
      flash[:success] = "Comment updated!"
      redirect_to post_path(current_comment)
    else
      flash[:error] = "Something went wrong..."
      render 'edit'
    end
  end

  def destroy
    @comment = current_comment
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to :back
  end

  private

  def current_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def current_post
    current_comment.post
  end

  # def current_user
  #   current_comment.author
  # end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def require_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def verify_authorship
    redirect_to '/' unless current_comment.author.id == current_user.id
  end

end
