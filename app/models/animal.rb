class Animal < ApplicationRecord
  has_many :managements, dependent: :destroy
  has_many :facilities, through: :managements

  validates :name, uniqueness: true, presence: true
end
