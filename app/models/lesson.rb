class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :video

  validates :course, presence: true
  validates :video, presence: true
  validates :start_at, presence: true
  validates :name, presence: true
end
