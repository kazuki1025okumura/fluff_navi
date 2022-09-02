class FacilityCategory < ApplicationRecord
  belongs_to :facility
  belongs_to :category

  validates :facility_id, uniqueness: { scope: :category_id }
end
