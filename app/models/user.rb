class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collaborations
  has_many :projects
  belongs_to :company

  # acts_as_taggable_on :tags
  acts_as_taggable_on :skills

  # $list_of_tags = ['medecin', 'doctor', 'biologist', 'scientist', 'junior', 'test', 'les tags cest cool', 'cette gem est superbe!', 'travail!']

  mount_uploader :avatar, FileUploader
  include PgSearch::Model

  pg_search_scope :fullname_search,
    against: [:fullname],
    associated_against: {
      projects: [:name]
    },
    using: {
      tsearch: { any_word: true }

            # project user expertise
      # Searching against multiple columns
      # ca peut interessant cette ligne  ignoring: :accents
    }

  validates :fullname, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :function, presence: true
  validates :school, presence: true
end
