class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to products_url, notice: "You are now logged in."
      else
        flash.now[:alert] = "Invalid username and/or password, yo."
        render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "You have been logged out."
  end
end
