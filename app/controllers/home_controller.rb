class HomeController < ApplicationController

  def index
    @books = Book.all.decorate
  end
end
