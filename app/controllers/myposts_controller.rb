class MyPostsController < ApplicationController

 def index
   @posts= Post.all
   @myposts = Post.where("current_user = ALL(author_id)")
 end

end
