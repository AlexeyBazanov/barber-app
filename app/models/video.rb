class Video < ApplicationRecord
  has_one_attached :image
  has_many :lessons

  validates :name, presence: true
  validates :description, presence: true
  validates :link, presence: true
  validates :image, attached: true, content_type: [:png, :jpg, :jpeg]
end
