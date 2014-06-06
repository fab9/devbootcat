require 'spec_helper'

describe PostsController do
  describe "GET #show" do
    let(:post) { create(:post) }

    it "assigns the requests post to @post" do
      get :show, id: post
      assigns(:post).should eq(post)
    end

    it "renders the :show view" do
      get :show, id: post
      expect(response).to render_template :show
    end
  end


  describe "GET #index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Post.create!(title: "title", body: "body"), Post.create!(title: "title", body: "body") #can't get factory girl to work for more than one object
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    end

  end
end
