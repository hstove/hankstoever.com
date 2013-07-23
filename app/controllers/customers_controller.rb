class CustomersController < ApplicationController
  before_filter :authenticate, only: [:index]
  def create
    customer = Customer.create(customer_params)
    session[:email] = customer.email
    flash[:notice] = "Thanks for joining!"
    if customer.handbook
      redirect_to page_path(template: 'book')
    else
      redirect_to posts_path
    end
  end

  def index
    @customers = Customer.order("created_at desc")
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :handbook, :subscribed)
  end
end
