require 'spec_helper'

describe Post, :type => :model do
  context "migration" do
     it { should have_db_column(:author_id) }
     it { should have_db_column(:title) }
     it { should have_db_column(:body) }

  end

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should belong_to(:author).class_name('User') }
  end

  context "liking" do
    it "can be liked" do
      post = Post.create(title: "woo", body: "meh")
      expect { post.likes.create }.not_to raise_error
    end
  end
end
