class Project < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true
end
