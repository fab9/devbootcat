class PostsController < ApplicationController

	def show
		@post = Post.find_by_id(params[:id])
		render :action => "show"
	end

end
