class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @books = Book.all
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def create

    #登録されている本を探し、登録されていればそのIDを使用。されてい負ければbook_paramsからデータを取得
    if Book.find_by(isbn: params[:post][:isbn])
      @book = Book.find_by(params[:post][:isbn])
    else
      @book = Book.new(book_params)
      @book.save!
    end

    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.book_id = @book.id
    @post.save!
    redirect_to posts_path
  end


  private

  def book_params
    params.require(:post).permit(:title, :author, :sales_date, :item_caption, :large_image_url, :isbn)
  end

  def post_params
    params.require(:post).permit(:text)
  end

end
