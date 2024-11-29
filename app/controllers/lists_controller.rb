class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list =List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @list
      flash.now[:alert] = "There was an error adding the list."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end




  # def new
  #   @restaurant = Restaurant.new
  # end

  # def create
  #   @restaurant = Restaurant.create(restaurant_params)
  #   if @restaurant.save
  #     redirect_to restaurant_path(@restaurant), notice: "Restaurant was successfully created."
  #   else
  #     render :new
  #   end
  # end

end
