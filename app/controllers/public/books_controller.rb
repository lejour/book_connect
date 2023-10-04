class Public::BooksController < ApplicationController

  def index
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
    @book = RakutenWebService::Books::Book.search(isbn:"9784297114626")
  end

  def show
    @book = RakutenWebService::Books::Book.search(isbn: params[:id]).first

  end

end