class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :reviews, dependent: :destroy
  belongs_to :user
end
