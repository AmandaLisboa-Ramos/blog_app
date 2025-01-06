class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show] # Protege ações para usuários autenticados
  before_action :set_post, only: %i[show edit update destroy create_comment] # Encontra o post pelo ID
  before_action :authorize_user!, only: %i[edit update destroy] # Restringe edição/exclusão ao autor

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
  end

  def create
    @post = current_user.posts.build(post_params)
  
    respond_to do |format|
      if @post.save
        if params[:post][:file].present?
          @post.file.attach(params[:post][:file])
          Rails.logger.debug "Arquivo Anexado: #{@post.file.attached?}"
        end
        
        format.html { redirect_to @post, notice: "Post criado com sucesso!" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # GET /posts/1 or /posts/1.json
  def show
    @comment =  @post.comments.build # Cria um novo comentário para o post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts/1/comments
  def create_comment
    @comment = @post.comments.build(comment_params) # Cria um novo comentário associado ao post
    @comment.user = current_user # Atribui o usuário logado ao comentário

    if @comment.save
      redirect_to @post, notice: "Comentário publicado com sucesso!"
    else
      redirect_to @post, alert: "Erro ao publicar o comentário."
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  def enqueue_upload(file)
    file_path = Rails.root.join('tmp', file.original_filename)
    File.open(file_path, 'wb') { |f| f.write(file.read) }
    
    UploadWorkerJob.perform_later(self.id, file_path.to_s)
  end

  private

  # Callback para encontrar o post pelo ID
  def set_post
    @post = Post.find(params[:id])
  end

  # Verifica se o usuário atual é o autor do post
  def authorize_user!
    redirect_to posts_path, alert: "Você não tem permissão para isso." unless @post.user == current_user
  end

  # Permite apenas parâmetros confiáveis para o post
  def post_params
    params.require(:post).permit(:title, :content, :file, tag_ids: [])
  end

  # Permite apenas parâmetros confiáveis para o comentário
  def comment_params
    params.require(:comment).permit(:content)
  end
end


# comment_params
# params
