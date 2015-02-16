class CommentsController < ApplicationController
  
  def create
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to post_path(@post)
    else
      render 'shared/_comment_form'
    end
  end

  def destroy
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end