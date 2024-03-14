class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :username, length: { in: 3..20}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :secrets, dependent: :destroy
end
