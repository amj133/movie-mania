# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach("./data/movies.csv", headers: true) do |row|
  director = Director.find_or_create_by(name: row[4])
  movie = Movie.create(
                title: row[1],
                description: row[3],
                director: director)
                puts "Created #{movie.title}"
end
