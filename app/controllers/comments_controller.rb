class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメント投稿に成功しました'
    else
      flash.now[:danger] = 'コメント投稿に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(topic_id: params[:topic_id],user_id: current_user.id)
  end
end
