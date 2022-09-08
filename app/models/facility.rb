class Facility < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :facility_categories, dependent: :destroy
  has_many :categories, through: :facility_categories
  has_many :managements, dependent: :destroy
  has_many :animals, through: :managements
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :name, presence: true

  scope :by_prefecture, ->(prefecture_id) { where(prefecture_id:) }
  # 上記の条件式は { where(prefecture_id: prefecture_id)} の省略形

  scope :by_category, ->(category_id) { joins(:facility_categories).where('facility_categories.category_id = ?', category_id) }
  scope :by_animal, ->(animal_id) { joins(:managements).where('managements.animal_id = ?', animal_id) }
  scope :search_contain, ->(search) { where('name LIKE ? OR description LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%") }
end
