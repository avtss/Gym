class Client < ApplicationRecord
    validates :name, :email, :phone, :membership_type, :membership_start_date, presence: true

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'имеет неверный формат' }

    validates :phone, uniqueness: true, format: { with: /\A[0-9+\-() ]{11}\z/, message: 'имеет неверный формат' }

    validate :membership_dates_valid

    private

    def membership_dates_valid
        if membership_start_date.present? && membership_end_date.present?
          if membership_start_date > membership_end_date
            errors.add(:membership_end_date, 'должна быть позже даты начала')
          end
        end
      end
end
