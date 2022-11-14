class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    @like = Like.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    if @post.user.is_active == true || @post.user == current_user
      render "show"
    else
      redirect_to user_path(current_user)
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿されました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:success] = "投稿が編集されました"
       redirect_to post_path(@post)
    else
       render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
        flash[:success] = '投稿を削除しました'
        redirect_to user_path(current_user)

    end
  end

  private
  def post_params
     params.require(:post).permit(:body, :image)
  end

end
