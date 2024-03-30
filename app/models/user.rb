class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :username, length: { in: 3..20}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :secrets, dependent: :destroy

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user |
  #     user.provider = auth.provider
  #     # user.name = auth.info.name
  #     if auth.provider == 'github'
  #       user.username = auth.info.nickname
  #     elsif auth.provider == 'google_oauth2'
  #       user.username = auth.info.email.split('@').first
  #     end
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      if auth.provider == 'github'
        user.username = auth.info.nickname
      elsif auth.provider == 'google_oauth2'
        user.username = auth.info.email.split('@').first
      end
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      if user.new_record?
        user.save!
        UserMailer.with(user: user).welcome_email.deliver_later
      end
    end
  end

end
