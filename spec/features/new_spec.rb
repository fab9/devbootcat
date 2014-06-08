require 'spec_helper'

feature "User creating a Post" do
  it "sees the post creation from" do
    visit new_post_path
    expect(page).to have_content("New Post")
    expect(page).to have_content("Title:")
    expect(page).to have_content("Body:")
  end
end