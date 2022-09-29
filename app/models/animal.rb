class Animal < ApplicationRecord
  has_many :managements, dependent: :destroy
  has_many :facilities, through: :managements
  has_many :favorite_animals, dependent: :destroy
  has_many :users, through: :favorite_animals

  validates :name, uniqueness: true, presence: true
end
