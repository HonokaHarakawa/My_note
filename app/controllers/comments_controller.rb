class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to post_path(@post)
    else
      @comments = Comment.all
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
       flash[:success] = "コメントが削除されました"
       redirect_to post_path(@comment.post_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end

