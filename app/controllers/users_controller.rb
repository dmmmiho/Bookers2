class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end 
    
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User info was successfully updated"
      redirect_to user_path(@user.id)
    else 
      render :edit
    end 
  end 
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
end 
