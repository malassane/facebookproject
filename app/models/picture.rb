class Picture < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :favorite_images
    has_many :favorited_by, through: :favorite_images, source: :user # liste des utilisateurs ayant aimé cette image

end
