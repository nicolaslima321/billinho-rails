class Student < ApplicationRecord
    validates :birth_date, presence: true
    validates :celphone, presence: true
    validates :cpf, presence: true
    validates :genre, presence: true
    validates :name, presence: true
    validates :payment_method, presence: true
end
