class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @user = @book.user
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end 

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book)
    end 
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
end
