class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  belongs_to :company

  # acts_as_taggable_on :tags
  acts_as_taggable_on :skills

  $list_of_tags = ['medecin', 'doctor', 'biologist', 'scientist', 'junior', 'test', 'les tags cest cool', 'cette gem est superbe!', 'travail!']

  include PgSearch::Model

  pg_search_scope :global_search_by_fullname_and_skills,
    against: [:fullname, :skill_list],
    using: {
      tsearch: { any_word: true }
    }

  validates :fullname, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :function, presence: true
  validates :school, presence: true
end
