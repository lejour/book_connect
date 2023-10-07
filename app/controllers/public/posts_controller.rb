class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = current_customer.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end


  private

  def post_params
      params.require(:post).permit(:customer_id, :text, :book_id)
  end

end
