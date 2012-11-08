class UsersController < ApplicationController
  before_filter :is_admin?, only: :index


  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to login_url, :notice => "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #def correct user...

  private
    def is_admin?
      if current_user.try(:role) == "admin"
      else redirect_to root_path
      end
    end
end
