class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validates :describe, presence: true
  validates :title, presence: true
  validate  :picture_size


  private

  def picture_size
    if picture.size > 2.megabytes
      errors.add :picture, "should be less than 2MB"
    end
  end
end
