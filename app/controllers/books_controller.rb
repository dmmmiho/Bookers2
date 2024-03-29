class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@book.user_id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    if  @book.save
     flash[:notice] = "Book was created successfilly"
     redirect_to books_path(@book.id)
    else
     @books = Book.all
     render :index
    end
  end 

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "Book was updated successfully"
      redirect_to book_path(@book)
    else
      render :edit
    end 
  end 
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
end
