# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Author.destroy_all

george = Author.create!(name: "George RR Martin")
mark = Author.create!(name: "Mark Lawrence")
random = Author.create!(name: "Random Author Name")
winds_of_winter = george.books.create!(title: "Winds of Winter", number_of_pages: 1300, publication_year: 2019)
a_game_of_thrones = george.books.create!(title: "A Game of Thrones", number_of_pages: 1100, publication_year: 1999)
prince_of_thorns = mark.books.create!(title: "Prince of Thorns", number_of_pages: 690, publication_year: 2013)
random.books << prince_of_thorns
