require 'spec_helper'

feature "User creating a Post" do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  # it "can access the post creation page from the user dashboard" do
  #   visit '/'
  #   expect(page).to have_link("New Post")
  #   click_link("New Post")
  #   expect(page).to have_content("New Post")
  # end

  it "sees the post creation form" do
    visit new_post_path
    expect(page).to have_content("New Post")
    expect(page).to have_content("Post Title:")
    expect(page).to have_content("Post Content:")
    expect(page).to have_button("Create Post")
  end

  it "can create a post" do
    visit new_post_path
    fill_in 'Post Title', with: "New Post"
    fill_in 'Post Content', with: "Kate Upton's body"
    click_button('Create Post')

    expect(page).to have_content("New Post")
    expect(page).to have_content("Kate Upton's body")
    expect(page).to have_content("Comments")
  end
end