class Order < ApplicationRecord

  enum status: {
      recent: 'recent', processed: 'processed'
  }

  validates :name, :vk_link, :phone, presence: true

end
