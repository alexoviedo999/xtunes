class PurchasesController < ApplicationController

  def index
    @purchases = current_user.purchases
    @songs = current_user.songs

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
      session[:purchase_amount] = @purchase.price
      redirect_to charges_path, notice: 'Song was successfully purchased.'

    else
      render action: "new"
    end
  end

  def show
    @song = Song.all
  end

end
