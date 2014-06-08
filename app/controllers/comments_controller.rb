class CommentsController < ApplicationController

	def create
	
 		@comment = Comment.new(text: params[:text], post_id: params[:post_id])
 		@comment.author = current_user
 		
 		if @comment.save
    		# flash[:success] = "Post created!"
    		redirect_to :back
    	end

	end

end
