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
    @post = Post.find(params[:id])
    @answers = Answer.where(post_id: @post.id)
  end

  def index
    # if  current_user.posts.present?
      @posts = current_user.posts
      # @post = Post.find(params[:post_id])
    # else
      # render :"値がありません"
    # end
  end

  def destroy
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to @current_user
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
