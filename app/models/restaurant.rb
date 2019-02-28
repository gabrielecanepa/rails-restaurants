class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :reviews
  belongs_to :user
end
