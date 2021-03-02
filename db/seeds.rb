# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Enrolment.create(course_name: 'Análise e Desenvolvimento de Sistemas', institution_id: 1, expiration_day: 15, invoice_quantity: 4, student_id: 1, total_price: 100.00)

Institution.create(cnpj: '102901923', kind: 'Presencial', name: 'Lorem University')

Invoice.create(enrolment_id: 1, expiration_date: '26/03/2022', invoice_value: 25.00, status: 'paid')
Invoice.create(enrolment_id: 2, expiration_date: '26/03/2022', invoice_value: 25.00, status: 'paid')
Invoice.create(enrolment_id: 3, expiration_date: '26/03/2022', invoice_value: 25.00, status: 'paid')
Invoice.create(enrolment_id: 4, expiration_date: '26/03/2022', invoice_value: 25.00, status: 'paid')

Student.create(birth_date: '26/03/1999', celphone: '00999999999', cpf: '00000000000', genre: 'M', name: 'Nicolas', payment_method: 'credit_card')