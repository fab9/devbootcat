class User < ActiveRecord::Base
    # validates :email, presence: true, uniqueness: true
    has_many :authored_posts, class_name: "Post", foreign_key: :author_id
    has_many :authored_comments, class_name: "Comment", foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
