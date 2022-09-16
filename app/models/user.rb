class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :bookmarks, dependent: :destroy
  has_many :facilities, through: :bookmarks
  has_many :posts, dependent: :destroy
  has_many :facility_posts, through: :posts, source: :facility
  has_many :reports, dependent: :nullify
  has_many :report_facilities, through: :reports, source: :facility

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 10 }

  enum role: { general: 0, admin: 1 }

  def bookmark(facility)
    facilities << facility
  end

  def unbookmark(facility)
    facilities.destroy(facility)
  end

  def bookmark?(facility)
    facilities.include?(facility)
  end
end
