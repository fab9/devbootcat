require 'spec_helper'

describe HomeController do

  login_user
  it "renders the index template" do
    get 'index'
    expect(response).to render_template(:index)
  end


  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end


end
