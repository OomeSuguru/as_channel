class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
    @current_user = current_user
    @post = @current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "作成できました"
      redirect_to @current_user
    else
      render "new"
    end
  end

  def show
  end

  def index
    @posts = current_user.posts
  end

  def destroy
    @current_user = current_user
    @post = @current_user.posts.find_by(params[:post_id])
    @post.destroy
    redirect_to @current_user
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
