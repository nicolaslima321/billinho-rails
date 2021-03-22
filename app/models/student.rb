class Student < ApplicationRecord
  validates :cpf, presence: true
  validates :genre, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true
end
