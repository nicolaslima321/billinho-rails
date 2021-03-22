class Institution < ApplicationRecord
	validates :cnpj, presence: true
	validates :kind, presence: true
	validates :name, presence: true
end
