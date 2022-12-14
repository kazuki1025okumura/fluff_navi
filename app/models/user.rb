class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :bookmarks, dependent: :destroy
  has_many :facilities, through: :bookmarks
  has_many :posts, dependent: :destroy
  has_many :facility_posts, through: :posts, source: :facility
  has_many :reports, dependent: :nullify
  has_many :report_facilities, through: :reports, source: :facility
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_one :favorite_animal, dependent: :destroy, inverse_of: :user
  has_one :animal, through: :favorite_animal
  has_one :favorite_category, dependent: :destroy, inverse_of: :user
  has_one :category, through: :favorite_category

  # プロフィール編集で複数モデルのレコードを変更するための設定
  accepts_nested_attributes_for :favorite_animal, reject_if: lambda { |attributes| attributes['animal_id'].blank? }
  accepts_nested_attributes_for :favorite_category, reject_if: lambda { |attributes| attributes['category_id'].blank? }

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  enum role: { general: 0, admin: 1, guest: 2 }

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
