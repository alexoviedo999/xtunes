class HomeController < ApplicationController
  skip_load_and_authorize_resource

  def index
    @search = Song.search(params[:q])
    @songs = @search.result

  end

  def about
  end

  def faq
  end
end