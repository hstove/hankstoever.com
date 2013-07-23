class CustomersController < ApplicationController
  def create
    customer = Customer.create(customer_params)
    session[:email] = customer.email
    flash[:notice] = "Thanks for joining!"
    if params[:ref] == "book"
      redirect_to page_path(template: 'book')
    else
      CustomerMailer.digest(customer.email).deliver
      redirect_to posts_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end
end
