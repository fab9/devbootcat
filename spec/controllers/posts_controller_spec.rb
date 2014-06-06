require 'spec_helper'

describe PostsController do

	describe "GET #show" do
		let(:post) { build(:post) }

		it "assigns the requests post to @post" do
			get :show, id: post
			assigns(:post).should eq(post)
		end

		it "renders the :show view" do
			get :show, post
			response.should render_template :show
		end
	end

end
