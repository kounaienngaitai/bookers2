class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book
  end

  def edit
  end
end
