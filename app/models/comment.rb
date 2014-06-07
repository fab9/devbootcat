class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :text, presence: true
  has_many :likes, as: :likable
end
