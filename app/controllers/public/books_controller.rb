class Public::BooksController < ApplicationController

  def index
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  def show
    @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    @book = Book.find(params[:id])
  end

end
