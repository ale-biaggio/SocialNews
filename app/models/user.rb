class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  


  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end
  
  def self.create_from_provider_data(provider_data)
      where(provider: provider_data.provider, uid:provider_data.uid).first_or_create do |user|
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = provider_data.info.name
      end
  end

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
  end

end