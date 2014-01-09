class PagesController < ApplicationController

  def show
    page = params[:template]
    if page.include? "book"
      page = "book"
    end
    render page
  end

  def bitcoin
    finished("bitcoin-action")

    redirect_to "https://www.uludum.org/courses/118"
  end
end
