class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  has_many :likes, as: :likable
  belongs_to :author, class_name: "User"
end
