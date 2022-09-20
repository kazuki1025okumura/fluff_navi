class Report < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :content

  mount_uploader :image, ReportUploader

  belongs_to :user
  belongs_to :facility

  validates :body, presence: true, length: { minimum: 10, maxmum: 8000 }
  validates :content, presence: true
end
