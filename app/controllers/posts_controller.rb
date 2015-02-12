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
  end
end


# u = User.where(email: params[:user][:email]).first