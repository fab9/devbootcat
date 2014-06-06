require 'spec_helper'

describe PostsController do
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
        expect(response).to render_template(:new)
      end

      it "renders a flash notice"
    end
  end

end
