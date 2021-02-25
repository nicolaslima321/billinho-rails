class Enrollment < ApplicationRecord
	validates :course_name, presence: true
    validates :institution_id, presence: true
    validates :invoice_quantity, presence: true
    validates :student_id, presence: true
    validates :total_price, presence: true
    validates :expiration_date, presence: true
end
