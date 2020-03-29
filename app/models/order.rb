class Order < ApplicationRecord

  enum status: {
      recent: 'recent', processed: 'processed'
  }

  validates :name, :email, :phone, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, allow_blank: true

end
