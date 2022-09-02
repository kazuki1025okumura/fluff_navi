class Animal < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
