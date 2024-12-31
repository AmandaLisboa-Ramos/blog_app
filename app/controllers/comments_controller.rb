class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy] # Garante que o usuário esteja logado

  # Cria um novo comentário
  def create
    @post = Post.find(params[:post_id]) # Encontra o post pelo ID
    @comment = @post.comments.build(comment_params) # Cria um comentário associado ao post

    @comment.user = current_user # Associa o comentário ao usuário logado

    if @comment.save
      redirect_to post_path(@post), notice: "Comentário adicionado com sucesso!"
    else
      render "posts/show"
    end
  end

  # Exclui um comentário
  def destroy
    @comment = Comment.find(params[:id]) # Encontra o comentário pelo ID
    @post = @comment.post

    allowed = @comment.user == current_user || current_user.admin?

    if allowed && @comment.destroy
      redirect_to @post, notice: 'Comentário excluído com sucesso.'
    else
      redirect_to @post, alert: 'Você não tem permissão para excluir este comentário.'
    end
  end

  private

  # Permite apenas parâmetros confiáveis para o comentário
  def comment_params
    params.require(:comment).permit(:content, :is_anonymous)
  end
end
