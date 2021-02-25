class Invoice < ApplicationRecord
    validates :enrollment_id, presence: true
    validates :expiration_date, presence: true
    validates :invoice_value, presence: true
    validates :status, presence: true
end
