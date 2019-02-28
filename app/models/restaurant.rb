class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :reviews
end
