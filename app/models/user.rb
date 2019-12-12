class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts
  has_many :collaborations
  has_many :projects
  belongs_to :company

  # acts_as_taggable_on :tags
  acts_as_taggable_on :skills

  # $list_of_tags = ['medecin', 'doctor', 'biologist', 'scientist', 'junior', 'test', 'les tags cest cool', 'cette gem est superbe!', 'travail!']

# Pour upload photo profil. Plutôt utiliser AWS pour upload phot.
  # mount_uploader :avatar, FileUploader
  include PgSearch::Model

  pg_search_scope :fullname_search,
    against: [:fullname],
    associated_against: {
      projects: [:name]
    },
    using: {
      tsearch: { any_word: true }
    }

  validates :fullname, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :function, presence: true
  validates :school, presence: true

  def self.all_except(user)
    where.not(id: user.id)
  end
end
