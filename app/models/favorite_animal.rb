class FavoriteAnimal < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :user_id, uniqueness: { scope: :animal_id }
end
