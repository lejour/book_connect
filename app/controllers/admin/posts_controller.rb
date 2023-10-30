class Admin::PostsController < ApplicationController

  def show
    @books = Book.all
    @post = Post.find(params[:id])
  end

  private

  def book_params
    params.require(:post).permit(:title, :author, :sales_date, :item_caption, :large_image_url, :isbn)
  end

  def post_params
    params.require(:post).permit(:text)
  end

end
