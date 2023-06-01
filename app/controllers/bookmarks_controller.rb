class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @lists = List.all
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id), notice: "Review created successfully!"
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.find_by(list_id: params[:id])
    if @bookmark
      @movies = @bookmark.list.movies
    else
      # Bookmark not found, handle the error
      redirect_to bookmark_path(params[:id]), notice: "Bookmark not found!"
      return
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id), notice: "Bookmark deleted successfully!"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
