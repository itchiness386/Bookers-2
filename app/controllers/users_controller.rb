class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

  def index
    @newbook = Book.new
    @users = User.all
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "You have updated user successfully."
    else
      render 'edit'
    end
  end

  def userinfo
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :postal_code, :prefecture_code, :city, :street)
  end

  def corrent_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

end
