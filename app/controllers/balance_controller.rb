class BalanceController < ApplicationController


  def new

  end

  def create
    @balance = Balance.new(params[:balance])
    if @balance.save_with_payment
      redirect_to @balance, :notice => "Thank you for adding to your balance!"
    else
      render :new
    end
  end
end