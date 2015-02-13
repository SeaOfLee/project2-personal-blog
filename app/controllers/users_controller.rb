class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      # because user below does not have a view, not necessary to use instance variable. 
      if @user.save
        redirect_to new_user_path
      else
        render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to posts_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :nickname)
  end

end
