class Facility < ApplicationRecord
  has_many :facility_categories, dependent: :destroy
  has_many :categories, through: :facility_categories
  has_many :managements, dependent: :destroy
  has_many :animals, through: :managements

  validates :name, presence: true
end
