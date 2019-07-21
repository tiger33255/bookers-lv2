class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update]
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @books = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    flash[:success]='You have created book successfully.'
    redirect_to book_path(book)
    else
      flash[:alert]= 'error prohibited this obj from being saved'
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success]='You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book= Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    book = Book.find(params[:id])
    if book.user != current_user
    redirect_to books_path
    end
  end

end