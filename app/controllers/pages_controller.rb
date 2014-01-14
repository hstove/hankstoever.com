class PagesController < ApplicationController

  def show
    page = params[:template]
    if page.include? "book"
      page = "book"
    end
    render page
  end

  def bitcoin
    finished("ad_background_color")

    redirect_to "https://www.uludum.org/courses/118"
  end
end
