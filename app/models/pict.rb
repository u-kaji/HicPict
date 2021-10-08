class Pict < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :user
  has_one_attached :image
  has_many :hics
  has_many :evals, through: :hics
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
end
