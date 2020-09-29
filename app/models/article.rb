class Article < ApplicationRecord
  has_one_attached :image

  validates :title, :content, presence: true
  validates :visible, inclusion: [true, false, 0 ,1]

end
