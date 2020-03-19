class Course < ApplicationRecord
  has_one_attached :image

  has_many :lessons, inverse_of: :course
  accepts_nested_attributes_for :lessons, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :image, attached: true, content_type: [:png, :jpg, :jpeg]

end
