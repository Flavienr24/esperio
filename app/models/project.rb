class Project < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  # acts_as_taggable_on :project
  # acts_as_taggable_on :skills

  # include PgSearch::Model

  # pg_search_scope :tag_search,
  # against: [:tags],
  #   associated_against: {
  #     tags: [:name]
  #   },
  #   using: {
  #     tsearch: { any_word: true }
  #   }

  validates :name, presence: true
  validates :description, presence: true
end
