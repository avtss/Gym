class WorkSchedule < ApplicationRecord
  belongs_to :trainer

  validates :day_of_week, :start_time, :end_time, presence: true

  validate :start_time_and_end_time_valid
  
  private

  def start_time_and_end_time_valid
    if start_time.present? && end_time.present?
      if start_time >= end_time
        errors.add(:end_time, 'должно быть позже времени начала')
      end
    end
  end
end
