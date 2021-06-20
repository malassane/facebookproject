class User < ApplicationRecord
    before_validation { email.downcase! }
    validates :password, presence: true, length: { minimum: 4 }
    validates :name, presence: true 
    validates :email, presence: true 
    has_secure_password
    has_many :pictures
    has_many :favorite_images
    has_many :favorites_images, through: :favorite_images, source: :picture # les images likés par l'utilisateur

end
