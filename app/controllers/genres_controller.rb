class GenresController < ApplicationController
 def index
    @search = Genre.search(params[:q])
    @genres = @search.result
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to genres_path, notice: 'Genre was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @genre = Genre.find(params[:id])

  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to genre_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genre_path
  end


  def destroy
  end
end
