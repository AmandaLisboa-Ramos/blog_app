class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy] 

  def create
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.build(comment_params) 

    @comment.user = current_user 

    if @comment.save
      redirect_to post_path(@post), notice: "Comentário adicionado com sucesso!"
    else
      render "posts/show"
    end
  end

 
  def destroy
    @comment = Comment.find(params[:id]) 
    @post = @comment.post

    allowed = @comment.user == current_user || current_user.admin?

    if allowed && @comment.destroy
      redirect_to @post, notice: 'Comentário excluído com sucesso.'
    else
      redirect_to @post, alert: 'Você não tem permissão para excluir este comentário.'
    end
  end

  private

  
  def comment_params
    params.require(:comment).permit(:content, :is_anonymous)
  end
end
