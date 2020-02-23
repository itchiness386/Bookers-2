class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update, :destroy]

  def index
  	@newbook = Book.new
   	@books = Book.all
  end

  def create
  	@newbook = Book.new(book_params)
  	@newbook.user_id = current_user.id
  	if @newbook.save
      redirect_to book_path(@newbook.id)
      flash[:success] = "You have creatad book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @newbook = Book.new
  	@book = Book.find(params[:id])
  	@user = @book.user
    @book_comment = BookComment.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:success] = "You have updated book successfully."
    else
      render 'edit'
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
    redirect_to books_path
  end

  def newbook
    @newbook = Book.new(book_params)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user)
  end

  def corrent_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end

end
