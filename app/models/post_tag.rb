class PostTag < ApplicationRecord
    has_and_belongs_to_many :posts
    validates :title, presence: true
end