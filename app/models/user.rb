class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lists, dependent: :destroy
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 6, message: 'is too short' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
