class Category < ApplicationRecord
  has_many :facility_categories, dependent: :destroy
  has_many :facilities, through: :facility_categories
  has_many :favorite_categories, dependent: :destroy
  has_many :users, through: :favorite_categories

  validates :name, uniqueness: true, presence: true
end
