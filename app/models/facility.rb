class Facility < ApplicationRecord
  has_many :facility_categories, dependent: :destroy
  has_many :categories, through: :facility_categories

  validates :name, presence: true
end
