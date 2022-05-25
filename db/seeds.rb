# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative "movie_db_api_service"

# Cleaning all DB model
puts "=============================="
puts "Found #{Movie.count} Movie(s) in DB"
puts "Cleaning Movie database..."
Movie.destroy_all
puts "=============================="

puts "Creating Movies DB with API"
puts "Please wait..."

all_movie_from_service = MovieDbApiService.new.call

all_movie_from_service.each do |movie|
  overview = movie[:overview].length
  movie = Movie.new(
    title: movie[:title],
    overview: movie[:overview].match(/(^.+\.).+\./)[1].to_s,
    poster_url: movie[:poster_url],
    rating: movie[:rating]
  )
  movie.save!
end

# Done
puts "=============================="
puts "Congrats, #{Movie.count} movies was created!"
puts "=============================="
