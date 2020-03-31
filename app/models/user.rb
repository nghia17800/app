class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_secure_password

  def feed
    @post = Post.all
  end
end
