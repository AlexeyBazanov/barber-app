class Order < ApplicationRecord

  enum status: {
      recent: 'recent', processed: 'processed'
  }

  validates :name, :contacts, presence: true

end
