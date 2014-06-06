require 'spec_helper'

describe "posts/index" do
 post1 = FactoryGirl.create(:post, :title => "title1", :body => "body1")
 post2 = FactoryGirl.create(:post, :title => "title2", :body => "body2")
  it "displays title of post for all posts" do
    assign(:posts, [post1, post2])
    render
    expect(rendered).to include("title1")
    expect(rendered).to include("title2")
  end

  it "displays body of the post for all posts" do
    assign(:posts, [post1, post2])
    render
    expect(rendered).to include("body1")
    expect(rendered).to include("body2")
  end
end



describe "posts/show" do
 
  let!(:post) { create(:post,  title: "Title", body: "This is a Post Body") }

  it "displays title of the post" do
    visit post_path(post)
    expect(page).to have_content("Title")

  end








  # it "displays body of the post" do
  #   assign(post)
  #   render
  #   expect(rendered).to include("This is a Post Body")
  # end

  it "displays the text for each comment" do
    pending
  end

  it "displays a new post button" do
    pending
  end

  it "button appends a new comment form" do
    pending
  end

  it "appends a new comment upon submit" do
    pending
  end

end