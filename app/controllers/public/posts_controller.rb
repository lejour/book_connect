class Public::PostsController < ApplicationController

  def create
    @post = current_customer.posts.new(post_params)
  end


  private

  def post_params
      params.require(:post).permit(:customer_id, :text, :book_id)
  end

end
