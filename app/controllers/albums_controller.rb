class AlbumsController < ApplicationController
    load_and_authorize_resource

  def index
    @search = Album.search(params[:q])
    @albums = @search.result
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_path, notice: 'Album was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @album = Album.find(params[:id])

  end

  def edit
    @album = Album.find(params[:id])

  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to album_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to album_path
  end
end
