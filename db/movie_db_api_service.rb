require "json"
require "open-uri"

class MovieDbApiService
  def call
    # Change just the keyword below
    movies_url = "https://tmdb.lewagon.com/movie/top_rated"
    movies_serialized = URI.open(movies_url).read
    movies = JSON.parse(movies_serialized)
    
    all_movies = []
    movies["results"].each do |movie|
      the_movie = { title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}", rating: movie["vote_average"].to_i }
      all_movies << { title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}", rating: movie["vote_average"].to_i }
    end
    
    all_movies
  end

end
