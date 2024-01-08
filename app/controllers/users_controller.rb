class UsersController < ApplicationController

  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.book
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
