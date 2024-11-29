class MoviesController < ApplicationController
  def index
    @movies = TmdbService.fetch_movies
  end

  def show
    movie_id = params[:id]
    @movie = TmdbService.fetch_movie_details(movie_id)
  end





  def search
    if params[:query].present?
      @movies = TmdbService.search_movies(params[:query])
    else
      @movies = []
    end
  end
end
