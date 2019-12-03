class Annotation < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :user, presence: true
end
