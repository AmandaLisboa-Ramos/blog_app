class UploadWorkerJob < ApplicationJob
  queue_as :uploads

  def perform(post_id, file_path)
    post = Post.find(post_id)
    file_content = File.read(file_path)

    # Processa o arquivo TXT (exemplo: cria posts a partir do conteúdo)
    post.update!(file_content: file_content)
    
    # Opcional: Apague o arquivo após o processamento
    File.delete(file_path) if File.exist?(file_path)
  end
end
