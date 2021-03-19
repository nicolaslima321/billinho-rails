class Invoice < ApplicationRecord
    validates :enrolment_id, presence: true
    validates :expiration_date, presence: true
    validates :invoice_value, presence: true
    validates :status, presence: true
    belongs_to :enrolment
end
