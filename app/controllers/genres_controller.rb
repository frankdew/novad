class GenresController < ApplicationController

  def show
     @genre = Genre.find( params[:id] )
  end

  def index
    @genres = Genre.all.sort_by { |genre| genre.novels.size }.reverse
  end
end
