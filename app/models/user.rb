class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  belongs_to :company

  validates :fullname, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :function, presence: true
  validates :school, presence: true
end
