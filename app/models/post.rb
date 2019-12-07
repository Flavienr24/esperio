class Post < ApplicationRecord
  belongs_to :project
  validates :content, length: { minimum: 5 }
end
