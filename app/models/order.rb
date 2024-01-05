class Order < ApplicationRecord
  enum status: {
      recent: 'recent', processed: 'processed'
  }

  validates :contacts, presence: true
end
