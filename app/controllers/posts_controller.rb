class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # raise params.inspect
    @post = Post.new(params.require(:post).permit(:title, :post_text, :user_id))
    if @post.save
      redirect_to posts_path
    end
  end    

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :post_text))
      redirect_to posts_path
    else
      render 'edit'
    end
  end
end


