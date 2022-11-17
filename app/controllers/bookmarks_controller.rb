class BookmarksController < ApplicationController
  before_action :show, only: %i[new edit create destroy]
  before_action :set_movie, only: %i[new create]

  def show
    @bookmark = Bookmark.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
    @bookmark.movie = @movie
  end

  def create
    @movie = Movie.find(params[:restaurant_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:restaurant_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
