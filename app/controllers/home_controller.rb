class HomeController < ApplicationController

  def index
    @search = Song.search(params[:q])
    @songs = @search.result

  end

  def about
  end

  def faq
  end
end