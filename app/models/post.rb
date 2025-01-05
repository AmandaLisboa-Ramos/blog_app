class Post < ApplicationRecord
  belongs_to :user 
  
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, class_name: 'PostTag'

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
end
