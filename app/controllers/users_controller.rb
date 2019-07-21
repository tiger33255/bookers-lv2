class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def detail
    @users = User.all
    @books = Book.all
    @book = Book.new
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @newbook = Book.new
  end

    def create
      book = Book.new(book_params)
      book.user_id = current_user.id
      book.save
      flash[:success]='You have created book successfully.'
      redirect_to book_path(book.id)
    end

    def home
      @users = User.all
      @books = Book.all
      @book = Book.new
    end

    def new

    end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
    user = User.find(params[:id])
    if user != current_user
    redirect_to user_path(current_user)
    end
  end

end