class PurchasesController < ApplicationController

  def index
    @purchases = current_user.purchases
    @song = Song.find_by_id(params[:song_id])

  end

  def new
    @song = Song.find(params[:song_id])
    @purchase = Purchase.new

  end

  def create
    @song = Song.find(params[:song_id])
    @purchase = current_user.purchases.new(params[:purchases])
    @purchase.song_id = params[:song_id]
    @purchase.price = @song.price.to_f

    if @purchase.save
      redirect_to root_path, notice: 'Song was successfully purchased.'
    else
      render action: "new"
    end
  end

  def show
    @song = Song.all
  end

end
