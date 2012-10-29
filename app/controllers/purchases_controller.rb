class PurchasesController < ApplicationController

  def index
    @purchases = current_user.purchases
  end

  def new
    @song = Song.find_by_id(params[:song_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    @purchases = current_user.purchases
    if @purchase.save
      redirect_to root_path, notice: 'Song was successfully purchased.'
    else
      render action: "new"
    end
  end

  def show

  end

end
