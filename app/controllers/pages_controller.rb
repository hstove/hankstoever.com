class PagesController < ApplicationController

  def show
    page = params[:template]
    if page.include? "book"
      page = "book"
    end
    render page
  end
end
