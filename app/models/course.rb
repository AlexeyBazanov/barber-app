class Course < ApplicationRecord
  has_one_attached :image

  has_many :lessons, inverse_of: :course
  accepts_nested_attributes_for :lessons, reject_if: :all_blank, allow_destroy: true
end
