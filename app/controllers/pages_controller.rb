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

    redirect_to "https://www.uludum.org/funds/2"
  end
end
