class ChargesController < ApplicationController

  def index
    @purchase_price_in_cents = (session[:purchase_amount] * 100).to_i
    render :new
  end

  def new
  end

  def create
    # Amount in cents
    @purchase_price_in_cents = (session[:purchase_amount] * 100).to_i

    Stripe::Charge.create(
      :amount      => @purchase_price_in_cents,
      :card        => params[:stripeToken],
      :description => "test@test.com",
      :currency    => 'usd'
    )
  redirect_to purchases_url
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
end
end
