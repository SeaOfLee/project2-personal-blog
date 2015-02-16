class CommentsController < ApplicationController
  
  def create
    @post = Post.where(id: params[:id]).first
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_url
    else
      render 'shared/_comment_form'
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_text)
    end
end