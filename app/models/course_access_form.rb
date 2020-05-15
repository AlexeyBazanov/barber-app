class CourseAccessForm
  include ActiveModel::Model

  attr_accessor :access_key, :access_key_body, :user_id

  def initialize(attributes = {})
    super(attributes)
    if access_key_body.present?
      self.access_key = AccessKey.where(:body => access_key_body).first
    end
  end

  validates :access_key_body, :user_id, presence: true
  validate :access_key_exist?, if: -> { access_key_body.present? }
  validate :access_key_used?, if: -> { access_key_body.present? }

  def access_key_exist?
    if access_key.nil?
      errors.add(:access_key_body, 'Данный ключ доступа не найден')
    end
  end

  def access_key_used?
    if access_key.present? && access_key.user_id.present?
      errors.add(:access_key_body, 'Данный ключ доступа уже был активирован')
    end
  end

  def activate_course!
    self.access_key.update(user_id: user_id, activate: true)
  end

end