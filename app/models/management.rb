class Management < ApplicationRecord
  belongs_to :facility
  belongs_to :animal

  validates :facility_id, uniqueness: { scope: :animal_id }
end
