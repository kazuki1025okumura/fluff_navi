class Category < ApplicationRecord
  has_many :facility_categories, dependent: :destroy
  has_many :facilities, through: :facility_categories

  validates :name, uniqueness: true, presence: true
end
