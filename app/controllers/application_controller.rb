class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    posts_path # Redireciona para a página de posts após o login
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # Redireciona para a página inicial após o logout
  end
end
