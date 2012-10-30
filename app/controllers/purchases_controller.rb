class PurchasesController < ApplicationController

  def index
    @purchases = current_user.purchases
    @song = Song.find_by_id(params[:song_id])

  end

  def new
    @song = Song.find_by_id(params[:song_id])
    @purchase = Purchase.new
    @purchase = @song.purchases.find(params[:id])

  end

  def create
    @song = Song.find_by_id(params[:song_id])
    @user = User.find_by_id(params[:user_id])
    @purchase = @song.purchases.find(params[:id])

    @purchase.user = current_user
    if @purchase.save
      redirect_to root_path, notice: 'Song was successfully purchased.'
    else
      render action: "new"
    end
  end

  def show
    @song = Song.find_by_id(params[:song_id])
  end

end
