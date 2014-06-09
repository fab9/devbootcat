require 'spec_helper'

# describe "posts/index" do
#  post1 = FactoryGirl.create(:post, :title => "title1", :body => "body1")
#  post2 = FactoryGirl.create(:post, :title => "title2", :body => "body2")
#   it "displays title of post for all posts" do
#     assign(:posts, [post1, post2])
#     render
#     expect(rendered).to include("title1")
#     expect(rendered).to include("title2")
#   end

#   it "displays body of the post for all posts" do
#     assign(:posts, [post1, post2])
#     render
#     expect(rendered).to include("body1")
#     expect(rendered).to include("body2")
#   end
# end


describe "posts/show" do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    @post = create(:post, title: "This is a Post Title", body: "This is a Post Body", author_id: user.id)
    @comment = create(:comment, text: "What an awesome post!", post_id: @post.id, author_id: user.id )
  end


  it "displays title of the post" do
    visit post_path(@post)
    expect(page).to have_content("This is a Post Title")

  end

  it "displays body of the post" do
    visit post_path(@post)
    expect(page).to have_content("This is a Post Body")
  end

  it "displays the text for each comment" do
    visit post_path(@post)
    fill_in 'text', with: "What an awesome post!"
    click_button "Submit"
    expect(page).to have_content("What an awesome post!")
  end

  it "displays a new post button" do
    pending("Future Ajax")
    visit post_path(post)
    expect(page).to have_content("New Comment")
  end

  it "button appends a new comment form" do
    pending("Future Ajax")
  end

  it "appends a new comment upon submit" do
    pending("Future Ajax")
  end

end