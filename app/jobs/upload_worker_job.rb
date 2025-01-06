class UploadWorkerJob < ApplicationJob
  queue_as :uploads

  def perform(post_id, file_path)
    post = Post.find(post_id)
    file_content = File.read(file_path)

    post.update!(file_content: file_content)
    
    File.delete(file_path) if File.exist?(file_path)
  end
end
