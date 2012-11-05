class BalanceController < ApplicationController

  def new
    @balance = Balance.new(params[:balance])
    @user = current_user.users
    # @balance = user.total.build
  end

  def create
    @balances = Balance.new(params[:balance])
    if @balance.save_with_payment
      redirect_to @balance, :notice => "Thank you for adding to your balance!"
    else
      render :new
    end
  end
end