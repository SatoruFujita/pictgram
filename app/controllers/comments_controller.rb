class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to topics_path, success: 'コメント登録に成功しました'
    else
      flash.now[:danger] = 'コメント登録に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id,:comment_text)
  end
end
