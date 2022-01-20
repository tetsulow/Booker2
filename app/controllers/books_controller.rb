class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(book.id), notice: "You have updated book successfully."
    else
     render :edit
    end
   end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
   end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
