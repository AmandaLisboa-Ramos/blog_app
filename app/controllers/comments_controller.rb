class CommentsController < ApplicationController
  before_action :authenticate_user! # Garante que o usuário esteja logado

  # Cria um novo comentário
  def create
    @post = Post.find(params[:post_id]) # Encontra o post pelo ID
    @comment = @post.comments.build(comment_params) # Cria um comentário associado ao post

    @comment.user = current_user # Associa o comentário ao usuário logado

    if @comment.save
      redirect_to @post, notice: 'Comentário criado com sucesso!'
    else
      redirect_to @post, alert: 'Erro ao criar o comentário.'
    end
  end

  # Exclui um comentário
  def destroy
    @post = Post.find(params[:post_id]) # Encontra o post
    @comment = @post.comments.find(params[:id]) # Encontra o comentário pelo ID

    if @comment.user == current_user || current_user.admin? # Permite excluir apenas o autor ou um admin
      @comment.destroy
      redirect_to @post, notice: 'Comentário excluído com sucesso.'
    else
      redirect_to @post, alert: 'Você não tem permissão para excluir este comentário.'
    end
  end

  private

  # Permite apenas parâmetros confiáveis para o comentário
  def comment_params
    params.require(:comment).permit(:content)
  end
end
