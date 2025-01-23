class Trainer < ApplicationRecord
    validates :first_name, :last_name, :middle_name, :specialization, :email, :phone, presence: true

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'имеет неверный формат' }

    validates :phone, uniqueness: true, format: { with: /\A[0-9+\-() ]{11}\z/, message: 'имеет неверный формат' }
end
