class Facility < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :facility_categories, dependent: :destroy
  has_many :categories, through: :facility_categories
  has_many :managements, dependent: :destroy
  has_many :animals, through: :managements

  validates :name, presence: true
end
