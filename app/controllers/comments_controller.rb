class CommentsController < ApplicationController
   before_action :require_login, only: [:new, :create, :edit, :update]





  def new
    @comment = Comment.new
  end

	def create

 		@comment = Comment.new(text: params[:text], post_id: params[:post_id])
 		@comment.author = current_user

 		if @comment.save
        set_flash :success, object: @comment
    		# flash[:success] = "Post created!"
    		redirect_to :back
    end

	end


  private

  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end

  def require_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def verify_authorship
    redirect_to '/' unless @comment.author_id == current_user.id
  end

end
