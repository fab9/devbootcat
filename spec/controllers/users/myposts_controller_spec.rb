# Tests to check your controllers are called *functional tests*. When you tested your models, 
# you didn’t test them in the context of the web application—there were no web requests and
# responses nor were there any URLs to contend with. 
# This focused approach lets you hone in on the specific functionality of the model and test it in isolation.


 #look for my posts button
# looks for new posts button
# look for user's name + "Posts"
# look for list of user's posts

# context "when there are no posts" do
#   subject { get :index }
#   it "assigns @locations" do
#     subject
#     assigns(:locations).should eq([])
#   end
# end # / when there are no posts