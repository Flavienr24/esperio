class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :content, length: { minimum: 5 }
  mount_uploader :file, FileUploader
end
