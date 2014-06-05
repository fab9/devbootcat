require 'rails_helper'

RSpec.describe User, :type => :model do
  context "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email) }
    xit { should has_secure_password }
    # shoula-matchers wants have_secure_password ?
  end

  context "migrations" do
    it { should have_db_column(:email) }
    it { should have_db_column(:password_hash) }
  end
end

