class SongsController < ApplicationController


    def index
      @search = Song.search(params[:q])
      @songs = @search.result

    end

    def admin_user?
      current_user.try(:admin?)
    end

    def new
      @song = Song.new
    end

    def create
      @song = Song.new(params[:song])
        if @song.save
          redirect_to songs_path, notice: 'Song was successfully created.'
        else
          render action: "new"
        end
    end

    def show
    @songs = Song.all
    end


    def edit
      @song = Song.find(params[:id])
    end


    def update
      @song = Song.find(params[:id])
      if @song.update_attributes(params[:song])
        redirect_to songs_path
      else
        render :edit
      end
    end

    def destroy
      @song = Song.find(params[:id])
      if @song.destroy
      redirect_to songs_path
      end
    end

end