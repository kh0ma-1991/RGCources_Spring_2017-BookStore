# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

rand(3..10).times do |n|
  Author.create(name: [FFaker::Name.first_name, FFaker::Name.last_name].join(' '))
end

rand(25..40).times do |n|
  book = Book.create(title: FFaker::Book.title, price: rand(1..99),
                     description: FFaker::HealthcareIpsum.paragraph(4))

  authors = Author.all
  rand(1..3).times do |n|
    author = authors[rand(0..(authors.length-1))]
    book.authors << author
  end
end