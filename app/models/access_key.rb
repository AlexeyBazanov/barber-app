class AccessKey < ApplicationRecord

  before_create :generate_body

  belongs_to :course
  belongs_to :user, optional: true

  validates :course, presence: true
  validates :expiration_date, presence: true
  validates :user, presence: true, unless: :new_record?

  protected

  def generate_body
    loop do
      self.body = ( ('A'..'Z').to_a + (1..9).to_a ).sample(12).join
      break unless AccessKey.exists?(body: self.body)
    end
  end
end
