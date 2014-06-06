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