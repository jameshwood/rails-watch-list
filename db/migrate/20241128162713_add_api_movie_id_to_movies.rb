class AddApiMovieIdToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :api_movie_id, :string
  end
end
