class ArtistsController < ApplicationController



  def index
    @search = Artist.search(params[:q])
    @artists = @search.result
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to artists_path, notice: 'Artist was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @song = Song.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    if @artist.destroy
      render :show
    else
      render :root
    end
  end
end
