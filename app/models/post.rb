class Post < ApplicationRecord
  belongs_to :user  # Cada post pertence a um usuário
  
  has_many :comments, dependent: :destroy

  # Outras validações e lógica aqui
end
