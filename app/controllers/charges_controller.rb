class ChargesController < ApplicationController

  def index
    render :new
  end
  def new
  end

  def create
    # Amount in cents
    @amount = @purchase.price

    Stripe::Charge.create(
      :amount      => (@amount*100),
      :card        => params[:stripeToken],
      :description => "test@test.com",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
end
end
