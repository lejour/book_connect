class Public::BooksController < ApplicationController

  def index
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  def show
    #isbnコードの一つ目を取得
    @book = RakutenWebService::Books::Book.search(isbn: params[:id]).first
    @post = Post.new
  end
  
  

end
