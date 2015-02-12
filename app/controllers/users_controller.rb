class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation, :name, :nickname, :is_admin))
      # because user below does not have a view, not necessary to use instance variable. 
      if @user.save
        redirect_to new_session_path
      end
  end

  def show

  end

  def edit
  end
end
