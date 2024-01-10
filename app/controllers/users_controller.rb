class UsersController < ApplicationController

  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to user_path(@user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end