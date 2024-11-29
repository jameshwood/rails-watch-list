class MoviesController < ApplicationController
  def index
    @movies = TmdbService.fetch_movies
  end

  def show
    movie_id = params[:id]
    @movie = TmdbService.fetch_movie_details(movie_id)
  end





  # def search
  #   @query = params[]
  # end

end
