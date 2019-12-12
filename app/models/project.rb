class Project < ApplicationRecord
  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :collaborations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
