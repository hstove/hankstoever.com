class PagesController < ApplicationController

  def show
    page = params[:template]
    render page
  end
end
