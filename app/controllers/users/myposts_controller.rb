################
 def my_posts
   @posts= Post.all
   @myposts = Post.where("current_user = ALL(author_id)")
 end
