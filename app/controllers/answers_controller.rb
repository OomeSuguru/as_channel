class AnswersController < ApplicationController

  def show
    @post = current_user.posts.find(params[:post_id])
  end

  def new
    @answer = Answer.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.build(answer_params)

    if @answer.save
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
