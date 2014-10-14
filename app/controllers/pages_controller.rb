class PagesController < ApplicationController

  def show
    page = params[:template]
    if page.include? "book"
      main = "self-taught-software-developers-handbook"
      return redirect_to page_path(main) unless page == main
      page = "book"
    end
    render page
  end

  def bitcoin
    finished("ad_background_color")

    redirect_to "https://www.uludum.org/courses/118"
  end
end
