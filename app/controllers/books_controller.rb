class BooksController < ApplicationController
  before_action :set_book, only: :show

  def show
    @book = @book.decorate
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
end
