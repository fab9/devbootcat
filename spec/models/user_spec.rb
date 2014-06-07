require 'spec_helper'

describe User, :type => :model do

  let :user do
    build :user
  end

  subject do
    user
  end


  context "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email) }
  end

  context "migrations" do
    it { should have_db_column(:email) }
  end
end

