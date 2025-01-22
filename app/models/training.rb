class Training < ApplicationRecord
  belongs_to :trainer
  belongs_to :client

  validates :training_date, :duration_minutes, :training_type, :status, presence: true

  validate :training_date_cannot_be_in_the_past
  
  private

  def training_date_cannot_be_in_the_past
    if training_date.present? && training_date < DateTime.now
      errors.add(:training_date, 'не может быть в прошлом')
    end
  end
end
