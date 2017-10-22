# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

cover_materials = ['Hard cover', 'Spiral cover', 'Saddle stitch', 'Soft cover']
paper_materials = ['glossy paper', 'matte paper']
categories = ['Web Design', 'Photo Web', 'Development', 'Mobile Development']
coupons = %w(QWERTY COUPON DISCOUNT)


Delivery.create(method: 'by_train', days: 'from_3_to_7', price: 5.55 )
Delivery.create(method: 'by_car'  , days: 'from_2_to_5', price: 15.75)
Delivery.create(method: 'teleport', days: 'from_0_to_1', price: 59.99)

rand(3..10).times do
  Author.create(name: [FFaker::Name.first_name, FFaker::Name.last_name].join(' '))
end

categories.each do | name |
  Category.create(name: name)
end

coupons.each do | secret_code |
  Coupon.create(secret_code: secret_code,
                discount: rand(0.01..0.5))
end

rand(100..150).times do
  book = Book.create(title: FFaker::Book.title, price: rand(1..99),
                     description: FFaker::HealthcareIpsum.paragraph(6),
                     year: rand(1999..2017),
                     materials: [cover_materials[rand 0..3], paper_materials[rand 0..1]].join(', '),
                     dimensions: {H: rand(0.1..6.0).round(1), W: rand(0.1..9.0).round(1), D: rand(0.1..3.0).round(1)},
                     quantity: rand(1..49),
                     category: Category.find(rand(1..4)))

  authors = Author.all
  rand(1..3).times do |n|
    author = authors[rand(0..(authors.length-1))]
    book.authors << author
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?