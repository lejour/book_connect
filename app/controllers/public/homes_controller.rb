class Public::HomesController < ApplicationController

  def top
  end

  def about
  end

  def home
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

end
