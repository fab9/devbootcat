require 'spec_helper'

describe PostsController do

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
      post1 = FactoryGirl.create(:post, :title => "title1", :body => "body1")
      post2 = FactoryGirl.create(:post, :title => "title2", :body => "body2")
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])

    end

  end
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

  describe "GET #new" do
    it "renders the #new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "vith valid attributes" do
      it "creates a new post" do
        expect {
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "redirects to the new post" do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to Post.last
      end
    end

    context "with invalid attributes" do
      it "does not create a new post" do
        expect {
          post :create, post: attributes_for(:invalid_post)
        }.to change(Post, :count).by(0)
      end

      it "re-renders the new method" do
        post :create, post: attributes_for(:invalid_post)
        expect(response).to render_template :new
      end

      it "renders a flash notice"
    end
  end

  describe "GET #edit" do
    let(:post) { create(:post) }

    it "assigns the requests post to @post" do
      get :show, id: post
      assigns(:post).should eq(post)
    end

    it "renders the edit view" do
      get :edit, id: post
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    before :each do 
      @post = create(:post, title: "Lorem", body: "Ipsum") 
    end

    context "with valid attributes" do
      it "locates the requested post" do
        put :update, id: @post, post: attributes_for(:post)
        expect(assigns(:post)).to eq(@post)
      end

      it "changes @post's attributes" do
        put :update, id: @post, post: attributes_for(:post, title: "new title", body: "new body")
        @post.reload
        expect(@post.title).to eq("new title")
        expect(@post.body).to eql("new body")
      end

      it "sets the flash[:notice]" do
        put :update, id: @post, post: attributes_for(:post)
        subject.should set_the_flash[:notice].to("Post updated!")
      end

      it "redirects to the updated post" do
        put :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to(@post)
      end
    end

    context "with invalid attributes" do
      it "locates the requested post" do
        put :update, id: @post, post: attributes_for(:invalid_post)
        expect(assigns(:post)).to eq(@post)
      end

      it "does not change @post's attributes" do
        put :update, id: @post, post: attributes_for(:invalid_post, title: "new title", body: nil)
        @post.reload
        expect(@post.title).not_to eq("new title")
        expect(@post.body).to eq("Ipsum")
      end

      it "sets the flash[:notice]" do
        put :update, id: @post, post: attributes_for(:invalid_post)
        subject.should set_the_flash[:notice].to("Wrong parameters")
      end

      it "re-renders the edit template" do
        put :update, id: @post, post: attributes_for(:invalid_post, title: "new title", body: nil)
        expect(response).to render_template(:edit)
      end
    end

  end

 


end
