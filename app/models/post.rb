class Post < ApplicationRecord
  belongs_to :user  # Cada post pertence a um usuário
  
  has_many :comments, dependent: :destroy

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
end
