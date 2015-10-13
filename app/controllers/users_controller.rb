class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user].permit(:first_name, :last_name, :image, :birthday))
      redirect_to user_profile_path(:id => @user.id), :notice => "Your profile has been successfully updated!"
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up"
    else
      render "new"
    end
  end



  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :image, :birthday)
  end
end
