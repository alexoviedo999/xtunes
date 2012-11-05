class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    Stripe::Charge.create(
      :amount      => @amount,
      :card        => params[:stripeToken],
      :description => "test@test.com",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
end
end
