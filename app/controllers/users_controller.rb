class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  include SessionsHelper
  
  def show; end

  def new
    @user = User.new
    user_check
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:primary] = "You've logged in"
      redirect_to user_path(@user)
    elsif User.exists?(name: @user.name)
      flash[:danger] = "Already exists!"
      render 'new'
    else
      flash[:danger] = "Oops! Something went wrong"
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:primary] = "Updated!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Something went wrong!"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(
      params[:id]
    )
    if @user.destroy
      flash[:info] = "We're sad you're leaving :'("
    else
      flash[:danger] = 'Something went wrong! Please try again'
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(
    params[:id]
    )
  end
end
