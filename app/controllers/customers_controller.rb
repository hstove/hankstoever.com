class CustomersController < ApplicationController
  def create
    customer = Customer.create(customer_params)
    session[:email] = customer.email
    redirect_to posts_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end
end
