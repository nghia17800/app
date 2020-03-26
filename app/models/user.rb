class User < ApplicationRecord
  has_many :post, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def feed
    @post = Post.all
  end
end
