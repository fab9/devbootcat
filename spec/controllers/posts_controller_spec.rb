require 'spec_helper'

describe PostsController do

	describe "GET #show" do

		it "assigns the requests post to @post" do
			post = build(:post)
			get :show, id: post
			assigns(:post).should eq(post)
		end

		it "renders the :show view" do
			get :show, build(:post)
			response.should render_template :show
		end
	end

end
