class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
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