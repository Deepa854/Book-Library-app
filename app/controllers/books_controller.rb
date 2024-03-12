# app/controllers/books_controller.rb

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy]

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully added.'
    else
      @books = Book.all
      render :index
    end
  end

  def show
    # Your show action logic here
    @book = Book.find(params[:id])
  end

  def destroy
    @book.destroy
    respond_to do |format|
    format.html{ redirect_to books_path, notice: 'Book was successfully removed.' }
    format.js 
  end
end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :publication_year)
  end
end
