class Post < ActiveRecord::Base
  # validates :title, presence: true
  # validates :body, presence: true
  has_many :likes, as: :likable
  has_many :comments
  has_many :commenters, through: :comments, source: :author_id
  belongs_to :author, class_name: "User"
end
