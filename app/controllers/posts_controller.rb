class PostsController < ApplicationController
  def new
  end
  
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to current_user_url
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:picture, :description)
  end
end
