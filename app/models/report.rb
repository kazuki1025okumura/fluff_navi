class Report < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  validates :body, presence: true, length: { minimum: 10, maxmum: 8000 }
end
