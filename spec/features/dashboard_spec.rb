require 'spec_helper'

feature "User Dashboard/Home Page" do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it "can see all the posts" do
    create(:post, title: "Muder in Chinatow", body: "Kate Beckinsale")
    create(:post, title: "Raining women in Thailand", body: "Kate Upton")
    
    visit '/'
    expect(page).to have_content("Muder in Chinatow")
    expect(page).to have_content("Raining women in Thailand")
    
  end
end