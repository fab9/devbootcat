require 'spec_helper'

describe Comment, :type => :model do
  context "migrations" do
    it { should have_db_column(:text) }
    it { should have_db_column(:author_id) }
  end

  context "model" do
    it { should belong_to(:author).class_name('User') }
  end
end
