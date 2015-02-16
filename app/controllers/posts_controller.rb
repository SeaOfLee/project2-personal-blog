class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:created_at).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end    

  def show
    @post = Post.where(id: params[:id]).first
    @comments = @post.comments
  end

  def edit
    @post = Post.where(id: params[:id]).first
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.where(id: params[:id]).first
    post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :post_text, :user_id)
  end

end


