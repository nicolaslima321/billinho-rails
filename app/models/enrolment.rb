class Enrolment < ApplicationRecord
  validates :course_name, presence: true
  validates :institution_id, presence: true
  validates :invoice_quantity, presence: true
  validates :student_id, presence: true
  validates :total_price, presence: true
  validates :expiration_day, presence: true
  has_many :invoice
  has_many :student
  has_many :institution
end
