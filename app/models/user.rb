class User < ActiveRecord::Base
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :votes
  
  def admin?
    self.role == "admin" || self.email == "randquistcp@gmail.com"
  end

  def apply_omniauth(omniauth)
    
    self.email = omniauth['info']['email'] if email.blank?
    self.avatar_url = omniauth['info']['image'] if avatar_url.blank?
                                       
    authentications.build(:provider => omniauth['provider'],
                          :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
