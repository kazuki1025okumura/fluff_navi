class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :facility

  validates :title, length: { maximum: 30 }
  validates :image, presence: true
end
