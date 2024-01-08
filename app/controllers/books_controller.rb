class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @book_new = Book.new
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book), notice: 'You have updated user successfully.'
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end


