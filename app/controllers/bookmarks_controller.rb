class BookmarksController < ApplicationController

  def show
    @lists = List.all
    @movie_id = params[:movie_id]
  end

  def new
    @bookmark = Bookmark.new
    @movie = TmdbService.fetch_movie_details(params['movie_id'])
    @list = List.find(params['list_id'])
  end

  def create
    @list = List.find(params[:list_id]) # Retrieve the list
    movie_details = TmdbService.fetch_movie_details(params[:bookmark][:movie_id])


    @movie = Movie.find_by(api_movie_id: movie_details['id']) || Movie.new
    if @movie.new_record?
      @movie.title = movie_details['title']
      @movie.overview = movie_details['overview']
      @movie.poster_url = "https://image.tmdb.org/t/p/w500#{movie_details['poster_path']}"
      @movie.rating = movie_details['vote_average']
      @movie.api_movie_id = movie_details['id']
      @movie.save!
    end
    @bookmark = Bookmark.new(bookmark_params.merge(list_id: params[:list_id], movie_id: @movie.id))
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @movie = TmdbService.fetch_movie_details(params[:bookmark][:movie_id]) # Re-fetch movie details
      flash.now[:alert] = "There was an error adding the bookmark."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end
