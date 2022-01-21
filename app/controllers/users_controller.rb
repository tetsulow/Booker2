class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user= User.find(params[:id])
    @books= @user.books
    @book= Book.new
  end

  def edit
    @user= current_user
    if @user == current_user
        render :edit
    else
        redirect_to :show
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
     redirect_to user_path(current_user), notice: "You have updated user successfully."
     else
     render :edit
     end
  end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end