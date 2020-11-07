class SessionsController < ApplicationController
  include SessionsHelper

  def new
    user_check
  end

  def create
    user = User.find_by(name: params[:sessions][:name])
    if user
      log_in(user)
      flash[:primary] = "Logged in"
      redirect_to user_path(user)
    else
      flash[:danger] = "Something went wrong!"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:primary] = "Logged out!"
    redirect_to root_path
  end
end
